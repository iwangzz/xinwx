<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head lang="en">
    <title>抽奖活动页</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
    <meta name="keywords" contect="">
    <meta name="description" contect="">
    <link rel="stylesheet" href="/themes/simplebootx/Public/css/csshake.min.css">
    <link rel="stylesheet" href="/themes/simplebootx/Public/css/mobile.css" type="text/css">
    <link rel="stylesheet" href="/themes/simplebootx/Public/css/index.css" type="text/css">
</head>
<body>
<section class="act-main">
    <!--mask-->
    <div class="mask"></div>
    <?php if($account != '该二维码已被使用'): ?><div class="red shake-chunk "><!-- shake-chunk -->
            <span style="background-image: url(/themes/simplebootx/Public/images/red-w.png);"></span>
            <button class="redbutton" type="领取红包">拆红包</button>
            <div class="red-jg">
                <h1>恭喜您</h1>
                <h5>成功中的<span><?php echo ($account); ?></span>元</h5>
                <h5>请进入公众号领取</h5>
            </div>
        </div>
        <?php else: ?>
        <!--error-->
        <div class="error-msg">
            <h1>好可惜哦！</h1>
            <h1>该二维码已使用啦</h1>
        </div><?php endif; ?>
</section>
<script src="/themes/simplebootx/Public/js/zepto.js"></script>
<script src="/themes/simplebootx/Public/js/zepto.touch.js"></script>
<script src="/themes/simplebootx/Public/js/swiper.min.js"></script>
<script type="text/javascript">
    setTimeout(function () {
        // 在带有red样式的div中删除shake-chunk样式
        $('.red').removeClass('shake-chunk');
        // 将redbutton按钮隐藏
        $('.redbutton').css("display", "none");
        // 修改red 下 span   背景图
        $('.red > span').css("background-image", "url(/themes/simplebootx/Public/images/red-y.png)");
        // 修改red-jg的css显示方式为块
        $('.red-jg').css("display", "block");
    }, 2000);
</script>
</body>
</html>