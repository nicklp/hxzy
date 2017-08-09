package com.wisezone.service.impl;

import javax.annotation.Resource;

import com.wisezone.entity.UserCVRel;
import com.wisezone.mapper.UserCVRelMapper;
import com.wisezone.service.UserCVRelService;

public class UserCVRelServiceImpl extends CommonServiceImpl<UserCVRel> implements UserCVRelService {

	private UserCVRelMapper mapper;

	@Resource(name="UserCVRelMapper")
	public void setMapper(UserCVRelMapper mapper) {
		this.mapper = mapper;
		super.setCommonMapper(this.mapper);
	}
	

}
