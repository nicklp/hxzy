package com.wisezone.service;

import java.util.Map;

import com.wisezone.entity.UserRel;

public interface UserRelService extends CommonService<UserRel> {

	public boolean insert(Map<String,Object> map);
	
	public boolean update(Map<String,Object> map);
	
	public Map<String, Integer> getStatistics();
}
