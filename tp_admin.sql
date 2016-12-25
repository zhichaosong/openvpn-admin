/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50547
Source Host           : 127.0.0.1:3306
Source Database       : tp-admin

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2016-12-25 16:58:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ta_users
-- ----------------------------
DROP TABLE IF EXISTS `ta_users`;
CREATE TABLE `ta_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(16) DEFAULT NULL COMMENT '账号',
  `mobile` varchar(12) DEFAULT NULL COMMENT '手机号',
  `password` varchar(32) DEFAULT NULL COMMENT '密码',
  `status` int(11) DEFAULT '0' COMMENT '状态 （0禁止 1可用）',
  `createtime` int(11) DEFAULT NULL,
  `administrator` int(1) DEFAULT '0' COMMENT '1是0否',
  `updatetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of ta_users
-- ----------------------------
INSERT INTO `ta_users` VALUES ('1', 'shijinrong', '13330613321', 'fa710ee5e1165ca539f7300d21ada422', '1', '1478252401', '1', null);

-- ----------------------------
-- Table structure for ta_role_user
-- ----------------------------
DROP TABLE IF EXISTS `ta_role_user`;
CREATE TABLE `ta_role_user` (
  `role_id` int(11) unsigned DEFAULT '0' COMMENT '角色 id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

-- ----------------------------
-- Records of ta_role_user
-- ----------------------------
INSERT INTO `ta_role_user` VALUES ('2', '1');

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
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of ta_role
-- ----------------------------
INSERT INTO `ta_role` VALUES ('1', '超级管理员', '0', '1', '拥有网站最高管理员权限！', '1329633709', '1329633709', '0');
INSERT INTO `ta_role` VALUES ('2', '测试角色', null, '1', '测试角色', '1482389092', '0', '0');

-- ----------------------------
-- Table structure for ta_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `ta_auth_rule`;
CREATE TABLE `ta_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `rule_name` varchar(255) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(255) DEFAULT NULL COMMENT '额外url参数',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  PRIMARY KEY (`id`),
  KEY `module` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=174 DEFAULT CHARSET=utf8 COMMENT='权限规则表';

-- ----------------------------
-- Records of ta_auth_rule
-- ----------------------------
INSERT INTO `ta_auth_rule` VALUES ('1', '内容管理', 'admin/Index/index', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('2', '所有留言', 'api/guestbookadmin/index', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('3', '删除网站留言', 'api/guestbookadmin/delete', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('4', '评论管理', 'comment/commentadmin/index', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('5', '删除评论', 'comment/commentadmin/delete', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('6', '评论审核', 'comment/commentadmin/check', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('7', '文章管理', 'portal/adminpost/index', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('8', '文章排序', 'portal/adminpost/listorders', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('9', '文章置顶', 'portal/adminpost/top', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('10', '文章推荐', 'portal/adminpost/recommend', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('11', '批量移动', 'portal/adminpost/move', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('12', '文章审核', 'portal/adminpost/check', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('13', '删除文章', 'portal/adminpost/delete', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('14', '编辑文章', 'portal/adminpost/edit', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('15', '提交编辑', 'portal/adminpost/edit_post', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('16', '添加文章', 'portal/adminpost/add', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('17', '提交添加', 'portal/adminpost/add_post', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('18', '分类管理', 'portal/adminterm/index', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('19', '文章分类排序', 'portal/adminterm/listorders', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('20', '删除分类', 'portal/adminterm/delete', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('21', '编辑分类', 'portal/adminterm/edit', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('22', '提交编辑', 'portal/adminterm/edit_post', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('23', '添加分类', 'portal/adminterm/add', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('24', '提交添加', 'portal/adminterm/add_post', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('25', '页面管理', 'portal/adminpage/index', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('26', '页面排序', 'portal/adminpage/listorders', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('27', '删除页面', 'portal/adminpage/delete', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('28', '编辑页面', 'portal/adminpage/edit', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('29', '提交编辑', 'portal/adminpage/edit_post', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('30', '添加页面', 'portal/adminpage/add', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('31', '提交添加', 'portal/adminpage/add_post', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('32', '回收站', 'admin/recycle/default', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('33', '文章回收', 'portal/adminpost/recyclebin', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('34', '文章还原', 'portal/adminpost/restore', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('35', '彻底删除', 'portal/adminpost/clean', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('36', '页面回收', 'portal/adminpage/recyclebin', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('37', '彻底删除', 'portal/adminpage/clean', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('38', '页面还原', 'portal/adminpage/restore', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('39', '扩展工具', 'admin/extension/default', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('40', '备份管理', 'admin/backup/default', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('41', '数据还原', 'admin/backup/restore', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('42', '数据备份', 'admin/backup/index', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('43', '提交数据备份', 'admin/backup/index_post', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('44', '下载备份', 'admin/backup/download', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('45', '删除备份', 'admin/backup/del_backup', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('46', '数据备份导入', 'admin/backup/import', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('47', '插件管理', 'admin/plugin/index', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('48', '插件启用切换', 'admin/plugin/toggle', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('49', '插件设置', 'admin/plugin/setting', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('50', '插件设置提交', 'admin/plugin/setting_post', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('51', '插件安装', 'admin/plugin/install', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('52', '插件卸载', 'admin/plugin/uninstall', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('53', '幻灯片', 'admin/slide/default', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('54', '幻灯片管理', 'admin/slide/index', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('55', '幻灯片排序', 'admin/slide/listorders', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('56', '幻灯片显示切换', 'admin/slide/toggle', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('57', '删除幻灯片', 'admin/slide/delete', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('58', '编辑幻灯片', 'admin/slide/edit', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('59', '提交编辑', 'admin/slide/edit_post', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('60', '添加幻灯片', 'admin/slide/add', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('61', '提交添加', 'admin/slide/add_post', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('62', '幻灯片分类', 'admin/slidecat/index', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('63', '删除分类', 'admin/slidecat/delete', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('64', '编辑分类', 'admin/slidecat/edit', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('65', '提交编辑', 'admin/slidecat/edit_post', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('66', '添加分类', 'admin/slidecat/add', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('67', '提交添加', 'admin/slidecat/add_post', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('68', '网站广告', 'admin/ad/index', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('69', '广告显示切换', 'admin/ad/toggle', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('70', '删除广告', 'admin/ad/delete', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('71', '编辑广告', 'admin/ad/edit', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('72', '提交编辑', 'admin/ad/edit_post', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('73', '添加广告', 'admin/ad/add', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('74', '提交添加', 'admin/ad/add_post', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('75', '友情链接', 'admin/link/index', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('76', '友情链接排序', 'admin/link/listorders', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('77', '友链显示切换', 'admin/link/toggle', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('78', '删除友情链接', 'admin/link/delete', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('79', '编辑友情链接', 'admin/link/edit', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('80', '提交编辑', 'admin/link/edit_post', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('81', '添加友情链接', 'admin/link/add', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('82', '提交添加', 'admin/link/add_post', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('83', '第三方登陆', 'api/oauthadmin/setting', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('84', '提交设置', 'api/oauthadmin/setting_post', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('85', '菜单管理', 'admin/menu/default', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('86', '前台菜单', 'admin/navcat/default1', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('87', '菜单管理', 'admin/nav/index', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('88', '前台导航排序', 'admin/nav/listorders', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('89', '删除菜单', 'admin/nav/delete', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('90', '编辑菜单', 'admin/nav/edit', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('91', '提交编辑', 'admin/nav/edit_post', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('92', '添加菜单', 'admin/nav/add', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('93', '提交添加', 'admin/nav/add_post', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('94', '菜单分类', 'admin/navcat/index', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('95', '删除分类', 'admin/navcat/delete', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('96', '编辑分类', 'admin/navcat/edit', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('97', '提交编辑', 'admin/navcat/edit_post', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('98', '添加分类', 'admin/navcat/add', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('99', '提交添加', 'admin/navcat/add_post', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('100', '后台菜单', 'admin/menu/index', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('101', '添加菜单', 'admin/menu/add', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('102', '提交添加', 'admin/menu/add_post', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('103', '后台菜单排序', 'admin/menu/listorders', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('104', '菜单备份', 'admin/menu/export_menu', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('105', '编辑菜单', 'admin/menu/edit', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('106', '提交编辑', 'admin/menu/edit_post', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('107', '删除菜单', 'admin/menu/delete', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('108', '所有菜单', 'admin/menu/lists', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('109', '设置', 'admin/setting/default', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('110', '个人信息', 'admin/setting/userdefault', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('111', '修改信息', 'admin/user/userinfo', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('112', '修改信息提交', 'admin/user/userinfo_post', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('113', '修改密码', 'admin/setting/password', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('114', '提交修改', 'admin/setting/password_post', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('115', '网站信息', 'admin/setting/site', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('116', '提交修改', 'admin/setting/site_post', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('117', '路由列表', 'admin/route/index', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('118', '路由添加', 'admin/route/add', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('119', '路由添加提交', 'admin/route/add_post', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('120', '路由编辑', 'admin/route/edit', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('121', '路由编辑提交', 'admin/route/edit_post', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('122', '路由删除', 'admin/route/delete', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('123', '路由禁止', 'admin/route/ban', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('124', '路由启用', 'admin/route/open', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('125', '路由排序', 'admin/route/listorders', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('126', '邮箱配置', 'admin/mailer/default', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('127', 'SMTP配置', 'admin/mailer/index', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('128', '提交配置', 'admin/mailer/index_post', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('129', '注册邮件模板', 'admin/mailer/active', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('130', '提交模板', 'admin/mailer/active_post', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('131', '清除缓存', 'admin/setting/clearcache', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('132', '用户管理', 'user/indexadmin/default', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('133', '用户组', 'user/indexadmin/default1', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('134', '本站用户', 'user/indexadmin/index', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('135', '拉黑会员', 'user/indexadmin/ban', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('136', '启用会员', 'user/indexadmin/cancelban', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('137', '第三方用户', 'user/oauthadmin/index', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('138', '第三方用户解绑', 'user/oauthadmin/delete', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('139', '管理组', 'user/indexadmin/default3', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('140', '角色管理', 'admin/rbac/index', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('141', '成员管理', 'admin/rbac/member', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('142', '权限设置', 'admin/rbac/authorize', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('143', '提交设置', 'admin/rbac/authorize_post', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('144', '编辑角色', 'admin/rbac/roleedit', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('145', '提交编辑', 'admin/rbac/roleedit_post', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('146', '删除角色', 'admin/rbac/roledelete', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('147', '添加角色', 'admin/rbac/roleadd', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('148', '提交添加', 'admin/rbac/roleadd_post', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('149', '管理员', 'admin/user/index', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('150', '删除管理员', 'admin/user/delete', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('151', '管理员编辑', 'admin/user/edit', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('152', '编辑提交', 'admin/user/edit_post', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('153', '管理员添加', 'admin/user/add', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('154', '添加提交', 'admin/user/add_post', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('155', '插件更新', 'admin/plugin/update', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('156', '文件存储', 'admin/storage/index', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('157', '文件存储设置提交', 'admin/storage/setting_post', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('158', '禁用幻灯片', 'admin/slide/ban', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('159', '启用幻灯片', 'admin/slide/cancelban', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('160', '禁用管理员', 'admin/user/ban', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('161', '启用管理员', 'admin/user/cancelban', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('162', '', 'demo/adminindex/index', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('163', '', 'demo/adminindex/last', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('166', '测试邮件', 'admin/mailer/test', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('167', '上传设置', 'admin/setting/upload', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('168', '上传设置提交', 'admin/setting/upload_post', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('169', '文章批量复制', 'portal/adminpost/copy', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('170', '备份菜单', 'admin/menu/backup_menu', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('171', '导出后台菜单多语言包', 'admin/menu/export_menu_lang', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('172', '还原菜单', 'admin/menu/restore_menu', null, '1');
INSERT INTO `ta_auth_rule` VALUES ('173', '导入新菜单', 'admin/menu/getactions', null, '1');

-- ----------------------------
-- Table structure for ta_auth_access
-- ----------------------------
DROP TABLE IF EXISTS `ta_auth_access`;
CREATE TABLE `ta_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限授权表';

-- ----------------------------
-- Records of ta_auth_access
-- ----------------------------
INSERT INTO `ta_auth_access` VALUES ('2', 'admin/Index/index');
INSERT INTO `ta_auth_access` VALUES ('2', 'admin/User/index');
INSERT INTO `ta_auth_access` VALUES ('2', 'admin/User/add');
INSERT INTO `ta_auth_access` VALUES ('2', 'admin/Test/index');

-- ----------------------------
-- Table structure for log_record
-- ----------------------------
DROP TABLE IF EXISTS `log_record`;
CREATE TABLE `log_record` (
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
-- Records of log_record
-- ----------------------------
INSERT INTO `log_record` VALUES ('1', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '登录成功', '1479710208');
INSERT INTO `log_record` VALUES ('2', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '账号管理-编辑成功', '1479710290');
INSERT INTO `log_record` VALUES ('3', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '登录成功', '1479710504');
INSERT INTO `log_record` VALUES ('4', '1', '180.173.20.172', 'Windows NT', 'chrome-56', '登录成功', '1479710571');
INSERT INTO `log_record` VALUES ('5', '1', '124.128.200.253', 'Windows 10', 'chrome-45', '登录成功', '1479710656');
INSERT INTO `log_record` VALUES ('6', '1', '180.173.20.172', 'Windows NT', 'chrome-56', '登录成功', '1479710657');
INSERT INTO `log_record` VALUES ('7', '1', '182.149.168.207', 'Windows 7', 'chrome-53', '登录成功', '1479712373');
INSERT INTO `log_record` VALUES ('8', '1', '14.23.101.244', 'Windows 7', 'chrome-54', '登录成功', '1479712786');
INSERT INTO `log_record` VALUES ('9', '1', '14.23.101.244', 'Windows 7', 'chrome-54', '缓存已更新', '1479713190');
INSERT INTO `log_record` VALUES ('10', '1', '116.30.244.96', 'Windows 7', 'chrome-53', '登录成功', '1479713688');
INSERT INTO `log_record` VALUES ('11', '1', '116.30.244.96', 'Windows 7', 'chrome-53', '账号管理-添加成功', '1479713813');
INSERT INTO `log_record` VALUES ('12', '1', '61.145.59.18', 'Windows 7', 'chrome-49', '登录成功', '1479714491');
INSERT INTO `log_record` VALUES ('13', '1', '124.128.200.253', 'Windows 10', 'chrome-45', '登录成功', '1479714492');
INSERT INTO `log_record` VALUES ('14', '1', '117.40.187.178', 'Windows 7', 'chrome-47', '登录成功', '1479716554');
INSERT INTO `log_record` VALUES ('15', '1', '218.29.222.66', 'unknow', 'chrome-45', '登录成功', '1479716568');
INSERT INTO `log_record` VALUES ('16', '1', '117.40.187.178', 'Windows 7', 'chrome-47', '菜单管理-添加成功', '1479716730');
INSERT INTO `log_record` VALUES ('17', '1', '218.29.222.66', 'unknow', 'chrome-45', '登录成功', '1479716855');
INSERT INTO `log_record` VALUES ('18', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '登录成功', '1479717141');
INSERT INTO `log_record` VALUES ('19', '1', '218.207.196.92', 'Windows 10', 'chrome-49', '登录成功', '1479717471');
INSERT INTO `log_record` VALUES ('20', '1', '202.118.212.136', 'Windows 10', 'chrome-53', '登录成功', '1479721402');
INSERT INTO `log_record` VALUES ('21', '1', '218.17.157.203', 'Windows 7', 'chrome-45', '登录成功', '1479724235');
INSERT INTO `log_record` VALUES ('22', '1', '101.251.0.137', 'Windows 10', 'chrome-54', '登录成功', '1479726508');
INSERT INTO `log_record` VALUES ('23', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '登录成功', '1479727837');
INSERT INTO `log_record` VALUES ('24', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479727867');
INSERT INTO `log_record` VALUES ('25', '1', '140.255.137.109', 'unknow', 'chrome-54', '登录成功', '1479728499');
INSERT INTO `log_record` VALUES ('26', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479728532');
INSERT INTO `log_record` VALUES ('27', '1', '123.139.212.229', 'Windows NT', 'ie-7', '登录成功', '1479728887');
INSERT INTO `log_record` VALUES ('28', '1', '123.139.212.229', 'Windows NT', 'chrome-45', '菜单管理-添加成功', '1479729080');
INSERT INTO `log_record` VALUES ('29', '1', '27.189.220.29', 'Windows 95', 'chrome-50', '登录成功', '1479731535');
INSERT INTO `log_record` VALUES ('30', '1', '123.139.29.222', 'unknow', 'chrome-54', '登录成功', '1479735797');
INSERT INTO `log_record` VALUES ('31', '0', '202.118.212.36', 'Windows 10', 'chrome-53', '登录失败, [username_mobile: 13330613321],[ status: 密码错误！ ],[password: a0dca4d0****************ba444758]', '1479736880');
INSERT INTO `log_record` VALUES ('32', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '登录成功', '1479737068');
INSERT INTO `log_record` VALUES ('33', '1', '118.186.143.112', 'unknow', 'chrome-54', '登录成功', '1479737152');
INSERT INTO `log_record` VALUES ('34', '1', '125.84.189.47', 'Windows 10', 'chrome-53', '登录成功', '1479737257');
INSERT INTO `log_record` VALUES ('35', '1', '111.10.118.126', 'unknow', 'safari-7543', '登录成功', '1479741956');
INSERT INTO `log_record` VALUES ('36', '1', '171.34.214.64', 'Windows 7', 'chrome-50', '登录成功', '1479743816');
INSERT INTO `log_record` VALUES ('37', '1', '111.10.118.126', 'unknow', 'safari-7543', '账号管理-添加成功', '1479744204');
INSERT INTO `log_record` VALUES ('38', '22', '111.10.118.126', 'unknow', 'safari-7543', '登录成功', '1479744252');
INSERT INTO `log_record` VALUES ('39', '1', '14.23.101.244', 'Windows 7', 'chrome-54', '登录成功', '1479774453');
INSERT INTO `log_record` VALUES ('40', '1', '124.128.200.253', 'Windows 10', 'chrome-45', '登录成功', '1479776167');
INSERT INTO `log_record` VALUES ('41', '1', '202.104.122.154', 'Windows 10', 'chrome-54', '登录成功', '1479776991');
INSERT INTO `log_record` VALUES ('42', '1', '202.104.122.154', 'Windows 7', 'chrome-54', '登录成功', '1479777926');
INSERT INTO `log_record` VALUES ('43', '1', '27.191.4.120', 'Windows 7', 'firefox-49', '登录成功', '1479778312');
INSERT INTO `log_record` VALUES ('44', '1', '14.119.122.239', 'Windows 10', 'firefox-49', '登录成功', '1479779368');
INSERT INTO `log_record` VALUES ('45', '1', '14.119.122.239', 'Windows 10', 'firefox-49', '角色管理-编辑成功 ID=2', '1479779424');
INSERT INTO `log_record` VALUES ('46', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '登录成功', '1479779602');
INSERT INTO `log_record` VALUES ('47', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479779733');
INSERT INTO `log_record` VALUES ('48', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479779760');
INSERT INTO `log_record` VALUES ('49', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479779766');
INSERT INTO `log_record` VALUES ('50', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479779795');
INSERT INTO `log_record` VALUES ('51', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479779832');
INSERT INTO `log_record` VALUES ('52', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479779852');
INSERT INTO `log_record` VALUES ('53', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '角色管理-编辑失败 IDS=s:5:\"14,15\";', '1479779859');
INSERT INTO `log_record` VALUES ('54', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479779930');
INSERT INTO `log_record` VALUES ('55', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '菜单管理-添加成功', '1479779989');
INSERT INTO `log_record` VALUES ('56', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479780023');
INSERT INTO `log_record` VALUES ('57', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479780046');
INSERT INTO `log_record` VALUES ('58', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479780078');
INSERT INTO `log_record` VALUES ('59', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479780099');
INSERT INTO `log_record` VALUES ('60', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479780123');
INSERT INTO `log_record` VALUES ('61', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479780136');
INSERT INTO `log_record` VALUES ('62', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479780145');
INSERT INTO `log_record` VALUES ('63', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479780177');
INSERT INTO `log_record` VALUES ('64', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479780189');
INSERT INTO `log_record` VALUES ('65', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479780200');
INSERT INTO `log_record` VALUES ('66', '1', '180.166.212.58', 'Windows NT', 'firefox-49', '登录成功', '1479780284');
INSERT INTO `log_record` VALUES ('67', '1', '202.118.212.136', 'Windows 10', 'chrome-53', '登录成功', '1479780646');
INSERT INTO `log_record` VALUES ('68', '1', '58.19.0.116', 'Windows 7', 'ie-9', '登录成功', '1479780925');
INSERT INTO `log_record` VALUES ('69', '1', '116.22.234.64', 'Windows NT', 'chrome-50', '登录成功', '1479781301');
INSERT INTO `log_record` VALUES ('70', '1', '59.52.62.225', 'Windows 7', 'chrome-52', '登录成功', '1479781715');
INSERT INTO `log_record` VALUES ('71', '1', '218.19.214.159', 'Windows 10', 'chrome-54', '登录成功', '1479782144');
INSERT INTO `log_record` VALUES ('72', '1', '202.118.212.167', 'unknow', 'chrome-50', '登录成功', '1479782689');
INSERT INTO `log_record` VALUES ('73', '1', '14.23.101.244', 'Windows 7', 'chrome-54', '登录成功', '1479783385');
INSERT INTO `log_record` VALUES ('74', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '登录成功', '1479784147');
INSERT INTO `log_record` VALUES ('75', '1', '111.163.241.73', 'Windows 7', 'chrome-54', '登录成功', '1479785990');
INSERT INTO `log_record` VALUES ('76', '1', '180.102.117.249', 'Windows 7', 'chrome-50', '登录成功', '1479786556');
INSERT INTO `log_record` VALUES ('77', '1', '61.141.154.10', 'Windows 10', 'chrome-54', '登录成功', '1479786805');
INSERT INTO `log_record` VALUES ('78', '1', '116.17.60.140', 'Windows 7', 'chrome-42', '登录成功', '1479787642');
INSERT INTO `log_record` VALUES ('79', '1', '117.29.209.199', 'Windows 10', 'ie-7', '登录成功', '1479790889');
INSERT INTO `log_record` VALUES ('80', '1', '116.252.22.235', 'Windows 10', 'firefox-50', '登录成功', '1479790935');
INSERT INTO `log_record` VALUES ('81', '1', '117.90.110.151', 'Windows 10', 'chrome-54', '登录成功', '1479792533');
INSERT INTO `log_record` VALUES ('82', '1', '222.77.85.140', 'Windows 7', 'chrome-54', '登录成功', '1479794049');
INSERT INTO `log_record` VALUES ('83', '1', '61.164.43.236', 'Windows 10', 'chrome-45', '登录成功', '1479796994');
INSERT INTO `log_record` VALUES ('84', '1', '110.252.56.57', 'Windows 7', 'ie-unknow', '登录成功', '1479797256');
INSERT INTO `log_record` VALUES ('85', '1', '222.128.147.37', 'Windows 10', 'chrome-45', '登录成功', '1479797920');
INSERT INTO `log_record` VALUES ('86', '1', '61.49.178.106', 'Windows 7', 'ie-7', '登录成功', '1479800118');
INSERT INTO `log_record` VALUES ('87', '1', '124.205.236.98', 'unknow', 'chrome-54', '登录成功', '1479804255');
INSERT INTO `log_record` VALUES ('88', '1', '106.87.22.221', 'Windows 10', 'chrome-53', '登录成功', '1479804355');
INSERT INTO `log_record` VALUES ('89', '1', '106.87.22.221', 'Windows 10', 'chrome-53', '登录成功', '1479804403');
INSERT INTO `log_record` VALUES ('90', '1', '119.137.1.88', 'Windows 10', 'chrome-50', '登录成功', '1479807330');
INSERT INTO `log_record` VALUES ('91', '1', '14.221.47.142', 'Windows 10', 'chrome-51', '登录成功', '1479808512');
INSERT INTO `log_record` VALUES ('92', '1', '14.221.47.142', 'Windows 10', 'chrome-51', '缓存已更新', '1479809171');
INSERT INTO `log_record` VALUES ('93', '1', '61.135.169.92', 'unknow', 'chrome-54', '登录成功', '1479809418');
INSERT INTO `log_record` VALUES ('94', '1', '14.221.47.142', 'Windows 10', 'chrome-51', '缓存已更新', '1479811194');
INSERT INTO `log_record` VALUES ('95', '1', '14.221.47.142', 'Windows 10', 'chrome-51', '登录成功', '1479812556');
INSERT INTO `log_record` VALUES ('96', '1', '115.175.90.18', 'Windows 7', 'chrome-45', '登录成功', '1479817364');
INSERT INTO `log_record` VALUES ('97', '1', '113.88.196.98', 'Windows 10', 'chrome-50', '登录成功', '1479817958');
INSERT INTO `log_record` VALUES ('98', '1', '113.88.196.98', 'Windows 10', 'chrome-50', '登录成功', '1479818120');
INSERT INTO `log_record` VALUES ('99', '1', '14.221.47.142', 'Windows 10', 'chrome-51', '登录成功', '1479818931');
INSERT INTO `log_record` VALUES ('100', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '登录成功', '1479819050');
INSERT INTO `log_record` VALUES ('101', '1', '113.99.103.243', 'Windows 10', 'chrome-50', '登录成功', '1479819563');
INSERT INTO `log_record` VALUES ('102', '1', '113.139.123.103', 'Windows 7', 'chrome-53', '登录成功', '1479822860');
INSERT INTO `log_record` VALUES ('103', '1', '218.18.222.154', 'Windows 10', 'chrome-49', '登录成功', '1479826450');
INSERT INTO `log_record` VALUES ('104', '1', '117.176.255.180', 'Windows 7', 'chrome-54', '登录成功', '1479827997');
INSERT INTO `log_record` VALUES ('105', '1', '1.80.80.186', 'Windows 7', 'chrome-54', '登录成功', '1479832943');
INSERT INTO `log_record` VALUES ('106', '1', '180.164.197.148', 'Windows 7', 'ie-7', '登录成功', '1479839194');
INSERT INTO `log_record` VALUES ('107', '1', '180.164.173.85', 'Windows 7', 'chrome-45', '用户留言-添加成功', '1479839349');
INSERT INTO `log_record` VALUES ('108', '1', '180.164.173.85', 'Windows 7', 'chrome-45', '登录成功', '1479839399');
INSERT INTO `log_record` VALUES ('109', '1', '58.251.233.246', 'Windows 7', 'chrome-50', '登录成功', '1479850399');
INSERT INTO `log_record` VALUES ('110', '1', '58.251.233.246', 'Windows 7', 'chrome-50', '登录成功', '1479850442');
INSERT INTO `log_record` VALUES ('111', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '登录成功', '1479858527');
INSERT INTO `log_record` VALUES ('112', '1', '58.35.179.223', 'Windows 7', 'firefox-46', '登录成功', '1479862638');
INSERT INTO `log_record` VALUES ('113', '1', '58.35.179.223', 'Windows 7', 'firefox-46', '登录成功', '1479862656');
INSERT INTO `log_record` VALUES ('114', '1', '113.102.244.147', 'Windows 10', 'chrome-51', '登录成功', '1479863869');
INSERT INTO `log_record` VALUES ('115', '1', '171.15.125.45', 'Windows 7', 'chrome-49', '登录成功', '1479866306');
INSERT INTO `log_record` VALUES ('116', '1', '171.15.125.45', 'Windows 7', 'chrome-49', '菜单管理-添加成功', '1479866423');
INSERT INTO `log_record` VALUES ('117', '1', '171.15.125.45', 'Windows 7', 'chrome-49', '菜单管理-添加成功', '1479866442');
INSERT INTO `log_record` VALUES ('118', '1', '171.15.125.45', 'Windows 7', 'chrome-49', '缓存已更新', '1479866480');
INSERT INTO `log_record` VALUES ('119', '1', '171.15.125.45', 'Windows 7', 'chrome-49', '登录成功', '1479866511');
INSERT INTO `log_record` VALUES ('120', '1', '14.23.101.244', 'Windows 7', 'chrome-54', '登录成功', '1479867041');
INSERT INTO `log_record` VALUES ('121', '1', '119.129.119.29', 'Windows 7', 'chrome-45', '登录成功', '1479867165');
INSERT INTO `log_record` VALUES ('122', '1', '222.92.251.179', 'Windows 7', 'chrome-51', '登录成功', '1479867337');
INSERT INTO `log_record` VALUES ('123', '1', '222.174.187.236', 'Windows 10', 'chrome-50', '登录成功', '1479868960');
INSERT INTO `log_record` VALUES ('124', '1', '119.177.78.8', 'Windows 10', 'chrome-45', '登录成功', '1479870042');
INSERT INTO `log_record` VALUES ('125', '1', '116.22.165.128', 'Windows 7', 'chrome-49', '登录成功', '1479872608');
INSERT INTO `log_record` VALUES ('126', '1', '14.23.101.253', 'Windows XP', 'chrome-43', '登录成功', '1479872750');
INSERT INTO `log_record` VALUES ('127', '1', '116.22.165.128', 'Windows 7', 'chrome-49', '登录成功', '1479872875');
INSERT INTO `log_record` VALUES ('128', '1', '113.88.199.126', 'Windows 7', 'chrome-54', '登录成功', '1479875111');
INSERT INTO `log_record` VALUES ('129', '1', '112.254.89.121', 'Windows 7', 'chrome-54', '登录成功', '1479879385');
INSERT INTO `log_record` VALUES ('130', '1', '113.140.29.34', 'Windows 7', 'ie-7', '登录成功', '1479879526');
INSERT INTO `log_record` VALUES ('131', '1', '14.23.101.244', 'Windows 7', 'chrome-54', '登录成功', '1479882069');
INSERT INTO `log_record` VALUES ('132', '1', '61.52.155.158', 'Windows 7', 'chrome-45', '登录成功', '1479882536');
INSERT INTO `log_record` VALUES ('133', '1', '42.202.204.120', 'Windows 7', 'firefox-50', '登录成功', '1479883443');
INSERT INTO `log_record` VALUES ('134', '1', '183.14.175.88', 'Windows NT', 'chrome-42', '登录成功', '1479884664');
INSERT INTO `log_record` VALUES ('135', '1', '116.226.59.175', 'Windows 7', 'ie-7', '登录成功', '1479884693');
INSERT INTO `log_record` VALUES ('136', '1', '116.226.59.175', 'Windows 7', 'chrome-45', '登录成功', '1479884712');
INSERT INTO `log_record` VALUES ('137', '1', '124.227.192.166', 'Windows 7', 'chrome-45', '登录成功', '1479885248');
INSERT INTO `log_record` VALUES ('138', '1', '211.167.83.98', 'Windows 7', 'chrome-38', '登录成功', '1479888952');
INSERT INTO `log_record` VALUES ('139', '1', '1.80.146.29', 'Windows 7', 'chrome-54', '登录成功', '1479890831');
INSERT INTO `log_record` VALUES ('140', '1', '1.80.146.29', 'Windows 7', 'chrome-54', '登录成功', '1479890894');
INSERT INTO `log_record` VALUES ('141', '1', '121.28.98.26', 'Windows 7', 'chrome-45', '登录成功', '1479891289');
INSERT INTO `log_record` VALUES ('142', '1', '119.41.198.127', 'Windows 10', 'chrome-50', '登录成功', '1479892390');
INSERT INTO `log_record` VALUES ('143', '1', '113.88.199.77', 'Windows 7', 'chrome-49', '登录成功', '1479892410');
INSERT INTO `log_record` VALUES ('144', '1', '124.93.196.10', 'Windows 10', 'chrome-56', '登录成功', '1479897467');
INSERT INTO `log_record` VALUES ('145', '1', '221.3.238.26', 'unknow', 'firefox-50', '登录成功', '1479903165');
INSERT INTO `log_record` VALUES ('146', '1', '42.122.184.52', 'Windows 10', 'chrome-49', '登录成功', '1479906058');
INSERT INTO `log_record` VALUES ('147', '1', '182.129.167.101', 'Windows 7', 'chrome-51', '登录成功', '1479906540');
INSERT INTO `log_record` VALUES ('148', '1', '119.139.137.96', 'unknow', 'chrome-44', '登录成功', '1479913071');
INSERT INTO `log_record` VALUES ('149', '1', '14.155.237.12', 'Windows 7', 'chrome-49', '登录成功', '1479915654');
INSERT INTO `log_record` VALUES ('150', '1', '113.87.213.27', 'Windows 10', 'chrome-54', '登录成功', '1479948824');
INSERT INTO `log_record` VALUES ('151', '1', '223.95.81.120', 'unknow', 'chrome-54', '登录成功', '1479950296');
INSERT INTO `log_record` VALUES ('152', '1', '121.30.59.226', 'Windows 10', 'chrome-45', '登录成功', '1479950614');
INSERT INTO `log_record` VALUES ('153', '1', '183.129.165.226', 'unknow', 'chrome-54', '登录成功', '1479953924');
INSERT INTO `log_record` VALUES ('154', '1', '221.237.209.150', 'Windows 7', 'chrome-45', '登录成功', '1479955018');
INSERT INTO `log_record` VALUES ('155', '1', '223.95.81.120', 'unknow', 'chrome-54', '登录成功', '1479955118');
INSERT INTO `log_record` VALUES ('156', '1', '183.129.165.226', 'unknow', 'chrome-54', '登录成功', '1479955118');
INSERT INTO `log_record` VALUES ('157', '1', '183.129.165.226', 'unknow', 'chrome-54', '登录成功', '1479955120');
INSERT INTO `log_record` VALUES ('158', '1', '223.95.81.120', 'unknow', 'chrome-54', '登录成功', '1479955125');
INSERT INTO `log_record` VALUES ('159', '1', '223.95.81.120', 'unknow', 'chrome-54', '登录成功', '1479955133');
INSERT INTO `log_record` VALUES ('160', '1', '183.129.165.226', 'unknow', 'chrome-54', '登录成功', '1479955237');
INSERT INTO `log_record` VALUES ('161', '1', '183.129.165.226', 'unknow', 'chrome-54', '菜单管理-添加成功', '1479956409');
INSERT INTO `log_record` VALUES ('162', '1', '223.95.81.120', 'unknow', 'chrome-54', '登录成功', '1479957113');
INSERT INTO `log_record` VALUES ('163', '1', '112.65.156.98', 'Windows 7', 'chrome-54', '登录成功', '1479957886');
INSERT INTO `log_record` VALUES ('164', '1', '124.72.60.232', 'Windows 7', 'chrome-54', '登录成功', '1479961698');
INSERT INTO `log_record` VALUES ('165', '1', '61.141.153.165', 'Windows 7', 'chrome-49', '登录成功', '1479966196');
INSERT INTO `log_record` VALUES ('166', '1', '183.129.165.226', 'unknow', 'chrome-54', '登录成功', '1479968025');
INSERT INTO `log_record` VALUES ('167', '1', '117.144.208.34', 'Windows 10', 'chrome-54', '登录成功', '1479969986');
INSERT INTO `log_record` VALUES ('168', '1', '223.95.81.120', 'unknow', 'chrome-54', '登录成功', '1479970102');
INSERT INTO `log_record` VALUES ('169', '1', '183.203.163.45', 'Windows 7', 'firefox-49', '登录成功', '1479972839');
INSERT INTO `log_record` VALUES ('170', '1', '223.95.81.120', 'unknow', 'chrome-54', '登录成功', '1479972929');
INSERT INTO `log_record` VALUES ('171', '1', '117.144.208.34', 'Windows 10', 'chrome-54', '登录成功', '1479973009');
INSERT INTO `log_record` VALUES ('172', '1', '117.144.208.34', 'Windows 10', 'chrome-54', '登录成功', '1479973133');
INSERT INTO `log_record` VALUES ('173', '1', '144.0.194.151', 'Windows 7', 'chrome-50', '登录成功', '1479973450');
INSERT INTO `log_record` VALUES ('174', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '登录成功', '1479974840');
INSERT INTO `log_record` VALUES ('175', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479974874');
INSERT INTO `log_record` VALUES ('176', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479974885');
INSERT INTO `log_record` VALUES ('177', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479974894');
INSERT INTO `log_record` VALUES ('178', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1479974900');
INSERT INTO `log_record` VALUES ('179', '1', '121.33.236.138', 'Windows 7', 'ie-7', '登录成功', '1479976079');
INSERT INTO `log_record` VALUES ('180', '1', '58.240.123.179', 'Windows 7', 'firefox-50', '登录成功', '1479976633');
INSERT INTO `log_record` VALUES ('181', '1', '58.240.123.179', 'Windows 7', 'firefox-50', '登录成功', '1479976635');
INSERT INTO `log_record` VALUES ('182', '1', '113.120.225.210', 'Windows NT', 'chrome-45', '登录成功', '1479978154');
INSERT INTO `log_record` VALUES ('183', '1', '116.26.101.246', 'Windows 7', 'chrome-53', '登录成功', '1479978836');
INSERT INTO `log_record` VALUES ('184', '1', '36.149.139.20', 'Windows 10', 'chrome-51', '登录成功', '1479984645');
INSERT INTO `log_record` VALUES ('185', '1', '42.234.175.158', 'Windows 7', 'ie-7', '登录成功', '1479985543');
INSERT INTO `log_record` VALUES ('186', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '登录成功', '1479988622');
INSERT INTO `log_record` VALUES ('187', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '登录成功', '1479991619');
INSERT INTO `log_record` VALUES ('188', '1', '111.23.48.123', 'Windows 10', 'chrome-54', '登录成功', '1479997446');
INSERT INTO `log_record` VALUES ('189', '1', '59.45.22.218', 'Windows 10', 'chrome-53', '登录成功', '1479997881');
INSERT INTO `log_record` VALUES ('190', '1', '211.161.244.179', 'unknow', 'firefox-50', '登录成功', '1480003957');
INSERT INTO `log_record` VALUES ('191', '1', '123.174.101.20', 'Windows 7', 'chrome-53', '登录成功', '1480033307');
INSERT INTO `log_record` VALUES ('192', '1', '116.252.222.2', 'unknow', 'chrome-54', '登录成功', '1480034716');
INSERT INTO `log_record` VALUES ('193', '1', '36.248.235.198', 'Windows 7', 'chrome-42', '登录成功', '1480038186');
INSERT INTO `log_record` VALUES ('194', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '登录成功', '1480038548');
INSERT INTO `log_record` VALUES ('195', '1', '113.224.149.136', 'unknow', 'chrome-54', '登录成功', '1480039792');
INSERT INTO `log_record` VALUES ('196', '1', '36.149.139.20', 'Windows 10', 'chrome-51', '登录成功', '1480043036');
INSERT INTO `log_record` VALUES ('197', '1', '125.71.204.95', 'Windows XP', 'chrome-46', '登录成功', '1480045232');
INSERT INTO `log_record` VALUES ('198', '1', '183.196.21.6', 'Windows 10', 'chrome-54', '登录成功', '1480045480');
INSERT INTO `log_record` VALUES ('199', '1', '113.200.5.126', 'Linux', 'chrome-46', '登录成功', '1480046069');
INSERT INTO `log_record` VALUES ('200', '1', '27.198.155.240', 'Windows 7', 'firefox-49', '登录成功', '1480055170');
INSERT INTO `log_record` VALUES ('201', '1', '27.16.171.59', 'Windows 7', 'chrome-52', '登录成功', '1480055256');
INSERT INTO `log_record` VALUES ('202', '1', '218.66.149.212', 'Windows 7', 'ie-7', '登录成功', '1480056703');
INSERT INTO `log_record` VALUES ('203', '1', '218.66.149.212', 'Windows 7', 'chrome-45', '登录成功', '1480056813');
INSERT INTO `log_record` VALUES ('204', '1', '27.198.155.240', 'Windows 7', 'firefox-49', '登录成功', '1480057807');
INSERT INTO `log_record` VALUES ('205', '1', '121.15.7.26', 'Windows 7', 'firefox-50', '登录成功', '1480060229');
INSERT INTO `log_record` VALUES ('206', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '登录成功', '1480064750');
INSERT INTO `log_record` VALUES ('207', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '用户留言-添加成功', '1480064797');
INSERT INTO `log_record` VALUES ('208', '1', '27.197.17.228', 'Windows 7', 'chrome-52', '登录成功', '1480074910');
INSERT INTO `log_record` VALUES ('209', '1', '14.153.194.114', 'unknow', 'chrome-55', '登录成功', '1480144106');
INSERT INTO `log_record` VALUES ('210', '1', '222.209.149.203', 'unknow', 'safari-602', '登录成功', '1480144207');
INSERT INTO `log_record` VALUES ('211', '1', '117.114.147.228', 'Windows 7', 'firefox-49', '登录成功', '1480147578');
INSERT INTO `log_record` VALUES ('212', '1', '119.98.78.98', 'unknow', 'chrome-54', '登录成功', '1480151261');
INSERT INTO `log_record` VALUES ('213', '1', '221.237.119.72', 'unknow', 'chrome-54', '登录成功', '1480159051');
INSERT INTO `log_record` VALUES ('214', '1', '183.27.156.195', 'Windows 10', 'chrome-54', '登录成功', '1480161712');
INSERT INTO `log_record` VALUES ('215', '1', '39.190.121.58', 'Linux', 'chrome-52', '登录成功', '1480164763');
INSERT INTO `log_record` VALUES ('216', '1', '39.190.121.58', 'Linux', 'chrome-52', '登录成功', '1480171597');
INSERT INTO `log_record` VALUES ('217', '1', '39.190.121.58', 'Linux', 'chrome-52', '登录成功', '1480172293');
INSERT INTO `log_record` VALUES ('218', '1', '112.5.238.137', 'Windows 7', 'firefox-48', '登录成功', '1480174497');
INSERT INTO `log_record` VALUES ('219', '1', '119.122.83.228', 'Windows 7', 'firefox-49', '登录成功', '1480244786');
INSERT INTO `log_record` VALUES ('220', '1', '182.244.71.236', 'Windows 7', 'chrome-54', '登录成功', '1480246651');
INSERT INTO `log_record` VALUES ('221', '1', '223.99.59.226', 'Windows 10', 'chrome-53', '登录成功', '1480248894');
INSERT INTO `log_record` VALUES ('222', '1', '14.205.35.119', 'Windows 10', 'chrome-54', '登录成功', '1480276750');
INSERT INTO `log_record` VALUES ('223', '1', '14.205.35.119', 'Windows 10', 'chrome-54', '登录成功', '1480276801');
INSERT INTO `log_record` VALUES ('224', '1', '101.29.135.144', 'Windows 7', 'chrome-54', '登录成功', '1480304645');
INSERT INTO `log_record` VALUES ('225', '1', '116.1.3.238', 'Windows 10', 'chrome-54', '登录成功', '1480319585');
INSERT INTO `log_record` VALUES ('226', '1', '116.25.77.63', 'Windows 7', 'chrome-54', '登录成功', '1480319998');
INSERT INTO `log_record` VALUES ('227', '1', '39.130.91.140', 'Windows 7', 'ie-7', '登录成功', '1480320062');
INSERT INTO `log_record` VALUES ('228', '1', '222.128.171.81', 'Windows 7', 'firefox-50', '登录成功', '1480321375');
INSERT INTO `log_record` VALUES ('229', '1', '110.86.38.94', 'Windows 7', 'chrome-50', '登录成功', '1480321383');
INSERT INTO `log_record` VALUES ('230', '1', '210.12.5.166', 'unknow', 'safari-602', '登录成功', '1480321412');
INSERT INTO `log_record` VALUES ('231', '1', '114.240.208.173', 'Windows 7', 'chrome-53', '登录成功', '1480321852');
INSERT INTO `log_record` VALUES ('232', '1', '36.5.97.119', 'Windows 7', 'chrome-51', '登录成功', '1480323199');
INSERT INTO `log_record` VALUES ('233', '1', '114.249.222.202', 'Windows 7', 'firefox-50', '登录成功', '1480324991');
INSERT INTO `log_record` VALUES ('234', '1', '211.161.199.26', 'Windows 7', 'chrome-53', '登录成功', '1480340007');
INSERT INTO `log_record` VALUES ('235', '1', '211.161.199.26', 'Windows 7', 'chrome-53', '登录成功', '1480340371');
INSERT INTO `log_record` VALUES ('236', '1', '58.250.92.221', 'Windows 7', 'firefox-50', '登录成功', '1480341129');
INSERT INTO `log_record` VALUES ('237', '1', '121.236.11.51', 'Windows 7', 'chrome-54', '登录成功', '1480342614');
INSERT INTO `log_record` VALUES ('238', '1', '110.186.48.107', 'Windows 10', 'ie-7', '登录成功', '1480349238');
INSERT INTO `log_record` VALUES ('239', '1', '110.186.48.107', 'Windows 10', 'chrome-50', '用户留言-添加成功', '1480352149');
INSERT INTO `log_record` VALUES ('240', '1', '183.13.59.68', 'Windows 7', 'chrome-54', '登录成功', '1480358190');
INSERT INTO `log_record` VALUES ('241', '1', '180.213.30.240', 'Windows 10', 'chrome-53', '登录成功', '1480385815');
INSERT INTO `log_record` VALUES ('242', '1', '163.179.238.145', 'Windows 7', 'chrome-51', '登录成功', '1480386117');
INSERT INTO `log_record` VALUES ('243', '1', '61.148.242.227', 'unknow', 'unknown-unknow', '登录成功', '1480386703');
INSERT INTO `log_record` VALUES ('244', '1', '117.151.56.166', 'Windows 7', 'chrome-45', '登录成功', '1480388692');
INSERT INTO `log_record` VALUES ('245', '1', '117.151.56.166', 'Windows 7', 'chrome-45', '角色管理-编辑成功 ID=1', '1480388890');
INSERT INTO `log_record` VALUES ('246', '1', '117.151.56.166', 'Windows 7', 'chrome-45', '角色管理-编辑成功 ID=9', '1480388905');
INSERT INTO `log_record` VALUES ('247', '1', '113.232.108.252', 'Windows 7', 'chrome-46', '登录成功', '1480390643');
INSERT INTO `log_record` VALUES ('248', '1', '171.111.43.100', 'Windows 7', 'chrome-49', '登录成功', '1480397225');
INSERT INTO `log_record` VALUES ('249', '1', '180.173.224.92', 'Windows 7', 'chrome-54', '登录成功', '1480401427');
INSERT INTO `log_record` VALUES ('250', '1', '180.173.224.92', 'Windows 7', 'chrome-54', '登录成功', '1480401475');
INSERT INTO `log_record` VALUES ('251', '1', '180.173.224.92', 'Windows 7', 'chrome-54', '登录成功', '1480402922');
INSERT INTO `log_record` VALUES ('252', '1', '180.173.224.92', 'Windows 7', 'chrome-54', '登录成功', '1480402980');
INSERT INTO `log_record` VALUES ('253', '1', '180.173.224.92', 'Windows 7', 'chrome-54', '登录失败, [username_mobile: 13330613321ww],[ status: 该手机号未注册！ ],[password: 28edd1e7****************2e592db9]', '1480404306');
INSERT INTO `log_record` VALUES ('254', '1', '180.173.224.92', 'Windows 7', 'chrome-54', '登录失败, [username_mobile: 13330613321ww],[ status: 该手机号未注册！ ],[password: 28edd1e7****************2e592db9]', '1480404307');
INSERT INTO `log_record` VALUES ('255', '1', '180.173.224.92', 'Windows 7', 'chrome-54', '登录失败, [username_mobile: 13330613321ww],[ status: 该手机号未注册！ ],[password: 28edd1e7****************2e592db9]', '1480404307');
INSERT INTO `log_record` VALUES ('256', '1', '180.173.224.92', 'Windows 7', 'chrome-54', '登录失败, [username_mobile: 13330613321ww],[ status: 该手机号未注册！ ],[password: 28edd1e7****************2e592db9]', '1480404307');
INSERT INTO `log_record` VALUES ('257', '1', '180.173.224.92', 'Windows 7', 'chrome-54', '登录失败, [username_mobile: wew],[ status: 该手机号未注册！ ],[password: 28edd1e7****************2e592db9]', '1480404309');
INSERT INTO `log_record` VALUES ('258', '1', '180.173.224.92', 'Windows 7', 'chrome-54', '登录失败, [username_mobile: wew],[ status: 该手机号未注册！ ],[password: 28edd1e7****************2e592db9]', '1480404310');
INSERT INTO `log_record` VALUES ('259', '1', '180.173.224.92', 'Windows 7', 'chrome-54', '登录失败, [username_mobile: wew],[ status: 该手机号未注册！ ],[password: 28edd1e7****************2e592db9]', '1480404310');
INSERT INTO `log_record` VALUES ('260', '1', '180.173.224.92', 'Windows 7', 'chrome-54', '登录失败, [username_mobile: wew],[ status: 该手机号未注册！ ],[password: 28edd1e7****************2e592db9]', '1480404310');
INSERT INTO `log_record` VALUES ('261', '1', '180.173.224.92', 'Windows 7', 'chrome-54', '登录失败, [username_mobile: wew],[ status: 该手机号未注册！ ],[password: 28edd1e7****************2e592db9]', '1480404311');
INSERT INTO `log_record` VALUES ('262', '1', '180.173.224.92', 'Windows 7', 'chrome-54', '登录失败, [username_mobile: 13213],[ status: 该手机号未注册！ ],[password: 28edd1e7****************2e592db9]', '1480404315');
INSERT INTO `log_record` VALUES ('263', '1', '180.173.224.92', 'Windows 7', 'chrome-54', '登录失败, [username_mobile: 13213],[ status: 该手机号未注册！ ],[password: adc8393b****************2fb48ae6]', '1480404318');
INSERT INTO `log_record` VALUES ('264', '1', '180.173.224.92', 'Windows 7', 'chrome-54', '登录失败, [username_mobile: 13213],[ status: 该手机号未注册！ ],[password: adc8393b****************2fb48ae6]', '1480404319');
INSERT INTO `log_record` VALUES ('265', '1', '180.173.224.92', 'Windows 7', 'chrome-54', '登录失败, [username_mobile: 13213],[ status: 该手机号未注册！ ],[password: adc8393b****************2fb48ae6]', '1480404319');
INSERT INTO `log_record` VALUES ('266', '1', '180.173.224.92', 'Windows 7', 'chrome-54', '登录失败, [username_mobile: 13213],[ status: 该手机号未注册！ ],[password: adc8393b****************2fb48ae6]', '1480404319');
INSERT INTO `log_record` VALUES ('267', '1', '180.173.224.92', 'Windows 7', 'chrome-54', '登录失败, [username_mobile: 13213],[ status: 该手机号未注册！ ],[password: adc8393b****************2fb48ae6]', '1480404320');
INSERT INTO `log_record` VALUES ('268', '1', '180.173.224.92', 'Windows 7', 'chrome-54', '登录失败, [username_mobile: 13213],[ status: 该手机号未注册！ ],[password: adc8393b****************2fb48ae6]', '1480404320');
INSERT INTO `log_record` VALUES ('269', '1', '192.168.15.174', 'Windows 7', 'firefox-50', '登录成功', '1480406936');
INSERT INTO `log_record` VALUES ('270', '1', '118.114.253.78', 'Windows 7', 'chrome-49', '登录成功', '1480407199');
INSERT INTO `log_record` VALUES ('271', '1', '58.57.98.50', 'Windows 10', 'chrome-45', '登录成功', '1480407519');
INSERT INTO `log_record` VALUES ('272', '1', '58.57.98.50', 'Windows 10', 'chrome-45', '用户留言-编辑成功 ID=30', '1480407561');
INSERT INTO `log_record` VALUES ('273', '1', '58.57.98.50', 'Windows 10', 'chrome-45', '登录成功', '1480407620');
INSERT INTO `log_record` VALUES ('274', '1', '112.229.245.204', 'Windows 7', 'ie-7', '登录成功', '1480408235');
INSERT INTO `log_record` VALUES ('275', '1', '113.111.64.71', 'Windows 7', 'ie-7', '登录成功', '1480408756');
INSERT INTO `log_record` VALUES ('276', '1', '113.111.64.71', 'Windows 7', 'chrome-45', '登录成功', '1480408827');
INSERT INTO `log_record` VALUES ('277', '1', '113.105.12.152', 'Windows 10', 'chrome-49', '登录成功', '1480410793');
INSERT INTO `log_record` VALUES ('278', '1', '140.206.155.125', 'Windows 7', 'chrome-51', '登录成功', '1480410903');
INSERT INTO `log_record` VALUES ('279', '1', '218.56.44.108', 'Windows XP', 'chrome-49', '登录成功', '1480411544');
INSERT INTO `log_record` VALUES ('280', '1', '218.56.44.108', 'Windows XP', 'chrome-49', '登录成功', '1480411702');
INSERT INTO `log_record` VALUES ('281', '1', '27.46.131.7', 'Windows 7', 'chrome-53', '登录成功', '1480413754');
INSERT INTO `log_record` VALUES ('282', '1', '220.166.212.42', 'Windows 10', 'ie-7', '登录成功', '1480421629');
INSERT INTO `log_record` VALUES ('283', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '登录成功', '1480423247');
INSERT INTO `log_record` VALUES ('284', '1', '222.162.198.31', 'Windows 10', 'chrome-45', '登录成功', '1480433103');
INSERT INTO `log_record` VALUES ('285', '1', '222.162.198.31', 'Windows 10', 'chrome-45', '登录成功', '1480433119');
INSERT INTO `log_record` VALUES ('286', '1', '27.195.156.2', 'Windows 10', 'chrome-45', '登录成功', '1480467874');
INSERT INTO `log_record` VALUES ('287', '1', '124.236.253.72', 'Windows 7', 'chrome-54', '登录成功', '1480470875');
INSERT INTO `log_record` VALUES ('288', '1', '180.173.91.137', 'Windows 7', 'chrome-54', '登录成功', '1480490026');
INSERT INTO `log_record` VALUES ('289', '1', '124.236.142.249', 'Windows 7', 'firefox-50', '登录成功', '1480490511');
INSERT INTO `log_record` VALUES ('290', '1', '120.236.144.233', 'Windows 10', 'chrome-54', '登录成功', '1480491217');
INSERT INTO `log_record` VALUES ('291', '1', '14.220.103.25', 'Windows 7', 'chrome-54', '登录成功', '1480494597');
INSERT INTO `log_record` VALUES ('292', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '登录成功', '1480496742');
INSERT INTO `log_record` VALUES ('293', '1', '101.69.255.186', 'Windows 10', 'chrome-54', '登录成功', '1480497013');
INSERT INTO `log_record` VALUES ('294', '1', '119.187.127.131', 'Windows 7', 'chrome-54', '登录成功', '1480498580');
INSERT INTO `log_record` VALUES ('295', '1', '118.186.143.118', 'unknow', 'chrome-54', '登录成功', '1480500147');
INSERT INTO `log_record` VALUES ('296', '1', '112.26.69.237', 'Windows 7', 'ie-7', '登录成功', '1480506515');
INSERT INTO `log_record` VALUES ('297', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '登录成功', '1480508051');
INSERT INTO `log_record` VALUES ('298', '1', '223.73.73.107', 'Windows 7', 'ie-7', '登录成功', '1480509120');
INSERT INTO `log_record` VALUES ('299', '1', '14.107.79.56', 'Windows 7', 'ie-7', '登录成功', '1480509564');
INSERT INTO `log_record` VALUES ('300', '1', '61.182.253.228', 'Windows 7', 'chrome-45', '登录成功', '1480518506');
INSERT INTO `log_record` VALUES ('301', '1', '112.26.69.237', 'Windows 7', 'chrome-45', '登录成功', '1480520652');
INSERT INTO `log_record` VALUES ('302', '1', '42.48.243.46', 'Windows 7', 'firefox-50', '登录成功', '1480520997');
INSERT INTO `log_record` VALUES ('303', '1', '42.48.243.46', 'Windows 7', 'firefox-50', '菜单管理-添加成功', '1480521052');
INSERT INTO `log_record` VALUES ('304', '1', '14.204.71.224', 'Windows 10', 'chrome-42', '登录成功', '1480553918');
INSERT INTO `log_record` VALUES ('305', '1', '183.6.137.165', 'Windows 7', 'chrome-45', '登录成功', '1480558338');
INSERT INTO `log_record` VALUES ('306', '1', '116.226.57.91', 'Windows 7', 'chrome-54', '登录成功', '1480559273');
INSERT INTO `log_record` VALUES ('307', '1', '106.86.169.22', 'Windows 10', 'chrome-54', '登录成功', '1480559280');
INSERT INTO `log_record` VALUES ('308', '1', '171.15.121.25', 'Windows 7', 'chrome-45', '登录成功', '1480560096');
INSERT INTO `log_record` VALUES ('309', '1', '171.15.121.25', 'Windows 7', 'chrome-45', '角色管理-编辑成功 ID=1', '1480560189');
INSERT INTO `log_record` VALUES ('310', '1', '171.15.121.25', 'Windows 7', 'chrome-45', '角色管理-添加成功', '1480560216');
INSERT INTO `log_record` VALUES ('311', '1', '218.88.125.103', 'Windows 7', 'chrome-49', '登录成功', '1480562979');
INSERT INTO `log_record` VALUES ('312', '1', '14.120.234.66', 'Windows 7', 'chrome-54', '登录成功', '1480563503');
INSERT INTO `log_record` VALUES ('313', '1', '202.118.212.136', 'unknow', 'chrome-54', '登录成功', '1480570180');
INSERT INTO `log_record` VALUES ('314', '1', '116.226.57.91', 'Windows 7', 'chrome-54', '登录成功', '1480570381');
INSERT INTO `log_record` VALUES ('315', '1', '59.61.114.183', 'Windows XP', 'firefox-49', '登录成功', '1480570921');
INSERT INTO `log_record` VALUES ('316', '1', '139.205.173.166', 'Windows 10', 'chrome-53', '登录成功', '1480571841');
INSERT INTO `log_record` VALUES ('317', '1', '175.160.148.121', 'Windows 7', 'chrome-54', '登录成功', '1480574893');
INSERT INTO `log_record` VALUES ('318', '1', '221.216.240.249', 'Windows 7', 'firefox-50', '登录成功', '1480580239');
INSERT INTO `log_record` VALUES ('319', '1', '119.137.2.68', 'Windows 10', 'chrome-50', '登录成功', '1480580656');
INSERT INTO `log_record` VALUES ('320', '1', '47.90.12.176', 'Windows 7', 'chrome-54', '登录成功', '1480583565');
INSERT INTO `log_record` VALUES ('321', '1', '116.226.57.91', 'Windows 7', 'chrome-54', '登录成功', '1480585887');
INSERT INTO `log_record` VALUES ('322', '1', '222.181.144.229', 'Windows 10', 'chrome-53', '登录成功', '1480586679');
INSERT INTO `log_record` VALUES ('323', '1', '113.111.224.103', 'Windows 7', 'chrome-50', '登录成功', '1480593580');
INSERT INTO `log_record` VALUES ('324', '1', '114.117.25.231', 'Windows 7', 'chrome-50', '登录成功', '1480594783');
INSERT INTO `log_record` VALUES ('325', '1', '211.161.199.26', 'Windows 7', 'chrome-53', '登录成功', '1480596502');
INSERT INTO `log_record` VALUES ('326', '1', '211.161.199.26', 'Windows 7', 'chrome-53', '账号管理-添加成功', '1480596528');
INSERT INTO `log_record` VALUES ('327', '1', '123.113.67.223', 'Windows 10', 'chrome-54', '登录成功', '1480597105');
INSERT INTO `log_record` VALUES ('328', '1', '124.126.220.42', 'Windows 10', 'chrome-51', '登录成功', '1480597326');
INSERT INTO `log_record` VALUES ('329', '1', '123.122.147.63', 'Windows 10', 'firefox-50', '登录成功', '1480599152');
INSERT INTO `log_record` VALUES ('330', '1', '223.209.237.159', 'Windows 10', 'chrome-54', '登录成功', '1480599689');
INSERT INTO `log_record` VALUES ('331', '1', '171.108.43.25', 'Windows 10', 'chrome-54', '登录成功', '1480606888');
INSERT INTO `log_record` VALUES ('332', '1', '116.226.57.91', 'Windows 7', 'chrome-54', '登录成功', '1480642547');
INSERT INTO `log_record` VALUES ('333', '1', '116.226.57.91', 'Windows 7', 'chrome-54', '账号管理-编辑成功', '1480644661');
INSERT INTO `log_record` VALUES ('334', '1', '116.226.57.91', 'Windows 7', 'chrome-54', '登录成功', '1480644672');
INSERT INTO `log_record` VALUES ('335', '1', '116.226.57.91', 'Windows 7', 'chrome-54', '菜单管理-添加成功', '1480648068');
INSERT INTO `log_record` VALUES ('336', '1', '218.104.10.91', 'Windows 7', 'ie-7', '登录成功', '1480653191');
INSERT INTO `log_record` VALUES ('337', '1', '218.104.10.91', 'Windows 7', 'chrome-50', '缓存已更新', '1480653230');
INSERT INTO `log_record` VALUES ('338', '1', '182.148.34.45', 'Windows 10', 'firefox-50', '登录成功', '1480665492');
INSERT INTO `log_record` VALUES ('339', '1', '183.63.217.132', 'Windows NT', 'chrome-50', '登录成功', '1480666935');
INSERT INTO `log_record` VALUES ('340', '1', '113.119.58.207', 'Windows 7', 'ie-7', '登录成功', '1480667830');
INSERT INTO `log_record` VALUES ('341', '1', '61.135.152.131', 'Windows 10', 'firefox-50', '登录成功', '1480668405');
INSERT INTO `log_record` VALUES ('342', '1', '58.20.69.92', 'unknow', 'safari-602', '登录成功', '1480669109');
INSERT INTO `log_record` VALUES ('343', '1', '221.217.25.37', 'Windows 7', 'chrome-54', '登录成功', '1480669138');
INSERT INTO `log_record` VALUES ('344', '1', '116.226.57.91', 'Windows 7', 'chrome-54', '登录成功', '1480671586');
INSERT INTO `log_record` VALUES ('345', '1', '116.226.57.91', 'Windows 7', 'chrome-54', '登录成功', '1480671588');
INSERT INTO `log_record` VALUES ('346', '1', '116.226.57.91', 'Windows 7', 'chrome-54', '登录成功', '1480671588');
INSERT INTO `log_record` VALUES ('347', '1', '124.116.253.42', 'Windows 10', 'chrome-50', '登录成功', '1480672012');
INSERT INTO `log_record` VALUES ('348', '1', '59.41.50.180', 'Windows 7', 'chrome-50', '登录成功', '1480672370');
INSERT INTO `log_record` VALUES ('349', '1', '113.119.58.207', 'Windows 7', 'chrome-45', '登录成功', '1480674462');
INSERT INTO `log_record` VALUES ('350', '1', '113.119.58.207', 'Windows 7', 'chrome-45', '角色管理-添加成功', '1480674604');
INSERT INTO `log_record` VALUES ('351', '1', '113.119.58.207', 'Windows 7', 'chrome-45', '角色管理-编辑成功 ID=17', '1480674617');
INSERT INTO `log_record` VALUES ('352', '1', '119.33.57.41', 'Windows 7', 'chrome-45', '登录成功', '1480687365');
INSERT INTO `log_record` VALUES ('353', '1', '115.60.147.177', 'Windows 7', 'chrome-53', '登录成功', '1480691058');
INSERT INTO `log_record` VALUES ('354', '1', '115.60.147.177', 'Windows 7', 'chrome-53', '登录成功', '1480691140');
INSERT INTO `log_record` VALUES ('355', '1', '27.185.77.213', 'Windows 7', 'chrome-50', '登录成功', '1480699613');
INSERT INTO `log_record` VALUES ('356', '1', '183.17.235.214', 'Windows 10', 'chrome-54', '登录成功', '1480699983');
INSERT INTO `log_record` VALUES ('357', '1', '183.238.188.194', 'Windows 10', 'chrome-55', '登录成功', '1480726673');
INSERT INTO `log_record` VALUES ('358', '1', '59.40.173.83', 'unknow', 'chrome-54', '登录成功', '1480730638');
INSERT INTO `log_record` VALUES ('359', '1', '61.52.67.45', 'Windows 7', 'ie-7', '登录成功', '1480737327');
INSERT INTO `log_record` VALUES ('360', '1', '223.148.229.128', 'Windows 7', 'chrome-47', '登录成功', '1480746377');
INSERT INTO `log_record` VALUES ('361', '1', '223.148.229.128', 'Windows 7', 'chrome-47', '登录成功', '1480746382');
INSERT INTO `log_record` VALUES ('362', '1', '223.148.229.128', 'Windows 7', 'chrome-47', '登录成功', '1480746394');
INSERT INTO `log_record` VALUES ('363', '1', '223.148.229.128', 'Windows 7', 'chrome-47', '登录成功', '1480746397');
INSERT INTO `log_record` VALUES ('364', '1', '223.148.229.128', 'Windows 7', 'chrome-47', '登录成功', '1480746401');
INSERT INTO `log_record` VALUES ('365', '1', '14.120.227.161', 'Windows 7', 'chrome-45', '登录成功', '1480747922');
INSERT INTO `log_record` VALUES ('366', '1', '61.131.53.252', 'Windows 7', 'chrome-53', '登录成功', '1480751556');
INSERT INTO `log_record` VALUES ('367', '1', '211.161.199.26', 'Windows 7', 'chrome-53', '登录成功', '1480767787');
INSERT INTO `log_record` VALUES ('368', '1', '113.45.129.61', 'unknow', 'safari-602', '登录成功', '1480781972');
INSERT INTO `log_record` VALUES ('369', '1', '112.51.45.93', 'Linux', 'chrome-54', '登录成功', '1480782922');
INSERT INTO `log_record` VALUES ('370', '1', '222.27.239.245', 'unknow', 'chrome-55', '登录成功', '1480790369');
INSERT INTO `log_record` VALUES ('371', '1', '222.27.239.245', 'unknow', 'chrome-55', '缓存已更新', '1480790385');
INSERT INTO `log_record` VALUES ('372', '1', '222.27.239.245', 'unknow', 'chrome-55', '缓存已更新', '1480790400');
INSERT INTO `log_record` VALUES ('373', '1', '222.27.239.245', 'unknow', 'chrome-55', '缓存已更新', '1480790426');
INSERT INTO `log_record` VALUES ('374', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '登录成功', '1480821271');
INSERT INTO `log_record` VALUES ('375', '1', '211.161.199.26', 'Windows 7', 'chrome-53', '登录成功', '1480822444');
INSERT INTO `log_record` VALUES ('376', '1', '112.2.254.100', 'Windows 10', 'chrome-50', '登录成功', '1480839924');
INSERT INTO `log_record` VALUES ('377', '1', '112.2.254.100', 'Windows 10', 'chrome-50', '菜单管理-添加成功', '1480839991');
INSERT INTO `log_record` VALUES ('378', '0', '112.2.254.100', 'Windows 10', 'chrome-50', '登录失败, [username_mobile: 13330613321],[ status: 密码错误！ ],[password: 881518d0****************b8a4256e]', '1480840068');
INSERT INTO `log_record` VALUES ('379', '1', '112.2.254.100', 'Windows 10', 'chrome-50', '登录成功', '1480840072');
INSERT INTO `log_record` VALUES ('380', '1', '112.2.254.100', 'Windows 10', 'chrome-50', '账号管理-添加成功', '1480840119');
INSERT INTO `log_record` VALUES ('381', '0', '112.2.254.100', 'Windows 10', 'chrome-50', '登录失败, [username_mobile: root],[ status: 该手机号未注册！ ],[password: 3e58c351****************0477ae07]', '1480840168');
INSERT INTO `log_record` VALUES ('382', '0', '112.2.254.100', 'Windows 10', 'chrome-50', '登录失败, [username_mobile: root],[ status: 该手机号未注册！ ],[password: 3e58c351****************0477ae07]', '1480840179');
INSERT INTO `log_record` VALUES ('383', '0', '112.2.254.100', 'Windows 10', 'chrome-50', '登录失败, [username_mobile: root],[ status: 该手机号未注册！ ],[password: 3e58c351****************0477ae07]', '1480840180');
INSERT INTO `log_record` VALUES ('384', '0', '112.2.254.100', 'Windows 10', 'chrome-50', '登录失败, [username_mobile: root],[ status: 该手机号未注册！ ],[password: 3e58c351****************0477ae07]', '1480840180');
INSERT INTO `log_record` VALUES ('385', '24', '112.2.254.100', 'Windows 10', 'chrome-50', '登录成功', '1480840188');
INSERT INTO `log_record` VALUES ('386', '1', '218.94.124.53', 'Windows 10', 'chrome-54', '登录成功', '1480843110');
INSERT INTO `log_record` VALUES ('387', '1', '39.188.48.235', 'Windows 7', 'chrome-49', '登录成功', '1480845726');
INSERT INTO `log_record` VALUES ('388', '1', '111.127.148.206', 'Windows 7', 'chrome-45', '登录成功', '1480850019');
INSERT INTO `log_record` VALUES ('389', '1', '211.161.199.26', 'Windows 7', 'chrome-53', '登录成功', '1480850829');
INSERT INTO `log_record` VALUES ('390', '1', '119.139.69.36', 'Windows 7', 'firefox-50', '登录成功', '1480855719');
INSERT INTO `log_record` VALUES ('391', '1', '124.79.179.215', 'Windows NT', 'chrome-55', '登录成功', '1480856668');
INSERT INTO `log_record` VALUES ('392', '1', '27.46.131.43', 'Windows 7', 'chrome-53', '登录成功', '1480907298');
INSERT INTO `log_record` VALUES ('393', '1', '113.108.164.34', 'Windows 7', 'chrome-49', '登录成功', '1480908439');
INSERT INTO `log_record` VALUES ('394', '1', '121.28.34.78', 'Windows NT', 'chrome-54', '登录成功', '1480910502');
INSERT INTO `log_record` VALUES ('395', '1', '119.129.209.107', 'Windows 7', 'firefox-50', '登录成功', '1480919524');
INSERT INTO `log_record` VALUES ('396', '1', '121.28.34.78', 'Windows NT', 'chrome-54', '登录成功', '1480926365');
INSERT INTO `log_record` VALUES ('397', '1', '183.6.184.42', 'Windows 10', 'ie-unknow', '登录成功', '1480927235');
INSERT INTO `log_record` VALUES ('398', '1', '218.247.181.2', 'unknow', 'chrome-55', '登录成功', '1480928947');
INSERT INTO `log_record` VALUES ('399', '1', '110.152.238.248', 'Windows 10', 'chrome-48', '登录成功', '1480935270');
INSERT INTO `log_record` VALUES ('400', '1', '110.152.238.248', 'Windows 10', 'chrome-48', '角色管理-添加成功', '1480935290');
INSERT INTO `log_record` VALUES ('401', '1', '223.73.116.182', 'Windows XP', 'chrome-53', '登录成功', '1480943607');
INSERT INTO `log_record` VALUES ('402', '1', '219.130.113.41', 'Windows 7', 'chrome-54', '登录成功', '1480946130');
INSERT INTO `log_record` VALUES ('403', '1', '116.224.95.217', 'Windows 7', 'firefox-50', '登录成功', '1480946151');
INSERT INTO `log_record` VALUES ('404', '1', '116.224.95.217', 'Windows 7', 'firefox-50', '角色管理-添加成功', '1480946192');
INSERT INTO `log_record` VALUES ('405', '1', '116.224.95.217', 'Windows 7', 'firefox-50', '菜单管理-添加成功', '1480946277');
INSERT INTO `log_record` VALUES ('406', '1', '116.224.95.217', 'Windows 7', 'firefox-50', '缓存已更新', '1480946369');
INSERT INTO `log_record` VALUES ('407', '1', '116.224.95.217', 'Windows 7', 'firefox-50', '登录成功', '1480946388');
INSERT INTO `log_record` VALUES ('408', '1', '171.34.222.34', 'Windows 7', 'chrome-54', '登录成功', '1480949775');
INSERT INTO `log_record` VALUES ('409', '1', '58.100.5.182', 'Windows 10', 'chrome-55', '登录成功', '1480956390');
INSERT INTO `log_record` VALUES ('410', '1', '211.161.248.219', 'unknow', 'safari-537', '登录成功', '1480980915');
INSERT INTO `log_record` VALUES ('411', '1', '153.37.175.114', 'Linux', 'firefox-45', '登录成功', '1480989049');
INSERT INTO `log_record` VALUES ('412', '1', '119.129.209.172', 'Windows 7', 'firefox-50', '登录成功', '1480989423');
INSERT INTO `log_record` VALUES ('413', '1', '119.129.209.172', 'Windows 7', 'firefox-50', '登录成功', '1480989423');
INSERT INTO `log_record` VALUES ('414', '1', '180.120.173.140', 'Windows XP', 'chrome-49', '登录成功', '1480990271');
INSERT INTO `log_record` VALUES ('415', '1', '113.104.215.191', 'unknow', 'safari-602', '登录成功', '1480991882');
INSERT INTO `log_record` VALUES ('416', '1', '222.43.104.229', 'Windows 10', 'chrome-49', '登录成功', '1480994442');
INSERT INTO `log_record` VALUES ('417', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '登录成功', '1480997963');
INSERT INTO `log_record` VALUES ('418', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1480998437');
INSERT INTO `log_record` VALUES ('419', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1480998446');
INSERT INTO `log_record` VALUES ('420', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1480998458');
INSERT INTO `log_record` VALUES ('421', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '缓存已更新', '1480998467');
INSERT INTO `log_record` VALUES ('422', '1', '115.171.146.187', 'Windows 10', 'ie-7', '登录成功', '1481002219');
INSERT INTO `log_record` VALUES ('423', '1', '218.26.184.125', 'Windows NT', 'ie-7', '登录成功', '1481002521');
INSERT INTO `log_record` VALUES ('424', '1', '117.22.167.246', 'Windows 10', 'firefox-50', '登录成功', '1481003326');
INSERT INTO `log_record` VALUES ('425', '1', '180.120.173.140', 'Windows XP', 'chrome-49', '登录成功', '1481003712');
INSERT INTO `log_record` VALUES ('426', '1', '119.129.209.172', 'Windows 7', 'firefox-50', '登录成功', '1481009359');
INSERT INTO `log_record` VALUES ('427', '1', '124.235.234.109', 'Windows 7', 'chrome-52', '登录成功', '1481018600');
INSERT INTO `log_record` VALUES ('428', '1', '124.235.234.109', 'Windows 7', 'chrome-52', '菜单管理-添加成功', '1481018768');
INSERT INTO `log_record` VALUES ('429', '1', '101.24.28.118', 'unknow', 'safari-600', '登录成功', '1481040017');
INSERT INTO `log_record` VALUES ('430', '1', '120.194.25.90', 'Windows 7', 'firefox-50', '登录成功', '1481072214');
INSERT INTO `log_record` VALUES ('431', '1', '110.87.2.109', 'Windows 7', 'chrome-45', '登录成功', '1481078529');
INSERT INTO `log_record` VALUES ('432', '1', '210.74.158.82', 'Windows 10', 'chrome-51', '登录成功', '1481079649');
INSERT INTO `log_record` VALUES ('433', '1', '123.149.211.243', 'Windows 10', 'chrome-52', '登录成功', '1481088823');
INSERT INTO `log_record` VALUES ('434', '1', '117.71.57.195', 'unknow', 'safari-602', '登录成功', '1481089467');
INSERT INTO `log_record` VALUES ('435', '1', '119.129.208.5', 'Windows 7', 'firefox-50', '登录成功', '1481092566');
INSERT INTO `log_record` VALUES ('436', '1', '125.86.94.164', 'unknow', 'chrome-54', '登录成功', '1481092613');
INSERT INTO `log_record` VALUES ('437', '1', '221.237.156.27', 'Windows NT', 'chrome-52', '登录成功', '1481095210');
INSERT INTO `log_record` VALUES ('438', '1', '183.185.212.9', 'Windows 7', 'firefox-50', '登录成功', '1481105486');
INSERT INTO `log_record` VALUES ('439', '1', '183.185.212.9', 'Windows 7', 'firefox-50', '登录成功', '1481105865');
INSERT INTO `log_record` VALUES ('440', '1', '171.214.181.178', 'Windows 10', 'chrome-54', '登录成功', '1481126343');
INSERT INTO `log_record` VALUES ('441', '1', '112.5.234.71', 'Windows 7', 'firefox-50', '登录成功', '1481130695');
INSERT INTO `log_record` VALUES ('442', '1', '171.221.151.174', 'Windows 7', 'chrome-49', '登录成功', '1481131148');
INSERT INTO `log_record` VALUES ('443', '1', '222.92.34.126', 'Windows 7', 'firefox-50', '登录成功', '1481139071');
INSERT INTO `log_record` VALUES ('444', '1', '222.92.34.126', 'Windows 7', 'firefox-50', '登录成功', '1481139242');
INSERT INTO `log_record` VALUES ('445', '1', '180.136.234.196', 'Linux', 'chrome-55', '登录成功', '1481161825');
INSERT INTO `log_record` VALUES ('446', '1', '222.222.20.21', 'Windows 7', 'chrome-54', '登录成功', '1481162536');
INSERT INTO `log_record` VALUES ('447', '1', '180.136.234.196', 'Linux', 'chrome-55', '登录成功', '1481163465');
INSERT INTO `log_record` VALUES ('448', '1', '182.139.184.236', 'Windows 10', 'chrome-49', '登录成功', '1481164163');
INSERT INTO `log_record` VALUES ('449', '1', '182.139.184.236', 'Windows 10', 'chrome-49', '登录成功', '1481164559');
INSERT INTO `log_record` VALUES ('450', '1', '118.81.242.77', 'Windows 7', 'firefox-50', '登录成功', '1481166134');
INSERT INTO `log_record` VALUES ('451', '1', '222.173.94.214', 'Windows 7', 'ie-7', '登录成功', '1481167690');
INSERT INTO `log_record` VALUES ('452', '1', '106.114.34.201', 'Windows NT', 'chrome-50', '登录成功', '1481169038');
INSERT INTO `log_record` VALUES ('453', '1', '121.35.181.255', 'Windows 10', 'ie-7', '登录成功', '1481171558');
INSERT INTO `log_record` VALUES ('454', '1', '171.116.56.158', 'Windows 7', 'firefox-50', '登录成功', '1481175312');
INSERT INTO `log_record` VALUES ('455', '1', '180.112.168.88', 'Windows 7', 'firefox-50', '登录成功', '1481175340');
INSERT INTO `log_record` VALUES ('456', '1', '220.248.37.214', 'Linux', 'chrome-54', '登录成功', '1481177853');
INSERT INTO `log_record` VALUES ('457', '1', '113.139.192.131', 'Windows 7', 'ie-7', '登录成功', '1481178168');
INSERT INTO `log_record` VALUES ('458', '1', '171.116.56.158', 'Windows 7', 'firefox-50', '登录成功', '1481179268');
INSERT INTO `log_record` VALUES ('459', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '登录成功', '1481192945');
INSERT INTO `log_record` VALUES ('460', '1', '115.183.206.26', 'Windows 7', 'ie-7', '登录成功', '1481193752');
INSERT INTO `log_record` VALUES ('461', '1', '124.164.144.112', 'Windows 7', 'chrome-53', '登录成功', '1481200404');
INSERT INTO `log_record` VALUES ('462', '1', '183.253.130.120', 'Windows 10', 'firefox-50', '登录成功', '1481211243');
INSERT INTO `log_record` VALUES ('463', '1', '183.253.130.120', 'Windows 10', 'firefox-50', '用户留言-编辑失败 ID=28', '1481211306');
INSERT INTO `log_record` VALUES ('464', '1', '183.253.130.120', 'Windows 10', 'firefox-50', '用户留言-添加成功', '1481211320');
INSERT INTO `log_record` VALUES ('465', '1', '183.253.130.120', 'Windows 10', 'firefox-50', '用户留言-添加成功', '1481211326');
INSERT INTO `log_record` VALUES ('466', '1', '183.253.130.120', 'Windows 10', 'firefox-50', '用户留言-添加成功', '1481211335');
INSERT INTO `log_record` VALUES ('467', '1', '183.253.130.120', 'Windows 10', 'firefox-50', '角色管理-添加成功', '1481211364');
INSERT INTO `log_record` VALUES ('468', '1', '183.253.130.120', 'Windows 10', 'firefox-50', '用户留言-添加成功', '1481211652');
INSERT INTO `log_record` VALUES ('469', '1', '106.115.102.212', 'Windows 7', 'chrome-45', '登录成功', '1481213665');
INSERT INTO `log_record` VALUES ('470', '1', '118.113.42.161', 'Windows 10', 'chrome-55', '登录成功', '1481215221');
INSERT INTO `log_record` VALUES ('471', '1', '118.113.42.161', 'Windows 10', 'chrome-55', '登录成功', '1481216091');
INSERT INTO `log_record` VALUES ('472', '1', '113.106.8.232', 'Windows 7', 'chrome-35', '登录成功', '1481244913');
INSERT INTO `log_record` VALUES ('473', '1', '113.106.8.232', 'Windows 7', 'chrome-35', '登录成功', '1481244990');
INSERT INTO `log_record` VALUES ('474', '1', '113.106.8.232', 'Windows 7', 'chrome-35', '登录成功', '1481245006');
INSERT INTO `log_record` VALUES ('475', '1', '113.106.8.232', 'Windows 7', 'chrome-35', '登录成功', '1481245012');
INSERT INTO `log_record` VALUES ('476', '1', '113.106.8.232', 'Windows 7', 'chrome-35', '登录成功', '1481245016');
INSERT INTO `log_record` VALUES ('477', '1', '113.106.8.232', 'Windows 7', 'chrome-35', '登录成功', '1481245080');
INSERT INTO `log_record` VALUES ('478', '1', '113.106.8.232', 'Windows 7', 'chrome-35', '登录成功', '1481245138');
INSERT INTO `log_record` VALUES ('479', '1', '222.161.2.151', 'Windows 10', 'ie-7', '登录成功', '1481251685');
INSERT INTO `log_record` VALUES ('480', '1', '111.201.32.149', 'Windows 10', 'chrome-52', '登录成功', '1481255117');
INSERT INTO `log_record` VALUES ('481', '1', '101.85.6.156', 'Windows 7', 'firefox-50', '登录成功', '1481266662');
INSERT INTO `log_record` VALUES ('482', '1', '121.201.63.88', 'Windows 10', 'chrome-54', '登录成功', '1481267478');
INSERT INTO `log_record` VALUES ('483', '1', '121.69.46.54', 'unknow', 'firefox-50', '登录成功', '1481267656');
INSERT INTO `log_record` VALUES ('484', '1', '113.204.225.126', 'Windows 10', 'chrome-54', '登录成功', '1481269407');
INSERT INTO `log_record` VALUES ('485', '1', '113.204.225.126', 'Windows 10', 'chrome-54', '角色管理-添加成功', '1481269463');
INSERT INTO `log_record` VALUES ('486', '1', '113.204.225.126', 'Windows 10', 'chrome-54', '角色管理-编辑成功 ID=21', '1481269474');
INSERT INTO `log_record` VALUES ('487', '1', '113.204.225.126', 'Windows 10', 'chrome-54', '角色管理-编辑成功 ID=21', '1481269496');
INSERT INTO `log_record` VALUES ('488', '1', '171.221.151.174', 'Windows 7', 'chrome-49', '登录成功', '1481272327');
INSERT INTO `log_record` VALUES ('489', '1', '171.221.151.174', 'Windows 7', 'chrome-49', '登录成功', '1481273484');
INSERT INTO `log_record` VALUES ('490', '1', '61.242.42.219', 'Windows 10', 'chrome-51', '登录成功', '1481276250');
INSERT INTO `log_record` VALUES ('491', '1', '202.118.212.36', 'Windows 10', 'chrome-53', '登录成功', '1481286566');
INSERT INTO `log_record` VALUES ('492', '1', '222.35.157.81', 'unknow', 'chrome-54', '登录成功', '1481290562');
INSERT INTO `log_record` VALUES ('493', '1', '222.55.65.223', 'Windows 7', 'chrome-52', '登录成功', '1481333182');
INSERT INTO `log_record` VALUES ('494', '1', '27.184.49.204', 'Windows 7', 'chrome-54', '登录成功', '1481333500');
INSERT INTO `log_record` VALUES ('495', '1', '221.237.179.109', 'Windows 7', 'chrome-45', '登录成功', '1481334063');
INSERT INTO `log_record` VALUES ('496', '1', '116.112.12.73', 'Windows 7', 'chrome-38', '登录成功', '1481336471');
INSERT INTO `log_record` VALUES ('497', '1', '116.112.12.73', 'Windows 7', 'chrome-38', '登录成功', '1481336488');
INSERT INTO `log_record` VALUES ('498', '1', '116.112.12.73', 'Windows 7', 'chrome-38', '用户留言-添加成功', '1481336518');
INSERT INTO `log_record` VALUES ('499', '1', '119.130.71.126', 'Windows 7', 'chrome-56', '登录成功', '1481337705');
INSERT INTO `log_record` VALUES ('500', '1', '119.129.211.9', 'Windows 7', 'firefox-50', '登录成功', '1481341473');
INSERT INTO `log_record` VALUES ('501', '1', '210.77.3.138', 'unknow', 'safari-601', '登录成功', '1481368421');
INSERT INTO `log_record` VALUES ('502', '1', '144.52.89.129', 'Windows NT', 'chrome-45', '登录成功', '1481375180');
INSERT INTO `log_record` VALUES ('503', '1', '122.227.195.38', 'Linux', 'chrome-54', '登录成功', '1481375247');
INSERT INTO `log_record` VALUES ('504', '1', '122.79.73.81', 'Windows 10', 'chrome-54', '登录成功', '1481378525');
INSERT INTO `log_record` VALUES ('505', '1', '120.85.85.232', 'Windows 10', 'chrome-53', '登录成功', '1481431327');
INSERT INTO `log_record` VALUES ('506', '1', '218.19.99.248', 'Windows 10', 'chrome-55', '登录成功', '1481443735');
INSERT INTO `log_record` VALUES ('507', '1', '116.243.174.40', 'unknow', 'chrome-54', '登录成功', '1481459793');
INSERT INTO `log_record` VALUES ('508', '1', '106.114.34.201', 'Windows NT', 'chrome-50', '登录成功', '1481462508');
INSERT INTO `log_record` VALUES ('509', '1', '14.131.248.78', 'Windows 10', 'chrome-55', '登录成功', '1481466886');
INSERT INTO `log_record` VALUES ('510', '1', '183.12.65.179', 'Windows 7', 'chrome-54', '登录成功', '1481510977');
INSERT INTO `log_record` VALUES ('511', '1', '183.12.65.179', 'Windows 7', 'chrome-54', '登录成功', '1481511026');
INSERT INTO `log_record` VALUES ('512', '1', '183.12.65.179', 'Windows 7', 'chrome-54', '登录成功', '1481511036');
INSERT INTO `log_record` VALUES ('513', '1', '203.198.38.88', 'Windows 7', 'chrome-54', '登录成功', '1481512871');
INSERT INTO `log_record` VALUES ('514', '1', '59.57.120.10', 'Windows 7', 'ie-7', '登录成功', '1481519436');
INSERT INTO `log_record` VALUES ('515', '1', '112.229.107.199', 'Windows 7', 'firefox-50', '登录成功', '1481523113');
INSERT INTO `log_record` VALUES ('516', '1', '113.73.8.93', 'Windows 10', 'chrome-49', '登录成功', '1481529412');
INSERT INTO `log_record` VALUES ('517', '1', '220.231.46.194', 'unknow', 'chrome-55', '登录成功', '1481530883');
INSERT INTO `log_record` VALUES ('518', '1', '220.231.46.194', 'unknow', 'chrome-55', '用户留言-添加成功', '1481530979');
INSERT INTO `log_record` VALUES ('519', '1', '220.231.46.194', 'unknow', 'chrome-55', '登录成功', '1481531030');
INSERT INTO `log_record` VALUES ('520', '1', '220.231.46.194', 'unknow', 'chrome-55', '登录成功', '1481533399');
INSERT INTO `log_record` VALUES ('521', '1', '140.255.151.208', 'Windows 10', 'firefox-50', '登录成功', '1481542668');
INSERT INTO `log_record` VALUES ('522', '1', '140.255.151.208', 'Windows 10', 'firefox-50', '登录成功', '1481542723');
INSERT INTO `log_record` VALUES ('523', '1', '116.1.126.16', 'Windows 7', 'chrome-49', '登录成功', '1481549763');
INSERT INTO `log_record` VALUES ('524', '1', '114.39.216.15', 'Linux', 'chrome-54', '登录成功', '1481550398');
INSERT INTO `log_record` VALUES ('525', '1', '112.5.237.78', 'Windows 7', 'chrome-56', '登录成功', '1481551331');
INSERT INTO `log_record` VALUES ('526', '1', '112.5.237.78', 'Windows 7', 'chrome-56', '登录成功', '1481551367');
INSERT INTO `log_record` VALUES ('527', '1', '112.5.237.78', 'Windows 7', 'chrome-56', '登录成功', '1481551382');
INSERT INTO `log_record` VALUES ('528', '1', '112.5.237.78', 'Windows 7', 'chrome-56', '角色管理-添加成功', '1481551415');
INSERT INTO `log_record` VALUES ('529', '1', '112.5.237.78', 'Windows 7', 'chrome-56', '角色管理-添加成功', '1481551425');
INSERT INTO `log_record` VALUES ('530', '1', '112.5.237.78', 'Windows 7', 'chrome-56', '角色管理-编辑成功 ID=1', '1481551438');
INSERT INTO `log_record` VALUES ('531', '1', '112.5.237.78', 'Windows 7', 'chrome-56', '角色管理-编辑成功 ID=21', '1481551651');
INSERT INTO `log_record` VALUES ('532', '1', '123.121.32.39', 'Windows 10', 'chrome-55', '登录成功', '1481561179');
INSERT INTO `log_record` VALUES ('533', '1', '14.217.203.0', 'Windows 7', 'firefox-50', '登录成功', '1481562209');
INSERT INTO `log_record` VALUES ('534', '1', '113.225.62.1', 'Windows 7', 'ie-unknow', '登录成功', '1481595184');
INSERT INTO `log_record` VALUES ('535', '1', '171.116.200.106', 'Windows 10', 'chrome-55', '登录成功', '1481595204');
INSERT INTO `log_record` VALUES ('536', '1', '113.104.33.115', 'Windows 7', 'firefox-50', '登录成功', '1481596471');
INSERT INTO `log_record` VALUES ('537', '1', '114.242.8.210', 'Windows 10', 'firefox-50', '登录成功', '1481597563');
INSERT INTO `log_record` VALUES ('538', '1', '117.158.206.86', 'Windows 7', 'chrome-54', '登录成功', '1481600472');
INSERT INTO `log_record` VALUES ('539', '1', '123.152.35.167', 'Windows 95', 'chrome-50', '登录成功', '1481603269');
INSERT INTO `log_record` VALUES ('540', '1', '119.137.1.239', 'Windows 10', 'chrome-50', '登录成功', '1481608940');
INSERT INTO `log_record` VALUES ('541', '1', '61.132.135.106', 'Windows 10', 'chrome-50', '登录成功', '1481615220');
INSERT INTO `log_record` VALUES ('542', '1', '60.221.133.101', 'Windows 7', 'chrome-54', '登录成功', '1481615222');
INSERT INTO `log_record` VALUES ('543', '1', '61.132.135.106', 'Windows 10', 'chrome-50', '账号管理-添加成功', '1481615359');
INSERT INTO `log_record` VALUES ('544', '1', '125.92.131.254', 'Windows 10', 'chrome-49', '登录成功', '1481616410');
INSERT INTO `log_record` VALUES ('545', '1', '49.77.130.5', 'Windows 7', 'chrome-45', '登录成功', '1481619794');
INSERT INTO `log_record` VALUES ('546', '1', '112.230.187.16', 'Windows 7', 'chrome-45', '登录成功', '1481675511');
INSERT INTO `log_record` VALUES ('547', '1', '222.74.205.2', 'Windows 7', 'chrome-45', '登录成功', '1481677545');
INSERT INTO `log_record` VALUES ('548', '1', '222.74.205.2', 'Windows 7', 'chrome-45', '用户留言-添加成功', '1481677981');
INSERT INTO `log_record` VALUES ('549', '1', '222.74.205.2', 'Windows 7', 'chrome-45', '缓存已更新', '1481679648');
INSERT INTO `log_record` VALUES ('550', '1', '222.74.205.2', 'Windows 7', 'chrome-45', '登录成功', '1481680173');
INSERT INTO `log_record` VALUES ('551', '1', '222.74.205.2', 'Windows 7', 'chrome-45', '缓存已更新', '1481680308');
INSERT INTO `log_record` VALUES ('552', '1', '222.74.205.2', 'Windows 7', 'chrome-45', '菜单节点管理-删除成功 IDS=s:3:\"137\";', '1481680337');
INSERT INTO `log_record` VALUES ('553', '1', '222.74.205.2', 'Windows 7', 'chrome-45', '缓存已更新', '1481680392');
INSERT INTO `log_record` VALUES ('554', '1', '222.74.205.2', 'Windows 7', 'chrome-45', '登录成功', '1481687228');
INSERT INTO `log_record` VALUES ('555', '1', '219.133.226.120', 'Windows 10', 'ie-7', '登录成功', '1481695051');
INSERT INTO `log_record` VALUES ('556', '1', '219.133.226.120', 'Windows 10', 'chrome-45', '缓存已更新', '1481695272');
INSERT INTO `log_record` VALUES ('557', '1', '219.133.226.120', 'Windows 10', 'chrome-45', '账号管理-编辑成功', '1481695347');
INSERT INTO `log_record` VALUES ('558', '1', '219.133.226.120', 'Windows 10', 'chrome-45', '登录成功', '1481695466');
INSERT INTO `log_record` VALUES ('559', '1', '221.2.139.217', 'Windows 7', 'chrome-54', '登录成功', '1481696959');
INSERT INTO `log_record` VALUES ('560', '1', '144.52.89.129', 'Windows NT', 'chrome-45', '登录成功', '1481720668');
INSERT INTO `log_record` VALUES ('561', '1', '124.225.238.111', 'Windows 7', 'ie-7', '登录成功', '1481725498');
INSERT INTO `log_record` VALUES ('562', '1', '123.119.226.211', 'Windows 10', 'chrome-54', '登录成功', '1481751641');
INSERT INTO `log_record` VALUES ('563', '1', '123.119.226.211', 'Windows 10', 'chrome-54', '角色管理-添加成功', '1481751766');
INSERT INTO `log_record` VALUES ('564', '1', '119.129.209.39', 'Windows 7', 'firefox-50', '登录成功', '1481762689');
INSERT INTO `log_record` VALUES ('565', '1', '111.200.52.2', 'Windows 10', 'chrome-54', '登录成功', '1481770356');
INSERT INTO `log_record` VALUES ('566', '1', '61.52.243.140', 'Windows 10', 'firefox-50', '登录成功', '1481779038');
INSERT INTO `log_record` VALUES ('567', '1', '58.251.52.117', 'Windows 7', 'chrome-45', '登录成功', '1481780113');
INSERT INTO `log_record` VALUES ('568', '1', '61.235.65.164', 'Windows 7', 'firefox-50', '登录成功', '1481782252');
INSERT INTO `log_record` VALUES ('569', '1', '119.129.209.39', 'Windows 7', 'firefox-50', '登录成功', '1481785782');
INSERT INTO `log_record` VALUES ('570', '1', '49.149.4.199', 'Windows 10', 'chrome-55', '登录成功', '1481785840');
INSERT INTO `log_record` VALUES ('571', '1', '119.129.209.39', 'Windows 7', 'firefox-50', '登录成功', '1481786362');
INSERT INTO `log_record` VALUES ('572', '1', '110.184.242.62', 'Windows 7', 'chrome-44', '登录成功', '1481788362');
INSERT INTO `log_record` VALUES ('573', '1', '110.184.242.62', 'Windows 7', 'chrome-44', '账号管理-添加成功', '1481788437');
INSERT INTO `log_record` VALUES ('574', '0', '110.184.242.62', 'Windows 7', 'chrome-44', '登录失败, [username_mobile: pcc],[ status: 该手机号未注册！ ],[password: 8d290009****************49466412]', '1481788483');
INSERT INTO `log_record` VALUES ('575', '0', '110.184.242.62', 'Windows 7', 'chrome-44', '登录失败, [username_mobile: 18030877380],[ status: 该手机号未注册！ ],[password: 8d290009****************49466412]', '1481788493');
INSERT INTO `log_record` VALUES ('576', '0', '110.184.242.62', 'Windows 7', 'chrome-44', '登录失败, [username_mobile: 18030877380],[ status: 该手机号未注册！ ],[password: 8d290009****************49466412]', '1481788493');
INSERT INTO `log_record` VALUES ('577', '0', '110.184.242.62', 'Windows 7', 'chrome-44', '登录失败, [username_mobile: 18030877380],[ status: 该手机号未注册！ ],[password: 8d290009****************49466412]', '1481788493');
INSERT INTO `log_record` VALUES ('578', '0', '110.184.242.62', 'Windows 7', 'chrome-44', '登录失败, [username_mobile: 18030877380],[ status: 该手机号未注册！ ],[password: 8d290009****************49466412]', '1481788494');
INSERT INTO `log_record` VALUES ('579', '0', '110.184.242.62', 'Windows 7', 'chrome-44', '登录失败, [username_mobile: 18030877380],[ status: 该手机号未注册！ ],[password: 8d290009****************49466412]', '1481788494');
INSERT INTO `log_record` VALUES ('580', '0', '110.184.242.62', 'Windows 7', 'chrome-44', '登录失败, [username_mobile: 18030877380],[ status: 该手机号未注册！ ],[password: 8d290009****************49466412]', '1481788494');
INSERT INTO `log_record` VALUES ('581', '0', '110.184.242.62', 'Windows 7', 'chrome-44', '登录失败, [username_mobile: 18030877380],[ status: 该手机号未注册！ ],[password: 8d290009****************49466412]', '1481788495');
INSERT INTO `log_record` VALUES ('582', '1', '110.184.242.62', 'Windows 7', 'chrome-44', '登录成功', '1481788502');
INSERT INTO `log_record` VALUES ('583', '0', '110.184.242.62', 'Windows 7', 'chrome-44', '登录失败, [username_mobile: 18503087738],[ status: 该账号未授权，请联系超级管理。 ],[password: 8d290009****************49466412]', '1481788520');
INSERT INTO `log_record` VALUES ('584', '1', '110.184.242.62', 'Windows 7', 'chrome-44', '登录成功', '1481788526');
INSERT INTO `log_record` VALUES ('585', '26', '110.184.242.62', 'Windows 7', 'chrome-44', '登录成功', '1481788550');
INSERT INTO `log_record` VALUES ('586', '1', '220.248.37.214', 'Linux', 'chrome-55', '登录成功', '1481790120');
INSERT INTO `log_record` VALUES ('587', '1', '180.173.49.249', 'Windows 7', 'chrome-53', '登录成功', '1481795509');
INSERT INTO `log_record` VALUES ('588', '1', '114.245.190.217', 'Windows 7', 'ie-7', '登录成功', '1481853832');
INSERT INTO `log_record` VALUES ('589', '1', '58.218.196.214', 'unknow', 'safari-602', '登录成功', '1481859148');
INSERT INTO `log_record` VALUES ('590', '1', '119.129.209.39', 'Windows 7', 'firefox-50', '登录成功', '1481859223');
INSERT INTO `log_record` VALUES ('591', '1', '112.117.191.91', 'Windows 7', 'chrome-55', '登录成功', '1481866088');
INSERT INTO `log_record` VALUES ('592', '1', '182.101.180.28', 'Windows 7', 'firefox-50', '登录成功', '1481875236');
INSERT INTO `log_record` VALUES ('593', '1', '182.101.180.28', 'Windows 7', 'firefox-50', '登录成功', '1481875620');
INSERT INTO `log_record` VALUES ('594', '1', '14.213.156.22', 'Windows 7', 'chrome-52', '登录成功', '1481876125');
INSERT INTO `log_record` VALUES ('595', '1', '183.154.95.81', 'Windows 7', 'chrome-54', '登录成功', '1481879975');
INSERT INTO `log_record` VALUES ('596', '1', '119.129.82.120', 'unknow', 'safari-602', '登录成功', '1481891365');
INSERT INTO `log_record` VALUES ('597', '1', '119.101.46.26', 'Windows 7', 'ie-unknow', '登录成功', '1481891367');
INSERT INTO `log_record` VALUES ('598', '1', '120.85.76.13', 'Windows 7', 'chrome-55', '登录成功', '1481891432');
INSERT INTO `log_record` VALUES ('599', '1', '110.53.205.183', 'unknow', 'safari-602', '登录成功', '1481891459');
INSERT INTO `log_record` VALUES ('600', '1', '110.228.105.72', 'Windows 10', 'chrome-45', '登录成功', '1481891463');
INSERT INTO `log_record` VALUES ('601', '1', '223.74.155.238', 'unknow', 'safari-602', '登录成功', '1481891468');
INSERT INTO `log_record` VALUES ('602', '1', '122.207.223.133', 'Windows 95', 'chrome-50', '登录成功', '1481891517');
INSERT INTO `log_record` VALUES ('603', '1', '222.65.152.86', 'Windows 10', 'chrome-53', '登录成功', '1481891538');
INSERT INTO `log_record` VALUES ('604', '1', '221.237.18.164', 'Windows 7', 'chrome-53', '登录成功', '1481891576');
INSERT INTO `log_record` VALUES ('605', '1', '121.34.130.50', 'Windows 7', 'chrome-44', '登录成功', '1481891576');
INSERT INTO `log_record` VALUES ('606', '1', '221.237.18.164', 'Windows 7', 'chrome-53', '登录成功', '1481891597');
INSERT INTO `log_record` VALUES ('607', '1', '42.49.178.23', 'Windows 7', 'firefox-50', '登录成功', '1481891646');
INSERT INTO `log_record` VALUES ('608', '1', '117.72.136.220', 'Windows 7', 'chrome-53', '登录成功', '1481891650');
INSERT INTO `log_record` VALUES ('609', '1', '139.204.22.150', 'Windows 7', 'chrome-45', '登录成功', '1481891702');
INSERT INTO `log_record` VALUES ('610', '1', '27.42.98.168', 'Windows 10', 'chrome-51', '登录成功', '1481891718');
INSERT INTO `log_record` VALUES ('611', '1', '121.204.97.198', 'Windows 10', 'ie-7', '登录成功', '1481891785');
INSERT INTO `log_record` VALUES ('612', '1', '45.32.89.40', 'Windows 7', 'firefox-50', '登录成功', '1481891798');
INSERT INTO `log_record` VALUES ('613', '1', '61.183.140.250', 'Windows 10', 'chrome-54', '登录成功', '1481891839');
INSERT INTO `log_record` VALUES ('614', '1', '27.151.94.54', 'Windows 7', 'firefox-50', '登录成功', '1481891902');
INSERT INTO `log_record` VALUES ('615', '1', '218.77.74.149', 'Windows 10', 'chrome-55', '登录成功', '1481891909');
INSERT INTO `log_record` VALUES ('616', '1', '218.109.219.105', 'Windows 7', 'chrome-50', '登录成功', '1481891926');
INSERT INTO `log_record` VALUES ('617', '1', '140.240.114.213', 'Windows 7', 'chrome-54', '登录成功', '1481892014');
INSERT INTO `log_record` VALUES ('618', '1', '58.51.23.68', 'Windows 7', 'firefox-50', '登录成功', '1481892068');
INSERT INTO `log_record` VALUES ('619', '1', '218.77.74.149', 'Windows 10', 'chrome-55', '角色管理-编辑成功 ID=1', '1481892100');
INSERT INTO `log_record` VALUES ('620', '1', '140.240.114.213', 'Windows 7', 'chrome-54', '缓存已更新', '1481892102');
INSERT INTO `log_record` VALUES ('621', '1', '180.102.187.57', 'unknow', 'chrome-50', '登录成功', '1481892160');
INSERT INTO `log_record` VALUES ('622', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482215158');
INSERT INTO `log_record` VALUES ('623', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482289088');
INSERT INTO `log_record` VALUES ('624', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482297092');
INSERT INTO `log_record` VALUES ('625', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482311368');
INSERT INTO `log_record` VALUES ('626', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482376069');
INSERT INTO `log_record` VALUES ('627', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482376069');
INSERT INTO `log_record` VALUES ('628', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482376244');
INSERT INTO `log_record` VALUES ('629', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482376244');
INSERT INTO `log_record` VALUES ('630', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482376244');
INSERT INTO `log_record` VALUES ('631', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482376295');
INSERT INTO `log_record` VALUES ('632', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482376295');
INSERT INTO `log_record` VALUES ('633', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482376295');
INSERT INTO `log_record` VALUES ('634', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482376295');
INSERT INTO `log_record` VALUES ('635', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482376569');
INSERT INTO `log_record` VALUES ('636', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482376569');
INSERT INTO `log_record` VALUES ('637', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482376569');
INSERT INTO `log_record` VALUES ('638', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482376569');
INSERT INTO `log_record` VALUES ('639', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482376569');
INSERT INTO `log_record` VALUES ('640', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482376737');
INSERT INTO `log_record` VALUES ('641', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482376737');
INSERT INTO `log_record` VALUES ('642', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482376737');
INSERT INTO `log_record` VALUES ('643', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482376737');
INSERT INTO `log_record` VALUES ('644', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482378546');
INSERT INTO `log_record` VALUES ('645', '0', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482633506');
INSERT INTO `log_record` VALUES ('646', '1', '127.0.0.1', 'Windows 7', 'chrome-49', '登录成功', '1482636390');
