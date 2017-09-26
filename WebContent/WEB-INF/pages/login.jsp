<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	
	<!-- start: Meta -->
	<meta charset="utf-8">
	<title>华信智原科技有限公司</title>
	<meta name="description" content="">
	<meta name="author" content="">
	<meta name="keyword" content="">
	<!-- end: Meta -->
	
	<!-- start: Mobile Specific -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- end: Mobile Specific -->
	
	<!-- start: CSS -->
	<link id="bootstrap-style" href="assets/login/css/bootstrap.min.css" rel="stylesheet">
	<link href="assets/login/css/bootstrap-responsive.min.css" rel="stylesheet">
	<link id="base-style" href="assets/login/css/style.css" rel="stylesheet">
	<link id="base-style-responsive" href="assets/login/css/style-responsive.css" rel="stylesheet">
	<link rel="shortcut icon" href="assets/login/img/favicon.ico">
	<link
	href="assets/bootstrapvalidator/bootstrapValidator.min.css"
	rel="stylesheet">
	<link rel="stylesheet" href="assets/toastr/toastr.css">
	<!-- end: CSS -->
	

	<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	  	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<link id="ie-style" href="assets/login/ie.css" rel="stylesheet">
	<![endif]-->
	
	<!--[if IE 9]>
		<link id="ie9style" href="assets/login/ie9.css" rel="stylesheet">
	<![endif]-->
		
	<!-- start: Favicon -->
	
	<!-- end: Favicon -->
	
	<style type="text/css">
			body { background: url(assets/login/img/bg-login.jpg) !important; }
	</style>
		
		
		
</head>

<body>
		<div class="container-fluid-full">
		<div class="row-fluid">
					
			<div class="row-fluid">
				<div class="login-box">
					<div class="icons">
						<a href="index.html"><i class="halflings-icon home"></i></a>
						<a href="#"><i class="halflings-icon cog"></i></a>
					</div>
					<h2>Login to your account</h2>
					<form class="form-horizontal" id="loginForm" method="post">
						<fieldset>
							<div class="input-prepend" >
								<span class="add-on"><i class="halflings-icon user"></i></span>
								<input class="input-large span10" name="loginName" id="loginName" type="text" placeholder="用户名"/>
							</div>
							<div class="clearfix"></div>

							<div class="input-prepend" >
								<span class="add-on"><i class="halflings-icon lock"></i></span>
								<input class="input-large span10" name="loginPwd" id="loginPwd" type="password" placeholder="密码"/>
							</div>
							<div class="clearfix"></div>
							
							<label class="remember" for="remember"><input type="checkbox" id="remember" />记住我</label>

							<div class="button-login">	
								<button type="submit" class="btn btn-primary">登录</button>
							</div>
							<div class="clearfix"></div>
						</fieldset>
					</form>
					<hr>
					<!-- <h3><a href="#">找回密码</a> </h3> -->
					<p>
					
					</p>	
				</div><!--/span-->
			</div><!--/row-->
			

	</div><!--/.fluid-container-->
	
		</div><!--/fluid-row-->
	    <div class="common-modal modal fade" id="common-Modal1" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-content">
				<ul class="list-inline item-details">
					<li><a href="#">Admin templates</a></li>
					<li><a href="http://themescloud.org">Bootstrap themes</a></li>
				</ul>
			</div>
		</div>
	<!-- start: JavaScript-->

		<script src="assets/login/js/jquery-1.9.1.min.js"></script>
	<script src="assets/login/js/jquery-migrate-1.0.0.min.js"></script>
	
		<script src="assets/login/js/jquery-ui-1.10.0.custom.min.js"></script>
	
		<script src="assets/login/js/jquery.ui.touch-punch.js"></script>
	
		<script src="assets/login/js/modernizr.js"></script>
	
		<script src="assets/login/js/bootstrap.min.js"></script>
	
		<script src="assets/login/js/jquery.cookie.js"></script>
	
		<script src='assets/login/js/fullcalendar.min.js'></script>
	
		<script src='assets/login/js/jquery.dataTables.min.js'></script>

		<script src="assets/login/js/excanvas.js"></script>
	<script src="assets/login/js/jquery.flot.js"></script>
	<script src="assets/login/js/jquery.flot.pie.js"></script>
	<script src="assets/login/js/jquery.flot.stack.js"></script>
	<script src="assets/login/js/jquery.flot.resize.min.js"></script>
	
		<script src="assets/login/js/jquery.chosen.min.js"></script>
	
		<script src="assets/login/js/jquery.uniform.min.js"></script>
		
		<script src="assets/login/js/jquery.cleditor.min.js"></script>
	
		<script src="assets/login/js/jquery.noty.js"></script>
	
		<script src="assets/login/js/jquery.elfinder.min.js"></script>
	
		<script src="assets/login/js/jquery.raty.min.js"></script>
	
		<script src="assets/login/js/jquery.iphone.toggle.js"></script>
	
		<script src="assets/login/js/jquery.uploadify-3.1.min.js"></script>
	
		<script src="assets/login/js/jquery.gritter.min.js"></script>
	
		<script src="assets/login/js/jquery.imagesloaded.js"></script>
	
		<script src="assets/login/js/jquery.masonry.min.js"></script>
	
		<script src="assets/login/js/jquery.knob.modified.js"></script>
	
		<script src="assets/login/js/jquery.sparkline.min.js"></script>
	
		<script src="assets/login/js/counter.js"></script>
	
		<script src="assets/login/js/retina.js"></script>

		<script src="assets/login/js/custom.js"></script>
		<script src="assets/hxzy/js/commons.js"></script>
		<script type="text/javascript" language="javascript" charset="utf-8" src="assets/bootstrapvalidator/bootstrapValidator.js"></script>
		<script type="text/javascript" language="javascript" charset="utf-8" src="assets/toastr/toastr.js"></script>
		<script>
			$(function(){
				toastr.options = {
						  "closeButton": true,
						  "debug": false,
						  "positionClass": "toast-bottom-right",
						  "onclick": null,
						  "showDuration": "300",
						  "hideDuration": "1000",
						  "timeOut": "5000",
						  "extendedTimeOut": "1000",
						  "showEasing": "swing",
						  "hideEasing": "linear",
						  "showMethod": "fadeIn",
						  "hideMethod": "fadeOut"
						}
				
				$("#loginForm").submit(function(){
					if($("#loginName").val() == '' || $("#loginPwd").val() == ''){
						return false;
					}
					var data_str = $("#loginForm").serialize();
					$.ajax({
	                       type: "POST",  
	                       dataType: "json",  
	                       url: baseUrl + "/dologin.action",  
	                       data: data_str ,
	                       success: function (data) {
	                    	   if(data.state == -1){
	                    		   toastr.error("用户名或密码错误!");
	                    	   }else{
	                    		   if (data.state == 1) {
		                    		   window.location.href= baseUrl + "/index.action";
								   }else if (data.state == 2) {
									   toastr.error("该用户已禁止登陆，请与管理员联系!");
								   }else if (data.state == 3) {
									   toastr.error("该用户已办理离职!");
								   }
	                    	   }
	                    	   
	                    	   $("#loginForm")[0].reset();
	                       },
	                       error:function(XMLHttpRequest,textStatus,errorThrown){
	                    	 
	                       }
					});
					return false;
				});
			});
		</script>
	<!-- end: JavaScript-->
	
</body>
</html>
