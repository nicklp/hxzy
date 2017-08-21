package com.wisezone.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*@WebFilter(filterName="loginFilter",urlPatterns="/*")*/
public class LoginFilter implements Filter {

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest servletRequest = (HttpServletRequest) request;  
        HttpServletResponse servletResponse = (HttpServletResponse) response;  
        HttpSession session = servletRequest.getSession();  
        String path = servletRequest.getServletPath();  
        if (validatePath(path)) {
			chain.doFilter(request, response);
		}else{
			if(session.getAttribute("userInfo") == null && path.indexOf("login.action") == -1 ){  
				servletResponse.sendRedirect(servletRequest.getContextPath()+"/login.action");  
				return;  
			}
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

	private boolean validatePath(String path){
		String end = path.substring(path.lastIndexOf(".") + 1);
		if (end.equalsIgnoreCase("js")||end.equalsIgnoreCase("css")||end.equalsIgnoreCase("jpg")||end.equalsIgnoreCase("png")) {
			return true;
		}
		return false;
	}
}
