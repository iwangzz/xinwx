<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head lang="en">
    <title>抽奖活动页</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta name="keywords" contect="">
    <meta name="description" contect="">
    <link rel="stylesheet" href="/themes/simplebootx/Public/css/mobile.css" type="text/css">
    <link rel="stylesheet" href="/themes/simplebootx/Public/css/index.css" type="text/css">
</head>
<body>
    <section class="act-main">
            <!--mask-->      
            <div class="mask"></div>
            <div class="mask-main">
                <h2 class="red">恭喜您中的<span><?php echo ($account); ?></span>元</h2>
                <h3 class="tip">已存至账户</h3>
            </div>
    </section>
    <script src="/themes/simplebootx/Public/js/zepto.js"></script>
    <script src="/themes/simplebootx/Public/js/zepto.touch.js"></script>
    <script src="/themes/simplebootx/Public/js/swiper.min.js"></script>
    <script type="text/javascript">

    </script>
</body>
</html>