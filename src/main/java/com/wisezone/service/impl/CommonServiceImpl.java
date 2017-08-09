package com.wisezone.service.impl;

import java.util.Map;

import com.wisezone.mapper.CommonMapper;
import com.wisezone.service.CommonService;
import com.wisezone.util.PageUtil;

public abstract class CommonServiceImpl<T> implements CommonService<T> {

	private CommonMapper<T> commonMapper;

	/**
	 * 子类给父类赋值
	 * 
	 * @param commonMapper
	 */
	public void setCommonMapper(CommonMapper<T> commonMapper) {
		this.commonMapper = commonMapper;
	}

	@Override
	public boolean insert(T obj) {
		return this.commonMapper.insert(obj) > 0;
	}

	@Override
	public boolean update(T obj) {

		return this.commonMapper.update(obj) > 0;
	}

	@Override
	public T findById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void searchPaging(Map<String, Object> param, PageUtil<T> paging) {
		paging.setData(this.commonMapper.searchPaging(param, paging.getBegin(),
				paging.getEnd()));
		paging.setTotalRecords(this.commonMapper.searchPagingCount(param));

	}
	
}
