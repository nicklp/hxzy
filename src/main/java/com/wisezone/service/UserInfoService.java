package com.wisezone.service;

import java.util.Map;

import com.wisezone.entity.UserInfo;

public interface UserInfoService extends CommonService<UserInfo> {
	public UserInfo login(Map<String,String> map);
}
