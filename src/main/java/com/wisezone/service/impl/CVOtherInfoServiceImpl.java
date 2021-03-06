package com.wisezone.service.impl;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
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

	@Override
	public List<CVOtherInfo> queryByType(int tType) {
		return this.mapper.queryByType(tType);
	}

	@Override
	public boolean deleteById(int tId) {
		return this.mapper.deleteById(tId);
	}

	@Override
	public List<Map<String, Object>> searchMsgFromCount(Map<String, Object> param) {
		return mapper.searchMsgFromCount(param);
	}

	
}
