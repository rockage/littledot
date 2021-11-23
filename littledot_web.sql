/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : littledot_web

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2021-11-23 20:41:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `products`
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `title` varchar(64) DEFAULT NULL,
  `class` tinyint(3) unsigned zerofill DEFAULT NULL,
  `type` tinyint(3) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL,
  `price` decimal(10,0) unsigned zerofill DEFAULT NULL,
  `ttm` date DEFAULT NULL,
  `position` tinyint(3) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('1', 'MK2', 'MK-2 Headphone Amp.', '001', '1', 'A classic entry-level pure tubes amp.', '0000000080', '2008-08-08', '001');
INSERT INTO `products` VALUES ('2', 'LD1+', 'LD1+ Headphone Amp.', '001', '2', 'A classic entry-level hybrid tubes amp.', '0000000080', '2008-08-08', '002');
INSERT INTO `products` VALUES ('3', 'MK3', 'MK-3 Headphone Amp.', '001', '1', 'A classic entry-level pure tubes amp.', '0000000090', '2008-08-08', '003');
INSERT INTO `products` VALUES ('4', 'LD-H1', 'LD-H1 Headphone Amp.', '001', '2', 'A classic entry-level hibrid tubes amp.', '0000000150', '2017-08-08', '004');
INSERT INTO `products` VALUES ('5', 'LD-Y2', 'Headphone and loudspeaker amplifier', '003', '1', '300B amplifier', '0000000199', '2017-08-08', '005');
INSERT INTO `products` VALUES ('6', 'DAC-7', 'Digital to analog convert', '004', '1', 'ESS9038PRO chip', '0000000192', '2018-08-08', '006');
INSERT INTO `products` VALUES ('7', 'LDP-1000', 'Power regenerator', '005', '1', 'High Performance Voltage Regulators', null, '2018-08-08', '007');
INSERT INTO `products` VALUES ('8', 'CDP-2', 'CD Player', '006', '1', 'cd', '0000000011', '2010-08-08', '008');
INSERT INTO `products` VALUES ('9', 'CU-RAD', 'CU-RAD IEMs', '007', '1', 'ear phone rad', '0000000012', '2020-01-01', '009');
INSERT INTO `products` VALUES ('10', 'LD-ZERO', 'DAC Headphone amp', '001', '1', 'all in one amp', '0000000111', '2021-11-11', '010');
