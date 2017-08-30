package com.wisezone.controller.admin;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wisezone.entity.UserInfo;
import com.wisezone.service.UserInfoService;

@Controller
@Scope(value="prototype")
@RequestMapping(value="/")
public class UserInfoController {
	
	@Resource(name="userInfoServiceImpl")
	private UserInfoService  service;
	
	@RequestMapping(value="/login")
	public String login(Model model,HttpServletRequest request,HttpSession session){
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		session.setAttribute("basePath", basePath);
		return "login";
	}
	
	@RequestMapping(value="/dologin")
	@ResponseBody
	public String doLogin(String loginName,String loginPwd,HttpSession session){
		Map<String, String> map = new HashMap<String, String>();
		map.put("loginName", loginName);
		map.put("loginPwd", loginPwd);
		UserInfo userinfo = service.login(map);
		StringBuilder sb = new StringBuilder("{\"state\":");
		if (userinfo != null) {
			session.setAttribute("userInfo", userinfo);
			
			sb.append(true);
		}else{
			sb.append(false);
		}
		sb.append("}");
		return sb.toString();
	}
	
	@RequestMapping(value="/loginOut")
	public String loginOut(HttpSession session){
		session.invalidate();
		return "redirect:/login.action";
	}
}
