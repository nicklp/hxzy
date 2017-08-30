package com.wisezone.service.impl;

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
 

}
