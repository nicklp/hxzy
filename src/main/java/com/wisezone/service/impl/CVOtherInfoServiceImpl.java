package com.wisezone.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wisezone.entity.CVOtherInfo;
import com.wisezone.mapper.CVOtherInfoMapper;
import com.wisezone.service.CVOtherInfoService;

@Service
public class CVOtherInfoServiceImpl extends CommonServiceImpl<CVOtherInfo> implements CVOtherInfoService {

	private CVOtherInfoMapper mapper;

	@Resource(name="CVOtherInfoMapper")
	public void setMapper(CVOtherInfoMapper mapper) {
		this.mapper = mapper;
		super.setCommonMapper(this.mapper);
	}

}
