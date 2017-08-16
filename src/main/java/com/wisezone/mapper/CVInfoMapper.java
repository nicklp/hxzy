package com.wisezone.mapper;

import java.util.List;
import java.util.Map;

import com.wisezone.entity.CVInfo;

public interface CVInfoMapper extends CommonMapper<CVInfo> {
	public List<CVInfo> queryNameAndPhone(Map<String, String> map);
}
