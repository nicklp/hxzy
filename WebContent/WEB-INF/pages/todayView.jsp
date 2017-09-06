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
<link rel="stylesheet" href="assets/sweetalert/sweetalert.css">
<link rel="stylesheet" href="assets/bootstrap-table/bootstrap-table.css">
<link rel="stylesheet" href="assets/toastr/toastr.css">
<style>
	.line_height_30{
		line-height: 30px;
	}
	.padding_left_right_0{
		padding-left: 0;
		padding-right: 0;
	}
</style>
<title>简历一览</title>
</head>
<body>
	<div id="wrapper">
		<%@include file="nav_side.jsp"%>
		<div id="page-wrapper">
			<div class="header">
				<h2 class="page-header">
					简历一览&nbsp;<small>Resume View</small>
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
									<div class="row" style="padding-bottom:20px;">
										<div class="col-md-2">
											<label class="control-label">上门人数：<span>${map.visitCount}</span></label>
										</div>
										<div class="col-md-2">
											<label class="control-label">付费人数：<span>${map.payCount}</span></label>
										</div>
										<div class="col-md-2">
											<label class="control-label">退费人数：<span>${map.leaveCount}</span></label>
										</div>
										<div class="col-md-2">
											<label class="control-label">一次性付清：<span>${map.payOneTime}</span></label>
										</div>
										<div class="col-md-1">
											<label class="control-label">分期：<span>${map.instalmentCount}</span></label>
										</div>
										<div class="col-md-1">
											<label class="control-label">宜信：<span>${map.yxCount}</span></label>
										</div>
										<div class="col-md-1">
											<label class="control-label">信用卡：<span>${map.creditCount}</span></label>
										</div>
									</div>
									<div class="row">
										<div class="col-md-3">
											<div class="row">
												<div class="col-md-offset-1 col-md-4 padding_left_right_0">
													<select class="form-control" id="s_text">
														<option value="1">姓名</option>
														<c:if test="${userInfo.role!=2&&userInfo.role!=3}">
															<option value="2">市场助理</option>
														</c:if>
													</select>
												</div>
												<div class="col-md-6">
													<input type="text" id="searchText" name="searchText"  class="form-control" placeholder="查询条件" />
												</div>
											</div>
											
										</div>
										<div class="col-md-4">
											<div class="row">
												<div class="col-md-2 line_height_30">
													时间段
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
								<!-- fill contents -->
								<div class="panel-body">
									 <div id="toolbar" class="btn-group">
									 	 <c:if test="${userInfo.role!=2&&userInfo.role!=3}">
											 <button id="btn_edit" type="button" class="btn btn-default" >
											 	<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>保存更改
											 </button>
										 </c:if>
										 <!-- <button id="btn_delete" type="button" class="btn btn-default">
										 	<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
										 </button> -->
									 </div>
								 </div>
								 <div class="table-responsive">
									<table id="cv_tab" data-toggle="table" class="table table-bordered table-hover table-striped "
										data-toolbar="#toolbar"
										data-pagination="true"
										data-show-columns="true"
										data-page-size="5"
									>
									</table>
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
		//初始化dateTimepicker
		$('#to_date,#from_date').datetimepicker({
			language: 'zh-CN',//显示中文
			format : 'yyyy-mm-dd',//显示格式
			minView : "month",//设置只显示到月份
			initialDate : new Date(),//初始化当前日期
			autoclose : true,//选中自动关闭
			todayBtn : true,
			clearBtn:true
		//显示今日按钮
		});
	</script>
	<script>
		var submit_data = {};
		var obj = {};
		function fn_initTab(){
			//先销毁表格  
	        $('#cv_tab').bootstrapTable('destroy');
			$('#cv_tab').bootstrapTable({
				method: 'get',
				showRefresh:true,
				striped: false,   //是否显示行间隔色
				uniqueId:"tId",
				method:'post',
				url:'${sessionScope.basePath}queryView.action', 
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
	                  s_text:$("#s_text").val(),
	                  searchText:$("#searchText").val(),
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
				/* {
					field : 'ch',
					title : '全选',
					align:'center',
					checkbox:true
				},  */
				{
					field : 'stuId',
					title : '学号',
					align:'center',
					visible:false,
					switchable:false	/*列表中不显示列*/
				},
				{
					field : 'relId',
					title : '关系主键',
					align:'center',
					visible:false,
					switchable:false	/*列表中不显示列*/
				},
				{
					field : 'invitId',
					title : '市场助理',
					align:'center',
					visible:false,
					switchable:false	/*列表中不显示列*/
				},
				{
					field : 'stuName',
					title : '姓名',
					align:'center',
					width:'5%'
				}, 
				{
					field : 'invitPerson',
					title : '市场助理',
					align:'center',
					width:'5%',
					formatter:function(value,row,index){
						var role = ${userInfo.role};
						if(role == 2){
							return value;
						}else{
							if(value == undefined || value == ''){
								return "<a class='invitPerson'>添加</a>"
							}
							return "<a href='javascript:void(0);' class='invitPerson'>"+value+"</a>";
						}
					}
				}, {
					field : 'createDate',
					title : '录入日期',
					align:'center',
					width:'7%'
				}, {
					field : 'phone',
					title : '电话',
					align:'center',
					width:'5%'
				}, {
					field : 'sex',
					title : '性别',
					align:'center',
					width:'5%'
				}, {
					field : 'school',
					title : '毕业院校',
					align:'center',
					width:'8%'
				}, {
					field : 'education',
					title : '学历',
					align:'center',
					formatter:function(value,row,index){
						switch(value){
						case 1:
							return '高中';
						case 2:
							return '中专';
						case 3:
							return '大专';
						case 4:
							return '本科';
						case 5:
							return '研究生';
						case 6:
							return '未知';
						}
					}
				}, {
					field : 'major',
					title : '所读专业',
					align:'center',
					width:'10%'
				}, {
					field : 'job',
					title : '应聘岗位',
					align:'center',
					width:'10%'
				}, {
					field : 'msgFrom',
					title : '信息来源',
					align:'center'
				}, {
					field : 'tdType',
					title : '投递分类',
					align:'center'
				}, {
					field : 'intention',
					title : '意向度分析',
					align:'center',
					width:'20%'
				}, {
					field : 'askPerson',
					title : '咨询顾问',
					align:'center',
					formatter:function(value,row,index){
						if(value == undefined || value == ''){
							return '未分配';
						}
						return value;
					}
				} ]
			});
		}
			
		$(function() {
			fn_initTab();
			$("#btn_edit").click(function(){
				if(JSON.stringify(submit_data) != "{}"){
					
					var params = submit_data;
					submit_data = {};
					 $.ajax({
	                       type: "POST",  
	                       dataType: "json",  
	                       url: "${sessionScope.basePath}saveData.action",  
	                       contentType: "application/json; charset=utf-8",
	                       data: JSON.stringify(params) ,  
	                       beforeSend:function(XMLHttpRequest){
	                       },
	                       success: function (data) {
	                    	   refreshTab();//刷新表格
	                    	   if(data && data.state){
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
			
			$("#btn_search").on("click", function(){
				refreshTab();//刷新表格
			});
			
			$("#cv_tab").on("click",".invitPerson",function(){
				var _tr = $(this).parent();
				$(this).remove();	
				_tr.append("${invitePerson}");
			});
			
			$("#cv_tab").on("change",".invitePersonList",function(){
				var index = $(this).parents("tr").index();
				var data = $('#cv_tab').bootstrapTable("getData")[index];
				if(submit_data[index] == null){
					obj = {};
					obj['inviteId'] = $(this).val();
					submit_data[index] = obj;
				}else{
					submit_data[index]['inviteId'] = $(this).val();
				}
				submit_data[index]['stuId'] = data["stuId"];
				submit_data[index]['relId'] = data["relId"] == undefined?0:data["relId"];
			});
		});
		
		function refreshTab(){
			$("#cv_tab").bootstrapTable('refresh',{
				url:'${sessionScope.basePath}queryView.action',
				queryParams: function queryParams(params) {   //设置查询参数  
		              var param = {    
		                  pageNumber: params.pageNumber,    
		                  pageSize: params.pageSize, 
		                  s_text:$("#s_text").val(),
		                  searchText:$("#searchText").val(),
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