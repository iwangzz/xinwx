<?php

/**
 * 后台首页
 */
namespace Admin\Controller;
use Common\Controller\AdminbaseController;
class PriceController extends AdminbaseController {
	protected $price_model,$url_model;
	
	function _initialize() {
		parent::_initialize();
		$this->price_model = M("prize");
		$this->url_model = M("url");
	}
	public function prize() {
		$list = M('prize')->select();
		$this->assign('list', $list);
		$this->display();
	}

	public function add() {
		$this->display();
	}

	public function add_post(){
		if(IS_POST){
			if ($this->price_model->create()) {
				$result=$this->price_model->add();
				if ($result!==false) {
					$this->success("添加成功！", U("price/prize"));
				} else {
					$this->error("添加失败！");
				}
			} else {
				$this->error($this->price_model->getError());
			}
		}
	}
	public function ewm() {
		$count=$this->url_model->count();
		$page = $this->page($count, 50);
		$list = $this->url_model
		->order("account DESC")
		->limit($page->firstRow . ',' . $page->listRows)
		->select();
		$this->assign("page", $page->show('Admin'));
		$this->assign("list",$list);
		$this->display();
	}

	public function add_ewm() {
		$prize_list = $this->price_model->select();
		if($prize_list) {
			// $token_url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=wx815f6bebd7c8da2a&secret=67e884c08b9012c6ce61f024e9561d68';
			// $res = $this->getUrl($token_url);
			// $res = json_decode($res);
			// $access_token = 'cUptV8Me_xiLiztdZIjJYJH4FCo2EmmMkn8PupWpCGM0hgUAb0WdDS7p_5ym_Tpn_8R4Hg3aqCNv9rYuRnqtOTwPQOVaxeVUlMoF5ktlQGjzmR1AIxkXIpcw2ygQwiVoICAgAGADXV';//$res->access_token;
			// $get_url = 'https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token='.$access_token;
			// $info = $this->url_model->order('id desc')->find();
		
			foreach($prize_list as $k => $v) {
			// 	// $last_key = $key;
				if($v['chance'] > 0) {
					for($i=0;$i<$v['chance'];$i++){
						$str = md5(round(10000,9999999).microtime().round(10000.9999999));
						$arr = array(
							'sign' => md5(round(10000,9999999).microtime().round(10000.9999999)),
							'status' => '未使用',
							'add_time' => date('Y-m-d H:i:s', time()),
							'account' => $v['account']
						);
						$result = $this->url_model->add($arr);
						// $key++;
						// $data = array(
						// 	// 'expire_seconds' => '2592000',
						// 	'action_name' => 'QR_LIMIT_STR_SCENE',
						// 	'action_info' => array(
						// 		'scene' => array(
						// 			'scene_str' => $str
						// 			)
						// 		)
						// 	);
						// $url_json = $this->getUrl($get_url, 'post', json_encode($data));
						// print_r($url_json);exit;
					}
				}
			}
			if($result) {
				$this->success('成功', U('price/ewm')); 
			}else{
				$this->error('生成失败');
			}
		}
	}

	public function getUrl($url, $method = '', $data = null) {
		$ch = curl_init ();
		// print_r($ch);
		curl_setopt ( $ch, CURLOPT_URL, $url );
		if($method == 'post')
			curl_setopt ( $ch, CURLOPT_POST, 1 );
		else
			curl_setopt($ch, CURLOPT_HEADER, 0);

		curl_setopt ( $ch, CURLOPT_HEADER, 0 );
		curl_setopt ( $ch, CURLOPT_RETURNTRANSFER, 1 );
		if($method == 'post')
			curl_setopt ( $ch, CURLOPT_POSTFIELDS, $data );
		$return = curl_exec ( $ch );
		curl_close ( $ch );
		return $return;
	}
}