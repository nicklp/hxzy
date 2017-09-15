package com.wisezone.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.wisezone.entity.UserInfo;

public interface UserInfoMapper extends CommonMapper<UserInfo> {
 
	public UserInfo login(Map<String,String> map);
	
	public List<UserInfo> getUserInfo(int role);
	
	public List<Map<String, Object>> yj_sort(@Param("dateMonth") String dateMonth);
	
	public List<Map<String, Object>> searchYear(@Param("year") String year);
	
	public List<UserInfo> validateLoginName(Map<String, String> map);
}
