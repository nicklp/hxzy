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

@WebFilter(filterName="loginFilter",urlPatterns="/*")
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
        if(session.getAttribute("userInfo") == null && path.indexOf("login.action") == -1 ){  
            servletResponse.sendRedirect(servletRequest.getContextPath()+"/login.action");  
            return;  
        }else{  
            chain.doFilter(request,response);  
        }  
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

}
