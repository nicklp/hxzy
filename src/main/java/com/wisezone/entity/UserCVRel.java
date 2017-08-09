package com.wisezone.entity;

import java.io.Serializable;
import java.sql.Date;

public class UserCVRel implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/*
	 * `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '咨询顾问',
  `stu_id` int(11) NOT NULL COMMENT '面试人',
  `visit_date` date DEFAULT NULL COMMENT '上门日期',
  `pre_pay_date` date DEFAULT NULL COMMENT '预付费日期',
  `pre_pay` double(5,2) DEFAULT NULL COMMENT '预付费金额',
  `pay_date` date DEFAULT NULL COMMENT '缴费日期',
  `pay` double(5,2) DEFAULT NULL COMMENT '缴费金额',
  `pay_type` int(2) DEFAULT NULL COMMENT ' 缴费类型(1.缴费 2.预付费 3.退费 4.一次性付清 5.分期 6.宜信 7.信用卡)',
  `record_create_date` date DEFAULT NULL COMMENT '本次记录产生时间',
  `last_modify_date` date DEFAULT NULL COMMENT '本次记录最后一次修改时间',
  `last_modify_person` int(11) DEFAULT NULL COMMENT '修改人',
	 */
	private Integer tId;
	private UserInfo userInfo;
	private CVInfo cvInfo;
	private Date visitDate;
	private Date prePayDate;
	private double prePay;
	private Date payDate;
	private double pay;
	private Integer payType;
	private Date recordCreateDate;
	private Date lastModifyDate;
	private UserInfo lastModifyPerson;
	public Integer gettId() {
		return tId;
	}
	public void settId(Integer tId) {
		this.tId = tId;
	}
	public UserInfo getUserInfo() {
		return userInfo;
	}
	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}
	public CVInfo getCvInfo() {
		return cvInfo;
	}
	public void setCvInfo(CVInfo cvInfo) {
		this.cvInfo = cvInfo;
	}
	public Date getVisitDate() {
		return visitDate;
	}
	public void setVisitDate(Date visitDate) {
		this.visitDate = visitDate;
	}
	public Date getPrePayDate() {
		return prePayDate;
	}
	public void setPrePayDate(Date prePayDate) {
		this.prePayDate = prePayDate;
	}
	public double getPrePay() {
		return prePay;
	}
	public void setPrePay(double prePay) {
		this.prePay = prePay;
	}
	public Date getPayDate() {
		return payDate;
	}
	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}
	public double getPay() {
		return pay;
	}
	public void setPay(double pay) {
		this.pay = pay;
	}
	public Integer getPayType() {
		return payType;
	}
	public void setPayType(Integer payType) {
		this.payType = payType;
	}
	public Date getRecordCreateDate() {
		return recordCreateDate;
	}
	public void setRecordCreateDate(Date recordCreateDate) {
		this.recordCreateDate = recordCreateDate;
	}
	public Date getLastModifyDate() {
		return lastModifyDate;
	}
	public void setLastModifyDate(Date lastModifyDate) {
		this.lastModifyDate = lastModifyDate;
	}
	public UserInfo getLastModifyPerson() {
		return lastModifyPerson;
	}
	public void setLastModifyPerson(UserInfo lastModifyPerson) {
		this.lastModifyPerson = lastModifyPerson;
	}
	
}
