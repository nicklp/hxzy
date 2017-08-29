package com.wisezone.entity;

import java.io.Serializable;
import java.sql.Date;

public class CVInfo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/*
	 * `t_id` int(5) NOT NULL,
  `stu_name` varchar(20) NOT NULL COMMENT '面试者姓名',
  `phone` varchar(20) NOT NULL COMMENT '电话',
  `sex` char(2) NOT NULL COMMENT '性别',
  `school` varchar(50) DEFAULT NULL COMMENT '毕业院校',
  `education` int(2) NOT NULL COMMENT '学历（1.高中 2.中专 3.大专 4.本科 5.研究生 9.未知）',
  `major` varchar(50) DEFAULT NULL COMMENT '所学专业',
  `job` varchar(50) DEFAULT NULL COMMENT '应聘岗位',
  `msg_from` varchar(50) NOT NULL COMMENT '信息来源',
  `td_type` varchar(50) NOT NULL COMMENT '投递分类',
  `intention` varchar(200) DEFAULT NULL COMMENT '意向分析',
  `cv_details` longtext COMMENT '富文本框',
  `create_date` date NOT NULL COMMENT '录入日期',
	 * 
	 */
	private Integer tId;
	private String stuName;
	private String phone;
	private String sex;
	private String school;
	private String education;
	private String major;
	private String job;
	private String msgFrom;
	private String tdType;
	private String intention;
	private String details;
	private Date createDate;
	public Integer gettId() {
		return tId;
	}
	public void settId(Integer tId) {
		this.tId = tId;
	}
	public String getStuName() {
		return stuName;
	}
	public void setStuName(String stuName) {
		this.stuName = stuName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getMsgFrom() {
		return msgFrom;
	}
	public void setMsgFrom(String msgFrom) {
		this.msgFrom = msgFrom;
	}
	public String getTdType() {
		return tdType;
	}
	public void setTdType(String tdType) {
		this.tdType = tdType;
	}
	public String getIntention() {
		return intention;
	}
	public void setIntention(String intention) {
		this.intention = intention;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public CVInfo(Integer tId, String stuName, String phone, String sex, String school, String education, String major,
			String job, String msgFrom, String tdType, String intention, String details, Date createDate) {
		super();
		this.tId = tId;
		this.stuName = stuName;
		this.phone = phone;
		this.sex = sex;
		this.school = school;
		this.education = education;
		this.major = major;
		this.job = job;
		this.msgFrom = msgFrom;
		this.tdType = tdType;
		this.intention = intention;
		this.details = details;
		this.createDate = createDate;
	}
	public CVInfo() {
		super();
	}
	
}
