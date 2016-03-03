<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head lang="en">
	<title>产品列表页</title>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<meta name="apple-mobile-web-app-status-bar-style" content="black" />
	<meta name="keywords" contect="">
	<meta name="description" contect="">
	<link rel="stylesheet" href="/themes/simplebootx/Public/css/mobile.css" type="text/css">
	<link rel="stylesheet" href="/themes/simplebootx/Public/css/index.css" type="text/css">
	<link rel="stylesheet" href="/themes/simplebootx/Public/css/swiper.min.css" type="text/css">
</head>
<body>
<header>
	<img src="/themes/simplebootx/Public/images/logo.jpg">
</header>
<!--main-warpper-->
<section class="main-warpper">
	<h2 class="detail-title"><?php echo ($article["post_title"]); ?></h2>
	<!--content-->
	<section class="detail-content">
		<?php echo ($article["post_content"]); ?>
	</section>
</section>
<!--     <footer>
            <p>河南新雨瑞饮料有限公司 版权所有</p>
            <p>企业地址：河南省济源市北海庙后</p>
            <p>豫ICP备12017726号</p>
    </footer> -->
<script src="/themes/simplebootx/Public/js/zepto.js"></script>
<script src="/themes/simplebootx/Public/js/zepto.touch.js"></script>
<script src="/themes/simplebootx/Public/js/swiper.min.js"></script>
<script type="text/javascript">
	$(function(){
		var mySwiper2 = new Swiper('#banner',{
			autoplay:3000,
			visibilityFullFit : true,
			loop:true,
			pagination : '.pagination',
		});
	});

</script>
</body>
</html>