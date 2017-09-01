package com.wisezone.controller.admin;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wisezone.entity.UserInfo;
import com.wisezone.service.CVInfoService;
import com.wisezone.service.UserRelService;

@Controller
@Scope(value="prototype")
@RequestMapping(value="/")
public class TodayViewContoller {
	@Resource(name="CVInfoServiceImpl")
	private CVInfoService cvService;
	
	@Resource(name="userRelServiceImpl")
	private UserRelService userRelService;

	@RequestMapping(value="/todayView")
	public String todayView(Model model,HttpSession session){
		UserInfo loginUser = (UserInfo) session.getAttribute("userInfo");
		//如果登录用户不是超级管理员或者市场专员，则只能统计自己的数量
		int inviteId = loginUser.getRole() != 1 && loginUser.getRole() != 9 ? 0:loginUser.getRole();
		Map<String, Integer> statistics = userRelService.getStatisticsByUser(inviteId);
		model.addAttribute("map", statistics);
		return "todayView";
	}
}
