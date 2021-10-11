/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : httprequest

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 21/09/2021 15:13:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for class_user
-- ----------------------------
DROP TABLE IF EXISTS `class_user`;
CREATE TABLE `class_user`  (
  `classId` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userId` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class_user
-- ----------------------------
INSERT INTO `class_user` VALUES ('18104351', '1');
INSERT INTO `class_user` VALUES ('18104222', '2');
INSERT INTO `class_user` VALUES ('18104032', '3');
INSERT INTO `class_user` VALUES ('18104222', '5');
INSERT INTO `class_user` VALUES ('18104351', 'teacher');
INSERT INTO `class_user` VALUES ('18104222', 'teacher');
INSERT INTO `class_user` VALUES ('18104222', 'teacher2');

-- ----------------------------
-- Table structure for classinfo
-- ----------------------------
DROP TABLE IF EXISTS `classinfo`;
CREATE TABLE `classinfo`  (
  `classId` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `className` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of classinfo
-- ----------------------------
INSERT INTO `classinfo` VALUES ('18104351', '网络工程');
INSERT INTO `classinfo` VALUES ('18104222', '软件工程');
INSERT INTO `classinfo` VALUES ('18104032', '计算机科学与技术');
INSERT INTO `classinfo` VALUES ('18104034', '卓越计划软工');

-- ----------------------------
-- Table structure for college
-- ----------------------------
DROP TABLE IF EXISTS `college`;
CREATE TABLE `college`  (
  `collegeName` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `collegeCreateDate` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of college
-- ----------------------------
INSERT INTO `college` VALUES ('计算机学院', '1997-11-22');

-- ----------------------------
-- Table structure for college_class
-- ----------------------------
DROP TABLE IF EXISTS `college_class`;
CREATE TABLE `college_class`  (
  `collegeName` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `classId` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`collegeName`, `classId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of college_class
-- ----------------------------
INSERT INTO `college_class` VALUES ('计算机学院', '18104351');

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login`  (
  `uname` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `upwd` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO `login` VALUES ('1', 'c4ca4238a0b923820dcc509a6f75849b', 'student');
INSERT INTO `login` VALUES ('2', 'c81e728d9d4c2f636f067f89cc14862c', 'student');
INSERT INTO `login` VALUES ('3', 'eccbc87e4b5ce2fe28308fd9f2a7baf3', 'student');
INSERT INTO `login` VALUES ('5', 'e4da3b7fbbce2345d7772b0674a318d5', 'student');
INSERT INTO `login` VALUES ('admin', 'c4ca4238a0b923820dcc509a6f75849b', 'admin');
INSERT INTO `login` VALUES ('teacher', 'c4ca4238a0b923820dcc509a6f75849b', 'teacher');
INSERT INTO `login` VALUES ('teacher2', 'c81e728d9d4c2f636f067f89cc14862c', 'teacher');
INSERT INTO `login` VALUES ('teacher3', 'eccbc87e4b5ce2fe28308fd9f2a7baf3', 'teacher');

-- ----------------------------
-- Table structure for reportinfo
-- ----------------------------
DROP TABLE IF EXISTS `reportinfo`;
CREATE TABLE `reportinfo`  (
  `reportDate` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `realReportDate` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bodyTemperature` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isConfirm` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isArea` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uameId` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reportinfo
-- ----------------------------
INSERT INTO `reportinfo` VALUES ('2021-09-18', '2021-09-18 21:46', '36.5', '否', '否', '上海市', '2');
INSERT INTO `reportinfo` VALUES ('2021-09-19', '2021-09-19 14:05', '36.5', '否', '否', '上海市', '5');
INSERT INTO `reportinfo` VALUES ('2021-09-19', '2021-09-19 14:05', '36.5', '否', '否', '上海市', 'teacher');
INSERT INTO `reportinfo` VALUES ('2021-09-02', '2021-09-19 18:54', '36.5', '否', '否', '上海市', 'teacher');
INSERT INTO `reportinfo` VALUES ('2021-09-19', '2021-09-19 23:32', '36.5', '否', '否', '上海市', '3');
INSERT INTO `reportinfo` VALUES ('2021-09-19', '2021-09-19 23:33', '36.5', '否', '否', '上海市', 'teacher2');
INSERT INTO `reportinfo` VALUES ('2021-09-19', '2021-09-19 23:34', '36.5', '否', '否', '上海市', '2');
INSERT INTO `reportinfo` VALUES ('2021-09-20', '2021-09-20 00:09', '36.5', '否', '否', '上海市', '3');
INSERT INTO `reportinfo` VALUES ('2021-09-20', '2021-09-20 00:11', '36.5', '否', '否', '上海市', '5');
INSERT INTO `reportinfo` VALUES ('2021-09-20', '2021-09-20 00:12', '36.5', '否', '否', '上海市', 'teacher');
INSERT INTO `reportinfo` VALUES ('2021-09-15', '2021-09-20 00:16', '36.5', '否', '是', '上海市', '5');
INSERT INTO `reportinfo` VALUES ('2021-09-20', '2021-09-20 01:34', '36.5', '否', '否', '上海市', '2');
INSERT INTO `reportinfo` VALUES ('2021-09-20', '2021-09-20 01:35', '36.5', '否', '否', '上海市', 'teacher2');
INSERT INTO `reportinfo` VALUES ('2021-09-20', '2021-09-20 16:55', '36.5', '否', '否', '上海市', 'teacher3');
INSERT INTO `reportinfo` VALUES ('2021-09-20', '2021-09-20 16:57', '36.5', '否', '否', '上海市', '1');
INSERT INTO `reportinfo` VALUES ('2021-09-13', '2021-09-20 18:31', '36.5', '否', '否', '上海市', '1');
INSERT INTO `reportinfo` VALUES ('2021-09-21', '2021-09-21 00:13', '36.5', '否', '否', '上海市', 'teacher');

-- ----------------------------
-- Table structure for userbase
-- ----------------------------
DROP TABLE IF EXISTS `userbase`;
CREATE TABLE `userbase`  (
  `id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `idCardNumber` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userbase
-- ----------------------------
INSERT INTO `userbase` VALUES ('1', '马蓉', '2021-09-17', '1536532129@qq.com', 'sdfasfa', '男', '撒打发', 'student');
INSERT INTO `userbase` VALUES ('2', '马博', '2021-08-31', '2420935619@qq.com', '18295549704', '男', 'sdfsafsafsaf', 'student');
INSERT INTO `userbase` VALUES ('3', '马博', '2021-09-16', '2420935619@qq.com', '18295549704', '男', 'sfaf2342325325324', 'student');
INSERT INTO `userbase` VALUES ('5', '账单', '2021-09-16', '234234324243243', '23424242', '男', '23424222dgede', 'student');
INSERT INTO `userbase` VALUES ('admin', NULL, NULL, NULL, NULL, NULL, NULL, 'admin');
INSERT INTO `userbase` VALUES ('teacher', 'a打', '2021-09-09', 'asda', 'asd', '男', 'fdgsdsa', 'teacher');
INSERT INTO `userbase` VALUES ('teacher2', 'teacher2', '2021-09-01', '2420935619@qq.com', '18295549704', '女', '23542422re2r', 'teacher');
INSERT INTO `userbase` VALUES ('teacher3', '马博', '2021-09-02', '2420935619@qq.com', '18295549704', '女', 'qweqeqweqw', 'teacher');

-- ----------------------------
-- View structure for adminforstudentinfo
-- ----------------------------
DROP VIEW IF EXISTS `adminforstudentinfo`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `adminforstudentinfo` AS select `reportclassuserbaseinfo`.`id` AS `id`,`reportclassuserbaseinfo`.`name` AS `name`,`reportclassuserbaseinfo`.`phone` AS `phone`,`reportclassuserbaseinfo`.`sex` AS `sex`,`reportclassuserbaseinfo`.`type` AS `type`,max(`reportclassuserbaseinfo`.`reportDate`) AS `reportDate` from `reportclassuserbaseinfo` where (`reportclassuserbaseinfo`.`type` = 'student') group by `reportclassuserbaseinfo`.`id`;

-- ----------------------------
-- View structure for reportclassuserbaseinfo
-- ----------------------------
DROP VIEW IF EXISTS `reportclassuserbaseinfo`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `reportclassuserbaseinfo` AS select `login`.`uname` AS `id`,`userbase`.`name` AS `name`,`userbase`.`birthday` AS `birthday`,`userbase`.`email` AS `email`,`userbase`.`phone` AS `phone`,`userbase`.`sex` AS `sex`,`userbase`.`idCardNumber` AS `idCardNumber`,`login`.`type` AS `type`,`class_user`.`classId` AS `classId`,`reportinfo`.`reportDate` AS `reportDate`,`reportinfo`.`realReportDate` AS `realReportDate`,`reportinfo`.`bodyTemperature` AS `bodyTemperature`,`reportinfo`.`isConfirm` AS `isConfirm`,`reportinfo`.`isArea` AS `isArea`,`reportinfo`.`address` AS `address` from (((`login` left join `class_user` on((`login`.`uname` = `class_user`.`userId`))) left join `userbase` on((`login`.`uname` = `userbase`.`id`))) left join `reportinfo` on((`reportinfo`.`uameId` = `login`.`uname`))) where (`login`.`type` <> 'admin');

SET FOREIGN_KEY_CHECKS = 1;
