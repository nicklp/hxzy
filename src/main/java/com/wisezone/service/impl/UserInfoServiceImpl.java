package com.wisezone.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wisezone.entity.UserInfo;
import com.wisezone.mapper.UserInfoMapper;
import com.wisezone.service.UserInfoService;

@Service
public class UserInfoServiceImpl extends CommonServiceImpl<UserInfo> implements
		UserInfoService {

	private UserInfoMapper mapper;

	@Resource(name="userInfoMapper")
	public void setUserInfoMapper(UserInfoMapper userInfoMapper) {
		this.mapper = userInfoMapper;
		super.setCommonMapper(this.mapper);
	}

	@Override
	public UserInfo login(Map<String, String> map) {
		return mapper.login(map);
	}

	@Override
	public List<UserInfo> getUserInfo(int role) {
		return mapper.getUserInfo(role);
	}

	@Override
	public List<Map<String, Object>> yj_sort(String dateMonth) {
		return mapper.yj_sort(dateMonth);
	}

	@Override
	public List<Map<String, Object>> searchYear(String year) {
		return mapper.searchYear(year);
	}

	@Override
	public List<UserInfo> validateLoginName(Map<String, String> map) {
		return mapper.validateLoginName(map);
	}
 

}
