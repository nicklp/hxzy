package com.wisezone.service;

import java.util.List;
import java.util.Map;

import com.wisezone.entity.UserInfo;

public interface UserInfoService extends CommonService<UserInfo> {
	public UserInfo login(Map<String,String> map);
	public List<UserInfo> getUserInfo(int role);
	public List<Map<String, Object>> yj_sort(String dateMonth);
	public List<Map<String, Object>> searchYear(String year);
}
