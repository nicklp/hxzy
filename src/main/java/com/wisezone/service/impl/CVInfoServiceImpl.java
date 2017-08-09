package com.wisezone.service.impl;

import javax.annotation.Resource;

import com.wisezone.entity.CVInfo;
import com.wisezone.mapper.CVInfoMapper;
import com.wisezone.service.CVInfoService;

public class CVInfoServiceImpl extends CommonServiceImpl<CVInfo> implements CVInfoService{

	private CVInfoMapper mapper;

	@Resource(name="CVInfoMapper")
	public void setMapper(CVInfoMapper mapper) {
		this.mapper = mapper;
		super.setCommonMapper(this.mapper);
	}
	
	
}
