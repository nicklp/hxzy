package com.wisezone.controller.admin;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wisezone.entity.UserInfo;
import com.wisezone.service.UserInfoService;
import com.wisezone.util.PageUtil;

@Controller
@Scope(value = "prototype")
@RequestMapping(value = "/")
public class FirstController {
	
	@Resource(name="userInfoServiceImpl")
	private UserInfoService  userInfoService;
	
	
	@RequestMapping(value="/test")
	public String test(Model model){
		
		model.addAttribute("test", "hello");
		return "page";
	}
	
	
	
	
	@RequestMapping(value = "/test3")
	public String second(Integer page,Integer size,Model model) {

		PageUtil<UserInfo> paging=new PageUtil<UserInfo>();
		Map<String, Object> params=new HashMap<String,Object>();
		
		//璁惧畾绗嚑椤�
		if(page!=null && page>0){
			paging.setPage(page);
		}
		//姣忛〉澶氬皯绗�
		if(size!=null && size>0){
			paging.setSize(size);
		}
		
		//鏌ヨ
		this.userInfoService.searchPaging(params, paging);
		 
	    
		model.addAttribute("paging", paging);

		return "3";
	}
	
	
	
}
