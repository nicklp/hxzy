package com.wisezone.service;


import java.util.List;
import java.util.Map;

import com.wisezone.entity.CVOtherInfo;

public interface CVOtherInfoService extends CommonService<CVOtherInfo> {
	
	public List<CVOtherInfo> queryByType(int tType);
	
	public boolean deleteById(int tId);
	
	public List<Map<String, Object>> searchMsgFromCount(Map<String, Object> param);
}
