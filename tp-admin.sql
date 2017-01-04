/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50547
Source Host           : 127.0.0.1:3306
Source Database       : tp-admin

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2017-01-04 10:23:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ta_user
-- ----------------------------
DROP TABLE IF EXISTS `ta_user`;
CREATE TABLE `ta_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(16) DEFAULT NULL COMMENT '账号',
  `mobile` varchar(12) DEFAULT NULL COMMENT '手机号',
  `password` varchar(32) DEFAULT NULL COMMENT '密码',
  `status` int(11) DEFAULT '0' COMMENT '状态 （0禁止 1可用）',
  `create_time` int(11) DEFAULT NULL COMMENT '帐号创建时间',
  `administrator` int(1) DEFAULT '0' COMMENT '是否超级管理员，1是 0否',
  `role_id` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) DEFAULT NULL COMMENT '账户最后更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '软删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of ta_user
-- ----------------------------
INSERT INTO `ta_user` VALUES ('1', '石金融', '13330613321', '4c3c8afaf91b4dd81bcf68ba519fa2f6', '1', '1478252401', '1', '0', '1483422862', null);
INSERT INTO `ta_user` VALUES ('62', '程斌', '15116041105', '4c3c8afaf91b4dd81bcf68ba519fa2f6', '1', '1483423025', '0', '0', '1483423039', '1483423039');
INSERT INTO `ta_user` VALUES ('2', '管理员', '15100000000', '4c3c8afaf91b4dd81bcf68ba519fa2f6', '1', '1482835627', '1', '3', '1483496528', null);

-- ----------------------------
-- Table structure for ta_role
-- ----------------------------
DROP TABLE IF EXISTS `ta_role`;
CREATE TABLE `ta_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of ta_role
-- ----------------------------
INSERT INTO `ta_role` VALUES ('1', '超级管理员', '0', '1', '拥有网站最高管理员权限！', '1329633709', '1329633709');
INSERT INTO `ta_role` VALUES ('2', '测试角色', null, '1', '测试角色', '1482389092', '0');

