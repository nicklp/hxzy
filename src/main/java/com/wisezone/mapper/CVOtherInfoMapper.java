package com.wisezone.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.wisezone.entity.CVOtherInfo;

public interface CVOtherInfoMapper extends CommonMapper<CVOtherInfo> {

	public List<CVOtherInfo> queryByType(@Param("tType") int tType);
	
	public boolean deleteById(@Param("tId") int tId);
	
	public List<Map<String, Object>> searchMsgFromCount(@Param("param") Map<String, Object> param);
}
