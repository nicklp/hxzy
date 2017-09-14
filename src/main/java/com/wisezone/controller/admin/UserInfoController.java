package com.wisezone.controller.admin;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wisezone.entity.UserInfo;
import com.wisezone.service.UserInfoService;
import com.wisezone.util.PageUtil;
import com.wisezone.util.StringUtil;

import net.sf.json.JSONObject;

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
			
			sb.append(userinfo.getState());
		}else{
			sb.append(-1);
		}
		sb.append("}");
		return sb.toString();
	}
	
	@RequestMapping(value="/loginOut")
	public String loginOut(HttpSession session){
		session.invalidate();
		return "redirect:/login.action";
	}
	
	@RequestMapping(value="/yjpm")
	public String yjpm(){
		return "yjpm";
	}
	
	@RequestMapping(value="queryyjpm")
	@ResponseBody
	public List<Map<String, Object>> queryyjpm(String dateMonth){
		List<Map<String, Object>> list = service.yj_sort(dateMonth);
		return list;
	}
	
	@RequestMapping(value="yjofYear")
	public String queryByYear(){
		return "yjofYear";
	}
	
	@RequestMapping(value="queryyjofYear")
	@ResponseBody
	public List<Map<String, Object>> queryyjofYear(String year){
		if (StringUtil.isNullOrEmpty(year)) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
			year = sdf.format(new Date());
		}
		List<Map<String, Object>> list = service.searchYear(year);
		return list;
	}
	
	@RequestMapping(value="/userInfo")
	public String userInfo(){
		return "userinfo";
	}
	
	@RequestMapping(value="/queryUserInfo")
	@ResponseBody
	public String queryCVInfo(@RequestBody JSONObject obj){
		PageUtil<UserInfo> paging = new PageUtil<>();
		paging.setPage(obj.getInt("pageNumber"));
		paging.setSize(obj.getInt("pageSize"));
		Map<String, Object> param = new HashMap<>();
		param.put("state", obj.getInt("userState"));
		if (obj.getString("loginName") != null && !obj.getString("loginName").equals("")) {
			param.put("login_name", obj.getString("loginName"));
			
		}
		service.searchPaging(param,paging);
		Map<String, Object> jsonMap = new HashMap<>();
		jsonMap.put("total", paging.getTotalRecords());
		jsonMap.put("rows", paging.getData());
		ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.writeValueAsString(jsonMap);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping(value="/updateState")
	@ResponseBody
	public boolean updateState(int state,int tId){
		return service.update(new UserInfo(tId,null,null,state,0));
	}
	
	@RequestMapping(value="/addUser")
	public String addUser(){
		return "addUser";
	}
}
