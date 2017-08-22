<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<nav class="navbar navbar-default top-navbar" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html"><strong><i class="icon fa fa-plane"></i> 华信智原</strong></a>
				<!-- <div id="sideNav" href="">
					<i class="fa fa-bars icon"></i> 
				</div> -->
            </div>

            <ul class="nav navbar-top-links navbar-right">
                <!-- /.dropdown -->
                <li class="dropdown" style="margin-right:100px;">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li>
                        	<a href="#"><i class="fa fa-user fa-fw"></i> 修改密码</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                        	<a href="javascript:void(0);" class="loginOut"><i class="fa fa-sign-out fa-fw"></i> 退出登录</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
        </nav>
        <!--/. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                    <li>
                        <a href="javascript:void(0)"><i class="fa fa-list-alt"></i> <h4 class="hxzynav">信息管理</h4><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="#">业绩排名</a>
                            </li>
                            <li>
                                <a visit_action="cvInfo.action" href="${sessionScope.basePath}cvInfo.action">简历信息</a>
                            </li>
                            <li>
                                <a href="#">简历来源统计</a>
                            </li>
                            <li>
                                <a href="#">业绩查询</a>
                            </li>
                            <li>
                                <a href="#">简历一览（今日）</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:void(0)"><i class="fa fa-sitemap"></i> <h4 class="hxzynav">工作管理</h4><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a visit_action="addCV.action" href="${sessionScope.basePath}addCV.action">简历录入</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:void(0)"><i class="fa icon-bar-chart "></i> <h4 class="hxzynav">统计信息</h4><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="#">查看年度信息曲线</a>
                                <a href="#">查看每月信息曲线</a>
                            </li>
                        </ul>
                    </li>
					<li>
                        <a href="javascript:void(0)"><i class="fa icon-cogs"></i> <h4 class="hxzynav">系统管理</h4><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="#">简历相关资料管理</a>
                            </li>
                        </ul>
                    </li>
					<li>
                        <a href="javascript:void(0)"><i class="fa icon-user"></i> <h4 class="hxzynav">用户管理</h4><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="#">用户相关资料管理</a>
                            </li>
                        </ul>
                    </li>
					
                </ul>

            </div>

        </nav>
        <script>
        	window.onload = function(){
        		$(".loginOut").click(function(){
        			window.location.href=  "${sessionScope.basePath}loginOut.action";
        		});
        		var visit_action = "${sessionScope.visit_action}";
        		if(visit_action && visit_action != undefined && visit_action != "" ){
        			$("a[visit_action='" + visit_action + "']").addClass("hxzy_nav_active");
        		}
        	}
        </script>
        <!-- /. NAV SIDE  -->