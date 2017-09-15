<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragrma", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta HTTP-EQUIV="pragma" CONTENT="no-cache">

<meta HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">

<meta HTTP-EQUIV="expires" CONTENT="0">
<%@include file="commonLinks.jsp"%>
<!-- <link
	href="assets/css/bootstrap-combined.no-icons.min.css"
	rel="stylesheet"> -->
<link href="assets/css/bootstrap-responsive.min.css" rel="stylesheet">
<link href="assets/Font-Awesome-3.2.0/css/font-awesome.css"
	rel="stylesheet">
<link
	href="assets/bootstrap-datepicker/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<!-- <link href="assets/bootstrap/css/bootstrap.css" rel="stylesheet" /> -->
<link
	href="assets/bootstrapvalidator/bootstrapValidator.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="assets/sweetalert/sweetalert.css">
<style>
#editor {
	max-height: 250px;
	height: 250px;
	background-color: white;
	border-collapse: separate;
	border: 1px solid rgb(204, 204, 204);
	padding: 4px;
	box-sizing: content-box;
	-webkit-box-shadow: rgba(0, 0, 0, 0.0745098) 0px 1px 1px 0px inset;
	box-shadow: rgba(0, 0, 0, 0.0745098) 0px 1px 1px 0px inset;
	border-top-right-radius: 3px;
	border-bottom-right-radius: 3px;
	border-bottom-left-radius: 3px;
	border-top-left-radius: 3px;
	overflow: scroll;
	outline: none;
}

