package com.wisezone.entity;

import java.io.Serializable;

public class CVOtherInfo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/*
	 * `t_id` int(5) NOT NULL AUTO_INCREMENT,
  `t_name` varchar(255) NOT NULL COMMENT '标题',
  `t_type` int(1) NOT NULL COMMENT '机构类型(1.毕业院校  2.简历来源  3.投递分类  9.其他)', 
	 */
	private Integer tId;
	private String tName;
	private String tType;
	public Integer gettId() {
		return tId;
	}
	public void settId(Integer tId) {
		this.tId = tId;
	}
	public String gettName() {
		return tName;
	}
	public void settName(String tName) {
		this.tName = tName;
	}
	public String gettType() {
		return tType;
	}
	public void settType(String tType) {
		this.tType = tType;
	}
	public CVOtherInfo(Integer tId, String tName, String tType) {
		super();
		this.tId = tId;
		this.tName = tName;
		this.tType = tType;
	}
	public CVOtherInfo() {
		super();
	}
	
}