-- ----------------------------
-- Table structure for ta_login_log
-- ----------------------------
DROP TABLE IF EXISTS `ta_login_log`;
CREATE TABLE `ta_login_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `os` varchar(15) DEFAULT NULL,
  `browser` varchar(30) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=647 DEFAULT CHARSET=utf8 COMMENT='后台操作日志记录';

-- ----------------------------
-- Records of ta_login_log
-- ----------------------------
INSERT INTO `ta_login_log` VALUES ('1', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '登录成功', '1479710208');
INSERT INTO `ta_login_log` VALUES ('2', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '账号管理-编辑成功', '1479710290');
INSERT INTO `ta_login_log` VALUES ('3', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '登录成功', '1479710504');
INSERT INTO `ta_login_log` VALUES ('4', '1', '180.173.20.172', 'Windows NT', 'chrome-56', '登录成功', '1479710571');
INSERT INTO `ta_login_log` VALUES ('5', '1', '124.128.200.253', 'Windows 10', 'chrome-45', '登录成功', '1479710656');
INSERT INTO `ta_login_log` VALUES ('6', '1', '180.173.20.172', 'Windows NT', 'chrome-56', '登录成功', '1479710657');
INSERT INTO `ta_login_log` VALUES ('7', '1', '182.149.168.207', 'Windows 7', 'chrome-53', '登录成功', '1479712373');
INSERT INTO `ta_login_log` VALUES ('8', '1', '14.23.101.244', 'Windows 7', 'chrome-54', '登录成功', '1479712786');
INSERT INTO `ta_login_log` VALUES ('9', '1', '14.23.101.244', 'Windows 7', 'chrome-54', '缓存已更新', '1479713190');
INSERT INTO `ta_login_log` VALUES ('10', '1', '116.30.244.96', 'Windows 7', 'chrome-53', '登录成功', '1479713688');
INSERT INTO `ta_login_log` VALUES ('11', '1', '116.30.244.96', 'Windows 7', 'chrome-53', '账号管理-添加成功', '1479713813');
INSERT INTO `ta_login_log` VALUES ('12', '1', '61.145.59.18', 'Windows 7', 'chrome-49', '登录成功', '1479714491');
INSERT INTO `ta_login_log` VALUES ('13', '1', '124.128.200.253', 'Windows 10', 'chrome-45', '登录成功', '1479714492');
INSERT INTO `ta_login_log` VALUES ('14', '1', '117.40.187.178', 'Windows 7', 'chrome-47', '登录成功', '1479716554');
INSERT INTO `ta_login_log` VALUES ('15', '1', '218.29.222.66', 'unknow', 'chrome-45', '登录成功', '1479716568');
INSERT INTO `ta_login_log` VALUES ('16', '1', '117.40.187.178', 'Windows 7', 'chrome-47', '菜单管理-添加成功', '1479716730');
INSERT INTO `ta_login_log` VALUES ('17', '1', '218.29.222.66', 'unknow', 'chrome-45', '登录成功', '1479716855');
INSERT INTO `ta_login_log` VALUES ('18', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '登录成功', '1479717141');
INSERT INTO `ta_login_log` VALUES ('19', '1', '218.207.196.92', 'Windows 10', 'chrome-49', '登录成功', '1479717471');
INSERT INTO `ta_login_log` VALUES ('20', '1', '202.118.212.136', 'Windows 10', 'chrome-53', '登录成功', '1479721402');
INSERT INTO `ta_login_log` VALUES ('21', '1', '218.17.157.203', 'Windows 7', 'chrome-45', '登录成功', '1479724235');
INSERT INTO `ta_login_log` VALUES ('22', '1', '101.251.0.137', 'Windows 10', 'chrome-54', '登录成功', '1479726508');
INSERT INTO `ta_login_log` VALUES ('23', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '登录成功', '1479727837');
INSERT INTO `ta_login_log` VALUES ('24', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479727867');
INSERT INTO `ta_login_log` VALUES ('25', '1', '140.255.137.109', 'unknow', 'chrome-54', '登录成功', '1479728499');
INSERT INTO `ta_login_log` VALUES ('26', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479728532');
INSERT INTO `ta_login_log` VALUES ('27', '1', '123.139.212.229', 'Windows NT', 'ie-7', '登录成功', '1479728887');
INSERT INTO `ta_login_log` VALUES ('28', '1', '123.139.212.229', 'Windows NT', 'chrome-45', '菜单管理-添加成功', '1479729080');
INSERT INTO `ta_login_log` VALUES ('29', '1', '27.189.220.29', 'Windows 95', 'chrome-50', '登录成功', '1479731535');
INSERT INTO `ta_login_log` VALUES ('30', '1', '123.139.29.222', 'unknow', 'chrome-54', '登录成功', '1479735797');
INSERT INTO `ta_login_log` VALUES ('31', '0', '202.118.212.36', 'Windows 10', 'chrome-53', '登录失败, [username_mobile: 13330613321],[ status: 密码错误！ ],[password: a0dca4d0****************ba444758]', '1479736880');
INSERT INTO `ta_login_log` VALUES ('32', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '登录成功', '1479737068');
INSERT INTO `ta_login_log` VALUES ('33', '1', '118.186.143.112', 'unknow', 'chrome-54', '登录成功', '1479737152');
INSERT INTO `ta_login_log` VALUES ('34', '1', '125.84.189.47', 'Windows 10', 'chrome-53', '登录成功', '1479737257');
INSERT INTO `ta_login_log` VALUES ('35', '1', '111.10.118.126', 'unknow', 'safari-7543', '登录成功', '1479741956');
INSERT INTO `ta_login_log` VALUES ('36', '1', '171.34.214.64', 'Windows 7', 'chrome-50', '登录成功', '1479743816');
INSERT INTO `ta_login_log` VALUES ('37', '1', '111.10.118.126', 'unknow', 'safari-7543', '账号管理-添加成功', '1479744204');
INSERT INTO `ta_login_log` VALUES ('38', '22', '111.10.118.126', 'unknow', 'safari-7543', '登录成功', '1479744252');
INSERT INTO `ta_login_log` VALUES ('39', '1', '14.23.101.244', 'Windows 7', 'chrome-54', '登录成功', '1479774453');
INSERT INTO `ta_login_log` VALUES ('40', '1', '124.128.200.253', 'Windows 10', 'chrome-45', '登录成功', '1479776167');
INSERT INTO `ta_login_log` VALUES ('41', '1', '202.104.122.154', 'Windows 10', 'chrome-54', '登录成功', '1479776991');
INSERT INTO `ta_login_log` VALUES ('42', '1', '202.104.122.154', 'Windows 7', 'chrome-54', '登录成功', '1479777926');
INSERT INTO `ta_login_log` VALUES ('43', '1', '27.191.4.120', 'Windows 7', 'firefox-49', '登录成功', '1479778312');
INSERT INTO `ta_login_log` VALUES ('44', '1', '14.119.122.239', 'Windows 10', 'firefox-49', '登录成功', '1479779368');
INSERT INTO `ta_login_log` VALUES ('45', '1', '14.119.122.239', 'Windows 10', 'firefox-49', '角色管理-编辑成功 ID=2', '1479779424');
INSERT INTO `ta_login_log` VALUES ('46', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '登录成功', '1479779602');
INSERT INTO `ta_login_log` VALUES ('47', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479779733');
INSERT INTO `ta_login_log` VALUES ('48', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479779760');
INSERT INTO `ta_login_log` VALUES ('49', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479779766');
INSERT INTO `ta_login_log` VALUES ('50', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479779795');
INSERT INTO `ta_login_log` VALUES ('51', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479779832');
INSERT INTO `ta_login_log` VALUES ('52', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479779852');
INSERT INTO `ta_login_log` VALUES ('53', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '角色管理-编辑失败 IDS=s:5:\"14,15\";', '1479779859');
INSERT INTO `ta_login_log` VALUES ('54', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479779930');
INSERT INTO `ta_login_log` VALUES ('55', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '菜单管理-添加成功', '1479779989');
INSERT INTO `ta_login_log` VALUES ('56', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479780023');
INSERT INTO `ta_login_log` VALUES ('57', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479780046');
INSERT INTO `ta_login_log` VALUES ('58', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479780078');
INSERT INTO `ta_login_log` VALUES ('59', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479780099');
INSERT INTO `ta_login_log` VALUES ('60', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479780123');
INSERT INTO `ta_login_log` VALUES ('61', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479780136');
INSERT INTO `ta_login_log` VALUES ('62', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479780145');
INSERT INTO `ta_login_log` VALUES ('63', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479780177');
INSERT INTO `ta_login_log` VALUES ('64', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479780189');
INSERT INTO `ta_login_log` VALUES ('65', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479780200');
INSERT INTO `ta_login_log` VALUES ('66', '1', '180.166.212.58', 'Windows NT', 'firefox-49', '登录成功', '1479780284');
INSERT INTO `ta_login_log` VALUES ('67', '1', '202.118.212.136', 'Windows 10', 'chrome-53', '登录成功', '1479780646');
INSERT INTO `ta_login_log` VALUES ('68', '1', '58.19.0.116', 'Windows 7', 'ie-9', '登录成功', '1479780925');
INSERT INTO `ta_login_log` VALUES ('69', '1', '116.22.234.64', 'Windows NT', 'chrome-50', '登录成功', '1479781301');
INSERT INTO `ta_login_log` VALUES ('70', '1', '59.52.62.225', 'Windows 7', 'chrome-52', '登录成功', '1479781715');
INSERT INTO `ta_login_log` VALUES ('71', '1', '218.19.214.159', 'Windows 10', 'chrome-54', '登录成功', '1479782144');
INSERT INTO `ta_login_log` VALUES ('72', '1', '202.118.212.167', 'unknow', 'chrome-50', '登录成功', '1479782689');
INSERT INTO `ta_login_log` VALUES ('73', '1', '14.23.101.244', 'Windows 7', 'chrome-54', '登录成功', '1479783385');
INSERT INTO `ta_login_log` VALUES ('74', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '登录成功', '1479784147');
INSERT INTO `ta_login_log` VALUES ('75', '1', '111.163.241.73', 'Windows 7', 'chrome-54', '登录成功', '1479785990');
INSERT INTO `ta_login_log` VALUES ('76', '1', '180.102.117.249', 'Windows 7', 'chrome-50', '登录成功', '1479786556');
INSERT INTO `ta_login_log` VALUES ('77', '1', '61.141.154.10', 'Windows 10', 'chrome-54', '登录成功', '1479786805');
INSERT INTO `ta_login_log` VALUES ('78', '1', '116.17.60.140', 'Windows 7', 'chrome-42', '登录成功', '1479787642');
INSERT INTO `ta_login_log` VALUES ('79', '1', '117.29.209.199', 'Windows 10', 'ie-7', '登录成功', '1479790889');
INSERT INTO `ta_login_log` VALUES ('80', '1', '116.252.22.235', 'Windows 10', 'firefox-50', '登录成功', '1479790935');
INSERT INTO `ta_login_log` VALUES ('81', '1', '117.90.110.151', 'Windows 10', 'chrome-54', '登录成功', '1479792533');
INSERT INTO `ta_login_log` VALUES ('82', '1', '222.77.85.140', 'Windows 7', 'chrome-54', '登录成功', '1479794049');
INSERT INTO `ta_login_log` VALUES ('83', '1', '61.164.43.236', 'Windows 10', 'chrome-45', '登录成功', '1479796994');
INSERT INTO `ta_login_log` VALUES ('84', '1', '110.252.56.57', 'Windows 7', 'ie-unknow', '登录成功', '1479797256');
INSERT INTO `ta_login_log` VALUES ('85', '1', '222.128.147.37', 'Windows 10', 'chrome-45', '登录成功', '1479797920');
INSERT INTO `ta_login_log` VALUES ('86', '1', '61.49.178.106', 'Windows 7', 'ie-7', '登录成功', '1479800118');
INSERT INTO `ta_login_log` VALUES ('87', '1', '124.205.236.98', 'unknow', 'chrome-54', '登录成功', '1479804255');
INSERT INTO `ta_login_log` VALUES ('88', '1', '106.87.22.221', 'Windows 10', 'chrome-53', '登录成功', '1479804355');
INSERT INTO `ta_login_log` VALUES ('89', '1', '106.87.22.221', 'Windows 10', 'chrome-53', '登录成功', '1479804403');
INSERT INTO `ta_login_log` VALUES ('90', '1', '119.137.1.88', 'Windows 10', 'chrome-50', '登录成功', '1479807330');
INSERT INTO `ta_login_log` VALUES ('91', '1', '14.221.47.142', 'Windows 10', 'chrome-51', '登录成功', '1479808512');
INSERT INTO `ta_login_log` VALUES ('92', '1', '14.221.47.142', 'Windows 10', 'chrome-51', '缓存已更新', '1479809171');
INSERT INTO `ta_login_log` VALUES ('93', '1', '61.135.169.92', 'unknow', 'chrome-54', '登录成功', '1479809418');
INSERT INTO `ta_login_log` VALUES ('94', '1', '14.221.47.142', 'Windows 10', 'chrome-51', '缓存已更新', '1479811194');
INSERT INTO `ta_login_log` VALUES ('95', '1', '14.221.47.142', 'Windows 10', 'chrome-51', '登录成功', '1479812556');
INSERT INTO `ta_login_log` VALUES ('96', '1', '115.175.90.18', 'Windows 7', 'chrome-45', '登录成功', '1479817364');
INSERT INTO `ta_login_log` VALUES ('97', '1', '113.88.196.98', 'Windows 10', 'chrome-50', '登录成功', '1479817958');
INSERT INTO `ta_login_log` VALUES ('98', '1', '113.88.196.98', 'Windows 10', 'chrome-50', '登录成功', '1479818120');
INSERT INTO `ta_login_log` VALUES ('99', '1', '14.221.47.142', 'Windows 10', 'chrome-51', '登录成功', '1479818931');
INSERT INTO `ta_login_log` VALUES ('100', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '登录成功', '1479819050');
INSERT INTO `ta_login_log` VALUES ('101', '1', '113.99.103.243', 'Windows 10', 'chrome-50', '登录成功', '1479819563');
INSERT INTO `ta_login_log` VALUES ('102', '1', '113.139.123.103', 'Windows 7', 'chrome-53', '登录成功', '1479822860');
INSERT INTO `ta_login_log` VALUES ('103', '1', '218.18.222.154', 'Windows 10', 'chrome-49', '登录成功', '1479826450');
INSERT INTO `ta_login_log` VALUES ('104', '1', '117.176.255.180', 'Windows 7', 'chrome-54', '登录成功', '1479827997');
INSERT INTO `ta_login_log` VALUES ('105', '1', '1.80.80.186', 'Windows 7', 'chrome-54', '登录成功', '1479832943');
INSERT INTO `ta_login_log` VALUES ('106', '1', '180.164.197.148', 'Windows 7', 'ie-7', '登录成功', '1479839194');
INSERT INTO `ta_login_log` VALUES ('107', '1', '180.164.173.85', 'Windows 7', 'chrome-45', '用户留言-添加成功', '1479839349');
INSERT INTO `ta_login_log` VALUES ('108', '1', '180.164.173.85', 'Windows 7', 'chrome-45', '登录成功', '1479839399');
INSERT INTO `ta_login_log` VALUES ('109', '1', '58.251.233.246', 'Windows 7', 'chrome-50', '登录成功', '1479850399');
INSERT INTO `ta_login_log` VALUES ('110', '1', '58.251.233.246', 'Windows 7', 'chrome-50', '登录成功', '1479850442');
INSERT INTO `ta_login_log` VALUES ('111', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '登录成功', '1479858527');
INSERT INTO `ta_login_log` VALUES ('112', '1', '58.35.179.223', 'Windows 7', 'firefox-46', '登录成功', '1479862638');
INSERT INTO `ta_login_log` VALUES ('113', '1', '58.35.179.223', 'Windows 7', 'firefox-46', '登录成功', '1479862656');
INSERT INTO `ta_login_log` VALUES ('114', '1', '113.102.244.147', 'Windows 10', 'chrome-51', '登录成功', '1479863869');
INSERT INTO `ta_login_log` VALUES ('115', '1', '171.15.125.45', 'Windows 7', 'chrome-49', '登录成功', '1479866306');
INSERT INTO `ta_login_log` VALUES ('116', '1', '171.15.125.45', 'Windows 7', 'chrome-49', '菜单管理-添加成功', '1479866423');
INSERT INTO `ta_login_log` VALUES ('117', '1', '171.15.125.45', 'Windows 7', 'chrome-49', '菜单管理-添加成功', '1479866442');
INSERT INTO `ta_login_log` VALUES ('118', '1', '171.15.125.45', 'Windows 7', 'chrome-49', '缓存已更新', '1479866480');
INSERT INTO `ta_login_log` VALUES ('119', '1', '171.15.125.45', 'Windows 7', 'chrome-49', '登录成功', '1479866511');
INSERT INTO `ta_login_log` VALUES ('120', '1', '14.23.101.244', 'Windows 7', 'chrome-54', '登录成功', '1479867041');
INSERT INTO `ta_login_log` VALUES ('121', '1', '119.129.119.29', 'Windows 7', 'chrome-45', '登录成功', '1479867165');
INSERT INTO `ta_login_log` VALUES ('122', '1', '222.92.251.179', 'Windows 7', 'chrome-51', '登录成功', '1479867337');
INSERT INTO `ta_login_log` VALUES ('123', '1', '222.174.187.236', 'Windows 10', 'chrome-50', '登录成功', '1479868960');
INSERT INTO `ta_login_log` VALUES ('124', '1', '119.177.78.8', 'Windows 10', 'chrome-45', '登录成功', '1479870042');
INSERT INTO `ta_login_log` VALUES ('125', '1', '116.22.165.128', 'Windows 7', 'chrome-49', '登录成功', '1479872608');
INSERT INTO `ta_login_log` VALUES ('126', '1', '14.23.101.253', 'Windows XP', 'chrome-43', '登录成功', '1479872750');
INSERT INTO `ta_login_log` VALUES ('127', '1', '116.22.165.128', 'Windows 7', 'chrome-49', '登录成功', '1479872875');
INSERT INTO `ta_login_log` VALUES ('128', '1', '113.88.199.126', 'Windows 7', 'chrome-54', '登录成功', '1479875111');
INSERT INTO `ta_login_log` VALUES ('129', '1', '112.254.89.121', 'Windows 7', 'chrome-54', '登录成功', '1479879385');
INSERT INTO `ta_login_log` VALUES ('130', '1', '113.140.29.34', 'Windows 7', 'ie-7', '登录成功', '1479879526');
INSERT INTO `ta_login_log` VALUES ('131', '1', '14.23.101.244', 'Windows 7', 'chrome-54', '登录成功', '1479882069');
INSERT INTO `ta_login_log` VALUES ('132', '1', '61.52.155.158', 'Windows 7', 'chrome-45', '登录成功', '1479882536');
INSERT INTO `ta_login_log` VALUES ('133', '1', '42.202.204.120', 'Windows 7', 'firefox-50', '登录成功', '1479883443');
INSERT INTO `ta_login_log` VALUES ('134', '1', '183.14.175.88', 'Windows NT', 'chrome-42', '登录成功', '1479884664');
INSERT INTO `ta_login_log` VALUES ('135', '1', '116.226.59.175', 'Windows 7', 'ie-7', '登录成功', '1479884693');
INSERT INTO `ta_login_log` VALUES ('136', '1', '116.226.59.175', 'Windows 7', 'chrome-45', '登录成功', '1479884712');
INSERT INTO `ta_login_log` VALUES ('137', '1', '124.227.192.166', 'Windows 7', 'chrome-45', '登录成功', '1479885248');
INSERT INTO `ta_login_log` VALUES ('138', '1', '211.167.83.98', 'Windows 7', 'chrome-38', '登录成功', '1479888952');
INSERT INTO `ta_login_log` VALUES ('139', '1', '1.80.146.29', 'Windows 7', 'chrome-54', '登录成功', '1479890831');
INSERT INTO `ta_login_log` VALUES ('140', '1', '1.80.146.29', 'Windows 7', 'chrome-54', '登录成功', '1479890894');
INSERT INTO `ta_login_log` VALUES ('141', '1', '121.28.98.26', 'Windows 7', 'chrome-45', '登录成功', '1479891289');
INSERT INTO `ta_login_log` VALUES ('142', '1', '119.41.198.127', 'Windows 10', 'chrome-50', '登录成功', '1479892390');
INSERT INTO `ta_login_log` VALUES ('143', '1', '113.88.199.77', 'Windows 7', 'chrome-49', '登录成功', '1479892410');
INSERT INTO `ta_login_log` VALUES ('144', '1', '124.93.196.10', 'Windows 10', 'chrome-56', '登录成功', '1479897467');
INSERT INTO `ta_login_log` VALUES ('145', '1', '221.3.238.26', 'unknow', 'firefox-50', '登录成功', '1479903165');
INSERT INTO `ta_login_log` VALUES ('146', '1', '42.122.184.52', 'Windows 10', 'chrome-49', '登录成功', '1479906058');
INSERT INTO `ta_login_log` VALUES ('147', '1', '182.129.167.101', 'Windows 7', 'chrome-51', '登录成功', '1479906540');
INSERT INTO `ta_login_log` VALUES ('148', '1', '119.139.137.96', 'unknow', 'chrome-44', '登录成功', '1479913071');
INSERT INTO `ta_login_log` VALUES ('149', '1', '14.155.237.12', 'Windows 7', 'chrome-49', '登录成功', '1479915654');
INSERT INTO `ta_login_log` VALUES ('150', '1', '113.87.213.27', 'Windows 10', 'chrome-54', '登录成功', '1479948824');
INSERT INTO `ta_login_log` VALUES ('151', '1', '223.95.81.120', 'unknow', 'chrome-54', '登录成功', '1479950296');
INSERT INTO `ta_login_log` VALUES ('152', '1', '121.30.59.226', 'Windows 10', 'chrome-45', '登录成功', '1479950614');
INSERT INTO `ta_login_log` VALUES ('153', '1', '183.129.165.226', 'unknow', 'chrome-54', '登录成功', '1479953924');
INSERT INTO `ta_login_log` VALUES ('154', '1', '221.237.209.150', 'Windows 7', 'chrome-45', '登录成功', '1479955018');
INSERT INTO `ta_login_log` VALUES ('155', '1', '223.95.81.120', 'unknow', 'chrome-54', '登录成功', '1479955118');
INSERT INTO `ta_login_log` VALUES ('156', '1', '183.129.165.226', 'unknow', 'chrome-54', '登录成功', '1479955118');
INSERT INTO `ta_login_log` VALUES ('157', '1', '183.129.165.226', 'unknow', 'chrome-54', '登录成功', '1479955120');
INSERT INTO `ta_login_log` VALUES ('158', '1', '223.95.81.120', 'unknow', 'chrome-54', '登录成功', '1479955125');
INSERT INTO `ta_login_log` VALUES ('159', '1', '223.95.81.120', 'unknow', 'chrome-54', '登录成功', '1479955133');
INSERT INTO `ta_login_log` VALUES ('160', '1', '183.129.165.226', 'unknow', 'chrome-54', '登录成功', '1479955237');
INSERT INTO `ta_login_log` VALUES ('161', '1', '183.129.165.226', 'unknow', 'chrome-54', '菜单管理-添加成功', '1479956409');
INSERT INTO `ta_login_log` VALUES ('162', '1', '223.95.81.120', 'unknow', 'chrome-54', '登录成功', '1479957113');
INSERT INTO `ta_login_log` VALUES ('163', '1', '112.65.156.98', 'Windows 7', 'chrome-54', '登录成功', '1479957886');
INSERT INTO `ta_login_log` VALUES ('164', '1', '124.72.60.232', 'Windows 7', 'chrome-54', '登录成功', '1479961698');
INSERT INTO `ta_login_log` VALUES ('165', '1', '61.141.153.165', 'Windows 7', 'chrome-49', '登录成功', '1479966196');
INSERT INTO `ta_login_log` VALUES ('166', '1', '183.129.165.226', 'unknow', 'chrome-54', '登录成功', '1479968025');
INSERT INTO `ta_login_log` VALUES ('167', '1', '117.144.208.34', 'Windows 10', 'chrome-54', '登录成功', '1479969986');
INSERT INTO `ta_login_log` VALUES ('168', '1', '223.95.81.120', 'unknow', 'chrome-54', '登录成功', '1479970102');
INSERT INTO `ta_login_log` VALUES ('169', '1', '183.203.163.45', 'Windows 7', 'firefox-49', '登录成功', '1479972839');
INSERT INTO `ta_login_log` VALUES ('170', '1', '223.95.81.120', 'unknow', 'chrome-54', '登录成功', '1479972929');
INSERT INTO `ta_login_log` VALUES ('171', '1', '117.144.208.34', 'Windows 10', 'chrome-54', '登录成功', '1479973009');
INSERT INTO `ta_login_log` VALUES ('172', '1', '117.144.208.34', 'Windows 10', 'chrome-54', '登录成功', '1479973133');
INSERT INTO `ta_login_log` VALUES ('173', '1', '144.0.194.151', 'Windows 7', 'chrome-50', '登录成功', '1479973450');
INSERT INTO `ta_login_log` VALUES ('174', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '登录成功', '1479974840');
INSERT INTO `ta_login_log` VALUES ('175', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479974874');
INSERT INTO `ta_login_log` VALUES ('176', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479974885');
INSERT INTO `ta_login_log` VALUES ('177', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479974894');
INSERT INTO `ta_login_log` VALUES ('178', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479974900');
INSERT INTO `ta_login_log` VALUES ('179', '1', '121.33.236.138', 'Windows 7', 'ie-7', '登录成功', '1479976079');
INSERT INTO `ta_login_log` VALUES ('180', '1', '58.240.123.179', 'Windows 7', 'firefox-50', '登录成功', '1479976633');
INSERT INTO `ta_login_log` VALUES ('181', '1', '58.240.123.179', 'Windows 7', 'firefox-50', '登录成功', '1479976635');
INSERT INTO `ta_login_log` VALUES ('182', '1', '113.120.225.210', 'Windows NT', 'chrome-45', '登录成功', '1479978154');
INSERT INTO `ta_login_log` VALUES ('183', '1', '116.26.101.246', 'Windows 7', 'chrome-53', '登录成功', '1479978836');
INSERT INTO `ta_login_log` VALUES ('184', '1', '36.149.139.20', 'Windows 10', 'chrome-51', '登录成功', '1479984645');
INSERT INTO `ta_login_log` VALUES ('185', '1', '42.234.175.158', 'Windows 7', 'ie-7', '登录成功', '1479985543');
INSERT INTO `ta_login_log` VALUES ('186', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '登录成功', '1479988622');
INSERT INTO `ta_login_log` VALUES ('187', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '登录成功', '1479991619');
INSERT INTO `ta_login_log` VALUES ('188', '1', '111.23.48.123', 'Windows 10', 'chrome-54', '登录成功', '1479997446');
INSERT INTO `ta_login_log` VALUES ('189', '1', '59.45.22.218', 'Windows 10', 'chrome-53', '登录成功', '1479997881');
INSERT INTO `ta_login_log` VALUES ('190', '1', '211.161.244.179', 'unknow', 'firefox-50', '登录成功', '1480003957');
INSERT INTO `ta_login_log` VALUES ('191', '1', '123.174.101.20', 'Windows 7', 'chrome-53', '登录成功', '1480033307');
INSERT INTO `ta_login_log` VALUES ('192', '1', '116.252.222.2', 'unknow', 'chrome-54', '登录成功', '1480034716');
INSERT INTO `ta_login_log` VALUES ('193', '1', '36.248.235.198', 'Windows 7', 'chrome-42', '登录成功', '1480038186');
INSERT INTO `ta_login_log` VALUES ('194', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '登录成功', '1480038548');
INSERT INTO `ta_login_log` VALUES ('195', '1', '113.224.149.136', 'unknow', 'chrome-54', '登录成功', '1480039792');
INSERT INTO `ta_login_log` VALUES ('196', '1', '36.149.139.20', 'Windows 10', 'chrome-51', '登录成功', '1480043036');
INSERT INTO `ta_login_log` VALUES ('197', '1', '125.71.204.95', 'Windows XP', 'chrome-46', '登录成功', '1480045232');
INSERT INTO `ta_login_log` VALUES ('198', '1', '183.196.21.6', 'Windows 10', 'chrome-54', '登录成功', '1480045480');
INSERT INTO `ta_login_log` VALUES ('199', '1', '113.200.5.126', 'Linux', 'chrome-46', '登录成功', '1480046069');
INSERT INTO `ta_login_log` VALUES ('200', '1', '27.198.155.240', 'Windows 7', 'firefox-49', '登录成功', '1480055170');
INSERT INTO `ta_login_log` VALUES ('201', '1', '27.16.171.59', 'Windows 7', 'chrome-52', '登录成功', '1480055256');
INSERT INTO `ta_login_log` VALUES ('202', '1', '218.66.149.212', 'Windows 7', 'ie-7', '登录成功', '1480056703');
INSERT INTO `ta_login_log` VALUES ('203', '1', '218.66.149.212', 'Windows 7', 'chrome-45', '登录成功', '1480056813');
INSERT INTO `ta_login_log` VALUES ('204', '1', '27.198.155.240', 'Windows 7', 'firefox-49', '登录成功', '1480057807');
INSERT INTO `ta_login_log` VALUES ('205', '1', '121.15.7.26', 'Windows 7', 'firefox-50', '登录成功', '1480060229');
INSERT INTO `ta_login_log` VALUES ('206', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '登录成功', '1480064750');
INSERT INTO `ta_login_log` VALUES ('207', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '用户留言-添加成功', '1480064797');
INSERT INTO `ta_login_log` VALUES ('208', '1', '27.197.17.228', 'Windows 7', 'chrome-52', '登录成功', '1480074910');
INSERT INTO `ta_login_log` VALUES ('209', '1', '14.153.194.114', 'unknow', 'chrome-55', '登录成功', '1480144106');
INSERT INTO `ta_login_log` VALUES ('210', '1', '222.209.149.203', 'unknow', 'safari-602', '登录成功', '1480144207');
INSERT INTO `ta_login_log` VALUES ('211', '1', '117.114.147.228', 'Windows 7', 'firefox-49', '登录成功', '1480147578');
INSERT INTO `ta_login_log` VALUES ('212', '1', '119.98.78.98', 'unknow', 'chrome-54', '登录成功', '1480151261');
INSERT INTO `ta_login_log` VALUES ('213', '1', '221.237.119.72', 'unknow', 'chrome-54', '登录成功', '1480159051');
INSERT INTO `ta_login_log` VALUES ('214', '1', '183.27.156.195', 'Windows 10', 'chrome-54', '登录成功', '1480161712');
INSERT INTO `ta_login_log` VALUES ('215', '1', '39.190.121.58', 'Linux', 'chrome-52', '登录成功', '1480164763');
INSERT INTO `ta_login_log` VALUES ('216', '1', '39.190.121.58', 'Linux', 'chrome-52', '登录成功', '1480171597');
INSERT INTO `ta_login_log` VALUES ('217', '1', '39.190.121.58', 'Linux', 'chrome-52', '登录成功', '1480172293');
INSERT INTO `ta_login_log` VALUES ('218', '1', '112.5.238.137', 'Windows 7', 'firefox-48', '登录成功', '1480174497');
INSERT INTO `ta_login_log` VALUES ('219', '1', '119.122.83.228', 'Windows 7', 'firefox-49', '登录成功', '1480244786');
INSERT INTO `ta_login_log` VALUES ('220', '1', '182.244.71.236', 'Windows 7', 'chrome-54', '登录成功', '1480246651');
INSERT INTO `ta_login_log` VALUES ('221', '1', '223.99.59.226', 'Windows 10', 'chrome-53', '登录成功', '1480248894');
INSERT INTO `ta_login_log` VALUES ('222', '1', '14.205.35.119', 'Windows 10', 'chrome-54', '登录成功', '1480276750');
INSERT INTO `ta_login_log` VALUES ('223', '1', '14.205.35.119', 'Windows 10', 'chrome-54', '登录成功', '1480276801');
INSERT INTO `ta_login_log` VALUES ('224', '1', '101.29.135.144', 'Windows 7', 'chrome-54', '登录成功', '1480304645');
INSERT INTO `ta_login_log` VALUES ('225', '1', '116.1.3.238', 'Windows 10', 'chrome-54', '登录成功', '1480319585');
INSERT INTO `ta_login_log` VALUES ('226', '1', '116.25.77.63', 'Windows 7', 'chrome-54', '登录成功', '1480319998');
INSERT INTO `ta_login_log` VALUES ('227', '1', '39.130.91.140', 'Windows 7', 'ie-7', '登录成功', '1480320062');
INSERT INTO `ta_login_log` VALUES ('228', '1', '222.128.171.81', 'Windows 7', 'firefox-50', '登录成功', '1480321375');
INSERT INTO `ta_login_log` VALUES ('229', '1', '110.86.38.94', 'Windows 7', 'chrome-50', '登录成功', '1480321383');
INSERT INTO `ta_login_log` VALUES ('230', '1', '210.12.5.166', 'unknow', 'safari-602', '登录成功', '1480321412');
INSERT INTO `ta_login_log` VALUES ('231', '1', '114.240.208.173', 'Windows 7', 'chrome-53', '登录成功', '1480321852');
INSERT INTO `ta_login_log` VALUES ('232', '1', '36.5.97.119', 'Windows 7', 'chrome-51', '登录成功', '1480323199');
INSERT INTO `ta_login_log` VALUES ('233', '1', '114.249.222.202', 'Windows 7', 'firefox-50', '登录成功', '1480324991');
INSERT INTO `ta_login_log` VALUES ('234', '1', '211.161.199.26', 'Windows 7', 'chrome-53', '登录成功', '1480340007');
INSERT INTO `ta_login_log` VALUES ('235', '1', '211.161.199.26', 'Windows 7', 'chrome-53', '登录成功', '1480340371');
INSERT INTO `ta_login_log` VALUES ('236', '1', '58.250.92.221', 'Windows 7', 'firefox-50', '登录成功', '1480341129');
INSERT INTO `ta_login_log` VALUES ('237', '1', '121.236.11.51', 'Windows 7', 'chrome-54', '登录成功', '1480342614');
INSERT INTO `ta_login_log` VALUES ('238', '1', '110.186.48.107', 'Windows 10', 'ie-7', '登录成功', '1480349238');
INSERT INTO `ta_login_log` VALUES ('239', '1', '110.186.48.107', 'Windows 10', 'chrome-50', '用户留言-添加成功', '1480352149');
INSERT INTO `ta_login_log` VALUES ('240', '1', '183.13.59.68', 'Windows 7', 'chrome-54', '登录成功', '1480358190');
INSERT INTO `ta_login_log` VALUES ('241', '1', '180.213.30.240', 'Windows 10', 'chrome-53', '登录成功', '1480385815');
INSERT INTO `ta_login_log` VALUES ('242', '1', '163.179.238.145', 'Windows 7', 'chrome-51', '登录成功', '1480386117');
INSERT INTO `ta_login_log` VALUES ('243', '1', '61.148.242.227', 'unknow', 'unknown-unknow', '登录成功', '1480386703');
INSERT INTO `ta_login_log` VALUES ('244', '1', '117.151.56.166', 'Windows 7', 'chrome-45', '登录成功', '1480388692');
INSERT INTO `ta_login_log` VALUES ('245', '1', '117.151.56.166', 'Windows 7', 'chrome-45', '角色管理-编辑成功 ID=1', '1480388890');
INSERT INTO `ta_login_log` VALUES ('246', '1', '117.151.56.166', 'Windows 7', 'chrome-45', '角色管理-编辑成功 ID=9', '1480388905');
INSERT INTO `ta_login_log` VALUES ('247', '1', '113.232.108.252', 'Windows 7', 'chrome-46', '登录成功', '1480390643');
INSERT INTO `ta_login_log` VALUES ('248', '1', '171.111.43.100', 'Windows 7', 'chrome-49', '登录成功', '1480397225');
INSERT INTO `ta_login_log` VALUES ('249', '1', '180.173.224.92', 'Windows 7', 'chrome-54', '登录成功', '1480401427');
INSERT INTO `ta_login_log` VALUES ('250', '1', '180.173.224.92', 'Windows 7', 'chrome-54', '登录成功', '1480401475');
INSERT INTO `ta_login_log` VALUES ('251', '1', '180.173.224.92', 'Windows 7', 'chrome-54', '登录成功', '1480402922');
INSERT INTO `ta_login_log` VALUES ('252', '1', '180.173.224.92', 'Windows 7', 'chrome-54', '登录成功', '1480402980');
INSERT INTO `ta_login_log` VALUES ('253', '1', '180.173.224.92', 'Windows 7', 'chrome-54', '登录失败, [username_mobile: 13330613321ww],[ status: 该手机号未注册！ ],[password: 28edd1e7****************2e592db9]', '1480404306');
INSERT INTO `ta_login_log` VALUES ('254', '1', '180.173.224.92', 'Windows 7', 'chrome-54', '登录失败, [username_mobile: 13330613321ww],[ status: 该手机号未注册！ ],[password: 28edd1e7****************2e592db9]', '1480404307');
INSERT INTO `ta_login_log` VALUES ('255', '1', '180.173.224.92', 'Windows 7', 'chrome-54', '登录失败, [username_mobile: 13330613321ww],[ status: 该手机号未注册！ ],[password: 28edd1e7****************2e592db9]', '1480404307');
INSERT INTO `ta_login_log` VALUES ('256', '1', '180.173.224.92', 'Windows 7', 'chrome-54', '登录失败, [username_mobile: 13330613321ww],[ status: 该手机号未注册！ ],[password: 28edd1e7****************2e592db9]', '1480404307');
INSERT INTO `ta_login_log` VALUES ('257', '1', '180.173.224.92', 'Windows 7', 'chrome-54', '登录失败, [username_mobile: wew],[ status: 该手机号未注册！ ],[password: 28edd1e7****************2e592db9]', '1480404309');
INSERT INTO `ta_login_log` VALUES ('258', '1', '180.173.224.92', 'Windows 7', 'chrome-54', '登录失败, [username_mobile: wew],[ status: 该手机号未注册！ ],[password: 28edd1e7****************2e592db9]', '1480404310');
INSERT INTO `ta_login_log` VALUES ('259', '1', '180.173.224.92', 'Windows 7', 'chrome-54', '登录失败, [username_mobile: wew],[ status: 该手机号未注册！ ],[password: 28edd1e7****************2e592db9]', '1480404310');
INSERT INTO `ta_login_log` VALUES ('260', '1', '180.173.224.92', 'Windows 7', 'chrome-54', '登录失败, [username_mobile: wew],[ status: 该手机号未注册！ ],[password: 28edd1e7****************2e592db9]', '1480404310');
INSERT INTO `ta_login_log` VALUES ('261', '1', '180.173.224.92', 'Windows 7', 'chrome-54', '登录失败, [username_mobile: wew],[ status: 该手机号未注册！ ],[password: 28edd1e7****************2e592db9]', '1480404311');
INSERT INTO `ta_login_log` VALUES ('262', '1', '180.173.224.92', 'Windows 7', 'chrome-54', '登录失败, [username_mobile: 13213],[ status: 该手机号未注册！ ],[password: 28edd1e7****************2e592db9]', '1480404315');
INSERT INTO `ta_login_log` VALUES ('263', '1', '180.173.224.92', 'Windows 7', 'chrome-54', '登录失败, [username_mobile: 13213],[ status: 该手机号未注册！ ],[password: adc8393b****************2fb48ae6]', '1480404318');
INSERT INTO `ta_login_log` VALUES ('264', '1', '180.173.224.92', 'Windows 7', 'chrome-54', '登录失败, [username_mobile: 13213],[ status: 该手机号未注册！ ],[password: adc8393b****************2fb48ae6]', '1480404319');
INSERT INTO `ta_login_log` VALUES ('265', '1', '180.173.224.92', 'Windows 7', 'chrome-54', '登录失败, [username_mobile: 13213],[ status: 该手机号未注册！ ],[password: adc8393b****************2fb48ae6]', '1480404319');
INSERT INTO `ta_login_log` VALUES ('266', '1', '180.173.224.92', 'Windows 7', 'chrome-54', '登录失败, [username_mobile: 13213],[ status: 该手机号未注册！ ],[password: adc8393b****************2fb48ae6]', '1480404319');
INSERT INTO `ta_login_log` VALUES ('267', '1', '180.173.224.92', 'Windows 7', 'chrome-54', '登录失败, [username_mobile: 13213],[ status: 该手机号未注册！ ],[password: adc8393b****************2fb48ae6]', '1480404320');
INSERT INTO `ta_login_log` VALUES ('268', '1', '180.173.224.92', 'Windows 7', 'chrome-54', '登录失败, [username_mobile: 13213],[ status: 该手机号未注册！ ],[password: adc8393b****************2fb48ae6]', '1480404320');
INSERT INTO `ta_login_log` VALUES ('269', '1', '192.168.15.174', 'Windows 7', 'firefox-50', '登录成功', '1480406936');
INSERT INTO `ta_login_log` VALUES ('270', '1', '118.114.253.78', 'Windows 7', 'chrome-49', '登录成功', '1480407199');
INSERT INTO `ta_login_log` VALUES ('271', '1', '58.57.98.50', 'Windows 10', 'chrome-45', '登录成功', '1480407519');
INSERT INTO `ta_login_log` VALUES ('272', '1', '58.57.98.50', 'Windows 10', 'chrome-45', '用户留言-编辑成功 ID=30', '1480407561');
INSERT INTO `ta_login_log` VALUES ('273', '1', '58.57.98.50', 'Windows 10', 'chrome-45', '登录成功', '1480407620');
INSERT INTO `ta_login_log` VALUES ('274', '1', '112.229.245.204', 'Windows 7', 'ie-7', '登录成功', '1480408235');
INSERT INTO `ta_login_log` VALUES ('275', '1', '113.111.64.71', 'Windows 7', 'ie-7', '登录成功', '1480408756');
INSERT INTO `ta_login_log` VALUES ('276', '1', '113.111.64.71', 'Windows 7', 'chrome-45', '登录成功', '1480408827');
INSERT INTO `ta_login_log` VALUES ('277', '1', '113.105.12.152', 'Windows 10', 'chrome-49', '登录成功', '1480410793');
INSERT INTO `ta_login_log` VALUES ('278', '1', '140.206.155.125', 'Windows 7', 'chrome-51', '登录成功', '1480410903');
INSERT INTO `ta_login_log` VALUES ('279', '1', '218.56.44.108', 'Windows XP', 'chrome-49', '登录成功', '1480411544');
INSERT INTO `ta_login_log` VALUES ('280', '1', '218.56.44.108', 'Windows XP', 'chrome-49', '登录成功', '1480411702');
INSERT INTO `ta_login_log` VALUES ('281', '1', '27.46.131.7', 'Windows 7', 'chrome-53', '登录成功', '1480413754');
INSERT INTO `ta_login_log` VALUES ('282', '1', '220.166.212.42', 'Windows 10', 'ie-7', '登录成功', '1480421629');
INSERT INTO `ta_login_log` VALUES ('283', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '登录成功', '1480423247');
INSERT INTO `ta_login_log` VALUES ('284', '1', '222.162.198.31', 'Windows 10', 'chrome-45', '登录成功', '1480433103');
INSERT INTO `ta_login_log` VALUES ('285', '1', '222.162.198.31', 'Windows 10', 'chrome-45', '登录成功', '1480433119');
INSERT INTO `ta_login_log` VALUES ('286', '1', '27.195.156.2', 'Windows 10', 'chrome-45', '登录成功', '1480467874');
INSERT INTO `ta_login_log` VALUES ('287', '1', '124.236.253.72', 'Windows 7', 'chrome-54', '登录成功', '1480470875');
INSERT INTO `ta_login_log` VALUES ('288', '1', '180.173.91.137', 'Windows 7', 'chrome-54', '登录成功', '1480490026');
INSERT INTO `ta_login_log` VALUES ('289', '1', '124.236.142.249', 'Windows 7', 'firefox-50', '登录成功', '1480490511');
INSERT INTO `ta_login_log` VALUES ('290', '1', '120.236.144.233', 'Windows 10', 'chrome-54', '登录成功', '1480491217');
INSERT INTO `ta_login_log` VALUES ('291', '1', '14.220.103.25', 'Windows 7', 'chrome-54', '登录成功', '1480494597');
INSERT INTO `ta_login_log` VALUES ('292', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '登录成功', '1480496742');
INSERT INTO `ta_login_log` VALUES ('293', '1', '101.69.255.186', 'Windows 10', 'chrome-54', '登录成功', '1480497013');
INSERT INTO `ta_login_log` VALUES ('294', '1', '119.187.127.131', 'Windows 7', 'chrome-54', '登录成功', '1480498580');
INSERT INTO `ta_login_log` VALUES ('295', '1', '118.186.143.118', 'unknow', 'chrome-54', '登录成功', '1480500147');
INSERT INTO `ta_login_log` VALUES ('296', '1', '112.26.69.237', 'Windows 7', 'ie-7', '登录成功', '1480506515');
INSERT INTO `ta_login_log` VALUES ('297', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '登录成功', '1480508051');
INSERT INTO `ta_login_log` VALUES ('298', '1', '223.73.73.107', 'Windows 7', 'ie-7', '登录成功', '1480509120');
INSERT INTO `ta_login_log` VALUES ('299', '1', '14.107.79.56', 'Windows 7', 'ie-7', '登录成功', '1480509564');
INSERT INTO `ta_login_log` VALUES ('300', '1', '61.182.253.228', 'Windows 7', 'chrome-45', '登录成功', '1480518506');
INSERT INTO `ta_login_log` VALUES ('301', '1', '112.26.69.237', 'Windows 7', 'chrome-45', '登录成功', '1480520652');
INSERT INTO `ta_login_log` VALUES ('302', '1', '42.48.243.46', 'Windows 7', 'firefox-50', '登录成功', '1480520997');
INSERT INTO `ta_login_log` VALUES ('303', '1', '42.48.243.46', 'Windows 7', 'firefox-50', '菜单管理-添加成功', '1480521052');
INSERT INTO `ta_login_log` VALUES ('304', '1', '14.204.71.224', 'Windows 10', 'chrome-42', '登录成功', '1480553918');
INSERT INTO `ta_login_log` VALUES ('305', '1', '183.6.137.165', 'Windows 7', 'chrome-45', '登录成功', '1480558338');
INSERT INTO `ta_login_log` VALUES ('306', '1', '116.226.57.91', 'Windows 7', 'chrome-54', '登录成功', '1480559273');
INSERT INTO `ta_login_log` VALUES ('307', '1', '106.86.169.22', 'Windows 10', 'chrome-54', '登录成功', '1480559280');
INSERT INTO `ta_login_log` VALUES ('308', '1', '171.15.121.25', 'Windows 7', 'chrome-45', '登录成功', '1480560096');
INSERT INTO `ta_login_log` VALUES ('309', '1', '171.15.121.25', 'Windows 7', 'chrome-45', '角色管理-编辑成功 ID=1', '1480560189');
INSERT INTO `ta_login_log` VALUES ('310', '1', '171.15.121.25', 'Windows 7', 'chrome-45', '角色管理-添加成功', '1480560216');
INSERT INTO `ta_login_log` VALUES ('311', '1', '218.88.125.103', 'Windows 7', 'chrome-49', '登录成功', '1480562979');
INSERT INTO `ta_login_log` VALUES ('312', '1', '14.120.234.66', 'Windows 7', 'chrome-54', '登录成功', '1480563503');
INSERT INTO `ta_login_log` VALUES ('313', '1', '202.118.212.136', 'unknow', 'chrome-54', '登录成功', '1480570180');
INSERT INTO `ta_login_log` VALUES ('314', '1', '116.226.57.91', 'Windows 7', 'chrome-54', '登录成功', '1480570381');
INSERT INTO `ta_login_log` VALUES ('315', '1', '59.61.114.183', 'Windows XP', 'firefox-49', '登录成功', '1480570921');
INSERT INTO `ta_login_log` VALUES ('316', '1', '139.205.173.166', 'Windows 10', 'chrome-53', '登录成功', '1480571841');
INSERT INTO `ta_login_log` VALUES ('317', '1', '175.160.148.121', 'Windows 7', 'chrome-54', '登录成功', '1480574893');
INSERT INTO `ta_login_log` VALUES ('318', '1', '221.216.240.249', 'Windows 7', 'firefox-50', '登录成功', '1480580239');
INSERT INTO `ta_login_log` VALUES ('319', '1', '119.137.2.68', 'Windows 10', 'chrome-50', '登录成功', '1480580656');
INSERT INTO `ta_login_log` VALUES ('320', '1', '47.90.12.176', 'Windows 7', 'chrome-54', '登录成功', '1480583565');
INSERT INTO `ta_login_log` VALUES ('321', '1', '116.226.57.91', 'Windows 7', 'chrome-54', '登录成功', '1480585887');
INSERT INTO `ta_login_log` VALUES ('322', '1', '222.181.144.229', 'Windows 10', 'chrome-53', '登录成功', '1480586679');
INSERT INTO `ta_login_log` VALUES ('323', '1', '113.111.224.103', 'Windows 7', 'chrome-50', '登录成功', '1480593580');
INSERT INTO `ta_login_log` VALUES ('324', '1', '114.117.25.231', 'Windows 7', 'chrome-50', '登录成功', '1480594783');
INSERT INTO `ta_login_log` VALUES ('325', '1', '211.161.199.26', 'Windows 7', 'chrome-53', '登录成功', '1480596502');
INSERT INTO `ta_login_log` VALUES ('326', '1', '211.161.199.26', 'Windows 7', 'chrome-53', '账号管理-添加成功', '1480596528');
INSERT INTO `ta_login_log` VALUES ('327', '1', '123.113.67.223', 'Windows 10', 'chrome-54', '登录成功', '1480597105');
INSERT INTO `ta_login_log` VALUES ('328', '1', '124.126.220.42', 'Windows 10', 'chrome-51', '登录成功', '1480597326');
INSERT INTO `ta_login_log` VALUES ('329', '1', '123.122.147.63', 'Windows 10', 'firefox-50', '登录成功', '1480599152');
INSERT INTO `ta_login_log` VALUES ('330', '1', '223.209.237.159', 'Windows 10', 'chrome-54', '登录成功', '1480599689');
INSERT INTO `ta_login_log` VALUES ('331', '1', '171.108.43.25', 'Windows 10', 'chrome-54', '登录成功', '1480606888');
INSERT INTO `ta_login_log` VALUES ('332', '1', '116.226.57.91', 'Windows 7', 'chrome-54', '登录成功', '1480642547');
INSERT INTO `ta_login_log` VALUES ('333', '1', '116.226.57.91', 'Windows 7', 'chrome-54', '账号管理-编辑成功', '1480644661');
INSERT INTO `ta_login_log` VALUES ('334', '1', '116.226.57.91', 'Windows 7', 'chrome-54', '登录成功', '1480644672');
INSERT INTO `ta_login_log` VALUES ('335', '1', '116.226.57.91', 'Windows 7', 'chrome-54', '菜单管理-添加成功', '1480648068');
INSERT INTO `ta_login_log` VALUES ('336', '1', '218.104.10.91', 'Windows 7', 'ie-7', '登录成功', '1480653191');
INSERT INTO `ta_login_log` VALUES ('337', '1', '218.104.10.91', 'Windows 7', 'chrome-50', '缓存已更新', '1480653230');
INSERT INTO `ta_login_log` VALUES ('338', '1', '182.148.34.45', 'Windows 10', 'firefox-50', '登录成功', '1480665492');
INSERT INTO `ta_login_log` VALUES ('339', '1', '183.63.217.132', 'Windows NT', 'chrome-50', '登录成功', '1480666935');
INSERT INTO `ta_login_log` VALUES ('340', '1', '113.119.58.207', 'Windows 7', 'ie-7', '登录成功', '1480667830');
INSERT INTO `ta_login_log` VALUES ('341', '1', '61.135.152.131', 'Windows 10', 'firefox-50', '登录成功', '1480668405');
INSERT INTO `ta_login_log` VALUES ('342', '1', '58.20.69.92', 'unknow', 'safari-602', '登录成功', '1480669109');
INSERT INTO `ta_login_log` VALUES ('343', '1', '221.217.25.37', 'Windows 7', 'chrome-54', '登录成功', '1480669138');
INSERT INTO `ta_login_log` VALUES ('344', '1', '116.226.57.91', 'Windows 7', 'chrome-54', '登录成功', '1480671586');
INSERT INTO `ta_login_log` VALUES ('345', '1', '116.226.57.91', 'Windows 7', 'chrome-54', '登录成功', '1480671588');
INSERT INTO `ta_login_log` VALUES ('346', '1', '116.226.57.91', 'Windows 7', 'chrome-54', '登录成功', '1480671588');
INSERT INTO `ta_login_log` VALUES ('347', '1', '124.116.253.42', 'Windows 10', 'chrome-50', '登录成功', '1480672012');
INSERT INTO `ta_login_log` VALUES ('348', '1', '59.41.50.180', 'Windows 7', 'chrome-50', '登录成功', '1480672370');
INSERT INTO `ta_login_log` VALUES ('349', '1', '113.119.58.207', 'Windows 7', 'chrome-45', '登录成功', '1480674462');
INSERT INTO `ta_login_log` VALUES ('350', '1', '113.119.58.207', 'Windows 7', 'chrome-45', '角色管理-添加成功', '1480674604');
INSERT INTO `ta_login_log` VALUES ('351', '1', '113.119.58.207', 'Windows 7', 'chrome-45', '角色管理-编辑成功 ID=17', '1480674617');
INSERT INTO `ta_login_log` VALUES ('352', '1', '119.33.57.41', 'Windows 7', 'chrome-45', '登录成功', '1480687365');
INSERT INTO `ta_login_log` VALUES ('353', '1', '115.60.147.177', 'Windows 7', 'chrome-53', '登录成功', '1480691058');
INSERT INTO `ta_login_log` VALUES ('354', '1', '115.60.147.177', 'Windows 7', 'chrome-53', '登录成功', '1480691140');
INSERT INTO `ta_login_log` VALUES ('355', '1', '27.185.77.213', 'Windows 7', 'chrome-50', '登录成功', '1480699613');
INSERT INTO `ta_login_log` VALUES ('356', '1', '183.17.235.214', 'Windows 10', 'chrome-54', '登录成功', '1480699983');
INSERT INTO `ta_login_log` VALUES ('357', '1', '183.238.188.194', 'Windows 10', 'chrome-55', '登录成功', '1480726673');
INSERT INTO `ta_login_log` VALUES ('358', '1', '59.40.173.83', 'unknow', 'chrome-54', '登录成功', '1480730638');
INSERT INTO `ta_login_log` VALUES ('359', '1', '61.52.67.45', 'Windows 7', 'ie-7', '登录成功', '1480737327');
INSERT INTO `ta_login_log` VALUES ('360', '1', '223.148.229.128', 'Windows 7', 'chrome-47', '登录成功', '1480746377');
INSERT INTO `ta_login_log` VALUES ('361', '1', '223.148.229.128', 'Windows 7', 'chrome-47', '登录成功', '1480746382');
INSERT INTO `ta_login_log` VALUES ('362', '1', '223.148.229.128', 'Windows 7', 'chrome-47', '登录成功', '1480746394');
INSERT INTO `ta_login_log` VALUES ('363', '1', '223.148.229.128', 'Windows 7', 'chrome-47', '登录成功', '1480746397');
INSERT INTO `ta_login_log` VALUES ('364', '1', '223.148.229.128', 'Windows 7', 'chrome-47', '登录成功', '1480746401');
INSERT INTO `ta_login_log` VALUES ('365', '1', '14.120.227.161', 'Windows 7', 'chrome-45', '登录成功', '1480747922');
INSERT INTO `ta_login_log` VALUES ('366', '1', '61.131.53.252', 'Windows 7', 'chrome-53', '登录成功', '1480751556');
INSERT INTO `ta_login_log` VALUES ('367', '1', '211.161.199.26', 'Windows 7', 'chrome-53', '登录成功', '1480767787');
INSERT INTO `ta_login_log` VALUES ('368', '1', '113.45.129.61', 'unknow', 'safari-602', '登录成功', '1480781972');
INSERT INTO `ta_login_log` VALUES ('369', '1', '112.51.45.93', 'Linux', 'chrome-54', '登录成功', '1480782922');
INSERT INTO `ta_login_log` VALUES ('370', '1', '222.27.239.245', 'unknow', 'chrome-55', '登录成功', '1480790369');
INSERT INTO `ta_login_log` VALUES ('371', '1', '222.27.239.245', 'unknow', 'chrome-55', '缓存已更新', '1480790385');
INSERT INTO `ta_login_log` VALUES ('372', '1', '222.27.239.245', 'unknow', 'chrome-55', '缓存已更新', '1480790400');
INSERT INTO `ta_login_log` VALUES ('373', '1', '222.27.239.245', 'unknow', 'chrome-55', '缓存已更新', '1480790426');
INSERT INTO `ta_login_log` VALUES ('374', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '登录成功', '1480821271');
INSERT INTO `ta_login_log` VALUES ('375', '1', '211.161.199.26', 'Windows 7', 'chrome-53', '登录成功', '1480822444');
INSERT INTO `ta_login_log` VALUES ('376', '1', '112.2.254.100', 'Windows 10', 'chrome-50', '登录成功', '1480839924');
INSERT INTO `ta_login_log` VALUES ('377', '1', '112.2.254.100', 'Windows 10', 'chrome-50', '菜单管理-添加成功', '1480839991');
INSERT INTO `ta_login_log` VALUES ('378', '0', '112.2.254.100', 'Windows 10', 'chrome-50', '登录失败, [username_mobile: 13330613321],[ status: 密码错误！ ],[password: 881518d0****************b8a4256e]', '1480840068');
INSERT INTO `ta_login_log` VALUES ('379', '1', '112.2.254.100', 'Windows 10', 'chrome-50', '登录成功', '1480840072');
INSERT INTO `ta_login_log` VALUES ('380', '1', '112.2.254.100', 'Windows 10', 'chrome-50', '账号管理-添加成功', '1480840119');
INSERT INTO `ta_login_log` VALUES ('381', '0', '112.2.254.100', 'Windows 10', 'chrome-50', '登录失败, [username_mobile: root],[ status: 该手机号未注册！ ],[password: 3e58c351****************0477ae07]', '1480840168');
INSERT INTO `ta_login_log` VALUES ('382', '0', '112.2.254.100', 'Windows 10', 'chrome-50', '登录失败, [username_mobile: root],[ status: 该手机号未注册！ ],[password: 3e58c351****************0477ae07]', '1480840179');
INSERT INTO `ta_login_log` VALUES ('383', '0', '112.2.254.100', 'Windows 10', 'chrome-50', '登录失败, [username_mobile: root],[ status: 该手机号未注册！ ],[password: 3e58c351****************0477ae07]', '1480840180');
INSERT INTO `ta_login_log` VALUES ('384', '0', '112.2.254.100', 'Windows 10', 'chrome-50', '登录失败, [username_mobile: root],[ status: 该手机号未注册！ ],[password: 3e58c351****************0477ae07]', '1480840180');
INSERT INTO `ta_login_log` VALUES ('385', '24', '112.2.254.100', 'Windows 10', 'chrome-50', '登录成功', '1480840188');
INSERT INTO `ta_login_log` VALUES ('386', '1', '218.94.124.53', 'Windows 10', 'chrome-54', '登录成功', '1480843110');
INSERT INTO `ta_login_log` VALUES ('387', '1', '39.188.48.235', 'Windows 7', 'chrome-49', '登录成功', '1480845726');
INSERT INTO `ta_login_log` VALUES ('388', '1', '111.127.148.206', 'Windows 7', 'chrome-45', '登录成功', '1480850019');
INSERT INTO `ta_login_log` VALUES ('389', '1', '211.161.199.26', 'Windows 7', 'chrome-53', '登录成功', '1480850829');
INSERT INTO `ta_login_log` VALUES ('390', '1', '119.139.69.36', 'Windows 7', 'firefox-50', '登录成功', '1480855719');
INSERT INTO `ta_login_log` VALUES ('391', '1', '124.79.179.215', 'Windows NT', 'chrome-55', '登录成功', '1480856668');
INSERT INTO `ta_login_log` VALUES ('392', '1', '27.46.131.43', 'Windows 7', 'chrome-53', '登录成功', '1480907298');
INSERT INTO `ta_login_log` VALUES ('393', '1', '113.108.164.34', 'Windows 7', 'chrome-49', '登录成功', '1480908439');
INSERT INTO `ta_login_log` VALUES ('394', '1', '121.28.34.78', 'Windows NT', 'chrome-54', '登录成功', '1480910502');
INSERT INTO `ta_login_log` VALUES ('395', '1', '119.129.209.107', 'Windows 7', 'firefox-50', '登录成功', '1480919524');
INSERT INTO `ta_login_log` VALUES ('396', '1', '121.28.34.78', 'Windows NT', 'chrome-54', '登录成功', '1480926365');
INSERT INTO `ta_login_log` VALUES ('397', '1', '183.6.184.42', 'Windows 10', 'ie-unknow', '登录成功', '1480927235');
INSERT INTO `ta_login_log` VALUES ('398', '1', '218.247.181.2', 'unknow', 'chrome-55', '登录成功', '1480928947');
INSERT INTO `ta_login_log` VALUES ('399', '1', '110.152.238.248', 'Windows 10', 'chrome-48', '登录成功', '1480935270');
INSERT INTO `ta_login_log` VALUES ('400', '1', '110.152.238.248', 'Windows 10', 'chrome-48', '角色管理-添加成功', '1480935290');
INSERT INTO `ta_login_log` VALUES ('401', '1', '223.73.116.182', 'Windows XP', 'chrome-53', '登录成功', '1480943607');
INSERT INTO `ta_login_log` VALUES ('402', '1', '219.130.113.41', 'Windows 7', 'chrome-54', '登录成功', '1480946130');
INSERT INTO `ta_login_log` VALUES ('403', '1', '116.224.95.217', 'Windows 7', 'firefox-50', '登录成功', '1480946151');
INSERT INTO `ta_login_log` VALUES ('404', '1', '116.224.95.217', 'Windows 7', 'firefox-50', '角色管理-添加成功', '1480946192');
INSERT INTO `ta_login_log` VALUES ('405', '1', '116.224.95.217', 'Windows 7', 'firefox-50', '菜单管理-添加成功', '1480946277');
INSERT INTO `ta_login_log` VALUES ('406', '1', '116.224.95.217', 'Windows 7', 'firefox-50', '缓存已更新', '1480946369');
INSERT INTO `ta_login_log` VALUES ('407', '1', '116.224.95.217', 'Windows 7', 'firefox-50', '登录成功', '1480946388');
INSERT INTO `ta_login_log` VALUES ('408', '1', '171.34.222.34', 'Windows 7', 'chrome-54', '登录成功', '1480949775');
INSERT INTO `ta_login_log` VALUES ('409', '1', '58.100.5.182', 'Windows 10', 'chrome-55', '登录成功', '1480956390');
INSERT INTO `ta_login_log` VALUES ('410', '1', '211.161.248.219', 'unknow', 'safari-537', '登录成功', '1480980915');
INSERT INTO `ta_login_log` VALUES ('411', '1', '153.37.175.114', 'Linux', 'firefox-45', '登录成功', '1480989049');
INSERT INTO `ta_login_log` VALUES ('412', '1', '119.129.209.172', 'Windows 7', 'firefox-50', '登录成功', '1480989423');
INSERT INTO `ta_login_log` VALUES ('413', '1', '119.129.209.172', 'Windows 7', 'firefox-50', '登录成功', '1480989423');
INSERT INTO `ta_login_log` VALUES ('414', '1', '180.120.173.140', 'Windows XP', 'chrome-49', '登录成功', '1480990271');
INSERT INTO `ta_login_log` VALUES ('415', '1', '113.104.215.191', 'unknow', 'safari-602', '登录成功', '1480991882');
INSERT INTO `ta_login_log` VALUES ('416', '1', '222.43.104.229', 'Windows 10', 'chrome-49', '登录成功', '1480994442');
INSERT INTO `ta_login_log` VALUES ('417', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '登录成功', '1480997963');
INSERT INTO `ta_login_log` VALUES ('418', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1480998437');
INSERT INTO `ta_login_log` VALUES ('419', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1480998446');
INSERT INTO `ta_login_log` VALUES ('420', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1480998458');
INSERT INTO `ta_login_log` VALUES ('421', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1480998467');
INSERT INTO `ta_login_log` VALUES ('422', '1', '115.171.146.187', 'Windows 10', 'ie-7', '登录成功', '1481002219');
INSERT INTO `ta_login_log` VALUES ('423', '1', '218.26.184.125', 'Windows NT', 'ie-7', '登录成功', '1481002521');
INSERT INTO `ta_login_log` VALUES ('424', '1', '117.22.167.246', 'Windows 10', 'firefox-50', '登录成功', '1481003326');
INSERT INTO `ta_login_log` VALUES ('425', '1', '180.120.173.140', 'Windows XP', 'chrome-49', '登录成功', '1481003712');
INSERT INTO `ta_login_log` VALUES ('426', '1', '119.129.209.172', 'Windows 7', 'firefox-50', '登录成功', '1481009359');
INSERT INTO `ta_login_log` VALUES ('427', '1', '124.235.234.109', 'Windows 7', 'chrome-52', '登录成功', '1481018600');
INSERT INTO `ta_login_log` VALUES ('428', '1', '124.235.234.109', 'Windows 7', 'chrome-52', '菜单管理-添加成功', '1481018768');
INSERT INTO `ta_login_log` VALUES ('429', '1', '101.24.28.118', 'unknow', 'safari-600', '登录成功', '1481040017');
INSERT INTO `ta_login_log` VALUES ('430', '1', '120.194.25.90', 'Windows 7', 'firefox-50', '登录成功', '1481072214');
INSERT INTO `ta_login_log` VALUES ('431', '1', '110.87.2.109', 'Windows 7', 'chrome-45', '登录成功', '1481078529');
INSERT INTO `ta_login_log` VALUES ('432', '1', '210.74.158.82', 'Windows 10', 'chrome-51', '登录成功', '1481079649');
INSERT INTO `ta_login_log` VALUES ('433', '1', '123.149.211.243', 'Windows 10', 'chrome-52', '登录成功', '1481088823');
INSERT INTO `ta_login_log` VALUES ('434', '1', '117.71.57.195', 'unknow', 'safari-602', '登录成功', '1481089467');
INSERT INTO `ta_login_log` VALUES ('435', '1', '119.129.208.5', 'Windows 7', 'firefox-50', '登录成功', '1481092566');
INSERT INTO `ta_login_log` VALUES ('436', '1', '125.86.94.164', 'unknow', 'chrome-54', '登录成功', '1481092613');
INSERT INTO `ta_login_log` VALUES ('437', '1', '221.237.156.27', 'Windows NT', 'chrome-52', '登录成功', '1481095210');
INSERT INTO `ta_login_log` VALUES ('438', '1', '183.185.212.9', 'Windows 7', 'firefox-50', '登录成功', '1481105486');
INSERT INTO `ta_login_log` VALUES ('439', '1', '183.185.212.9', 'Windows 7', 'firefox-50', '登录成功', '1481105865');
INSERT INTO `ta_login_log` VALUES ('440', '1', '171.214.181.178', 'Windows 10', 'chrome-54', '登录成功', '1481126343');
INSERT INTO `ta_login_log` VALUES ('441', '1', '112.5.234.71', 'Windows 7', 'firefox-50', '登录成功', '1481130695');
INSERT INTO `ta_login_log` VALUES ('442', '1', '171.221.151.174', 'Windows 7', 'chrome-49', '登录成功', '1481131148');
INSERT INTO `ta_login_log` VALUES ('443', '1', '222.92.34.126', 'Windows 7', 'firefox-50', '登录成功', '1481139071');
INSERT INTO `ta_login_log` VALUES ('444', '1', '222.92.34.126', 'Windows 7', 'firefox-50', '登录成功', '1481139242');
INSERT INTO `ta_login_log` VALUES ('445', '1', '180.136.234.196', 'Linux', 'chrome-55', '登录成功', '1481161825');
INSERT INTO `ta_login_log` VALUES ('446', '1', '222.222.20.21', 'Windows 7', 'chrome-54', '登录成功', '1481162536');
INSERT INTO `ta_login_log` VALUES ('447', '1', '180.136.234.196', 'Linux', 'chrome-55', '登录成功', '1481163465');
INSERT INTO `ta_login_log` VALUES ('448', '1', '182.139.184.236', 'Windows 10', 'chrome-49', '登录成功', '1481164163');
INSERT INTO `ta_login_log` VALUES ('449', '1', '182.139.184.236', 'Windows 10', 'chrome-49', '登录成功', '1481164559');
INSERT INTO `ta_login_log` VALUES ('450', '1', '118.81.242.77', 'Windows 7', 'firefox-50', '登录成功', '1481166134');
INSERT INTO `ta_login_log` VALUES ('451', '1', '222.173.94.214', 'Windows 7', 'ie-7', '登录成功', '1481167690');
INSERT INTO `ta_login_log` VALUES ('452', '1', '106.114.34.201', 'Windows NT', 'chrome-50', '登录成功', '1481169038');
INSERT INTO `ta_login_log` VALUES ('453', '1', '121.35.181.255', 'Windows 10', 'ie-7', '登录成功', '1481171558');
INSERT INTO `ta_login_log` VALUES ('454', '1', '171.116.56.158', 'Windows 7', 'firefox-50', '登录成功', '1481175312');
INSERT INTO `ta_login_log` VALUES ('455', '1', '180.112.168.88', 'Windows 7', 'firefox-50', '登录成功', '1481175340');
INSERT INTO `ta_login_log` VALUES ('456', '1', '220.248.37.214', 'Linux', 'chrome-54', '登录成功', '1481177853');
INSERT INTO `ta_login_log` VALUES ('457', '1', '113.139.192.131', 'Windows 7', 'ie-7', '登录成功', '1481178168');
INSERT INTO `ta_login_log` VALUES ('458', '1', '171.116.56.158', 'Windows 7', 'firefox-50', '登录成功', '1481179268');
INSERT INTO `ta_login_log` VALUES ('459', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '登录成功', '1481192945');
INSERT INTO `ta_login_log` VALUES ('460', '1', '115.183.206.26', 'Windows 7', 'ie-7', '登录成功', '1481193752');
INSERT INTO `ta_login_log` VALUES ('461', '1', '124.164.144.112', 'Windows 7', 'chrome-53', '登录成功', '1481200404');
INSERT INTO `ta_login_log` VALUES ('462', '1', '183.253.130.120', 'Windows 10', 'firefox-50', '登录成功', '1481211243');
INSERT INTO `ta_login_log` VALUES ('463', '1', '183.253.130.120', 'Windows 10', 'firefox-50', '用户留言-编辑失败 ID=28', '1481211306');
INSERT INTO `ta_login_log` VALUES ('464', '1', '183.253.130.120', 'Windows 10', 'firefox-50', '用户留言-添加成功', '1481211320');
INSERT INTO `ta_login_log` VALUES ('465', '1', '183.253.130.120', 'Windows 10', 'firefox-50', '用户留言-添加成功', '1481211326');
INSERT INTO `ta_login_log` VALUES ('466', '1', '183.253.130.120', 'Windows 10', 'firefox-50', '用户留言-添加成功', '1481211335');
INSERT INTO `ta_login_log` VALUES ('467', '1', '183.253.130.120', 'Windows 10', 'firefox-50', '角色管理-添加成功', '1481211364');
INSERT INTO `ta_login_log` VALUES ('468', '1', '183.253.130.120', 'Windows 10', 'firefox-50', '用户留言-添加成功', '1481211652');
INSERT INTO `ta_login_log` VALUES ('469', '1', '106.115.102.212', 'Windows 7', 'chrome-45', '登录成功', '1481213665');
INSERT INTO `ta_login_log` VALUES ('470', '1', '118.113.42.161', 'Windows 10', 'chrome-55', '登录成功', '1481215221');
INSERT INTO `ta_login_log` VALUES ('471', '1', '118.113.42.161', 'Windows 10', 'chrome-55', '登录成功', '1481216091');
INSERT INTO `ta_login_log` VALUES ('472', '1', '113.106.8.232', 'Windows 7', 'chrome-35', '登录成功', '1481244913');
INSERT INTO `ta_login_log` VALUES ('473', '1', '113.106.8.232', 'Windows 7', 'chrome-35', '登录成功', '1481244990');
INSERT INTO `ta_login_log` VALUES ('474', '1', '113.106.8.232', 'Windows 7', 'chrome-35', '登录成功', '1481245006');
INSERT INTO `ta_login_log` VALUES ('475', '1', '113.106.8.232', 'Windows 7', 'chrome-35', '登录成功', '1481245012');
INSERT INTO `ta_login_log` VALUES ('476', '1', '113.106.8.232', 'Windows 7', 'chrome-35', '登录成功', '1481245016');
INSERT INTO `ta_login_log` VALUES ('477', '1', '113.106.8.232', 'Windows 7', 'chrome-35', '登录成功', '1481245080');
INSERT INTO `ta_login_log` VALUES ('478', '1', '113.106.8.232', 'Windows 7', 'chrome-35', '登录成功', '1481245138');
INSERT INTO `ta_login_log` VALUES ('479', '1', '222.161.2.151', 'Windows 10', 'ie-7', '登录成功', '1481251685');
INSERT INTO `ta_login_log` VALUES ('480', '1', '111.201.32.149', 'Windows 10', 'chrome-52', '登录成功', '1481255117');
INSERT INTO `ta_login_log` VALUES ('481', '1', '101.85.6.156', 'Windows 7', 'firefox-50', '登录成功', '1481266662');
INSERT INTO `ta_login_log` VALUES ('482', '1', '121.201.63.88', 'Windows 10', 'chrome-54', '登录成功', '1481267478');
INSERT INTO `ta_login_log` VALUES ('483', '1', '121.69.46.54', 'unknow', 'firefox-50', '登录成功', '1481267656');
INSERT INTO `ta_login_log` VALUES ('484', '1', '113.204.225.126', 'Windows 10', 'chrome-54', '登录成功', '1481269407');
INSERT INTO `ta_login_log` VALUES ('485', '1', '113.204.225.126', 'Windows 10', 'chrome-54', '角色管理-添加成功', '1481269463');
INSERT INTO `ta_login_log` VALUES ('486', '1', '113.204.225.126', 'Windows 10', 'chrome-54', '角色管理-编辑成功 ID=21', '1481269474');
INSERT INTO `ta_login_log` VALUES ('487', '1', '113.204.225.126', 'Windows 10', 'chrome-54', '角色管理-编辑成功 ID=21', '1481269496');
INSERT INTO `ta_login_log` VALUES ('488', '1', '171.221.151.174', 'Windows 7', 'chrome-49', '登录成功', '1481272327');
INSERT INTO `ta_login_log` VALUES ('489', '1', '171.221.151.174', 'Windows 7', 'chrome-49', '登录成功', '1481273484');
INSERT INTO `ta_login_log` VALUES ('490', '1', '61.242.42.219', 'Windows 10', 'chrome-51', '登录成功', '1481276250');
INSERT INTO `ta_login_log` VALUES ('491', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '登录成功', '1481286566');
INSERT INTO `ta_login_log` VALUES ('492', '1', '222.35.157.81', 'unknow', 'chrome-54', '登录成功', '1481290562');
INSERT INTO `ta_login_log` VALUES ('493', '1', '222.55.65.223', 'Windows 7', 'chrome-52', '登录成功', '1481333182');
INSERT INTO `ta_login_log` VALUES ('494', '1', '27.184.49.204', 'Windows 7', 'chrome-54', '登录成功', '1481333500');
INSERT INTO `ta_login_log` VALUES ('495', '1', '221.237.179.109', 'Windows 7', 'chrome-45', '登录成功', '1481334063');
INSERT INTO `ta_login_log` VALUES ('496', '1', '116.112.12.73', 'Windows 7', 'chrome-38', '登录成功', '1481336471');
INSERT INTO `ta_login_log` VALUES ('497', '1', '116.112.12.73', 'Windows 7', 'chrome-38', '登录成功', '1481336488');
INSERT INTO `ta_login_log` VALUES ('498', '1', '116.112.12.73', 'Windows 7', 'chrome-38', '用户留言-添加成功', '1481336518');
INSERT INTO `ta_login_log` VALUES ('499', '1', '119.130.71.126', 'Windows 7', 'chrome-56', '登录成功', '1481337705');
INSERT INTO `ta_login_log` VALUES ('500', '1', '119.129.211.9', 'Windows 7', 'firefox-50', '登录成功', '1481341473');
INSERT INTO `ta_login_log` VALUES ('501', '1', '210.77.3.138', 'unknow', 'safari-601', '登录成功', '1481368421');
INSERT INTO `ta_login_log` VALUES ('502', '1', '144.52.89.129', 'Windows NT', 'chrome-45', '登录成功', '1481375180');
INSERT INTO `ta_login_log` VALUES ('503', '1', '122.227.195.38', 'Linux', 'chrome-54', '登录成功', '1481375247');
INSERT INTO `ta_login_log` VALUES ('504', '1', '122.79.73.81', 'Windows 10', 'chrome-54', '登录成功', '1481378525');
INSERT INTO `ta_login_log` VALUES ('505', '1', '120.85.85.232', 'Windows 10', 'chrome-53', '登录成功', '1481431327');
INSERT INTO `ta_login_log` VALUES ('506', '1', '218.19.99.248', 'Windows 10', 'chrome-55', '登录成功', '1481443735');
INSERT INTO `ta_login_log` VALUES ('507', '1', '116.243.174.40', 'unknow', 'chrome-54', '登录成功', '1481459793');
INSERT INTO `ta_login_log` VALUES ('508', '1', '106.114.34.201', 'Windows NT', 'chrome-50', '登录成功', '1481462508');
INSERT INTO `ta_login_log` VALUES ('509', '1', '14.131.248.78', 'Windows 10', 'chrome-55', '登录成功', '1481466886');
INSERT INTO `ta_login_log` VALUES ('510', '1', '183.12.65.179', 'Windows 7', 'chrome-54', '登录成功', '1481510977');
INSERT INTO `ta_login_log` VALUES ('511', '1', '183.12.65.179', 'Windows 7', 'chrome-54', '登录成功', '1481511026');
INSERT INTO `ta_login_log` VALUES ('512', '1', '183.12.65.179', 'Windows 7', 'chrome-54', '登录成功', '1481511036');
INSERT INTO `ta_login_log` VALUES ('513', '1', '203.198.38.88', 'Windows 7', 'chrome-54', '登录成功', '1481512871');
INSERT INTO `ta_login_log` VALUES ('514', '1', '59.57.120.10', 'Windows 7', 'ie-7', '登录成功', '1481519436');
INSERT INTO `ta_login_log` VALUES ('515', '1', '112.229.107.199', 'Windows 7', 'firefox-50', '登录成功', '1481523113');
INSERT INTO `ta_login_log` VALUES ('516', '1', '113.73.8.93', 'Windows 10', 'chrome-49', '登录成功', '1481529412');
INSERT INTO `ta_login_log` VALUES ('517', '1', '220.231.46.194', 'unknow', 'chrome-55', '登录成功', '1481530883');
INSERT INTO `ta_login_log` VALUES ('518', '1', '220.231.46.194', 'unknow', 'chrome-55', '用户留言-添加成功', '1481530979');
INSERT INTO `ta_login_log` VALUES ('519', '1', '220.231.46.194', 'unknow', 'chrome-55', '登录成功', '1481531030');
INSERT INTO `ta_login_log` VALUES ('520', '1', '220.231.46.194', 'unknow', 'chrome-55', '登录成功', '1481533399');
INSERT INTO `ta_login_log` VALUES ('521', '1', '140.255.151.208', 'Windows 10', 'firefox-50', '登录成功', '1481542668');
INSERT INTO `ta_login_log` VALUES ('522', '1', '140.255.151.208', 'Windows 10', 'firefox-50', '登录成功', '1481542723');
INSERT INTO `ta_login_log` VALUES ('523', '1', '116.1.126.16', 'Windows 7', 'chrome-49', '登录成功', '1481549763');
INSERT INTO `ta_login_log` VALUES ('524', '1', '114.39.216.15', 'Linux', 'chrome-54', '登录成功', '1481550398');
INSERT INTO `ta_login_log` VALUES ('525', '1', '112.5.237.78', 'Windows 7', 'chrome-56', '登录成功', '1481551331');
INSERT INTO `ta_login_log` VALUES ('526', '1', '112.5.237.78', 'Windows 7', 'chrome-56', '登录成功', '1481551367');
INSERT INTO `ta_login_log` VALUES ('527', '1', '112.5.237.78', 'Windows 7', 'chrome-56', '登录成功', '1481551382');
INSERT INTO `ta_login_log` VALUES ('528', '1', '112.5.237.78', 'Windows 7', 'chrome-56', '角色管理-添加成功', '1481551415');
INSERT INTO `ta_login_log` VALUES ('529', '1', '112.5.237.78', 'Windows 7', 'chrome-56', '角色管理-添加成功', '1481551425');
INSERT INTO `ta_login_log` VALUES ('530', '1', '112.5.237.78', 'Windows 7', 'chrome-56', '角色管理-编辑成功 ID=1', '1481551438');
INSERT INTO `ta_login_log` VALUES ('531', '1', '112.5.237.78', 'Windows 7', 'chrome-56', '角色管理-编辑成功 ID=21', '1481551651');
INSERT INTO `ta_login_log` VALUES ('532', '1', '123.121.32.39', 'Windows 10', 'chrome-55', '登录成功', '1481561179');
INSERT INTO `ta_login_log` VALUES ('533', '1', '14.217.203.0', 'Windows 7', 'firefox-50', '登录成功', '1481562209');
INSERT INTO `ta_login_log` VALUES ('534', '1', '113.225.62.1', 'Windows 7', 'ie-unknow', '登录成功', '1481595184');
INSERT INTO `ta_login_log` VALUES ('535', '1', '171.116.200.106', 'Windows 10', 'chrome-55', '登录成功', '1481595204');
INSERT INTO `ta_login_log` VALUES ('536', '1', '113.104.33.115', 'Windows 7', 'firefox-50', '登录成功', '1481596471');
INSERT INTO `ta_login_log` VALUES ('537', '1', '114.242.8.210', 'Windows 10', 'firefox-50', '登录成功', '1481597563');
INSERT INTO `ta_login_log` VALUES ('538', '1', '117.158.206.86', 'Windows 7', 'chrome-54', '登录成功', '1481600472');
INSERT INTO `ta_login_log` VALUES ('539', '1', '123.152.35.167', 'Windows 95', 'chrome-50', '登录成功', '1481603269');
INSERT INTO `ta_login_log` VALUES ('540', '1', '119.137.1.239', 'Windows 10', 'chrome-50', '登录成功', '1481608940');
INSERT INTO `ta_login_log` VALUES ('541', '1', '61.132.135.106', 'Windows 10', 'chrome-50', '登录成功', '1481615220');
INSERT INTO `ta_login_log` VALUES ('542', '1', '60.221.133.101', 'Windows 7', 'chrome-54', '登录成功', '1481615222');
INSERT INTO `ta_login_log` VALUES ('543', '1', '61.132.135.106', 'Windows 10', 'chrome-50', '账号管理-添加成功', '1481615359');
INSERT INTO `ta_login_log` VALUES ('544', '1', '125.92.131.254', 'Windows 10', 'chrome-49', '登录成功', '1481616410');
INSERT INTO `ta_login_log` VALUES ('545', '1', '49.77.130.5', 'Windows 7', 'chrome-45', '登录成功', '1481619794');
INSERT INTO `ta_login_log` VALUES ('546', '1', '112.230.187.16', 'Windows 7', 'chrome-45', '登录成功', '1481675511');
INSERT INTO `ta_login_log` VALUES ('547', '1', '222.74.205.2', 'Windows 7', 'chrome-45', '登录成功', '1481677545');
INSERT INTO `ta_login_log` VALUES ('548', '1', '222.74.205.2', 'Windows 7', 'chrome-45', '用户留言-添加成功', '1481677981');
INSERT INTO `ta_login_log` VALUES ('549', '1', '222.74.205.2', 'Windows 7', 'chrome-45', '缓存已更新', '1481679648');
INSERT INTO `ta_login_log` VALUES ('550', '1', '222.74.205.2', 'Windows 7', 'chrome-45', '登录成功', '1481680173');
INSERT INTO `ta_login_log` VALUES ('551', '1', '222.74.205.2', 'Windows 7', 'chrome-45', '缓存已更新', '1481680308');
INSERT INTO `ta_login_log` VALUES ('552', '1', '222.74.205.2', 'Windows 7', 'chrome-45', '菜单节点管理-删除成功 IDS=s:3:\"137\";', '1481680337');
INSERT INTO `ta_login_log` VALUES ('553', '1', '222.74.205.2', 'Windows 7', 'chrome-45', '缓存已更新', '1481680392');
INSERT INTO `ta_login_log` VALUES ('554', '1', '222.74.205.2', 'Windows 7', 'chrome-45', '登录成功', '1481687228');
INSERT INTO `ta_login_log` VALUES ('555', '1', '219.133.226.120', 'Windows 10', 'ie-7', '登录成功', '1481695051');
INSERT INTO `ta_login_log` VALUES ('556', '1', '219.133.226.120', 'Windows 10', 'chrome-45', '缓存已更新', '1481695272');
INSERT INTO `ta_login_log` VALUES ('557', '1', '219.133.226.120', 'Windows 10', 'chrome-45', '账号管理-编辑成功', '1481695347');
INSERT INTO `ta_login_log` VALUES ('558', '1', '219.133.226.120', 'Windows 10', 'chrome-45', '登录成功', '1481695466');
INSERT INTO `ta_login_log` VALUES ('559', '1', '221.2.139.217', 'Windows 7', 'chrome-54', '登录成功', '1481696959');
INSERT INTO `ta_login_log` VALUES ('560', '1', '144.52.89.129', 'Windows NT', 'chrome-45', '登录成功', '1481720668');
INSERT INTO `ta_login_log` VALUES ('561', '1', '124.225.238.111', 'Windows 7', 'ie-7', '登录成功', '1481725498');
INSERT INTO `ta_login_log` VALUES ('562', '1', '123.119.226.211', 'Windows 10', 'chrome-54', '登录成功', '1481751641');
INSERT INTO `ta_login_log` VALUES ('563', '1', '123.119.226.211', 'Windows 10', 'chrome-54', '角色管理-添加成功', '1481751766');
INSERT INTO `ta_login_log` VALUES ('564', '1', '119.129.209.39', 'Windows 7', 'firefox-50', '登录成功', '1481762689');
INSERT INTO `ta_login_log` VALUES ('565', '1', '111.200.52.2', 'Windows 10', 'chrome-54', '登录成功', '1481770356');
INSERT INTO `ta_login_log` VALUES ('566', '1', '61.52.243.140', 'Windows 10', 'firefox-50', '登录成功', '1481779038');
INSERT INTO `ta_login_log` VALUES ('567', '1', '58.251.52.117', 'Windows 7', 'chrome-45', '登录成功', '1481780113');
INSERT INTO `ta_login_log` VALUES ('568', '1', '61.235.65.164', 'Windows 7', 'firefox-50', '登录成功', '1481782252');
INSERT INTO `ta_login_log` VALUES ('569', '1', '119.129.209.39', 'Windows 7', 'firefox-50', '登录成功', '1481785782');
INSERT INTO `ta_login_log` VALUES ('570', '1', '49.149.4.199', 'Windows 10', 'chrome-55', '登录成功', '1481785840');
INSERT INTO `ta_login_log` VALUES ('571', '1', '119.129.209.39', 'Windows 7', 'firefox-50', '登录成功', '1481786362');
INSERT INTO `ta_login_log` VALUES ('572', '1', '110.184.242.62', 'Windows 7', 'chrome-44', '登录成功', '1481788362');
INSERT INTO `ta_login_log` VALUES ('573', '1', '110.184.242.62', 'Windows 7', 'chrome-44', '账号管理-添加成功', '1481788437');
INSERT INTO `ta_login_log` VALUES ('574', '0', '110.184.242.62', 'Windows 7', 'chrome-44', '登录失败, [username_mobile: pcc],[ status: 该手机号未注册！ ],[password: 8d290009****************49466412]', '1481788483');
INSERT INTO `ta_login_log` VALUES ('575', '0', '110.184.242.62', 'Windows 7', 'chrome-44', '登录失败, [username_mobile: 18030877380],[ status: 该手机号未注册！ ],[password: 8d290009****************49466412]', '1481788493');
INSERT INTO `ta_login_log` VALUES ('576', '0', '110.184.242.62', 'Windows 7', 'chrome-44', '登录失败, [username_mobile: 18030877380],[ status: 该手机号未注册！ ],[password: 8d290009****************49466412]', '1481788493');
INSERT INTO `ta_login_log` VALUES ('577', '0', '110.184.242.62', 'Windows 7', 'chrome-44', '登录失败, [username_mobile: 18030877380],[ status: 该手机号未注册！ ],[password: 8d290009****************49466412]', '1481788493');
INSERT INTO `ta_login_log` VALUES ('578', '0', '110.184.242.62', 'Windows 7', 'chrome-44', '登录失败, [username_mobile: 18030877380],[ status: 该手机号未注册！ ],[password: 8d290009****************49466412]', '1481788494');
INSERT INTO `ta_login_log` VALUES ('579', '0', '110.184.242.62', 'Windows 7', 'chrome-44', '登录失败, [username_mobile: 18030877380],[ status: 该手机号未注册！ ],[password: 8d290009****************49466412]', '1481788494');
INSERT INTO `ta_login_log` VALUES ('580', '0', '110.184.242.62', 'Windows 7', 'chrome-44', '登录失败, [username_mobile: 18030877380],[ status: 该手机号未注册！ ],[password: 8d290009****************49466412]', '1481788494');
INSERT INTO `ta_login_log` VALUES ('581', '0', '110.184.242.62', 'Windows 7', 'chrome-44', '登录失败, [username_mobile: 18030877380],[ status: 该手机号未注册！ ],[password: 8d290009****************49466412]', '1481788495');
INSERT INTO `ta_login_log` VALUES ('582', '1', '110.184.242.62', 'Windows 7', 'chrome-44', '登录成功', '1481788502');
INSERT INTO `ta_login_log` VALUES ('583', '0', '110.184.242.62', 'Windows 7', 'chrome-44', '登录失败, [username_mobile: 18503087738],[ status: 该账号未授权，请联系超级管理。 ],[password: 8d290009****************49466412]', '1481788520');
INSERT INTO `ta_login_log` VALUES ('584', '1', '110.184.242.62', 'Windows 7', 'chrome-44', '登录成功', '1481788526');
INSERT INTO `ta_login_log` VALUES ('585', '26', '110.184.242.62', 'Windows 7', 'chrome-44', '登录成功', '1481788550');
INSERT INTO `ta_login_log` VALUES ('586', '1', '220.248.37.214', 'Linux', 'chrome-55', '登录成功', '1481790120');
INSERT INTO `ta_login_log` VALUES ('587', '1', '180.173.49.249', 'Windows 7', 'chrome-53', '登录成功', '1481795509');
INSERT INTO `ta_login_log` VALUES ('588', '1', '114.245.190.217', 'Windows 7', 'ie-7', '登录成功', '1481853832');
INSERT INTO `ta_login_log` VALUES ('589', '1', '58.218.196.214', 'unknow', 'safari-602', '登录成功', '1481859148');
INSERT INTO `ta_login_log` VALUES ('590', '1', '119.129.209.39', 'Windows 7', 'firefox-50', '登录成功', '1481859223');
INSERT INTO `ta_login_log` VALUES ('591', '1', '112.117.191.91', 'Windows 7', 'chrome-55', '登录成功', '1481866088');
INSERT INTO `ta_login_log` VALUES ('592', '1', '182.101.180.28', 'Windows 7', 'firefox-50', '登录成功', '1481875236');
INSERT INTO `ta_login_log` VALUES ('593', '1', '182.101.180.28', 'Windows 7', 'firefox-50', '登录成功', '1481875620');
INSERT INTO `ta_login_log` VALUES ('594', '1', '14.213.156.22', 'Windows 7', 'chrome-52', '登录成功', '1481876125');
INSERT INTO `ta_login_log` VALUES ('595', '1', '183.154.95.81', 'Windows 7', 'chrome-54', '登录成功', '1481879975');
INSERT INTO `ta_login_log` VALUES ('596', '1', '119.129.82.120', 'unknow', 'safari-602', '登录成功', '1481891365');
INSERT INTO `ta_login_log` VALUES ('597', '1', '119.101.46.26', 'Windows 7', 'ie-unknow', '登录成功', '1481891367');
INSERT INTO `ta_login_log` VALUES ('598', '1', '120.85.76.13', 'Windows 7', 'chrome-55', '登录成功', '1481891432');
INSERT INTO `ta_login_log` VALUES ('599', '1', '110.53.205.183', 'unknow', 'safari-602', '登录成功', '1481891459');
INSERT INTO `ta_login_log` VALUES ('600', '1', '110.228.105.72', 'Windows 10', 'chrome-45', '登录成功', '1481891463');
INSERT INTO `ta_login_log` VALUES ('601', '1', '223.74.155.238', 'unknow', 'safari-602', '登录成功', '1481891468');
INSERT INTO `ta_login_log` VALUES ('602', '1', '122.207.223.133', 'Windows 95', 'chrome-50', '登录成功', '1481891517');
INSERT INTO `ta_login_log` VALUES ('603', '1', '222.65.152.86', 'Windows 10', 'chrome-53', '登录成功', '1481891538');
INSERT INTO `ta_login_log` VALUES ('604', '1', '221.237.18.164', 'Windows 7', 'chrome-53', '登录成功', '1481891576');
INSERT INTO `ta_login_log` VALUES ('605', '1', '121.34.130.50', 'Windows 7', 'chrome-44', '登录成功', '1481891576');
INSERT INTO `ta_login_log` VALUES ('606', '1', '221.237.18.164', 'Windows 7', 'chrome-53', '登录成功', '1481891597');
INSERT INTO `ta_login_log` VALUES ('607', '1', '42.49.178.23', 'Windows 7', 'firefox-50', '登录成功', '1481891646');
INSERT INTO `ta_login_log` VALUES ('608', '1', '117.72.136.220', 'Windows 7', 'chrome-53', '登录成功', '1481891650');
INSERT INTO `ta_login_log` VALUES ('609', '1', '139.204.22.150', 'Windows 7', 'chrome-45', '登录成功', '1481891702');
INSERT INTO `ta_login_log` VALUES ('610', '1', '27.42.98.168', 'Windows 10', 'chrome-51', '登录成功', '1481891718');
INSERT INTO `ta_login_log` VALUES ('611', '1', '121.204.97.198', 'Windows 10', 'ie-7', '登录成功', '1481891785');
INSERT INTO `ta_login_log` VALUES ('612', '1', '45.32.89.40', 'Windows 7', 'firefox-50', '登录成功', '1481891798');
INSERT INTO `ta_login_log` VALUES ('613', '1', '61.183.140.250', 'Windows 10', 'chrome-54', '登录成功', '1481891839');
INSERT INTO `ta_login_log` VALUES ('614', '1', '27.151.94.54', 'Windows 7', 'firefox-50', '登录成功', '1481891902');
INSERT INTO `ta_login_log` VALUES ('615', '1', '218.77.74.149', 'Windows 10', 'chrome-55', '登录成功', '1481891909');
INSERT INTO `ta_login_log` VALUES ('616', '1', '218.109.219.105', 'Windows 7', 'chrome-50', '登录成功', '1481891926');
INSERT INTO `ta_login_log` VALUES ('617', '1', '140.240.114.213', 'Windows 7', 'chrome-54', '登录成功', '1481892014');
INSERT INTO `ta_login_log` VALUES ('618', '1', '58.51.23.68', 'Windows 7', 'firefox-50', '登录成功', '1481892068');
INSERT INTO `ta_login_log` VALUES ('619', '1', '218.77.74.149', 'Windows 10', 'chrome-55', '角色管理-编辑成功 ID=1', '1481892100');
INSERT INTO `ta_login_log` VALUES ('620', '1', '140.240.114.213', 'Windows 7', 'chrome-54', '缓存已更新', '1481892102');
INSERT INTO `ta_login_log` VALUES ('621', '1', '180.102.187.57', 'unknow', 'chrome-50', '登录成功', '1481892160');
INSERT INTO `ta_login_log` VALUES ('622', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482215158');
INSERT INTO `ta_login_log` VALUES ('623', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482289088');
INSERT INTO `ta_login_log` VALUES ('624', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482297092');
INSERT INTO `ta_login_log` VALUES ('625', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482311368');
INSERT INTO `ta_login_log` VALUES ('626', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482376069');
INSERT INTO `ta_login_log` VALUES ('627', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482376069');
INSERT INTO `ta_login_log` VALUES ('628', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482376244');
INSERT INTO `ta_login_log` VALUES ('629', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482376244');
INSERT INTO `ta_login_log` VALUES ('630', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482376244');
INSERT INTO `ta_login_log` VALUES ('631', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482376295');
INSERT INTO `ta_login_log` VALUES ('632', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482376295');
INSERT INTO `ta_login_log` VALUES ('633', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482376295');
INSERT INTO `ta_login_log` VALUES ('634', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482376295');
INSERT INTO `ta_login_log` VALUES ('635', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482376569');
INSERT INTO `ta_login_log` VALUES ('636', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482376569');
INSERT INTO `ta_login_log` VALUES ('637', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482376569');
INSERT INTO `ta_login_log` VALUES ('638', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482376569');
INSERT INTO `ta_login_log` VALUES ('639', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482376569');
INSERT INTO `ta_login_log` VALUES ('640', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482376737');
INSERT INTO `ta_login_log` VALUES ('641', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482376737');
INSERT INTO `ta_login_log` VALUES ('642', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482376737');
INSERT INTO `ta_login_log` VALUES ('643', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482376737');
INSERT INTO `ta_login_log` VALUES ('644', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482378546');
INSERT INTO `ta_login_log` VALUES ('645', '0', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482633506');
INSERT INTO `ta_login_log` VALUES ('646', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482636390');

-- ----------------------------
-- Table structure for ta_comment
-- ----------------------------
DROP TABLE IF EXISTS `ta_comment`;
CREATE TABLE `ta_comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(8) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `content` text,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ta_comment
-- ----------------------------
INSERT INTO `ta_comment` VALUES ('1', 'shijinro', 'imland@outlook.com', 'woshijirnongxiansen\nhengaoxian', '2147483647', null, null);
INSERT INTO `ta_comment` VALUES ('2', null, null, null, null, null, null);
INSERT INTO `ta_comment` VALUES ('3', null, null, null, null, null, null);
INSERT INTO `ta_comment` VALUES ('4', null, null, null, null, null, null);
INSERT INTO `ta_comment` VALUES ('5', null, null, null, null, null, null);
INSERT INTO `ta_comment` VALUES ('6', null, null, null, null, null, null);
INSERT INTO `ta_comment` VALUES ('7', null, null, null, null, null, null);
INSERT INTO `ta_comment` VALUES ('8', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for ta_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `ta_auth_rule`;
CREATE TABLE `ta_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `rule_val` varchar(255) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `update_time` int(11) DEFAULT NULL COMMENT '账户最后更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '软删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=179 DEFAULT CHARSET=utf8 COMMENT='权限规则表';

-- ----------------------------
-- Records of ta_auth_rule
-- ----------------------------
INSERT INTO `ta_auth_rule` VALUES ('1', '内容管理', 'admin/index/index', null, null);
INSERT INTO `ta_auth_rule` VALUES ('176', '用户管理', 'admin/user/index', null, null);

-- ----------------------------
-- Table structure for ta_auth_access
-- ----------------------------
DROP TABLE IF EXISTS `ta_auth_access`;
CREATE TABLE `ta_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_val` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_val`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限授权表';

-- ----------------------------
-- Records of ta_auth_access
-- ----------------------------
INSERT INTO `ta_auth_access` VALUES ('1', 'admin/Index/index');
INSERT INTO `ta_auth_access` VALUES ('1', 'admin/User/index');
INSERT INTO `ta_auth_access` VALUES ('2', 'admin/User/add');
INSERT INTO `ta_auth_access` VALUES ('2', 'admin/Test/index');
INSERT INTO `ta_auth_access` VALUES ('1', 'admin/Authrule/index1');
