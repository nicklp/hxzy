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
<style>
	.title ul{
		margin:0;
	}
	.title ul li{
		list-style: none;
		float:left;
		padding-right:50px;
	}
	.bg1{
		color:#003366;
	}
	.bg2{
		color:#33ff99;
	}
	.bg3{
		color:#4cabce;
	}
</style>
<title>业绩排名</title>
</head>
<body>
	<div id="wrapper">
		<%@include file="nav_side.jsp"%>
		<div id="page-wrapper">
			<div class="header">
				<h2 class="page-header">
					业绩排名&nbsp;<small>Ranking</small>
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
													<input type="text" id="dateMonth" name="dateMonth"  class="form-control" readonly placeholder="查询时间" />
												</div>
												<div class="col-md-3">
													<button id="btn_search" class="btn btn-default">查询</button>
												</div>
											</div>
										</div>
										
									</div>
								</div><!-- end of panel body -->
								<div class="row">
									<div class="col-sm-8">
			                            <div class="panel panel-default chartJs">
			                                <div class="panel-heading">
			                                    <div class="card-title">
			                                        <div class="title">
			                                        	<ul>
			                                        		<li><i class="fa fa-square bg1" aria-hidden="true">&nbsp;</i>咨询</li>
			                                        		<li><i class="fa fa-square bg2" aria-hidden="true">&nbsp;</i>付费</li>
			                                        		<li><i class="fa fa-square bg3" aria-hidden="true">&nbsp;</i>预付费</li>
			                                        	</ul>
			                                        </div>
			                                    </div>
			                                </div>
			                                <div class="panel-body" id="canvaswrap">
			                                    <canvas id="bar-chart" class="chart"></canvas>
			                                </div>
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
	<script
		src="assets/bootstrap-datepicker/js/bootstrap-datetimepicker.js"></script>
	<script
		src="assets/bootstrap-datepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
	<script src="assets/js/chart.min.js"></script>
	<script src="assets/js/chartjs.js"></script>
	
	<script>
		//初始化dateTimepicker
		$('#dateMonth').datetimepicker({
			language: 'zh-CN',//显示中文
			format : 'yyyy-mm',//显示格式
			weekStart: 1,
			startView: 3,
			minView : 3,//设置只显示到月份
			forceParse: false,
			autoclose : true,//选中自动关闭
			clearBtn:true
		//显示今日按钮
		});
	</script>
	<script>
		$(function() {
			
		});
		
	</script>
</body>
</html>