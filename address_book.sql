/*
SCRIPT DATABASE ADDRESS_BOOK

Source Server         : LOCALHOST
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : address_book

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2015-01-13 17:00:05

CREATE BY: Edgar Iván Avila Garrido

*/

-- <--></-->--------------------------
-- Create Database
-- <-------></------->---------------------
DROP DATABASE IF EXISTS address_book;
CREATE DATABASE address_book;
USE address_book;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for category_phones
-- ----------------------------
DROP TABLE IF EXISTS `category_phones`;
CREATE TABLE `category_phones` (
  `id_category_phone` int(255) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_category_phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category_phones
-- ----------------------------
INSERT INTO `category_phones` VALUES ('1', 'home');
INSERT INTO `category_phones` VALUES ('2', 'mobile');
INSERT INTO `category_phones` VALUES ('3', 'office');
INSERT INTO `category_phones` VALUES ('4', 'fax');

-- ----------------------------
-- Table structure for contacts
-- ----------------------------
DROP TABLE IF EXISTS `contacts`;
CREATE TABLE `contacts` (
  `id_contact` int(255) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_contact`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contacts
-- ----------------------------
INSERT INTO `contacts` VALUES ('1', 'EDGAR IVAN', 'AVILA GARRIDO', 'REAL DE CALACOAYA 7810-3B FRACC. REAL DE SAN FRANCISCO', 'wolfogan@gmail.com');
INSERT INTO `contacts` VALUES ('2', 'CYNTHIA BETSABE', 'DUARTE FRAUSTO', 'COL. NUEVA TIJUANA FRACC. BELLAS ARTES', 'zyntyaduarte@gmail.com');
INSERT INTO `contacts` VALUES ('3', 'UNICE ESPINOZA', 'BASTIDAS', 'CALLE LIMON 7810 COL. CAPISTRANO', 'unice19@hotmail.com');

-- ----------------------------
-- Table structure for links
-- ----------------------------
DROP TABLE IF EXISTS `links`;
CREATE TABLE `links` (
  `id_link` int(255) NOT NULL AUTO_INCREMENT,
  `id_contact` int(255) NOT NULL,
  `social_network` enum('FACEBOOK','TWITTER','LINKEDIN','GITHUB') DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_link`,`id_contact`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of links
-- ----------------------------
INSERT INTO `links` VALUES ('1', '1', 'FACEBOOK', 'http://facebook.com/wolfogan');
INSERT INTO `links` VALUES ('2', '1', 'TWITTER', 'http://twitter.com/wolfogan');
INSERT INTO `links` VALUES ('3', '1', 'GITHUB', 'http://github.com/wolfogan');
INSERT INTO `links` VALUES ('4', '2', 'GITHUB', 'http://github.com/tyntia');
INSERT INTO `links` VALUES ('5', '3', 'GITHUB', 'http://github.com/unice19');
INSERT INTO `links` VALUES ('6', '3', 'FACEBOOK', 'http://facebook.com/unice.espinoza.9');

-- ----------------------------
-- Table structure for phones
-- ----------------------------
DROP TABLE IF EXISTS `phones`;
CREATE TABLE `phones` (
  `id_phone` int(255) NOT NULL AUTO_INCREMENT,
  `id_contact` int(255) NOT NULL,
  `id_category_phone` int(255) DEFAULT NULL,
  `number` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id_phone`,`id_contact`),
  KEY `phones_category_fk` (`id_category_phone`),
  KEY `phones_contacts_fk` (`id_contact`),
  CONSTRAINT `phones_contacts_fk` FOREIGN KEY (`id_contact`) REFERENCES `contacts` (`id_contact`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phones_category_fk` FOREIGN KEY (`id_category_phone`) REFERENCES `category_phones` (`id_category_phone`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of phones
-- ----------------------------
INSERT INTO `phones` VALUES ('1', '1', '1', '6450706');
INSERT INTO `phones` VALUES ('2', '1', '2', '6642650628');
INSERT INTO `phones` VALUES ('3', '1', '3', '2095628');
INSERT INTO `phones` VALUES ('4', '2', '1', '6233987');
INSERT INTO `phones` VALUES ('5', '2', '2', '6641878561');
INSERT INTO `phones` VALUES ('6', '3', '1', '2652987');
INSERT INTO `phones` VALUES ('7', '3', '1', '8456975');
