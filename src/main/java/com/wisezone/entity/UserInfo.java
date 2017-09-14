package com.wisezone.entity;

import java.io.Serializable;
import java.sql.Date;

public class UserInfo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/*
	 * `t_id` int(5) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(20) NOT NULL COMMENT '咨询顾问名称',
  `login_pwd` varchar(20) NOT NULL,
  `create_time` date DEFAULT NULL,
  `last_login_time` date DEFAULT NULL COMMENT '最后一次登录时间',
  `state` int(1) NOT NULL COMMENT '用户状态（1.正常 2.禁止登陆 3.删除）',
  `role` int(1) NOT NULL COMMENT '1.普通管理员 2.员工 9.超级管理员',
	 */
	private Integer tId;
	private String loginName;
	private String loginPwd;
	private Date createTime;
	private Date lastLoginTime;
	private Integer state;
	private Integer role;
	public Integer gettId() {
		return tId;
	}
	public void settId(Integer tId) {
		this.tId = tId;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getLoginPwd() {
		return loginPwd;
	}
	public void setLoginPwd(String loginPwd) {
		this.loginPwd = loginPwd;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getLastLoginTime() {
		return lastLoginTime;
	}
	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Integer getRole() {
		return role;
	}
	public void setRole(Integer role) {
		this.role = role;
	}
	public UserInfo(Integer tId, String loginName, String loginPwd, Integer state,Integer role) {
		super();
		this.tId = tId;
		this.loginName = loginName;
		this.loginPwd = loginPwd;
		this.state = state;
		this.role = role;
	}
	public UserInfo() {
		super();
	}
	
}
