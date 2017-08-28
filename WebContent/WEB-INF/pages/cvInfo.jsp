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
<title>简历信息</title>
</head>
<body>
	<div id="wrapper">
		<%@include file="nav_side.jsp"%>
		<div id="page-wrapper">
			<div class="header">
				<h2 class="page-header">
					简历信息&nbsp;<small>Resume information</small>
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
								<div class="panel-body">
									<div class="row">
										<div class="col-md-3">
											<div class="row">
												<div class="col-md-offset-1 col-md-4 padding_left_right_0">
													<select class="form-control" id="s_text">
														<option value="1">姓名</option>
														<option value="2">电话</option>
														<option value="3">咨询员</option>
													</select>
												</div>
												<div class="col-md-6">
													<input type="text" id="searchText" name="searchText"  class="form-control" placeholder="查询条件" />
												</div>
											</div>
											
										</div>
										<div class="col-md-2">
											<div class="row">
												<div class="col-md-4 line_height_30"><label class="control-label" for="pay_type">缴费类型</label></div>
												<div class="col-md-7" style="padding-left:0;">
													<select class="form-control" id="pay_type">
														<option value="1">所有</option>
														<option value="2">缴费</option>
														<option value="3">预付费</option>
														<option value="4">退费</option>
														<option value="5">一次性付清</option>
														<option value="6">分期</option>
														<option value="7">宜信</option>
														<option value="8">信用卡</option>
													</select>
												</div>
											</div>
										</div>
										<div class="col-md-4">
											<div class="row">
												<div class="col-md-3">
													<select class="form-control" id="s_date">
														<option value="1">录入日期</option>
														<option value="2">上门日期</option>
														<option value="3">预报日期</option>
														<option value="4">缴费日期</option>
													</select>
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
										 <button id="btn_edit" type="button" class="btn btn-default" >
										 	<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>保存更改
										 </button>
										 <button id="btn_delete" type="button" class="btn btn-default">
										 	<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
										 </button>
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

	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div
			style="background: rgba(255, 255, 255, 0); color: #fff; width: 200px; position: relative; left: 50%; margin-left: -100px; top: 50%;">
			<i class="fa fa-spinner fa-spin fa-4x"></i>
		</div>
		<!-- /.modal-content -->
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
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
				url:'${sessionScope.basePath}queryCVInfo.action',
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
	                  pay_type:$("#pay_type").val(),
	                  s_date:$("#s_date").val(),
	                  from_date:$("#from_date").val(),
	                  to_date:$("#to_date").val()
	              };    
	              return param;                   
	            },
	            onLoadSuccess: function(){  //加载成功时执行  
	            	console.log("加载成功");	
	            },  
	            onLoadError: function(){  //加载失败时执行  
	            	console.log("加载失败,请刷新页面重试");
	            	window.location.reload();
	            },  
				columns : [
				{
					field : 'ch',
					title : '全选',
					align:'center',
					checkbox:true
				}, 
				{
					field : 'tId',
					title : '操作',
					align:'center',
					visible:false,
					switchable:false	/*列表中不显示列*/
				},
				{
					field : 'relId',
					title : '关系',
					align:'center',
					visible:false,
					switchable:false	/*列表中不显示列*/
				},
				{
					field : 'userId',
					title : '关系',
					align:'center',
					visible:false,
					switchable:false	/*列表中不显示列*/
				},
				{
					field : 'stuName',
					title : '姓名',
					align:'center',
					width:'5%'
				}, {
					field : 'userName',
					title : '咨询顾问',
					align:'center',
					width:'5%',
					formatter:function(value,row,index){
						if(value == undefined || value == ''){
							//return "<select class='askTeacher'><option value='1'>张三</option><option value='2'>李四</option><option value='3'>吊炸天</option></select>";
							return "<a class='userName'>添加</a>"
						}
						return "<a href='javascript:void(0);' class='userName'>"+value+"</a>";
					}
				}, {
					field : 'createDate',
					title : '录入日期',
					align:'center',
					width:'7%',
					formatter:function(value,row,index){
						if(value == undefined || value == ''){
							return "<a class='dataDate' href='javascript:void(0);' data-row-index='"+index+"' relId='"+row.relId+"' data-row-col='createDate'>添加</a>"
						}else{
							return "<a class='dataDate' href='javascript:void(0);' data-row-index='"+index+"' relId='"+row.relId+"' data-row-col='createDate'>"+value+"</a>"
						}
					}
				}, {
					field : 'visitDate',
					title : '上门日期',
					align:'center',
					width:'7%',
					formatter:function(value,row,index){
						if(value == undefined || value == ''){
							return "<a class='dataDate' href='javascript:void(0);' data-row-index='"+index+"' relId='"+row.relId+"' data-row-col='visitDate'>添加</a>"
						}else{
							return "<a class='dataDate' href='javascript:void(0);' data-row-index='"+index+"' relId='"+row.relId+"' data-row-col='visitDate'>"+value+"</a>"
						}
					}
				}, {
					field : 'prePayDate',
					title : '预付费日期',
					align:'center',
					width:'7%',
					formatter:function(value,row,index){
						if(value == undefined || value == ''){
							return "<a class='dataDate' href='javascript:void(0);' data-row-index='"+index+"' relId='"+row.relId+"' data-row-col='prePayDate'>添加</a>"
						}else{
							return "<a class='dataDate' href='javascript:void(0);' data-row-index='"+index+"' relId='"+row.relId+"' data-row-col='prePayDate'>"+value+"</a>"
						}
					}
				}, {
					field : 'payDate',
					title : '缴费日期',
					align:'center',
					width:'7%',
					formatter:function(value,row,index){
						if(value == undefined || value == ''){
							return "<a class='dataDate' href='javascript:void(0);' data-row-index='"+index+"' relId='"+row.relId+"' data-row-col='payDate'>添加</a>"
						}else{
							return "<a class='dataDate' href='javascript:void(0);' data-row-index='"+index+"' relId='"+row.relId+"' data-row-col='payDate'>"+value+"</a>"
						}
					}
				}, {
					field : 'payType',
					title : '缴费类型',
					align:'center',
					width:'5%',
					formatter:function(value,row,index){
						if(value == undefined || value == ''){
							return "<a class='payType' href='javascript:void(0);'>添加</a>";
						}else{
							switch(value){
							/*
							1.缴费 2.预付费 3.退费 4.一次性付清 5.分期 6.宜信 7.信用卡
							*/
							case 1:
								return '<a href="javascript:void(0);" class="payType">缴费</a>';
							case 2:
								return '<a href="javascript:void(0);" class="payType">预付费</a>';
							case 3:
								return '<a href="javascript:void(0);" class="payType">退费</a>';
							case 4:
								return '<a href="javascript:void(0);" class="payType">一次性付清</a>';
							case 5:
								return '<a href="javascript:void(0);" class="payType">分期</a>';
							case 6:
								return '<a href="javascript:void(0);" class="payType">宜信</a>';
							case 7:
								return '<a href="javascript:void(0);" class="payType">信用卡</a>';
							}
						}
					}
				}, {
					field : 'pay',
					title : '缴费金额',
					align:'center',
					width:'5%',
					formatter:function(value,row,index){
						if(value == undefined || value == ''){
							return "<a class='pay' href='javascript:void(0);'>添加</a>";
						}
						return value;
					}
				}, {
					field : 'major',
					title : '专业',
					align:'center',
					width:'8%'
				}, {
					field : 'phone',
					title : '电话',
					align:'center'
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
					field : 'job',
					title : '应聘岗位',
					align:'center',
					width:'10%'
				}, {
					field : 'msgFrom',
					title : '信息来源',
					align:'center'
				}, {
					field : 'school',
					title : '毕业院校',
					align:'center',
					width:'10%'
				}, {
					field : 'intention',
					title : '意向度分析',
					align:'center',
					width:'20%'
				} ]
			});
		}
			
		$(function() {
			fn_initTab();
			 /* $('#cv_tab').on('click-row.bs.table', function (row, ele) {
				 console.log($('#cv_tab').bootstrapTable('getRowByUniqueId', $(ele)[0]["tId"]));
			});  */
			 $('#cv_tab').on('dbl-click-row.bs.table', function (row, ele) {
				 console.log($('#cv_tab').bootstrapTable('getRowByUniqueId', $(ele)[0]['tId']).tId);
			}); 
			
			$("#btn_edit").click(function(){
				if(JSON.stringify(submit_data) != "{}"){
					var reg = /^[0-9]+(.[0-9]{2})?$/;
					for(var item in submit_data){
						if(submit_data[item].userId == "0"){
							swal("请选择咨询顾问!", "", "error"); 
							return;
						}
						if(submit_data[item].pay){
							if(!reg.test(submit_data[item].pay)){
								swal("输入的金额不合法", "", "error"); 
								return;
							}
						}
					}
					console.log("验证通过");//TODO 提交数据
					$.ajax({
	                       type: "POST",  
	                       dataType: "json",  
	                       url: "${sessionScope.basePath}saveData.action",  
	                       contentType: "application/json; charset=utf-8",
	                       data: JSON.stringify(submit_data) ,  
	                       beforeSend:function(XMLHttpRequest){
	                       },
	                       success: function (data) {
	                    	   toastr.success("提交成功!");
	                       },
	                       error:function(XMLHttpRequest,textStatus,errorThrown){
	                       }
					});
				}
			});
			$("#btn_delete").click(function(){
				var arr = $('#cv_tab').bootstrapTable('getSelections');
				var ids = {};
				for(var obj in arr){
					ids[obj] = arr[obj].tId;
				}
				console.log(ids);
			});
			$("#btn_search").on("click", function(){
				//fn_initTab();
				$("#cv_tab").bootstrapTable('refresh',{
					url:'${sessionScope.basePath}queryCVInfo.action',
					queryParams: function queryParams(params) {   //设置查询参数  
			              var param = {    
			                  pageNumber: params.pageNumber,    
			                  pageSize: params.pageSize, 
			                  s_text:$("#s_text").val(),
			                  searchText:$("#searchText").val(),
			                  pay_type:$("#pay_type").val(),
			                  s_date:$("#s_date").val(),
			                  from_date:$("#from_date").val(),
			                  to_date:$("#to_date").val()
			              };    
			              return param;                   
			            }
					}); 
			});
			$("#cv_tab").on("click",".dataDate",function(){
				$(this).datetimepicker({
					language: 'zh-CN',//显示中文
					format : 'yyyy-mm-dd',//显示格式
					minView : "month",//设置只显示到月份
					initialDate : new Date(),//初始化当前日期
					autoclose : true,//选中自动关闭
					todayBtn : true
				//显示今日按钮
				});
				$(this).datetimepicker('show');
				$(this).datetimepicker().on('changeDate', function(ev){
					var date_str = $(this).datetimepicker("getFormattedDate");
					$(this).text(date_str);
					var index = $(this).attr("data-row-index");
					var col = $(this).attr("data-row-col");
					var relId = $(this).attr("relid");
					var data = $('#cv_tab').bootstrapTable("getData")[index];
					if(submit_data[index] == null){
						obj = {};
						obj[col] = date_str;
						submit_data[index] = obj;
					}else{
						submit_data[index][col] = date_str;
					} 
					if(relId != "undefined"){
						submit_data[index]['relId'] = relId;
					}else{
						submit_data[index]['relId'] = "0";
					}
					submit_data[index]['userId'] = submit_data[index]['userId'] == undefined?"0":submit_data[index]['userId'];
					submit_data[index]['stuId'] = data["tId"];
					console.log(submit_data);
				});
			});
			$("#cv_tab").on("click",".userName",function(){
				var _tr = $(this).parent();
				$(this).remove();
				_tr.append("<select class='askTeacher'><option value='-1'>请选择</option><option value='1'>张三</option><option value='2'>李四</option><option value='3'>吊炸天</option></select>");
			});
			
			$("#cv_tab").on("change",".askTeacher",function(){
				var index = $(this).parents("tr").index();
				var data = $('#cv_tab').bootstrapTable("getData")[index];
				if(submit_data[index] == null){
					obj = {};
					obj['userId'] = $(this).val();
					submit_data[index] = obj;
				}else{
					submit_data[index]['userId'] = $(this).val();
				}
				submit_data[index]['stuId'] = data["tId"];
				submit_data[index]['relId'] = data["relId"] == undefined?"0":data["relId"];
				console.log(submit_data);
			});
			
			$("#cv_tab").on("click",".payType",function(){
				var _tr = $(this).parent();
				$(this).remove();	//移除缴费类型文本
				_tr.append("<select class='sel_payType'><option value='-1'>请选择</option><option value='1'>缴费</option><option value='2'>预付费</option><option value='3'>退费</option><option value='4'>一次性付清</option><option value='5'>分期</option><option value='6'>宜信</option><option value='7'>信用卡</option></select>");
			});
			
			$("#cv_tab").on("change",".sel_payType",function(){
				var index = $(this).parents("tr").index();
				var data = $('#cv_tab').bootstrapTable("getData")[index];
				
				if(submit_data[index] == null){
					obj = {};
					obj['payType'] = $(this).val();
					submit_data[index] = obj;
				}else{
					submit_data[index]['payType'] = $(this).val();
				} 
				submit_data[index]['stuId'] = data["tId"];
				submit_data[index]['userId'] = submit_data[index]['userId'] == undefined?"0":submit_data[index]['userId'];
				submit_data[index]['relId'] = data["relId"] == undefined?"0":data["relId"];
				console.log(submit_data);
			});
			
			$("#cv_tab").on("click",".pay",function(){
				var _tr = $(this).parent();
				$(this).remove();	//移除缴费类型文本
				_tr.append("<input type='text' name='_pay' style='width:100%;text-align:center;'/>");
			});
			
			$("#cv_tab").on("blur","input[name='_pay']",function(){
				var index = $(this).parents("tr").index();
				var data = $('#cv_tab').bootstrapTable("getData")[index];
				
				if(submit_data[index] == null){
					obj = {};
					obj['pay'] = $(this).val();
					submit_data[index] = obj;
				}else{
					submit_data[index]['pay'] = $(this).val();
				} 
				submit_data[index]['userId'] = submit_data[index]['userId'] == undefined?"0":submit_data[index]['userId'];
				submit_data[index]['stuId'] = data["tId"];
				submit_data[index]['relId'] = data["relId"] == undefined?"0":data["relId"];
				console.log(submit_data);
			});
			
		});
	</script>
</body>
</html>