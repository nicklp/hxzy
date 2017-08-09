<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.html">微网站管理平台</a>
			</div>
			<!-- /.navbar-header -->

			<ul class="nav navbar-top-links navbar-right"> 
 
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#" aria-expanded="false"> <i
						class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="#"><i class="fa fa-user fa-fw"></i> User
								Profile</a></li>
						<li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
						</li>
						<li class="divider"></li>
						<li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i>
								Logout</a></li>
					</ul> <!-- /.dropdown-user --></li>
				<!-- /.dropdown -->
			</ul>
			<!-- /.navbar-top-links -->



			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					
					<ul class="nav in" id="side-menu">
					
						<li  class="active">
						    <a href="#">
						        <i class="fa fa-bar-chart-o fa-fw"></i>
								管理
								<span class="fa arrow"></span>
							 </a>
							 
								<ul class="nav nav-second-level collapse">
									<li>
									    <a href="${ctx}/admin/weixin/searchp.action">公众号管理</a>
								    </li> 
								</ul>  
								
						 </li>  
						 
						 <li  class="active">
						    <a href="#">
						        <i class="fa fa-bar-chart-o fa-fw"></i>
								微网站设置管理
								<span class="fa arrow"></span>
							 </a>
							 
								<ul class="nav nav-second-level collapse">
									<li>
									    <a href="${ctx }/admin/weixin/search.action">分类管理</a>
								    </li> 
								     <li>
									    <a href="${ctx }/admin/weixin/search.action">文章管理</a>
								    </li>
								    <li>
									    <a href="${ctx }/admin/weixin/search.action">幻灯片管理</a>
								    </li> 
								     
								     
								   
								    <li>
									    <a href="${ctx }/admin/weixin/search.action">关键字回复管理</a>
								    </li> 
								</ul>  
								
						 </li>  
						 
						 
					</ul>
					
				</div>				 
			</div>
			
			<!-- /.navbar-static-side -->
		</nav>