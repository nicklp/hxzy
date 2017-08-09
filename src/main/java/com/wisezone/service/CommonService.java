package com.wisezone.service;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.wisezone.util.PageUtil;

public interface CommonService<T> {

	 
	/**
	 * 新增
	 * @param obj
	 * @return
	 */
	public boolean insert(T obj);
	
	/**
	 * 修改
	 * @param obj
	 * @return
	 */
	public boolean update(T obj);
	
	/**
	 * 根据主键查询
	 * @param CriteriaBuilder
	 * @return
	 */
	public T  findById(int id);
	
	
	 /**
	  * 分页查询的数据
	  * @param param  参 数 
	  * @return
	  */
	public void searchPaging(Map<String, Object> param,PageUtil<T> paging);
	

}
