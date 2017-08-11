package com.wisezone.service;


import java.util.List;
import com.wisezone.entity.CVOtherInfo;

public interface CVOtherInfoService extends CommonService<CVOtherInfo> {
	
	public List<CVOtherInfo> queryByType(int tType);
	
	public boolean deleteById(int tId);
}
