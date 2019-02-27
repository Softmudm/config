/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : frame

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 27/02/2019 17:15:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog`  (
  `blog_id` int(9) NOT NULL AUTO_INCREMENT COMMENT '博客Id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标题',
  `kinds_id` int(9) DEFAULT NULL COMMENT '分类',
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '内容',
  `user_id` int(20) DEFAULT NULL COMMENT '作者',
  PRIMARY KEY (`blog_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES (1, 'test', 1, '阿斯达司法所艾丝凡艾丝凡艾丝凡阿斯阿斯发顺丰啊司法是否啊阿斯阿斯阿斯发送阿斯发顺丰阿斯阿斯蒂芬第三个岁的法国反对反对感觉的分开过豆腐干地方各级地方kg年艰苦地方不能', 1);
INSERT INTO `blog` VALUES (2, 'test1', 2, 'asdasdfafasfasd', 3);
INSERT INTO `blog` VALUES (3, '哈哈哈', NULL, '阿<i>斯发</i>发<b>的发</b>', 3);
INSERT INTO `blog` VALUES (4, '哈哈哈', NULL, '阿<i>斯发</i>发<b>的发</b>', 3);
INSERT INTO `blog` VALUES (5, '这是标题', 0, '<font size=\"5\">我是</font><div><font size=\"1\"><b>博客</b></font></div><div><font size=\"5\">主体</font></div>', 3);
INSERT INTO `blog` VALUES (6, '这是标题', 0, '<font size=\"5\">我是</font><div><font size=\"1\"><b>博客</b></font></div><div><font size=\"5\">主体</font></div>', 3);
INSERT INTO `blog` VALUES (7, '这是标题', 999, '<font size=\"5\">我是</font><div><font size=\"1\"><b>博客</b></font></div><div><font size=\"5\">主体</font></div>', 3);
INSERT INTO `blog` VALUES (8, '这是标题', 999, '<font size=\"5\">我是</font><div><font size=\"1\"><b>博客</b></font></div><div><font size=\"5\">主体</font></div>', 3);
INSERT INTO `blog` VALUES (9, '这是标题', 999, '<font size=\"5\">我是</font><div><font size=\"1\"><b>博客</b></font></div><div><font size=\"5\">主体</font></div>', 3);
INSERT INTO `blog` VALUES (10, '问问', 22, '阿迪瓦夫', 3);
INSERT INTO `blog` VALUES (11, '问问', 22, '阿迪瓦夫', 3);
INSERT INTO `blog` VALUES (12, '问问', 22, '阿迪瓦夫', 3);
INSERT INTO `blog` VALUES (13, '11', 11, '\n    Go ahead…1111', 3);
INSERT INTO `blog` VALUES (14, '11', 11, '\n    Go ahead…1111', 3);
INSERT INTO `blog` VALUES (15, '1', 1, '1', 3);
INSERT INTO `blog` VALUES (16, '1', 1, '\n    Go ahead…1', 3);
INSERT INTO `blog` VALUES (17, '1', 1, '\n    Go ahead…1', 3);
INSERT INTO `blog` VALUES (18, '22', 22, '\n    Go ahead…\n', 3);
INSERT INTO `blog` VALUES (19, '33', 32, '\n    Go ahead…33', 3);
INSERT INTO `blog` VALUES (20, '5', 5, '\n    Go ahead…5', 3);
INSERT INTO `blog` VALUES (21, '9', 9, '\n    Go ahead…9999', 1);
INSERT INTO `blog` VALUES (22, '888', 888, '\n    8888', 1);

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `permission_id` int(20) NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`permission_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, 'admin');
INSERT INTO `permission` VALUES (2, 'user');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` int(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '超级管理员');
INSERT INTO `role` VALUES (2, '普通用户');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `role_id` int(20) NOT NULL,
  `permission_id` int(20) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES (1, 1);
INSERT INTO `role_permission` VALUES (2, 2);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `account` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '王鑫', '48945CBF76A399FFEEC5555B6BC375A2', 'admin');
INSERT INTO `user` VALUES (3, 'test', 'C81E728D9D4C2F636F067F89CC14862C', '2');
INSERT INTO `user` VALUES (87, '我', 'C4CA4238A0B923820DCC509A6F75849B', '1');
INSERT INTO `user` VALUES (88, '3', '48945CBF76A399FFEEC5555B6BC375A2', '3');
INSERT INTO `user` VALUES (89, '6', '1679091C5A880FAF6FB5E6087EB1B2DC', '6');
INSERT INTO `user` VALUES (90, '7', '8F14E45FCEEA167A5A36DEDD4BEA2543', '7');
INSERT INTO `user` VALUES (91, '8', 'C9F0F895FB98AB9159F51FD0297E236D', '8');
INSERT INTO `user` VALUES (93, '9', '45C48CCE2E2D7FBDEA1AFC51C7C6AD26', '9');
INSERT INTO `user` VALUES (96, '额', 'E1671797C52E15F763380B45E841EC32', 'e');
INSERT INTO `user` VALUES (98, '12', 'C20AD4D76FE97759AA27A0C99BFF6710', '12');
INSERT INTO `user` VALUES (99, '88', '2A38A4A9316C49E5A833517C45D31070', '88');
INSERT INTO `user` VALUES (100, '99', 'AC627AB1CCBDB62EC96E702F07F6425B', '99');
INSERT INTO `user` VALUES (101, '77', '28DD2C7955CE926456240B2FF0100BDE', '77');
INSERT INTO `user` VALUES (102, '66', '3295C76ACBF4CAAED33C36B1B5FC2CB1', '66');
INSERT INTO `user` VALUES (103, '55', 'B53B3A3D6AB90CE0268229151C9BDE11', '55');
INSERT INTO `user` VALUES (104, '3333', '2BE9BD7A3434F7038CA27D1918DE58BD', '3333');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `user_id` int(11) NOT NULL DEFAULT 0,
  `role_id` int(11) NOT NULL DEFAULT 0
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1);
INSERT INTO `user_role` VALUES (3, 2);

SET FOREIGN_KEY_CHECKS = 1;
