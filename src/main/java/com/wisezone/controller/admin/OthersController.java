package com.wisezone.controller.admin;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wisezone.service.CVOtherInfoService;

import net.sf.json.JSONObject;

@Controller
@Scope(value="prototype")
@RequestMapping(value="/")
public class OthersController {
	
	@Resource(name="CVOtherInfoServiceImpl")
	private CVOtherInfoService service;
	
	@RequestMapping(value="/tjmsgfrom")
	public String tjmsgfrom(){
		return "tjmsgfrom";
	}
	
	@RequestMapping(value="/querytjmsgfrom")
	@ResponseBody
	public String querytjmsgfrom(@RequestBody JSONObject obj){
		Map<String, Object> param = new HashMap<>();
		param.put("from_date", obj.getString("from_date"));
		param.put("to_date", obj.getString("to_date"));
		List<Map<String, Object>> list = service.searchMsgFromCount(param);
		Map<String, Object> jsonMap = new HashMap<>();
		jsonMap.put("total", list.size());
		jsonMap.put("rows", list);
		ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.writeValueAsString(jsonMap);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
}
