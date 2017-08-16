package com.wisezone.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wisezone.entity.CVInfo;
import com.wisezone.mapper.CVInfoMapper;
import com.wisezone.service.CVInfoService;

@Service
public class CVInfoServiceImpl extends CommonServiceImpl<CVInfo> implements CVInfoService{

	private CVInfoMapper mapper;

	@Resource(name="CVInfoMapper")
	public void setMapper(CVInfoMapper mapper) {
		this.mapper = mapper;
		super.setCommonMapper(this.mapper);
	}

	@Override
	public List<CVInfo> queryNameAndPhone(Map<String, String> map) {
		return mapper.queryNameAndPhone(map);
	}
	
	
}
