/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : xinyu

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2016-03-03 19:36:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for xy_ad
-- ----------------------------
DROP TABLE IF EXISTS `xy_ad`;
CREATE TABLE `xy_ad` (
  `ad_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `ad_name` varchar(255) NOT NULL COMMENT '广告名称',
  `ad_content` text COMMENT '广告内容',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`ad_id`),
  KEY `ad_name` (`ad_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xy_ad
-- ----------------------------

-- ----------------------------
-- Table structure for xy_asset
-- ----------------------------
DROP TABLE IF EXISTS `xy_asset`;
CREATE TABLE `xy_asset` (
  `aid` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `key` varchar(50) NOT NULL COMMENT '资源 key',
  `filename` varchar(50) DEFAULT NULL COMMENT '文件名',
  `filesize` int(11) DEFAULT NULL COMMENT '文件大小,单位Byte',
  `filepath` varchar(200) NOT NULL COMMENT '文件路径，相对于 upload 目录，可以为 url',
  `uploadtime` int(11) NOT NULL COMMENT '上传时间',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1：可用，0：删除，不可用',
  `meta` text COMMENT '其它详细信息，JSON格式',
  `suffix` varchar(50) DEFAULT NULL COMMENT '文件后缀名，不包括点',
  `download_times` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of xy_asset
-- ----------------------------

-- ----------------------------
-- Table structure for xy_auth_access
-- ----------------------------
DROP TABLE IF EXISTS `xy_auth_access`;
CREATE TABLE `xy_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_',
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限授权表';

-- ----------------------------
-- Records of xy_auth_access
-- ----------------------------

-- ----------------------------
-- Table structure for xy_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `xy_auth_rule`;
CREATE TABLE `xy_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '1' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(255) DEFAULT NULL COMMENT '额外url参数',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=165 DEFAULT CHARSET=utf8 COMMENT='权限规则表';

-- ----------------------------
-- Records of xy_auth_rule
-- ----------------------------
INSERT INTO `xy_auth_rule` VALUES ('1', 'Admin', 'admin_url', 'admin/content/default', null, '内容管理', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('2', 'Api', 'admin_url', 'api/guestbookadmin/index', null, '所有留言', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('3', 'Api', 'admin_url', 'api/guestbookadmin/delete', null, '删除网站留言', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('4', 'Comment', 'admin_url', 'comment/commentadmin/index', null, '评论管理', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('5', 'Comment', 'admin_url', 'comment/commentadmin/delete', null, '删除评论', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('6', 'Comment', 'admin_url', 'comment/commentadmin/check', null, '评论审核', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('7', 'Portal', 'admin_url', 'portal/adminpost/index', null, '文章管理', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('8', 'Portal', 'admin_url', 'portal/adminpost/listorders', null, '文章排序', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('9', 'Portal', 'admin_url', 'portal/adminpost/top', null, '文章置顶', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('10', 'Portal', 'admin_url', 'portal/adminpost/recommend', null, '文章推荐', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('11', 'Portal', 'admin_url', 'portal/adminpost/move', null, '批量移动', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('12', 'Portal', 'admin_url', 'portal/adminpost/check', null, '文章审核', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('13', 'Portal', 'admin_url', 'portal/adminpost/delete', null, '删除文章', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('14', 'Portal', 'admin_url', 'portal/adminpost/edit', null, '编辑文章', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('15', 'Portal', 'admin_url', 'portal/adminpost/edit_post', null, '提交编辑', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('16', 'Portal', 'admin_url', 'portal/adminpost/add', null, '添加文章', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('17', 'Portal', 'admin_url', 'portal/adminpost/add_post', null, '提交添加', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('18', 'Portal', 'admin_url', 'portal/adminterm/index', null, '分类管理', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('19', 'Portal', 'admin_url', 'portal/adminterm/listorders', null, '文章分类排序', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('20', 'Portal', 'admin_url', 'portal/adminterm/delete', null, '删除分类', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('21', 'Portal', 'admin_url', 'portal/adminterm/edit', null, '编辑分类', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('22', 'Portal', 'admin_url', 'portal/adminterm/edit_post', null, '提交编辑', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('23', 'Portal', 'admin_url', 'portal/adminterm/add', null, '添加分类', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('24', 'Portal', 'admin_url', 'portal/adminterm/add_post', null, '提交添加', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('25', 'Portal', 'admin_url', 'portal/adminpage/index', null, '页面管理', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('26', 'Portal', 'admin_url', 'portal/adminpage/listorders', null, '页面排序', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('27', 'Portal', 'admin_url', 'portal/adminpage/delete', null, '删除页面', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('28', 'Portal', 'admin_url', 'portal/adminpage/edit', null, '编辑页面', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('29', 'Portal', 'admin_url', 'portal/adminpage/edit_post', null, '提交编辑', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('30', 'Portal', 'admin_url', 'portal/adminpage/add', null, '添加页面', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('31', 'Portal', 'admin_url', 'portal/adminpage/add_post', null, '提交添加', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('32', 'Admin', 'admin_url', 'admin/recycle/default', null, '回收站', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('33', 'Portal', 'admin_url', 'portal/adminpost/recyclebin', null, '文章回收', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('34', 'Portal', 'admin_url', 'portal/adminpost/restore', null, '文章还原', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('35', 'Portal', 'admin_url', 'portal/adminpost/clean', null, '彻底删除', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('36', 'Portal', 'admin_url', 'portal/adminpage/recyclebin', null, '页面回收', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('37', 'Portal', 'admin_url', 'portal/adminpage/clean', null, '彻底删除', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('38', 'Portal', 'admin_url', 'portal/adminpage/restore', null, '页面还原', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('39', 'Admin', 'admin_url', 'admin/extension/default', null, '扩展工具', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('40', 'Admin', 'admin_url', 'admin/backup/default', null, '备份管理', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('41', 'Admin', 'admin_url', 'admin/backup/restore', null, '数据还原', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('42', 'Admin', 'admin_url', 'admin/backup/index', null, '数据备份', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('43', 'Admin', 'admin_url', 'admin/backup/index_post', null, '提交数据备份', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('44', 'Admin', 'admin_url', 'admin/backup/download', null, '下载备份', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('45', 'Admin', 'admin_url', 'admin/backup/del_backup', null, '删除备份', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('46', 'Admin', 'admin_url', 'admin/backup/import', null, '数据备份导入', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('47', 'Admin', 'admin_url', 'admin/plugin/index', null, '插件管理', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('48', 'Admin', 'admin_url', 'admin/plugin/toggle', null, '插件启用切换', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('49', 'Admin', 'admin_url', 'admin/plugin/setting', null, '插件设置', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('50', 'Admin', 'admin_url', 'admin/plugin/setting_post', null, '插件设置提交', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('51', 'Admin', 'admin_url', 'admin/plugin/install', null, '插件安装', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('52', 'Admin', 'admin_url', 'admin/plugin/uninstall', null, '插件卸载', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('53', 'Admin', 'admin_url', 'admin/slide/default', null, '幻灯片', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('54', 'Admin', 'admin_url', 'admin/slide/index', null, '幻灯片管理', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('55', 'Admin', 'admin_url', 'admin/slide/listorders', null, '幻灯片排序', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('56', 'Admin', 'admin_url', 'admin/slide/toggle', null, '幻灯片显示切换', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('57', 'Admin', 'admin_url', 'admin/slide/delete', null, '删除幻灯片', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('58', 'Admin', 'admin_url', 'admin/slide/edit', null, '编辑幻灯片', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('59', 'Admin', 'admin_url', 'admin/slide/edit_post', null, '提交编辑', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('60', 'Admin', 'admin_url', 'admin/slide/add', null, '添加幻灯片', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('61', 'Admin', 'admin_url', 'admin/slide/add_post', null, '提交添加', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('62', 'Admin', 'admin_url', 'admin/slidecat/index', null, '幻灯片分类', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('63', 'Admin', 'admin_url', 'admin/slidecat/delete', null, '删除分类', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('64', 'Admin', 'admin_url', 'admin/slidecat/edit', null, '编辑分类', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('65', 'Admin', 'admin_url', 'admin/slidecat/edit_post', null, '提交编辑', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('66', 'Admin', 'admin_url', 'admin/slidecat/add', null, '添加分类', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('67', 'Admin', 'admin_url', 'admin/slidecat/add_post', null, '提交添加', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('68', 'Admin', 'admin_url', 'admin/ad/index', null, '网站广告', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('69', 'Admin', 'admin_url', 'admin/ad/toggle', null, '广告显示切换', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('70', 'Admin', 'admin_url', 'admin/ad/delete', null, '删除广告', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('71', 'Admin', 'admin_url', 'admin/ad/edit', null, '编辑广告', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('72', 'Admin', 'admin_url', 'admin/ad/edit_post', null, '提交编辑', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('73', 'Admin', 'admin_url', 'admin/ad/add', null, '添加广告', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('74', 'Admin', 'admin_url', 'admin/ad/add_post', null, '提交添加', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('75', 'Admin', 'admin_url', 'admin/link/index', null, '友情链接', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('76', 'Admin', 'admin_url', 'admin/link/listorders', null, '友情链接排序', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('77', 'Admin', 'admin_url', 'admin/link/toggle', null, '友链显示切换', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('78', 'Admin', 'admin_url', 'admin/link/delete', null, '删除友情链接', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('79', 'Admin', 'admin_url', 'admin/link/edit', null, '编辑友情链接', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('80', 'Admin', 'admin_url', 'admin/link/edit_post', null, '提交编辑', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('81', 'Admin', 'admin_url', 'admin/link/add', null, '添加友情链接', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('82', 'Admin', 'admin_url', 'admin/link/add_post', null, '提交添加', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('83', 'Api', 'admin_url', 'api/oauthadmin/setting', null, '第三方登陆', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('84', 'Api', 'admin_url', 'api/oauthadmin/setting_post', null, '提交设置', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('85', 'Admin', 'admin_url', 'admin/menu/default', null, '菜单管理', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('86', 'Admin', 'admin_url', 'admin/navcat/default1', null, '前台菜单', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('87', 'Admin', 'admin_url', 'admin/nav/index', null, '菜单管理', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('88', 'Admin', 'admin_url', 'admin/nav/listorders', null, '前台导航排序', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('89', 'Admin', 'admin_url', 'admin/nav/delete', null, '删除菜单', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('90', 'Admin', 'admin_url', 'admin/nav/edit', null, '编辑菜单', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('91', 'Admin', 'admin_url', 'admin/nav/edit_post', null, '提交编辑', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('92', 'Admin', 'admin_url', 'admin/nav/add', null, '添加菜单', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('93', 'Admin', 'admin_url', 'admin/nav/add_post', null, '提交添加', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('94', 'Admin', 'admin_url', 'admin/navcat/index', null, '菜单分类', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('95', 'Admin', 'admin_url', 'admin/navcat/delete', null, '删除分类', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('96', 'Admin', 'admin_url', 'admin/navcat/edit', null, '编辑分类', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('97', 'Admin', 'admin_url', 'admin/navcat/edit_post', null, '提交编辑', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('98', 'Admin', 'admin_url', 'admin/navcat/add', null, '添加分类', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('99', 'Admin', 'admin_url', 'admin/navcat/add_post', null, '提交添加', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('100', 'Admin', 'admin_url', 'admin/menu/index', null, '后台菜单', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('101', 'Admin', 'admin_url', 'admin/menu/add', null, '添加菜单', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('102', 'Admin', 'admin_url', 'admin/menu/add_post', null, '提交添加', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('103', 'Admin', 'admin_url', 'admin/menu/listorders', null, '后台菜单排序', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('104', 'Admin', 'admin_url', 'admin/menu/export_menu', null, '菜单备份', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('105', 'Admin', 'admin_url', 'admin/menu/edit', null, '编辑菜单', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('106', 'Admin', 'admin_url', 'admin/menu/edit_post', null, '提交编辑', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('107', 'Admin', 'admin_url', 'admin/menu/delete', null, '删除菜单', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('108', 'Admin', 'admin_url', 'admin/menu/lists', null, '所有菜单', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('109', 'Admin', 'admin_url', 'admin/setting/default', null, '设置', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('110', 'Admin', 'admin_url', 'admin/setting/userdefault', null, '个人信息', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('111', 'Admin', 'admin_url', 'admin/user/userinfo', null, '修改信息', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('112', 'Admin', 'admin_url', 'admin/user/userinfo_post', null, '修改信息提交', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('113', 'Admin', 'admin_url', 'admin/setting/password', null, '修改密码', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('114', 'Admin', 'admin_url', 'admin/setting/password_post', null, '提交修改', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('115', 'Admin', 'admin_url', 'admin/setting/site', null, '网站信息', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('116', 'Admin', 'admin_url', 'admin/setting/site_post', null, '提交修改', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('117', 'Admin', 'admin_url', 'admin/route/index', null, '路由列表', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('118', 'Admin', 'admin_url', 'admin/route/add', null, '路由添加', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('119', 'Admin', 'admin_url', 'admin/route/add_post', null, '路由添加提交', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('120', 'Admin', 'admin_url', 'admin/route/edit', null, '路由编辑', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('121', 'Admin', 'admin_url', 'admin/route/edit_post', null, '路由编辑提交', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('122', 'Admin', 'admin_url', 'admin/route/delete', null, '路由删除', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('123', 'Admin', 'admin_url', 'admin/route/ban', null, '路由禁止', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('124', 'Admin', 'admin_url', 'admin/route/open', null, '路由启用', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('125', 'Admin', 'admin_url', 'admin/route/listorders', null, '路由排序', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('126', 'Admin', 'admin_url', 'admin/mailer/default', null, '邮箱配置', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('127', 'Admin', 'admin_url', 'admin/mailer/index', null, 'SMTP配置', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('128', 'Admin', 'admin_url', 'admin/mailer/index_post', null, '提交配置', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('129', 'Admin', 'admin_url', 'admin/mailer/active', null, '邮件模板', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('130', 'Admin', 'admin_url', 'admin/mailer/active_post', null, '提交模板', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('131', 'Admin', 'admin_url', 'admin/setting/clearcache', null, '清除缓存', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('132', 'User', 'admin_url', 'user/indexadmin/default', null, '用户管理', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('133', 'User', 'admin_url', 'user/indexadmin/default1', null, '用户组', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('134', 'User', 'admin_url', 'user/indexadmin/index', null, '本站用户', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('135', 'User', 'admin_url', 'user/indexadmin/ban', null, '拉黑会员', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('136', 'User', 'admin_url', 'user/indexadmin/cancelban', null, '启用会员', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('137', 'User', 'admin_url', 'user/oauthadmin/index', null, '第三方用户', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('138', 'User', 'admin_url', 'user/oauthadmin/delete', null, '第三方用户解绑', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('139', 'User', 'admin_url', 'user/indexadmin/default3', null, '管理组', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('140', 'Admin', 'admin_url', 'admin/rbac/index', null, '角色管理', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('141', 'Admin', 'admin_url', 'admin/rbac/member', null, '成员管理', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('142', 'Admin', 'admin_url', 'admin/rbac/authorize', null, '权限设置', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('143', 'Admin', 'admin_url', 'admin/rbac/authorize_post', null, '提交设置', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('144', 'Admin', 'admin_url', 'admin/rbac/roleedit', null, '编辑角色', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('145', 'Admin', 'admin_url', 'admin/rbac/roleedit_post', null, '提交编辑', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('146', 'Admin', 'admin_url', 'admin/rbac/roledelete', null, '删除角色', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('147', 'Admin', 'admin_url', 'admin/rbac/roleadd', null, '添加角色', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('148', 'Admin', 'admin_url', 'admin/rbac/roleadd_post', null, '提交添加', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('149', 'Admin', 'admin_url', 'admin/user/index', null, '管理员', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('150', 'Admin', 'admin_url', 'admin/user/delete', null, '删除管理员', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('151', 'Admin', 'admin_url', 'admin/user/edit', null, '管理员编辑', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('152', 'Admin', 'admin_url', 'admin/user/edit_post', null, '编辑提交', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('153', 'Admin', 'admin_url', 'admin/user/add', null, '管理员添加', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('154', 'Admin', 'admin_url', 'admin/user/add_post', null, '添加提交', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('155', 'Admin', 'admin_url', 'admin/plugin/update', null, '插件更新', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('156', 'Admin', 'admin_url', 'admin/storage/index', null, '文件存储', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('157', 'Admin', 'admin_url', 'admin/storage/setting_post', null, '文件存储设置提交', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('158', 'Admin', 'admin_url', 'admin/slide/ban', null, '禁用幻灯片', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('159', 'Admin', 'admin_url', 'admin/slide/cancelban', null, '启用幻灯片', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('160', 'Admin', 'admin_url', 'admin/user/ban', null, '禁用管理员', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('161', 'Admin', 'admin_url', 'admin/user/cancelban', null, '启用管理员', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('162', 'Admin', 'admin_url', 'admin/price/default', null, '抽奖管理', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('163', 'Admin', 'admin_url', 'admin/price/prize', null, '奖品设置', '1', '');
INSERT INTO `xy_auth_rule` VALUES ('164', 'Admin', 'admin_url', 'admin/price/ewm', null, '生成二维码', '1', '');

-- ----------------------------
-- Table structure for xy_comments
-- ----------------------------
DROP TABLE IF EXISTS `xy_comments`;
CREATE TABLE `xy_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_table` varchar(100) NOT NULL COMMENT '评论内容所在表，不带表前缀',
  `post_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `url` varchar(255) DEFAULT NULL COMMENT '原文地址',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_uid` int(11) NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `full_name` varchar(50) DEFAULT NULL COMMENT '评论者昵称',
  `email` varchar(255) DEFAULT NULL COMMENT '评论者邮箱',
  `createtime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '评论时间',
  `content` text NOT NULL COMMENT '评论内容',
  `type` smallint(1) NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `parentid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `path` varchar(500) DEFAULT NULL,
  `status` smallint(1) NOT NULL DEFAULT '1' COMMENT '状态，1已审核，0未审核',
  PRIMARY KEY (`id`),
  KEY `comment_post_ID` (`post_id`),
  KEY `comment_approved_date_gmt` (`status`),
  KEY `comment_parent` (`parentid`),
  KEY `table_id_status` (`post_table`,`post_id`,`status`),
  KEY `createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of xy_comments
-- ----------------------------

-- ----------------------------
-- Table structure for xy_common_action_log
-- ----------------------------
DROP TABLE IF EXISTS `xy_common_action_log`;
CREATE TABLE `xy_common_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` bigint(20) DEFAULT '0' COMMENT '用户id',
  `object` varchar(100) DEFAULT NULL COMMENT '访问对象的id,格式：不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) DEFAULT NULL COMMENT '操作名称；格式规定为：应用名+控制器+操作名；也可自己定义格式只要不发生冲突且惟一；',
  `count` int(11) DEFAULT '0' COMMENT '访问次数',
  `last_time` int(11) DEFAULT '0' COMMENT '最后访问的时间戳',
  `ip` varchar(15) DEFAULT NULL COMMENT '访问者最后访问ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user`,`object`,`action`),
  KEY `user_object_action_ip` (`user`,`object`,`action`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='访问记录表';

-- ----------------------------
-- Records of xy_common_action_log
-- ----------------------------

-- ----------------------------
-- Table structure for xy_guestbook
-- ----------------------------
DROP TABLE IF EXISTS `xy_guestbook`;
CREATE TABLE `xy_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL COMMENT '留言者姓名',
  `email` varchar(100) NOT NULL COMMENT '留言者邮箱',
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `msg` text NOT NULL COMMENT '留言内容',
  `createtime` datetime NOT NULL COMMENT '留言时间',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '留言状态，1：正常，0：删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='留言表';

-- ----------------------------
-- Records of xy_guestbook
-- ----------------------------

-- ----------------------------
-- Table structure for xy_links
-- ----------------------------
DROP TABLE IF EXISTS `xy_links`;
CREATE TABLE `xy_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL COMMENT '友情链接地址',
  `link_name` varchar(255) NOT NULL COMMENT '友情链接名称',
  `link_image` varchar(255) DEFAULT NULL COMMENT '友情链接图标',
  `link_target` varchar(25) NOT NULL DEFAULT '_blank' COMMENT '友情链接打开方式',
  `link_description` text NOT NULL COMMENT '友情链接描述',
  `link_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `link_rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `link_rel` varchar(255) DEFAULT NULL COMMENT '链接与网站的关系',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- ----------------------------
-- Records of xy_links
-- ----------------------------
INSERT INTO `xy_links` VALUES ('1', 'http://www.thinkcmf.com', 'ThinkCMF', '', '_blank', '', '1', '0', '', '0');

-- ----------------------------
-- Table structure for xy_menu
-- ----------------------------
DROP TABLE IF EXISTS `xy_menu`;
CREATE TABLE `xy_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `app` char(20) NOT NULL COMMENT '应用名称app',
  `model` char(20) NOT NULL COMMENT '控制器',
  `action` char(20) NOT NULL COMMENT '操作名称',
  `data` char(50) NOT NULL COMMENT '额外参数',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单类型  1：权限认证+菜单；0：只作为菜单',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1显示，0不显示',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序ID',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parentid` (`parentid`),
  KEY `model` (`model`)
) ENGINE=MyISAM AUTO_INCREMENT=165 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

-- ----------------------------
-- Records of xy_menu
-- ----------------------------
INSERT INTO `xy_menu` VALUES ('1', '0', 'Admin', 'Content', 'default', '', '0', '1', '内容管理', 'th', '', '30');
INSERT INTO `xy_menu` VALUES ('2', '1', 'Api', 'Guestbookadmin', 'index', '', '1', '1', '所有留言', '', '', '0');
INSERT INTO `xy_menu` VALUES ('3', '2', 'Api', 'Guestbookadmin', 'delete', '', '1', '0', '删除网站留言', '', '', '0');
INSERT INTO `xy_menu` VALUES ('4', '1', 'Comment', 'Commentadmin', 'index', '', '1', '1', '评论管理', '', '', '0');
INSERT INTO `xy_menu` VALUES ('5', '4', 'Comment', 'Commentadmin', 'delete', '', '1', '0', '删除评论', '', '', '0');
INSERT INTO `xy_menu` VALUES ('6', '4', 'Comment', 'Commentadmin', 'check', '', '1', '0', '评论审核', '', '', '0');
INSERT INTO `xy_menu` VALUES ('7', '1', 'Portal', 'AdminPost', 'index', '', '1', '1', '文章管理', '', '', '1');
INSERT INTO `xy_menu` VALUES ('8', '7', 'Portal', 'AdminPost', 'listorders', '', '1', '0', '文章排序', '', '', '0');
INSERT INTO `xy_menu` VALUES ('9', '7', 'Portal', 'AdminPost', 'top', '', '1', '0', '文章置顶', '', '', '0');
INSERT INTO `xy_menu` VALUES ('10', '7', 'Portal', 'AdminPost', 'recommend', '', '1', '0', '文章推荐', '', '', '0');
INSERT INTO `xy_menu` VALUES ('11', '7', 'Portal', 'AdminPost', 'move', '', '1', '0', '批量移动', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('12', '7', 'Portal', 'AdminPost', 'check', '', '1', '0', '文章审核', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('13', '7', 'Portal', 'AdminPost', 'delete', '', '1', '0', '删除文章', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('14', '7', 'Portal', 'AdminPost', 'edit', '', '1', '0', '编辑文章', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('15', '14', 'Portal', 'AdminPost', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `xy_menu` VALUES ('16', '7', 'Portal', 'AdminPost', 'add', '', '1', '0', '添加文章', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('17', '16', 'Portal', 'AdminPost', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `xy_menu` VALUES ('18', '1', 'Portal', 'AdminTerm', 'index', '', '0', '1', '分类管理', '', '', '2');
INSERT INTO `xy_menu` VALUES ('19', '18', 'Portal', 'AdminTerm', 'listorders', '', '1', '0', '文章分类排序', '', '', '0');
INSERT INTO `xy_menu` VALUES ('20', '18', 'Portal', 'AdminTerm', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('21', '18', 'Portal', 'AdminTerm', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('22', '21', 'Portal', 'AdminTerm', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `xy_menu` VALUES ('23', '18', 'Portal', 'AdminTerm', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('24', '23', 'Portal', 'AdminTerm', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `xy_menu` VALUES ('25', '1', 'Portal', 'AdminPage', 'index', '', '1', '1', '页面管理', '', '', '3');
INSERT INTO `xy_menu` VALUES ('26', '25', 'Portal', 'AdminPage', 'listorders', '', '1', '0', '页面排序', '', '', '0');
INSERT INTO `xy_menu` VALUES ('27', '25', 'Portal', 'AdminPage', 'delete', '', '1', '0', '删除页面', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('28', '25', 'Portal', 'AdminPage', 'edit', '', '1', '0', '编辑页面', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('29', '28', 'Portal', 'AdminPage', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `xy_menu` VALUES ('30', '25', 'Portal', 'AdminPage', 'add', '', '1', '0', '添加页面', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('31', '30', 'Portal', 'AdminPage', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `xy_menu` VALUES ('32', '1', 'Admin', 'Recycle', 'default', '', '1', '1', '回收站', '', '', '4');
INSERT INTO `xy_menu` VALUES ('33', '32', 'Portal', 'AdminPost', 'recyclebin', '', '1', '1', '文章回收', '', '', '0');
INSERT INTO `xy_menu` VALUES ('34', '33', 'Portal', 'AdminPost', 'restore', '', '1', '0', '文章还原', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('35', '33', 'Portal', 'AdminPost', 'clean', '', '1', '0', '彻底删除', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('36', '32', 'Portal', 'AdminPage', 'recyclebin', '', '1', '1', '页面回收', '', '', '1');
INSERT INTO `xy_menu` VALUES ('37', '36', 'Portal', 'AdminPage', 'clean', '', '1', '0', '彻底删除', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('38', '36', 'Portal', 'AdminPage', 'restore', '', '1', '0', '页面还原', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('39', '0', 'Admin', 'Extension', 'default', '', '0', '1', '扩展工具', 'cloud', '', '40');
INSERT INTO `xy_menu` VALUES ('40', '39', 'Admin', 'Backup', 'default', '', '1', '1', '备份管理', '', '', '0');
INSERT INTO `xy_menu` VALUES ('41', '40', 'Admin', 'Backup', 'restore', '', '1', '1', '数据还原', '', '', '0');
INSERT INTO `xy_menu` VALUES ('42', '40', 'Admin', 'Backup', 'index', '', '1', '1', '数据备份', '', '', '0');
INSERT INTO `xy_menu` VALUES ('43', '42', 'Admin', 'Backup', 'index_post', '', '1', '0', '提交数据备份', '', '', '0');
INSERT INTO `xy_menu` VALUES ('44', '40', 'Admin', 'Backup', 'download', '', '1', '0', '下载备份', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('45', '40', 'Admin', 'Backup', 'del_backup', '', '1', '0', '删除备份', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('46', '40', 'Admin', 'Backup', 'import', '', '1', '0', '数据备份导入', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('47', '39', 'Admin', 'Plugin', 'index', '', '1', '1', '插件管理', '', '', '0');
INSERT INTO `xy_menu` VALUES ('48', '47', 'Admin', 'Plugin', 'toggle', '', '1', '0', '插件启用切换', '', '', '0');
INSERT INTO `xy_menu` VALUES ('49', '47', 'Admin', 'Plugin', 'setting', '', '1', '0', '插件设置', '', '', '0');
INSERT INTO `xy_menu` VALUES ('50', '49', 'Admin', 'Plugin', 'setting_post', '', '1', '0', '插件设置提交', '', '', '0');
INSERT INTO `xy_menu` VALUES ('51', '47', 'Admin', 'Plugin', 'install', '', '1', '0', '插件安装', '', '', '0');
INSERT INTO `xy_menu` VALUES ('52', '47', 'Admin', 'Plugin', 'uninstall', '', '1', '0', '插件卸载', '', '', '0');
INSERT INTO `xy_menu` VALUES ('53', '39', 'Admin', 'Slide', 'default', '', '1', '1', '幻灯片', '', '', '1');
INSERT INTO `xy_menu` VALUES ('54', '53', 'Admin', 'Slide', 'index', '', '1', '1', '幻灯片管理', '', '', '0');
INSERT INTO `xy_menu` VALUES ('55', '54', 'Admin', 'Slide', 'listorders', '', '1', '0', '幻灯片排序', '', '', '0');
INSERT INTO `xy_menu` VALUES ('56', '54', 'Admin', 'Slide', 'toggle', '', '1', '0', '幻灯片显示切换', '', '', '0');
INSERT INTO `xy_menu` VALUES ('57', '54', 'Admin', 'Slide', 'delete', '', '1', '0', '删除幻灯片', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('58', '54', 'Admin', 'Slide', 'edit', '', '1', '0', '编辑幻灯片', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('59', '58', 'Admin', 'Slide', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `xy_menu` VALUES ('60', '54', 'Admin', 'Slide', 'add', '', '1', '0', '添加幻灯片', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('61', '60', 'Admin', 'Slide', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `xy_menu` VALUES ('62', '53', 'Admin', 'Slidecat', 'index', '', '1', '1', '幻灯片分类', '', '', '0');
INSERT INTO `xy_menu` VALUES ('63', '62', 'Admin', 'Slidecat', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('64', '62', 'Admin', 'Slidecat', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('65', '64', 'Admin', 'Slidecat', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `xy_menu` VALUES ('66', '62', 'Admin', 'Slidecat', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('67', '66', 'Admin', 'Slidecat', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `xy_menu` VALUES ('68', '39', 'Admin', 'Ad', 'index', '', '1', '1', '网站广告', '', '', '2');
INSERT INTO `xy_menu` VALUES ('69', '68', 'Admin', 'Ad', 'toggle', '', '1', '0', '广告显示切换', '', '', '0');
INSERT INTO `xy_menu` VALUES ('70', '68', 'Admin', 'Ad', 'delete', '', '1', '0', '删除广告', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('71', '68', 'Admin', 'Ad', 'edit', '', '1', '0', '编辑广告', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('72', '71', 'Admin', 'Ad', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `xy_menu` VALUES ('73', '68', 'Admin', 'Ad', 'add', '', '1', '0', '添加广告', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('74', '73', 'Admin', 'Ad', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `xy_menu` VALUES ('75', '39', 'Admin', 'Link', 'index', '', '0', '1', '友情链接', '', '', '3');
INSERT INTO `xy_menu` VALUES ('76', '75', 'Admin', 'Link', 'listorders', '', '1', '0', '友情链接排序', '', '', '0');
INSERT INTO `xy_menu` VALUES ('77', '75', 'Admin', 'Link', 'toggle', '', '1', '0', '友链显示切换', '', '', '0');
INSERT INTO `xy_menu` VALUES ('78', '75', 'Admin', 'Link', 'delete', '', '1', '0', '删除友情链接', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('79', '75', 'Admin', 'Link', 'edit', '', '1', '0', '编辑友情链接', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('80', '79', 'Admin', 'Link', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `xy_menu` VALUES ('81', '75', 'Admin', 'Link', 'add', '', '1', '0', '添加友情链接', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('82', '81', 'Admin', 'Link', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `xy_menu` VALUES ('83', '39', 'Api', 'Oauthadmin', 'setting', '', '1', '1', '第三方登陆', 'leaf', '', '4');
INSERT INTO `xy_menu` VALUES ('84', '83', 'Api', 'Oauthadmin', 'setting_post', '', '1', '0', '提交设置', '', '', '0');
INSERT INTO `xy_menu` VALUES ('85', '0', 'Admin', 'Menu', 'default', '', '1', '1', '菜单管理', 'list', '', '20');
INSERT INTO `xy_menu` VALUES ('86', '85', 'Admin', 'Navcat', 'default1', '', '1', '1', '前台菜单', '', '', '0');
INSERT INTO `xy_menu` VALUES ('87', '86', 'Admin', 'Nav', 'index', '', '1', '1', '菜单管理', '', '', '0');
INSERT INTO `xy_menu` VALUES ('88', '87', 'Admin', 'Nav', 'listorders', '', '1', '0', '前台导航排序', '', '', '0');
INSERT INTO `xy_menu` VALUES ('89', '87', 'Admin', 'Nav', 'delete', '', '1', '0', '删除菜单', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('90', '87', 'Admin', 'Nav', 'edit', '', '1', '0', '编辑菜单', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('91', '90', 'Admin', 'Nav', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `xy_menu` VALUES ('92', '87', 'Admin', 'Nav', 'add', '', '1', '0', '添加菜单', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('93', '92', 'Admin', 'Nav', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `xy_menu` VALUES ('94', '86', 'Admin', 'Navcat', 'index', '', '1', '1', '菜单分类', '', '', '0');
INSERT INTO `xy_menu` VALUES ('95', '94', 'Admin', 'Navcat', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('96', '94', 'Admin', 'Navcat', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('97', '96', 'Admin', 'Navcat', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `xy_menu` VALUES ('98', '94', 'Admin', 'Navcat', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('99', '98', 'Admin', 'Navcat', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `xy_menu` VALUES ('100', '85', 'Admin', 'Menu', 'index', '', '1', '1', '后台菜单', '', '', '0');
INSERT INTO `xy_menu` VALUES ('101', '100', 'Admin', 'Menu', 'add', '', '1', '0', '添加菜单', '', '', '0');
INSERT INTO `xy_menu` VALUES ('102', '101', 'Admin', 'Menu', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `xy_menu` VALUES ('103', '100', 'Admin', 'Menu', 'listorders', '', '1', '0', '后台菜单排序', '', '', '0');
INSERT INTO `xy_menu` VALUES ('104', '100', 'Admin', 'Menu', 'export_menu', '', '1', '0', '菜单备份', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('105', '100', 'Admin', 'Menu', 'edit', '', '1', '0', '编辑菜单', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('106', '105', 'Admin', 'Menu', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `xy_menu` VALUES ('107', '100', 'Admin', 'Menu', 'delete', '', '1', '0', '删除菜单', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('108', '100', 'Admin', 'Menu', 'lists', '', '1', '0', '所有菜单', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('109', '0', 'Admin', 'Setting', 'default', '', '0', '1', '设置', 'cogs', '', '0');
INSERT INTO `xy_menu` VALUES ('110', '109', 'Admin', 'Setting', 'userdefault', '', '0', '1', '个人信息', '', '', '0');
INSERT INTO `xy_menu` VALUES ('111', '110', 'Admin', 'User', 'userinfo', '', '1', '1', '修改信息', '', '', '0');
INSERT INTO `xy_menu` VALUES ('112', '111', 'Admin', 'User', 'userinfo_post', '', '1', '0', '修改信息提交', '', '', '0');
INSERT INTO `xy_menu` VALUES ('113', '110', 'Admin', 'Setting', 'password', '', '1', '1', '修改密码', '', '', '0');
INSERT INTO `xy_menu` VALUES ('114', '113', 'Admin', 'Setting', 'password_post', '', '1', '0', '提交修改', '', '', '0');
INSERT INTO `xy_menu` VALUES ('115', '109', 'Admin', 'Setting', 'site', '', '1', '1', '网站信息', '', '', '0');
INSERT INTO `xy_menu` VALUES ('116', '115', 'Admin', 'Setting', 'site_post', '', '1', '0', '提交修改', '', '', '0');
INSERT INTO `xy_menu` VALUES ('117', '115', 'Admin', 'Route', 'index', '', '1', '0', '路由列表', '', '', '0');
INSERT INTO `xy_menu` VALUES ('118', '115', 'Admin', 'Route', 'add', '', '1', '0', '路由添加', '', '', '0');
INSERT INTO `xy_menu` VALUES ('119', '118', 'Admin', 'Route', 'add_post', '', '1', '0', '路由添加提交', '', '', '0');
INSERT INTO `xy_menu` VALUES ('120', '115', 'Admin', 'Route', 'edit', '', '1', '0', '路由编辑', '', '', '0');
INSERT INTO `xy_menu` VALUES ('121', '120', 'Admin', 'Route', 'edit_post', '', '1', '0', '路由编辑提交', '', '', '0');
INSERT INTO `xy_menu` VALUES ('122', '115', 'Admin', 'Route', 'delete', '', '1', '0', '路由删除', '', '', '0');
INSERT INTO `xy_menu` VALUES ('123', '115', 'Admin', 'Route', 'ban', '', '1', '0', '路由禁止', '', '', '0');
INSERT INTO `xy_menu` VALUES ('124', '115', 'Admin', 'Route', 'open', '', '1', '0', '路由启用', '', '', '0');
INSERT INTO `xy_menu` VALUES ('125', '115', 'Admin', 'Route', 'listorders', '', '1', '0', '路由排序', '', '', '0');
INSERT INTO `xy_menu` VALUES ('126', '109', 'Admin', 'Mailer', 'default', '', '1', '1', '邮箱配置', '', '', '0');
INSERT INTO `xy_menu` VALUES ('127', '126', 'Admin', 'Mailer', 'index', '', '1', '1', 'SMTP配置', '', '', '0');
INSERT INTO `xy_menu` VALUES ('128', '127', 'Admin', 'Mailer', 'index_post', '', '1', '0', '提交配置', '', '', '0');
INSERT INTO `xy_menu` VALUES ('129', '126', 'Admin', 'Mailer', 'active', '', '1', '1', '邮件模板', '', '', '0');
INSERT INTO `xy_menu` VALUES ('130', '129', 'Admin', 'Mailer', 'active_post', '', '1', '0', '提交模板', '', '', '0');
INSERT INTO `xy_menu` VALUES ('131', '109', 'Admin', 'Setting', 'clearcache', '', '1', '1', '清除缓存', '', '', '1');
INSERT INTO `xy_menu` VALUES ('132', '0', 'User', 'Indexadmin', 'default', '', '1', '1', '用户管理', 'group', '', '10');
INSERT INTO `xy_menu` VALUES ('133', '132', 'User', 'Indexadmin', 'default1', '', '1', '1', '用户组', '', '', '0');
INSERT INTO `xy_menu` VALUES ('134', '133', 'User', 'Indexadmin', 'index', '', '1', '1', '本站用户', 'leaf', '', '0');
INSERT INTO `xy_menu` VALUES ('135', '134', 'User', 'Indexadmin', 'ban', '', '1', '0', '拉黑会员', '', '', '0');
INSERT INTO `xy_menu` VALUES ('136', '134', 'User', 'Indexadmin', 'cancelban', '', '1', '0', '启用会员', '', '', '0');
INSERT INTO `xy_menu` VALUES ('137', '133', 'User', 'Oauthadmin', 'index', '', '1', '1', '第三方用户', 'leaf', '', '0');
INSERT INTO `xy_menu` VALUES ('138', '137', 'User', 'Oauthadmin', 'delete', '', '1', '0', '第三方用户解绑', '', '', '0');
INSERT INTO `xy_menu` VALUES ('139', '132', 'User', 'Indexadmin', 'default3', '', '1', '1', '管理组', '', '', '0');
INSERT INTO `xy_menu` VALUES ('140', '139', 'Admin', 'Rbac', 'index', '', '1', '1', '角色管理', '', '', '0');
INSERT INTO `xy_menu` VALUES ('141', '140', 'Admin', 'Rbac', 'member', '', '1', '0', '成员管理', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('142', '140', 'Admin', 'Rbac', 'authorize', '', '1', '0', '权限设置', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('143', '142', 'Admin', 'Rbac', 'authorize_post', '', '1', '0', '提交设置', '', '', '0');
INSERT INTO `xy_menu` VALUES ('144', '140', 'Admin', 'Rbac', 'roleedit', '', '1', '0', '编辑角色', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('145', '144', 'Admin', 'Rbac', 'roleedit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `xy_menu` VALUES ('146', '140', 'Admin', 'Rbac', 'roledelete', '', '1', '1', '删除角色', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('147', '140', 'Admin', 'Rbac', 'roleadd', '', '1', '1', '添加角色', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('148', '147', 'Admin', 'Rbac', 'roleadd_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `xy_menu` VALUES ('149', '139', 'Admin', 'User', 'index', '', '1', '1', '管理员', '', '', '0');
INSERT INTO `xy_menu` VALUES ('150', '149', 'Admin', 'User', 'delete', '', '1', '0', '删除管理员', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('151', '149', 'Admin', 'User', 'edit', '', '1', '0', '管理员编辑', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('152', '151', 'Admin', 'User', 'edit_post', '', '1', '0', '编辑提交', '', '', '0');
INSERT INTO `xy_menu` VALUES ('153', '149', 'Admin', 'User', 'add', '', '1', '0', '管理员添加', '', '', '1000');
INSERT INTO `xy_menu` VALUES ('154', '153', 'Admin', 'User', 'add_post', '', '1', '0', '添加提交', '', '', '0');
INSERT INTO `xy_menu` VALUES ('155', '47', 'Admin', 'Plugin', 'update', '', '1', '0', '插件更新', '', '', '0');
INSERT INTO `xy_menu` VALUES ('156', '39', 'Admin', 'Storage', 'index', '', '1', '1', '文件存储', '', '', '0');
INSERT INTO `xy_menu` VALUES ('157', '156', 'Admin', 'Storage', 'setting_post', '', '1', '0', '文件存储设置提交', '', '', '0');
INSERT INTO `xy_menu` VALUES ('158', '54', 'Admin', 'Slide', 'ban', '', '1', '0', '禁用幻灯片', '', '', '0');
INSERT INTO `xy_menu` VALUES ('159', '54', 'Admin', 'Slide', 'cancelban', '', '1', '0', '启用幻灯片', '', '', '0');
INSERT INTO `xy_menu` VALUES ('160', '149', 'Admin', 'User', 'ban', '', '1', '0', '禁用管理员', '', '', '0');
INSERT INTO `xy_menu` VALUES ('161', '149', 'Admin', 'User', 'cancelban', '', '1', '0', '启用管理员', '', '', '0');
INSERT INTO `xy_menu` VALUES ('162', '0', 'Admin', 'Price', 'default', '', '1', '1', '抽奖管理', '', '', '0');
INSERT INTO `xy_menu` VALUES ('163', '162', 'Admin', 'Price', 'prize', '', '1', '1', '奖品设置', '', '', '0');
INSERT INTO `xy_menu` VALUES ('164', '162', 'Admin', 'Price', 'ewm', '', '1', '1', '生成二维码', '', '', '0');

-- ----------------------------
-- Table structure for xy_nav
-- ----------------------------
DROP TABLE IF EXISTS `xy_nav`;
CREATE TABLE `xy_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '导航分类 id',
  `parentid` int(11) NOT NULL COMMENT '导航父 id',
  `label` varchar(255) NOT NULL COMMENT '导航标题',
  `target` varchar(50) DEFAULT NULL COMMENT '打开方式',
  `href` varchar(255) NOT NULL COMMENT '导航链接',
  `icon` varchar(255) NOT NULL COMMENT '导航图标',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(6) DEFAULT '0' COMMENT '排序',
  `path` varchar(255) NOT NULL DEFAULT '0' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='前台导航表';

-- ----------------------------
-- Records of xy_nav
-- ----------------------------
INSERT INTO `xy_nav` VALUES ('1', '1', '0', '首页', '', 'home', '', '1', '0', '0-1');
INSERT INTO `xy_nav` VALUES ('2', '1', '0', '列表演示', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"1\";}}', '', '1', '0', '0-2');
INSERT INTO `xy_nav` VALUES ('3', '1', '0', '瀑布流', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"2\";}}', '', '1', '0', '0-3');

-- ----------------------------
-- Table structure for xy_nav_cat
-- ----------------------------
DROP TABLE IF EXISTS `xy_nav_cat`;
CREATE TABLE `xy_nav_cat` (
  `navcid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '导航分类名',
  `active` int(1) NOT NULL DEFAULT '1' COMMENT '是否为主菜单，1是，0不是',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`navcid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='前台导航分类表';

-- ----------------------------
-- Records of xy_nav_cat
-- ----------------------------
INSERT INTO `xy_nav_cat` VALUES ('1', '主导航', '1', '主导航');

-- ----------------------------
-- Table structure for xy_oauth_user
-- ----------------------------
DROP TABLE IF EXISTS `xy_oauth_user`;
CREATE TABLE `xy_oauth_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `from` varchar(20) NOT NULL COMMENT '用户来源key',
  `name` varchar(30) NOT NULL COMMENT '第三方昵称',
  `head_img` varchar(200) NOT NULL COMMENT '头像',
  `uid` int(20) NOT NULL COMMENT '关联的本站用户id',
  `create_time` datetime NOT NULL COMMENT '绑定时间',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `login_times` int(6) NOT NULL COMMENT '登录次数',
  `status` tinyint(2) NOT NULL,
  `access_token` varchar(512) NOT NULL,
  `expires_date` int(11) NOT NULL COMMENT 'access_token过期时间',
  `openid` varchar(40) NOT NULL COMMENT '第三方用户id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='第三方用户表';

-- ----------------------------
-- Records of xy_oauth_user
-- ----------------------------

-- ----------------------------
-- Table structure for xy_options
-- ----------------------------
DROP TABLE IF EXISTS `xy_options`;
CREATE TABLE `xy_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL COMMENT '配置名',
  `option_value` longtext NOT NULL COMMENT '配置值',
  `autoload` int(2) NOT NULL DEFAULT '1' COMMENT '是否自动加载',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='全站配置表';

-- ----------------------------
-- Records of xy_options
-- ----------------------------
INSERT INTO `xy_options` VALUES ('1', 'member_email_active', '{\"title\":\"ThinkCMF\\u90ae\\u4ef6\\u6fc0\\u6d3b\\u901a\\u77e5.\",\"template\":\"<p>\\u672c\\u90ae\\u4ef6\\u6765\\u81ea<a href=\\\"http:\\/\\/www.thinkcmf.com\\\">ThinkCMF<\\/a><br\\/><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/>&nbsp; &nbsp;<strong>\\u5e10\\u53f7\\u6fc0\\u6d3b\\u8bf4\\u660e<\\/strong><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/><br\\/>&nbsp; &nbsp; \\u5c0a\\u656c\\u7684<span style=\\\"FONT-SIZE: 16px; FONT-FAMILY: Arial; COLOR: rgb(51,51,51); LINE-HEIGHT: 18px; BACKGROUND-COLOR: rgb(255,255,255)\\\">#username#\\uff0c\\u60a8\\u597d\\u3002<\\/span>\\u5982\\u679c\\u60a8\\u662fThinkCMF\\u7684\\u65b0\\u7528\\u6237\\uff0c\\u6216\\u5728\\u4fee\\u6539\\u60a8\\u7684\\u6ce8\\u518cEmail\\u65f6\\u4f7f\\u7528\\u4e86\\u672c\\u5730\\u5740\\uff0c\\u6211\\u4eec\\u9700\\u8981\\u5bf9\\u60a8\\u7684\\u5730\\u5740\\u6709\\u6548\\u6027\\u8fdb\\u884c\\u9a8c\\u8bc1\\u4ee5\\u907f\\u514d\\u5783\\u573e\\u90ae\\u4ef6\\u6216\\u5730\\u5740\\u88ab\\u6ee5\\u7528\\u3002<br\\/>&nbsp; &nbsp; \\u60a8\\u53ea\\u9700\\u70b9\\u51fb\\u4e0b\\u9762\\u7684\\u94fe\\u63a5\\u5373\\u53ef\\u6fc0\\u6d3b\\u60a8\\u7684\\u5e10\\u53f7\\uff1a<br\\/>&nbsp; &nbsp; <a title=\\\"\\\" href=\\\"http:\\/\\/#link#\\\" target=\\\"_self\\\">http:\\/\\/#link#<\\/a><br\\/>&nbsp; &nbsp; (\\u5982\\u679c\\u4e0a\\u9762\\u4e0d\\u662f\\u94fe\\u63a5\\u5f62\\u5f0f\\uff0c\\u8bf7\\u5c06\\u8be5\\u5730\\u5740\\u624b\\u5de5\\u7c98\\u8d34\\u5230\\u6d4f\\u89c8\\u5668\\u5730\\u5740\\u680f\\u518d\\u8bbf\\u95ee)<br\\/>&nbsp; &nbsp; \\u611f\\u8c22\\u60a8\\u7684\\u8bbf\\u95ee\\uff0c\\u795d\\u60a8\\u4f7f\\u7528\\u6109\\u5feb\\uff01<br\\/><br\\/>&nbsp; &nbsp; \\u6b64\\u81f4<br\\/>&nbsp; &nbsp; ThinkCMF \\u7ba1\\u7406\\u56e2\\u961f.<\\/p>\"}', '1');
INSERT INTO `xy_options` VALUES ('2', 'site_options', '            {\n            		\"site_name\":\"新雨瑞\",\n            		\"site_host\":\"http://xinyu.com/\",\n            		\"site_root\":\"\",\n            		\"site_icp\":\"\",\n            		\"site_admin_email\":\"phprince@163.com\",\n            		\"site_tongji\":\"\",\n            		\"site_copyright\":\"\",\n            		\"site_seo_title\":\"新雨瑞\",\n            		\"site_seo_keywords\":\"新雨瑞\",\n            		\"site_seo_description\":\"新雨瑞\"\n        }', '1');

-- ----------------------------
-- Table structure for xy_plugins
-- ----------------------------
DROP TABLE IF EXISTS `xy_plugins`;
CREATE TABLE `xy_plugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(50) NOT NULL COMMENT '插件名，英文',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '插件名称',
  `description` text COMMENT '插件描述',
  `type` tinyint(2) DEFAULT '0' COMMENT '插件类型, 1:网站；8;微信',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态；1开启；',
  `config` text COMMENT '插件配置',
  `hooks` varchar(255) DEFAULT NULL COMMENT '实现的钩子;以“，”分隔',
  `has_admin` tinyint(2) DEFAULT '0' COMMENT '插件是否有后台管理界面',
  `author` varchar(50) DEFAULT '' COMMENT '插件作者',
  `version` varchar(20) DEFAULT '' COMMENT '插件版本号',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `listorder` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of xy_plugins
-- ----------------------------

-- ----------------------------
-- Table structure for xy_posts
-- ----------------------------
DROP TABLE IF EXISTS `xy_posts`;
CREATE TABLE `xy_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned DEFAULT '0' COMMENT '发表者id',
  `post_keywords` varchar(150) NOT NULL COMMENT 'seo keywords',
  `post_source` varchar(150) DEFAULT NULL COMMENT '转载文章的来源',
  `post_date` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post创建日期，永久不变，一般不显示给用户',
  `post_content` longtext COMMENT 'post内容',
  `post_title` text COMMENT 'post标题',
  `post_excerpt` text COMMENT 'post摘要',
  `post_status` int(2) DEFAULT '1' COMMENT 'post状态，1已审核，0未审核',
  `comment_status` int(2) DEFAULT '1' COMMENT '评论状态，1允许，0不允许',
  `post_modified` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post更新时间，可在前台修改，显示给用户',
  `post_content_filtered` longtext,
  `post_parent` bigint(20) unsigned DEFAULT '0' COMMENT 'post的父级post id,表示post层级关系',
  `post_type` int(2) DEFAULT NULL,
  `post_mime_type` varchar(100) DEFAULT '',
  `comment_count` bigint(20) DEFAULT '0',
  `smeta` text COMMENT 'post的扩展字段，保存相关扩展属性，如缩略图；格式为json',
  `post_hits` int(11) DEFAULT '0' COMMENT 'post点击数，查看数',
  `post_like` int(11) DEFAULT '0' COMMENT 'post赞数',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶 1置顶； 0不置顶',
  `recommended` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐 1推荐 0不推荐',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `post_date` (`post_date`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Portal文章表';

-- ----------------------------
-- Records of xy_posts
-- ----------------------------
INSERT INTO `xy_posts` VALUES ('2', '1', '580毫升雨瑞维体能量玛咖维生素饮料', '580毫升雨瑞维体能量玛咖维生素饮料', '2016-03-01 23:17:32', '<p><img src=\"http://xinyu.com/data/upload/ueditor/20160303/56d7bbcf628d2.jpg\" title=\"20150311110843_64360.jpg\" alt=\"20150311110843_64360.jpg\"/></p><p><img src=\"http://xinyu.com/data/upload/ueditor/20160303/56d7bbd5e02ad.jpg\" title=\"20150311110903_96684.jpg\" alt=\"20150311110903_96684.jpg\"/></p>', '580毫升雨瑞维体能量玛咖维生素饮料', '580毫升雨瑞维体能量玛咖维生素饮料', '1', '1', '2016-03-01 23:17:06', null, '0', null, '', '0', '{\"thumb\":\"20160301\\/56d5b2802ea9b.png\"}', '0', '0', '0', '0');
INSERT INTO `xy_posts` VALUES ('3', '1', '关于我们', '关于我们', '2016-03-03 15:03:17', '<p><span style=\"color: rgb(102, 102, 102); font-family: 微软雅黑, 黑体; font-size: 14px; line-height: 22px; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp; &nbsp; 河南新雨瑞饮品有限公司济源市北海创业园区，这里北依太行山，与山西省晋城市毗邻；南临黄河，与古都洛阳市隔河相望；西距王屋，与山西省运城市接壤；东临华北平原，与焦作市相连，自古有“豫西北门户”之称，交通便利，环境宜人。&nbsp;</span></p><p><span style=\"color: rgb(102, 102, 102); font-family: 微软雅黑, 黑体; font-size: 14px; line-height: 22px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(102, 102, 102); font-family: 微软雅黑, 黑体; font-size: 14px; line-height: 22px; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp; &nbsp; 公司是生产碳酸饮料、乳酸菌饮料、果汁饮料、功能饮料的现代化公司。目前拥有总资产6000万元，占地面积3万多平方米，建筑面积10000多平方米，员工300余人，高级科技人员20人，拥有价值3000万元的大型各类碳酸饮料、奶饮料、功能饮料、果汁饮料生产线6条和全自动包装设备。</span></span></p><p><span style=\"color: rgb(102, 102, 102); font-family: 微软雅黑, 黑体; font-size: 14px; line-height: 22px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(102, 102, 102); font-family: 微软雅黑, 黑体; font-size: 14px; line-height: 22px; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp; &nbsp; 公司围绕“高起点、高层次、突破性、竞争力”为基点，导入ISO9001:2000质量管理体系要求，坚持以八项质量管理原则为基础的科学管理方法，坚持以人为本，诚信经营。 依托得天独厚的自然资源，应用先进的科学技术和工艺方法， 精益求精，从根本上保证产品的质量安全；通过质量管理体系的有效运行并持续改进，为消费者提供高品质产品和优质服务，竭尽全力满足合同要求和顾客期望，努力打造“新雨瑞”饮料品牌。&nbsp;</span></span></p><p><span style=\"color: rgb(102, 102, 102); font-family: 微软雅黑, 黑体; font-size: 14px; line-height: 22px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(102, 102, 102); font-family: 微软雅黑, 黑体; font-size: 14px; line-height: 22px; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp; &nbsp; 顾客的满意就是我们的愿望，为顾客创造价值是我们不懈的追求。我们的产品承诺是：“生产真正有使用价值的产品 &nbsp;做大众化品牌 &nbsp;代表健康、和谐的形象.” 我们致力于塑造健康饮食新观念，竭诚为新世纪的美好生活锦上添花，营造时尚。 我们力求领先，只有领先让我们超越；我们强调品质， 只有品质让我们杰出；我们珍惜信誉，只有信誉让我们长久。</span></span></p><p><span style=\"color: rgb(102, 102, 102); font-family: 微软雅黑, 黑体; font-size: 14px; line-height: 22px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(102, 102, 102); font-family: 微软雅黑, 黑体; font-size: 14px; line-height: 22px; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp; &nbsp; 以人为本，不断开拓进取，严格的工作管理，优惠的价格及完善的服务是本公司一贯的经营宗旨。竭诚欢迎新老客户，愿与您忠诚合作，共创辉煌！</span></span></p>', '关于我们', '关于我们', '1', '1', '2016-03-03 15:01:41', null, '0', null, '', '0', '{\"thumb\":\"20160303\\/56d7e1978642d.png\"}', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for xy_prize
-- ----------------------------
DROP TABLE IF EXISTS `xy_prize`;
CREATE TABLE `xy_prize` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `account` decimal(10,2) NOT NULL DEFAULT '0.00',
  `chance` int(11) NOT NULL DEFAULT '0' COMMENT '概率',
  `unit` varchar(20) NOT NULL DEFAULT '' COMMENT '单位',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xy_prize
-- ----------------------------
INSERT INTO `xy_prize` VALUES ('1', '红包', '0.30', '200', '元');
INSERT INTO `xy_prize` VALUES ('2', '红包', '0.10', '600', '元');
INSERT INTO `xy_prize` VALUES ('3', '红包', '0.00', '1000', '元');
INSERT INTO `xy_prize` VALUES ('4', '红包', '0.50', '200', '元');
INSERT INTO `xy_prize` VALUES ('5', '红包', '1.00', '200', '元');
INSERT INTO `xy_prize` VALUES ('6', '红包', '100.00', '4', '元');
INSERT INTO `xy_prize` VALUES ('7', '红包', '10.00', '5', '元');
INSERT INTO `xy_prize` VALUES ('8', '红包', '5.00', '10', '元');

-- ----------------------------
-- Table structure for xy_role
-- ----------------------------
DROP TABLE IF EXISTS `xy_role`;
CREATE TABLE `xy_role` (
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of xy_role
-- ----------------------------
INSERT INTO `xy_role` VALUES ('1', '超级管理员', '0', '1', '拥有网站最高管理员权限！', '1329633709', '1329633709', '0');

-- ----------------------------
-- Table structure for xy_role_user
-- ----------------------------
DROP TABLE IF EXISTS `xy_role_user`;
CREATE TABLE `xy_role_user` (
  `role_id` int(11) unsigned DEFAULT '0' COMMENT '角色 id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

-- ----------------------------
-- Records of xy_role_user
-- ----------------------------

-- ----------------------------
-- Table structure for xy_route
-- ----------------------------
DROP TABLE IF EXISTS `xy_route`;
CREATE TABLE `xy_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `full_url` varchar(255) DEFAULT NULL COMMENT '完整url， 如：portal/list/index?id=1',
  `url` varchar(255) DEFAULT NULL COMMENT '实际显示的url',
  `listorder` int(5) DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1：启用 ;0：不启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='url路由表';

-- ----------------------------
-- Records of xy_route
-- ----------------------------

-- ----------------------------
-- Table structure for xy_slide
-- ----------------------------
DROP TABLE IF EXISTS `xy_slide`;
CREATE TABLE `xy_slide` (
  `slide_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slide_cid` int(11) NOT NULL COMMENT '幻灯片分类 id',
  `slide_name` varchar(255) NOT NULL COMMENT '幻灯片名称',
  `slide_pic` varchar(255) DEFAULT NULL COMMENT '幻灯片图片',
  `slide_url` varchar(255) DEFAULT NULL COMMENT '幻灯片链接',
  `slide_des` varchar(255) DEFAULT NULL COMMENT '幻灯片描述',
  `slide_content` text COMMENT '幻灯片内容',
  `slide_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(10) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`slide_id`),
  KEY `slide_cid` (`slide_cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='幻灯片表';

-- ----------------------------
-- Records of xy_slide
-- ----------------------------

-- ----------------------------
-- Table structure for xy_slide_cat
-- ----------------------------
DROP TABLE IF EXISTS `xy_slide_cat`;
CREATE TABLE `xy_slide_cat` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL COMMENT '幻灯片分类',
  `cat_idname` varchar(255) NOT NULL COMMENT '幻灯片分类标识',
  `cat_remark` text COMMENT '分类备注',
  `cat_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`cid`),
  KEY `cat_idname` (`cat_idname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='幻灯片分类表';

-- ----------------------------
-- Records of xy_slide_cat
-- ----------------------------

-- ----------------------------
-- Table structure for xy_terms
-- ----------------------------
DROP TABLE IF EXISTS `xy_terms`;
CREATE TABLE `xy_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `slug` varchar(200) DEFAULT '',
  `taxonomy` varchar(32) DEFAULT NULL COMMENT '分类类型',
  `description` longtext COMMENT '分类描述',
  `parent` bigint(20) unsigned DEFAULT '0' COMMENT '分类父id',
  `count` bigint(20) DEFAULT '0' COMMENT '分类文章数',
  `path` varchar(500) DEFAULT NULL COMMENT '分类层级关系路径',
  `seo_title` varchar(500) DEFAULT NULL,
  `seo_keywords` varchar(500) DEFAULT NULL,
  `seo_description` varchar(500) DEFAULT NULL,
  `smeta` varchar(255) NOT NULL COMMENT 'post的扩展字段，保存相关扩展属性，如缩略图；格式为json',
  `list_tpl` varchar(50) DEFAULT NULL COMMENT '分类列表模板',
  `one_tpl` varchar(50) DEFAULT NULL COMMENT '分类文章页模板',
  `listorder` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类表';

-- ----------------------------
-- Records of xy_terms
-- ----------------------------
INSERT INTO `xy_terms` VALUES ('5', '维生素饮料系列', '', 'article', '维生素饮料系列', '0', '0', '0-5', '', '', '', '{\"thumb\":\"20160301\\/56d5a6f4c34f7.png\"}', 'list', 'article', '0', '1');
INSERT INTO `xy_terms` VALUES ('6', '默瑞克鸡尾酒系列', '', 'article', '默瑞克鸡尾酒系列', '0', '0', '0-6', '', '', '', '{\"thumb\":\"20160301\\/56d5a71a12333.png\"}', 'list', 'article', '0', '1');
INSERT INTO `xy_terms` VALUES ('7', '雨瑞运动果汁', '', 'article', '雨瑞运动果汁', '0', '0', '0-7', '', '', '', '{\"thumb\":\"20160301\\/56d5a7335022a.png\"}', 'list', 'article', '0', '1');
INSERT INTO `xy_terms` VALUES ('8', '乳酸菌果汁饮料', '', 'article', '乳酸菌果汁饮料', '0', '0', '0-8', '', '', '', '{\"thumb\":\"20160301\\/56d5a74ccb89d.png\"}', 'list', 'article', '0', '1');
INSERT INTO `xy_terms` VALUES ('9', '利乐精美礼盒系列', '', 'article', '利乐精美礼盒系列', '0', '0', '0-9', '', '', '', '{\"thumb\":\"20160301\\/56d5a76c7f6be.png\"}', 'list', 'article', '0', '1');
INSERT INTO `xy_terms` VALUES ('10', '易拉罐喜宴礼盒', '', 'article', '易拉罐喜宴礼盒', '0', '0', '0-10', '', '', '', '{\"thumb\":\"20160301\\/56d5a789498b3.png\"}', 'list', 'article', '0', '1');
INSERT INTO `xy_terms` VALUES ('11', '玻璃瓶果汁苹果醋系列', '', 'article', '玻璃瓶果汁苹果醋系列', '0', '0', '0-11', '', '', '', '{\"thumb\":\"20160301\\/56d5a7aa0ac9f.png\"}', 'list', 'article', '0', '1');
INSERT INTO `xy_terms` VALUES ('12', '雨瑞苏打水', '', 'article', '雨瑞苏打水', '0', '0', '0-12', '', '', '', '{\"thumb\":\"20160301\\/56d5a7be66e6e.png\"}', 'list', 'article', '0', '1');
INSERT INTO `xy_terms` VALUES ('13', '关于我们', '', 'article', '关于我们', '0', '0', '0-13', '', '', '', '{\"thumb\":\"\"}', 'list', 'article', '0', '1');

-- ----------------------------
-- Table structure for xy_term_relationships
-- ----------------------------
DROP TABLE IF EXISTS `xy_term_relationships`;
CREATE TABLE `xy_term_relationships` (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'posts表里文章id',
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`tid`),
  KEY `term_taxonomy_id` (`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类对应表';

-- ----------------------------
-- Records of xy_term_relationships
-- ----------------------------
INSERT INTO `xy_term_relationships` VALUES ('2', '2', '5', '0', '1');
INSERT INTO `xy_term_relationships` VALUES ('3', '3', '13', '0', '1');

-- ----------------------------
-- Table structure for xy_url
-- ----------------------------
DROP TABLE IF EXISTS `xy_url`;
CREATE TABLE `xy_url` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sign` varchar(100) NOT NULL,
  `status` enum('已使用','未使用') NOT NULL DEFAULT '未使用',
  `add_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `use_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `account` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2220 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xy_url
-- ----------------------------
INSERT INTO `xy_url` VALUES ('1', '133402d5abd35b160d33ea04b735d68a', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('2', '8b9bb73d9f250532d528df5a7845a6b4', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('3', '068cb0332663826cac7c83616672aede', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('4', 'c8fa8d77beef9e8a0efbffcce9a2589a', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('5', '5e5f41be68bad3becf28dffa212d582d', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('6', '273c758fd2f690d3a34c0cfa8b27b914', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('7', '8cafbfb6ddeda3d7a9cf02b0ef45f8c6', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('8', '396c1fe37d9019a87ac98eb12338a1c9', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('9', 'e81069cb10fd1667b1d0674f38af1fb8', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('10', 'dc3267574102f6aa9cae0f4ee0a1fe70', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('11', 'a093713ab4dbae28c537f171494de288', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('12', 'e86d913e2a7020ae38edacf77a21f66e', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('13', '227ef91afa07c8d287ed9602e5532a1f', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('14', '6eead4c9f690cc5772beb38abcca242d', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('15', 'c70f6e8ee7ac601b07e3c5776b17cae5', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('16', '93839268fd00d7a3fb974ed6be477eea', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('17', '81be25a2004de2d91ebcd050780a0541', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('18', '75f11707d1522ac0050e497a91ca8c13', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('19', '770586088128c61c208a9bcfe3f21613', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('20', '2eca959205c744c13aa2e4b1eecfeb7d', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('21', '1cd2eabd6da89a96dc82fb77d6292bef', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('22', 'eae518de64b0b63752f5936441f4bf2b', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('23', '11fbcbe988b1b43c432ab535a5bd36e3', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('24', '9184b97bd19232ff8a944bd1c421e03f', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('25', '7366ef5e7e6430fb3065d574ed0ecd92', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('26', 'd4d9254981e43ff320913289bd24987c', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('27', 'cc64851e096c3506c1c7aadd74ce531f', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('28', '53205a3c64422fe31e9923c3089dd69d', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('29', '71dec8b272c579f8a27caba318da2b7f', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('30', '5ff4846cf7317a0486eb1c786838f440', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('31', 'd2cfbe3fa4caf376088a9b7f03f4a7c2', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('32', '044c682dba06bad5d8f6376e801ae36c', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('33', '1153b67d9f0c1c14deb16f07dffd06c0', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('34', '056e5c70d303b725467f0cbccfb7c4db', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('35', '89a9984c1aa1c7ade80f54ce609e6efd', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('36', '0f57be403d91e7432a41a70a6247009f', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('37', 'a4104d1a515e04b12ded5cd66984980f', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('38', 'c34cfaa5b887ddbd30cee571dcb9a4d8', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('39', '417b7153af64d7db3f2a20daa345c068', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('40', 'a59fb397842d2de17d923d6063779c75', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('41', 'f9c69913e05912faf0bc2562a7642ed5', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('42', '479c3f3464a376576e3d62214af9b332', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('43', '0017e8cf1a2fa0edc8e2586a83b49065', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('44', '56dcdf0c3a8cd1f6a30163e2202a66fe', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('45', 'f46f24de76740a8eb4a01a9d5e630e44', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('46', '66649734b40f40770c036006133d0bed', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('47', '3fdaa1d9b8038d71043cc31ed14d4857', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('48', 'ec536a8def07aa5e7f3623005a55be3b', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('49', '0968ac4ff61835db5d72ca451077da1f', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('50', '178658353ec66954628c8e263a8799a8', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('51', 'b1f47d0f86fb9dbe70ed55a5bb2c9ee4', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('52', '5ceb6db43cb963362f8295667bf9a682', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('53', '280c69efe93a8c6d98fb08262e49c2ed', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('54', 'd0708ede59dfc329e9093081c2be462c', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('55', 'c324bf8128dd32358db768685b3d29bd', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('56', 'bbe0a735aa0be42dbee855e1fead9d0a', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('57', '7540a948dc74927a83392cf433f60ac3', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('58', '63c2fbbb303c5d8b9838621835d6648e', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('59', 'd17328c94aaa48c206b975889a6ea9de', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('60', 'ba06b3cc0551d92f867a68022b1c5df1', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('61', '2ad22364a9433c3cfb222578717f4f34', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('62', 'e58891d6da9b17c8531c521cecd9e2d0', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('63', 'afbf0005b9635eb3bbbf14f9a00d03e4', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('64', '0d64602ba9e07f262e9f2e7dc5ecfb07', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('65', '388872a93b3d3923c84522d45fed463f', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('66', 'a667a1065740ca0cb89bdd512387d018', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('67', '666d0905f508a0bc5e964be0b02f4d2b', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('68', '6b3d92ac4b7bcbe884833b0e7eecbc79', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('69', '38bdbafda302ec0c48f366901df79c49', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('70', 'a6316580924046b3762018d1f43b8791', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('71', '6f68d470dde611f8d99cdd0681bb42b2', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('72', '81b9379260eea3793bd32444e5db168d', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('73', 'b9704d909e4682426fe07ec7f79068ba', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('74', 'ce4dbb5d363379275380d4887e1f8c7e', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('75', '07c5c32edb32273df717d412a511cacc', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('76', 'b9b3967d429a0b12f4c735c16cea6471', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('77', 'f98b08cba556cbc596d54ff6917d1882', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('78', 'e7504953d4dacd36f6ffa4aa5a17ca37', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('79', 'b30b128cca6c779e3eca26a71f2e7c96', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('80', '6187d0cbd2d8167dbef01657a624e734', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('81', 'b545a4195ab68bbdee83688410cb9d92', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('82', '4d0449485b2fb3dcb831e4825466a8b0', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('83', '1fb1ce599ca7f6fb1222319b049e2080', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('84', '4d1a5eb669762c374845b3d5b60eddfa', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('85', '89c61736a71042c6ca1721a16e160f6a', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('86', 'a7d5f203602b103537e0fcfdd8f1469c', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('87', 'a22ee86953685204509070fa79ab1a56', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('88', 'bdf07228ddc8f2e680411fa1b30d3742', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('89', '666b15e2728d458c5fe82a86be287c24', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('90', 'db4038158e46fe2f31adc6a14df325e0', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('91', '41eba24d9bf23638b7b24875b2bae49c', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('92', 'bc82dc09df7954a19eee2c2fd9e726d4', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('93', '5d9700228fe7c1ed9ec1a5a50fc6335d', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('94', '0ae5ad9365c2382d8f1da20e6a56d5f5', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('95', 'd70677d29d6783dc3826bc8b27b79a55', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('96', '517197ac6af3d1da8f25306b9205a77f', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('97', 'edec4eb4d15ac18bc4431cebb6531b71', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('98', '29363ca4af70b393fd953b2c124463f0', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('99', 'd6691f57bf4307c97b433704cbd9e666', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('100', 'ab9138483c7f2e89c2c60889d551f98c', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('101', '58a5e087a01a14c1421ce5ec5a737a5e', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('102', '47fa258e2430753078c7650ae503b95d', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('103', 'd90fcf4d09326d6c2174558b9295790e', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('104', '7c744769a799e48e385e9c976253c6ac', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('105', '227491b58d0d541ab0caa5adb88bfe8b', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('106', 'fa8e87454f34114fba0e58a40df5d86f', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('107', '991f84683a230cf46428d0539e1ba760', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('108', '8ed5b7a645a3fe0353790bf5b1d6ca77', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('109', 'cb6b4eaf35bfac95dc15318fb35be6de', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('110', '992b9b96a1d9c241aba69bce4b4b3988', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('111', 'a9838c57d21c2067698acaf5d42e980d', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('112', 'ff639f7ef6ea1dd88d38459b9bb41fa0', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('113', '56583f9a16d20779cd8ed0c0ea8eb547', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('114', 'ed1f41717a3b30e24e1c9512d80610c8', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('115', 'cd1350eecee3f2921344b9c9c1181822', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('116', '798a75146bfe89414d0d367078990d55', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('117', 'f0dde5aa2694c3a5e403cee85ea1f74e', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('118', '59f7e426c6facd4660816b7dd05f6478', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('119', '2facd48cfe664539c7368db1b48c6cc7', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('120', '42d022c44de5c59e0d92517a50d598da', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('121', 'fd826f57013526bb0b7a6fd5f060a29b', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('122', '6ce10c8675bb58cea33cf49d5fe326a2', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('123', '69d65e3744d45d00b4922db4ed2746c2', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('124', '7443b42d85474956011b90419dee55df', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('125', '1a74cba8a95da23e809e91a8a38130be', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('126', 'dc8ed01eb1df55040f2d0131c5a9d117', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('127', '8939814fe80a682ee47932ea46d70fbe', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('128', '639ea51b687da659d8386837f3ec6d63', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('129', '4af1d50ddbeebc961be89d7733463e16', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('130', '631859907d7724292a2cf401c112de29', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('131', 'f5f3b3e62bded94b613ce3be35c75816', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('132', '318ef7487c7fc60804aa1ab4b96f15c1', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('133', 'ab5457910a1b63bb6a83864b114b56cf', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('134', '78d945e149392caec6e3952d6d571def', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('135', '5f56654757aefcc5ed2ca8b3e67cf5b6', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('136', '1173739d942e51cc595fe65d8716626c', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('137', 'dda0d90dadbe7292adbec570c07cf26e', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('138', '9cf5c54b169385c7a8f08f9739fc2a6a', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('139', '2336361deda613127391f539beaee46a', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('140', '9feaf562ff847622309397947be0ce43', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('141', 'e46d599dcc37b82ac9a78ece6fe408a4', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('142', 'f65512e3b80cb7940a3a6d7ac9e12a22', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('143', '6b9fcaf597bfab36b28abb3dc4ab220c', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('144', '0109f595ac614002077e2e8cba6230c9', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('145', '38ff12bd066183eaeb95239574029f06', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('146', 'bf25c9a70d11d0f8f9a3b6927482438f', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('147', '725e32c5bc93c48845eb4baae2c522fe', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('148', 'dbaea4cf5154c4639e827ebcc5990c84', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('149', 'a384149c621e10c42693640bd266b2ec', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('150', '3b6d80c1f2a7065c1b65227f96febcf8', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('151', 'c7d7bfc8e8f1c3e8501ec5037b040ce9', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('152', 'e970f6f073af2975210f0f2c2b1efbf0', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('153', '8a77fd7f56698e0a4052b78e7db86906', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('154', 'b3417b17045dd25fc6f0299cdc1746e3', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('155', '12515636acc4b6c3c95b9efc62685881', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('156', '41a1c14123c24f5e2c617efcf07d39ad', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('157', 'a4c8b5f10e1efa377d7cf17e690f9137', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('158', '406e832ce8004fc1d5442c4c54a978a9', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('159', '4c9ccd7f11b917cc1e75c5ce9d1dc9aa', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('160', 'b24d1f32f716c57a4496807a9c4ad50e', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('161', '39e66f8a1e3c68f117773fcbb317b911', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('162', '7632f62b3503e79fddcc3761779a7e74', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('163', 'f9560d19ccdfeb9d66a6a1c3d6497643', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('164', '001317b4f230b3c3f83a1d45f17fece9', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('165', 'f95b68914d0563e9974f8e9511d7112d', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('166', '8eb6c46a685f07992eb1f8fc8d7c603b', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('167', '5a133023bfd3cf0f699510a4870c60fb', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('168', 'f7ceb4dada3ac0554706f6b3724ae246', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('169', 'ae5d14b035afcfc02a1c5f3abbc5399b', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('170', '52e9bc966c10ec72ba0e325f5c334ffe', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('171', 'db6bb79a41529cabac53b1b805ad2883', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('172', 'a856d89f0f99940b244b11cdf78628f3', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('173', '50dd3cd8f6c73a5a4079733fb7e46489', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('174', '41d40de9c28a4e22909a9776bfa0e11f', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('175', 'e36832b9d49672e06251227b65c87019', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('176', '13f2ec869c89bd3e5a4dfa36b1ebfa92', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('177', '3a52446985d856b991ec489f2843edbc', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('178', '6d806ee53107a515f3c69e662314e308', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('179', '9d54da44a30a56838d9111d4ba81c9e3', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('180', '468d6f9c2aee621cc36ef8174d76830e', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('181', 'd4c55846ebc832c7965d1bb08ff3e692', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('182', 'ecc9aac2c42361956405d62f83f1a95a', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('183', 'cdc725121d2f40043faa54c33bed2e6c', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('184', '78ac33b252e044030aa89ad08e17b848', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('185', '3a9292c510a4f4a4f84de270c40a3869', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('186', '2da745644104a6c8fba472f271402c69', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('187', 'a7bb78170c30b67666baf647275ef0a7', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('188', 'edcc0a682df266bd32a8830f6b987971', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('189', '0894a303b2e8d2d5686127e6bc3c7693', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('190', '54d3abaab55c4d1dd6b0e6330ae8047b', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('191', '261f7c023e0834e7d195b71ce74bb0e0', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('192', 'bcddef819385cb0c58a48e33514a8479', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('193', '04dac9222175b5a74cabd499fe4df667', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('194', '3737273318649d53c46ebf87cca406a2', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('195', '6a59b5d2eb386c084674d28d58bd3c3d', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('196', 'da0892aa95f202fbbd83ee7f63025dc4', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('197', 'ac736d3864b69d79c0bc73215d79b3ea', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('198', 'cd944f8688be1a7ac8ad1a49f3c98b9a', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('199', 'eb230e0670596761f10e520574357579', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('200', '0575e679361f3d88ea6c3c94bce21b4a', '未使用', '2016-03-03 11:20:06', '0000-00-00 00:00:00', '0.30');
INSERT INTO `xy_url` VALUES ('201', '3478b9d89a22698f6b582f1134ba2a6b', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('202', 'a9bda2ceeda9603690ca79e240ff19ec', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('203', '56f117de2a94f0e08cd991379bfc9db1', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('204', 'b67293efa13d413760a256cac582603f', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('205', '788da7d88e58fd2f1091470c5ad2915a', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('206', '507d53cb6c0187938200e546b364c8a7', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('207', '2b955779ae36d4c7e4c78e33dbce6d52', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('208', '288ee7042188f77f6c9db63abb890fc0', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('209', 'e0d550bfcc05832e19b159bc1f59af11', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('210', '7804729dd77dc217e2dd4b66c235c7ae', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('211', '19ea3a008987fee99e7442ab4710333a', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('212', '0f8d3f44b0e0d2f7306fe84a29bec567', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('213', '1cf1c253233a69cc526fb62b6695348d', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('214', '3aa19b2cdb7d5f76b217f18df8458730', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('215', '7551cd52fdf72481c244cc86a41cab70', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('216', '7e6491aa4c4cf23b0e032adf354aa4c6', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('217', 'e85ebb66dd337c52d037b6cd902284b7', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('218', '11194d5c1828d22f016e87a9403434f5', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('219', '27d3fd916c10b6b033ff82a0209e5fc0', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('220', 'f691c331a29bbc71a9bfdcfdf86d0ed1', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('221', '578c3336d240726308dc8f9bf2217ffe', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('222', 'af7dc099c8d12df3ce43a51297039b9b', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('223', 'becf4162590def1479665c6492b1607e', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('224', '5b0ed7f586e2436dfd0f08a7d32f6aa9', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('225', 'd7b51387ba4f6bd5f33a2df6aac580bc', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('226', 'd4d14b39b43053b1be3e65fbf725ad4f', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('227', 'b56ff12a86b23a5cf0416fa473140409', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('228', '7280b969e78c8e88c34adf76353ea407', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('229', '13b8d0352576f2b084b2aaf3b7ec355d', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('230', '5d329dd9238ea75c88c3c38154d88c2a', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('231', '48071c8dc6aac732d091a897393b3238', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('232', '43fa50e69a39047f9fd7782ae36ddce9', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('233', '72338fafe2315260c995a9152ace33a0', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('234', '662d763feb8776ddc21ea1b04c9605b4', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('235', '803af2cb364ccb92c2a2341a9cc1ac4a', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('236', '91eb5915a265d567c8db51cedf711c3c', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('237', '279fe54c73cc51c871b3a1cae198540a', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('238', 'fe9e4c0454962b3b3165b1887cf30bff', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('239', '62501292cf8a972c6e37c6b10d218cb4', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('240', 'e3e43a9fc06d9c2b08d834435c7d4642', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('241', '4ee1dec8ac9ea1106b240748ed2cf8fc', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('242', 'ca1993b2bf3a06f3bb7ff4d6ee86e5f6', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('243', 'dcd9afe40cd84d51e95d3f5f3d89ae08', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('244', '91d59020c2b388b239260a7b9c605756', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('245', '927fb0f14c43ba48d27444bdc382b8af', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('246', 'c09faa3b19e6fcb268ffce78a9d51805', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('247', '8907cc10f54fc8250aa0f335b78dc443', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('248', '3939cde6941234f9eb23fb5bd3da5bb1', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('249', 'bc9aa528bded719a5c8c4f8f0662405b', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('250', '0d08a0b5487d1077019f1df017d99717', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('251', 'c6c8746f1bd80a384c804a576f7a615c', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('252', '1d05107c43415acc289b81471ff9e65e', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('253', '91c0d432d4685d0e6acc4f305b924047', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('254', '8f0516eb1740da8da9ee4a1c1367c6db', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('255', '52c11c58ee7af15acfccde74ee059664', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('256', 'bdfb475b7c0c98925d82d5f9e1eb8d0e', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('257', '2961c9254ecbbc6bf24ecaa3cbeb6577', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('258', 'b37d21fbdf2469749e91544aa193a505', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('259', 'fc17cb4120b9399562adc7be7043350b', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('260', 'e61c50dd1ac5ca24fed455616562efce', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('261', '7a04e1c01a831f635057a15ab2cd60df', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('262', '66bb1a5e43c1d4c7b6333d2b8a79a9d8', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('263', '93cb81d0f21444e9978b788ab3e42831', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('264', '191d573b41af6a69c7d7e5260c605900', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('265', '8e3be72e541de7b30b717641f064a923', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('266', 'ec40c2be2914a62fe3178f6096a87291', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('267', 'a18d3eae0b10ede23e861cae90752c70', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('268', '566305dee2e4f24d31d18910f89ecb3e', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('269', '3858ba03cebe120665ac8007fc0164fa', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('270', '35e7b750f4699d7085752d5eec330c48', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('271', '288bc926fdc5db9d2213cc24029a2d5f', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('272', 'c7ed12b864c0c0ca3bed43878a0f34c6', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('273', '3727796a8b35a072b9724705a62fce0e', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('274', 'a149c71371fa0cb69157d83f03973bc2', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('275', '2a94ae58fb16c9bdfe9d100adffcdd81', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('276', '613939a68cd7daeab07804d2465dd398', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('277', '114d1de4364bdac389b6a84bc838009d', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('278', 'ee66cd24f37aaab9e0d11228df2cde97', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('279', '38eafb8cb155608d2fc243b9d252e12d', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('280', '0b8b7bc53d72ddf47536bdd6d4fa93bb', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('281', '23ad602644e8d56c05616c4eb211b5eb', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('282', '91119b779c56b43df40fa157f4d80397', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('283', 'e0615d7074d3777cbdf05218e88f1489', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('284', 'c38783fa7080237ec87d7bcb90c8af8d', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('285', 'fae791ab37740c6ab6c0545649454ce2', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('286', 'e36ca75b6bdf886a470aa55760066d60', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('287', '3f684088f15068abcf5ea84cc3c6c916', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('288', 'df40beec2fa710ebfa5819064970311e', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('289', '294426d6be06afdaf3fc143a000747b5', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('290', '3b6f49a0f4ed43345615b21abd395a7f', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('291', 'ba5428e5e491172cc8fe0b86948cc18b', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('292', '5ff80786024e13adf6ed0959dc7358a0', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('293', 'c88472544952b5107a8121dee6a375c2', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('294', 'ef0730ccbb137c7c77b755121fd0cf7c', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('295', 'c10f1bd5892166adbe5028826e33716a', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('296', '91449aea93a807b3f60c1bc5f91148c4', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('297', '680ebac75937e0d683b1a5432f49f930', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('298', 'd324963a15dab8b43aa48bab71129413', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('299', '23c6c9abd4958f2d0d45794b6c095483', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('300', 'd3a5a28b59a23b52b3ac19e3158f326f', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('301', 'e264ad693100ee982f51cd354f151384', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('302', 'ddfca1fe0b721a17611ee2a723a04e12', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('303', '5c990e73f7310b8e9ba769cb3eb3603c', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('304', '70f53f6ee7f18a9e75b060d58648e2a1', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('305', 'a25309ae8e70fc76dba53955a381cf8d', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('306', '5d2be93830953bc0b0579b91668552f2', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('307', 'cf57b696a1dfa77f653f97e1d8020128', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('308', '05992a6a6e291718ee9fae43509218cd', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('309', '37af014243753dc4e82ef7739feea4f7', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('310', '0bc9e02be9d05b2e2a3e5ccc2067d944', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('311', '706185b45d37bac4bb8c03e3f0ffb77e', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('312', '5d2137e3c8a827eba34dbfeb1e2be6b9', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('313', 'fdc11a83a4a08e3dbbe6dfe70876c8a3', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('314', '020d6fbbef9d8a7b632b79f83938b956', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('315', '5b5f687d064ae7657f640e196d53c91b', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('316', '6b891a76aaaf4401165166f268dcd87a', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('317', '65fb611c8ff2c94e54f74f4841704f3b', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('318', '0e7f4400b270920d963518f7ebf111fb', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('319', '3226483be80abf034681331a96bdc475', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('320', '2e4f7ec9ca859e5b2d4cfc029dbb4cea', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('321', '4fb8308e5dedeec41c971abd96ef1d02', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('322', '6b74f649871f9c2aac88bf84d981d414', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('323', '299d05bfadb153d026af34d95a5e204a', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('324', '2f1068f95791adaa71d937bafd35d45e', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('325', '685dcb3f9fb0bb09f366b3adbc9e554b', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('326', 'e3a5e9d5d8dcdb5d09b8b936c3ee498f', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('327', '8ea0951da67865f8ca0e5eb35f734324', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('328', '65b00e34ad8437d73ba8469f0d2bbaef', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('329', 'c933484b4154eaee7184565c56accdaf', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('330', '286902368029fd110096acb173cb18d0', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('331', '55e4376d318c6e9bdafc325a215daaa8', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('332', '6488d1af68910d9bc9eae824e8818f6f', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('333', '53570d9837303f59456743a0055f46a3', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('334', '8e73675c96c8d8909f45e33725602929', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('335', '576dcff4447ce6fd48cd522d0fc826c9', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('336', 'a406e00607582fce56a7b073c02a2c7e', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('337', 'aa11b62a2b58e719a2bc4185453e0476', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('338', '65c550bb6c5eccd255a035cd8c11a293', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('339', '7331136053970232b874cf9c63f03c80', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('340', 'cd165e71adfed96ef9cdaa125de0c280', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('341', 'c60b5a30698e8f15b9f8c1d0869d35ac', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('342', '1ee37e01cc720ba8b8c3d9f3456a67e2', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('343', '7f5d687f79a6e1777a21e406c883927b', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('344', 'bc288517937c01fd648e0a03e56e23e5', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('345', '142e29e2f2a545e45c5d22bdeb0444d5', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('346', 'ceac99cf3801ebf547609ede98fcd5b5', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('347', '6cfc980bf83e2a53cd864cd1a6e7d6fd', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('348', '3cc8425b72aa1aeea96fdbfec825e53c', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('349', 'a62ff3eda67d64d3cc675a63602f52ad', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('350', 'a31d27f7cddbaab4456a6c0accc3aead', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('351', '394ebca705958de3a29d7ecdee2767ea', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('352', '867ab390504ac22896e16a51b4f491b3', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('353', 'a55fbeb0d7d516cc738b2b810d8af710', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('354', 'edc47ba11d6fed2d8a1e01b0fb240577', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('355', '7ecdf77890fe248b1b4ef9891874656f', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('356', '24271e32b900a46c3c1f2f576f44af45', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('357', '309bf58ae8f15d7ba820e88cff7ff5a4', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('358', '68be4d1af77708dcb6678b5f19af6512', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('359', '9860d7d4a9449acf8642c7873d98e32c', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('360', 'baab372d066a52af8b896a53352b7d09', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('361', '0ed92e91ed76c85a31a37ac18ebc875a', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('362', 'aeefea877c99495a63e2377ba6aba288', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('363', 'fae11d8d8fc6f35c0f0b43144c4d4bb3', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('364', '9966b90f8a3f6e85edd00c57ae6808cc', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('365', 'c96e245f111a9b79d0e301e03f994027', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('366', '77f21b12f07830760b88070fb53f407a', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('367', 'f8b0c758b87c30145cdca0f37e4f5302', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('368', '870026f74610a334612a2aff7897d73e', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('369', 'e78ce0ea1eb50afeab0ece07a82de262', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('370', 'af7a44cf891315bc1eaa13b877a1ec5c', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('371', '1cce926ce5d24a4ca18c0437a0ba831c', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('372', '2714bae6ca416d817af7cd0696747bfe', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('373', 'dc380cd77e1877165e69eb884179b953', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('374', '2382da4a34677c1baa2707174b465562', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('375', 'a9e6431eb7c9c2e8f74ba4ce4bd6dae7', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('376', '960bb447f13bee557905d8d2eb47abf5', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('377', '35a584b89c64d52f185f17ff34905b55', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('378', '0abadf5387cc6f368caecedd32856008', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('379', '6ec587b5957fcb95fca7c1d271f86a94', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('380', 'ba606ee79d8b045c50b4c6c320f9247e', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('381', '96ba3f69784499fac393001e60c9b496', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('382', 'c367f33d9a5bfd37f3937a701ca50825', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('383', '88c8ad1fdeb5483860e65c24525ec596', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('384', 'd6d72b877c31a4180fdf46105bb193c1', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('385', 'b1cb38b97baef9faada03f391e59b9df', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('386', 'bde27fd1bf748383c79ef575d8074c2f', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('387', 'db42f365b06f0449b0a8730d4309524d', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('388', '97452c87eae88fbdd7b5e484e16565f6', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('389', '9f452747134019396114e02383d925cd', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('390', '24673708cf4bee194db496947c03bdeb', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('391', 'd501da6bedd36816de35bc074f55206d', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('392', '242d58d17d72f896e51096e5101dcca4', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('393', '364ee90862d96a0b3abb67a34af8cd45', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('394', '65bdca8cce347c87c811340a8c25ced8', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('395', 'cc57b49f007ab24e66fb4f10beef371d', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('396', 'f41e56f6698c433ee5b6ff8aac3c8aed', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('397', '0e012e5a7a0b9990b7d7c219b301fb79', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('398', '9a245196a5478a5a676751095aab9f8f', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('399', 'f881eebbc4b906d8ec118fc9db95ee51', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('400', '2f0071ee7b2ca811e93c3aedc68cb414', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('401', 'c8ff8733d0c7de24269f7ac3ae44b089', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('402', '49350e888def3418fdc00718d7a9cdec', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('403', 'fc57c753468c4f091699f59bebbe4fc9', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('404', '070fe184a18386506cfd11c1a22d66ef', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('405', '2bdf68c168076890110789dfff5f9ca5', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('406', 'f6fa1f8f303b1369ded15e2110ac85d7', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('407', '6f9852bb8d2bc0d45b27b54bd7928bec', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('408', '9f3abc9f1e9573811200e462f6063f05', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('409', 'f121e2a7de4dfc755286e9ee2383b7b2', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('410', '73e67ac9ef502029b5e9047a0f1134ba', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('411', '69588bbfed9eb8d3fffe2ba1959430c2', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('412', '8c6fcc05ce37ff0f39d4a5eea596f360', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('413', '2172c0d5f2e7c1f105076f5333485482', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('414', 'a0f6c84ca98b4c1bddfae8988c2d71c4', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('415', '71e97eb4b559b40e0cbaa528f04ca9c0', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('416', 'd08f9623d7b7890b32aea65697ee8f75', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('417', '8c6c2ad74135265bc51117af8e86f512', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('418', '0ff4ca55de02899517386a8f726fc42a', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('419', '5323532a31e9d7148c0f21db104b1e0d', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('420', '77d847017554ab381f5003600bfbb022', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('421', '66d8451b45cbaff5aca874728b5f2215', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('422', '9299b4118b72917126db12a402db5c0d', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('423', '66ca0f324ee583cc9c2095050d4751d6', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('424', 'dfef4a47830bca1ca345c29758bcb782', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('425', '2d810e82a038342e7ac49ed19848c3e1', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('426', '443eb0302b20c7434a6898c8d8f4563f', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('427', '9ddbc11d5a4cbd545ab6b3f3c6bc774e', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('428', 'bee7097ac22e160888aa867cdc5b6b4e', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('429', '10d3800d4bddcfda5111f3c60856332a', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('430', '0179acb18424c076ae77ec1c2734ba71', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('431', '395b832998e860311f56f2fd189a0bc3', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('432', 'ac1870ba8cee02baebc8f1fe8b6097bd', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('433', 'f36decaf51692772f9bf5753773477ad', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('434', 'f1ee4b2f67c1a5a058d4f4fbb944dab0', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('435', 'dce7b81a9d6f844c4ae552321e0445a6', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('436', '330d932ff693a0bd86ea716bce25511c', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('437', 'a8c1df9d1348948b29f126d3d69c6754', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('438', 'e69d87f22f6a02ec9ce26cb83013641c', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('439', '2ae44db5c6e13ea439f162053762afb3', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('440', 'ed58395172fd192c2f1c6a05bf160534', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('441', 'a907918b284cbcbbcd68582d4ae2636f', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('442', '2ad07cf478a512c85308e2f27cefb55b', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('443', '78dbebf4ea87534caad956f097a9f5ca', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('444', '8ef1c578aff508fb864fba6f0c149266', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('445', '427aa8287850405404c14a21264c5367', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('446', '2559ab36d5ae8dc30781c9598e23ac57', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('447', '96b4306edc27e5430c4e8b2f2f7ddf91', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('448', '8194b2df74d7fb1b4a0d3f43c6a4266b', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('449', 'd6d1cdfd1ef5e91e9554ea94ddcd0bf8', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('450', '40dfe93cdd6d9f9257f538ba351c1480', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('451', '1ec1e78d3c3f44dcadbcaa5090375bbc', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('452', 'fc3de5d05494b90e7187184bf69f0760', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('453', '52eb90331912b9512375581687654b25', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('454', '63763bf61be70830c9faf7e0a778b8e7', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('455', '74a1a8194b838fed64edea51c1f286ba', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('456', '89fd41c93fd3cd1b1e82b0ac8e98734b', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('457', '914e6be7d13b0959fda4aad9b2994e8b', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('458', 'd10b664567f0a762b75202d42a3803cd', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('459', 'dc11b0d50f104d16b4801a88fd8c2d87', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('460', 'daec37e48f8cc8ec63233e86146f87c7', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('461', '7e73990d8d8f6779b892ab44a4bdac12', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('462', 'b288c8b75816f6938c550f1e3701af9a', '未使用', '2016-03-03 11:20:07', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('463', '7e58638ea78c613c847595991e3e0c8f', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('464', '09bec6a38cbaf8e78face475a994a33b', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('465', 'ba01a83f08f01418aa67cc79bd43173f', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('466', 'be4faa9c7c05a2e9546ec571af560a4a', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('467', 'e2aa54c5e8999c24df675425e12e7b0e', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('468', '3a9ebf2511eea5e8a3fae9431533e057', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('469', 'af056b5404558d24d35f970d6a33d4d7', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('470', 'eed8f8fbef99ab22be6f80c58f76ee5a', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('471', 'c21ead0ad243239723146ce3fe75b731', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('472', 'f7d037f9dc7649868cd84247815b151d', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('473', 'b7d7b23c15ec97b321fc2f12ef162e48', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('474', '089a013d992ea1962f46ba679ec348fc', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('475', '86b997f86d100b1803a850a283404799', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('476', '14bc4260389d5f38ae3f12de992270c9', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('477', '5d9be62c75eaa04976a88a627acae2d3', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('478', '5d26531c77d575e6f6372a88d6228821', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('479', '7f53b7bd948f34bee96cb2d05e379bab', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('480', 'adb9b2a7a627758635e5eb3964d8438f', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('481', 'd3c6a15042ae5aa680bba40f4f6b9f60', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('482', 'e67ac4de3c7c76be42a2f6587b08d2da', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('483', 'ce04252d92c3222fdc70c5a25115ebd2', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('484', '09a8dca80064a0405d4d7e9207bd071d', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('485', 'c8cd7888a3614d73e0c5018a62d7a544', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('486', 'adce93517e57771b15c926bf80940e89', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('487', '51c8429fa5f72c886391c4d34964687c', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('488', '0b9023a2d029240f3aa994f931be0813', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('489', '75182ed0db108d7f8d99ef588e9782eb', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('490', '1e1ddc78d8bb699096795b3f6471c666', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('491', '8cfc39cacb86f3eba6fe3efb92e55851', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('492', 'a8edf621407aa6184cfa4a564766b5ca', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('493', '4979214d2099f3a32bb5d7475d47b34d', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('494', '3d49e265e5990cee6986134416263843', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('495', '1cd7e28dab6c1340b0ed3fef93c0caa0', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('496', '60e341f17ffd0d89d8b6602be98af943', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('497', '231034cc2dac5a0b7b6d1ffbd14aeb98', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('498', '02a18b434b94ab7c4df1d0168e6e53f9', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('499', '3910c6cc0df58793d09292dada1e660e', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('500', 'cfd8126006a41639961c49b77ee351f1', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('501', '0f5e01a3dbc55dd763490f40412917c6', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('502', '4710ed4be68cc98b05c157e0d4c7a905', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('503', '39a178d91be746c1d9b2ac6ff1685339', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('504', '92159ca869a08075f84a14903f615d08', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('505', 'cd6ce80624cec000b667677851cebd58', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('506', 'bfa435edab1b4170f867222326a0ddb6', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('507', 'b5c4ec13159c75141340c206a2b248c5', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('508', 'a457fb2ca7f36738ae86bf0262a4fd35', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('509', '7d7b6b48101812e72b6f87d8a67b85e5', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('510', '75523e86bbddcaf7751d1ef715511411', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('511', '0d2276626395a83cb90b2b8afb905806', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('512', '75ab31c565df105ac9601ffb20121eaa', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('513', '3f24bafb91f81e15aaf06f65996046f1', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('514', 'fd6cb92efa912ab45f2a1a7104754eed', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('515', '0961793059a26033cc3c5a4b1be0fe71', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('516', '642067bc20cdede77904bf48be8b9255', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('517', '70638a9ac002eccc77ea734ac2f09416', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('518', 'e67b1d930d51d6147f903a1683e30722', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('519', '8346d21f638a937b0e3ade8e17c3f54a', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('520', '3c713014ae3bac2816d3cb436b41012d', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('521', 'fc5a086fbd94a660384eec6aefde2198', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('522', 'ef5582e03888fe21d3be2148cfba6e8a', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('523', '56afadba93db61724b3563eea4325594', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('524', '4855aa627041ce1d6d6ebae32f0e4a07', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('525', '16b6e9657251f7a9f54057cf373a6306', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('526', 'a76eddf68e27ec73410530958a216252', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('527', '813c8851a8be140c159cb1317ccd51fe', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('528', 'fb1d46dccb6674006f8eb85e5d673433', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('529', 'ffcf1e425443309bf1777f733901a8b8', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('530', 'd85239eeed798892fc619f91398ca7f1', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('531', '0f40c23c54a48ec385335f84a0ab6175', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('532', 'cee7c91cb98ab5739ef175265803ee3e', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('533', '7eaa80d172784df3dc619e956ea29d57', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('534', 'cdeea97c7062ce013508515378d66b0e', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('535', '988a08cd547fd08d00b519ab96c754e6', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('536', '6fe7b7b0994ff0187a3269b821a204e7', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('537', '441a019c7f4dfdbddc29d7d6932ff0fe', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('538', '15728794a52bd63cf99e158c655b4e03', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('539', 'db3e4d5eb4a2ceeb28c597081e3f58ca', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('540', '8236a41d40a07c5c2422bbe372ad6994', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('541', '522b376c60ea8323d8e0c1065ea77b01', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('542', '7c7a80873c97352c9cd0e5354b26dcdd', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('543', 'd3fddb4fef1e17309f98a77040c0ff6e', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('544', 'cd1fb7644a0bf3b14191595c7067fa68', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('545', '29a29329661785ad379d7f00359ca957', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('546', 'd170fd141790687cbefcd1ca0cadcbf3', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('547', '50d6a0e0d3d0d95084bd18b46516ec41', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('548', '4f75e1b4328d772d50dc21f03810ddda', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('549', '4b3d671fff67b5f08eed304ee4ad22fa', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('550', 'd317bb396ca04e8a328326dca81711c8', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('551', 'aabf39ca32d0a6857526235ec3f211ce', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('552', '8006df305348fc10c4e9bd4a7934d627', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('553', '5ab41e75e1791b163a6558b241428d8e', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('554', '8d0eb0b401d50374bf15627fe0a69b1c', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('555', '2d4a6fcb47f51a5a0cd42ee488412be3', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('556', 'ab7f3927dc73eb88c140b5e3177940da', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('557', '354b2544b3f20bc595d3cce7a12f3fd0', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('558', '8687879315a29d502db6307cf8b7c0b2', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('559', '60503aec2ba6b995944714898d088933', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('560', 'e1e1b07e3c76e9dde449564ec6efd7b9', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('561', '7b35fdd256de363f75196da6346052e5', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('562', '75a64761918e130d4020017cf590588f', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('563', '54d45fdc0e00c7c877b48984ba0c88e9', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('564', '64385e35abd5548da5a354495bb86eed', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('565', 'acbc44cdc0d7f366d212af5864d5d725', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('566', '195d4d18a1259cbd8fc83b3201804fb2', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('567', 'f3528866f45b50a82d310d2f1cf70f65', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('568', '3a7ea92de52a24f00fa02078bd7b0735', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('569', '62ab33a916463f01adbeda5c3e0092ba', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('570', '326a8293d2825315b4ac481cf5501b79', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('571', '1842e365c1b557c25e0f44bada209fa0', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('572', 'bb87473fbce5561716b083da6c4aaeff', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('573', '0619b78912a876aae592636da7b0db47', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('574', '7cc87645c348bad61fc8d73e904dce50', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('575', 'd3480a7827dee504b8f3af1ce2b90a58', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('576', 'ca7633cc637f0f6b26456fbf412bb9f1', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('577', '625e8e62200eb4e402e4e1255fd6b419', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('578', '930f3c01dfd7b92aff9dd2e27245e0e2', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('579', '0dd4b0d787b5f84d63d186a8668bf6e8', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('580', 'af3d3ef609c56cc43e0a31d515bc174e', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('581', '0fe1cf6ca5bd94ed3069f812bfee61ba', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('582', 'eaf1996a91036c6864061264e906fe2a', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('583', '75e7618f49d5b81da7e4f218b6abd80d', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('584', '59d6bf45d13e25644fb714fa8ca27781', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('585', 'b0a51231cbe5088897ca3ab5fe3fa2c0', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('586', 'f08b6072b600a87b75d772b39973d326', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('587', '0f847718e4edfdc138f078aedbcfd16b', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('588', 'c8e2f32eacc242b8f1e84cd8d43ca4df', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('589', '29000e2370a932660727b9defba6f5cb', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('590', '0741a14b6684be8673b273e290f69220', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('591', '388c2f5e7775a68439fc7f847fd03be2', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('592', 'fcbdbe0de6868eeb6fd91bf8fd405da4', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('593', 'fb99aa293d3ab6775b4319e590ed2793', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('594', '637ae435e9cafd53a2cffece762a0b67', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('595', '7d00be9cf36f0da09778078745b7cb6e', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('596', '6075d93c6d4914271d66701d0ff7038c', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('597', '771b92d2053712f9915309fa9a93c7bc', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('598', '501b4080986294d07a701d3f4cc33885', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('599', 'f34fd39544a3f22227fb738b40966e2a', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('600', '5a279d69a94cb1117d3d8b64785166d4', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('601', '047a90b74643be232f69a60593904583', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('602', '8ba96e8cf5caf128bcdce1187add11f9', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('603', 'e1fcaea75f3b85acc61cf6bad5bda04d', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('604', 'a8eafd83bda073e82b8f1c77f2f46efe', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('605', '56cc181d7d9d0bbcdfb168a5a1942baa', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('606', '8b0ab2c9b11b5667e57fe487a3fd45e8', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('607', 'd1b34b481a54e9840f3581b78bd387e8', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('608', '1bc66abc3c411c740faea307de0d4f89', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('609', '6c885dd7f55b4a8ba0d6e5bb208af89a', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('610', 'aa031a66cfddc0964adbf98fe6e445a1', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('611', 'ad0df6a6e776584030038e74393c03cc', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('612', '54d6761c1a04e506344f38d114a43337', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('613', '2ac8c889cb37c9066529a72f25ba32e7', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('614', 'bcdea9272ce2812a0ae0fde299e784cb', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('615', 'e3b9ba57678673c867e6bb77417618e0', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('616', '61fa9be9fade4333e20a75ff3c759c18', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('617', '716d641fa85077c2dd5fbb5b752e001d', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('618', '04fb032cbb42994587a92c229dc5c9ef', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('619', 'b89369faa88e3c1930f46607406ea6ba', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('620', '6644d67792ef23a40bcea6b83b0e101a', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('621', 'e1fa6e6c8c42b739e3d31b0064a9be71', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('622', '5da598d26abfd8a7bdbf798f1f95d3bf', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('623', '4d811c4bbfa158d06297de8c35a510d4', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('624', '7b2a0a3bc8e958cedc889bf88e59ecb5', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('625', '08d9ccaa1c29b1b86cdd090ba851f30d', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('626', '5eeacfe22303163e8917be5c59dc4846', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('627', 'f34ef1e5d3699c3cf88b95656e770248', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('628', '383f5faed52256aff612a0823c837343', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('629', '3e447fa6bdd79fd72b19ce95016bb247', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('630', '06d3f5f78abf95c47bd036538483c699', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('631', '0357cd912ca4d08c0007523152f669ec', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('632', '282d9c435a1ce5279ca288e93bdcad99', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('633', '5a9fb28256c9901b1ef7eee56fcf7d68', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('634', '8586e75d1b150e0bc65503e1f9c86d0d', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('635', '009b8db6e460e0e26a52872353a006bd', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('636', 'ff6fcc26b43b197e77b76cf4632ea4e0', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('637', '82c4583ab09aa023cce7ebf0eaa85686', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('638', 'af922a2fa0ae77f0aca98686e344ab3d', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('639', '614654e9c3be4b0f5d2fb358d3a29c77', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('640', 'f1bc3dbcb0a6f39c2b4fd64864e2231b', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('641', '975edb2839387d52bbce87ae6297d07a', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('642', 'd3a4e20e2747a44327dbde8589b4c1c1', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('643', '40c65f5d13d9e185dda74b6c2b5bdb9c', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('644', '61d8f2a207eb68e4855f5da4457dbd95', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('645', '66e1b3301af9c0f9708275285d516785', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('646', '458a8c785efe688b9174b76abc8dc5b6', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('647', 'f8c1a9d7516f6325b1cc72c6a1beb525', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('648', '9937be03e4d4e2b83a7f08d90dbae77f', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('649', '884a9fb1bd137d3f46997eacc3b10168', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('650', '8b6fadfda16da992e4148e7dd94b495c', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('651', 'f646e41f354d367f10362f6e63fa3616', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('652', '4ce8074f7738286901f4de4503b43891', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('653', 'e509fd7011aa27f73744c2aefae14109', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('654', '5898641744fe1d4de4e727219fcadaff', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('655', 'a49d627942e51263a3791965ed9159d8', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('656', '574fae82982aeb002744a980539756c5', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('657', '6f32b134eddc5d9d8042a92caf888e18', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('658', 'c85cd57b469bdafb8b0cd2f13987dd77', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('659', '2c6a13f73dd6ae27d779bddcab9b436a', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('660', '05f3210b18c0b0b12b5f01aed2f9040a', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('661', 'fee5a5ef895c682b5df2a3e4337a9f3f', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('662', 'eb26d50f2be6535521a1c4fc3e504baa', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('663', '6b80c017e4937a835d03a707f847c8e6', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('664', '4ccb80b4f1f576e8e4e3962c63034260', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('665', 'ed7658d66640f534564656c37897d1f4', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('666', '8b8f07c0263788461ab3bd9f36b806ec', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('667', '6fd2d182aa3619d7b09679b302cb6b22', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('668', '89b7fdb8c8d85c2166577da4020c5b56', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('669', 'ce815675d8196fb9f605af132f02bca9', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('670', '5d439cf763d38b6ef987a3761b7e9df9', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('671', '61275aa6b2a94a201a411e5460ce65fb', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('672', '6be657fbb8d78d4a11525517a58106f8', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('673', '237eb6b5e3958823f7be7ee927f2cbb2', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('674', '72babc8a4e41611090dc707dbc04600d', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('675', '8057fff750ce8f13d7b3203dfbf97412', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('676', '7d4ab9144b75db16e54624754a5989d8', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('677', '1efee39e45259ba5e7c72eadead3f7cd', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('678', '8666db7ec0523246269d5237dc37af95', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('679', '6e4da9a19b4aa55b6bfba45a63e9ad95', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('680', '3858fde076b6118d8e3defa7b659b343', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('681', '7a66779a409bdabea25dafe06698069c', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('682', 'f586587a46eab0f666181d7ac94eb826', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('683', '27090dc0bfc90a4a636f953ede27db31', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('684', 'c2eede18f4c3986c73e59b2611fe1996', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('685', '56ef7bb8c5baaab8c7ef18e5ca34c692', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('686', '28a603aa73277511132fa19360e866e0', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('687', 'ffda3883d40229720b38b93339919833', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('688', 'c7d4590846e1e7188b8a495ae23e4c30', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('689', 'ceffe2d9381ca8e40b0bf6eb8f45d393', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('690', '11bf58682842a7a857ff83d05e707bc0', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('691', 'c51bc739a6ea86a27e3834e9612e044b', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('692', 'c72e8a5975ceac37cdb14a84d4c02780', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('693', 'a499e12b4b261f308533119191fae6d3', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('694', 'e8e3df6b6076554bd3e86713e64d35da', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('695', '1d3c65ee62a66a3a80d2f090e1da2228', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('696', '8953ab319cefa49294d4e4a09d0151fd', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('697', 'e9e6081f034e3662404ec1d05762b9d0', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('698', 'b2be44af7029d258729799384db01620', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('699', 'b65970b70341add5f9a81f177cd7d928', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('700', '82151f143c9d10862e1649c8650f068f', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('701', '2706334aec73ec4e7f09a82d11dc53b2', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('702', 'bf4cf3fdb3cb5e429888f4cc2de04116', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('703', '272209355ac7c823c52569125807d452', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('704', '5a04682bfbb045f3cd678d5a692c15d0', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('705', 'c435f5cc36ae9c7a7f868bdf49c12ffb', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('706', '42879abc8a3e86855830a0ada6582ede', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('707', '31c6c7198282f44eab56691841d23025', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('708', '37384be8e2771879ec99a61c3107021f', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('709', 'aaa63d69bedd577c63b5163cb54ba03f', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('710', '57067a4aa816b857ec04c2e70acc844d', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('711', '66d0f0c45d0518cef833bbf03f5f566e', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('712', '124f996be31e9196e78ba0e892dd7517', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('713', '67efcb8719f98bde18e674718b24aeca', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('714', 'e6f03d1175dbde4e399d7701285cb363', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('715', '0f1f5cae3e483f0ed3dc05e0a5d2c6e3', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('716', '0c574773e568b6f9861429c920c11b4d', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('717', 'e0a3a42b92327c8b0c7575b0d21332c6', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('718', '7a0d88f165d44cef5805920870fe6254', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('719', '047ce43cf7b09e42eb3634010f7e7df7', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('720', '81f664d650c0f168603d62fc3e93a3f1', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('721', '6dec422bf917383d1a1c3f814a1a87e7', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('722', 'ed034592368bfc923ed016a6e53ed448', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('723', '66bbc05d2b45276df8ee3aa07e4a2c91', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('724', '9f22a8f1d8e809a329d5df092d3f13d0', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('725', '17eab0fdb4e24aa3d7dce0da58149aef', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('726', '7a728342c8d7cebf7137fd95eb7e8f47', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('727', '0a082cc236af45926517f840c2dbc59a', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('728', 'ffe9077282b617ced4a2b91bd145f364', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('729', '524fae5099040849e20b00bf2ca1023d', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('730', '52c73fe695536de2e9c34e4c8658118b', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('731', '77d79f272d0e91e07327753a3b940fc3', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('732', '778ada095e3140ee9c63f19723949327', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('733', 'ca5e0936ee7ec8c3b41ba6cee9d496d4', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('734', 'c36dd9ed7bf8ba067f2bc2e9bc0aa7c7', '未使用', '2016-03-03 11:20:08', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('735', 'ceb4109848416720c547a2550cb2fcfd', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('736', '485326d100c068a6a87d69b33ba52bb7', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('737', '090ecf45e20e66ca1ec2a4f78458ac05', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('738', '446cfc4c04c221a907eb2132706f95b4', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('739', 'cd10052de48d96b9c841d82081ffb43e', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('740', '5a89155fcd78600ce37eab528f41ac37', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('741', 'f8f200a0176f5f23f431be2381266f42', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('742', 'fa43d8b920be97f6d069d8c1f9816b7a', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('743', 'b65894fea769767a9c7160ba42b07a9c', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('744', 'b0a163854ddf5b9d742a8b37014d995d', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('745', '422c49893734150e3a3dd4cb0599110f', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('746', 'f5a86af614491de84f89885465c70407', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('747', '31edbf6100b5b64c986c8ac2d28fcf57', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('748', 'ae9831b88c4129c16d4e99541697116a', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('749', 'f03b3580f3f5da7f4cf3abbd453f0a26', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('750', 'a98c4a4f560b98c9d6193ac29cf615b0', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('751', 'cc9379c2ad895740ff4fd23b15f47cfb', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('752', '3e7271dbc1e8732ddb06e53fff176efc', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('753', '582a630b9b12f7f5fc89a52484c814c7', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('754', 'f39d59234e51bb9e59722633d8dee601', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('755', '8705bff2a91e13556685e3fdaea1b34b', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('756', '7819a3145850d77904ee7ae0ecf76fb0', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('757', 'f8448b48b265ef3dd376bcca0122180a', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('758', 'b40bacb009c01b75355839c892402c4a', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('759', '530f931b6ff0baa7f820e1f62dbbb4d9', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('760', '50e00f3d3f13de32939100bcb8e45b0c', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('761', 'dfca952987e60376692508ed8dd29ea8', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('762', 'e8b6b4edbb8123b4ee72147eccaf3c97', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('763', '93b3a36f751fc242f2fae7dc81043e9d', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('764', 'd5e993e86cfb6635cf9fdae41f53eed3', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('765', 'ea7ec336e93f2b036a08f95bd8056c6a', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('766', 'f3bd9a887caa78fe513dae5cc09a353d', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('767', '3926cd7bb8dd905929d97129605e92df', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('768', 'e4b99c7dbd77d6716fe18de92e46272d', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('769', '773f35424f9fc64d5d12f6de88841b4e', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('770', '975ebfa087b2f4d956094fb3c09da85d', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('771', 'd16686660cafbaa785e08773505262f9', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('772', '9b535cdcb94196a9e56cd0e1987716c2', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('773', '37f7e01e6aee0e7c0c4c4bc2ad977137', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('774', '10566c383d9fdb2c1b5a81e2bfc14b72', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('775', '5d984536b72a08ea0b215c17bd31adaf', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('776', '63696d8a68af7db2c97675b2897658b2', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('777', 'cb24f690bfd9dca8238394e8eda2a161', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('778', '69947b53416f7350dcd1cfa4087a3fd2', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('779', '5729145fd3a153aa2cbaff4571db45c9', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('780', '24b1b1087b2b7d92ef4a9f2ef73f2ec3', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('781', '5a466e7d897ad592d446da262142c6b6', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('782', 'bf47a77a1d22e6f3543831a28b9655c1', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('783', '9d8430ba612d1aa71f32fc196a0c4f8a', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('784', '4cf719dcfccdcd48f0409637662f62a3', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('785', '193f54c0a826245cb9e8cf81f05ea9e4', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('786', '718da50a3c5137c014bf4612bed2cbc5', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('787', 'c28af13edc802d316524358fd09a3071', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('788', 'f2af2a723acd28dfaef204705ae24ff3', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('789', '10470e3e6ec15bf0e5ec1948379c8a5c', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('790', '9ed33f104fd5db72ae27946936042c3a', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('791', '2ee53a1445597f588db08d7f36b72188', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('792', '1417ef22ff3d3ac3304e996c3abb23f7', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('793', '8d41b984e1b5f256ac17904d195973a7', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('794', 'a936d751d0754a1baa5749a2f03ef266', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('795', 'a1883a6257779d3d6b1967bf525f6f74', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('796', '5eaf00215f46a544e44705e16ef7df8c', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('797', '45844229cd194ddfc5cdf4a858c8f406', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('798', '4eeb73a8422dfb6d52e550e78ca9d969', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('799', '40933e3140a16500d84c1fdc25f1a939', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('800', 'a6a73f6a36840ddfb26a9c65fbefc70c', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.10');
INSERT INTO `xy_url` VALUES ('801', '9f6d031bea093caa612e08be8ab9ffdd', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('802', '6ad3a999db8ffb6f0718bd65bc1d6f81', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('803', '4da42e5b5215fe61586043c57908071d', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('804', '587ae5d9dfdbbaf2471af3209b21822a', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('805', '47af65de37bd9bfeeea048a2ac616453', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('806', 'f58df0ab046381f2db1a58ed487c7bdf', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('807', 'bc4886cf8a5e4e6502152d3bd9764027', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('808', 'a0d7b268abad2884f383089b856bf4f0', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('809', '33f1f724fec51a8a07bac77105104504', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('810', '0a1f4a94ba0a263a5461d0d66ded17db', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('811', '85ebc2eac42689d9213d14e869258075', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('812', 'cee62976b387491d76b4d4186fe46d28', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('813', '67659cf401893b02dfc43fa90f42a28d', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('814', '14ac07662f61d4459eb767deb8a2a8d6', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('815', '9515554c8a3b476e7a9a9d3fcc79b088', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('816', 'a2460894e7a39ec7ff076235aa2876e3', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('817', 'd716e6e683a263442ad44b10e62c15c4', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('818', '735b0a96cfad0769681a9d3f159a8d16', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('819', '5071e5897f87bf6e7aaf949635974150', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('820', 'd36f4f7bbbbd79d836052c0a89990127', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('821', '94d1bd09e2c5fd2a3b854e26e6acaa64', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('822', '1a9744354fd060ffc4dd0366db1cba86', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('823', '64939ee38b60a000d7ea720c8c1c4178', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('824', '247fb638f0375e11351751da02dad032', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('825', 'b088fb625ad87a806a569b53e22be400', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('826', '422a2d1ce41c2e812c7d20fdbdbce916', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('827', '1259c5a3078f75cefecbde3b3439e78f', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('828', 'dbe651b499da0187c7ef7687a2455b18', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('829', '92108283235c05b272c6c35c9b6f0c8e', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('830', '2102bf00ebd1b390aa3e6334a4ea25cf', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('831', '75383faaed6b9f1022c922eea6421aaf', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('832', '50eccf157c03d8c6daf7c14af4498082', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('833', '5afe50ee5cdd0c502077277b256e5c8e', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('834', 'bd8c8dfc85e88bea0b788a8138995cb9', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('835', '59985fd4c512ca4e91b1f0660bd57853', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('836', '3bcb2498d82e64a6cfb49a9b0822a14b', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('837', '6fb85c867618ae52dca280271461226c', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('838', '370f67abb6231dd91075a3ae26b5b8ae', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('839', '318c7441f2a0428cd4fc8c7acf3ceb85', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('840', '898cc16003a8c4132af5c3e4dc46c0a6', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('841', 'e25e20de4090d0ac7b25a3f5ed7f6236', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('842', '471fa7055882087823f37fceff2f3142', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('843', '4b639f4c7d16759433647eb28a9f515d', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('844', '56ef89a8bfeb6f6676f8d79de9454e8f', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('845', 'a787b36b0002d53f76eef7c1080ddd10', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('846', 'd0df79664b6877d6972278e4b2a095b4', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('847', '0b278a9c5d5f97207acb889e81a8f691', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('848', '46b38edbe59b7429e2c5a831f5c73d7f', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('849', '08f5ab2bd53ff1cfefb2869c8399953e', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('850', 'a344c3b3a872e86557a6b65460423b31', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('851', 'd76515637762260e45240ff9120948f8', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('852', '85e315bdbc5a66ee4a894fdca890478e', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('853', '21319feb4bbf3979f9e46e0c97fa4773', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('854', 'c75fc7d031a3342805f3cf87643596a6', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('855', '2319ebe99bc0394c90937f301955e5e2', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('856', '041ad1ad9ff313bdbb3eedf87b988b9d', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('857', '09c12faf5792f73440663b0afc8f454a', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('858', 'fdc87e91b70f20e6b7155aad1be84c78', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('859', '45d29b3d115f268c75f46fd6f4d4ac25', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('860', 'f3ddecc386f7ef9b1cb2196ecdd3ae86', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('861', 'bee9658c37232c97aefd2bcdc17beb0c', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('862', '988a46dbac1aa3d3bde762fd145c03ec', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('863', '62f693a1cbbc526f5ef704c8d1511416', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('864', '6a785e3fa33b11f92d5f84fa3e6964d9', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('865', '2930423b19661a01f3ab6874e126c18e', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('866', '077e268799d0adf0049687bba4f4bea6', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('867', '47e493f1317cd9a34519fec81d1448f8', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('868', 'ae766832056026c235868e5277693110', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('869', 'e61396355dfc06e2c696b11ecc84f91e', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('870', 'd95ce868c8e772356c1b70d22bd615e6', '已使用', '2016-03-03 11:20:09', '2016-03-03 11:51:47', '0.00');
INSERT INTO `xy_url` VALUES ('871', '9196fbc8210e03f77312bcf111ed8731', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('872', 'eb6cc2faf5e8acc218e6ceac7a2211e0', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('873', 'c413672e5007f9e1de294e0696e8b7de', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('874', '1f36df38b975446cb6c0ef3934136bab', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('875', 'cf06d2d0400238117f5b6493a4b52957', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('876', 'daef08cd29ddd6aba65dd446a85ec36c', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('877', '8a37ba72f535faa4666d9ff2e3be2b2a', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('878', '9d391e8100ebc200613e96c09535dce6', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('879', 'df44b63ab7add97b69bc34dfa5f8cd92', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('880', '362b892ab2b18adf2f052ec16311b9e3', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('881', '216b4e4654cbdfc75564902e2713a83c', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('882', 'c7f20bc8efcde2f72ddc369a8215439d', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('883', 'a73c45c01500585429e68580de3069e5', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('884', '34e81420420702d67eb35dec3864e50f', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('885', '23e3d12f3fa13895e39c0f67f159547e', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('886', '01ff1994e2f7e5e0390d671714570637', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('887', '49a71b3f0bd810e1bfd643ce39ba535c', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('888', '2673760401c88ad6ac9450787b8d9611', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('889', '6d84e60e77266ec7ef4ebaef7c061bd0', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('890', '32a75e8fb21e1a9aed8a051aef335cc2', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('891', 'c2d38b06cd16d687609d69d036498468', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('892', 'a43cd25a985075fa9c4db8895124032f', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('893', '50aa4ddcece9fb87e690cc58c56fb340', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('894', 'a482dcb8d18883954247444528bdf2ec', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('895', '9b340257a768f41ef502d02c62e26e85', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('896', 'da66f651fda85e25fa1f009613682d44', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('897', '161d47fae1eae452649c726bd7944186', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('898', 'a6d5b5240ba6f91bf2cbfaf9b3018668', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('899', '6a802f90328507bed9941b1e719dbba6', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('900', '855e44c9b24b6dda3b14b16dc0412193', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('901', '5521ede420853e6bab993e05933d0792', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('902', '04d58016adcc40f738f9551338590804', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('903', 'afadd36c07726bd08329d2e04253023c', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('904', '002830905c92a4393a9b46dabf512baf', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('905', '297ca49cb94a9b31d8e552d9bffe3938', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('906', '05821b8cadcb74b6e26f922f61f66887', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('907', '6b216234a380444b7b8aa60601bb365a', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('908', '7737a98cbc62b843c90c1bbb1aa5c40b', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('909', '5007ebd30fc171d92941331d6f5c2e6c', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('910', 'a5995f47f6948cf994f8e6ce3a765013', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('911', '20c9ffc92516a5b957fc44b46b3380dc', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('912', '45ff30537edd9fd31b5ab10e987179c9', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('913', '566b5513e84595791cee09f1edb40032', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('914', 'e22eadb2bf4f74810d522c1570b357ea', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('915', 'f5cfa717c61938de5c238422fcbb1f22', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('916', 'ec146d90a181c64547cbb84b5a970f0b', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('917', '9b9aa3cad75075b9a5be2f736ce1cf2c', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('918', 'db0ae215fa85525329bc9e27026c0990', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('919', '541b66345c59db1090b658228f5d7f3e', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('920', 'a842361b65218208827520e245b1152c', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('921', '645c7943b3ad2e8a4b86dc2d243b96f6', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('922', '10120fe38b15d4df04f81feccedd19f3', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('923', 'ba2f673e22486966f9c04b17a5ffd855', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('924', 'beb776dc5c723ea450de25555f62557d', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('925', '891b63c454b3e45704e31779356ff61b', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('926', 'f5b02fe3e31238ec1c3f863f0fa4a048', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('927', '13e948a9558b3ff4674c87c99e9d06eb', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('928', 'fe42d3d82dd126a150484f98d32b5ec2', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('929', '5eae2fd4c87feeaf7ccb5891e8dd07b0', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('930', '378e323ffff4f507847e137b8d4613a6', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('931', '70a7c45c495e19f9f9c10e826d0c3d7f', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('932', '7d4b177a6aae31bd5073c6381397c571', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('933', '7fee57317a53688e9cd856a8d8b6ed95', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('934', 'abdae757877557ad0cac51ef2367cc41', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('935', '7764acf5f7fe3b48ebe9c0f13c91b64a', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('936', '1047d6d692cc5b6278fcc92482e9f6bc', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('937', '995145c5e00cf44e46398b0ddd5d8f16', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('938', '3a6efeff1738aa6438c23c5f0315d02a', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('939', 'c888c5b53a6d87c49648e92e32ce5484', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('940', '37f05fd2f7af7330e48c43fb28b7d2d8', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('941', 'ff9fb3c436d71da471f3ea4019933539', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('942', '47bff7c91dc7e8f7efa76bc15a402cec', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('943', '030623602d8d3337005e3f57d627f57a', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('944', 'c21a399c82b5e9f2f74248dd0c5ba558', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('945', '019a80e8bcf2994e55f23ff6a8e89978', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('946', '134a6b870e8a9b0070ca61d7f74f2467', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('947', 'a853d2e2d1d9c6a71d0683c1b2021847', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('948', 'bbfb0e8feb941e3c4b16b53b8b0e88c2', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('949', '99a21500ebd8866a1800682b9dbd39d5', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('950', '84fdfcdf3009ce1f703cd790bb5ff1a6', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('951', '2927a156a98c394dbbae99b638aab45c', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('952', '1ba9dab63a339e056b9ff838c0d5de6d', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('953', '7d95bd4cbcef06cfb41ee19c653de9d0', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('954', '657fce3cb3d5734321498dfc0802a70e', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('955', 'c7c4fcf362ec8981db903d538de62da3', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('956', 'b1250e1babf5065d333cb7df978d771c', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('957', 'eb2a5dbb9bd245cd1ddf0a210e55ed7e', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('958', 'd9fef0b957b835cf3291173e1f3ab1c2', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('959', '22bab78c352e07dc194813cbf069db8f', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('960', 'dbd4c40dc01efcacd068244110f18f79', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('961', '996f3dc76f4ecac6e3159edd4240df89', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('962', '5385a95647c38c656d4c639277a4ebf2', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('963', '0945d85d8b416a285bfe466264a46d5c', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('964', '3aae59f738c211672ed7ddd9b02b7ffe', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('965', '48d775126dcc91d2564577d67a5ed134', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('966', '07365bf391a31521f110367dcf6c0078', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('967', 'f61a2648bcf9a244139401187ce58ae4', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('968', 'd8f3055fcad53441fc0ea0645b4382ab', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('969', '2ad64d10df4b648e610333f6bfaa87b5', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('970', '5b9154da883323a62fc8c03dba8fce5e', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('971', 'a16b05234e1ce694d8a5f29dfa3ab8b6', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('972', '0d4ca11ae145f126a05f455ea60d2d92', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('973', '86b8020c8d4d69dba77b72268eac1c6f', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('974', 'c7cc8fa5e9b5759c528eaf94f7e14692', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('975', '3e4535993890c2ed51dece9a4914aa26', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('976', '5c8a355f210c7fe0351237208a6b0c60', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('977', '6f033cedbb2710f5821beee2771a484b', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('978', 'a8a19a04681765386ad89b16902ebc50', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('979', '947bd7e8e6af26f3b1cce9e114730329', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('980', '6415c2413df79276d132b36e8a3f41a1', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('981', '662b54530bec939da0c754ba15cf7ce0', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('982', '7244009ddcdc5f2819b4ec03f867a1dc', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('983', '6dcdac8f47da5a800527edf28dc44e1e', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('984', '382fd66ca4f2dc37653df90f4a4ffae9', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('985', '26c45a7f841eed8ed0762f531af5c9e9', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('986', '2b3808998a61afcd76c3e10a0feeaee6', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('987', '8db4cdd307ec04915d814365abfbb389', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('988', 'd895bb8ad989bed2e199ea1dca051e94', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('989', '380a6a7ffff8ecd6e80830ee9bb3f20c', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('990', '35ea3ab3cc7b8a321b7abd3094037897', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('991', '3082ced697a80edd907c49071a9815f1', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('992', '980fe8fff2b84c09a2a31d129674fa4d', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('993', 'fac3c69554e02014ce65e4d1879f2079', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('994', '71ca598bb4b755e320e82eb366dc111e', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('995', 'e6f14986b1f768e2816590056385bc54', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('996', 'b807f1abf217bb4ba7c72e5fe42a86de', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('997', '011ef4bd7d5a98c6320192cc2e37657c', '未使用', '2016-03-03 11:20:09', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('998', '952492d38999d5d580fc1f2236019d6f', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('999', '4bc4b5663025cc21f2447183c83c1782', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1000', '0b824490f1fbab907463418a3e0efabb', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1001', 'ec81560011ec28b8ba8117fa83590f05', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1002', 'f6b53ae5f21090b07dfb5c2049e2af1d', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1003', '0458b90749c02750b50e00eb8764787c', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1004', 'ff92bd11b0cad1374557ab497ac0a043', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1005', 'd37039e3228418368b3980d3bd4819ab', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1006', 'd9d2cb3e326cd6e21f9fa587ff131bd5', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1007', '2e54c8b65ebd592e2b726ef8b79fcf52', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1008', '740b520f33274073437ef8073cc9cec5', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1009', 'd773d1d4a758ca9dce718ed8bbaed63d', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1010', 'edfe5765049066fa84b1fe620de8ce6e', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1011', 'f2cd668dcee5855273cf2713ab8ef559', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1012', '030cd7c113b78f61da048fa389449a2c', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1013', 'bd3ad37d1d776de7c67c03221af34599', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1014', '07a9478f265785ddee95c64a1f5464f3', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1015', 'aad582290a65ba9c1e6f9d7b4dfff8aa', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1016', '6eb760e6f00dc1a6201c6f9aba324035', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1017', '6dd27a6a790e10a833d4dca6fed08fcb', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1018', '415d902401b7d51ac711be4c42843e01', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1019', '803a9a10bc58a39cc9fd20f9a13ee79b', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1020', 'a278f2355100e324d86a14bb37a27e3b', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1021', '8bff26722e5817786cba2e790a2c9c24', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1022', 'af08a3f5373527d8eb26a64c1bd52ab7', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1023', '5877c22265321b10597082833cfef3d0', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1024', '3b0609c430fccff8763552862f70219a', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1025', 'd724001701720b4d42081b14452bfb78', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1026', 'e09f246ea592f0941d135f6e9d7af77e', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1027', '1a9f06cc1d151952e7001022d333da37', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1028', 'f31905a5bdb315618243d40c5c51c52e', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1029', '730374041c50e6c942002a35736cfdb3', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1030', 'a97d8cf5e3bf6d5806f1b251cca50fd2', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1031', '6594e2bb86abaf2dab8d20366a4696d6', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1032', 'd8b13b2e8d77d4b1296e4a09d9f769de', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1033', 'd1f34e3ae80e40d019ffada382e423e0', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1034', 'a085eeac1dd4db5476a6d374a3edbdb2', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1035', 'c6ddb60424d63995ec5112603455d225', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1036', '0e1aa5967d9804d438003722344e48b9', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1037', '957597d53e1493a8de1d2f7a85cd9dba', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1038', 'd3f2156feaf824ba1f9db6f70264ee67', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1039', '56322f70f43d45b249b283eb3af61fa5', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1040', 'af1435f385dcc3cc4a7c6572bf3dc054', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1041', '8d71392f3b798ee912adf96a02c52600', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1042', '7e53b8d5c28d50dc4725030f84feae84', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1043', 'd122723f036cc37616cff6aa704fcdb5', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1044', '5bb139eaa70acdc462d0d06575f5bf05', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1045', '8b783373bce5839ff02a7896e0176397', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1046', 'c5f543ca49a21a5b55d0b45244debca4', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1047', 'f59ea6d204d7de23538e5596c760d41a', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1048', '09da80ddfae7d2364ddcc6a65f1ee3bd', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1049', 'ab28201673fdcee30d8107e1ad851abb', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1050', '30e0deff915beea2fa497918f9bda952', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1051', '96e14f38422c3b53219ea525d8560caf', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1052', '21c8bac9703f7edc8cda5527d191b853', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1053', 'de583c3f7af0940addbf035371dc576b', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1054', '62c11012033e9815f24f10a2d37e3501', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1055', 'd61380520940eed45095aca0ece6719a', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1056', 'd1bdf5e4e1f4d45ccf068b27d2fcf74d', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1057', '77ca3874c9b43f73869ee7fa90418157', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1058', 'ffbc1252b043da74ec863ae39fecaa58', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1059', '16fe57e329887a0aa39c1e9f27fb1eeb', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1060', '93fa2671d91274154829146142c955af', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1061', '179c1eb2b268e4927b807d183fa5255d', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1062', '1ebf0aa4e249d461a1c95bc72fee2b6a', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1063', 'a38da44ea78bcbbcf49d2c1e3d85e75b', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1064', '3d51301da01ebf02426fee2041d816e8', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1065', '6a4e0c626d512dabb4b5887dd923d6a4', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1066', '10d1ce4502bc3abdfd739a22a01566e2', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1067', '613f46fb511f04a1d16d9637802ac169', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1068', '8ee45dab8e1e16ade75b81da63b42d43', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1069', '8f7651cf77b846bd93db3eb3f3d04fc3', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1070', 'cf31ab131e4c4ee85580cbadb64a906f', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1071', 'ff1d0cbf995e77506d6125708b359fb1', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1072', '8b8c94835e521adaa5e4beec399a1d77', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1073', '54bf4c9aa553b78c029289a77e803bac', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1074', '36573df9d34e928106e909222907a023', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1075', '4c4f8be219deb024b053410ec71200e0', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1076', '9cec7237f8b0be4adddd0dde38557834', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1077', '18da1532f8898b48bf02d8b59464e05e', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1078', 'fbd2f5db9c539d91c323cc4cb060ddf0', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1079', '46ee18f2d5732d6c88e03c9912d0d5c2', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1080', '97b6f18869f01c1a545cba62d9c197e1', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1081', '3733e056785272a85ccb9a3cbb5a7e91', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1082', 'adc30e157002907bf782d340198ebb76', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1083', '68231ee191954db91be1f4d7a869ca8b', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1084', 'fb84210d66a79bfbb54511affc59bf70', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1085', 'bcd6249d68c06131fa919a57bacc36f7', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1086', '16fae05c0dfef49adca1feedd9069d9c', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1087', '508da8a0fa54ce4eedb8b8dc6954df61', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1088', 'f9354cab7533ffc8ecf92e7218ed7b55', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1089', 'ca0dc48e5c944378992c4cd6544b4d46', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1090', 'cf0115550ccb9e28804e61e9b89534c9', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1091', 'b7c77ec6dbd1e6d0a10407c8d7d52d79', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1092', 'b457185831713c42d27b4e7711c8c088', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1093', 'e2660672db5c170782f5f555b38a5e94', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1094', '7e096a680d88fe42437f71747b0091bf', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1095', 'd339776d85aed61aa3a933cb00d4e68a', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1096', '29eef7d1c31ed1cdaa51a837a6008a1d', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1097', 'bb4626361ac68e9cb06b54f5c2ac86f9', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1098', '35efb15761496d9ed4ca93a7280e9a67', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1099', 'b025b6570dc45c9c20f1eaff092f06ca', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1100', 'e49283f8ec67ff3a3fd578ad4061133f', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1101', '41f6be83730a011f28a6838012c775d9', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1102', 'c221439662bdf6b99e4a503a783a8ae9', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1103', 'e6dd5f2651d2df53efaaff41b208301f', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1104', '99d0b7b17ac572f17e4e15a145d3ed11', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1105', '3eec20aff1986dde928305d383d49248', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1106', '87d6460444a5ceeb7e56b6fed41f5abe', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1107', 'd686deffa0183fc857930333817851cf', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1108', '17c542ec6781b92658ed6ee675748a36', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1109', 'd38cfbffcde73190afd57e5baaa7a897', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1110', 'b10da6b6807c47631572257bd4770f09', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1111', 'a28d05c8d9d3003149f3fd0b87e6b57f', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1112', '1a6185fe419ae0dfd1071ed83a2c16b3', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1113', '5d9d9a8660557a9876d141a5696dcd62', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1114', '36db3545ff1f77b239bf2f237c9fb468', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1115', '0dbf52117dad2efa79a5d855713e49c2', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1116', 'a24e1e909d0e9f6bead6d44fc3b7c3c7', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1117', '2848a1fe01201de6f86b616e6e1b5498', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1118', '1e3b701a0b55d63b560dd1792fe1673f', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1119', 'ff50943163e919ca6a8889ce03cf721d', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1120', 'cc0bb8500787426e5b5286a8bed4001a', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1121', 'b41654770c029c650dbed6f02879a03d', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1122', '92af4a96d4135e520698f3e88ed8d85d', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1123', 'c7c29dfe409e29bdd4d75b673e53e3e2', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1124', 'a2a1b0083e93da3c779b6ff4c7f08a7d', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1125', '7fe710cfa1ae6ca5374330e796c09c43', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1126', '53fbdfbc2820c85abbe1efa3eccd0ff1', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1127', 'd424d3bc9708893ce16f420606b1a352', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1128', 'b230fb1cef6d02d5471ccd833a184fdb', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1129', 'f7ab7040827aa53061b6006dc2ef02aa', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1130', '405e39cd96594dee6ff546ddd982b95d', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1131', '900dabcdb8ade3fd07f2db0692748f25', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1132', '142c5d89d5f463636828ad60de8fe1a5', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1133', '25fc75a93cec9d2975c5a3635af111d2', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1134', 'aecff399a8177c2d13d5b2456e9dd9a4', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1135', 'ad558e7c6ebe3d79e96c2520f2da5a1b', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1136', '713c8815fda5fb832be01f2736627145', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1137', '0c03b6629b5f660c0bfabcc8018d210e', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1138', '27fa04c286504bd197515e020cfced01', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1139', '3843ce3fed3ec4216f95064ee015f7e9', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1140', 'cc23606f5c959e1acdac559daa5188ea', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1141', 'bb9a0531c99f4450c0ec9eed57ce547d', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1142', '308d30994e14852fac86f5842cecc3d8', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1143', '8145e49228a1d5169aed43627dfbca9b', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1144', '44b68ddd9a4735f59fca6f3afc5a76d0', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1145', '502e5624d37b55dd511b873a9013441d', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1146', 'adbc70da5044c2614e474e4a0b6f46ca', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1147', 'ca57baf9becbf367506779b73521fba9', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1148', '27be77e62c097e17ef77efa33b55d78d', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1149', 'eac6a3aaf7f4ed6e8dc27f4931b2647a', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1150', '7991f701a8bdbbfd6e9408725fd71159', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1151', 'b325b1adc98571db92ed6ba4f20ba8c8', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1152', '63bfa4c7843cd541c36a26c452491bb0', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1153', '250a418cc20887e74b4fb008ff14184d', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1154', '2f5c8e074fbde6a6627468af6cfa2d3d', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1155', '091ebc15a3c03092f9dcab866a6835a2', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1156', '9f04dbc1dc9f8528ed88fa0b444e3a58', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1157', '8b75a7ded0ae413987fcc9b3b5544a48', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1158', 'b70b930b0b5db315e97e76b800b9ad9f', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1159', 'fe5ce475b87cd0e0c3cfed970a9da731', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1160', 'd9edbddb1d6839834103f7fe6179016b', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1161', '95bbffc878316640036945305bb7d2b3', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1162', '3c9c46d8c5df7d729e42d947ae824708', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1163', 'b2a63c1601c9f008e14f90f83890f93c', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1164', 'af2093a29c85a4e95c5f7769212d8acd', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1165', '71019df37da4ff2a6bfaa47f00bfc9b8', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1166', 'e59e916682a36ce88e155bcbf792628b', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1167', 'f20c1eda4e126e82fb151b1459ed1736', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1168', 'd741710023380d26af6f963dd2079bff', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1169', '4affb1ce03ba5b757c2b5c6ba79eb743', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1170', '9238facdea4e1af3500f01f478ef055a', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1171', '22f80facf94db64268a4c26d2826abed', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1172', 'c4a0020d31c1703e1db989118ab24bda', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1173', '36e8ee3e7a359491ac392ddb66b2e29e', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1174', 'ad58067105204fadd6c110d484844a1d', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1175', '5e0c75999be6853b1fd316aa517bfa95', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1176', 'f6460d083ac8e6953b79c757074b5cef', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1177', 'ed6bb00b306239ed8e81840fdc268604', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1178', '5bdbd79d3d56be23f04608139bb53f5b', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1179', 'e54158f673ab022acb8a1aca4ab7faf2', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1180', '61788d56eca7a6d3f3b65eb38a00a7ec', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1181', '7b7f82a6634f928353d7bfdd35d553c3', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1182', '234a125684087deddabdb609d6443ca0', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1183', 'b6e5952775ae09d94cae084e76484b48', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1184', 'd57f5e3da69aa6dc613babe075bfc242', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1185', '575d21e9b200b3953c42a14bd93ee34a', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1186', '2cd899e66151fe0b23e386c1f10fb67c', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1187', '41c3fcceed80b1d0e1d3add316b4de6d', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1188', '83406a56d4bc08c3075bbf53e174d174', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1189', 'c0c063a6e673a30a30753978e12bb731', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1190', '398afc3a90ed3485ebca42d721fc2195', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1191', '29ff0223f1ec14f25db534b0731f4be9', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1192', '9981dc7dd7b8d26895fe7ad7c7648c73', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1193', '315c0a13f710a0c245306ca0e0cd98bc', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1194', 'd09fa1ecd26b934d5675d5740964717a', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1195', '4dbf96668270d946e369c979167b4cc0', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1196', '7046b5fddbf892e44a04555996fec3d3', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1197', 'd7a03179ffa2a87a1306f65d26c40274', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1198', '0baf457626c091d6de629a05dd8b6ffd', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1199', '489a3852f5f57401a509c97ee04bbc79', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1200', 'b91392afbe7bb70501b1ab4817572048', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1201', '5bed2814871fb592f9bee70b27d5c150', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1202', '1c1571aa6b16aad796082a13e4091f9e', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1203', 'de4997c09b2ee4c7764224c96d6d6bdf', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1204', 'b3e362d7be6f996c9cccbff59f9a6e13', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1205', '4e6e9f44aaa884a3a8e1a26a08997338', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1206', '654bb882777ff014c48619351e136c02', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1207', '5dfcd1ebe137b1ed5e4a2b03be134d4b', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1208', '13b51978b88f9445969dbeada7835814', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1209', 'bcaaa6ce102aa39b8840a0aa85d481e7', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1210', '35bc2a1c3a5db68ccd4237f52f24a2ce', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1211', '036390d30da8c5f43d5ac9b569682aaf', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1212', '501a0fb0f2b7e40549562c7f5c0d0bb5', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1213', '1458e9d27a6f36502e96df5e91f94aaf', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1214', 'e670586239cad9f7d75608da05822d2f', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1215', 'e9a46ca26201d713c6d38fb778f05f69', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1216', '443b78c358d44e23383a117972e68381', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1217', '326035811e1348942bf952449eaee803', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1218', '4df6db8c1b5d2a07f9b3ca883633ab9f', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1219', 'f6e51a1616214e0f4b0a064b028b33b9', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1220', '7498c37fd9005d800f26d56ff495765d', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1221', 'c06d3f7d7f4f7710ddfa9f650144abf7', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1222', 'cd3c4882b213c47f06bd70bf15ead721', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1223', 'c2ab5e624717b2b7afc7d4ecbf35bb55', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1224', '5e30e6195fd65013952e6673374877a1', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1225', '06b7bd40c129632f1e01fc9ae67c8641', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1226', 'dafa15dc7059783cfcb43ab412fdd19c', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1227', '462896cc3a6452be43c3fb3a5201c54d', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1228', 'c9b13f472e415f6fbdb1339e609a06bf', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1229', '1fe094c7ebaef5e416febbee6d62614f', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1230', '6187328c498fbd9e17840ca16bdc2306', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1231', '279aef7c37f099a1d4f167de6ddee903', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1232', 'be444a2ffe633d5d68f8b6f971b9f6e8', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1233', '88ac939925d89c4330aef46c3b44cfa9', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1234', 'd71991f5d643469fd845fa4f7d4b0933', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1235', 'e35c45a0da2aa1143b87d3bb8d740c9b', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1236', '242508c3dcd972f43282e0c75a4f74a4', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1237', 'b33d22d5ac29793952e211057a716a7b', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1238', 'bae61fd8f395bb8e71cbd14935242785', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1239', 'abd1bb2e3a19342626e290afbeccde47', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1240', '4235409e30109a1959188abe1f3c36aa', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1241', 'ed441e25a114e96de8a0151bfbe230d9', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1242', 'd2ccfa8b338faadc060745199d167a9b', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1243', '8ac0c3b31b2c6ddee3fa6966386212d5', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1244', '8a43e0900594867fd11c340f3f10bfea', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1245', 'd063d64217c6cf8d22315499e9138bb3', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1246', '0674d27741a8c43f380428f5ebe62395', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1247', '0aca84cc2adfebc0cb0301a6782240a6', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1248', 'be6255e5b8534ccd4cec0b2158304a90', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1249', '6eaa6b5808e9dcce86feb19504500719', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1250', 'a164ae9effbbbb98fc80d33eb2722005', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1251', '2d42e766f10549f6b7347b0ca7e7b0c7', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1252', 'ad953904badc110366c2b15330ddc672', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1253', '1428f83344f04b45ead5e0c7a14df86c', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1254', '2dacfd65d78ecdad7da8793078bee5da', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1255', '8d951efb8b822c8f434ad1f3347e627a', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1256', 'ce87d3e4006e7c5504b948f8b08ab46a', '未使用', '2016-03-03 11:20:10', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1257', 'ceb676aca9f16560e090360c958b88cd', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1258', 'e9cca15bf2e0dfafba533252381331a1', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1259', 'bc93302c22c3319cc52e18ff17a375af', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1260', 'c2e02ea3820ed7333bf704e65f4a3598', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1261', '631d796160f94237d73ad9b88fa66720', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1262', '89acc96062a7cdffc8649ac0000c0ccc', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1263', 'e1b43be544825f20a0484e79efce347c', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1264', 'ea44b830fb43181a311b4d37f0da8961', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1265', '885c4ba0851e61b059cb278b0cb89577', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1266', '59d96465616787f295a470b6d93f4487', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1267', 'a1c89af4bad69a63462dd13326cb43cb', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1268', 'fe7a34b36da7a51986ca06f601be3d6b', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1269', '2766a35871f2033fad8781ac30c00dc7', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1270', '72f9f9c37b36080c9114df6bddda2707', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1271', '93fd5fbcfff2d6b5bc92aac7aaa1b96d', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1272', '14663842b1c8373e9dfaf5e07b0cfc3f', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1273', 'f6aa1ae7c8776f9ee8f70ad172f6a8c4', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1274', 'f07c4c5d51e0d5b2dfe6e4c0b9f1b11d', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1275', 'ac5dd9b66f28537a5f59d9965337fcbf', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1276', '62e08a92d51013eb6c20d3575f4bc724', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1277', 'fa5ad953a4e43de4d97326a7628647e1', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1278', 'dd5352ea38061a3472eb7ba944109dda', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1279', '770be13936b1d1d154d74673915626e6', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1280', 'b8a92c280384d4e2b4457351c3bc5f1c', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1281', '3a6e4f676c1744eb971be0b03f1ee64e', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1282', '0d556866e0ec1ce8caa5b9ed50f7e70d', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1283', '2f86d745a97c4e60793bd5af7ad98a27', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1284', 'a2fd0c16c17d9a87a8cf4b81ce6a0d2d', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1285', '5aa47122f59f97642761022f7277d64d', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1286', 'd7febf322ac4c50bd84fd95931e1bd2f', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1287', 'a27eb17cc098f0e6554a418cb283ee82', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1288', '0ad616a0519240973cdc0610c2f90c63', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1289', '769ff0be0cd545df45c327bfea7b6a7c', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1290', 'cee46cc66678a53df04c8d66c7ef4208', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1291', '1c8abe3c52000bf3f0ef56debb0df131', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1292', '799ab3d4fac73edcc570b4b0a85066b7', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1293', '4ff9f6564f979543ea29eb7cc0a54895', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1294', '1b27c1742dd25ad0afa454d5975c8ed9', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1295', '94ef585b77bf41dbd0f280f5743def79', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1296', 'b7c9a699c3c16ab059471e9a2a0fffeb', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1297', 'a7c9ff93039b2be93021ac6e36b16baa', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1298', '4913c2251de03f13bfe440957fed90eb', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1299', '46e079b653dac69bb747b3b1b1ba3ae0', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1300', 'd81c04588474526bd29a346bc0e999b0', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1301', '1caa0f8a4f7aa0808b8db230e12d7e74', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1302', '2952946914dbfca8813ed0a0b1eabb45', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1303', '5aeb02489fd2d883640e0483043030b3', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1304', '28b1a4fa24f4bd3944d1258a105c2411', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1305', 'd9179416369c000c009d52759185a14b', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1306', '1926ab511de82c1d134fb36d465945b5', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1307', '729ca2c8d1cb1e631faeba135376f119', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1308', 'd02aa66902429ad605e69e46e7d658e3', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1309', '656f7884ae73e9513c83d33d8501f9a8', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1310', '8cc76c368a3347c5660d1082cf6784cb', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1311', '2e7bab6a532329129f4b9568cbf97073', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1312', '899ed59b459f24a6facc5af024b10f35', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1313', '47919a6d35793b9d795dbd2f96f001b2', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1314', 'fecc652ca9b2687e68ee60af053d5d7a', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1315', '14b1c3fbe4815a6e8d08db88b12f2b93', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1316', '91a877b1c5625a9a434dc1d341e5a71b', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1317', '34b9b49c6b98a30c9f53bc106f61c93b', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1318', '5678f72deb4840376c5aaedcf5b1efd4', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1319', '434c95ce971074a39e4a69a38f9f5633', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1320', 'ea523faeb229e911efe67de213ddbbcd', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1321', 'e88abad8fd83c0cfa8f4a8b5be989c04', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1322', 'efe2355af3acfb0467a32a76b3d3e8b9', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1323', 'fb5d7c50523d4892b7b91086c22435e9', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1324', '817dc30c1bcda65b8cf0d1631ba6a2a1', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1325', 'dc6b9a8287f8b227bf255b3986850ca4', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1326', '5eb7df7e238f8bb64bcc99a85132e733', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1327', 'dad2f5ef9780a3aaa145aea9289dda40', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1328', 'c4026f274dfe2883cd9f233c29117b28', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1329', '4d1f0dd110882764f3bb79298a547fab', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1330', '4ac0f0538b8381b6808b46a0aa37427a', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1331', 'e1d11bd2fddeacc23622ce451ad805f9', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1332', 'ea6e75889af220184b2a2f263dd223db', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1333', '50081d630a1f0a6374a3cbfc108e028a', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1334', 'c86a7b918dc6243e9d619ca7e52fd2f7', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1335', '440189d155d661d8365afc6ed14fc8c6', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1336', '911945d7d7b2324d00d0ad3c1f0324b1', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1337', '67b630deba1fc960484082e9a2bf3e01', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1338', '45d8e7c05248fb3304ac75373a3d93e6', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1339', 'e0ab9901043712da69fb7bd936b380e6', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1340', '9d91726b3f850912f2d462854c229760', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1341', '62e09ce05446c29a080bf866a5688573', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1342', '07e0083dd0c76b12f99afc20b51f93a8', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1343', '123c8d983eba41b8881e31f1327b8cc2', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1344', '5bd4713c7bda3735a247f51513b7d8fb', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1345', 'bfc0a1f10f680d0dd26baaf711e2f144', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1346', '2c1c7b596b882ff1148134cbe14f96be', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1347', '1291c7a518708266a86b24b52adc6a4d', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1348', '2cc96db59a019d61098af17809d028fa', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1349', '924681f96e7951d3bbb2c8e938a719d3', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1350', '7c2a463d41a16c79b9a199115423ac5d', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1351', 'c6faea2365acc3be90367118e6f8d2e4', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1352', '2f5905dd3d8ebe0a51ce78e4530cc2fb', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1353', 'aad8308bd1ba8c69c232eed58f76b497', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1354', '3ec9b628b83ee2c704c5ed12f244e46b', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1355', '2f8829be9d3bfd406117ea1175deea4c', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1356', '09611ce8716a9c3fdde5c05607a00775', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1357', '0c26c339eceac426576b7119031c3c2c', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1358', 'fa181abc09cf33065719c766d17e71a7', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1359', '0b6196c61acdd03e0757f1bff5cb8a1e', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1360', 'f5674670eca6dfd4b45e22259f59f210', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1361', '19131f466719542fe43506b483d9ec54', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1362', '89d9cad4e8ef8f973daf0412eea181f7', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1363', 'f059b2bfba52f5548eddd151216c0801', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1364', '98fd86727640c054eed50eeef8e88039', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1365', 'c688d08c9537e72b53b6938c54f9bd43', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1366', 'ffa70bfaf8605c4a7c354250bd21f967', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1367', '91ace6a85c1661588dace7011f1d046d', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1368', '83607689568ef8f7a0ae9381e7f53e26', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1369', '7efc580122cebb28e0bd628212bdf9b6', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1370', '34c2a8254e9def1e3a1ced7f922fb086', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1371', 'feb8dff371395f73a442d64c5323f197', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1372', '8700fb795790d5c8af65630a95d41b23', '未使用', '2016-03-03 11:20:11', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1373', '4b53f44d58df331fb8c407233d23d350', '未使用', '2016-03-03 11:20:12', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1374', '4053cbffd04ef01f6e5fec30efb2c50d', '未使用', '2016-03-03 11:20:12', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1375', '9e78fa416bdcd23f1eac324afd9acfa5', '未使用', '2016-03-03 11:20:12', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1376', '7b20817ec03035f023c687e1a6a899fd', '未使用', '2016-03-03 11:20:12', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1377', '87ade9f61708834a215ec267a53f89b5', '未使用', '2016-03-03 11:20:12', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1378', '35b133d033988cb6dd755ee245c30a4a', '未使用', '2016-03-03 11:20:12', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1379', '62e9a0ae71c02de39c30abc49c7ec36f', '未使用', '2016-03-03 11:20:12', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1380', '2e545526f74b33ae5906b4b2f18ffbff', '未使用', '2016-03-03 11:20:12', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1381', 'bc41b65715a86f3a23220ab0df950488', '未使用', '2016-03-03 11:20:12', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1382', 'c16131cc05097f1c4aec0a060413d1fc', '未使用', '2016-03-03 11:20:12', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1383', 'e17884985d18c16fb5b3e719d32f16af', '未使用', '2016-03-03 11:20:12', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1384', '8bb5a8091fd6c66e273e115c01a61a5c', '未使用', '2016-03-03 11:20:12', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1385', 'c36d34d11d19f703652af8043eff099b', '未使用', '2016-03-03 11:20:12', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1386', 'e8248a12a52f99465bef6299d578ad98', '未使用', '2016-03-03 11:20:12', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1387', 'c582815fb2eb2393c8e1845f85f49e02', '未使用', '2016-03-03 11:20:12', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1388', 'a3289a7485a7eb820b9eeea90de0fe8d', '未使用', '2016-03-03 11:20:12', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1389', '188779f0b63e9ded8af8bfc1557138e9', '未使用', '2016-03-03 11:20:12', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1390', '9203c2cb72c10ab5b6f560c4e74fe028', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1391', 'b8b3054074e496e31de51f3ec8a34a71', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1392', 'ca5d1ea926c9d2df3682dc290334adf0', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1393', '1a2e840c77d7690ac2ee7d59bccfb7e0', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1394', '52cef2bffef6e799004ce2fb490c4d34', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1395', 'f52fae27ddeb6abcd3ec587fc35df3cc', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1396', '7fb955562d0d946956116ec8f9ca7d4b', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1397', 'ee13ec117a1908e164b03e85860eef99', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1398', '58cb4e52b35691267952848e3e8ea0d3', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1399', '730c3f212ec161f0a65143ec7f6c9ae6', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1400', 'b3b0842f2c24ae4e489536cdc32665bb', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1401', 'dd2800e30e7ead8e17ee4d4a66f28975', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1402', 'fecbecd20ec24133e9576a686a0024bb', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1403', 'fed30458298b8b7e3e7f0c615e1c3cc7', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1404', '4c63b1e1fc8343e788a49a42dc986ef3', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1405', '192b135b425b45e88f5301260eaa0daa', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1406', 'ab809f48bc79e3d54da524081f1fe297', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1407', 'dce41c7351108316f5a326edad8d2b46', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1408', '9883edb16171f560e6fd04fb42d20ad5', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1409', 'ed152f7a7189304507089d158dba86bb', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1410', 'b0b2b890ee9de7cb09ff541f379621ff', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1411', 'a2bf4753ead9bf4e18b126c19a630665', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1412', 'b8a61ac19da24754e2ec6d251a91bba7', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1413', '4fa68bea9a16f494940b86d2c8887d1d', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1414', '5fb53e27684f9454f9159cdf31576fa3', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1415', '25ed643434e68080abb2605506fb9735', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1416', '16a0f3f52a77aebf9fdc02f66f677422', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1417', '9359e0667a368db64b0f89bd845e6ad9', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1418', '2664c7450b733b0a41b81403114d0d5c', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1419', '41191eea65166413f8816c2663925bd5', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1420', '15ae569409bafb596ff6598d1a477661', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1421', 'f5ddccdbbf94ecb3d15bf1b92e3a4b9e', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1422', '2ab206e14adbbc9d52a9af9d57b803c2', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1423', '81ecf9a3b9c75a765d354c38e98f4837', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1424', '792199e2c9c72df837a1910e3886e31c', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1425', '907b2e80f18a328d2571b512ffc8d2fd', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1426', 'b17cdd24535a9c79ca67bb0bc7a13e64', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1427', '8005901b75e9144748c626da38e967b3', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1428', '8965e7c244d0dae52cd71a8136aae145', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1429', 'c144b05ddaadbcf25fb323de423767b0', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1430', 'a7735bc7542067df082ed27d0bd09272', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1431', '0acceff6768526cc0a21a830d74f0a1b', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1432', '3cd34b50c37ae03a5e5a2f67262eeeef', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1433', 'c52969f784363fff06ee424405a15bb3', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1434', '2f5dd9adf75cf188a518a9aba048c690', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1435', '2f3d5203c57d8915afcc7c98b442f93c', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1436', '4de56c9f3c64f4a5496a5609b8dc2df9', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1437', '285915ec24c50a1c3e3cbe2bb082cd73', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1438', 'c82e408cbc5a1d0f81b7642b65166293', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1439', '3d8f68107a99e9715018fee6e4139ee9', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1440', 'b4e789c8bafa19dda621ec032029efee', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1441', '648f927e16c6f5b12f95e7a85cb3ba15', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1442', 'a14a1c728642aebd806bf97f251911ee', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1443', 'd46db5d865ae0b2c22c2af7313372cae', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1444', 'c6acaf85917b270ee18f5270a611e679', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1445', '479d07c92b31b776f5cccd0cf8a24835', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1446', '9a3b350d153fc39f0f38e8d306a54c10', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1447', '46b0b48e5ba416ca8dfb94e0c4797e2c', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1448', '2fb099b1fcd744f67a2dcc1191f2827f', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1449', '65f8a53ac8b56f2f7e847deed57c8382', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1450', '3055ba67f2b82bef8d761ccdad43323a', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1451', '9a55110deebb22cdb8ff0131032e3ed6', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1452', 'e407e0a0497705e203e8071f9de6a9ab', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1453', 'f231a02f3d42803c5de3409c03c83c42', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1454', 'a54dd84ba0e9651d9c1e0d86d1ccf999', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1455', '937175b4884d063a455d2d81bf01afba', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1456', 'ce4ad73ee6df8bdba9e1f13f4f779527', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1457', '015a31b76f6621c3f8499fa2c6c5aabf', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1458', 'e6f79d500c0bd6bbcced5b45dacf58b3', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1459', '773b594fabc9797e729ab9aabba240b0', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1460', 'd8f9c17e3891ae37063908a735b9b7bb', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1461', '19b776e88115974ad5e867eb431f5788', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1462', '6629473225fbd1bb8567c9afa61b4afa', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1463', '65e439dff41f87f26ae0359ca6be9762', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1464', 'dcb7da84bfbaa0edcf114f525beb6667', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1465', '1ce2f1f7aaf5dc7a687c1958354876f1', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1466', 'bb65966338db6db1e48681e4938d3cde', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1467', 'daa544f6f3150cec46f596e810da5cee', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1468', 'e110081b9b2ee197835d3a7de876ad1e', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1469', '8467455e548ddad8b12dc572b5f1b73c', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1470', '663980c9c5b8409e152049848bbbdd6b', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1471', 'd2da711ad09b15510aef98c3d9b01d06', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1472', '6cc1a8bb37ca757b0f249f9359e7ea82', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1473', '4841a6bd8e41b453452dba920cdb75fa', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1474', 'a66428e1069d46e90e1513865618578c', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1475', '19b0b680195fa1994660686649aeaabe', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1476', '8577d808f6e53bd1c9eb10e10f04f376', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1477', 'b9130e1aa20e58235b7bc708681eb8f5', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1478', '2efdd6741e2adf4f17a0531fed9b068b', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1479', '09d5036dba542cd6f55ebbffee9d9277', '未使用', '2016-03-03 11:20:13', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1480', '36e5e77054ae56668afa91502c18b973', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1481', '268a5517de0bf13e5a5554454a6223b6', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1482', 'e749ce38cb4b951f2000d08ae95fc6fe', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1483', '7d6d3f7555487065d0d2979b2904ec9a', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1484', '97664abce91c86df6517ee955bcd261b', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1485', 'dcf03b96813800b049663404dfc49bf0', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1486', 'fbe63049bbf96aa424d2ef3e5cdfd356', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1487', '8e5fd212dc4819f4fad34220bd1be827', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1488', '81008559843cdaaaaba01d706e7402f4', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1489', '8e257568fe6297d5e8917e7566ee9786', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1490', '444327e3ea7cc2c5c352e3fd07ad14a5', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1491', '9235145729745b164f67b08b30fd0c20', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1492', '60e3182f05e12b36cde0c9aff25276ea', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1493', '73e2fecaeae0b767bf2de5c770fedcfd', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1494', '31ec2bb250bbc324453060ceb94c1eeb', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1495', '6aa2403bc96c9cc947c4a759471d8141', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1496', '81cc4876a91ec11b46c3b2a92a6b8576', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1497', '5fec0d0f98e6ba0f8599c43eb8b4c4c9', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1498', 'c955e8f4587ae04bccc5ddc581ca8f1e', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1499', '47e988f26691549547a6ec4d4e9eeaba', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1500', 'cbb599979768ea0ebf5e8576af9421d8', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1501', '745690b54595e7b7f82ace4f9e7c5fe6', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1502', 'd7e8e2d6e98f956c162ab9935a7ff770', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1503', '5df488bc1d281f948cd7f1c13608b232', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1504', '2b14c596e5d7470c89f70b5c030c1299', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1505', 'ed728abcd4ef28c28640423f50dc089a', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1506', 'f92fb90e1ddf372ecfb27ab75d5d6570', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1507', 'd5fb14b1c9c64ae18a2e45ea321984d3', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1508', '0eb9e5e75a617e5f4902a28897d25e80', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1509', 'd00c3d81e087388b00314eab79020508', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1510', '9419c2a3bf477ab927666394b71c0ab0', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1511', '259c11a458a2133d1ffcad71111daf31', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1512', '698955b1eb291ac02b43faf76726efda', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1513', '21ebecf9c67f437ee4514e1bcb442859', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1514', '372a6bc722242d3458188b407ec7413e', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1515', '543712241aec771603f7ac9299250a0f', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1516', '9dca2d11010f06057db89ea03f1c1049', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1517', 'cef57f9cb370aaacc5e35578966c91f6', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1518', '7394b90df9bfec7f64a920d6c741827e', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1519', 'cc7f55d210c05ab56aa98a331b61137f', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1520', '1ff4e07872580719f641cf2e67068e15', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1521', '41d83acfc768fffd0d324474b13b94e9', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1522', '5b6ee91b1c416b0f9a0b9cfd747ed468', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1523', '94b7de93a5e6d2423361b29e69401113', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1524', '326ed92c4cd231bbb589fea21c0d3551', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1525', '3716db4d2d71321514b77028ab101607', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1526', 'c21da03841bdaa4ca41397dbf774d37d', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1527', '9aa8ae335e854befd29b738805f22162', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1528', '9fc3993eedfc4da8230e9b40eef26380', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1529', 'dcb7b7c94fed4919a899dfa18f8b556f', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1530', '20d15d46efa98d2d28623182a0f9cedf', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1531', '19691d412dd1e2eb45afbd68f9d4c7b9', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1532', 'ef7f7c7b8f398f2e60b11d05d1fde95b', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1533', 'a5c0c3e22dee31beb511b24f52c3fc71', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1534', '9580b0c36695adebf438ee388fd10667', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1535', 'dfa767004022736785801728ebcdeb0e', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1536', 'a07b857a19cda6345a0d39d1697c6234', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1537', 'f72f3bcb0c8f178a5b477e1f41b041f9', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1538', 'bfbc317dae3af9e46d9f2e33e998b719', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1539', '53da5f28c69cc253c51038acb6e72871', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1540', '3bb04fd980b74cff1842bf53110f87ec', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1541', 'afd1d3aa7318174a697509f7c4db8f48', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1542', '65fd5e1623a5fa1f84fa92674ee41ab7', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1543', 'ff50bbbb299afd6f1f5dcc140e3b4ef2', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1544', '526ca8d134f9a2e6d2a5360c3c2c8439', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1545', '76e4669a1cbc0a1857ed4837317f7fc4', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1546', '4320f3763e337c51f8716b3ff7e69a70', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1547', '26d988dfd60f9466514ebedeb611a328', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1548', '93bc02de082eb2adb23b654fbe2da250', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1549', 'd026777df64e87fab24c7f0bf1eb5f64', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1550', '0f30168559f8e708bb6564be29abfc02', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1551', '6a10c8eb2a21d7b78e67f5921a36e064', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1552', '21dd0b4ac772af230c51925f8dfcbfd3', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1553', 'e7c88f3a686312377d28062907ce9762', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1554', 'c4d51e80cd96c9663434f2a13d0a47b4', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1555', '8bebd9684ec3ecafc334abb7eaa4bddb', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1556', 'dbcad1b4f12f57acddd16accb6b01205', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1557', '3eb2242998e8317540ac3729ce4bf2df', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1558', '8d2feb2aa19d3bc7a4ba9195cae784cc', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1559', 'bea6ffc0a631eb28233b249850f0a142', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1560', 'ee54e36ff8f5ad599cdade030f9b5875', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1561', '933a797fa5cba069599de12ee2777984', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1562', '29c8a4fb76906bf0d69aa9cd77e44e3b', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1563', '87e847922905a50e33141ae8bf2bd41f', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1564', '99e7a88d467bc7dc22d3b88f4c4848b3', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1565', '1f3fe5675344bcd2567aa116b0d67669', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1566', '8636b8f693685812fc01585de82b8dd7', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1567', '663a064d32c8062f8f758b375eedfe26', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1568', '8450f596e4d90a3d2a0eb9b947bbcac0', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1569', '5db3795ca6cf9abf2eb522c7fb60bc9a', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1570', '2d9c0d2cf787181211f350a2e948d0b7', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1571', 'bcee47aa18b16a9474ee466e19a36f07', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1572', '4dcf78cab8f401911f56f887ec49da16', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1573', 'b7e2043d36960c77c951c56ec67b4438', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1574', '949616f656c0fbd94384e7ec0a3dfe7b', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1575', '482bbf11d496e56a9b56cd28996d583d', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1576', '6506cdc1cacc23d7c4ac518b5af1894c', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1577', '0c66080fad922b7c60bb8afd6b59717a', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1578', '41d91d6f62ac7e5901334021e64a4c7b', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1579', '89ab782dcba4d8a2acb820891dad1f1f', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1580', '99d3ffc366798c21ccdbb1d5fa26971e', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1581', '9b948773748af7bf136944a4d91d2c26', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1582', 'c9f28e0c217a45788803a66877e91436', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1583', 'c7c258592de32b96aa3ee1f1c151ddbc', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1584', '850f41e350dd3c194da6872e31261e38', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1585', 'c1b5024d9d0b413d4e08585a26a663ea', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1586', '0d4e5c799ef96adb4cafc75dfdb84535', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1587', '44ec3e072ff26bd7a453ab1b97f69739', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1588', '06bab5a61073082f3297327e89c13645', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1589', '9035f454e80aabad199967a6b3f77880', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1590', 'ad38ee49b7ed6d01c5cb5131f8e49ff4', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1591', '452309efa8880962bc239755824b5453', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1592', '884c5bf58cae0b3bb8c2ba8601813581', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1593', '97ebe0d849fdea221e75a0a2106e78fa', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1594', '94f8683c81384c725e2563dd0eb3df30', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1595', '157067456ad359c81993bf618af0f52a', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1596', '3da98f659d898d7023e06264e3692274', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1597', '85f1afa6356cda7401cb2ed16099c0f7', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1598', 'ac4492ae0016d581d723fe7ada4cc12c', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1599', '0a4a3aa4188c19cfb21212ee043138c0', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1600', 'e6e19396e0d542e3884aa74f9f419d66', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1601', 'dadd9f18c5d2589d4d222f2059990216', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1602', 'c8686f2bfb7763fbda526a329a13b70b', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1603', '074d5cc772eb5fd0c21fa48b45bcd50e', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1604', '22c64c84b7b315ae738533d8d85e4620', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1605', '9da76f3caf2791fbfb21c85d6fbc8487', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1606', '78c0f9c265aec21709c60f70a2a89bc4', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1607', 'd60df505f821d2766d7d22f94c3c76f1', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1608', '96d11062df099f3e7d55aa9b1bdd7449', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1609', '8794f6ca6ff7e45974e581f50099db1c', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1610', 'dff09de151be07416b2a0e0d01cee159', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1611', '963be337270b3f384558d626a482055f', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1612', '636e3407c8d500d2bd2694fc183150af', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1613', '94f12e327d416b9d43b3c845e2625207', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1614', '6eeb0f051e6517e6e7711b9c5148ed82', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1615', 'fc36bc21ecbd9385d2d8411c7019e8a9', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1616', '74309dc11b198fabeb23345fa59d0592', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1617', '0ba6b161b260be92fb09fa6c34542072', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1618', 'b782ba6499672b0d5283354d2cf126f6', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1619', 'fe8c71af4819a59fd6685e649a38eabb', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1620', '48cbe2ff72976c309c52da255fab336a', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1621', '4eab779239192b1ad77a5297f0fd9488', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1622', '8999c0b3d0c8453bf913b90950966da4', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1623', '2741d5df3ef07a6c7e9619b74fdc0786', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1624', '57b77b6485f931054a8689e54dc7efb4', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1625', 'f3f68b0cd11836798c5c649c5eb70465', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1626', 'b789fa5846182061844886ab324f3279', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1627', 'e4436999d8efdb1145e16bfa5d2e7dd7', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1628', '0dabb3a649dbfb2297b7a815de4c75ff', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1629', '060a9c799f37fc0fb286712c5470c66a', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1630', '097ed8a14d2ffd0019cf3cac1bdf5284', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1631', 'aadff67745338167d5026120d0edb8ca', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1632', '3b2b3b09ddb94fa860386aa687b94304', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1633', '90968fa0b785fb3dd3f29de301721d90', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1634', '0ea0a50cac96d244605ae3bed021f8d9', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1635', 'c738fdf652de687e94f9018428177262', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1636', '045f1ac09e284dca863af4e3dd083bff', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1637', 'b6fcf1e716ff8915b0a17176b6667347', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1638', '809e81bcdfa22c3e8f560e7125677c58', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1639', 'b6c7f65bbd615877f206ad8aac9e914e', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1640', '1d535ceec600e2b787a0b109c65819ad', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1641', 'bedbddc1ef7bb06fdbdf498c0c319eb2', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1642', 'd590ec1fd0091ec9d9964785828abcda', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1643', '38ba4d5f73e42d329454f69bb78756eb', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1644', 'b624307dd7f7807bf9e7b869d5c81b4b', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1645', '2bf37d75cbb8b9db2a7cf8f3fcfcdaea', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1646', 'ccf1da0f02b56a8d24124e6175008d23', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1647', '7f17a8c5569542269765b7b21e923ddf', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1648', '2f13c6fa0c0262517cec9f585b2bb31e', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1649', '94d09b0f416e68f9bcb96c4d0f8d307b', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1650', 'f0b92fdf2c499572b85d183df35d67b7', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1651', '5a2e5c408ddc4f8bf119ef966259b0de', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1652', '4a0463285699a8617cc9264d2436a0b3', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1653', '6a9c74f3b4da1662015c7100f7a522f2', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1654', 'd1520b2bf151282e7080b4e74e32a1b8', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1655', '316709c52840caa69ec9844995d53a6f', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1656', '6272c9a088828950706ca47882f4992c', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1657', '67d392c1e15673b258d87adffd899731', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1658', '0938fdefc70ba207c48074ee8d4d8120', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1659', '67c853c73b88b4620ea1ead167ba69cd', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1660', '0654843381f6d6bd5370a107319bdfa1', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1661', '6fc8b0475f0fe2bef06a41de61e53432', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1662', '8030f1f82f1bec2129bdb6d52c36b7c3', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1663', '0803dec9a6225ab4b0b3e54ac941dce2', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1664', '579feca54679910e9b4159310d81fb24', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1665', '390b667b4a4addc1ed92ee6759e86317', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1666', '42fe034f5dc20bd02eb5d15d445b20ca', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1667', 'd7edf75103e152d7b022d02ddb63a025', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1668', '3c3cde259a273c7aad47591b21a122b0', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1669', '006314f91e627df8edd3c913640196f3', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1670', 'c6e15a1c041a94e7dfba81ba5b1f5313', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1671', '9d56b46cd0a5ef1ba84cd1af52a9b932', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1672', 'eb95a3ee88a24b76220332f525b603ce', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1673', '2f58961b68e544f03d2c270638b57d6c', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1674', 'a49b9cf806008297aa6f193e743b50fc', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1675', '57e303a6b7e78ce56ccff7eca13de40a', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1676', '7f40411298008295678978c1b71513ef', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1677', '32335b89236a4bd16b1e70f8d855f096', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1678', '776ce3c164401c1748d220993673ea9b', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1679', 'fdda2f2232905159469e7b94f59f0693', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1680', '0cdc0c73dafc65f811fe28843b2c9a0a', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1681', '41da691bf51f0d964f14f690be290b22', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1682', '05fc7e88015d8e35008059c270c0b9de', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1683', 'ee87dfb39151e95e7c45d11304ec9d88', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1684', '164ae491484809bdfd970797ac23e578', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1685', '1ac990bdb63ea0ee281177884c80c167', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1686', 'd459a6550123869b80de934fb25036dd', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1687', '3cda775042b97e9ddaca4095c987d852', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1688', 'e4760e520e1b84265353d63c87844279', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1689', '2ea90c7d3ea107b2b7a9eec684f38aec', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1690', 'b15e97371fde3d5589533fd86708c1fe', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1691', '734935000e9cda8b13c6e7830f67f989', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1692', '592b846810822e502e5bc460c1597c9e', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1693', '043e1795c09f5ca3b902b0f0c5151473', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1694', '722e0a81789ed6ea3b1957021077294a', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1695', 'b0306be8751673919839afb4fffcc78e', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1696', '64f685033b73b525c1f99a33fd11c121', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1697', 'cf230bb119480c395615b5fae6061fa4', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1698', '5cfa20059cedc2b04077c6ec3fdf1f1a', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1699', '7f7f4beff698c80cdd94719dc1bf95c4', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1700', '9dce276ca402bd4c1c102952f1a03ddc', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1701', 'dc5b99905e15d1a1d3d0425100041d01', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1702', '0266eb8dd606f2da97f4a92a377157e7', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1703', '64327e572f4f560789d70291bb4ba5b9', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1704', '6a2fed4620dbb686781acf89d5f731fb', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1705', '4d9568cffd86aebaa4c9687f580cd3f6', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1706', '9841d492311365f4e578729c5a8fb152', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1707', '61c04a1ca5bca2d29cf6e8d0b7c0c8e0', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1708', 'b705437e4111c2f724d63e34dfcc7353', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1709', 'ac2cd9122f09626078d6844bd8b695e5', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1710', 'e28e1581eacefa0dfe0f38932cbc178c', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1711', '142440da9fbb3952fdd4a42b5366f3c7', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1712', '759942b4feb258ccc6faf861ccd89058', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1713', '55171ed220f5659ceede4f3ce2b70750', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1714', 'f13eb5406da2ec8f87ba9488eb888193', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1715', '26f27b613d7dd00bb66bbb842405f06d', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1716', '33eff858dd331ec12add58d322592109', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1717', '6b46a67ae28bd98df3b2847fc94e2939', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1718', '97005494011d16e32a4e0c36439b4eb0', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1719', 'b263523d6dfe2393e03c52b09070161e', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1720', 'e29ff433b61b24c0391cbfb981f86673', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1721', 'ce89761b090507d2fe10576630af4bcf', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1722', '53190644158f5b2d28e71a844808eae0', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1723', 'fb82dc76139633fd4eb962d82ca3c993', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1724', '6309bbe35ad5f6c52686d631af6912f6', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1725', '7cf729341b00d0fd781c18c5778f917e', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1726', 'cb18e53d7178bab7e695d0d592dff84f', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1727', '62bbc2c39281b3801db3d297127c2486', '未使用', '2016-03-03 11:20:14', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1728', 'cb65d9c5074cedf06a2417ca1d943101', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1729', 'c0fc4ac8d689a3f264b02667cb10886a', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1730', '83e37433e4c79c6edac10ce2aa2747a1', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1731', '2aa47ce14ee9deff4eea1684227a9299', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1732', '2841c8d7afeffaa7ddfa73803349f4f8', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1733', '3f1d75a67fae4ea4e0a97dddd6b80cba', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1734', '6d460b58c02146833819d67f0e26d911', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1735', '3116a79bd3a838eb2443e008a42e85a9', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1736', '7a0f54d7d31e00a5643bb3890f7c7c4b', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1737', '67d2bcd7412dacd3b2b5e57ba33d3c5f', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1738', 'b07aee4bc39fe710cf21b444e4e7efe8', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1739', '8ebdd60e1ee000f92edcb202b11f2dbe', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1740', '8db8c7948427ec6485afc92ce2cee08a', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1741', '3a2b35996cacf2036863cc31f6f99d9c', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1742', '3fca9bab59b6b7e147f72443c313cbd9', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1743', 'f275e21f96ad0ba06ba7897036366935', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1744', '80b5c34a03cb7bb21bd0c571432b8bd5', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1745', 'e4cfc94042cf88ae06bc2140a3f1f054', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1746', '091969aad76f0960930e3252baeeaef1', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1747', 'e9dbab651f3bfb3f80074185e2e47234', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1748', '876caeaf2ec0d39542719b0f0dda6c42', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1749', '3c6611b961a6c1d5868aaefcc906492b', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1750', '20fcb434fdb450738ac15233d9179372', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1751', '369a0e652f6c7df1ca4630ea4da061f8', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1752', '5632aa294093915eb1350e5e036d4bfa', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1753', 'fb68d839b2131a5fd26561a9813cca99', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1754', '4d7b6c19c73e8e1304e763226b9c1110', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1755', '5772db91e9f320b6ad6e3fedb1896f0c', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1756', '070c7de1716daae7fcb0b4138d8a1b2c', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1757', '98fae276b590dea5fa284f2f1e846f48', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1758', 'fa0129c2c374807cbb4fb27a87285005', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1759', '0dbf3f6d458ed45e3b5cf8b3810a746d', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1760', 'cad11410b79960485ce45dd6284b5e8d', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1761', '828183b274b9b21809c9b9401c948de1', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1762', '07b55e3a8cdac0bf4ea278da313f688f', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1763', '59100400f5da6829db3321d11c9cdc7f', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1764', '2a677955a8cbbbdde683bf7e30f11cc4', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1765', '279d1b553195bf31b3345e4ff8f78f37', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1766', '2bdc693ec0c98dd199485b8632471637', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1767', '9f3744b1cd6467f5edf9794ce941369e', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1768', '633e474dad9c515c2b3ce575a494e178', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1769', '743df0e0d2ca7bdf64ce5d9b2c215547', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1770', '70b8c961e898bc3b6595b9fd2a282e79', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1771', 'ce8d7188c0b7fa294929bcff258d4297', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1772', '13a967a9a285e2b96ef41668dd8dd893', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1773', 'd45d0a5d27dc3aff82c42654d0a3f9de', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1774', 'a7a5f78d9a10ff9b7bd8b9baa3dc3d62', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1775', 'f0a1d9897cfa3c2e763feca270004993', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1776', 'ba9ffa6ab2e61a01229fa5ac40114a95', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1777', '6b9e6ad7be2b843b24a74574ec0edeb6', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1778', '37583699ac64e215c031141b4bb330c7', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1779', '194df244bef1814c55dc4895d1d38454', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1780', '4ac5d8c823db3caf4377552a0d6cb178', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1781', '75b82dbb15ce00d4fbf6304d1e6ff373', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1782', '34ab168fe61769a832f806a463097a60', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1783', 'a0e92dd5f7551efe8acf42264ccc6740', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1784', '31b09326a546adecaa47fe63188b88c6', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1785', '619b47b0a9805547c315e2e9dc8b8d45', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1786', '06e767de48451880d3ac5fa19d5a6c0c', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1787', '62481217040332b3da840bc01d292a71', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1788', 'bb4f8ab2f91776e83918e0b80f555ee9', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1789', '4ce64d7a3c9da73a12d6d7e9bdaef6af', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1790', 'ff4d3b0f859d56837e935996c6dd56a2', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1791', '579c200348d2f2d37d8f9439b88c7236', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1792', 'b161c1694ae2bd9433d78f88dce3e035', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1793', '6f6103d11ef00acb6ac03c15d5603cdd', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1794', '4644814b2302e43c6e4d190ce4f56333', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1795', '93905b13c9ad5947b0750f0dc0572021', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1796', 'c4421d932ae615237bc52cf092c02f1e', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1797', 'afc0e23ad8c0946e3924775cdab4a0b5', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1798', 'dc07ea583b4f40a026c849a691a92834', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1799', '6b63e3b85694afc95b6e398d6a27d075', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1800', '34897ec0a58cd68e767eb8780e708eae', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.00');
INSERT INTO `xy_url` VALUES ('1801', '49d647d4e88cff7ca7a8f82f0773afd8', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1802', '0e5376920f61c173e3dd0759cb73662f', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1803', '19dee08977fd407eca52f74b8eff6a47', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1804', '13f4b4ffd5a9983806eab8d906b5f465', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1805', 'facdd47f17b7dbb90ab8f902994aa0d2', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1806', '08ba1a2d4aa87775c6e13cc900d9f8f6', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1807', '00dea28cee12002087eb1665d549816a', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1808', 'cd10dc4da820c119d86809f8695da774', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1809', '1e4a4c51fac3e15feb0e93945b5a7394', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1810', '190e3000f0a844891c056afa48a3def3', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1811', '899a29f3f8b3cc21da19e7f09fa78d9d', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1812', '8b866d7943f9cfaf9e874882a422165c', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1813', '28cec05ae91c76000cdb0792ed8e151d', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1814', '78c2f6c384a6a5e060f3e28125372c63', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1815', '85d6b071facd8e5e1fbe86a2d9a734ce', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1816', '600df6c2a937b1b56754bd3f48c69774', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1817', '187009113ce6c008d076e0b7e194de28', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1818', '36e5f38c0bb90b1ec61e89f1095f6579', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1819', '0714ab73f23edbb46d80fd4a6043e2cc', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1820', '87c6f56aa4926135795502103b341a2f', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1821', '1555ec74685fbcd9559be7c23df7bf62', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1822', '30bbebbf216466aaee0dc2da8aa3df16', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1823', 'e0f025dcb1573d341d5f334a5fdd0ab6', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1824', '29a164c7d7da71d0d7717ea3b3a2f75a', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1825', 'c5d5e7b541230e4043d5653052b442c4', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1826', '82c40c7cae30e99b2abb11a3e157b6bb', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1827', 'ec10de20b9f40957f515b14d9408d7ea', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1828', '5c3ca8ec7c8bbe7bd451e83c101c18e2', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1829', 'cf6ac9abe571853c2fa115e9b6e2c123', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1830', '815256c19ed6954376a98a6776a9edce', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1831', '27a96e386530a985d10b13caf70428d5', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1832', '8208e73051c351ab04232f6ab3e1cfb2', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1833', '2d9afff4cda6d74192ceb9fff4924da0', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1834', '503dc5aa709ede20c481767237609a90', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1835', '0f12604e291af3878f15134dd5c3a93a', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1836', '9e86379852c61920e186f5fd990e62f7', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1837', 'ccf3f58f25bd55a7e3ec7382152b7977', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1838', '35149cab3a8675628cb6e95e940d967a', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1839', '726ed3dcb77f343ea3ff829142418f3c', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1840', 'd1b8c88bc7e3c032c91b4eb29d838901', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1841', 'e406cb33bb087e867d29e9678918a3af', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1842', 'cab90ea7d78d6b5ee13867d58b01eb92', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1843', 'c35f2d6bda734a7096803b2ddff19ee1', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1844', 'f22f333c9ce561d5eec024c3ade8953b', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1845', '7647fedb35c0ac0905b8e18c0d5866e0', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1846', '2a07e2f06b1b6578eb48004a572f9462', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1847', '6e5c5ef5004288af42ccde17598fcfa4', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1848', 'e1456239f27af2cc448af2bec81cfbab', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1849', 'c65ee77544b76670d5c9442c1f708b9c', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1850', 'f3cc3beef961a7dd0c2a40848ea8cb19', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1851', '277cc6b198d2f740b1b53235c2d14521', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1852', 'c8b4af97538a3cc84f8810d7cbf99e60', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1853', '89abba177ab1349cbda2f56272840f50', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1854', '8d9b51b004d47384c0b2cfba100b2efa', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1855', '44dd3a9dc7383eaaaa07e103d1d85b27', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1856', '4ece850910ac108f3d3027c84d3b75a7', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1857', '7c1446db2df4b569524b6301946df974', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1858', '6af8b2f20b1f23b2755dd645efa15da4', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1859', '0e78845eb4e8c00a3f37b0efd7a0ed13', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1860', '3f692ed2deea217d6f663b80bc8b9e6a', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1861', '88ea8e04c2ca68288d86771bfb99f775', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1862', 'e89c38d96b99dcb914dc6006bc00822f', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1863', '927bf914bccfc8c0bdb43d3e0bc3c18b', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1864', '16ab8fb4acb68c526c4c542b846d77d5', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1865', 'b81e201cc0d1cea7e04f4c391dccc701', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1866', 'cbdc50e9807560d2ad53e49fa418ebea', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1867', '23c54487b79354a285c6a89a22fad449', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1868', 'd3b68077122a7b75b56efe5533233cbc', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1869', '555374119a5aaaf22eff0f6c13734d8a', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1870', 'b62aa1e4a7ee3ac9f4dae3b7c0121377', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1871', 'cb58fd5d0b63c57ff91ad745a2ad4391', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1872', '593c25a5744b0b925c9108772027a818', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1873', '96f99370af4766fb75548ee2e9551bf4', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1874', 'b72a0cc117249e1525ddc052ff2e226e', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1875', '3dd80fd011a6ca587b812215f22e074f', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1876', 'fcd83feb3212fb85d6ac2fd475bac2c7', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1877', 'c5613f75faec008633afcfae6d0b6f49', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1878', 'b956e18c80fb3c21b7628d79e8d58390', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1879', 'b3cebd2df19bd31a492c800b10cd68f1', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1880', 'fd800ec8cdf5712a294bdd5794941e86', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1881', 'd56d04be03c41f17659a4d1a973d2ca9', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1882', '3accff70842aa115a341d94a229fe7ce', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1883', 'eb08c99fcfaaa11ab466d573b1d939ee', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1884', '54a408063c5819df33bae29a68a473c9', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1885', '9d6c3f6d7b8f2bfddca8360d7848fbcc', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1886', '2be0ccf524c0de4e9945d60b5a875108', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1887', 'bcf47d0f20334c07b3db5b534c028851', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1888', '50678d11beb64a87ce7881a47212834e', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1889', 'b4991ab14b71788491b9d48ad98c76f3', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1890', '00efb603bf0f7d2b4b438149f6e5393e', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1891', 'd3420bb484259214cef03b8b223a91a3', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1892', 'a394a06cf2c9a0a7074f89a1859152b9', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1893', '28ce59c62bf7247738f66a15722b44f3', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1894', '0d6b00233de4d6d970f4119e263077e1', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1895', 'b20d5c96cc39f8f67de6ed2b0cf7078e', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1896', 'e9ce06c938a2450f5c4d1ca69a425e50', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1897', '5a2a8c113d8531cdea79bc054365b4d4', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1898', '4a10225de9dd60ac99253a8fd90c0a5f', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1899', '53f6d7d4698fe25847dfca29c524d3e2', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1900', '06368575f45c4c64bd93d1563a12df90', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1901', '1abcc39e6f9bb63497727592068e20e6', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1902', 'b622687a09484daef9f3b0f59386a987', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1903', '6a13f199f2da4367767deddeaeeaa7b6', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1904', 'f45d3ff263cb29383727932366d99af4', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1905', '09f4ec38ef8a58b3f177653b123e5c53', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1906', '69182befc49ce3a70c7ebd63849cbee1', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1907', '79f4c4e663e25e1d6a5f67209f4317ee', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1908', '04dc9ef07da37afe990d0fb1a8948782', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1909', '626372e83a98eb6ffbea50d2186245c7', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1910', 'fd01304feaed03454640838db1324953', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1911', 'd293054a7b1b08edae7a8f554d942c12', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1912', 'f76a88a43dc877fa77762dd3188db409', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1913', '1bef207f097d1eb263f1044af8f575db', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1914', '6c7e285c66c34623dd6a37e91d787e9c', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1915', '6c73e9fd9fa1178612b0c38021fe50ad', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1916', '987e4b7b6a726bba4d83db05bcbc3f2d', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1917', '5d71531dba66ab89963550a3812bb83d', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1918', '04ebe73ef13804c1762ef3d01a58bd1a', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1919', '466951738915ee4a0e3cec89668f6a68', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1920', '802f32b52fd9c642d266e28cc38d0d2c', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1921', '9d945d38890d6105661f860a3b8003b5', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1922', 'cca7d9c163d849bdf96b1fae740fbeae', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1923', '16993e17ef12635a9cff42200e861a80', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1924', '74905b9eb1c513fc71567b3a5a0ce0de', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1925', '06e2e48dcdbd627366fdc46da74d6178', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1926', '424fbbdd92722a5383d71d050735137b', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1927', 'd384faa921172a2af58cfcf28ed6f3be', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1928', '1809c5c89315ec0351327e7a0be584c2', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1929', 'd3b2451162597c271c241f0a2e16b9ba', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1930', '36fa2a9ed9d87e3b224902df647f2d43', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1931', '6b4431ef0be48ff25985b612ac903fee', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1932', '40aa217f66507d9e9880da342e694174', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1933', '49110575f7084297df061708620f9905', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1934', '83373e64b6ab6567769a05aeaab34cae', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1935', 'e1d71351d81f54917ac0c27c980e8cc1', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1936', '387ead0472afa05933c938c8851f609e', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1937', '5013339339051ecf96eb6d07f937602a', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1938', 'b03454d09103426e10045f920c2917de', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1939', '5ea09c1e604f1272ba2519f9f5291ce2', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1940', '6a9e2a7e4d246b34e184f5f9163a2414', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1941', 'a909bb408c789fcd006afdf1d20b2e0c', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1942', '4ccd3d0e2c56ba7026a178817e0db53b', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1943', 'ce128c6c7d91e2eaf35b3beb5ebe8f87', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1944', '296b3fbba56b59abbad0df798e287783', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1945', '940eaf77504b814719a28700a8088b4c', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1946', '313a855856b8331509c9f6077c818d53', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1947', 'd2ee1c09369197843484052cab3bc9f9', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1948', '11bd2568178909bbd39267eb5638032c', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1949', '42600acfa5683192458e3f0623ea81e0', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1950', 'cf4295999ccf5c3b1cb34b5dd5257f47', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1951', 'f6cfccc2ee8b317b769eb2b6d401a808', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1952', '559d69449aa62369f73b2f825569d9a1', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1953', 'fc2f939eb4aa2afbb43c688977dd0012', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1954', '41bb25e53f92f0d04315b3c8da3ba7e7', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1955', '6f4eba4905dd2553928786105d5d839e', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1956', '354d12daa661ae027fce5aea50243854', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1957', '2d061cb12045cdc558f97b705c7c4a53', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1958', '59bda5d8511dce34f2e4718dc62b8c66', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1959', '90179d6300e77566a2e75628f630c2ed', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1960', '89f8c42feb58151f6a5665327fef0888', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1961', '9a1f502e1b1abaa78b35712fa600575a', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1962', 'dcb1870976ac28b5d2596840ff5bc7a1', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1963', '0a5e13761437904d17146c6e39f1a04d', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1964', '9d9c6b969679a5c4d55a7fb1762080ff', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1965', '79f49885db9dc86c41955581930e71d5', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1966', '637a1a51e22864685c935c5954e3928a', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1967', '2e2a9fa300c958b12fe172c49508d9c7', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1968', '43ed492f2e5f21bc2512b9702b94de7e', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1969', '8fb823ed0957a2476fd5b9234bb6bbc6', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1970', 'beda808353f613f89b7e7f91f473f1de', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1971', '32e88d6bb5fe3eda1b3c2d561f19e3b4', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1972', 'f90d36aa70ed60b3173376f6bbba5305', '未使用', '2016-03-03 11:20:15', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1973', '5f3ae99508820e38f215e42feec1243f', '已使用', '2016-03-03 11:20:16', '2016-03-03 11:28:59', '0.50');
INSERT INTO `xy_url` VALUES ('1974', 'a734cd8bd526690df864149c489e52f3', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1975', '49db07699ea073542cc3052f6fdd02d7', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1976', 'd1e0a762b10391c42c98312a9c0ab5a9', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1977', '17eeea823b8b36e27781454964bf06f7', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1978', 'c1351a222824d2d398b6da6a6a6bff5a', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1979', 'feb0e83e18ce2dc4725d40b3568768f6', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1980', '483603d37a92b2e72e3eafd6323af14b', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1981', '4613bbf33a8919426b1226d596a979d2', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1982', '610eb868e9135236838677b86b454c97', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1983', '952e77f24d7e0e1fa7eeaba7e547985b', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1984', '22224ee466383f0248a55f8c2ad52e56', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1985', 'a06cf73027e627598024612436d937aa', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1986', '6c7e6c88832ac121d9e7fbf2a07f3c82', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1987', '1f3c0fd386b7bf22e637dddda4d9a524', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1988', '8b258e92be00fc1d6d0e34d3e7f52508', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1989', 'cf45af73f2887354180ccd2633b0a06c', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1990', '1dc845a6bf5d857f05f0cd4947bbccbf', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1991', '11dd1f980475a4dc1735aec89c6f4810', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1992', '690c1c571a0e73e0f8eb592deb2ccb4d', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1993', 'c6f2ab0040d105266b84071678bf23a4', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1994', 'c403a4d17921548d44fbc97e1d127bec', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1995', 'da8e8cc39b469dc66f1a49cb0a3d405a', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1996', 'c1d0bf4bd84c877a12fd33b3029e6cc9', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1997', '359de4d792d63a7738f548ec418e2f0c', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1998', '4812c8096a06a1609b79363a1d6c6fb3', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('1999', 'a99f6bd048af3db7f1ff1744a7a89f9a', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('2000', 'c1b6f8d316a7041b8822c06fa5961fc8', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '0.50');
INSERT INTO `xy_url` VALUES ('2001', 'ecbfb07a3d6c1c6167dc97aaed8b74a7', '已使用', '2016-03-03 11:20:16', '2016-03-03 11:24:39', '1.00');
INSERT INTO `xy_url` VALUES ('2002', '3d22cc9bb0bc008558715303b7af3ae5', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2003', '2d9a5910453cb78fe11c01c086be2073', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2004', '063c0bcf29d23c865961611b4611305f', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2005', '71e5f5b2004c9f26258eebc2301c5edf', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2006', '3b0fcccc65592b60332b87b5d14b46aa', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2007', '343275258fdce6a5ea2a7374fb3c37b7', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2008', '97839fa7b5c61f5b1d38bb4425ca3190', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2009', '6ca7063e59fdefa43f208b722b09164f', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2010', '49b450dcab775be3416a1e61835a0c9d', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2011', '28c1b45bba7234a4d73f38a16f51076c', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2012', '590967adb889bc5b5cbf6deb54228f4a', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2013', 'a23fc248f66c0981455c0ed6839b7a8f', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2014', '3c0901abe6bdd7b3337d204407cd3687', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2015', 'ce358cfa105af896debc667aeccd727f', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2016', '25196d2d576e8e0f0a0a2684181d7f0b', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2017', 'ff8f4be28afddae4c35d2bd050e21b96', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2018', '67e64a85793b6e29a54514f24d367fcf', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2019', '9e4f0fc2e001a27569ae85dcee802bac', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2020', '62563747051ee49b66318c129ee5cd1f', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2021', '2b63022992e3308285e585a254699571', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2022', 'fef508ac78ed039e7bc7cc8df9f0b64e', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2023', '505d7288850d802c356d2a43e4ea9c5c', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2024', 'c4a38831d1a10f4238920b79ef5ba7a0', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2025', 'b60012f07e9e9a26baf9f6b239056ba2', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2026', 'c52d6a847b8ca227758aeced2cc19f78', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2027', '2d73c01bf09cd95dc265c8b94ed68558', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2028', 'd2eadb635c1fd58a46f1ad23030e3852', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2029', '0a4d700db3f7d611a98f0aa79cda3b87', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2030', 'bcb938cfb38dec1161c95f016e766c5b', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2031', '03e306bab570e9fc0b6183a4294a6ea5', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2032', '2f0f3c4ee11e25506904c7967095eec1', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2033', 'f851d4ac93a146c868e1d067858107f9', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2034', 'c89ae4edd18b4338e7c3a7f4aebed56b', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2035', '5d4d9050593781513ec1b395ee65259b', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2036', '223e555a169bdcf7123d755c4dc5970f', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2037', '5da491feeef769f00d4713e3a7028d0e', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2038', 'dff26d40fe1a609b25f0501edd65e81d', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2039', 'fbc2ea51ffff379f614b067ef01bf982', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2040', 'c42f085c5ddb328ca1d8351ad5db13b8', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2041', '1d730bdeaf5f02a3a21c0a1d1d715841', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2042', '2241b448ac425e55e18ffeec481c5dfa', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2043', '5d8162db042994882613b428fb926b20', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2044', 'e26e73df314d5fb0e5137e76f20432cf', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2045', 'f63964e803ee81b670de2c10e8229209', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2046', '821d42fce9e8e0dbb7c4949cc3540225', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2047', 'dd20759924674a5445963cabcf023b37', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2048', '52ca2b8f6c21229ed9268c3895b61ae4', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2049', '1f347928e463f4e2b56f3f23d057355a', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2050', 'ffa79e687cf7a04135de22a8cbaf24ed', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2051', '23d5337420f9d9eb4a52a3c5b3f285d5', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2052', 'd5d9a294dc52a6503f3424b5eb4b6739', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2053', 'c9bd753a3145d83fe4cdc020fa9bfdc5', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2054', 'f1dc0d1282afa2d6c286f93f7448f214', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2055', '0e35465abfc44cc07844422e75608297', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2056', '1f39388560daf02f85385b414e46fbe6', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2057', '4f788bf2a7f3dc2416625ee4b763ccaf', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2058', '55fdd28dc15b56b74d493adee630e025', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2059', '09b186ae7c46c205cb5e5cb57f82ead9', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2060', '0109c8076bd90392c9ef12e397713576', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2061', '95e70ae23368137afed2b999a0d78962', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2062', '44794f772f650701099e5d350125b14e', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2063', 'ffe13a5fa4f5df1ec65b5274dd151e5d', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2064', '4d5217e9fdc6fd0ab0fff921ea4878b4', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2065', '04ea35948f33da8913df9b30ffbc10e3', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2066', 'e21eef8e37a174498b63f412c2cc0613', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2067', 'af02b28c1eb503eb1b54d200d1cb6be1', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2068', '6c9c437b4ae3b87a4623ce2073b45c90', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2069', '48594b1954f866c22614f1514ac3f144', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2070', '8166db9f4c4ca2487a6321763107b19b', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2071', '02883bf534102e398bb197f6a32aee34', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2072', '2e73441095658b07b166c9d2c6b99a7c', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2073', '3f108d48d1dc516235133fd3f29d28d9', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2074', 'fc7d4ba024a5a7b396d16edd609c2a31', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2075', 'add94ae7ab8f1eab6c15871dc5641f5d', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2076', '6c3170bcec4093135a8c27e45b6491d1', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2077', '84e45654a66cd16a370e349c2ba06160', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2078', '1d340ec423f349c3cba0c5e5d1fac855', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2079', '7486b516f80922ae85d1b863adfa4c8d', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2080', '781571b8ef1823b7268ec51bb368bb24', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2081', '140b88ebc893c8fcaf81653161597191', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2082', 'd1dc315ea5a523cdac844dc7da5ef950', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2083', '2946811e73863e8acfa0a889be95419b', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2084', '53a87baaf61c962fe4270d85a73926b3', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2085', 'b81e0e1cb76f77d06c8e6a66d94a158f', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2086', 'aebe303d3a9cb672258d6e0b8f01b994', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2087', 'a76a5e47c93202f66c3b6eee5544a3f0', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2088', 'f9990e1f543e7fcbf7d349e43be39bbe', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2089', '4b3d638a80ce7f6eae61dddde96faba3', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2090', '82046a3632481cefca92caac3da5dae2', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2091', '99ad4221d0b5ee151c6d4bc410f4f821', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2092', '44ec1520baf23264e34dfef15824d538', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2093', '2d001bd1974f6612941c5f94be5e13a7', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2094', 'bc9c9eb43b843c274b1f9d856fb7683e', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2095', '73b1710c2d74d848673d5ae194976d93', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2096', '4a81a45e9ae263dba329c75bf2616db9', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2097', 'b885e5e800efbe5373c74c405090b011', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2098', '2a014f97aaf1eea4cb6470f646f605a8', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2099', '9323e2b1d2ba4bb184b3f395ad6fdf44', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2100', '26369a1bff0b0f8a12acddcb34c079a2', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2101', 'e2e69659818812f6ab34db57c8551b17', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2102', '9d5a3e6476d8cdab25f834db326bdf0b', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2103', '9658c3815c57ebbb8159fb7447c4f177', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2104', '400b009206ece68804f7b49987477cfa', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2105', 'f75e5057aefe63cb5aaf00ac123ebe0f', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2106', '3efa5cc0048f77df6fdf312470f8fc19', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2107', '6f1e22184b72c747ef359deaee3c2f96', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2108', '192c29a1d35747caf296630189046811', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2109', 'a8fb8e28d62be6c4d5b8b088c9d7300e', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2110', 'a4a3c06ad779557287ffba76528f3a41', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2111', '6bad860b2930b1030b1a044a7cc26d2a', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2112', '02855aee418361f626bc7e9b3b5a9c7c', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2113', '4e05e647fdc7f071c4d538c62a1d0be4', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2114', 'cdd37947e0195cfb0cc5680ccd45d498', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2115', 'aa2a0816ead41cc7d2b9f83092dd992a', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2116', '499087124139ead35c96213a0b683e2a', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2117', '5144eb0c083c6606b1b10127b7b9aee2', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2118', 'ad161b0fccf90a83bb060101c28f3f10', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2119', 'dfe2defa1c1efa8301b746b9508330f3', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2120', '9503e4d1057f5ae6ce2411dfd1d6a83f', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2121', '55bfc7c18569593811071236207e0827', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2122', '2269183dc6d0aaa369d1b5de14f911de', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2123', 'cefb72bc4287f10efb6b24740b3b6792', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2124', '6e34b2467cfa167dc8bf32fc5150d4bc', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2125', 'cb257d08db7a3bf98aca95a4ee884c32', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2126', '0bd0dcb0aa464f280bb70cd09c7b41ad', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2127', 'fca7ab60994db710a5721d6d0988ab0c', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2128', '5347d8375be35355e39e87b1decc03b0', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2129', '2d94d80bf4862aeb509b6d6e4d8058f3', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2130', '7b88d70609f3c5f3f7752948556f34cb', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2131', '34cf3bd98587af638dda8edbd38efa13', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2132', 'abd9ea65f9ee6c703d96dc08c0078fd4', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2133', '5ca64a913ca13048223e22e6e4a3e092', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2134', 'bbf23b2d914ae2165bf3ec395ca56e26', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2135', '38b6974d2246e95030c28e328e0f7293', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2136', '1f284806aeac053ad0f5e176b238d2f7', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2137', 'bb985084761d8d3afd4b7a2ea087f7fe', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2138', '5ded2f0aaca27d93dec64bc00123d86a', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2139', '1e2d0f81a714eb0094c259a8d83f8f51', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2140', '8d91726eaf0491c484b95841d051cb7c', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2141', 'a18634d5a816960ac891c7d95cfe073a', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2142', 'b2b093bf80c1059ef715075043b0e873', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2143', '66521fc8325fe1e6d13628978fce00d5', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2144', '38a3ef14fd70bed7b8fcc36060981571', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2145', 'f46e7a1f034e9458b7f65be05dd37842', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2146', '9423bfc3be2635916054aa2f89092551', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2147', 'c181afc68a8e5f67d7e566d12e59f686', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2148', 'c21671ab25bce034ec951a697b9facd8', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2149', 'e92a46a9f2d2c6afb3d8c237d51f5566', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2150', '23a579117363a4b6b58c5c0ecd0bc65d', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2151', '6f351d4731018059f26f0ac84ddfb374', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2152', 'b3d40ab2654b0e7f4105b67d11b1c4bb', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2153', '865b8b46899208ad2b261a4444f7e3f1', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2154', '8fa96b0329da462f371900ed61640b0c', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2155', 'a4f548617ab985bbb10e80d1fc076122', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2156', '43422fbef1c68286151198aaa59cebbb', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2157', '160ee3e73dcd0714f293b714aafe28d8', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2158', 'b82e831baedc6a9278cd60ce7ecb2038', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2159', '6f462ff402c898ab0c9dba6600ffbb17', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2160', 'f34661e539b1bbe9933a2e55d82293ff', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2161', 'b2e31055a79a467e13cedc6ce0eb6257', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2162', '0a6b907aeb62f758798201a437063b7a', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2163', '18d7c064fd66286fe60652f7a14a7c11', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2164', 'dcbdabeffd13d3a695bbaf6af212ce81', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2165', '397cbb360062df48929b64b129e0f0a6', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2166', 'a1d2a9c03fb6ac8aa1dbea31a0745ffd', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2167', 'e596540f7bb74acec21d0e312413943f', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2168', '379882e12bc46bba03618ded546d3706', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2169', 'd849272388243d7347fffb88879014c1', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2170', 'a70adf7430ccd7d88aebc3b319c2d202', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2171', '93cedc0dd14c3be22a08fad1a7793faa', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2172', '61410e00e109b6e318c3b43f0f28b44b', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2173', 'd9d9f0b0bf494db2df5f03c0c23fe498', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2174', '1c4c3f8c51e23b79d5c05d356ea812d5', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2175', 'd5f93f591fb814258325dd17d2646c57', '已使用', '2016-03-03 11:20:16', '2016-03-03 11:49:09', '1.00');
INSERT INTO `xy_url` VALUES ('2176', '04efabf45e5958ba407b3eb278d475a5', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2177', '860ff113ff4e655c139897f17463efac', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2178', '75d8c7a717251b13b38af486057f1281', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2179', 'a31f1ece9e0940b863a175cb9a9c580c', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2180', '2a33dad8874682c9d5794f2cc86ca43f', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2181', '282442d96fdd4b80e0f661c3261d8cbb', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2182', 'a20d238a93b792eebe6aa0168a61557e', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2183', '4b776f2237bfb72876b4aab838ab2359', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2184', 'eff4c75df0f32953e02ca3f972e22d18', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2185', 'e589389098ed3bea7fc25787e45568f2', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2186', '1f7c5aad9a0461eed4234b1c94d17be1', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2187', '9824bc0c34fef609bc56a83c651f3d9b', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2188', '616341c9e7237bc1a9f53bfb9dd23371', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2189', 'bcb296d48127a49420c148e12842e4cb', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2190', '2b3d497ad67d5e10724857e94984805a', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2191', '0f6631db6ac0690484fa48335dc798ff', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2192', '54716ca7addb09245b20748bccd70f97', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2193', '1d5712f444d6d15110662519b8284427', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2194', 'a92f623e895376f5c7e3c7f7948e84b9', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2195', 'e368747ea4993651fa34d5cd85257153', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2196', 'c271ee70bff9106071091a1a2bf5157f', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2197', 'ec6455aedffb0a60eff4c1ea068a948b', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2198', '06d1498801aafc7a09c76c68d4321077', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2199', '4f580badf24835e9bb531d8f03425000', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2200', '29443635a952b5c18c53b93c3e19241b', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '1.00');
INSERT INTO `xy_url` VALUES ('2201', '4b125a4ae371c3cb43e10b933cb9fd86', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '100.00');
INSERT INTO `xy_url` VALUES ('2202', '513fc3c78762063ed73288a1f6d2da81', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '100.00');
INSERT INTO `xy_url` VALUES ('2203', 'c3a77b7fbce265e95eb8f4508f03f65b', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '100.00');
INSERT INTO `xy_url` VALUES ('2204', '35ffe6c979ed65be916f7b3fe589c56c', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '100.00');
INSERT INTO `xy_url` VALUES ('2205', '7fc836fdfc51e1094ddee79b0e629e7f', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '10.00');
INSERT INTO `xy_url` VALUES ('2206', 'df4a6570ab2be1e428e37b98ab330e75', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '10.00');
INSERT INTO `xy_url` VALUES ('2207', '923321120203a037f04fa13ae98247c7', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '10.00');
INSERT INTO `xy_url` VALUES ('2208', 'f24943a500bed10ce94a18930939d5da', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '10.00');
INSERT INTO `xy_url` VALUES ('2209', '28d67e2c53f137de64212bab473c3e21', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '10.00');
INSERT INTO `xy_url` VALUES ('2210', '4c4c2549bb0f20cde4b50a433ba36b6e', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '5.00');
INSERT INTO `xy_url` VALUES ('2211', '1ba3719a2d4b164d6639a55b2de0005d', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '5.00');
INSERT INTO `xy_url` VALUES ('2212', 'b40fe340cef46c543bbe33636f40d668', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '5.00');
INSERT INTO `xy_url` VALUES ('2213', 'b67c345be2529fbb45dd401293f679c2', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '5.00');
INSERT INTO `xy_url` VALUES ('2214', '24e4530a7a12d27d75ee63404a1fde86', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '5.00');
INSERT INTO `xy_url` VALUES ('2215', 'ce5c1bc384b515bb3cfe47fc2063a436', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '5.00');
INSERT INTO `xy_url` VALUES ('2216', 'd62b8e8a396243d521ea04f2c91f4921', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '5.00');
INSERT INTO `xy_url` VALUES ('2217', '254ba69ba64df54b55258cd7d5d6bc16', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '5.00');
INSERT INTO `xy_url` VALUES ('2218', '4987996107ad138562f1d55728f20232', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '5.00');
INSERT INTO `xy_url` VALUES ('2219', '345bcf5081c6a39fd58af0607a084bf4', '未使用', '2016-03-03 11:20:16', '0000-00-00 00:00:00', '5.00');

-- ----------------------------
-- Table structure for xy_users
-- ----------------------------
DROP TABLE IF EXISTS `xy_users`;
CREATE TABLE `xy_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；sp_password加密',
  `user_nicename` varchar(50) NOT NULL DEFAULT '' COMMENT '用户美名',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网站',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像，相对于upload/avatar目录',
  `sex` smallint(1) DEFAULT '0' COMMENT '性别；0：保密，1：男；2：女',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `signature` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `last_login_ip` varchar(16) DEFAULT NULL COMMENT '最后登录ip',
  `last_login_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '最后登录时间',
  `create_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '注册时间',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `user_type` smallint(1) DEFAULT '1' COMMENT '用户类型，1:admin ;2:会员',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '金币',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of xy_users
-- ----------------------------
INSERT INTO `xy_users` VALUES ('1', 'admin', '###74bf77b9cff885839a35ce3a641ad911', 'admin', 'phprince@163.com', '', null, '0', null, null, '127.0.0.1', '2016-03-03 12:17:35', '2016-03-02 02:11:19', '', '1', '0', '1', '0', '');

-- ----------------------------
-- Table structure for xy_user_favorites
-- ----------------------------
DROP TABLE IF EXISTS `xy_user_favorites`;
CREATE TABLE `xy_user_favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL COMMENT '用户 id',
  `title` varchar(255) DEFAULT NULL COMMENT '收藏内容的标题',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) DEFAULT NULL COMMENT '收藏内容的描述',
  `table` varchar(50) DEFAULT NULL COMMENT '收藏实体以前所在表，不带前缀',
  `object_id` int(11) DEFAULT NULL COMMENT '收藏内容原来的主键id',
  `createtime` int(11) DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户收藏表';

-- ----------------------------
-- Records of xy_user_favorites
-- ----------------------------
