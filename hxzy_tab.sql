/*
Navicat MySQL Data Transfer

Source Server         : java20
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : hxzy

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2017-09-15 17:37:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cv_info`
-- ----------------------------
DROP TABLE IF EXISTS `cv_info`;
CREATE TABLE `cv_info` (
`t_id`  int(5) NOT NULL ,
`stu_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '面试者姓名' ,
`phone`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话' ,
`sex`  char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '性别' ,
`school`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '毕业院校' ,
`education`  int(2) NOT NULL COMMENT '学历（1.研究生 2.本科 3.大专 4.高中 5.中专 9.未知）' ,
`major`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所学专业' ,
`job`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应聘岗位' ,
`msg_from`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '信息来源' ,
`td_type`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投递分类' ,
`intention`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '意向分析' ,
`cv_details`  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '富文本框' ,
`create_date`  date NOT NULL COMMENT '录入日期' ,
PRIMARY KEY (`t_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='简历信息表'

;

-- ----------------------------
-- Table structure for `cv_other_info`
-- ----------------------------
DROP TABLE IF EXISTS `cv_other_info`;
CREATE TABLE `cv_other_info` (
`t_id`  int(5) NOT NULL ,
`t_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题' ,
`t_type`  int(1) NOT NULL COMMENT '机构类型(1.毕业院校  2.简历来源  3.投递分类  9.其他)' ,
PRIMARY KEY (`t_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='毕业院校\r\n，简历来源网站\r\n，投递分类（网上搜索，电话咨询，口碑,主动投递 其他）'

;

-- ----------------------------
-- Table structure for `user_cv_rel`
-- ----------------------------
DROP TABLE IF EXISTS `user_cv_rel`;
CREATE TABLE `user_cv_rel` (
`t_id`  int(11) NOT NULL ,
`user_id`  int(11) NULL DEFAULT NULL COMMENT '咨询顾问' ,
`invite_id`  int(11) NULL DEFAULT NULL COMMENT '市场助理' ,
`stu_id`  int(11) NOT NULL COMMENT '面试人' ,
`visit_date`  date NULL DEFAULT NULL COMMENT '上门日期' ,
`pre_pay_date`  date NULL DEFAULT NULL COMMENT '预付费日期' ,
`pre_pay`  double(5,2) NULL DEFAULT NULL COMMENT '预付费金额' ,
`pay_date`  date NULL DEFAULT NULL COMMENT '缴费日期' ,
`pay`  double(7,2) NULL DEFAULT NULL COMMENT '缴费金额' ,
`pay_type`  int(2) NULL DEFAULT NULL COMMENT ' 缴费类型(1.缴费 2.预付费 3.退费 4.一次性付清 5.分期 6.宜信 7.信用卡)' ,
`record_create_date`  date NULL DEFAULT NULL COMMENT '本次记录产生时间' ,
`last_modify_date`  date NULL DEFAULT NULL COMMENT '本次记录最后一次修改时间' ,
`last_modify_person`  int(11) NULL DEFAULT NULL COMMENT '修改人' ,
PRIMARY KEY (`t_id`),
FOREIGN KEY (`user_id`) REFERENCES `user_info` (`t_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`last_modify_person`) REFERENCES `user_info` (`t_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (`stu_id`) REFERENCES `cv_info` (`t_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='咨询师与面试学生关系记录表'

;

-- ----------------------------
-- Table structure for `user_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
`t_id`  int(5) NOT NULL ,
`login_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '咨询顾问名称' ,
`login_pwd`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`create_time`  date NULL DEFAULT NULL ,
`last_login_time`  date NULL DEFAULT NULL COMMENT '最后一次登录时间' ,
`state`  int(1) NOT NULL COMMENT '用户状态（1.正常 2.禁止登陆 3.离职）' ,
`role`  int(1) NOT NULL COMMENT '1.市场专员 2.市场助理 3.咨询顾问 9.超级管理员' ,
`user_name`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`t_id`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='用户表'

;

-- ----------------------------
-- Indexes structure for table user_cv_rel
-- ----------------------------
CREATE INDEX `FK_USERSTUREL_cv` ON `user_cv_rel`(`user_id`) USING BTREE ;
CREATE INDEX `FK_USERSTUREL_user` ON `user_cv_rel`(`stu_id`) USING BTREE ;
CREATE INDEX `FK_USERSTUREL_last` ON `user_cv_rel`(`last_modify_person`) USING BTREE ;
