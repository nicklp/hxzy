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

</style>
<title>新增面试信息</title>
</head>
<body>
	<div id="wrapper">
		<%@include file="nav_side.jsp"%>
		<div id="page-wrapper">
			<div class="header">
				<h2 class="page-header">
					新增面试信息 <small></small>
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
									<div class="form-group">
										<label for="cvname" class="col-sm-2 control-label">姓名</label>
										<div class="col-sm-8">
											<input type="text" class="form-control" id="cvname" wisezone="notEmpty"
												name="cvname" placeholder="请输入姓名">
										</div>
									</div>
									<div class="form-group">
										<label for="phone" class="col-sm-2 control-label">电话</label>
										<div class="col-sm-8">
											<input type="text" class="form-control" id="phone" wisezone="notEmpty numeric"
												name="phone" placeholder="请输入电话">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">性别</label>
										<div class="col-sm-8">
											<div class="radio3 radio-check radio-success radio-inline">
												<input type="radio" id="radio4" name="sex" value="男"
													checked="checked"> <label for="radio4"> 男 </label>
											</div>
											<div class="radio3 radio-check radio-success radio-inline">
												<input type="radio" id="radio5" name="sex" value="女">
												<label for="radio5"> 女 </label>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="education" class="col-sm-2 control-label">毕业院校</label>
										<div class="col-sm-8">
											<div class="row" style="padding-left: 15px">
												<div class="col-sm-2">
													<input type="text" class="form-control" id="school"
														name="school" placeholder="请输入毕业院校">
												</div>
												<div class="col-sm-8">
													<select id="school_select" class="selectbox"
														style="width: 200px;">
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
											<input type="text" class="form-control" id="major"
												name="major" placeholder="请输入">
										</div>
									</div>
									<div class="form-group">
										<label for="job" class="col-sm-2 control-label">应聘岗位</label>
										<div class="col-sm-8">
											<input type="text" class="form-control" id="job" name="job"
												placeholder="请输入">
										</div>
									</div>
									<div class="form-group">
										<label for="msgFrom" class="col-sm-2 control-label">信息来源</label>
										<div class="col-sm-8">
											<div class="row" style="padding-left: 15px">
												<div class="col-sm-2">
													<input type="text" class="form-control" id="msgFrom" wisezone="notEmpty"
														name="msgFrom" placeholder="请输入">
												</div>
												<div class="col-sm-8">
													<select id="msgFrom_select" class="selectbox"
														style="width: 200px;">
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
													<input type="text" class="form-control" id="tdType" wisezone="notEmpty"
														name="tdType" placeholder="请输入">
												</div>
												<div class="col-sm-8">
													<select id="tdType_select" class="selectbox"
														style="width: 200px;">
														<option value="1">网上搜索</option>
														<option value="2">电话咨询</option>
														<option value="3">口碑</option>
														<option value="4">主动投递</option>
														<option value="9">其他</option>
													</select>
												</div>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="createDate" class="col-sm-2 control-label">录入时间</label>
										<div class="col-sm-8">
											<input type="text" class="form-control" style="width: 20%" wisezone="notEmpty"
												id="createDate" name="createDate" readonly>
										</div>
									</div>
									<div class="form-group">
										<label for="intention" class="col-sm-2 control-label">意向度分析</label>
										<div class="col-sm-8">
											<input type="text" class="form-control" id="intention"
												name="intention" placeholder="请输入">
										</div>
									</div>
									<div class="form-group" style="">
										<label class="col-sm-2 control-label">姓名验证</label>
										<div class="col-sm-8">
											<div class="panel panel-default">
												<div class="panel-body">
													<div class="table-responsive">
														<table class="table table-hover">
															<tr>
																<td>李勇</td>
																<td>12345678912</td>
																<td>四川托普信息技术职业学院</td>
																<td>计算机游戏开发</td>
																<td>hrm联英人才网</td>
																<td>2013-8-1</td>
															</tr>
															<tr>
																<td>2</td>
																<td>Jacob</td>
																<td>Thornton</td>
																<td>@fat</td>
																<td>@fat</td>
																<td>@fat</td>
															</tr>
															<tr>
																<td>3</td>
																<td>Larry</td>
																<td>the Bird</td>
																<td>@twitter</td>
																<td>@twitter</td>
																<td>@twitter</td>
															</tr>
														</table>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- 简历信息 -->
									<div class="form-group">
										<label class="col-sm-2 control-label">简历</label>
										<div class="col-sm-8">
											<div class="btn-toolbar" data-role="editor-toolbar"
												data-target="#editor">
												<div class="btn-group">
													<a class="btn dropdown-toggle" data-toggle="dropdown"
														title="Font"><i class="icon-font"></i><b class="caret"></b></a>
													<ul class="dropdown-menu">
													</ul>
												</div>
												<div class="btn-group">
													<a class="btn dropdown-toggle" data-toggle="dropdown"
														title="Font Size"><i class="icon-text-height"></i> <b
														class="caret"></b></a>
													<ul class="dropdown-menu">
														<li><a data-edit="fontSize 5"><font size="5">Huge</font></a></li>
														<li><a data-edit="fontSize 3"><font size="3">Normal</font></a></li>
														<li><a data-edit="fontSize 1"><font size="1">Small</font></a></li>
													</ul>
												</div>
												<div class="btn-group">
													<a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)"><i
														class="icon-bold"></i></a> <a class="btn" data-edit="italic"
														title="Italic (Ctrl/Cmd+I)"><i class="icon-italic"></i></a>
													<a class="btn" data-edit="strikethrough"
														title="Strikethrough"><i class="icon-strikethrough"></i></a>
													<a class="btn" data-edit="underline"
														title="Underline (Ctrl/Cmd+U)"><i
														class="icon-underline"></i></a>
												</div>
												<div class="btn-group">
													<a class="btn" data-edit="insertunorderedlist"
														title="Bullet list"><i class="icon-list-ul"></i></a> <a
														class="btn" data-edit="insertorderedlist"
														title="Number list"><i class="icon-list-ol"></i></a> <a
														class="btn" data-edit="outdent"
														title="Reduce indent (Shift+Tab)"><i
														class="icon-indent-left"></i></a> <a class="btn"
														data-edit="indent" title="Indent (Tab)"><i
														class="icon-indent-right"></i></a>
												</div>
												<div class="btn-group">
													<a class="btn" data-edit="justifyleft"
														title="Align Left (Ctrl/Cmd+L)"><i
														class="icon-align-left"></i></a> <a class="btn"
														data-edit="justifycenter" title="Center (Ctrl/Cmd+E)"><i
														class="icon-align-center"></i></a> <a class="btn"
														data-edit="justifyright" title="Align Right (Ctrl/Cmd+R)"><i
														class="icon-align-right"></i></a> <a class="btn"
														data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i
														class="icon-align-justify"></i></a>
												</div>
												<div class="btn-group">
													<a class="btn dropdown-toggle" data-toggle="dropdown"
														title="Hyperlink"><i class="icon-link"></i></a>
													<div class="dropdown-menu input-append">
														<input class="span2" placeholder="URL" type="text"
															data-edit="createLink" />
														<button class="btn" type="button">Add</button>
													</div>
													<a class="btn" data-edit="unlink" title="Remove Hyperlink"><i
														class="icon-cut"></i></a>
												</div>

												<div class="btn-group">
													<a class="btn" title="Insert picture (or just drag & drop)"
														id="pictureBtn"><i class="icon-picture"></i></a> <input
														type="file" data-role="magic-overlay"
														data-target="#pictureBtn" data-edit="insertImage" />
												</div>
												<div class="btn-group">
													<a class="btn" data-edit="undo" title="撤销 (Ctrl/Cmd+Z)"><i
														class="icon-undo"></i></a> <a class="btn" data-edit="redo"
														title="取消撤销 (Ctrl/Cmd+Y)"><i class="icon-repeat"></i></a>
												</div>

											</div>

											<div id="editor"></div>
											<input type="hidden" name="details" id="details" />
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
		<div class="modal-dialog">
			<div class="modal-content"
				style="background: rgba(255, 255, 255, 0); color: #fff;">
				<i class="fa fa-cog fa-spin fa-4x"></i>
			</div>
			<!-- /.modal-content -->
		</div>
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
	<!-- Custom Js -->
	<!-- <script src="assets/js/custom-scripts.js"></script>  -->
	<script>
		$(function() {
			function initToolbarBootstrapBindings() {
				var fonts = [ 'Serif', 'Sans', 'Arial', 'Arial Black',
						'Courier', 'Courier New', 'Comic Sans MS', 'Helvetica',
						'Impact', 'Lucida Grande', 'Lucida Sans', 'Tahoma',
						'Times', 'Times New Roman', 'Verdana' ], fontTarget = $(
						'[title=Font]').siblings('.dropdown-menu');
				$
						.each(
								fonts,
								function(idx, fontName) {
									fontTarget
											.append($('<li><a data-edit="fontName ' + fontName +'" style="font-family:\''+ fontName +'\'">'
													+ fontName + '</a></li>'));
								});
				$('a[title]').tooltip({
					container : 'body'
				});
				$('.dropdown-menu input').click(function() {
					return false;
				}).change(
						function() {
							$(this).parent('.dropdown-menu').siblings(
									'.dropdown-toggle').dropdown('toggle');
						}).keydown('esc', function() {
					this.value = '';
					$(this).change();
				});

				$('[data-role=magic-overlay]').each(
						function() {
							var overlay = $(this), target = $(overlay
									.data('target'));
							overlay.css('opacity', 0).css('position',
									'absolute').offset(target.offset()).width(
									target.outerWidth()).height(
									target.outerHeight());
						});
				if ("onwebkitspeechchange" in document.createElement("input")) {
					var editorOffset = $('#editor').offset();

				} else {

				}
			}
			;
			function showErrorAlert(reason, detail) {
				var msg = '';
				if (reason === 'unsupported-file-type') {
					msg = "Unsupported format " + detail;
				} else {
					console.log("error uploading file", reason, detail);
				}
				$(
						'<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>'
								+ '<strong>File upload error</strong> '
								+ msg
								+ ' </div>').prependTo('#alerts');
			}
			;
			initToolbarBootstrapBindings();
			$('#editor').wysiwyg({
				fileUploadError : showErrorAlert
			});
			window.prettyPrint && prettyPrint();
			$('#editor').html("test");
		});
	</script>
	<script>
		//初始化dateTimepicker
		$('#createDate').datetimepicker({
			//language: 'zh-CN',//显示中文
			format : 'yyyy-mm-dd',//显示格式
			minView : "month",//设置只显示到月份
			initialDate : new Date(),//初始化当前日期
			autoclose : true,//选中自动关闭
			todayBtn : true //显示今日按钮
		})
	</script>
	<script type="text/javascript" language="javascript" charset="utf-8" src="assets/bootstrapvalidator/bootstrapValidator.min.js"></script>
	<script type="text/javascript" language="javascript" charset="utf-8" src="assets/bootstrapvalidator/customervalidater.js"></script>
	<script>
		$(function(){
			/* 加载时间选择插件 */  
			$('#createDate').datetimepicker().on('changeDate', function(ev){
				 $('#cvForm').data('bootstrapValidator')  
		                .updateStatus('createDate', 'NOT_VALIDATED',null)  
		                .validateField('createDate');  
			});
		          
			$("#cvForm").submit(function(ev){
				 ev.preventDefault();
			});
			
			$(".btn-success").click(function(){
				var flag = validate($("#cvForm"));
				if(flag){
					var str = $("#cvForm").serialize();
					console.log(str);
				}
			}); 
		});
	</script>
</body>
</html>