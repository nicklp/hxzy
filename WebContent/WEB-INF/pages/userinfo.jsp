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
<link rel="stylesheet" href="assets/sweetalert/sweetalert.css">
<link rel="stylesheet" href="assets/bootstrap-table/bootstrap-table.css">
<link rel="stylesheet" href="assets/toastr/toastr.css">
<style>
	.line-hegith-30{
		line-height: 30px;
	}
</style>
<title>用户相关资料管理</title>
</head>
<body>
	<div id="wrapper">
		<%@include file="nav_side.jsp"%>
		<div id="page-wrapper">
			<div class="header">
				<h2 class="page-header">
					用户相关资料管理&nbsp;<small>Other Information</small>
				</h2>
				<!-- <ol class="breadcrumb">
				  <li><a href="#">Home</a></li>
				  <li><a href="#">Forms</a></li>
				  <li class="active">Data</li>
				</ol>  -->
			</div>

			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="card-title">
									<div class="title">
									</div>
								</div>
							</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-8">
										<div class="row">
											<div class="col-md-2 line_height_30">
												请选择查询条件
											</div>
											<div class="col-md-1 padding_left_right_0">
												<select id="userState">
													<option value="1">正常</option>
													<option value="2">禁用</option>
													<option value="3">离职</option>
												</select>
											</div>
											<div class="col-md-2">
												<input type="text" id="loginName" name="loginName"  class="form-control" placeholder="姓名" />
											</div>
											<div class="col-md-3">
												<button id="btn_search" class="btn btn-default">查询</button>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										 <div class="table-responsive">
											<table id="user_tab" data-toggle="table" class="table table-bordered table-hover table-striped "
												data-pagination="true"
												data-show-columns="true"
												data-page-size="20"
											>
											</table>
										</div>
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
	<script src="assets/sweetalert/sweetalert.min.js"></script>
	<script src="assets/bootstrap-table/bootstrap-table.js"></script>
	<script src="assets/bootstrap-table/bootstrap-table-zh-CN.js"></script>
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
			fn_initTab();
			$("#btn_search").click(function(){
				refreshTab();
			});
			
			$("#user_tab").on("click","a",function(){
				var data = {};
				if($(this).index() == 0){
					data["state"] = 3;
				}else{
					data["state"] = 2;
				}
				if(data && data != null){
					$.ajax({
	                    type: "POST",  
	                    dataType: "text",  
	                    url: baseUrl + "/updateState.action",  
	                    data: "state="+data["state"] + "&tId="+$(this).attr("data-id") ,  
	                    beforeSend:function(XMLHttpRequest){
	                    },
	                    success: function (data) {
	                 	   refreshTab();//刷新表格
	                 	   if(data){
	                 		 toastr.success("操作成功!");
	                 	   }else{
	                 		 toastr.error("操作失败!");
	                 	   }
	                 	   
	                    },
	                    error:function(XMLHttpRequest,textStatus,errorThrown){
	                 	   refreshTab();//刷新表格
	                 	   toastr.error("发生未知错误");
	                    }
					});
				}
			});
			
		});
		
		function fn_initTab(){
			//先销毁表格  
	        $('#user_tab').bootstrapTable('destroy');
			$('#user_tab').bootstrapTable({
				method: 'get',
				showRefresh:true,
				striped: false,   //是否显示行间隔色
				uniqueId:"tId",
				method:'post',
				url:baseUrl + '/queryUserInfo.action',
				cache:false,
				sidePagination:'server',
				pageNumber:1,
				pagination: true,
				pageSize:20,
				pageList: [5, 10, 15, 20, 25],  //记录数可选列表 
				//contentType: "application/x-www-form-urlencoded",
				contentType: 'application/json',
				dataType:'json',
				//设置为undefined可以获取pageNumber，pageSize，searchText，sortName，sortOrder  
	            //设置为limit可以获取limit, offset, search, sort, order  
				queryParamsType : "",   
	            queryParams: function queryParams(params) {   //设置查询参数  
	              var param = {    
	                  pageNumber: params.pageNumber,    
	                  pageSize: params.pageSize, 
	                  userState:$("#userState").val(),
	                  loginName:$("#loginName").val()
	              };    
	              return param;                   
	            },
	            onLoadSuccess: function(){  //加载成功时执行  
	            	//console.log("加载成功");	
	            },  
	            onLoadError: function(){  //加载失败时执行  
	            	//console.log("加载失败,请刷新页面重试");
	            	window.location.reload();
	            },  
				columns : [
				{
					field : 'loginName',
					title : '姓名',
					align:'center',
				}, {
					field : 'role',
					title : '职位',
					align:'center',
					formatter:function(value,row,index){
						switch(value){
						case 1:
							return "市场专员";
						case 2:
							return "市场助理";
						case 3:
							return "咨询顾问";
						}
						
					}
				}, 
				{
					field : 'tId',
					title : '操作',
					align:'center',
					switchable:false,	/*列表中不显示列*/
					formatter:function(value,row,index){
						var state = $("#user_tab").bootstrapTable("getData")[index].state;
						if(state == 2 || state == 3){
							return "-";
						}
						return "<a href='javascript:void(0);' data-id='"+value+"'>离职</a>&nbsp;&nbsp;<a href='javascript:void(0);' data-id='"+value+"'>禁用</a>";
					}
				}]
			});
		}
		function refreshTab(){
			$("#user_tab").bootstrapTable('refresh',{
				url:baseUrl + '/queryUserInfo.action',
				queryParams: function queryParams(params) {   //设置查询参数  
		              var param = {    
		                  pageNumber: params.pageNumber,    
		                  pageSize: params.pageSize, 
		                  userState:$("#userState").val(),
		                  loginName:$("#loginName").val()
		              };    
		              return param;                   
		            }
				}); 
		}
	</script>
</body>
</html>