div[data-role="editor-toolbar"] {
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

.dropdown-menu a {
	cursor: pointer;
}
.validate_name_phone{
	width:30px;
	padding-right:2px;
	color:red;
}
</style>
<title>录入新员工</title>
</head>
<body>
	<div id="wrapper">
		<%@include file="nav_side.jsp"%>
		<div id="page-wrapper">
			<div class="header">
				<h2 class="page-header">
					录入新员工 <small>&nbsp;Add User</small>
				</h2>
				<!-- <ol class="breadcrumb">
				  <li><a href="#">Home</a></li>
				  <li><a href="#">Forms</a></li>
				  <li class="active">Data</li>
				</ol>  -->
			</div>

			<div id="page-inner">
				<div class="row">
					<div class="col-xs-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="card-title">
									<div class="title"></div>
								</div>
							</div>
							<div class="panel-body">
								<form class="form-horizontal required-validate" method="post" id="userForm" action="#">
									<div class="form-group">
										<label for="loginName" class="col-sm-2 control-label">登录名</label>
										<div class="col-sm-3">
											<input type="text" class="form-control" id="loginName" wisezone="notEmpty nameregexp remote(${sessionScope.basePath}validateLoginName.action)"
												name="loginName" placeholder="请输入姓名">
										</div>
									</div>
									<div class="form-group">
										<label for="loginName" class="col-sm-2 control-label">姓名</label>
										<div class="col-sm-3">
											<input type="text" class="form-control" id="userName" wisezone="notEmpty"
												name="userName" placeholder="请输入姓名">
										</div>
									</div>
									<div class="form-group">
										<label for="loginPwd" class="col-sm-2 control-label">密码</label>
										<div class="col-sm-3">
											<input type="password" class="form-control" id="loginPwd" wisezone="notEmpty stringLength(6,20)"
												name="loginPwd" placeholder="请输入密码">
										</div>
										<div class="col-sm-1" style="display:none;"><i class="fa icon-exclamation-sign validate_name_phone"></i><label class="control-label">有重复号码</label></div>
									</div>
									<div class="form-group">
										<label for="loginPwd" class="col-sm-2 control-label">确认密码</label>
										<div class="col-sm-3">
											<input type="password" class="form-control" id="confirmloginPwd" name="confirmloginPwd" wisezone="notEmpty stringLength(6,20) identical(loginPwd)"
												 placeholder="请再次输入密码">
										</div>
										<div class="col-sm-1" style="display:none;"><i class="fa icon-exclamation-sign validate_name_phone"></i><label class="control-label">有重复号码</label></div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">角色</label>
										<div class="col-sm-8">
											<div class="radio3 radio-check radio-success radio-inline">
												<input type="radio" id="radio4" name="role" value="1"
													checked="checked"> <label for="radio4">市场专员</label>
											</div>
											<div class="radio3 radio-check radio-success radio-inline">
												<input type="radio" id="radio5" name="role" value="2">
												<label for="radio5">市场助理</label>
											</div>
											<div class="radio3 radio-check radio-success radio-inline">
												<input type="radio" id="radio6" name="role" value="3">
												<label for="radio6">咨询顾问</label>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-10">
											<button type="submit" class="btn btn-success">提交</button>
										</div>
									</div>
								</form>
							</div>
							<!-- end of panel body -->
						</div>
					</div>
				</div>
				</form>
				<footer>
				<p>
					Copyright &copy; 2017.Company <a href="javascript:void(0)">wisezone</a>
					All rights reserved.
				</p>
				</footer>
			</div>
			<!-- /. PAGE INNER  -->
		</div>
		<!-- /. PAGE WRAPPER  -->
	</div>

	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
			<div
				style="background: rgba(255, 255, 255, 0); color: #fff;width:200px;position: relative;left:50%;margin-left:-100px;top:50%;">
				<i class="fa fa-spinner fa-spin fa-4x"></i>
			</div>
			<!-- /.modal-content -->
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	<%@include file="commonScripts.jsp"%>
	<script
		src="assets/bootstrap-wysiwyg-master/external/jquery.hotkeys.js"></script>
	<!-- <script
	src="assets/bootstrap/js/bootstrap.min.js"></script> -->
	<script src="assets/bootstrap-wysiwyg-master/bootstrap-wysiwyg.js"></script>
	<script
		src="assets/bootstrap-datepicker/js/bootstrap-datetimepicker.min.js"></script>
	<script
		src="assets/bootstrap-datepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
	<!-- Custom Js -->
	<!-- <script src="assets/js/custom-scripts.js"></script>  -->
	<script src="assets/sweetalert/sweetalert.min.js"></script>

	<script type="text/javascript" language="javascript" charset="utf-8" src="assets/bootstrapvalidator/bootstrapValidator.js"></script>
	<script type="text/javascript" language="javascript" charset="utf-8" src="assets/bootstrapvalidator/customervalidater.js"></script>
	<script>
		/*将表单序列化成为json*/
		(function($){  
		    $.fn.serializeJson=function(){  
		        var serializeObj={};  
		        $(this.serializeArray()).each(function(){  
		            serializeObj[this.name]=this.value;  
		        });  
		        return serializeObj;  
		    };  
		})(jQuery); 
		
		$(function() {
			validate($('#userForm'));
			
			var validator = $('#userForm').data('bootstrapValidator');
			
			$("#userForm").submit(function(ev){
				 ev.preventDefault();
			});
			
			$(".btn-success").click(function(){
				var flag = validate($("#userForm"));
				if(flag){
					var json_userForm = $("#userForm").serializeJson();
					
					$.ajax({
	                       type: "POST",  
	                       dataType: "json",  
	                       contentType: "application/json; charset=utf-8",
	                       url: baseUrl + "/doaddUser.action",  
	                       data: JSON.stringify(json_userForm) ,
	                       beforeSend:function(XMLHttpRequest){
	                    	   //$('#myModal').modal("show");
	                       },
	                       success: function (data) {
	                    	  // $('#myModal').modal("hide");
	                    	   if(data && data.state == true){
	                    		   swal("添加成功!", "", "success"); 
	                    	   }else{
	                    		   swal("添加失败!", "", "error"); 
	                    	   }
	                    	   
	                    	   $("#userForm").data("bootstrapValidator").resetForm();
	                    	   $("#userForm")[0].reset();
	                       },
	                       error:function(XMLHttpRequest,textStatus,errorThrown){
	                    	   //$('#myModal').modal("hide");
	                       }
					});
				}
			});
			
			$("#userForm").find("input[wisezone]").on("blur",function(){
				var attrName = $(this).prop("name");
				validator  
                .updateStatus(attrName, 'NOT_VALIDATED',null)  
                .validateField(attrName);  
			});
		});
	</script>
</body>
</html>