# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 115.159.55.173 (MySQL 5.5.48-log)
# Database: tpadmin
# Generation Time: 2017-01-15 03:32:10 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table ta_auth_access
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ta_auth_access`;

CREATE TABLE `ta_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_id` mediumint(8) unsigned NOT NULL COMMENT '规则唯一英文标识,全小写',
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限授权表';

LOCK TABLES `ta_auth_access` WRITE;
/*!40000 ALTER TABLE `ta_auth_access` DISABLE KEYS */;

INSERT INTO `ta_auth_access` (`role_id`, `rule_id`)
VALUES
	(2,3),
	(1,2),
	(2,1),
	(3,2);

/*!40000 ALTER TABLE `ta_auth_access` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ta_auth_rule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ta_auth_rule`;

CREATE TABLE `ta_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `rule_val` varchar(255) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `pid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '父类ID',
  `update_time` int(11) DEFAULT NULL COMMENT '账户最后更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '软删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限规则表';

LOCK TABLES `ta_auth_rule` WRITE;
/*!40000 ALTER TABLE `ta_auth_rule` DISABLE KEYS */;

INSERT INTO `ta_auth_rule` (`id`, `title`, `rule_val`, `pid`, `update_time`, `delete_time`)
VALUES
	(1,'内容管理','admin/index/index',3,1484209924,NULL),
	(2,'用户管理','admin/user/index',6,1484145913,NULL),
	(3,'Admin/Index','admin/index',0,1483502713,NULL),
	(4,'Admin/Sdd','admin/sdd',0,1484131420,NULL),
	(6,'Admin/User','admin/user',0,1484145913,NULL),
	(7,'niu','admin/user/index',6,NULL,NULL);

/*!40000 ALTER TABLE `ta_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ta_log_record
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ta_log_record`;

CREATE TABLE `ta_log_record` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `os` varchar(18) DEFAULT NULL,
  `browser` varchar(30) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='后台操作日志记录';

LOCK TABLES `ta_log_record` WRITE;
/*!40000 ALTER TABLE `ta_log_record` DISABLE KEYS */;

