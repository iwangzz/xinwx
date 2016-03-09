<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2014 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Dean <zxxjjforever@163.com>
// +----------------------------------------------------------------------
namespace Portal\Controller;

use Common\Controller\HomebaseController;

/**
 * 用户签到
 */
class SignController extends HomebaseController
{

    private function checkSignature()
    {
        $signature = $_GET["signature"];
        $timestamp = $_GET["timestamp"];
        $nonce = $_GET["nonce"];
        $token = TOKEN;
        $tmpArr = array($token, $timestamp, $nonce);
        sort($tmpArr);
        $tmpStr = implode($tmpArr);
        $tmpStr = sha1($tmpStr);
        if ($tmpStr == $signature) {
            return true;
        } else {
            return false;
        }
    }

    public function valid()
    {
        $echoStr = $_GET["echostr"];
        if (!$echoStr) {
            $this->responseMsg();
        } else {
            $this->checkSignature();
        }
    }


    //处理回复信息
    public function responseMsg()
    {
        $postStr = $GLOBALS["HTTP_RAW_POST_DATA"];
        if (!empty($postStr)) {
            $postObj = simplexml_load_string($postStr, 'SimpleXMLElement', LIBXML_NOCDATA);
            $RX_TYPE = trim($postObj->MsgType);
            switch ($RX_TYPE)
            {
                case "text":
                    $resultStr = $this->receiveText($postObj);
                    break;
                case "image":
                    $resultStr = $this->receiveImage($postObj);
                    break;
                case "location":
                    $resultStr = $this->receiveLocation($postObj);
                    break;
                case "voice":
                    $resultStr = $this->receiveVoice($postObj);
                    break;
                case "video":
                    $resultStr = $this->receiveVideo($postObj);
                    break;
                case "link":
                    $resultStr = $this->receiveLink($postObj);
                    break;
                case "event":
                    $resultStr = $this->receiveEvent($postObj);
                    break;
                default:
                    $resultStr = "unknow msg type: ".$RX_TYPE;
                    break;
            }
            echo $resultStr;
        }else {
            echo "";
            exit;
        }

    }


    //处理用户消息
    public function transmitText($object, $content)
    {
        $textTpl = " <xml>
		 <ToUserName><![CDATA[%s]]></ToUserName>
		 <FromUserName><![CDATA[%s]]></FromUserName>
		 <CreateTime>%s</CreateTime>
		 <MsgType><![CDATA[%s]]></MsgType>
		 <Content><![CDATA[%s]]></Content>
		 <FuncFlag>0</FuncFlag>
		 </xml>";
        return sprintf($textTpl, $object->FromUserName, $object->ToUserName, time(), $object->MsgType, $content);
    }

    //接收事件
    private function receiveEvent($object)
    {
        $contentStr = "";
        switch ($object->Event) {
            case "subscribe":
                $resultStr = "你关注了我";    //关注后回复内容
                break;
            case "unsubscribe":
                $resultStr = "";
                break;
            case "CLICK":
                $resultStr = $this->receiveClick($object);    //点击事件
                break;
            default:
                $resultStr = "receive a new event: " . $object->Event;
                break;
        }

        return $resultStr;
    }

    //处理click事件
    // mark 菜单需要重新建，，，不然没有key值
    private function receiveClick($object)
    {
        switch ($object->EventKey)   //自定义的菜单
        {
            case "SIGNIN"://目前没有，需要创建
                $resultStr = $this->signIn($object);
                break;
            case "2":
                $resultStr = "你点击了菜单: " . $object->EventKey;
                break;
            case "3":
                $resultStr = "你点击了菜单: " . $object->EventKey;
                break;
            default:
                $resultStr = "你点击了菜单: " . $object->EventKey;
                break;
        }
        return $resultStr;
    }


    //处理签到事件
    public function signIn($obj)
    {
        $code = $_GET["code"];
//        echo "<pre>";
//        print_r($code);
//        echo "<pre>";
//        exit;
        $appid = 'wx367f9110a3d96fcb';
        $secret = 'cf8c1fb968fca2ca87897f1487ef0d0d';
        $openid_url = 'https://api.weixin.qq.com/sns/oauth2/access_token?appid=' . $appid . '&secret=' . $secret . '&code=' . $code . '&grant_type=authorization_code';
        $openinfo = $this->curlData($openid_url);
        $token_info = M('token')->find();
        $access_token = '';
        if (!$token_info || time() > (strtotime($token_info['add_time']) + 7000)) {
            $access_token = $this->get_token();
            $data = array(
                'token' => $access_token,
                'add_time' => date('Y-m-d H:i:s', time())
            );
            if (!$token_info) {
                M('token')->add($data);
            } else {
                M('token')->where(['id' => 1])->data($data)->save();
            }
        } else {
            $access_token = $token_info['token'];
        }

        //根据openid和access_token查询用户信息
        // $access_token = $json_obj['access_token'];
        $openid = $openinfo['openid'];
        $get_user_info_url = 'https://api.weixin.qq.com/cgi-bin/user/info?access_token=' . $access_token . '&openid=' . $openid . '&lang=zh_CN';
        $user_info = $this->curlData($get_user_info_url);
        $user_signinfo = M('user_sign')->where(['user' => $openid])->find();
        if (!$user_signinfo) {
            $data = array(
                'user' => $openid,
                'name' => $user_info['name'],
                'last_time' => getdate(),
                'constant_num' => 0
            );
            $signinfo = M('user_sign')->data($data)->add();
            if ($signinfo) {
                $contentStr = "首次签到成功";
                $resultStr = $this->transmitText($obj, $contentStr);
                return $resultStr;
            } else {
                $contentStr = "服务器忙，稍后再试";
                $resultStr = $this->transmitText($obj, $contentStr);
                return $resultStr;
            }
        } else {
            $time = getdate();
            $last_signtime = $user_signinfo['last_time'];
            if ($time == $last_signtime) {
                $contentStr = "您今天已经签到啦！";
                $resultStr = $this->transmitText($obj, $contentStr);
                return $resultStr;
                //判断两者时间差，貌似不对，坑
            } else if (($time - $last_signtime) == 1) {
                $constant_num = $user_signinfo['constant_num'];
                $constant_num = $constant_num + 1;
                $data = array(
                    'user' => $openid,
                    'name' => $user_info['name'],
                    'last_time' => getdate(),
                    'constant_num' => $constant_num
                );
                $signinfo = M('user_sign')->data($data)->save();
                if ($signinfo) {
                    $contentStr = "签到成功";
                    $resultStr = $this->transmitText($obj, $contentStr);
                    return $resultStr;
                } else {
                    $contentStr = "服务器忙，稍后再试";
                    $resultStr = $this->transmitText($obj, $contentStr);
                    return $resultStr;
                }
            } else {
                $data = array(
                    'user' => $openid,
                    'name' => $user_info['name'],
                    'last_time' => getdate(),
                    'constant_num' => 0
                );
                $signinfo = M('user_sign')->data($data)->save();
                if ($signinfo) {
                    $contentStr = "签到成功";
                    $resultStr = $this->transmitText($obj, $contentStr);
                    return $resultStr;
                } else {
                    $contentStr = "服务器忙，稍后再试";
                    $resultStr = $this->transmitText($obj, $contentStr);
                    return $resultStr;
                }
            }
        }

    }


}