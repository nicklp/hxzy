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
<link rel="stylesheet" href="assets/kindeditor/themes/default/default.css">
<style>
.dropdown-menu a {
	cursor: pointer;
}
.validate_name_phone{
	width:30px;
	padding-right:2px;
	color:red;
}
</style>
<title>新增面试信息</title>
</head>
<body>
	<div id="wrapper">
		<%@include file="nav_side.jsp"%>
		<div id="page-wrapper">
			<div class="header">
				<h2 class="page-header">
					新增面试信息 <small>&nbsp;Add Resume</small>
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
								<form class="form-horizontal required-validate" method="post" id="cvForm" action="#">
									<input type="hidden" name="tId" value="${cvInfo.tId}" />
									<div class="form-group">
										<label for="stuName" class="col-sm-2 control-label">姓名</label>
										<div class="col-sm-3">
											<input type="text" class="form-control" id="stuName" wisezone="notEmpty"
												name="stuName" value="${cvInfo.stuName}" placeholder="请输入姓名">
										</div>
										<div class="col-sm-1" style="display:none;">
											<i class="fa icon-exclamation-sign validate_name_phone"></i>
											<label class="control-label">有相同姓名</label>
										</div>
									</div>
									<div class="form-group">
										<label for="phone" class="col-sm-2 control-label">电话</label>
										<div class="col-sm-3">
											<input type="text" class="form-control" id="phone" wisezone="notEmpty numeric phone"
												name="phone" value="${cvInfo.phone}" placeholder="请输入电话">
										</div>
										<div class="col-sm-1" style="display:none;"><i class="fa icon-exclamation-sign validate_name_phone"></i><label class="control-label">有重复号码</label></div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">性别</label>
										<div class="col-sm-8">
											<div class="radio3 radio-check radio-success radio-inline">
												<input type="radio" id="radio4" name="sex" value="男" <c:if test="${cvInfo.sex=='男'}">checked="checked"</c:if>>
												<label for="radio4"> 男 </label>
											</div>
											<div class="radio3 radio-check radio-success radio-inline">
												<input type="radio" id="radio5" name="sex" value="女" <c:if test="${cvInfo.sex=='女'}">checked="checked"</c:if>>
												<label for="radio5"> 女 </label>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="education" class="col-sm-2 control-label">毕业院校</label>
										<div class="col-sm-8">
											<div class="row" style="padding-left: 15px">
												<div class="col-sm-2">
													<input type="text" class="form-control" id="school" value="${cvInfo.school}"
														name="school" placeholder="请输入毕业院校">
												</div>
												<div class="col-sm-8">
													<select id="school_select" class="selectbox"
														style="width: 200px;">
														<option value="-1">请选择</option>
														<c:forEach var="t" items="${school}" >
														     <option value="${t.tName }">${t.tName }</option>
														 
														</c:forEach>
													 
														
													</select>
												</div>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">学历</label>
										<div class="col-sm-8">
											<select id="education" name="education" class="selectbox"
												style="width: 200px;">
												<option value="1">高中</option>
												<option value="2">中专</option>
												<option value="3">大专</option>
												<option value="4">本科</option>
												<option value="5">研究生</option>
												<option value="9">未知</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label for="major" class="col-sm-2 control-label">所读专业</label>
										<div class="col-sm-8">
											<input type="text" class="form-control" id="major" value="${cvInfo.major}"
												name="major" placeholder="请输入">
										</div>
									</div>
									<div class="form-group">
										<label for="job" class="col-sm-2 control-label">应聘岗位</label>
										<div class="col-sm-8">
											<input type="text" class="form-control" id="job" name="job" value="${cvInfo.job}"
												placeholder="请输入">
										</div>
									</div>
									<div class="form-group">
										<label for="msgFrom" class="col-sm-2 control-label">信息来源</label>
										<div class="col-sm-8">
											<div class="row" style="padding-left: 15px">
												<div class="col-sm-2">
													<input type="text" class="form-control" id="msgFrom" wisezone="notEmpty" value="${cvInfo.msgFrom}"
														name="msgFrom" placeholder="请输入">
												</div>
												<div class="col-sm-8">
													<select id="msgFrom_select" class="selectbox"
														style="width: 200px;">
														<option value="-1">请选择</option>
														<c:forEach items="${requestScope.msg_from}" var="item">
															<option value="${item.tName}">${item.tName}</option>
														</c:forEach>
													</select>
												</div>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="tdType" class="col-sm-2 control-label">投递分类</label>
										<div class="col-sm-8">
											<div class="row" style="padding-left: 15px">
												<div class="col-sm-2">
													<input type="text" class="form-control" id="tdType" wisezone="notEmpty" value="${cvInfo.tdType}"
														name="tdType" placeholder="请输入">
												</div>
												<div class="col-sm-8">
													<select id="tdType_select" class="selectbox"
														style="width: 200px;">
														<option value="-1">请选择</option>
														<c:forEach items="${requestScope.td_list}" var="item">
															<option value="${item.tName}">${item.tName}</option>
														</c:forEach>
													</select>
												</div>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="createDate" class="col-sm-2 control-label">录入时间</label>
										<div class="col-sm-8">
											<input type="text" class="form-control" style="width: 20%" wisezone="notEmpty" value="${cvInfo.createDate}"
												id="createDate" name="createDate" readonly>
										</div>
									</div>
									<div class="form-group">
										<label for="intention" class="col-sm-2 control-label">意向度分析</label>
										<div class="col-sm-8">
											<input type="text" class="form-control" id="intention" value="${cvInfo.intention}"
												name="intention" placeholder="请输入">
										</div>
									</div>
									<!-- 简历信息 -->
									<div class="form-group">
										<label class="col-sm-2 control-label">简历</label>
										<div class="col-sm-8">
											<textarea name="details" style="width:inherit; height: 400px; visibility: hidden; display: none;">
												${cvInfo.details}
											</textarea>
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
	<script type="text/javascript" src="assets/kindeditor/kindeditor-min.js"></script>
	<script type="text/javascript" src="assets/kindeditor/lang/zh_CN.js"></script>
	<script
		src="assets/bootstrap-datepicker/js/bootstrap-datetimepicker.min.js"></script>
	<script
		src="assets/bootstrap-datepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
	<!-- Custom Js -->
	<!-- <script src="assets/js/custom-scripts.js"></script>  -->
	<script src="assets/sweetalert/sweetalert.min.js"></script>
	<script>
		var editor;
		KindEditor.ready(function(K) {
			editor = K.create('textarea[name="details"]', {
				allowFileManager : true
			});
		});
	</script>
	<script>
		//初始化dateTimepicker
		$('#createDate').datetimepicker({
			language: 'zh-CN',//显示中文
			format : 'yyyy-mm-dd',//显示格式
			minView : "month",//设置只显示到月份
			initialDate : new Date(),//初始化当前日期
			autoclose : true,//选中自动关闭
			todayBtn : true //显示今日按钮
		})
	</script>
	<script type="text/javascript" language="javascript" charset="utf-8" src="assets/bootstrapvalidator/bootstrapValidator.js"></script>
	<script type="text/javascript" language="javascript" charset="utf-8" src="assets/bootstrapvalidator/customervalidater.js"></script>
	<script type="text/javascript" language="javascript" charset="utf-8" src="assets/hxzy/js/updateCV.js"></script>
</body>
</html>