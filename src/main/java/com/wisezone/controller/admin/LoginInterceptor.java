package com.wisezone.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.wisezone.util.StringUtil;

public class LoginInterceptor implements HandlerInterceptor {

	private final String LOGINURL = "/login.action";
	private final String DOLOGIN = "/dologin.action";
	
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {
		
		//1、请求到登录页面 放行  
	    if(request.getServletPath().startsWith(LOGINURL)) {  
	        return true;  
	    }  
	    if (request.getServletPath().startsWith(DOLOGIN)) {
			String loginName = request.getParameter("loginName");
			String loginPwd = request.getParameter("loginPwd");
			if (StringUtil.isNullOrEmpty(loginName) || StringUtil.isNullOrEmpty(loginPwd)) {
				response.sendRedirect(request.getContextPath() + LOGINURL);  
				return false;
			}
			return true;
			
		}      
	    //2、TODO 比如退出、首页等页面无需登录，即此处要放行 允许游客的请求  
	          
	    //3、如果用户已经登录 放行    
	    if(request.getSession().getAttribute("userInfo") != null) {  
	        //更好的实现方式的使用cookie  
	        return true;  
	    }  
	          
	    //4、非法请求 即这些请求需要登录后才能访问  
	    //重定向到登录页面  
	    response.sendRedirect(request.getContextPath() + LOGINURL);  
	    return false; 
		
	}

}
