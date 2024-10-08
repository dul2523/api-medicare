/*
Navicat MySQL Data Transfer

Source Server         : koneksi01
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : db_tmd_dpbo_2024

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2024-06-21 14:42:08
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `score` int(50) NOT NULL,
  `up` int(50) NOT NULL,
  `down` int(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
