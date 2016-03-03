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
class EwmController extends HomebaseController {

	public function ewm() {
		$sign = I('get.token');
		// print_r($_REQUEST);exit;
		if(!$sign)
			$this->error('暂无此活动1');
		$info = M('url')->where(['sign' => $sign])->find();
		if(!$info)
			$this->error('暂无此活动2');
		if($info['status'] == '已使用')
			$this->error('该二维码已被使用');
		$data = array(
			'status' => '已使用',
			'use_time' => date('Y-m-d H:i:s', time())
			);
		$result = M('url')->where(['sign' => $sign])->data($data)->save();
		if($result){
			$this->assign('account', $info['account']);
		}
		$this->display(':active');
	}


}