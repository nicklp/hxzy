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
	href="assets/bootstrap-datepicker/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<link
	href="assets/css/custom-styles.css"
	rel="stylesheet">
<link href="assets/Font-Awesome-3.2.0/css/font-awesome.css"
	rel="stylesheet">
<link rel="stylesheet" href="assets/bootstrap-table/bootstrap-table.css">
<title>简历来源</title>
<style>
	.line_height_30{
		line-height: 30px;
	}
	.padding_left_right_0{
		padding-left: 0;
		padding-right: 0;
	}
</style>
</head>
<body>
	<div id="wrapper">
		<%@include file="nav_side.jsp"%>
		<div id="page-wrapper">
			<div class="header">
				<h2 class="page-header">
					简历来源&nbsp;<small>Resume</small>
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
												<div class="col-md-2 line_height_30">
													选择查询日期
												</div>
												<div class="col-md-4 padding_left_right_0">
													<input type="text" id="from_date" name="from_date"  class="form-control" readonly placeholder="起始时间" />
												</div>
												<div class="col-md-1 line_height_30">
													至
												</div>
												<div class="col-md-4 padding_left_right_0">
													<input type="text" id="to_date" name="to_date"  class="form-control" readonly placeholder="结束时间" />
												</div>
											</div>
										</div>
										<div class="col-md-3">
											<button id="btn_search" class="btn btn-default">查询</button>
										</div>
									</div>
								</div><!-- end of panel body -->
								<div class="row">
									<div class="col-sm-8">
			                            <table id="cv_tab" data-toggle="table" class="table table-bordered table-hover table-striped " data-show-columns="true">
										</table>
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
	<script
		src="assets/bootstrap-datepicker/js/bootstrap-datetimepicker.js"></script>
	<script
		src="assets/bootstrap-datepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
	<script src="assets/bootstrap-table/bootstrap-table.js"></script>
	<script src="assets/bootstrap-table/bootstrap-table-zh-CN.js"></script>
	<script>
		//初始化dateTimepicker
		$('#to_date,#from_date').datetimepicker({
			language: 'zh-CN',//显示中文
			format : 'yyyy-mm-dd',//显示格式
			minView : "month",//设置只显示到月份
			initialDate : new Date(),//初始化当前日期
			autoclose : true,//选中自动关闭
			todayBtn : true,//显示今日按钮
			clearBtn:true	
		});
	</script>
	<script>
		$(function() {
			fn_initTab();
			$("#btn_search").on("click", function(){
				refreshTab();//刷新表格
			});
		});
		function fn_initTab(){
			//先销毁表格  
	        $('#cv_tab').bootstrapTable('destroy');
			$('#cv_tab').bootstrapTable({
				method: 'get',
				showRefresh:true,
				striped: true,   //是否显示行间隔色
				method:'post',
				url:baseUrl + '/querytjmsgfrom.action',
				cache:false,
				sidePagination:'server',
				contentType: 'application/json',
				dataType:'json',
				//设置为undefined可以获取pageNumber，pageSize，searchText，sortName，sortOrder  
	            //设置为limit可以获取limit, offset, search, sort, order  
				queryParamsType : "",   
	            queryParams: function queryParams(params) {   //设置查询参数  
	              var param = {    
	                  from_date:$("#from_date").val(),
	                  to_date:$("#to_date").val()
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
					field : 'msgFrom',
					title : '来源网站',
					align:'center',
					width:'10%'
				}, {
					field : 'counts',
					title : '简历数量',
					align:'center',
					width:'10%'
				} ]
			});
		}
		
		function refreshTab(){
			$("#cv_tab").bootstrapTable('refresh',{
				url:baseUrl + '/querytjmsgfrom.action',
				queryParams: function queryParams(params) {   //设置查询参数  
		              var param = {   
		                  from_date:$("#from_date").val(),
		                  to_date:$("#to_date").val()
		              };    
		              return param;                   
		            }
				}); 
		}
	</script>
</body>
</html>