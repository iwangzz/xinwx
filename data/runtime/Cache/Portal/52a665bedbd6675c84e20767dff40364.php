<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head lang="en">
    <title>产品列表页</title>
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
<!--main-warpper-->
<section class="main-warpper">
    <h1>维生素饮料系列</h1>
    <ul class="itemlist">
        <?php if(is_array($listinfo)): foreach($listinfo as $key=>$vo): ?><li><a href="/index.php/portal/index/article/id/<?php echo ($vo["id"]); ?>"><img src="/data/upload/<?php echo ($vo["img"]); ?>"></a></li><?php endforeach; endif; ?>
    </ul>

</section>
</body>
</html>