package com.wisezone.controller.admin;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wisezone.entity.CVInfo;
import com.wisezone.entity.CVOtherInfo;
import com.wisezone.service.impl.CVInfoServiceImpl;
import com.wisezone.service.impl.CVOtherInfoServiceImpl;
import com.wisezone.util.StringUtil;

import net.sf.json.JSONObject;


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
	
	@RequestMapping(value="/queryNameAndPhone")
	@ResponseBody
	public List<CVInfo> queryNameAndPhone(HttpServletRequest request,  
	           HttpServletResponse respnose){
		String name = request.getParameter("stuName");
		String phone = request.getParameter("phone");
		Map<String, String> map = new HashMap<>();
		map.put("stuName", name);
		map.put("phone", phone);
		List<CVInfo> list = service.queryNameAndPhone(map);
		return list;
	}
	
	@RequestMapping(value="/validateNameAndPhone", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String validateNameAndPhone(String stuName,String phone){
		Map<String, String> map = new HashMap<>();
		map.put("stuName", stuName);
		map.put("phone", phone);
		List<CVInfo> list = service.queryNameAndPhone(map);
		
		Map<String, Boolean> v_map = new HashMap<>();
		v_map.put("valid", list.size() == 0);
		ObjectMapper mapper = new ObjectMapper();
		try {
			String str = mapper.writeValueAsString(v_map);
			return str;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping(value="/add",method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String insert(@RequestBody Map map){
		String dateStr = String.valueOf(map.get("createDate"));
		CVInfo cvinfo = new CVInfo(
		0,
		String.valueOf(map.get("stuName")),
		String.valueOf(map.get("phone")),
		String.valueOf(map.get("sex")),
		String.valueOf(map.get("school")),
		String.valueOf(map.get("education")),
		String.valueOf(map.get("major")),
		String.valueOf(map.get("job")),
		String.valueOf(map.get("msgFrom")),
		String.valueOf(map.get("tdType")),
		String.valueOf(map.get("intention")),
		String.valueOf(map.get("details")),
		StringUtil.convertStrToDate(dateStr)
				);
		boolean flag = service.insert(cvinfo);
		String msg = "{\"state\":"+flag+"}";
		return msg;
		
	}
}