INSERT INTO `ta_log_record` (`id`, `user_id`, `ip`, `os`, `browser`, `remark`, `create_time`)
VALUES
	(1,1,'222.27.239.218','Mac OS X 10_12_','chrome-55','登录成功',1484060254),
	(2,1,'222.27.239.218','Mac OS X 10_12_','safari-602','登录成功',1484060459),
	(3,1,'222.27.239.218','Mac OS X 10_12_','chrome-55','登录成功',1484060708),
	(4,1,'113.222.206.111','Windows 7','ie-9','登录成功',1484060921),
	(5,1,'139.207.155.229','Mac OS X','weixin-unknow','登录成功',1484061486),
	(6,1,'182.97.181.146','Linux','chrome-37','登录成功',1484062192),
	(7,1,'113.222.206.111','Linux','safari-537','登录成功',1484062207),
	(8,1,'123.120.79.206','Mac OS X','weixin-unknow','登录成功',1484062408),
	(9,1,'125.86.6.113','Mac OS X','weixin-unknow','登录成功',1484063111),
	(10,1,'222.27.239.238','Mac OS X','weixin-unknow','登录成功',1484063143),
	(11,1,'61.148.244.238','Linux','chrome-37','登录成功',1484064316),
	(12,1,'123.139.67.253','Mac OS X','weixin-unknow','登录成功',1484064900),
	(13,1,'123.139.67.253','Mac OS X','weixin-unknow','登录成功',1484064944),
	(14,1,'139.207.155.229','Mac OS X','weixin-unknow','登录成功',1484066819),
	(15,1,'139.207.155.229','Mac OS X','safari-602','登录成功',1484066888),
	(16,1,'223.104.38.32','Linux','chrome-37','登录成功',1484083750),
	(17,1,'223.104.3.242','Mac OS X','weixin-unknow','登录成功',1484088069),
	(18,1,'113.5.2.39','Linux','chrome-37','登录成功',1484094131),
	(19,1,'171.210.178.136','Mac OS X','weixin-unknow','登录成功',1484096723),
	(20,1,'183.38.245.12','Windows 7','chrome-55','登录成功',1484100769),
	(21,1,'183.38.245.14','Windows 7','chrome-55','登录成功',1484102239),
	(22,1,'183.38.245.14','Windows 7','firefox-50','登录成功',1484102289),
	(23,1,'183.38.245.12','Windows 7','chrome-45','登录成功',1484102304),
	(24,1,'58.38.116.152','Mac OS X','firefox-41','登录成功',1484105088),
	(25,1,'106.117.103.55','Windows 7','chrome-55','登录成功',1484106130),
	(26,1,'115.197.247.63','Windows 7','chrome-50','登录成功',1484119618),
	(27,1,'115.218.170.230','Windows 10','chrome-54','登录成功',1484120310),
	(28,1,'101.227.12.253','Windows 7','chrome-55','登录成功',1484121590),
	(29,1,'113.15.4.121','Windows NT','ie-7','登录成功',1484123500),
	(30,1,'36.47.163.248','Windows 7','chrome-55','登录成功',1484126769),
	(31,1,'183.16.5.35','Windows 10','ie-7','登录成功',1484127187),
	(32,1,'139.207.177.235','Mac OS X','weixin-unknow','登录成功',1484130280),
	(33,1,'115.206.55.15','Windows 7','ie-7','登录成功',1484130601),
	(34,1,'115.206.55.15','Windows 7','chrome-45','登录成功',1484131585),
	(35,1,'117.136.7.253','Linux','chrome-37','登录成功',1484133230),
	(36,1,'222.27.239.216','Mac OS X 10_12_2','chrome-55','登录成功',1484134228),
	(37,1,'222.137.71.212','Linux','firefox-45','Login succeed',1484137092),
	(38,1,'222.27.239.210','Mac OS X 10_12_2','chrome-55','登录成功',1484144296),
	(39,1,'121.31.153.106','Windows NT','chrome-45','登录成功',1484145800),
	(40,1,'115.181.78.228','Windows 10','chrome-49','登录成功',1484145832),
	(41,1,'121.31.153.106','Windows NT','chrome-45','Login succeed',1484145985),
	(42,1,'115.181.78.100','Windows 10','chrome-49','登录成功',1484149306),
	(43,1,'111.199.31.7','Windows 7','firefox-50','登录成功',1484150334),
	(44,1,'120.4.179.43','Windows 7','chrome-54','登录成功',1484152588),
	(45,1,'222.218.172.138','Windows NT','chrome-45','登录成功',1484162312),
	(46,1,'222.218.172.138','Windows NT','chrome-45','登录成功',1484167336),
	(47,1,'222.218.172.138','Windows NT','chrome-45','登录成功',1484168026),
	(48,1,'218.56.44.108','Windows XP','chrome-49','登录成功',1484180327),
	(49,1,'60.248.7.91','Windows 7','chrome-53','Login succeed',1484187360),
	(50,1,'218.7.248.102','Windows 7','chrome-55','登录成功',1484187697),
	(51,1,'121.8.157.19','Windows 7','chrome-54','登录成功',1484187700),
	(52,1,'120.236.167.91','Windows 7','chrome-53','登录成功',1484187945),
	(53,1,'113.92.35.179','Windows 7','chrome-55','登录成功',1484189716),
	(54,1,'60.18.143.27','Windows 10','ie-7','登录成功',1484190994),
	(55,1,'218.201.15.125','Windows 7','chrome-50','登录成功',1484191773),
	(56,1,'60.29.103.62','Windows 7','ie-7','登录成功',1484192406),
	(57,1,'222.188.158.64','Windows 7','chrome-45','登录成功',1484195890),
	(58,1,'42.89.6.254','Windows 10','chrome-39','登录成功',1484198735),
	(59,1,'223.104.17.187','Mac OS X 10_12_2','chrome-55','登录成功',1484198947),
	(60,1,'223.104.17.187','Mac OS X 10_12_2','chrome-55','登录成功',1484199092),
	(61,1,'218.76.215.195','Windows 7','chrome-51','登录成功',1484199236),
	(62,1,'119.251.145.175','Mac OS X','chrome-50','登录成功',1484201783),
	(63,1,'27.17.18.214','Windows 10','chrome-49','登录成功',1484201906),
	(64,1,'223.104.17.187','Mac OS X 10_12_2','chrome-55','Login succeed',1484202347),
	(65,1,'31.205.31.23','Windows 10','chrome-55','Login succeed',1484203248),
	(66,1,'14.116.36.240','Windows 7','chrome-49','登录成功',1484204457),
	(67,1,'119.79.20.203','Windows 10','chrome-55','登录成功',1484206953),
	(68,1,'58.48.90.209','Windows 7','chrome-47','登录成功',1484208571),
	(69,1,'114.82.164.168','Windows XP','ie-6','登录成功',1484208914),
	(70,1,'125.77.47.212','Windows 10','chrome-57','登录成功',1484209773),
	(71,1,'101.227.12.253','Windows 7','chrome-55','登录成功',1484214426),
	(72,1,'222.27.239.240','Mac OS X 10_12_2','chrome-55','登录成功',1484298597),
	(73,1,'14.158.210.227','Windows 7','firefox-50','登录成功',1484300863),
	(74,1,'27.223.75.102','Mac OS X','chrome-55','登录成功',1484362129),
	(75,1,'119.2.128.227','Windows 7','chrome-49','登录成功',1484368985),
	(76,1,'36.251.128.136','Windows 7','firefox-50','登录成功',1484373991),
	(77,1,'110.184.47.193','Mac OS X 10_12_2','chrome-55','登录成功',1484444938),
	(78,1,'110.184.40.9','Mac OS X 10_12_2','chrome-55','登录成功',1484448904),
	(79,4,'110.184.40.9','Mac OS X 10_12_2','chrome-55','登录成功',1484449096),
	(80,1,'110.184.40.9','Mac OS X 10_12_2','chrome-55','登录成功',1484449112);

