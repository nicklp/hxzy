package com.wisezone.controller.admin;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wisezone.service.UserInfoService;

@Controller
@Scope(value="prototype")
@RequestMapping(value="/")
public class UserInfoController {
	@Resource(name="UserInfoServiceImpl")
	private UserInfoService service;
	
}
