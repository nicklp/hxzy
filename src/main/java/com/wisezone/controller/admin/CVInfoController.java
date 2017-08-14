package com.wisezone.controller.admin;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wisezone.entity.CVOtherInfo;
import com.wisezone.service.impl.CVInfoServiceImpl;
import com.wisezone.service.impl.CVOtherInfoServiceImpl;

@Controller
@Scope(value="prototype")
@RequestMapping(value="/")
public class CVInfoController {
	
	@Resource(name="CVInfoServiceImpl")
	private CVInfoServiceImpl service;

	@Resource(name="CVOtherInfoServiceImpl")
	private CVOtherInfoServiceImpl otherService;
	
	@RequestMapping(value="/addCV")
	public String addCVInfo(Model model) {
		List<CVOtherInfo> school_list = otherService.queryByType(CVOtherInfo.SCHOOL_TYPE);
		List<CVOtherInfo> msg_from_list = otherService.queryByType(CVOtherInfo.MSG_FROM);
		model.addAttribute("school", school_list);
		model.addAttribute("msg_from", msg_from_list);
		return "addCV";
	}
}
