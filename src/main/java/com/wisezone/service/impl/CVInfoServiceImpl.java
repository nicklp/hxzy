package com.wisezone.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wisezone.entity.CVInfo;
import com.wisezone.mapper.CVInfoMapper;
import com.wisezone.service.CVInfoService;
import com.wisezone.util.PageUtil;

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

	@Override
	public void searchPaging2(Map<String, Object> param, PageUtil<Map<String, Object>> paging) {
		paging.setData(mapper.searchPaging2(param, paging.getBegin(), paging.getSize()));
		paging.setTotalRecords(mapper.searchPagingCount2(param));
	}

	@Override
	public void searchPaging1(Map<String, Object> param, PageUtil<Map<String, Object>> paging) {
		paging.setData(mapper.searchPaging1(param, paging.getBegin(), paging.getSize()));
		paging.setTotalRecords(mapper.searchPagingCount1(param));
	}
	
}