/*!40000 ALTER TABLE `ta_log_record` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ta_role
# ------------------------------------------------------------

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='角色表';

LOCK TABLES `ta_role` WRITE;
/*!40000 ALTER TABLE `ta_role` DISABLE KEYS */;

INSERT INTO `ta_role` (`id`, `name`, `pid`, `status`, `remark`, `create_time`, `update_time`)
VALUES
	(1,'超级管理员1',0,1,'网站最高管理员权限！',1329633709,1329633709),
	(2,'测试角色',NULL,0,'测试角色',1482389092,0);

/*!40000 ALTER TABLE `ta_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ta_user
# ------------------------------------------------------------

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户表';

LOCK TABLES `ta_user` WRITE;
/*!40000 ALTER TABLE `ta_user` DISABLE KEYS */;

INSERT INTO `ta_user` (`id`, `username`, `mobile`, `password`, `status`, `create_time`, `administrator`, `role_id`, `update_time`, `delete_time`)
VALUES
	(1,'石金融','13330613321','4c3c8afaf91b4dd81bcf68ba519fa2f6',1,1478252401,1,2,1484214600,NULL),
	(3,'程斌','15116041105','4c3c8afaf91b4dd81bcf68ba519fa2f6',1,1483423025,0,0,1483423039,1483423039),
	(2,'管理员','15100000000','4c3c8afaf91b4dd81bcf68ba519fa2f6',1,1482835627,1,2,1484148776,NULL),
	(4,'aierui','13330613322','4c3c8afaf91b4dd81bcf68ba519fa2f6',1,1484448977,0,2,1484448977,NULL),
	(5,'test','13330613012','4c3c8afaf91b4dd81bcf68ba519fa2f6',1,1484449210,0,2,1484449239,1484449239);

/*!40000 ALTER TABLE `ta_user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
