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
 * 首页
 */
class EwmController extends HomebaseController
{

    public function ewm()
    {
        $APPID = 'wx367f9110a3d96fcb';
        $REDIRECT_URI = 'http://ewm.shweb168.com/index.php/ewm/checkguanzhu';
        $_SESSION['token'] = I('get.token');
        // $scope='snsapi_base';
        $scope = 'snsapi_userinfo';//需要授权
        $url = 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=' . $APPID . '&redirect_uri=' . urlencode($REDIRECT_URI) . '&response_type=code&scope=' . $scope . '&state=' . $state . '#wechat_redirect';
        header("Location:" . $url);
        exit;
    }

    public function checkGuanzhu()
    {
        $appid = "wx367f9110a3d96fcb";
        $secret = "cf8c1fb968fca2ca87897f1487ef0d0d";
        $code = $_GET["code"];
        $get_token_url = 'https://api.weixin.qq.com/sns/oauth2/access_token?appid=' . $appid . '&secret=' . $secret . '&code=' . $code . '&grant_type=authorization_code';
        $json_obj = $this->curlData($get_token_url);
        $token_info = M('token')->find();
        $access_token = '';
        if (!$token_info || time() > (strtotime($token_info['add_time']) + 7000)) {
            $get_token_url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=' . $appid . '&secret=' . $secret;
            //'https://api.weixin.qq.com/sns/oauth2/access_token?appid='.$appid.'&secret='.$secret.'&code='.$code.'&grant_type=authorization_code';
            $obj = $this->curlData($get_token_url);
            $access_token = $obj['access_token'];
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
        $openid = $json_obj['openid'];
        $get_user_info_url = 'https://api.weixin.qq.com/cgi-bin/user/info?access_token=' . $access_token . '&openid=' . $openid . '&lang=zh_CN';
        $user_obj = $this->curlData($get_user_info_url);
        $_SESSION['user'] = $user_obj;
        if ($user_obj['subscribe'] == 1) {
            $sign = $_SESSION['token'];
            // print_r($_REQUEST);exit;
            if (!$sign) {
                $this->display(':noactive');
                return;
            }
            $info = M('url')->where(['sign' => $sign])->find();
            if (!$info) {
                $this->display(':noactive');
                return;
            }
            if ($info['status'] == '已使用') {
                $account = '该二维码已被使用';
                $this->assign('account', $account);
                $this->display(':active');
                return;
            }
            $toOpenId = $openid; //接收红包的用户的微信OpenId
            $hb = new \WXHongBao();

            $hb->newhb($toOpenId,100); //新建一个10元的红包，第二参数单位是 分，注意取值范围 1-200元
            //以下若干项可选操作，不指定则使用class脚本顶部的预设值
              // $hb->setNickName("土豪有限公司");
              $hb->setSendName("新雨瑞饮品");
              $hb->setWishing("恭喜发财");
              $hb->setActName("发钱活动");
              $hb->setRemark("任性一把");

            //发送红包

            if(!$hb->send()){ //发送错误
                echo $hb->err();

            }
            $data = array(
                'status' => '已使用',
                'use_time' => date('Y-m-d H:i:s', time())
            );
            $result = M('url')->where(['sign' => $sign])->data($data)->save();
            if ($result) {
                $this->assign('account', $info['account']);
            }
            $this->display(':active');
        } else {
            header('Location:http://mp.weixin.qq.com/s?__biz=MzIwMDIxMjIwNg==&mid=403752461&idx=1&sn=a64c3707aca18aa80823881dd4141036#rd');
        }
    }
}