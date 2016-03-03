<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head lang="en">
    <title>首页</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
    <meta name="keywords" contect="">
    <meta name="description" contect="">
    <link rel="stylesheet" href="/themes/simplebootx/Public/css/mobile.css" type="text/css">
    <link rel="stylesheet" href="/themes/simplebootx/Public/css/index.css" type="text/css">
    <link rel="stylesheet" href="/themes/simplebootx/Public/css/swiper.min.css" type="text/css">
</head>
<body>
<header>
	<a href="/"><img src="/themes/simplebootx/Public/images/logo.jpg"></a>
</header>
<div id="banner" class="swiper-container-horizontal">
    <div class="swiper-wrapper" style="transition-duration: 0ms; transform: translate3d(-1125px, 0px, 0px);">
        <div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="3" style="width: 375px;">
            <a href="" id="activity3"><img src="/themes/simplebootx/Public/images/index_banner4.png" alt="" width="100%"></a>
        </div>
        <div class="swiper-slide" data-swiper-slide-index="0" style="width: 375px;">
            <a href="" id="activity0"><img src="/themes/simplebootx/Public/images/index_banner1.jpg" alt="" width="100%"></a>
        </div>
        <div class="swiper-slide swiper-slide-prev" data-swiper-slide-index="1" style="width: 375px;">
            <a href="" id="activity1"><img src="/themes/simplebootx/Public/images/index_banner0.png" alt="" width="100%"></a>
        </div>
        <div class="swiper-slide swiper-slide-active" data-swiper-slide-index="2" style="width: 375px;">
            <a href="" id="activity2"><img src="/themes/simplebootx/Public/images/index_banner3.jpg" alt="" width="100%"></a>
        </div>
        <div class="swiper-slide swiper-slide-next" data-swiper-slide-index="3" style="width: 375px;">
            <a href="" id="activity3"><img src="/themes/simplebootx/Public/images/index_banner4.png" alt="" width="100%"></a>
        </div>
        <div class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="0" style="width: 375px;">
            <a href="" id="activity0"><img src="/themes/simplebootx/Public/images/index_banner1.jpg" alt="" width="100%"></a>
        </div>
    </div>
    <div class="pagination"><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span><span
            class="swiper-pagination-bullet swiper-pagination-bullet-active"></span><span
            class="swiper-pagination-bullet"></span></div>
</div>
<!--main-warpper-->
<section class="main-warpper">
    <h1>新雨瑞产品列表</h1>
    <ul class="itemlist">
        <?php if(is_array($termsinfo)): foreach($termsinfo as $key=>$vo): ?><li><a href="/index.php/portal/index/prolist/id/<?php echo ($vo["term_id"]); ?>"><img src="/data/upload/<?php echo ($vo["img"]); ?>"></a></li><?php endforeach; endif; ?>
        <li><a href="/index.php/portal/index/article/id/3"><img src="/themes/simplebootx/Public/images/aboutus.png"></a></li>
    </ul>

</section>
<!--<footer>-->
    <!--<p>河南新雨瑞饮料有限公司 版权所有</p>-->
    <!--<p>企业地址：河南省济源市北海庙后</p>-->
<!--</footer>-->
<script src="/themes/simplebootx/Public/js/zepto.js"></script>
<script src="/themes/simplebootx/Public/js/zepto.touch.js"></script>
<script src="/themes/simplebootx/Public/js/swiper.min.js"></script>
<script type="text/javascript">
    $(function () {
        var mySwiper2 = new Swiper('#banner', {
            autoplay: 3000,
            visibilityFullFit: true,
            loop: true,
            pagination: '.pagination',
        });
    });

</script>
</body>
</html>