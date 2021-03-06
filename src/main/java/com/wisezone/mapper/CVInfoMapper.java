package com.wisezone.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.wisezone.entity.CVInfo;
import com.wisezone.util.PageUtil;

public interface CVInfoMapper extends CommonMapper<CVInfo> {
	public List<CVInfo> queryNameAndPhone(Map<String, String> map);
	
	public List<Map<String, Object>> searchPaging1(@Param("param") Map<String, Object> param,@Param("offset") int offset,@Param("limit")int limit);
	
	public int searchPagingCount1(@Param("param") Map<String, Object> param);
	
	public List<Map<String, Object>> searchPaging2(@Param("param") Map<String, Object> param,@Param("offset") int offset,@Param("limit")int limit);
	
	public int searchPagingCount2(@Param("param") Map<String, Object> param);
	
	public List<Map<String, Object>> searchViewPaging(@Param("param") Map<String, Object> param,@Param("inviteId") int inviteId,@Param("offset") int offset,@Param("limit")int limit);
	
	public int searchViewPagingCount(@Param("param") Map<String, Object> param,@Param("inviteId") int inviteId,@Param("role")int role);
}
