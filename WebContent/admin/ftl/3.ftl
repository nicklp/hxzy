<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>3、使用freemarker来循环遍历对象</title>
<#include "/macro/navgative.ftl">	 

<#assign ctx=request.getContextPath() >

<!-- Bootstrap Core CSS -->
		<link href="${ctx }/static/bootstrap/css/bootstrap.css" rel="stylesheet">
		
		<!-- MetisMenu CSS -->
		<link href="${ctx }/static/metismenu/metisMenu.css" rel="stylesheet">
		
		<!-- Custom Fonts -->
		<link href="${ctx}/static/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		
		<!-- Custom CSS -->
		<link href="${ctx }/static/css/index.css" rel="stylesheet">
		
		<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
		        <script src="${ctx }/static/js/html5shiv.min.js"></script>
		        <script src="${ctx}/static/js/respond.min.js"></script>
		    <![endif]-->


</head>

<body>
 
	 
	 <div id="wrapper">
	 
		  <#include "menu.ftl">	 


		<div id="page-wrapper" style="min-height: 500px;">
			<div class="row">
				<div class="col-lg-12 ">  
				       <ol class="breadcrumb">
						  <li>微信公众平台</li>
						  <li>用户管理</li> 
					 
						  
						</ol>   
				</div> 
			</div>
			<div class="row">
			    <div class="col-md-12">
			       <ol class="breadcrumb">
						  <li>查询条件</li>
				   </ol> 
			    </div>
			</div>
			<!-- 查询条件 -->
			 
            <!-- 显示数据 -->
             <div class="row">
                <div class="col-md-12">
                   <table class="table table-bordered  table-hover">
				         <thead>
				              <tr>
				                  <th>用户编号</th>
	                              <th>用户名</th>
	                              <th>有效开始时间</th>
	                              <th>有效结束时间</th>
	                           </tr>
				         </thead>
				         
				         <tbody>  
				               <#list  paging.data as p>
	 
		                              <tr>
		                                 <td>${p.userId}</td>
		                                  <td>${p.loginName}</td>
		                                  <td>${p.regTime?datetime}</td>
		                                  <td>${p.endTime?datetime}</td>
		                             </tr>
	 
	                            </#list>
				           
				         </tbody> 			         
					</table>
                </div>
             </div>
         
             
               <@navigation url="admin/test3.action" ></@navigation>
         
         
         
         
             
          </div>
    </div>
    
	
	
	
	
	
	
	
	
	
	
	    <!-- jQuery -->
	<script src="${ctx }/static/js/jquery-1.11.3.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="${ctx}/static/bootstrap/js/bootstrap.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="${ctx }/static/metismenu/metisMenu.js"></script>

	 
	<!-- Custom Theme JavaScript -->
	<script src="${ctx }/static/js/my.js"></script>   
	   
</body>
</html>