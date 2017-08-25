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
										 	<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
										 </button>
										 <button id="btn_delete" type="button" class="btn btn-default">
										 	<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
										 </button>
										 <a href="javascript:void(0);" id="str_date">2017-08-25</a>
									 </div>
								 </div>
								<table id="cv_tab" data-toggle="table" class="table table-bordered table-hover table-striped "
									data-toolbar="#toolbar"
									data-pagination="true"
									data-show-columns="true"
									data-page-size="5"
								>
									<!-- <thead>
										<tr>
											<th>操作</th>
											<th>姓名</th>
											<th>咨询顾问</th>
											<th>录入日期</th>
											<th>上门日期</th>
											<th>预报日期</th>
											<th>预报金额</th>
											<th>缴费日期</th>
											<th>缴费类型</th>
											<th>缴费金额</th>
											<th>专业</th>
											<th>电话</th>
											<th>学历</th>
											<th>应聘岗位</th>
											<th>信息来源</th>
											<th>毕业院校</th>
											<th>意向度分析</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>杨婷</td>
											<td>黄颖</td>
											<td>2017-08-02</td>
											<td>2017-08-02</td>
											<td>添加</td>
											<td>添加</td>
											<td>添加</td>
											<td>请选择</td>
											<td>添加</td>
											<td>会记与统筹</td>
											<td>12345678911</td>
											<td>本科</td>
											<td>多媒体</td>
											<td>免费简历</td>
											<td>重庆师范大学</td>
											<td>XXXXX</td>
										</tr>
									</tbody>
									<tfoot></tfoot>  -->
								</table>
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
		src="assets/bootstrap-datepicker/js/bootstrap-datetimepicker.min.js"></script>
	<script src="assets/sweetalert/sweetalert.min.js"></script>
	<script src="assets/bootstrap-table/bootstrap-table.js"></script>
	<script src="assets/bootstrap-table/bootstrap-table-zh-CN.js"></script>
	<script>
		//初始化dateTimepicker
		$('#to_date,#from_date').datetimepicker({
			//language: 'zh-CN',//显示中文
			format : 'yyyy-mm-dd',//显示格式
			minView : "month",//设置只显示到月份
			initialDate : new Date(),//初始化当前日期
			autoclose : true,//选中自动关闭
			todayBtn : true
		//显示今日按钮
		})
		$('#str_date').datetimepicker({
			//language: 'zh-CN',//显示中文
			format : 'yyyy-mm-dd',//显示格式
			minView : "month",//设置只显示到月份
			initialDate : new Date(),//初始化当前日期
			autoclose : true,//选中自动关闭
			todayBtn : true
		//显示今日按钮
		})
	</script>
	<script>
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
	            	console.log("加载失败");	
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
					switchable:false
					/* formatter:function(value,row,index){ 
						   return "<input type='checkbox' name='checkall' value='"+value+"' />"; 
					}  */
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
							return "<select class='askTeacher'><option>张三</option><option>李四</option><option>吊炸天</option></select>";
						} 
						return value;
					}
				}, {
					field : 'createDate',
					title : '录入日期',
					align:'center',
					width:'7%',
					formatter:function(value,row,index){
						if(value == undefined || value == ''){
							return '-';
						}else{
							if(row["userName"] && row["userName"] != undefined && row["userName"] != ""){
								return "<a href='javascript:void(0);'>"+value+"</a>"
							}else{
								return value;
							}
						}
					}
				}, {
					field : 'visitDate',
					title : '上门日期',
					align:'center',
					width:'7%',
					formatter:function(value,row,index){
						if(value == undefined || value == ''){
							return '-';
						}
						return value;
					}
				}, {
					field : 'prePayDate',
					title : '预付费日期',
					align:'center',
					width:'7%',
					formatter:function(value,row,index){
						if(value == undefined || value == ''){
							return '-';
						}
						return value;
					}
				}, {
					field : 'payDate',
					title : '缴费日期',
					align:'center',
					width:'7%',
					formatter:function(value,row,index){
						if(value == undefined || value == ''){
							return '-';
						}
						return value;
					}
				}, {
					field : 'payType',
					title : '缴费类型',
					align:'center',
					width:'5%',
					formatter:function(value,row,index){
						if(value == undefined || value == ''){
							return '-';
						}else{
							switch(value){
							/*
							1.缴费 2.预付费 3.退费 4.一次性付清 5.分期 6.宜信 7.信用卡
							*/
							case 1:
								return '缴费';
							case 2:
								return '预付费';
							case 3:
								return '退费';
							case 4:
								return '一次性付清';
							case 5:
								return '分期';
							case 6:
								return '宜信';
							case 7:
								return '信用卡';
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
							return '-';
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
					align:'center'
				}, {
					field : 'intention',
					title : '意向度分析',
					align:'center',
					width:'15%'
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
				//var id = $('#cv_tab').bootstrapTable('getSelections')["id"];
				$("tbody tr input[type='checkbox']").each(function(index,item){
					if($(this).prop("checked")){
						var index = $(this).attr("data-index");
						var data = $('#cv_tab').bootstrapTable("getData")[index];
						console.log(data);
					}
				});
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
			$(".askTeacher").on("change",function(){
				console.log(123);
			});
			$("#cv_tab").on("click","a",function(){
				$(this).datetimepicker({
					//language: 'zh-CN',//显示中文
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
					console.log(date_str);
				});
			});
		});
	</script>
</body>
</html>