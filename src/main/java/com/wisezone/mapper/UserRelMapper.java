package com.wisezone.mapper;

import java.util.Map;

import com.wisezone.entity.UserRel;

public interface UserRelMapper extends CommonMapper<UserRel> {
	public boolean insert(Map<String,Object> map);
	
	public boolean update(Map<String,Object> map);
	
	public Map<String, Integer> getStatistics();
	
	public boolean updateCreateDate(Map<String,Object> map);
}
