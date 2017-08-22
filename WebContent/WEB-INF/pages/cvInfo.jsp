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
								<!-- fill contents -->
								<div class="panel-body">
									 <div id="toolbar" class="btn-group">
										 <button id="btn_edit" type="button" class="btn btn-default" >
										 	<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
										 </button>
										 <button id="btn_delete" type="button" class="btn btn-default">
										 	<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
										 </button>
									 </div>
								 </div>
								<table id="cv_tab" data-toggle="table"
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
		$('#createDate').datetimepicker({
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
			$('#cv_tab').bootstrapTable({
				pagination: true,
				method: 'post',
				striped: true,   //是否显示行间隔色
				uniqueId:"tId",
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
					visible:false
					/* formatter:function(value,row,index){ 
						   return "<input type='checkbox' name='checkall' value='"+value+"' />"; 
					}  */
				},
				{
					field : 'stuName',
					title : '姓名',
					align:'center'
				}, {
					field : 'userName',
					title : '咨询顾问',
					align:'center'
				}, {
					field : 'createDate',
					title : '录入日期',
					align:'center'
				}, {
					field : 'visitDate',
					title : '上门日期',
					align:'center'
				}, {
					field : 'prePayDate',
					title : '预付费日期',
					align:'center'
				}, {
					field : 'payDate',
					title : '缴费日期',
					align:'center'
				}, {
					field : 'payType',
					title : '缴费类型',
					align:'center'
				}, {
					field : 'pay',
					title : '缴费金额',
					align:'center'
				}, {
					field : 'major',
					title : '专业',
					align:'center'
				}, {
					field : 'phone',
					title : '电话',
					align:'center'
				}, {
					field : 'education',
					title : '学历',
					align:'center'
				}, {
					field : 'job',
					title : '应聘岗位',
					align:'center'
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
					align:'center'
				} ],
				data : [ {
					ch:0,
					tId : 1,
					stuName : '张三',
					userName : '李四',
					createDate : '2017-08-02',
					visitDate : '2017-08-02',
					prePayDate : '2017-08-02',
					payDate : '2017-08-02',
					payType : '一次性付费',
					pay : '13888',
					major : '市场营销',
					phone : '12345678911',
					education : '本科',
					job : '软件开发',
					msgFrom : '免费简历',
					school : '重庆师范大学',
					intention : '一般'
				}, 
				{
					ch:0,
					tId : 2,
					stuName : '张三',
					userName : '李四',
					createDate : '2017-08-02',
					visitDate : '2017-08-02',
					prePayDate : '2017-08-02',
					payDate : '2017-08-02',
					payType : '一次性付费',
					pay : '13888',
					major : '市场营销',
					phone : '12345678911',
					education : '本科',
					job : '软件开发',
					msgFrom : '免费简历',
					school : '重庆师范大学',
					intention : '一般'
				},
				{
					ch:1,
					tId : 3,
					stuName : '张三',
					userName : '李四',
					createDate : '2017-08-02',
					visitDate : '2017-08-02',
					prePayDate : '2017-08-02',
					payDate : '2017-08-02',
					payType : '一次性付费',
					pay : '13888',
					major : '市场营销',
					phone : '12345678911',
					education : '本科',
					job : '软件开发',
					msgFrom : '免费简历',
					school : '重庆师范大学',
					intention : '一般'
				}
				]
			});
			
		$(function() {
			 /* $('#cv_tab').on('click-row.bs.table', function (row, ele) {
				 console.log($('#cv_tab').bootstrapTable('getRowByUniqueId', $(ele)[0]["tId"]));
			});  */
			 $('#cv_tab').on('dbl-click-row.bs.table', function (row, ele) {
				 console.log($('#cv_tab').bootstrapTable('getRowByUniqueId', $(ele)['tId']));
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
		});
	</script>
</body>
</html>