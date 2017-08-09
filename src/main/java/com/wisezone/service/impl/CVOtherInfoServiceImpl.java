package com.wisezone.service.impl;

import javax.annotation.Resource;

import com.wisezone.entity.CVOtherInfo;
import com.wisezone.mapper.CVOtherInfoMapper;
import com.wisezone.service.CVOtherInfoService;

public class CVOtherInfoServiceImpl extends CommonServiceImpl<CVOtherInfo> implements CVOtherInfoService {

	private CVOtherInfoMapper mapper;

	@Resource(name="CVOtherInfoMapper")
	public void setMapper(CVOtherInfoMapper mapper) {
		this.mapper = mapper;
		super.setCommonMapper(this.mapper);
	}

}
