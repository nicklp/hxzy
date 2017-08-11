package com.wisezone.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

/**
 * 公共dao类
 * @author Administrator
 *
 * @param <T>
 */
public interface CommonMapper<T> {
   
	/**
	 * 新增
	 * @param obj
	 * @return
	 */
	public int insert(T obj);
	
	/**
	 * 修改
	 * @param obj
	 * @return
	 */
	public int update(T obj);
	 
	/**
	 * 根据ID获取数据
	 * @param id
	 * @return
	 */
	public T findById(@Param("tId")int id);
	
	 /**
	  * 分页查询的数据
	  * @param param  参 数
	  * @param offset  排除前几笔 
	  * @param limit   取几笔
	  * @return
	  */
	public List<T> searchPaging(@Param("param") Map<String, Object> param,@Param("offset") int offset,@Param("limit")int limit);
	
	/**
	 * 分页查询总记录数
	 * @param param
	 * @return
	 */
	public int searchPagingCount(@Param("param") Map<String, Object> param);
	
	
 
	
 
}
