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
	<a href="/"><img src="/themes/simplebootx/Public/images/logo.jpg"></a>
</header>
<!--main-warpper-->
<section class="item-warpper">
	<h2 class="detail-title"><?php echo ($article["post_title"]); ?></h2>
	<!--content-->
	<section class="detail-content">
		<?php echo ($article["post_content"]); ?>
	</section>
</section>
</body>
</html>