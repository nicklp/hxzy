package com.wisezone.mapper;

import java.util.List;
import java.util.Map;

import com.wisezone.entity.UserInfo;

public interface UserInfoMapper extends CommonMapper<UserInfo> {
 
	public UserInfo login(Map<String,String> map);
	
	public List<UserInfo> getUserInfo();
}
