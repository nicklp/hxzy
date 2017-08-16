package com.wisezone.service;

import java.util.List;
import java.util.Map;

import com.wisezone.entity.CVInfo;

public interface CVInfoService extends CommonService<CVInfo>{
	public List<CVInfo> queryNameAndPhone(Map<String, String> map);
}
