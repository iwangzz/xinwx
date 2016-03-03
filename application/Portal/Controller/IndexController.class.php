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
class IndexController extends HomebaseController
{

    //首页
    public function index()
    {
        $termsinfo = M('terms');
        $list = $termsinfo->where('status=1')->limit(8)->select();
        if (is_array($list) && count($list)) {
            $a = array();
            foreach ($list as $k => $v) {
                $urlobj = json_decode($v['smeta']);
                $a[] = array(
                    'term_id' => $v['term_id'],
                    'img' => $urlobj->thumb
                );
            }
        }
        $this->assign('termsinfo', $a);
        $this->display(":index");
    }

    //列表页
    public function prolist()
    {
        $termid = I('get.id');
        $relationships = M('term_relationships')->where(['term_id' => $termid])->select();
        if ($relationships) {
            $ids = [];
            foreach ($relationships as $k => $v) {
                $ids[] = $v['object_id'];
            }
            $posts_list = M('posts')->where(['id' => ['in', join(',', $ids)]])->select();
            if (is_array($posts_list) && count($posts_list)) {
                $a = array();
                foreach ($posts_list as $k => $v) {
                    $urlobj = json_decode($v['smeta']);
                    $a[] = array(
                        'id' => $v['id'],
                        'img' => $urlobj->thumb
                    );
                }
            }
            $this->assign('listinfo', $a);
            $this->display(":list");
        }

    }

    //文章详情
    public function article()
    {
        $id = I('get.id');
        $articleinfo = M('posts')->where(['id' => $id])->find();
        $this->assign('article', $articleinfo);
        $this->display(":article");
    }
}


