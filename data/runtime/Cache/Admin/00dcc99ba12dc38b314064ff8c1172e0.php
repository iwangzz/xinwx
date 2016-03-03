<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<!-- Set render engine for 360 browser -->
	<meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- HTML5 shim for IE8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <![endif]-->

	<link href="/public/simpleboot/themes/<?php echo C('SP_ADMIN_STYLE');?>/theme.min.css" rel="stylesheet">
    <link href="/public/simpleboot/css/simplebootadmin.css" rel="stylesheet">
    <link href="/public/js/artDialog/skins/default.css" rel="stylesheet" />
    <link href="/public/simpleboot/font-awesome/4.4.0/css/font-awesome.min.css"  rel="stylesheet" type="text/css">
    <style>
		.length_3{width: 180px;}
		form .input-order{margin-bottom: 0px;padding:3px;width:40px;}
		.table-actions{margin-top: 5px; margin-bottom: 5px;padding:0px;}
		.table-list{margin-bottom: 0px;}
	</style>
	<!--[if IE 7]>
	<link rel="stylesheet" href="/public/simpleboot/font-awesome/4.4.0/css/font-awesome-ie7.min.css">
	<![endif]-->
<script type="text/javascript">
//全局变量
var GV = {
    DIMAUB: "/",
    JS_ROOT: "public/js/",
    TOKEN: ""
};
</script>
<!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="/public/js/jquery.js"></script>
    <script src="/public/js/wind.js"></script>
    <script src="/public/simpleboot/bootstrap/js/bootstrap.min.js"></script>
<?php if(APP_DEBUG): ?><style>
		#think_page_trace_open{
			z-index:9999;
		}
	</style><?php endif; ?>
</head>
<body>
	<div class="wrap">
		<ul class="nav nav-tabs">
			<li><a href="<?php echo U('price/price');?>">奖品列表</a></li>
			<li class="active"><a href="<?php echo U('price/add');?>">添加奖品</a></li>
		</ul>
		<form class="form-horizontal js-ajax-form" method="post" action="<?php echo U('Price/add_post');?>">
			<fieldset>
				<div class="control-group">
					<label class="control-label" for="input-user_nicename">名称</label>
					<div class="controls">
						<input type="text" id="input-user_nicename" name="name" value="红包" >
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label" for="input-birthday">单位</label>
					<div class="controls">
						<input class="js-date" type="text" id="input-birthday" name="unit" value="元">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="input-user_url">概率</label>
					<div class="controls">
						<input type="text" id="input-user_url"name="chance" value="10">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="input-user_url">数额</label>
					<div class="controls">
						<input type="text" id="input-user_url" name="account" value="1">
					</div>
				</div>
				<div class="form-actions">
					<button type="submit" class="btn btn-primary js-ajax-submit"><?php echo L('SAVE');?></button>
				</div>
			</fieldset>
		</form>
	</div>
	<script src="/public/js/common.js"></script>
</body>
</html>