<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link
	href="assets/css/custom-styles.css"
	rel="stylesheet">
<link href="assets/Font-Awesome-3.2.0/css/font-awesome.css"
	rel="stylesheet">
<link rel="stylesheet" href="assets/toastr/toastr.css">
<style>
	.line-hegith-30{
		line-height: 30px;
	}
</style>
<title>简历相关信息管理</title>
</head>
<body>
	<div id="wrapper">
		<%@include file="nav_side.jsp"%>
		<div id="page-wrapper">
			<div class="header">
				<h2 class="page-header">
					简历相关信息管理&nbsp;<small>Other Information</small>
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
									<div class="title">
									</div>
								</div>
							</div>
							<div class="panel-body">
								<div class="panel-body">
									<div class="row">
										<div class="col-md-8">
											<div class="row">
												<div class="col-md-3 line_height_30">
													请选择你想要修改的信息
												</div>
												<div class="col-md-4 padding_left_right_0">
													<select id="tType">
														<option value="1" selected="selected">毕业院校</option>
														<option value="2">简历来源</option>
														<option value="3">投递分类</option>
													</select>
												</div>
											</div>
										</div>
										
									</div>
								</div><!-- end of panel body -->
								<div class="row">
									<div class="col-sm-4 data_wrap">
										<table class="table table-hover">
											<thead>
												<tr>
													<th>名称</th>
													<th>操作</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="i" items="${list}">
													<tr>
														<td>${i.tName}</td>
														<td><a href="javascript:void(0);"><input type="hidden" value="${i.tId}"/>删除</a></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
			                        </div>
								</div>
								<div class="row">
									<div class="col-sm-2 line-hegith-30">请输入添加名称</div>
									<div class="col-sm-2">
										<input type="text" class="form-control" id="info" />
									</div>
									<div class="col-md-3">
										<button id="btn_submit" class="btn btn-default">提交</button>
									</div>
								</div>
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

	<%@include file="commonScripts.jsp"%>
	<script type="text/javascript" language="javascript" charset="utf-8" src="assets/toastr/toastr.js"></script>
	<script>
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
		$(function() {
			$("#tType").change(function(){
				loadData();
			});
			
			$(".data_wrap table tbody").on("click","a",function(){
				$.ajax({
                    type: "POST",  
                    dataType: "json",  
                    url: "${sessionScope.basePath}deleteinfobyid.action",  
                    data: "tId=" + $(this).find("input").val() ,
                    success: function (data) {
                 	 	if(data){
                 	 		toastr.success("操作成功!");
                 	 		loadData();
                 	 	}else{
                 	 		toastr.error("操作失败!");
                 	 	}
                    },
                    error:function(XMLHttpRequest,textStatus,errorThrown){
                 	 
                    }
				});
			});
			
			$("#btn_submit").click(function(){
				fn_insert();
			});
			
			$("#info").keypress(function(event){
				var keynum = (event.keyCode ? event.keyCode : event.which);
				if(keynum == 13){
					fn_insert();
				}
			});
		});
		
		function loadData(){
			$.ajax({
                type: "POST",  
                dataType: "json",  
                url: "${sessionScope.basePath}querycvothers.action",  
                data: "tType=" + $("#tType").val() ,
                success: function (data) {
             	  $(".data_wrap table tbody").empty();
             	  for(var item in data){
             		 $(".data_wrap table tbody").append("<tr><td>" + data[item].tName + "</td><td><a href='javascript:void(0);'><input type='hidden' value='" + data[item].tId + "'/>删除</a></td></tr>");
             	  }
                },
                error:function(XMLHttpRequest,textStatus,errorThrown){
             	 
                }
			});
		}
		function fn_insert(){
			if($("#info").val() == ""){
				toastr.error("请输入名称!");
				$(this).focus();
				return;
			}else{
				$.ajax({
	                type: "POST",  
	                dataType: "json",  
	                url: "${sessionScope.basePath}addcvOthers.action",  
	                data: "tName=" + $("#info").val() + "&tType=" + $("#tType").val() ,
	                success: function (data) {
	             	 	if(data){
	             	 		toastr.success("操作成功!");
	             	 		loadData();
	             	 		$("#info").val("");
	             	 	}else{
	             	 		toastr.error("操作失败!");
	             	 	}
	                },
	                error:function(XMLHttpRequest,textStatus,errorThrown){
	             	 
	                }
				});
			}
		}
	</script>
</body>
</html>