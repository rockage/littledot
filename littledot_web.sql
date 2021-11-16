/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : littledot_web

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2021-11-16 18:21:04
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
  `img` varchar(128) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL,
  `price` decimal(10,0) unsigned zerofill DEFAULT NULL,
  `ttm` date DEFAULT NULL,
  `position` tinyint(3) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('1', 'MK2', 'MK-2 Headphone Amp.', '001', '/static/products/mk2/main.jpg', 'A classic entry-level pure tubes amp.', '0000000080', '2008-08-08', '001');
INSERT INTO `products` VALUES ('2', 'LD1+', 'LD1+ Headphone Amp.', '002', '/static/products/ld1+/main.jpg', 'A classic entry-level hybrid tubes amp.', '0000000080', '2008-08-08', '002');
INSERT INTO `products` VALUES ('3', 'MK3', 'MK-3 Headphone Amp.', '001', '/static/products/mk3/main.jpg', 'A classic entry-level pure tubes amp.', '0000000090', '2008-08-08', '003');
INSERT INTO `products` VALUES ('4', 'LD-H1', 'LD-H1 Headphone Amp.', '002', '/static/products/ldh1/main.jpg', 'A classic entry-level hibrid tubes amp.', '0000000150', '2017-08-08', '004');
