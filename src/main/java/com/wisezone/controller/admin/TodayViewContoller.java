package com.wisezone.controller.admin;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wisezone.entity.UserInfo;
import com.wisezone.service.CVInfoService;
import com.wisezone.service.UserInfoService;
import com.wisezone.service.UserRelService;
import com.wisezone.util.PageUtil;

import net.sf.json.JSONObject;

@Controller
@Scope(value="prototype")
@RequestMapping(value="/")
public class TodayViewContoller {
	@Resource(name="CVInfoServiceImpl")
	private CVInfoService cvService;
	
	@Resource(name="userRelServiceImpl")
	private UserRelService userRelService;
	
	@Resource(name="userInfoServiceImpl")
	private UserInfoService userInfoService;

	@RequestMapping(value="/todayView")
	public String todayView(Model model,HttpSession session){
		UserInfo loginUser = (UserInfo) session.getAttribute("userInfo");
		//如果登录用户不是超级管理员或者市场专员，则只能统计自己的数量
		int inviteId = loginUser.getRole() != 1 && loginUser.getRole() != 9 ? loginUser.gettId() : 0;/*市场助理只能统计自己的数量*/
		Map<String, Integer> statistics = userRelService.getStatisticsByUser(inviteId);
		model.addAttribute("map", statistics);
		
		//TODO 调试页面显示数据
		List<UserInfo> list = userInfoService.getUserInfo(2);//查询市场助理
		StringBuilder sb = new StringBuilder("<select class='invitePersonList'><option value='-1'>请选择</option>");
		for (UserInfo item : list) {
			sb.append("<option value='"+item.gettId()+"'>" + item.getLoginName() + "</option>");
		}
		sb.append("</select>");
		model.addAttribute("invitePerson", sb.toString());
		return "todayView";
	}
	
	@RequestMapping(value="/queryView")
	@ResponseBody
	public String queryCVInfo(@RequestBody JSONObject obj,HttpSession session){
		PageUtil<Map<String, Object>> paging = new PageUtil<>();
		paging.setPage(obj.getInt("pageNumber"));
		paging.setSize(obj.getInt("pageSize"));
		Map<String, Object> param = new HashMap<>();
		
		int s_text = obj.getInt("s_text");
		if(s_text == 1){
			param.put("stu_name", obj.getString("searchText"));	//根据市场助理名称查询
		}else{
			param.put("login_name", obj.getString("searchText"));		//根据学生姓名查询
		}
		
		param.put("from_date", obj.getString("from_date"));
		param.put("to_date", obj.getString("to_date"));
		
		UserInfo loginUser = (UserInfo) session.getAttribute("userInfo");
		//如果登录的用户为市场助理，则只能看到自己做的简历
		cvService.searchViewPaging(param, paging,loginUser.gettId());
		
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
}
