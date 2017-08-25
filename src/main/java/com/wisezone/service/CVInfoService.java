package com.wisezone.service;

import java.util.List;
import java.util.Map;

import com.wisezone.entity.CVInfo;
import com.wisezone.util.PageUtil;

public interface CVInfoService extends CommonService<CVInfo>{
	public List<CVInfo> queryNameAndPhone(Map<String, String> map);
	
	public void searchPaging1(Map<String, Object> param,PageUtil<Map<String, Object>> paging);
	
	public void searchPaging2(Map<String, Object> param,PageUtil<Map<String, Object>> paging);
}
