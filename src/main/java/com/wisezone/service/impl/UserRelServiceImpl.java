package com.wisezone.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wisezone.entity.UserRel;
import com.wisezone.mapper.UserRelMapper;
import com.wisezone.service.UserRelService;

@Service
public class UserRelServiceImpl extends CommonServiceImpl<UserRel> implements UserRelService {

	private UserRelMapper mapper;

	@Resource(name="userRelMapper")
	public void setMapper(UserRelMapper userRelMapper) {
		this.mapper = userRelMapper;
		super.setCommonMapper(this.mapper);
	}

	@Override
	public boolean insert(Map<String,Object> map) {
		return mapper.insert(map);
	}

	@Override
	public boolean update(Map<String,Object> map) {
		return mapper.update(map);
	}

	@Override
	public Map<String, Integer> getStatistics() {
		return mapper.getStatistics();
	}

	@Override
	public boolean updateCreateDate(Map<String, Object> map) {
		return mapper.updateCreateDate(map);
	}

	@Override
	public Map<String, Integer> getStatisticsByUser(int inviteId) {
		return mapper.getStatisticsByUser(inviteId);
	}
	

}
