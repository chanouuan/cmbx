/*
 Navicat Premium Data Transfer

 Source Server         : 120.79.64.144_3306
 Source Server Type    : MySQL
 Source Server Version : 50616
 Source Host           : 120.79.64.144:3306
 Source Schema         : chemi_api_v1

 Target Server Type    : MySQL
 Target Server Version : 50616
 File Encoding         : 65001

 Date: 27/09/2019 17:20:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_failedlogin
-- ----------------------------
DROP TABLE IF EXISTS `admin_failedlogin`;
CREATE TABLE `admin_failedlogin`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `account` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `login_count` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '登录次数',
  `update_time` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account`(`account`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '错误登录次数记录表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of admin_failedlogin
-- ----------------------------
INSERT INTO `admin_failedlogin` VALUES (1, 'lxy', 6, 1554082546);
INSERT INTO `admin_failedlogin` VALUES (2, 'xiaocang', 3, 1553741063);
INSERT INTO `admin_failedlogin` VALUES (3, '111', 1, 1560908927);
INSERT INTO `admin_failedlogin` VALUES (4, 'chenbo', 2, 1557567450);
INSERT INTO `admin_failedlogin` VALUES (5, '18798799483', 2, 1553586613);
INSERT INTO `admin_failedlogin` VALUES (6, 'zxy', 1, 1553591067);
INSERT INTO `admin_failedlogin` VALUES (7, 'admin', 2, 1567127935);
INSERT INTO `admin_failedlogin` VALUES (8, 'quan18798799483', 2, 1554799141);
INSERT INTO `admin_failedlogin` VALUES (9, 'test', 1, 1553670039);
INSERT INTO `admin_failedlogin` VALUES (10, 'quanquan', 1, 1553928732);
INSERT INTO `admin_failedlogin` VALUES (11, '18798799482', 2, 1553706891);
INSERT INTO `admin_failedlogin` VALUES (12, 'abc123', 2, 1554721335);
INSERT INTO `admin_failedlogin` VALUES (13, 'dev', 1, 1554799789);
INSERT INTO `admin_failedlogin` VALUES (14, '1112', 1, 1555386619);
INSERT INTO `admin_failedlogin` VALUES (15, 'ykl', 1, 1559714438);
INSERT INTO `admin_failedlogin` VALUES (16, 'hgyys', 2, 1566203051);
INSERT INTO `admin_failedlogin` VALUES (17, '2222', 1, 1566440426);

-- ----------------------------
-- Table structure for admin_permission_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_permission_role`;
CREATE TABLE `admin_permission_role`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '角色ID',
  `permission_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '权限ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index`(`role_id`, `permission_id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色权限关联表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of admin_permission_role
-- ----------------------------
INSERT INTO `admin_permission_role` VALUES (1, 1, 1);

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES (1, 'ANY', '所有权限');
INSERT INTO `admin_permissions` VALUES (2, 'login', '登录操作');

-- ----------------------------
-- Table structure for admin_role_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_user`;
CREATE TABLE `admin_role_user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `platform` int(10) UNSIGNED NULL DEFAULT NULL,
  `user_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '用户ID',
  `role_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index`(`platform`, `user_id`, `role_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色权限关联表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of admin_role_user
-- ----------------------------
INSERT INTO `admin_role_user` VALUES (1, 1, 48225, 1);
INSERT INTO `admin_role_user` VALUES (2, 4, 37186, 1);

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES (1, '管理员', '管理员角色，拥有所有操作权限');

-- ----------------------------
-- Table structure for baoxian_company
-- ----------------------------
DROP TABLE IF EXISTS `baoxian_company`;
CREATE TABLE `baoxian_company`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  `tel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `logo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'logo图标',
  `app_coupon` int(10) UNSIGNED NULL DEFAULT 0 COMMENT 'APP优惠方案ID',
  `agent_coupon` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '代理优惠方案ID',
  `order_type` tinyint(3) UNSIGNED NULL DEFAULT 1 COMMENT '出单类型：1 壁虎车险',
  `status` tinyint(3) UNSIGNED NULL DEFAULT 1 COMMENT '状态：0 禁用 1 启用',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4099 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '保险公司' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of baoxian_company
-- ----------------------------
INSERT INTO `baoxian_company` VALUES (1, '太平洋', NULL, 'http://www.epicc.com.cn/images/site_logo.png', 1, 0, 1, 1, NULL, NULL);
INSERT INTO `baoxian_company` VALUES (2, '平安', NULL, 'http://www.epicc.com.cn/images/site_logo.png', 1, 0, 1, 1, NULL, NULL);
INSERT INTO `baoxian_company` VALUES (4, '人保', NULL, 'http://www.epicc.com.cn/images/site_logo.png', 1, 0, 1, 1, NULL, NULL);
INSERT INTO `baoxian_company` VALUES (8, '国寿财', NULL, 'http://www.epicc.com.cn/images/site_logo.png', 1, 0, 1, 1, NULL, NULL);
INSERT INTO `baoxian_company` VALUES (16, '中华联合', NULL, 'http://www.epicc.com.cn/images/site_logo.png', 1, 0, 1, 1, NULL, NULL);
INSERT INTO `baoxian_company` VALUES (32, '大地', NULL, 'http://www.epicc.com.cn/images/site_logo.png', 1, 0, 1, 1, NULL, NULL);
INSERT INTO `baoxian_company` VALUES (64, '阳光', NULL, 'http://www.epicc.com.cn/images/site_logo.png', 1, 0, 1, 1, NULL, NULL);
INSERT INTO `baoxian_company` VALUES (128, '太平保险', NULL, 'http://www.epicc.com.cn/images/site_logo.png', 1, 0, 1, 1, NULL, NULL);
INSERT INTO `baoxian_company` VALUES (256, '华安', NULL, 'http://www.epicc.com.cn/images/site_logo.png', 1, 0, 1, 1, NULL, NULL);
INSERT INTO `baoxian_company` VALUES (512, '天安', NULL, 'http://www.epicc.com.cn/images/site_logo.png', 1, 0, 1, 1, NULL, NULL);
INSERT INTO `baoxian_company` VALUES (1024, '英大', NULL, 'http://www.epicc.com.cn/images/site_logo.png', 1, 0, 1, 1, NULL, NULL);
INSERT INTO `baoxian_company` VALUES (2048, '安盛天平', NULL, 'http://www.epicc.com.cn/images/site_logo.png', 1, 0, 1, 1, NULL, NULL);
INSERT INTO `baoxian_company` VALUES (4096, '安心', NULL, 'http://www.epicc.com.cn/images/site_logo.png', 1, 0, 1, 1, NULL, NULL);
INSERT INTO `baoxian_company` VALUES (4097, '保险1', NULL, NULL, 23, 22, 1, 1, '2019-02-27 06:29:27', NULL);
INSERT INTO `baoxian_company` VALUES (4098, '保险123', NULL, NULL, 19, 24, 1, 1, '2019-03-08 09:57:15', NULL);

-- ----------------------------
-- Table structure for baoxian_config
-- ----------------------------
DROP TABLE IF EXISTS `baoxian_config`;
CREATE TABLE `baoxian_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '配置名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据类型',
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '数据内容',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 87 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of baoxian_config
-- ----------------------------
INSERT INTO `baoxian_config` VALUES (1, 'ORDER_PAGE_COUNT', 'number', '0', '订单分表计数，请勿修改！', NULL, NULL);
INSERT INTO `baoxian_config` VALUES (2, 'RECOMMEND_BASE_TAXPAY', 'number', '1', '车船税（代缴）', '2019-02-28 16:05:54', '2019-02-28 16:07:56');
INSERT INTO `baoxian_config` VALUES (5, 'RECOMMEND_BASE_DAOQIANG', 'number', '1', '盗抢险', '2019-02-28 16:05:55', '2019-02-28 16:07:57');
INSERT INTO `baoxian_config` VALUES (6, 'RECOMMEND_BASE_BUJIMIAN_DAOQIANG', 'number', '1', '不计免赔', '2019-02-28 16:05:55', '2019-03-07 17:26:47');
INSERT INTO `baoxian_config` VALUES (52, 'RECOMMEND_BASE_BUJIMIAN_ZIRAN', 'number', '1', '不计免赔', '2019-03-07 17:26:50', '2019-03-07 17:26:50');
INSERT INTO `baoxian_config` VALUES (9, 'RECOMMEND_BASE_LOSTSPECIAL', 'number', '1', '无法找到第三方特约险', '2019-02-28 16:05:56', '2019-02-28 16:07:58');
INSERT INTO `baoxian_config` VALUES (10, 'RECOMMEND_BASE_BUJIMIAN_LOSTSPECIAL', 'number', '1', '不计免赔', '2019-02-28 16:05:56', '2019-03-07 17:26:48');
INSERT INTO `baoxian_config` VALUES (24, 'RECOMMEND_BASE_SIJI', 'number', '10', '司机责任险', '2019-03-06 19:10:13', '2019-03-06 22:07:15');
INSERT INTO `baoxian_config` VALUES (42, 'RECOMMEND_BEST_SIJI', 'number', '1', '司机责任险', '2019-03-06 22:17:09', '2019-03-06 22:17:09');
INSERT INTO `baoxian_config` VALUES (12, 'RECOMMEND_HOT_CHESUN', 'number', '1', '机动车损失险', '2019-02-28 16:12:44', '2019-02-28 16:12:44');
INSERT INTO `baoxian_config` VALUES (50, 'RECOMMEND_BASE_BUJIMIAN_HUAHEN', 'number', '1', '不计免赔', '2019-03-07 17:26:49', '2019-03-07 17:26:49');
INSERT INTO `baoxian_config` VALUES (49, 'RECOMMEND_BASE_HUAHEN', 'number', '20000', '划痕险', '2019-03-07 17:26:49', '2019-03-07 17:26:49');
INSERT INTO `baoxian_config` VALUES (18, 'RECOMMEND_BEST_TAXPAY', 'number', '1', '车船税（代缴）', '2019-02-28 17:47:06', '2019-02-28 17:47:06');
INSERT INTO `baoxian_config` VALUES (19, 'RECOMMEND_BEST_CHESUN', 'number', '1', '机动车损失险', '2019-02-28 17:47:06', '2019-02-28 17:47:06');
INSERT INTO `baoxian_config` VALUES (20, 'RECOMMEND_BEST_BUJIMIAN_CHESUN', 'number', '1', '不计免赔', '2019-02-28 17:47:06', '2019-03-07 17:54:29');
INSERT INTO `baoxian_config` VALUES (21, 'RECOMMEND_BEST_DAOQIANG', 'number', '1', '盗抢险', '2019-02-28 17:47:07', '2019-02-28 17:47:07');
INSERT INTO `baoxian_config` VALUES (22, 'RECOMMEND_BEST_BUJIMIAN_DAOQIANG', 'number', '1', '不计免赔', '2019-02-28 17:47:07', '2019-03-07 17:54:29');
INSERT INTO `baoxian_config` VALUES (44, 'RECOMMEND_HOT_FORCEINSURANCE', 'number', '1', '交强险', '2019-03-07 17:26:02', '2019-03-07 17:26:02');
INSERT INTO `baoxian_config` VALUES (25, 'RECOMMEND_BASE_SANZHE', 'number', '10', '第三者责任险', '2019-03-06 19:12:42', '2019-03-06 19:12:42');
INSERT INTO `baoxian_config` VALUES (26, 'RECOMMEND_BASE_CHENGKE', 'number', '20', '乘客责任险', '2019-03-06 19:12:43', '2019-03-07 17:26:48');
INSERT INTO `baoxian_config` VALUES (27, 'RECOMMEND_BASE_BUJIMIAN_SIJI', 'number', '1', '不计免赔', '2019-03-06 21:24:21', '2019-03-07 17:26:48');
INSERT INTO `baoxian_config` VALUES (28, 'RECOMMEND_BASE_BUJIMIAN_CHENGKE', 'number', '1', '不计免赔', '2019-03-06 21:24:22', '2019-03-07 17:26:48');
INSERT INTO `baoxian_config` VALUES (29, 'RECOMMEND_BASE_SHESHUI', 'number', '1', '涉水险', '2019-03-06 21:24:22', '2019-03-06 21:24:22');
INSERT INTO `baoxian_config` VALUES (30, 'RECOMMEND_BASE_BOLI', 'number', '2', '玻璃险', '2019-03-06 21:24:22', '2019-03-06 22:07:29');
INSERT INTO `baoxian_config` VALUES (31, 'RECOMMEND_BASE_BUJIMIAN_SANZHE', 'number', '1', '不计免赔', '2019-03-06 21:47:41', '2019-03-07 17:26:47');
INSERT INTO `baoxian_config` VALUES (32, 'RECOMMEND_BASE_SANZHEHOLIDAYDOUBLE', 'number', '1', '三者节假日翻倍险', '2019-03-06 22:07:44', '2019-03-06 22:07:44');
INSERT INTO `baoxian_config` VALUES (33, 'RECOMMEND_HOT_SANZHE', 'number', '10', '第三者责任险', '2019-03-06 22:08:01', '2019-03-07 17:26:02');
INSERT INTO `baoxian_config` VALUES (51, 'RECOMMEND_BASE_ZIRAN', 'number', '1', '自燃损失险', '2019-03-07 17:26:50', '2019-03-07 17:26:50');
INSERT INTO `baoxian_config` VALUES (45, 'RECOMMEND_BASE_FORCEINSURANCE', 'number', '1', '交强险', '2019-03-07 17:26:46', '2019-03-07 17:26:46');
INSERT INTO `baoxian_config` VALUES (46, 'RECOMMEND_BASE_CHESUN', 'number', '1', '机动车损失险', '2019-03-07 17:26:46', '2019-03-07 17:26:46');
INSERT INTO `baoxian_config` VALUES (47, 'RECOMMEND_BASE_BUJIMIAN_CHESUN', 'number', '1', '不计免赔', '2019-03-07 17:26:46', '2019-03-07 17:26:46');
INSERT INTO `baoxian_config` VALUES (48, 'RECOMMEND_BASE_BUJIMIAN_SHESHUI', 'number', '1', '不计免赔', '2019-03-07 17:26:49', '2019-03-07 17:26:49');
INSERT INTO `baoxian_config` VALUES (39, 'RECOMMEND_BEST_FORCEINSURANCE', 'number', '1', '交强险', '2019-03-06 22:09:22', '2019-03-06 22:09:22');
INSERT INTO `baoxian_config` VALUES (40, 'RECOMMEND_BEST_SANZHE', 'number', '150', '第三者责任险', '2019-03-06 22:09:22', '2019-03-06 22:09:22');
INSERT INTO `baoxian_config` VALUES (41, 'RECOMMEND_BEST_BUJIMIAN_SANZHE', 'number', '1', '不计免赔', '2019-03-06 22:09:23', '2019-03-07 17:54:29');
INSERT INTO `baoxian_config` VALUES (43, 'RECOMMEND_BEST_BUJIMIAN_SIJI', 'number', '1', '不计免赔', '2019-03-06 22:17:09', '2019-03-07 17:54:30');
INSERT INTO `baoxian_config` VALUES (53, 'RECOMMEND_BASE_TAKESPECAILREPAIR', 'number', '1', '指定专修厂险', '2019-03-07 17:26:50', '2019-03-07 17:26:50');
INSERT INTO `baoxian_config` VALUES (54, 'RECOMMEND_HOT_TAXPAY', 'number', '1', '车船税（代缴）', '2019-03-07 17:33:53', '2019-03-07 17:33:53');
INSERT INTO `baoxian_config` VALUES (55, 'RECOMMEND_HOT_BUJIMIAN_CHESUN', 'number', '1', '不计免赔', '2019-03-07 17:33:53', '2019-03-07 17:34:04');
INSERT INTO `baoxian_config` VALUES (56, 'RECOMMEND_HOT_BUJIMIAN_SANZHE', 'number', '1', '不计免赔', '2019-03-07 17:33:53', '2019-03-07 17:34:04');
INSERT INTO `baoxian_config` VALUES (57, 'RECOMMEND_HOT_BUJIMIAN_DAOQIANG', 'number', '1', '不计免赔', '2019-03-07 17:33:54', '2019-03-07 17:34:05');
INSERT INTO `baoxian_config` VALUES (58, 'RECOMMEND_HOT_SIJI', 'number', '20', '司机责任险', '2019-03-07 17:33:54', '2019-03-07 17:33:54');
INSERT INTO `baoxian_config` VALUES (59, 'RECOMMEND_HOT_BUJIMIAN_SIJI', 'number', '1', '不计免赔', '2019-03-07 17:33:54', '2019-03-07 17:34:05');
INSERT INTO `baoxian_config` VALUES (60, 'RECOMMEND_HOT_CHENGKE', 'number', '20', '乘客责任险', '2019-03-07 17:33:55', '2019-03-07 17:33:55');
INSERT INTO `baoxian_config` VALUES (61, 'RECOMMEND_HOT_BUJIMIAN_CHENGKE', 'number', '1', '不计免赔', '2019-03-07 17:33:55', '2019-03-07 17:34:05');
INSERT INTO `baoxian_config` VALUES (62, 'RECOMMEND_HOT_LOSTSPECIAL', 'number', '1', '无法找到第三方特约险', '2019-03-07 17:33:55', '2019-03-07 17:33:55');
INSERT INTO `baoxian_config` VALUES (63, 'RECOMMEND_HOT_BUJIMIAN_LOSTSPECIAL', 'number', '1', '不计免赔', '2019-03-07 17:33:55', '2019-03-07 17:34:06');
INSERT INTO `baoxian_config` VALUES (64, 'RECOMMEND_HOT_SHESHUI', 'number', '1', '涉水险', '2019-03-07 17:33:56', '2019-03-07 17:33:56');
INSERT INTO `baoxian_config` VALUES (65, 'RECOMMEND_HOT_BUJIMIAN_SHESHUI', 'number', '1', '不计免赔', '2019-03-07 17:33:56', '2019-03-07 17:34:06');
INSERT INTO `baoxian_config` VALUES (66, 'RECOMMEND_HOT_BOLI', 'number', '2', '玻璃险', '2019-03-07 17:33:56', '2019-03-07 17:33:56');
INSERT INTO `baoxian_config` VALUES (67, 'RECOMMEND_HOT_HUAHEN', 'number', '20000', '划痕险', '2019-03-07 17:33:56', '2019-03-07 17:33:56');
INSERT INTO `baoxian_config` VALUES (68, 'RECOMMEND_HOT_BUJIMIAN_HUAHEN', 'number', '1', '不计免赔', '2019-03-07 17:33:56', '2019-03-07 17:34:07');
INSERT INTO `baoxian_config` VALUES (69, 'RECOMMEND_HOT_ZIRAN', 'number', '1', '自燃损失险', '2019-03-07 17:33:57', '2019-03-07 17:33:57');
INSERT INTO `baoxian_config` VALUES (70, 'RECOMMEND_HOT_BUJIMIAN_ZIRAN', 'number', '1', '不计免赔', '2019-03-07 17:33:57', '2019-03-07 17:34:07');
INSERT INTO `baoxian_config` VALUES (71, 'RECOMMEND_HOT_TAKESPECAILREPAIR', 'number', '1', '指定专修厂险', '2019-03-07 17:33:57', '2019-03-07 17:33:57');
INSERT INTO `baoxian_config` VALUES (72, 'RECOMMEND_HOT_SANZHEHOLIDAYDOUBLE', 'number', '1', '三者节假日翻倍险', '2019-03-07 17:33:57', '2019-03-07 17:33:57');
INSERT INTO `baoxian_config` VALUES (73, 'RECOMMEND_HOT_DAOQIANG', 'number', '1', '盗抢险', '2019-03-07 17:34:04', '2019-03-07 17:34:04');
INSERT INTO `baoxian_config` VALUES (74, 'RECOMMEND_BEST_CHENGKE', 'number', '10', '乘客责任险', '2019-03-07 17:36:28', '2019-03-07 17:36:28');
INSERT INTO `baoxian_config` VALUES (75, 'RECOMMEND_BEST_BUJIMIAN_CHENGKE', 'number', '1', '不计免赔', '2019-03-07 17:36:28', '2019-03-07 17:54:30');
INSERT INTO `baoxian_config` VALUES (76, 'RECOMMEND_BEST_LOSTSPECIAL', 'number', '1', '无法找到第三方特约险', '2019-03-07 17:36:28', '2019-03-07 17:36:28');
INSERT INTO `baoxian_config` VALUES (77, 'RECOMMEND_BEST_BUJIMIAN_LOSTSPECIAL', 'number', '1', '不计免赔', '2019-03-07 17:36:28', '2019-03-07 17:54:30');
INSERT INTO `baoxian_config` VALUES (78, 'RECOMMEND_BEST_SHESHUI', 'number', '1', '涉水险', '2019-03-07 17:36:29', '2019-03-07 17:36:29');
INSERT INTO `baoxian_config` VALUES (79, 'RECOMMEND_BEST_BUJIMIAN_SHESHUI', 'number', '1', '不计免赔', '2019-03-07 17:36:29', '2019-03-07 17:54:31');
INSERT INTO `baoxian_config` VALUES (80, 'RECOMMEND_BEST_BOLI', 'number', '1', '玻璃险', '2019-03-07 17:36:29', '2019-03-07 17:36:29');
INSERT INTO `baoxian_config` VALUES (81, 'RECOMMEND_BEST_HUAHEN', 'number', '20000', '划痕险', '2019-03-07 17:36:29', '2019-03-07 17:36:29');
INSERT INTO `baoxian_config` VALUES (82, 'RECOMMEND_BEST_BUJIMIAN_HUAHEN', 'number', '1', '不计免赔', '2019-03-07 17:36:29', '2019-03-07 17:54:31');
INSERT INTO `baoxian_config` VALUES (83, 'RECOMMEND_BEST_ZIRAN', 'number', '1', '自燃损失险', '2019-03-07 17:36:30', '2019-03-07 17:36:30');
INSERT INTO `baoxian_config` VALUES (84, 'RECOMMEND_BEST_BUJIMIAN_ZIRAN', 'number', '1', '不计免赔', '2019-03-07 17:36:30', '2019-03-07 17:54:32');
INSERT INTO `baoxian_config` VALUES (85, 'RECOMMEND_BEST_TAKESPECAILREPAIR', 'number', '1', '指定专修厂险', '2019-03-07 17:36:30', '2019-03-07 17:36:30');
INSERT INTO `baoxian_config` VALUES (86, 'RECOMMEND_BEST_SANZHEHOLIDAYDOUBLE', 'number', '1', '三者节假日翻倍险', '2019-03-07 17:36:30', '2019-03-07 17:36:30');

-- ----------------------------
-- Table structure for baoxian_coupon_plan
-- ----------------------------
DROP TABLE IF EXISTS `baoxian_coupon_plan`;
CREATE TABLE `baoxian_coupon_plan`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '方案名称',
  `type` tinyint(3) UNSIGNED NULL DEFAULT 1 COMMENT '方案类型：1 APP优惠 2 代理优惠',
  `main` tinyint(3) UNSIGNED NULL DEFAULT 1 COMMENT '返还内容：1 交强+商业 2 交强险 3 商业险',
  `common_rate` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '通用劵返还比例 0-100',
  `park_rate` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '停车劵返还比例 0-100',
  `maintain_rate` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '洗车保养劵返还比例 0-100',
  `insurance_rate` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '保险劵返还比例 0-100',
  `commission_rate` tinyint(3) UNSIGNED NULL DEFAULT NULL COMMENT '佣金比例 0-100',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '保险优惠劵方案' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of baoxian_coupon_plan
-- ----------------------------
INSERT INTO `baoxian_coupon_plan` VALUES (15, '优惠方案2', 1, 1, 4, 5, 6, 0, NULL, '2019-03-04 11:48:28', NULL);
INSERT INTO `baoxian_coupon_plan` VALUES (16, '方案23', 1, 2, 2, 3, 4, 0, NULL, '2019-03-04 11:50:30', NULL);
INSERT INTO `baoxian_coupon_plan` VALUES (19, '方案122', 1, 2, 3, 2, 3, 0, NULL, '2019-03-04 12:02:26', NULL);
INSERT INTO `baoxian_coupon_plan` VALUES (20, '方案22', 2, 2, 2, 3, 4, 0, NULL, '2019-03-04 13:52:11', NULL);
INSERT INTO `baoxian_coupon_plan` VALUES (21, '方案24', 2, 2, 4, 5, 2, 0, NULL, '2019-03-04 14:00:05', NULL);
INSERT INTO `baoxian_coupon_plan` VALUES (22, '代理优惠方案', 2, 2, 2, 0, 2, 0, 12, '2019-03-04 16:10:22', NULL);
INSERT INTO `baoxian_coupon_plan` VALUES (23, 'app优惠方案', 1, 2, 1, 2, 3, 0, NULL, '2019-03-04 16:11:23', NULL);
INSERT INTO `baoxian_coupon_plan` VALUES (24, '方案123', 2, 2, 0, 0, 2, 2, 2, '2019-03-08 09:36:59', NULL);
INSERT INTO `baoxian_coupon_plan` VALUES (25, '优惠方案233', 2, 2, 0, 1, 2, 1, 2, '2019-03-08 09:56:54', NULL);

-- ----------------------------
-- Table structure for baoxian_error
-- ----------------------------
DROP TABLE IF EXISTS `baoxian_error`;
CREATE TABLE `baoxian_error`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `url` varchar(800) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求地址',
  `files` varchar(800) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件路径',
  `lines` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '错误行数',
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '错误信息',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求参数',
  `status` tinyint(3) UNSIGNED NULL DEFAULT NULL COMMENT '错误状态跟踪;1:等受理;2:已受理;3:跟进中;0:已完成',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '生成时间',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `from` tinyint(3) UNSIGNED NULL DEFAULT NULL COMMENT '来源:1:安卓;2:ios;3:车秘后台',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 287 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统错误信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of baoxian_error
-- ----------------------------
INSERT INTO `baoxian_error` VALUES (1, '/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-02-26 03:33:53', '2019-02-26 03:33:53', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (2, '/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-02-26 03:38:19', '2019-02-26 03:38:19', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (3, '/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-02-26 03:40:17', '2019-02-26 03:40:17', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (4, '/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-02-26 03:45:51', '2019-02-26 03:45:51', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (5, '/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-02-26 03:47:40', '2019-02-26 03:47:40', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (6, '/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-02-26 03:48:19', '2019-02-26 03:48:19', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (7, '/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-02-26 03:50:28', '2019-02-26 03:50:28', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (8, '/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-02-26 03:51:07', '2019-02-26 03:51:07', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (9, '/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-02-26 03:51:40', '2019-02-26 03:51:40', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (10, '/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-02-26 03:51:54', '2019-02-26 03:51:54', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (11, '/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-02-26 03:52:01', '2019-02-26 03:52:01', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (12, '/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-02-26 03:52:36', '2019-02-26 03:52:36', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (13, '/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-02-26 03:53:16', '2019-02-26 03:53:16', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (14, '/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-02-26 03:54:49', '2019-02-26 03:54:49', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (15, '/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-02-26 03:55:37', '2019-02-26 03:55:37', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (16, '/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-02-26 03:58:28', '2019-02-26 03:58:28', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (17, '/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-02-26 04:02:17', '2019-02-26 04:02:17', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (18, '/api/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 78, '方案名称为空', '[]', 1, '2019-02-26 05:46:19', '2019-02-26 05:46:19', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (19, '/api/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 78, '方案名称为空', '[]', 1, '2019-02-26 05:46:40', '2019-02-26 05:46:40', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (20, '/api/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 78, '方案名称为空', '[]', 1, '2019-02-26 05:47:52', '2019-02-26 05:47:52', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (21, '/api/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 78, '方案名称为空', '[]', 1, '2019-02-26 05:51:54', '2019-02-26 05:51:54', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (22, '/api/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 78, '方案名称为空', '[]', 1, '2019-02-26 05:53:34', '2019-02-26 05:53:34', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (23, '/api/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 78, '方案名称为空', '[]', 1, '2019-02-26 05:54:05', '2019-02-26 05:54:05', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (24, '/api/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 78, '方案名称为空', '[]', 1, '2019-02-26 05:54:44', '2019-02-26 05:54:44', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (25, '/api/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 78, '方案名称为空', '[]', 1, '2019-02-26 05:54:59', '2019-02-26 05:54:59', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (26, '/api/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 78, '方案名称为空', '[]', 1, '2019-02-26 05:59:52', '2019-02-26 05:59:52', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (27, '/api/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 78, '方案名称为空', '[]', 1, '2019-02-26 06:01:45', '2019-02-26 06:01:45', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (28, '/api/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 78, '方案名称为空', '[]', 1, '2019-02-26 06:02:46', '2019-02-26 06:02:46', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (29, '/api/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 78, '方案名称为空', '[]', 1, '2019-02-26 06:03:05', '2019-02-26 06:03:05', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (30, '/api/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 78, '方案名称为空', '[]', 1, '2019-02-26 06:03:58', '2019-02-26 06:03:58', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (31, '/api/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 78, '方案名称为空', '[]', 1, '2019-02-26 06:04:21', '2019-02-26 06:04:21', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (32, '/api/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 78, '方案名称为空', '[]', 1, '2019-02-26 06:04:34', '2019-02-26 06:04:34', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (33, '/api/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 78, '方案名称为空', '[]', 1, '2019-02-26 06:04:44', '2019-02-26 06:04:44', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (34, '/api/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 78, '方案名称为空', '[]', 1, '2019-02-26 06:05:07', '2019-02-26 06:05:07', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (35, '/api/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 78, '方案名称为空', '[]', 1, '2019-02-26 06:05:38', '2019-02-26 06:05:38', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (36, '/api/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 78, '方案名称为空', '[]', 1, '2019-02-26 06:06:04', '2019-02-26 06:06:04', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (37, '/api/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 78, '方案名称为空', '[]', 1, '2019-02-26 06:06:13', '2019-02-26 06:06:13', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (38, '/api/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 78, '方案名称为空', '[]', 1, '2019-02-26 06:06:55', '2019-02-26 06:06:55', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (39, '/api/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 78, '方案名称为空', '[]', 1, '2019-02-26 06:07:09', '2019-02-26 06:07:09', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (40, '/api/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 78, '方案名称为空', '[]', 1, '2019-02-26 06:07:27', '2019-02-26 06:07:27', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (41, '/api/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 78, '方案名称为空', '[]', 1, '2019-02-26 06:08:00', '2019-02-26 06:08:00', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (42, '/api/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 78, '方案名称为空', '[]', 1, '2019-02-26 06:10:42', '2019-02-26 06:10:42', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (43, '/api/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 78, '请输入方案类型', '{\"name\":\"\\u4f18\\u60e0\\u52381\"}', 1, '2019-02-26 06:11:55', '2019-02-26 06:11:55', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (44, '/api/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Database/Connection.php', 664, 'SQLSTATE[42S22]: Column not found: 1054 Unknown column \'create_time\' in \'field list\' (SQL: insert into `baoxian_coupon_plan` (`name`, `type`, `main`, `create_time`) values (优惠券1, 1, 2, 2019-02-26 06:12:30))', '{\"name\":\"\\u4f18\\u60e0\\u52381\",\"type\":\"1\",\"main\":\"2\"}', 1, '2019-02-26 06:12:30', '2019-02-26 06:12:30', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (45, '/api/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/ApiController.php', 33, 'Argument 1 passed to App\\Http\\Controllers\\Admin\\ApiController::_success() must be of the type array, integer given, called in /Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php on line 81', '{\"name\":\"\\u4f18\\u60e0\\u52381\",\"type\":\"1\",\"main\":\"2\"}', 1, '2019-02-26 06:14:21', '2019-02-26 06:14:21', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (46, '/api/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 78, '通用劵返还比例必须为整数', '{\"name\":\"\\u4f18\\u60e0\\u52381\",\"type\":\"1\",\"main\":\"2\",\"common_rate\":\"s\"}', 1, '2019-02-26 06:24:04', '2019-02-26 06:24:04', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (47, '/api/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 78, '通用劵返还比例必须为0-100的整数', '{\"name\":\"\\u4f18\\u60e0\\u52381\",\"type\":\"1\",\"main\":\"2\",\"common_rate\":\"1000\"}', 1, '2019-02-26 06:32:11', '2019-02-26 06:32:11', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (48, '/api/admin/coupon/retrieve/6', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/ApiController.php', 33, 'Argument 1 passed to App\\Http\\Controllers\\Admin\\ApiController::_success() must be of the type array, object given, called in /Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php on line 102', '{\"s\":\"\\/api\\/admin\\/coupon\\/retrieve\\/6\"}', 1, '2019-02-26 06:56:41', '2019-02-26 06:56:41', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (49, '/api/admin/coupon/retrieve/6', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 104, '', '{\"s\":\"\\/api\\/admin\\/coupon\\/retrieve\\/6\"}', 1, '2019-02-26 06:57:19', '2019-02-26 06:57:19', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (50, '/api/admin/coupon/retrieve/6', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 104, '优惠券方案不存在', '{\"s\":\"\\/api\\/admin\\/coupon\\/retrieve\\/6\"}', 1, '2019-02-26 06:58:37', '2019-02-26 06:58:37', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (51, '/api/admin/coupon/retrieveall', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '{\"s\":\"\\/api\\/admin\\/coupon\\/retrieveall\"}', 1, '2019-02-26 07:16:34', '2019-02-26 07:16:34', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (52, '/swagger/index', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/zircote/swagger-php/src/Logger.php', 38, '$ref \"#/definitions/ReceiveAddress\" not found for @SWG\\Items() in \\App\\Http\\Controllers\\Admin\\CouponController->retrieve() in /Users/yangkunlin/git/chemi_api_insurance.com/app/Http/../Http/Controllers/Admin/CouponController.php on line 72', '{\"s\":\"\\/swagger\\/index\"}', 1, '2019-02-26 08:50:48', '2019-02-26 08:50:48', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (53, '/swagger/index', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/zircote/swagger-php/src/Logger.php', 38, 'definition is already defined for object \"Swagger\\Annotations\\Definition\" in /Users/yangkunlin/git/chemi_api_insurance.com/app/Http/../Http/Model/BaseModel.php on line 21', '{\"s\":\"\\/swagger\\/index\"}', 1, '2019-02-26 10:10:10', '2019-02-26 10:10:10', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (54, '/coupon/retrieveall', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '{\"s\":\"\\/coupon\\/retrieveall\"}', 1, '2019-02-26 10:21:11', '2019-02-26 10:21:11', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (55, '/admin/coupon/retrieveall', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '{\"s\":\"\\/admin\\/coupon\\/retrieveall\"}', 1, '2019-02-26 10:22:21', '2019-02-26 10:22:21', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (56, '/api/admin/coupon/retrieve', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '{\"s\":\"\\/api\\/admin\\/coupon\\/retrieve\"}', 1, '2019-02-26 10:29:19', '2019-02-26 10:29:19', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (57, '/api/admin/coupon/retrieve', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '{\"s\":\"\\/api\\/admin\\/coupon\\/retrieve\"}', 1, '2019-02-26 10:30:37', '2019-02-26 10:30:37', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (58, '/api/admin/coupon/update/7', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '{\"name\":\"\\u65b9\\u68481\",\"type\":\"1\",\"main\":\"3\",\"common_rate\":\"100\",\"maintain_rate\":\"3\"}', 1, '2019-02-27 02:01:30', '2019-02-27 02:01:30', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (59, '/api/admin/coupon/update/7', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 259, '优惠券方案不存在', '{\"name\":\"\\u65b9\\u68481\",\"type\":\"1\",\"main\":\"3\",\"common_rate\":\"100\",\"maintain_rate\":\"3\"}', 1, '2019-02-27 02:02:16', '2019-02-27 02:02:16', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (60, '/api/admin/coupon/delete/9', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 308, '删除优惠券方案失败', '[]', 1, '2019-02-27 02:11:13', '2019-02-27 02:11:13', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (61, '/api/admin/coupon/delete/2', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 308, '删除优惠券方案失败', '[]', 1, '2019-02-27 02:11:47', '2019-02-27 02:11:47', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (62, '/api/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 98, '优惠方案名称不可重名', '{\"name\":\"\\u4f18\\u60e0\\u52381\",\"type\":\"2\",\"main\":\"2\",\"common_rate\":\"100\"}', 1, '2019-02-27 03:43:21', '2019-02-27 03:43:21', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (63, '/api/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 98, '优惠方案名称不可重名', '{\"name\":\"\\u4f18\\u60e0\\u52382\",\"type\":\"2\",\"main\":\"2\",\"common_rate\":\"100\"}', 1, '2019-02-27 03:43:48', '2019-02-27 03:43:48', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (64, '/api/admin/company/create', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '{\"name\":\"\\u4fdd\\u96691\",\"app_coupon\":\"2\",\"agent_coupon\":\"3\",\"order_type\":\"1\"}', 1, '2019-02-27 06:12:22', '2019-02-27 06:12:22', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (65, '/api/admin/company/create', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Rules/CompanyRule.php', 25, 'Class \'App\\Model\\Company\' not found', '{\"name\":\"\\u4fdd\\u96691\",\"app_coupon\":\"2\",\"agent_coupon\":\"3\",\"order_type\":\"1\"}', 1, '2019-02-27 06:13:52', '2019-02-27 06:13:52', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (66, '/api/admin/company/create', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Rules/CompanyRule.php', 25, 'Class \'App\\Model\\Company\' not found', '{\"name\":\"\\u4fdd\\u96691\",\"app_coupon\":\"2\",\"agent_coupon\":\"3\",\"order_type\":\"1\"}', 1, '2019-02-27 06:19:07', '2019-02-27 06:19:07', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (67, '/api/admin/company/create', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Rules/CompanyRule.php', 25, 'Class \'App\\Model\\Company\' not found', '{\"name\":\"\\u4fdd\\u96691\",\"app_coupon\":\"2\",\"agent_coupon\":\"3\",\"order_type\":\"1\"}', 1, '2019-02-27 06:23:07', '2019-02-27 06:23:07', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (68, '/api/admin/company/create', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Rules/CompanyRule.php', 25, 'Class \'App\\Model\\Company\' not found', '{\"name\":\"\\u4fdd\\u96691\",\"app_coupon\":\"2\",\"agent_coupon\":\"3\",\"order_type\":\"1\"}', 1, '2019-02-27 06:25:06', '2019-02-27 06:25:06', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (69, '/api/admin/company/create', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CompanyController.php', 86, '保险公司不可重名', '{\"name\":\"\\u4fdd\\u96691\",\"app_coupon\":\"2\",\"agent_coupon\":\"3\",\"order_type\":\"1\"}', 1, '2019-02-27 14:32:57', '2019-02-27 14:32:57', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (70, '/api/admin/company/retrieveall?name=&type=2', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Database/Connection.php', 664, 'SQLSTATE[42S22]: Column not found: 1054 Unknown column \'type\' in \'where clause\' (SQL: select count(*) as aggregate from `baoxian_company` where (`type` = 2))', '{\"s\":\"\\/api\\/admin\\/company\\/retrieveall\",\"name\":null,\"type\":\"2\"}', 1, '2019-02-27 14:34:57', '2019-02-27 14:34:57', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (71, '/api/admin/coupon/update/4098', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 262, '请输入方案类型', '{\"name\":\"\\u4fdd\\u96692\",\"app_coupon\":\"1\",\"agent_coupon\":\"4\",\"order_type\":\"1\",\"status\":\"0\"}', 1, '2019-02-27 14:41:33', '2019-02-27 14:41:33', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (72, '/api/admin/company/update/4098', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CompanyController.php', 237, '保险公司不可重名', '{\"name\":\"\\u4fdd\\u96692\",\"app_coupon\":\"1\",\"agent_coupon\":\"4\",\"order_type\":\"1\",\"status\":\"0\"}', 1, '2019-02-27 14:41:59', '2019-02-27 14:41:59', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (73, '/api/admin/company/update/4098', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Rules/CompanyRule.php', 25, 'Undefined property: App\\Rules\\CompanyRule::$id', '{\"name\":\"\\u4fdd\\u96692\",\"app_coupon\":\"1\",\"agent_coupon\":\"4\",\"order_type\":\"1\",\"status\":\"0\"}', 1, '2019-02-27 14:53:14', '2019-02-27 14:53:14', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (74, '/api/admin/company/update/4098', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CompanyController.php', 237, '保险公司不可重名', '{\"name\":\"\\u4fdd\\u96692\",\"app_coupon\":\"1\",\"agent_coupon\":\"4\",\"order_type\":\"1\",\"status\":\"0\"}', 1, '2019-02-27 14:54:12', '2019-02-27 14:54:12', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (75, '/api/admin/company/update/4098', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CompanyController.php', 237, '保险公司不可重名', '{\"name\":\"\\u4fdd\\u96692\",\"app_coupon\":\"1\",\"agent_coupon\":\"4\",\"order_type\":\"1\",\"status\":\"0\"}', 1, '2019-02-27 14:54:35', '2019-02-27 14:54:35', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (76, '/api/admin/coupon/delete/4098', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 308, '删除优惠券方案失败', '[]', 1, '2019-02-27 14:59:38', '2019-02-27 14:59:38', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (77, '/api/admin/company/delete/4098', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CompanyController.php', 283, '删除优惠券方案失败', '[]', 1, '2019-02-27 15:00:11', '2019-02-27 15:00:11', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (78, '/api/admin/company/delete/4098', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CompanyController.php', 283, '删除保险公司信息失败', '[]', 1, '2019-02-27 15:01:46', '2019-02-27 15:01:46', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (79, '/api/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Validator/CouponValidator.php', 15, 'Too few arguments to function App\\Http\\Validator\\CouponValidator::__construct(), 0 passed in /Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php on line 96 and exactly 1 expected', '{\"name\":\"\\u4f18\\u60e0\\u52382\",\"type\":\"2\",\"main\":\"2\",\"common_rate\":\"100\"}', 1, '2019-02-27 15:02:12', '2019-02-27 15:02:12', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (80, '/api/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 98, '优惠方案名称不可重名', '{\"name\":\"\\u4f18\\u60e0\\u52382\",\"type\":\"2\",\"main\":\"2\",\"common_rate\":\"100\"}', 1, '2019-02-27 15:06:33', '2019-02-27 15:06:33', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (81, '/api/admin/coupon/update/10', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 262, '优惠方案名称不可重名', '{\"name\":\"\\u65b9\\u68481\",\"type\":\"1\",\"main\":\"3\",\"common_rate\":\"100\",\"maintain_rate\":\"3\"}', 1, '2019-02-27 15:07:17', '2019-02-27 15:07:17', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (82, '/api/admin/order/retrieveall?mobile=1111', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/OrderController.php', 93, 'Class \'App\\Model\\OrderPage\' not found', '{\"s\":\"\\/api\\/admin\\/order\\/retrieveall\",\"mobile\":\"1111\"}', 1, '2019-02-27 18:40:26', '2019-02-27 18:40:26', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (83, '/api/admin/order/retrieveall?mobile=1111', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/OrderController.php', 93, 'Class \'App\\Model\\OrderPage\' not found', '{\"s\":\"\\/api\\/admin\\/order\\/retrieveall\",\"mobile\":\"1111\"}', 1, '2019-02-27 18:41:13', '2019-02-27 18:41:13', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (84, '/api/admin/config/recommond/base', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '{\"s\":\"\\/api\\/admin\\/config\\/recommond\\/base\"}', 1, '2019-02-28 14:22:46', '2019-02-28 14:22:46', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (85, '/api/admin/config/recommend/base', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/ConfigController.php', 68, 'Class \'App\\Model\\Config\' not found', '{\"s\":\"\\/api\\/admin\\/config\\/recommend\\/base\"}', 1, '2019-02-28 14:40:42', '2019-02-28 14:40:42', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (86, '/api/admin/config/full/recommend/base', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '{\"s\":\"\\/api\\/admin\\/config\\/full\\/recommend\\/base\"}', 1, '2019-02-28 15:14:35', '2019-02-28 15:14:35', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (87, '/api/admin/config/full/recommend/hot', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '{\"s\":\"\\/api\\/admin\\/config\\/full\\/recommend\\/hot\"}', 1, '2019-02-28 15:14:35', '2019-02-28 15:14:35', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (88, '/api/admin/config/full/recommend/best', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '{\"s\":\"\\/api\\/admin\\/config\\/full\\/recommend\\/best\"}', 1, '2019-02-28 15:14:36', '2019-02-28 15:14:36', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (89, '/api/admin/config/recommend/update/base', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Routing/Controller.php', 68, 'Method App\\Http\\Controllers\\Admin\\CompanyController::updateRecommend does not exist.', '[]', 1, '2019-02-28 16:00:51', '2019-02-28 16:00:51', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (90, '/api/admin/config/recommend/update/base', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Database/Connection.php', 664, 'SQLSTATE[42S22]: Column not found: 1054 Unknown column \'0\' in \'where clause\' (SQL: delete from `baoxian_config` where (`0` = name and `1` = RECOMMEND_BASE_FORCEINSURANCE))', '{\"FORCEINSURANCE\":\"0\",\"TAXPAY\":\"1\",\"CHESUN\":\"1\",\"BUJIMIAN_CHESUN\":\"1\",\"SANZHE\":\"0\",\"BUJIMIAN_SANZHE\":\"0\",\"DAOQIANG\":\"1\",\"BUJIMIAN_DAOQIANG\":\"1\",\"SIJI\":\"1\",\"BUJIMIAN_SIJI\":\"1\",\"CHENGKE\":\"0\",\"BUJIMIAN_CHENGKE\":\"0\",\"LOSTSPECIAL\":\"1\",\"BUJIMIAN_LOSTSPECIAL\":\"1\",\"SHESHUI\":null,\"BUJIMIAN_SHESHUI\":null,\"BOLI\":null,\"HUAHEN\":null,\"BUJIMIAN_HUAHEN\":null,\"ZIRAN\":null,\"BUJIMIAN_ZIRAN\":null,\"TAKESPECAILREPAIR\":null,\"SANZHEHOLIDAYDOUBLE\":null}', 1, '2019-02-28 16:02:23', '2019-02-28 16:02:23', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (91, '/api/admin/config/recommend/update/base', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Database/Connection.php', 664, 'SQLSTATE[42S22]: Column not found: 1054 Unknown column \'create_time\' in \'field list\' (SQL: insert into `baoxian_config` (`name`, `type`, `value`, `create_time`) values (RECOMMEND_BASE_TAXPAY, number, 1, 2019-02-28 16:03:41))', '{\"FORCEINSURANCE\":\"0\",\"TAXPAY\":\"1\",\"CHESUN\":\"1\",\"BUJIMIAN_CHESUN\":\"1\",\"SANZHE\":\"0\",\"BUJIMIAN_SANZHE\":\"0\",\"DAOQIANG\":\"1\",\"BUJIMIAN_DAOQIANG\":\"1\",\"SIJI\":\"1\",\"BUJIMIAN_SIJI\":\"1\",\"CHENGKE\":\"0\",\"BUJIMIAN_CHENGKE\":\"0\",\"LOSTSPECIAL\":\"1\",\"BUJIMIAN_LOSTSPECIAL\":\"1\",\"SHESHUI\":null,\"BUJIMIAN_SHESHUI\":null,\"BOLI\":null,\"HUAHEN\":null,\"BUJIMIAN_HUAHEN\":null,\"ZIRAN\":null,\"BUJIMIAN_ZIRAN\":null,\"TAKESPECAILREPAIR\":null,\"SANZHEHOLIDAYDOUBLE\":null}', 1, '2019-02-28 16:03:41', '2019-02-28 16:03:41', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (92, '/api/admin/config/recommend/update/hot', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/ConfigController.php', 296, 'Class \'App\\Http\\Controllers\\Admin\\ConfigValidator\' not found', '{\"FORCEINSURANCE\":\"0\",\"TAXPAY\":\"1\",\"CHESUN\":\"1\",\"BUJIMIAN_CHESUN\":\"1\",\"SANZHE\":\"0\",\"BUJIMIAN_SANZHE\":\"0\",\"DAOQIANG\":\"1\",\"BUJIMIAN_DAOQIANG\":\"1\",\"SIJI\":null,\"BUJIMIAN_SIJI\":null,\"CHENGKE\":\"0\",\"BUJIMIAN_CHENGKE\":\"0\",\"LOSTSPECIAL\":\"s\",\"BUJIMIAN_LOSTSPECIAL\":\"1\",\"SHESHUI\":null,\"BUJIMIAN_SHESHUI\":null,\"BOLI\":null,\"HUAHEN\":null,\"BUJIMIAN_HUAHEN\":null,\"ZIRAN\":null,\"BUJIMIAN_ZIRAN\":null,\"TAKESPECAILREPAIR\":null,\"SANZHEHOLIDAYDOUBLE\":null}', 1, '2019-02-28 16:45:00', '2019-02-28 16:45:00', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (93, '/api/admin/config/recommend/update/hot', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/ConfigController.php', 299, '输入类型必须为整数', '{\"FORCEINSURANCE\":\"0\",\"TAXPAY\":\"1\",\"CHESUN\":\"1\",\"BUJIMIAN_CHESUN\":\"1\",\"SANZHE\":\"0\",\"BUJIMIAN_SANZHE\":\"0\",\"DAOQIANG\":\"1\",\"BUJIMIAN_DAOQIANG\":\"1\",\"SIJI\":null,\"BUJIMIAN_SIJI\":null,\"CHENGKE\":\"0\",\"BUJIMIAN_CHENGKE\":\"0\",\"LOSTSPECIAL\":\"s\",\"BUJIMIAN_LOSTSPECIAL\":\"1\",\"SHESHUI\":null,\"BUJIMIAN_SHESHUI\":null,\"BOLI\":null,\"HUAHEN\":null,\"BUJIMIAN_HUAHEN\":null,\"ZIRAN\":null,\"BUJIMIAN_ZIRAN\":null,\"TAKESPECAILREPAIR\":null,\"SANZHEHOLIDAYDOUBLE\":null}', 1, '2019-02-28 17:00:40', '2019-02-28 17:00:40', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (94, '/api/admin/config/recommend/update/hot', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/ConfigController.php', 299, '输入类型必须为整数', '{\"FORCEINSURANCE\":\"0\",\"TAXPAY\":\"1\",\"CHESUN\":\"1\",\"BUJIMIAN_CHESUN\":\"1\",\"SANZHE\":\"0\",\"BUJIMIAN_SANZHE\":\"0\",\"DAOQIANG\":\"1\",\"BUJIMIAN_DAOQIANG\":\"1\",\"SIJI\":null,\"BUJIMIAN_SIJI\":null,\"CHENGKE\":\"0\",\"BUJIMIAN_CHENGKE\":\"0\",\"LOSTSPECIAL\":\"0\",\"BUJIMIAN_LOSTSPECIAL\":\"1\",\"SHESHUI\":null,\"BUJIMIAN_SHESHUI\":null,\"BOLI\":null,\"HUAHEN\":null,\"BUJIMIAN_HUAHEN\":null,\"ZIRAN\":null,\"BUJIMIAN_ZIRAN\":null,\"TAKESPECAILREPAIR\":null,\"SANZHEHOLIDAYDOUBLE\":null}', 1, '2019-02-28 17:01:00', '2019-02-28 17:01:00', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (95, '/api/admin/config/recommend/update/hot', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/ConfigController.php', 299, '输入类型必须为整数', '{\"FORCEINSURANCE\":\"0\",\"TAXPAY\":\"1\",\"CHESUN\":\"1\",\"BUJIMIAN_CHESUN\":\"1\",\"SANZHE\":\"0\",\"BUJIMIAN_SANZHE\":\"0\",\"DAOQIANG\":\"1\",\"BUJIMIAN_DAOQIANG\":\"1\",\"SIJI\":\"0\",\"BUJIMIAN_SIJI\":\"0\",\"CHENGKE\":\"0\",\"BUJIMIAN_CHENGKE\":\"0\",\"LOSTSPECIAL\":\"0\",\"BUJIMIAN_LOSTSPECIAL\":\"1\",\"SHESHUI\":null,\"BUJIMIAN_SHESHUI\":\"0\",\"BOLI\":\"0\",\"HUAHEN\":\"0\",\"BUJIMIAN_HUAHEN\":\"0\",\"ZIRAN\":\"0\",\"BUJIMIAN_ZIRAN\":\"0\",\"TAKESPECAILREPAIR\":\"0\",\"SANZHEHOLIDAYDOUBLE\":\"0\"}', 1, '2019-02-28 17:01:38', '2019-02-28 17:01:38', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (96, '/api/admin/config/recommend/update/hots', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/ConfigController.php', 299, '推荐方案类型错误', '{\"FORCEINSURANCE\":\"0\",\"TAXPAY\":\"1\",\"CHESUN\":\"1\",\"BUJIMIAN_CHESUN\":\"1\",\"SANZHE\":\"0\",\"BUJIMIAN_SANZHE\":\"0\",\"DAOQIANG\":\"1\",\"BUJIMIAN_DAOQIANG\":\"1\",\"SIJI\":\"0\",\"BUJIMIAN_SIJI\":\"0\",\"CHENGKE\":\"0\",\"BUJIMIAN_CHENGKE\":\"0\",\"LOSTSPECIAL\":\"0\",\"BUJIMIAN_LOSTSPECIAL\":\"1\",\"SHESHUI\":\"0\",\"BUJIMIAN_SHESHUI\":\"0\",\"BOLI\":\"0\",\"HUAHEN\":\"0\",\"BUJIMIAN_HUAHEN\":\"0\",\"ZIRAN\":\"0\",\"BUJIMIAN_ZIRAN\":\"0\",\"TAKESPECAILREPAIR\":\"0\",\"SANZHEHOLIDAYDOUBLE\":\"0\"}', 1, '2019-02-28 17:02:28', '2019-02-28 17:02:28', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (97, '/api/admin/config/recommend/bases', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/ConfigController.php', 63, '推荐方案类型错误', '[]', 1, '2019-02-28 17:04:38', '2019-02-28 17:04:38', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (98, '/api/admin/config/recommend/full/bases', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/ConfigController.php', 119, '推荐方案类型错误', '[]', 1, '2019-02-28 17:05:02', '2019-02-28 17:05:02', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (99, '/swagger/index', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/zircote/swagger-php/src/Logger.php', 38, '[Syntax Error] Expected Doctrine\\Common\\Annotations\\DocLexer::T_CLOSE_PARENTHESIS, got \'description\' in \\App\\Http\\Controllers\\Admin\\ConfigController->fullRecommend() in /Users/yangkunlin/git/chemi_api_insurance.com/app/Http/../Http/Controllers/Admin/ConfigController.php on line 109:25', '{\"s\":\"\\/swagger\\/index\"}', 1, '2019-02-28 17:40:09', '2019-02-28 17:40:09', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (100, '/swagger/index', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/zircote/swagger-php/src/Logger.php', 38, '[Syntax Error] Expected Doctrine\\Common\\Annotations\\DocLexer::T_CLOSE_PARENTHESIS, got \'description\' in \\App\\Http\\Controllers\\Admin\\ConfigController->fullRecommend() in /Users/yangkunlin/git/chemi_api_insurance.com/app/Http/../Http/Controllers/Admin/ConfigController.php on line 109:25', '{\"s\":\"\\/swagger\\/index\"}', 1, '2019-02-28 17:40:15', '2019-02-28 17:40:15', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (101, '/swagger/$/definitions/Config', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '{\"s\":\"\\/swagger\\/$\\/definitions\\/Config\"}', 1, '2019-02-28 17:41:17', '2019-02-28 17:41:17', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (102, '/api/admin/company/delete/4098', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CompanyController.php', 290, '删除保险公司信息失败', '[]', 1, '2019-02-28 17:46:55', '2019-02-28 17:46:55', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (103, '/api/admin/config/recommend/full/host', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/ConfigController.php', 122, '推荐方案类型错误', '{\"s\":\"\\/api\\/admin\\/config\\/recommend\\/full\\/host\"}', 1, '2019-02-28 18:01:31', '2019-02-28 18:01:31', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (104, '/api/admin/config/recommend/best', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Redis/Connectors/PredisConnector.php', 25, 'Class \'Predis\\Client\' not found', '[]', 1, '2019-02-28 18:36:42', '2019-02-28 18:36:42', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (105, '/api/admin/config/recommend/best', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/predis/predis/src/Connection/AbstractConnection.php', 155, 'Connection refused [tcp://127.0.0.1:6379]', '[]', 1, '2019-02-28 18:41:47', '2019-02-28 18:41:47', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (106, '/api/admin/config/recommend/update/base', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/ConfigController.php', 332, '输入类型必须为整数', '{\"FORCEINSURANCE\":\"0\",\"TAXPAY\":\"1\",\"CHESUN\":\"1\",\"BUJIMIAN_CHESUN\":\"1\",\"SANZHE\":\"0\",\"BUJIMIAN_SANZHE\":\"0\",\"DAOQIANG\":\"1\",\"BUJIMIAN_DAOQIANG\":\"1\",\"SIJI\":null,\"BUJIMIAN_SIJI\":null,\"CHENGKE\":\"0\",\"BUJIMIAN_CHENGKE\":\"0\",\"LOSTSPECIAL\":\"1\",\"BUJIMIAN_LOSTSPECIAL\":\"1\",\"SHESHUI\":null,\"BUJIMIAN_SHESHUI\":null,\"BOLI\":null,\"HUAHEN\":null,\"BUJIMIAN_HUAHEN\":null,\"ZIRAN\":null,\"BUJIMIAN_ZIRAN\":null,\"TAKESPECAILREPAIR\":null,\"SANZHEHOLIDAYDOUBLE\":null}', 1, '2019-02-28 18:44:57', '2019-02-28 18:44:57', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (107, '/api/admin/config/recommend/update/base', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/predis/predis/src/Profile/RedisProfile.php', 88, 'Command \'DELETE\' is not a registered Redis command.', '{\"FORCEINSURANCE\":\"0\",\"TAXPAY\":\"1\",\"CHESUN\":\"1\",\"BUJIMIAN_CHESUN\":\"1\",\"SANZHE\":\"0\",\"BUJIMIAN_SANZHE\":\"0\",\"DAOQIANG\":\"1\",\"BUJIMIAN_DAOQIANG\":\"1\",\"SIJI\":\"0\",\"BUJIMIAN_SIJI\":\"0\",\"CHENGKE\":\"0\",\"BUJIMIAN_CHENGKE\":\"0\",\"LOSTSPECIAL\":\"1\",\"BUJIMIAN_LOSTSPECIAL\":\"1\",\"SHESHUI\":\"0\",\"BUJIMIAN_SHESHUI\":\"0\",\"BOLI\":\"0\",\"HUAHEN\":\"0\",\"BUJIMIAN_HUAHEN\":\"0\",\"ZIRAN\":\"0\",\"BUJIMIAN_ZIRAN\":\"0\",\"TAKESPECAILREPAIR\":\"0\",\"SANZHEHOLIDAYDOUBLE\":\"0\"}', 1, '2019-02-28 18:45:24', '2019-02-28 18:45:24', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (108, '/api/admin/order/retrieveall?mobile=111', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Database/Connection.php', 664, 'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'chemi_api_v1.baoxian_order_page_201902\' doesn\'t exist (SQL: select count(*) as aggregate from `baoxian_order_page_201902` where (`insuredmobile` like %111% or `holdermobile` like %111%))', '{\"s\":\"\\/api\\/admin\\/order\\/retrieveall\",\"mobile\":\"111\"}', 1, '2019-03-01 15:11:51', '2019-03-01 15:11:51', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (109, '/api/admin/coupon/retrieve/2', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 140, '优惠券方案不存在', '{\"s\":\"\\/api\\/admin\\/coupon\\/retrieve\\/2\"}', 1, '2019-03-01 17:19:41', '2019-03-01 17:19:41', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (110, '/api/admin/coupon/delete/8', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 320, '删除优惠券方案失败', '[]', 1, '2019-03-01 17:53:07', '2019-03-01 17:53:07', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (111, '/api/admin/coupon/delete/8', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 320, '删除优惠券方案失败', '[]', 1, '2019-03-01 17:53:08', '2019-03-01 17:53:08', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (112, '/api/admin/coupon/delete/8', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 320, '删除优惠券方案失败', '[]', 1, '2019-03-01 17:53:09', '2019-03-01 17:53:09', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (113, '/api/admin/coupon/delete/8', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 320, '删除优惠券方案失败', '[]', 1, '2019-03-01 17:53:10', '2019-03-01 17:53:10', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (114, '/api/admin/coupon/delete/7', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 320, '删除优惠券方案失败', '[]', 1, '2019-03-01 17:53:10', '2019-03-01 17:53:10', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (115, '/api/admin/coupon/delete/7', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 320, '删除优惠券方案失败', '[]', 1, '2019-03-01 17:53:11', '2019-03-01 17:53:11', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (116, '/api/admin/coupon/delete/7', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 320, '删除优惠券方案失败', '[]', 1, '2019-03-01 17:53:11', '2019-03-01 17:53:11', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (117, '/api/admin/coupon/delete/7', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 320, '删除优惠券方案失败', '[]', 1, '2019-03-01 17:53:11', '2019-03-01 17:53:11', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (118, '/api/admin/coupon/delete/8', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 320, '删除优惠券方案失败', '[]', 1, '2019-03-01 17:54:05', '2019-03-01 17:54:05', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (119, '/api/admin/coupon/delete/6', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 320, '删除优惠券方案失败', '[]', 1, '2019-03-01 17:56:45', '2019-03-01 17:56:45', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (120, '/api/admin/coupon/delete/6', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 320, '删除优惠券方案失败', '[]', 1, '2019-03-01 17:56:59', '2019-03-01 17:56:59', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (121, '/api/admin/coupon/delete/4', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 320, '删除优惠券方案失败', '[]', 1, '2019-03-01 17:59:26', '2019-03-01 17:59:26', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (122, '/api/admin/coupon/delete/3', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 320, '删除优惠券方案失败', '[]', 1, '2019-03-01 18:00:24', '2019-03-01 18:00:24', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (123, '/api/admin/coupon/delete/5', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 320, '删除优惠券方案失败', '[]', 1, '2019-03-01 18:04:57', '2019-03-01 18:04:57', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (124, '/api/admin/coupon/delete/5', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 320, '删除优惠券方案失败', '[]', 1, '2019-03-01 18:05:00', '2019-03-01 18:05:00', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (125, '/api/admin/coupon/delete/5', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 320, '删除优惠券方案失败', '[]', 1, '2019-03-01 18:05:00', '2019-03-01 18:05:00', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (126, '/api/admin/coupon/delete/5', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 320, '删除优惠券方案失败', '[]', 1, '2019-03-01 18:05:01', '2019-03-01 18:05:01', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (127, '/api/admin/coupon/delete/5', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 320, '删除优惠券方案失败', '[]', 1, '2019-03-01 18:05:01', '2019-03-01 18:05:01', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (128, '/api/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 98, '方案名称为空', '[]', 1, '2019-03-01 18:11:06', '2019-03-01 18:11:06', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (129, '/api/admin/coupon/delete/11', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 320, '删除优惠券方案失败', '[]', 1, '2019-03-01 18:12:05', '2019-03-01 18:12:05', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (130, '/api/admin/coupon/retrieveall?page=1&limit=20', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Database/Connection.php', 664, 'SQLSTATE[HY000] [2002] Operation timed out (SQL: select count(*) as aggregate from `baoxian_coupon_plan`)', '{\"s\":\"\\/api\\/admin\\/coupon\\/retrieveall\",\"page\":\"1\",\"limit\":\"20\"}', 1, '2019-03-01 17:10:15', '2019-03-01 17:10:15', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (131, '/api/admin/coupon/retrieveall?page=1&limit=20', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Database/Connection.php', 664, 'SQLSTATE[HY000] [2002] Operation timed out (SQL: insert into `baoxian_error` (`url`, `files`, `lines`, `message`, `params`, `status`, `method`, `from`, `update_time`, `create_time`) values (/api/admin/coupon/retrieveall/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Database/Connection.phppage=1&limit=20, 664, SQLSTATE[HY000] [2002] Operation timed out (SQL: insert into `baoxian_error` (`url`, `files`, `lines`, `message`, `params`, `status`, `method`, `from`, `update_time`, `create_time`) values (/api/admin/coupon/retrieveall/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Database/Connection.phppage=1&limit=20, 664, SQLSTATE[HY000] [2002] Operation timed out (SQL: insert into `baoxian_error` (`url`, `files`, `lines`, `message`, `params`, `status`, `method`, `from`, `update_time`, `create_time`) values (/api/admin/coupon/retrieveall/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Database/Connection.phppage=1&limit=20, 664, SQLSTATE[HY000] [2002] Operation timed out (SQL: insert into `baoxian_error` (`url`, `files`, `lines`, `message`, `params`, `status`, `method`, `from`, `update_time`, `create_time`) values (/api/admin/coupon/retrieveall/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Database/Connection.phppage=1&limit=20, 664, SQLSTATE[HY000] [2002] Operation timed out (SQL: insert into `baoxian_error` (`url`, `files`, `lines`, `message`, `params`, `status`, `method`, `from`, `update_time`, `create_time`) values (/api/admin/coupon/retrieveall/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Database/Connection.phppage=1&limit=20, 664, SQLSTATE[HY000] [2002] Operation timed out (SQL: insert into `baoxian_error` (`url`, `files`, `lines`, `message`, `params`, `status`, `method`, `from`, `update_time`, `create_time`) values (/api/admin/coupon/retrieveall/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Database/Connection.phppage=1&limit=20, 664, SQLSTATE[HY000] [2002] Operation timed out (SQL: insert into `baoxian_error` (`url`, `files`, `lines`, `message`, `params`, `status`, `method`, `from`, `update_time`, `create_time`) values (/api/admin/coupon/retrieveall/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Database/Connection.phppage=1&limit=20, 664, SQLSTATE[HY000] [2002] Operation timed out (SQL: insert into `baoxian_error` (`url`, `files`, `lines`, `message`, `params`, `status`, `method`, `from`, `update_time`, `create_time`) values (/api/admin/coupon/retrieveall/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Database/Connection.phppage=1&limit=20, 664, SQLSTATE[HY000] [2002] Operation timed out (SQL: select count(*) as aggregate from `baoxian_coupon_plan`), {\"s\":\"\\/api\\/admin\\/coupon\\/retrieveall\",\"page\":\"1\",\"limit\":\"20\"}, 1, GET, 1, 2019-03-04 09:24:24, 2019-03-04 09:24:24, {\"s\":\"\\/api\\/admin\\/coupon\\/retrieveall\",\"page\":\"1\",\"limit\":\"20\"})), 1, GET, 1, 2019-03-04 09:24:54, 2019-03-04 09:24:54, {\"s\":\"\\/api\\/admin\\/coupon\\/retrieveall\",\"page\":\"1\",\"limit\":\"20\"}, 1)), GET, 1, 2019-03-04 09:25:24, 2019-03-04 09:25:24, {\"s\":\"\\/api\\/admin\\/coupon\\/retrieveall\",\"page\":\"1\",\"limit\":\"20\"}, 1, GET)), 1, 2019-03-04 09:25:54, 2019-03-04 09:25:54, {\"s\":\"\\/api\\/admin\\/coupon\\/retrieveall\",\"page\":\"1\",\"limit\":\"20\"}, 1, GET, 1)), 2019-03-04 09:26:24, 2019-03-04 09:26:24, {\"s\":\"\\/api\\/admin\\/coupon\\/retrieveall\",\"page\":\"1\",\"limit\":\"20\"}, 1, GET, 1, 2019-03-04 09:26:54)), 2019-03-04 09:26:54, {\"s\":\"\\/api\\/admin\\/coupon\\/retrieveall\",\"page\":\"1\",\"limit\":\"20\"}, 1, GET, 1, 2019-03-04 09:27:24, 2019-03-04 09:27:24)), {\"s\":\"\\/api\\/admin\\/coupon\\/retrieveall\",\"page\":\"1\",\"limit\":\"20\"}, 1, GET, 1, 2019-03-04 09:27:54, 2019-03-04 09:27:54, ?)), ?, ?, ?, ?, ?, ?, ?))', '{\"s\":\"\\/api\\/admin\\/coupon\\/retrieveall\",\"page\":\"1\",\"limit\":\"20\"}', 1, '2019-03-04 09:28:24', '2019-03-04 09:28:24', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (132, '/api/admin/coupon/retrieveall?page=1&limit=20', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Database/Connection.php', 664, 'SQLSTATE[HY000] [2002] Operation timed out (SQL: insert into `baoxian_error` (`url`, `files`, `lines`, `message`, `params`, `status`, `method`, `from`, `update_time`, `create_time`) values (/api/admin/coupon/retrieveall/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Database/Connection.phppage=1&limit=20, 664, SQLSTATE[HY000] [2002] Operation timed out (SQL: insert into `baoxian_error` (`url`, `files`, `lines`, `message`, `params`, `status`, `method`, `from`, `update_time`, `create_time`) values (/api/admin/coupon/retrieveall/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Database/Connection.phppage=1&limit=20, 664, SQLSTATE[HY000] [2002] Operation timed out (SQL: select count(*) as aggregate from `baoxian_coupon_plan`), {\"s\":\"\\/api\\/admin\\/coupon\\/retrieveall\",\"page\":\"1\",\"limit\":\"20\"}, 1, GET, 1, 2019-03-04 09:28:11, 2019-03-04 09:28:11, {\"s\":\"\\/api\\/admin\\/coupon\\/retrieveall\",\"page\":\"1\",\"limit\":\"20\"})), 1, GET, 1, 2019-03-04 09:28:41, 2019-03-04 09:28:41, ?, ?))', '{\"s\":\"\\/api\\/admin\\/coupon\\/retrieveall\",\"page\":\"1\",\"limit\":\"20\"}', 1, '2019-03-04 09:29:11', '2019-03-04 09:29:11', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (133, '/api/admin/coupon/retrieveall?page=1&limit=20', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Database/Connection.php', 664, 'SQLSTATE[HY000] [2002] Operation timed out (SQL: insert into `baoxian_error` (`url`, `files`, `lines`, `message`, `params`, `status`, `method`, `from`, `update_time`, `create_time`) values (/api/admin/coupon/retrieveall/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Database/Connection.phppage=1&limit=20, 664, SQLSTATE[HY000] [2002] Operation timed out (SQL: select count(*) as aggregate from `baoxian_coupon_plan`), {\"s\":\"\\/api\\/admin\\/coupon\\/retrieveall\",\"page\":\"1\",\"limit\":\"20\"}, 1, GET, 1, 2019-03-04 09:30:55, 2019-03-04 09:30:55, ?))', '{\"s\":\"\\/api\\/admin\\/coupon\\/retrieveall\",\"page\":\"1\",\"limit\":\"20\"}', 1, '2019-03-04 09:31:25', '2019-03-04 09:31:25', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (134, '/api/getInsuranceClass', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Container/Container.php', 779, 'Class Barryvdh\\Cors\\HandleCors does not exist', '[]', 1, '2019-03-04 11:03:42', '2019-03-04 11:03:42', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (135, '/api/getInsuranceClass', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Container/Container.php', 779, 'Class Barryvdh\\Cors\\HandleCors does not exist', '[]', 1, '2019-03-04 11:03:43', '2019-03-04 11:03:43', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (136, '/api/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 98, '洗车保养劵返还比例必须为0-100的整数', '{\"id\":0,\"name\":\"\\u65b9\\u68481\",\"type\":\"1\",\"main\":\"1\",\"common_rate\":\"1\",\"park_rate\":\"3\",\"maintain_rate\":null,\"insurance_rate\":null}', 1, '2019-03-04 11:37:28', '2019-03-04 11:37:28', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (137, '/api/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 98, '优惠方案名称不可重名', '{\"name\":\"\\u65b9\\u68481\",\"type\":\"1\",\"main\":\"2\",\"common_rate\":\"2\",\"park_rate\":\"4\",\"maintain_rate\":\"5\"}', 1, '2019-03-04 13:51:22', '2019-03-04 13:51:22', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (138, '/api/admin/coupon/create', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CouponController.php', 98, '优惠方案名称不可重名', '{\"name\":\"\\u65b9\\u684823\",\"type\":\"2\",\"main\":\"2\",\"common_rate\":\"2\",\"park_rate\":\"3\",\"maintain_rate\":\"4\"}', 1, '2019-03-04 13:51:45', '2019-03-04 13:51:45', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (139, '/api/getInsuranceClass', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 255, '', '[]', 1, '2019-03-04 14:58:52', '2019-03-04 14:58:52', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (140, '/api/getInsuranceClass', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 255, '', '[]', 1, '2019-03-04 14:59:15', '2019-03-04 14:59:15', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (141, '/api/getInsuranceClass', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 255, '', '[]', 1, '2019-03-04 14:59:19', '2019-03-04 14:59:19', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (142, '/api/getPrecisePrice', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Database/Connection.php', 664, 'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'chemi_api_v1.baoxian_baoxian_company\' doesn\'t exist (SQL: select `id`, `name`, `tel`, `logo` from `baoxian_baoxian_company` where `status` = 1)', '[]', 1, '2019-03-04 15:58:16', '2019-03-04 15:58:16', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (143, '/api/getPrecisePrice', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Database/Connection.php', 664, 'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'chemi_api_v1.baoxian_baoxian_company\' doesn\'t exist (SQL: select `id`, `name`, `tel`, `logo` from `baoxian_baoxian_company` where `status` = 1)', '[]', 1, '2019-03-04 15:58:56', '2019-03-04 15:58:56', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (144, '/api/admin/order/retrieveall?mobile=111', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Database/Connection.php', 664, 'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'chemi_api_v1.baoxian_order_page_201902\' doesn\'t exist (SQL: select count(*) as aggregate from `baoxian_order_page_201902` where (`insuredmobile` like %111% or `holdermobile` like %111%))', '{\"s\":\"\\/api\\/admin\\/order\\/retrieveall\",\"mobile\":\"111\"}', 1, '2019-03-04 16:57:46', '2019-03-04 16:57:46', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (145, '/api/getCompanyList', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 255, '', '[]', 1, '2019-03-05 10:10:37', '2019-03-05 10:10:37', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (146, '/api/getCompanyList', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 255, '', '[]', 1, '2019-03-05 10:10:37', '2019-03-05 10:10:37', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (147, '/api/admin/order/retrieveall?page=1&limit=20', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Database/Connection.php', 664, 'SQLSTATE[42S22]: Column not found: 1054 Unknown column \'company\' in \'field list\' (SQL: select `id`, `licenseno`, `carownersname`, `holdermobile`, `businessenddate`, `forceenddate`, `businessenddate`, `biztotal`, `forcetotal`, `taxtotal`, `company`, `target`, `agent_id`, `status` from `baoxian_order_page_201903` order by `id` desc limit 20 offset 0)', '{\"s\":\"\\/api\\/admin\\/order\\/retrieveall\",\"page\":\"1\",\"limit\":\"20\"}', 1, '2019-03-05 10:54:24', '2019-03-05 10:54:24', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (148, '/api/getCompanyList', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 255, '', '[]', 1, '2019-03-05 11:00:29', '2019-03-05 11:00:29', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (149, '/api/getCompanyList', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 255, '', '[]', 1, '2019-03-05 11:00:31', '2019-03-05 11:00:31', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (150, '/api/getCompanyList', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 255, '', '[]', 1, '2019-03-05 11:00:33', '2019-03-05 11:00:33', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (151, '/api/getCompanyList', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 255, '', '[]', 1, '2019-03-05 11:00:34', '2019-03-05 11:00:34', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (152, '/api/getCompanyList', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 255, '', '[]', 1, '2019-03-05 11:01:30', '2019-03-05 11:01:30', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (153, '/api/admin/order/retrieveall?page=1&limit=20', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Support/Traits/ForwardsCalls.php', 50, 'Call to undefined method Illuminate\\Database\\Eloquent\\Relations\\HasOne::toArray()', '{\"s\":\"\\/api\\/admin\\/order\\/retrieveall\",\"page\":\"1\",\"limit\":\"20\"}', 1, '2019-03-05 11:01:55', '2019-03-05 11:01:55', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (154, '/api/getCompanyList', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 255, '', '[]', 1, '2019-03-05 11:01:42', '2019-03-05 11:01:42', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (155, '/api/admin/order/retrieveall?page=1&limit=20', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Support/Traits/ForwardsCalls.php', 50, 'Call to undefined method Illuminate\\Database\\Eloquent\\Relations\\HasOne::toArray()', '{\"s\":\"\\/api\\/admin\\/order\\/retrieveall\",\"page\":\"1\",\"limit\":\"20\"}', 1, '2019-03-05 11:03:20', '2019-03-05 11:03:20', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (156, '/api/getCompanyList', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 255, '', '[]', 1, '2019-03-05 11:04:09', '2019-03-05 11:04:09', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (157, '/api/getCompanyList', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 255, '', '[]', 1, '2019-03-05 11:04:19', '2019-03-05 11:04:19', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (158, '/api/getCompanyList', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 255, '', '[]', 1, '2019-03-05 11:05:42', '2019-03-05 11:05:42', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (159, '/api/getCompanyList', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 255, '', '[]', 1, '2019-03-05 11:06:35', '2019-03-05 11:06:35', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (160, '/api/getCompanyList', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 255, '', '[]', 1, '2019-03-05 11:07:27', '2019-03-05 11:07:27', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (161, '/api/getCompanyList', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 255, '', '[]', 1, '2019-03-05 11:08:05', '2019-03-05 11:08:05', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (162, '/api/admin/order/retrieveall?page=1&limit=20', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Database/DatabaseManager.php', 327, 'Call to undefined method Illuminate\\Database\\MySqlConnection::getLastSql()', '{\"s\":\"\\/api\\/admin\\/order\\/retrieveall\",\"page\":\"1\",\"limit\":\"20\"}', 1, '2019-03-05 11:08:59', '2019-03-05 11:08:59', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (163, '/api/getCompanyList', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 255, '', '[]', 1, '2019-03-05 11:08:59', '2019-03-05 11:08:59', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (164, '/api/admin/order/retrieveall?page=1&limit=20', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Support/Traits/Macroable.php', 100, 'Method Illuminate\\Database\\Eloquent\\Collection::toSql does not exist.', '{\"s\":\"\\/api\\/admin\\/order\\/retrieveall\",\"page\":\"1\",\"limit\":\"20\"}', 1, '2019-03-05 11:10:05', '2019-03-05 11:10:05', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (165, '/api/admin/order/retrieveall?page=1&limit=20', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Database/Connection.php', 664, 'SQLSTATE[42S22]: Column not found: 1054 Unknown column \'baoxian_company.source\' in \'where clause\' (SQL: select * from `baoxian_company` where `baoxian_company`.`source` = 1 and `baoxian_company`.`source` is not null limit 1)', '{\"s\":\"\\/api\\/admin\\/order\\/retrieveall\",\"page\":\"1\",\"limit\":\"20\"}', 1, '2019-03-05 11:13:07', '2019-03-05 11:13:07', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (166, '/api/admin/order/retrieveall?page=1&limit=20', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Support/Traits/ForwardsCalls.php', 50, 'Call to undefined method Illuminate\\Database\\Eloquent\\Relations\\HasOne::getResult()', '{\"s\":\"\\/api\\/admin\\/order\\/retrieveall\",\"page\":\"1\",\"limit\":\"20\"}', 1, '2019-03-05 11:16:42', '2019-03-05 11:16:42', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (167, '/api/config', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-05 11:49:42', '2019-03-05 11:49:42', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (168, '/api/getCouponPlanRate', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 255, '', '[]', 1, '2019-03-05 11:50:12', '2019-03-05 11:50:12', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (169, '/api/getCouponPlanRate', '/home/vagrant/Code/cmbx/app/Http/Model/Baoxian.php', 750, 'Cannot use a scalar value as an array', '{\"source\":\"4097\"}', 1, '2019-03-05 11:57:19', '2019-03-05 11:57:19', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (170, '/api/getCouponPlanRate', '/home/vagrant/Code/cmbx/app/Http/Model/Baoxian.php', 750, 'Cannot use a scalar value as an array', '{\"source\":\"4097\"}', 1, '2019-03-05 11:57:37', '2019-03-05 11:57:37', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (171, '/api/getCouponPlanRate', '/home/vagrant/Code/cmbx/app/Http/Model/Baoxian.php', 750, 'Cannot use a scalar value as an array', '{\"source\":\"4097\"}', 1, '2019-03-05 11:57:58', '2019-03-05 11:57:58', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (172, '/api/admin/order/retrieveall?page=1&limit=20', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Database/Connection.php', 664, 'SQLSTATE[HY000] [2002] Operation timed out (SQL: insert into `baoxian_error` (`url`, `files`, `lines`, `message`, `params`, `status`, `method`, `from`, `update_time`, `create_time`) values (/api/admin/order/retrieveall/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Database/Connection.phppage=1&limit=20, 664, SQLSTATE[HY000] [2002] Operation timed out (SQL: select count(*) as aggregate from `baoxian_order_page_201903`), {\"s\":\"\\/api\\/admin\\/order\\/retrieveall\",\"page\":\"1\",\"limit\":\"20\"}, 1, GET, 1, 2019-03-05 13:52:13, 2019-03-05 13:52:13, ?))', '{\"s\":\"\\/api\\/admin\\/order\\/retrieveall\",\"page\":\"1\",\"limit\":\"20\"}', 1, '2019-03-05 13:52:43', '2019-03-05 13:52:43', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (173, '/api/admin/order/retrieveall?page=1&limit=20', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Database/Connection.php', 664, 'SQLSTATE[HY000] [2002] Operation timed out (SQL: select count(*) as aggregate from `baoxian_order_page_201903`)', '{\"s\":\"\\/api\\/admin\\/order\\/retrieveall\",\"page\":\"1\",\"limit\":\"20\"}', 1, '2019-03-05 13:52:40', '2019-03-05 13:52:40', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (174, '/api/getPrepareCoupon', '/home/vagrant/Code/cmbx/app/helpers.php', 167, 'A non-numeric value encountered', '{\"source\":\"4097\"}', 1, '2019-03-05 15:14:33', '2019-03-05 15:14:33', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (175, '/api/admin/order/retrieve/1', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/OrderController.php', 64, '订单信息不存在', '{\"s\":\"\\/api\\/admin\\/order\\/retrieve\\/1\"}', 1, '2019-03-05 15:19:05', '2019-03-05 15:19:05', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (176, '/api/admin/order/retrieve/1', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/OrderController.php', 64, '订单信息不存在', '{\"s\":\"\\/api\\/admin\\/order\\/retrieve\\/1\"}', 1, '2019-03-05 15:19:09', '2019-03-05 15:19:09', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (177, '/api/admin/company/update/4097', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CompanyController.php', 241, '状态格式不正确', '{\"name\":\"\\u4fdd\\u96691\",\"status\":false,\"app_coupon\":23,\"agent_coupon\":22,\"order_type\":1}', 1, '2019-03-05 18:09:29', '2019-03-05 18:09:29', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (178, '/api/admin/company/create', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/CompanyController.php', 86, '保险公司不可重名', '{\"name\":\"\\u4fdd\\u96691\",\"status\":1,\"app_coupon\":23,\"order_type\":1}', 1, '2019-03-05 18:18:33', '2019-03-05 18:18:33', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (179, '/api/admin/config/recommend/full/undefined', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/ConfigController.php', 135, '推荐方案类型错误', '{\"s\":\"\\/api\\/admin\\/config\\/recommend\\/full\\/undefined\"}', 1, '2019-03-06 17:18:05', '2019-03-06 17:18:05', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (180, '/api/admin/config/recommend/full/undefined', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/ConfigController.php', 135, '推荐方案类型错误', '{\"s\":\"\\/api\\/admin\\/config\\/recommend\\/full\\/undefined\"}', 1, '2019-03-06 17:18:06', '2019-03-06 17:18:06', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (181, '/api/admin/config/recommend/full/undefined', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/ConfigController.php', 135, '推荐方案类型错误', '{\"s\":\"\\/api\\/admin\\/config\\/recommend\\/full\\/undefined\"}', 1, '2019-03-06 17:18:07', '2019-03-06 17:18:07', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (182, '/api/admin/config/recommend/full/undefined', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/ConfigController.php', 135, '推荐方案类型错误', '{\"s\":\"\\/api\\/admin\\/config\\/recommend\\/full\\/undefined\"}', 1, '2019-03-06 17:18:07', '2019-03-06 17:18:07', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (183, '/api/admin/config/recommend/full/undefined', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/ConfigController.php', 135, '推荐方案类型错误', '{\"s\":\"\\/api\\/admin\\/config\\/recommend\\/full\\/undefined\"}', 1, '2019-03-06 17:18:07', '2019-03-06 17:18:07', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (184, '/api/admin/config/recommend/full/undefined', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/ConfigController.php', 135, '推荐方案类型错误', '{\"s\":\"\\/api\\/admin\\/config\\/recommend\\/full\\/undefined\"}', 1, '2019-03-06 17:18:07', '2019-03-06 17:18:07', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (185, '/api/admin/config/recommend/full/undefined', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/ConfigController.php', 135, '推荐方案类型错误', '{\"s\":\"\\/api\\/admin\\/config\\/recommend\\/full\\/undefined\"}', 1, '2019-03-06 17:18:08', '2019-03-06 17:18:08', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (186, '/api/admin/config/recommend/full/undefined', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/ConfigController.php', 135, '推荐方案类型错误', '{\"s\":\"\\/api\\/admin\\/config\\/recommend\\/full\\/undefined\"}', 1, '2019-03-06 17:18:08', '2019-03-06 17:18:08', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (187, '/api/admin/config/recommend/full/undefined', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/ConfigController.php', 135, '推荐方案类型错误', '{\"s\":\"\\/api\\/admin\\/config\\/recommend\\/full\\/undefined\"}', 1, '2019-03-06 17:18:08', '2019-03-06 17:18:08', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (188, '/api/admin/config/recommend/full/undefined', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/ConfigController.php', 135, '推荐方案类型错误', '{\"s\":\"\\/api\\/admin\\/config\\/recommend\\/full\\/undefined\"}', 1, '2019-03-06 17:18:08', '2019-03-06 17:18:08', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (189, '/api/admin/config/recommend/full/undefined', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/ConfigController.php', 135, '推荐方案类型错误', '{\"s\":\"\\/api\\/admin\\/config\\/recommend\\/full\\/undefined\"}', 1, '2019-03-06 17:18:08', '2019-03-06 17:18:08', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (190, '/api/admin/config/recommend/full/undefined', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/ConfigController.php', 135, '推荐方案类型错误', '{\"s\":\"\\/api\\/admin\\/config\\/recommend\\/full\\/undefined\"}', 1, '2019-03-06 17:18:09', '2019-03-06 17:18:09', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (191, '/api/admin/config/recommend/full/undefined', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/ConfigController.php', 135, '推荐方案类型错误', '{\"s\":\"\\/api\\/admin\\/config\\/recommend\\/full\\/undefined\"}', 1, '2019-03-06 17:18:13', '2019-03-06 17:18:13', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (192, '/api/admin/config/recommend/full/undefined', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/ConfigController.php', 135, '推荐方案类型错误', '{\"s\":\"\\/api\\/admin\\/config\\/recommend\\/full\\/undefined\"}', 1, '2019-03-06 17:18:13', '2019-03-06 17:18:13', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (193, '/api/admin/config/recommend/full/undefined', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/ConfigController.php', 135, '推荐方案类型错误', '{\"s\":\"\\/api\\/admin\\/config\\/recommend\\/full\\/undefined\"}', 1, '2019-03-06 17:18:18', '2019-03-06 17:18:18', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (194, '/api/admin/config/recommend/update/base', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/ConfigController.php', 332, '输入类型必须为整数', '{\"FORCEINSURANCE\":null,\"TAXPAY\":null,\"CHESUN\":\"1\",\"BUJIMIAN_CHESUN\":null,\"SANZHE\":null,\"BUJIMIAN_SANZHE\":null,\"DAOQIANG\":null,\"BUJIMIAN_DAOQIANG\":null,\"SIJI\":\"3\",\"BUJIMIAN_SIJI\":null,\"CHENGKE\":null,\"BUJIMIAN_CHENGKE\":null,\"LOSTSPECIAL\":null,\"BUJIMIAN_LOSTSPECIAL\":null,\"SHESHUI\":\"1\",\"BUJIMIAN_SHESHUI\":null,\"BOLI\":null,\"HUAHEN\":null,\"BUJIMIAN_HUAHEN\":null,\"ZIRAN\":null,\"BUJIMIAN_ZIRAN\":null,\"TAKESPECAILREPAIR\":null,\"SANZHEHOLIDAYDOUBLE\":null}', 1, '2019-03-06 19:08:15', '2019-03-06 19:08:15', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (195, '/api/admin/config/recommend/update/base', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Controllers/Admin/ConfigController.php', 332, '输入类型必须为整数', '{\"FORCEINSURANCE\":null,\"TAXPAY\":null,\"CHESUN\":\"1\",\"BUJIMIAN_CHESUN\":null,\"SANZHE\":null,\"BUJIMIAN_SANZHE\":null,\"DAOQIANG\":null,\"BUJIMIAN_DAOQIANG\":null,\"SIJI\":\"2\",\"BUJIMIAN_SIJI\":null,\"CHENGKE\":null,\"BUJIMIAN_CHENGKE\":null,\"LOSTSPECIAL\":null,\"BUJIMIAN_LOSTSPECIAL\":null,\"SHESHUI\":null,\"BUJIMIAN_SHESHUI\":null,\"BOLI\":null,\"HUAHEN\":null,\"BUJIMIAN_HUAHEN\":null,\"ZIRAN\":null,\"BUJIMIAN_ZIRAN\":null,\"TAKESPECAILREPAIR\":null,\"SANZHEHOLIDAYDOUBLE\":null}', 1, '2019-03-06 19:09:21', '2019-03-06 19:09:21', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (196, '/api/admin/config/recommend/full/base', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/predis/predis/src/Connection/AbstractConnection.php', 155, 'Operation timed out [tcp://192.168.1.20:6379]', '{\"s\":\"\\/api\\/admin\\/config\\/recommend\\/full\\/base\"}', 1, '2019-03-06 20:54:50', '2019-03-06 20:54:50', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (197, '/api/admin/config/recommend/full/base', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/predis/predis/src/Connection/AbstractConnection.php', 155, 'Host is down [tcp://192.168.1.20:6379]', '{\"s\":\"\\/api\\/admin\\/config\\/recommend\\/full\\/base\"}', 1, '2019-03-06 20:54:51', '2019-03-06 20:54:51', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (198, '/api/admin/config/recommend/full/base', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/predis/predis/src/Connection/AbstractConnection.php', 155, 'Host is down [tcp://192.168.1.20:6379]', '{\"s\":\"\\/api\\/admin\\/config\\/recommend\\/full\\/base\"}', 1, '2019-03-06 20:54:51', '2019-03-06 20:54:51', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (199, '/api/admin/config/recommend/full/base', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/predis/predis/src/Connection/AbstractConnection.php', 155, 'Operation timed out [tcp://192.168.1.20:6379]', '{\"s\":\"\\/api\\/admin\\/config\\/recommend\\/full\\/base\"}', 1, '2019-03-06 20:54:54', '2019-03-06 20:54:54', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (200, '/api/admin/config/recommend/full/base', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/predis/predis/src/Connection/AbstractConnection.php', 155, 'Operation timed out [tcp://192.168.1.20:6379]', '{\"s\":\"\\/api\\/admin\\/config\\/recommend\\/full\\/base\"}', 1, '2019-03-06 20:54:55', '2019-03-06 20:54:55', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (201, '/api/admin/config/recommend/full/base', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/predis/predis/src/Connection/AbstractConnection.php', 155, 'Operation timed out [tcp://192.168.1.20:6379]', '{\"s\":\"\\/api\\/admin\\/config\\/recommend\\/full\\/base\"}', 1, '2019-03-06 20:55:24', '2019-03-06 20:55:24', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (202, '/api/admin/config/recommend/hot', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/predis/predis/src/Connection/AbstractConnection.php', 155, 'Operation timed out [tcp://192.168.1.20:6379]', '{\"s\":\"\\/api\\/admin\\/config\\/recommend\\/hot\"}', 1, '2019-03-07 21:09:25', '2019-03-07 21:09:25', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (203, '/api/admin/config/recommend/base', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/predis/predis/src/Connection/AbstractConnection.php', 155, 'Operation timed out [tcp://192.168.1.20:6379]', '{\"s\":\"\\/api\\/admin\\/config\\/recommend\\/base\"}', 1, '2019-03-07 21:09:25', '2019-03-07 21:09:25', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (204, '/api/admin/config/recommend/best', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/predis/predis/src/Connection/AbstractConnection.php', 155, 'Operation timed out [tcp://192.168.1.20:6379]', '{\"s\":\"\\/api\\/admin\\/config\\/recommend\\/best\"}', 1, '2019-03-07 21:09:25', '2019-03-07 21:09:25', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (205, '/api/admin/config/recommend/base', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/predis/predis/src/Connection/AbstractConnection.php', 155, 'Host is down [tcp://192.168.1.20:6379]', '{\"s\":\"\\/api\\/admin\\/config\\/recommend\\/base\"}', 1, '2019-03-07 21:09:33', '2019-03-07 21:09:33', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (206, '/api/admin/config/recommend/hot', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/predis/predis/src/Connection/AbstractConnection.php', 155, 'Host is down [tcp://192.168.1.20:6379]', '{\"s\":\"\\/api\\/admin\\/config\\/recommend\\/hot\"}', 1, '2019-03-07 21:09:33', '2019-03-07 21:09:33', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (207, '/api/admin/config/recommend/best', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/predis/predis/src/Connection/AbstractConnection.php', 155, 'No route to host [tcp://192.168.1.20:6379]', '{\"s\":\"\\/api\\/admin\\/config\\/recommend\\/best\"}', 1, '2019-03-07 21:09:33', '2019-03-07 21:09:33', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (208, '/api/admin/config/recommend/base', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/predis/predis/src/Connection/AbstractConnection.php', 155, 'Operation timed out [tcp://192.168.1.20:6379]', '{\"s\":\"\\/api\\/admin\\/config\\/recommend\\/base\"}', 1, '2019-03-07 22:24:21', '2019-03-07 22:24:21', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (209, '/api/admin/config/recommend/hot', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/predis/predis/src/Connection/AbstractConnection.php', 155, 'Operation timed out [tcp://192.168.1.20:6379]', '{\"s\":\"\\/api\\/admin\\/config\\/recommend\\/hot\"}', 1, '2019-03-07 22:24:21', '2019-03-07 22:24:21', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (210, '/api/admin/config/recommend/best', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/predis/predis/src/Connection/AbstractConnection.php', 155, 'Operation timed out [tcp://192.168.1.20:6379]', '{\"s\":\"\\/api\\/admin\\/config\\/recommend\\/best\"}', 1, '2019-03-07 22:24:21', '2019-03-07 22:24:21', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (211, '/api/admin/config/recommend/base', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/predis/predis/src/Connection/AbstractConnection.php', 155, 'No route to host [tcp://192.168.1.20:6379]', '{\"s\":\"\\/api\\/admin\\/config\\/recommend\\/base\"}', 1, '2019-03-07 22:24:22', '2019-03-07 22:24:22', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (212, '/api/admin/config/recommend/best', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/predis/predis/src/Connection/AbstractConnection.php', 155, 'Host is down [tcp://192.168.1.20:6379]', '{\"s\":\"\\/api\\/admin\\/config\\/recommend\\/best\"}', 1, '2019-03-07 22:24:22', '2019-03-07 22:24:22', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (213, '/api/admin/config/recommend/hot', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/predis/predis/src/Connection/AbstractConnection.php', 155, 'Host is down [tcp://192.168.1.20:6379]', '{\"s\":\"\\/api\\/admin\\/config\\/recommend\\/hot\"}', 1, '2019-03-07 22:24:22', '2019-03-07 22:24:22', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (214, '/aa', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 14:06:28', '2019-03-08 14:06:28', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (215, '/aa', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 14:11:19', '2019-03-08 14:11:19', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (216, '/aa', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 14:11:21', '2019-03-08 14:11:21', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (217, '/api/ss', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 14:11:27', '2019-03-08 14:11:27', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (218, '/api/ss', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 14:15:11', '2019-03-08 14:15:11', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (219, '/api/ss', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 14:15:14', '2019-03-08 14:15:14', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (220, '/api/ss', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 14:15:15', '2019-03-08 14:15:15', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (221, '/api/ss', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 14:15:16', '2019-03-08 14:15:16', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (222, '/api/ss', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 14:15:17', '2019-03-08 14:15:17', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (223, '/api/ss', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 14:15:18', '2019-03-08 14:15:18', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (224, '/api/ss', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 14:15:20', '2019-03-08 14:15:20', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (225, '/api/ss', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 14:15:20', '2019-03-08 14:15:20', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (226, '/api/ss', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 14:15:21', '2019-03-08 14:15:21', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (227, '/api/ss', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 14:15:21', '2019-03-08 14:15:21', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (228, '/api/ss', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 14:15:22', '2019-03-08 14:15:22', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (229, '/api/ss', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 14:15:22', '2019-03-08 14:15:22', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (230, '/api/ss', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 14:15:22', '2019-03-08 14:15:22', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (231, '/api/ss', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 14:15:23', '2019-03-08 14:15:23', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (232, '/api/ss', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 14:15:23', '2019-03-08 14:15:23', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (233, '/api/ss', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 14:15:23', '2019-03-08 14:15:23', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (234, '/api/ss', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 14:15:23', '2019-03-08 14:15:23', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (235, '/api/ss', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 14:15:23', '2019-03-08 14:15:23', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (236, '/api/ss', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 14:15:23', '2019-03-08 14:15:23', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (237, '/api/ss', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 14:15:24', '2019-03-08 14:15:24', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (238, '/api/admin/coupon/retrieveall?type=2', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Database/Connection.php', 664, 'SQLSTATE[HY000] [2002] Network is unreachable (SQL: insert into `baoxian_error` (`url`, `files`, `lines`, `message`, `params`, `status`, `method`, `from`, `update_time`, `create_time`) values (/api/admin/coupon/retrieveall/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Database/Connection.phptype=2, 664, SQLSTATE[HY000] [2002] Network is unreachable (SQL: insert into `baoxian_error` (`url`, `files`, `lines`, `message`, `params`, `status`, `method`, `from`, `update_time`, `create_time`) values (/api/admin/coupon/retrieveall/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Database/Connection.phptype=2, 664, SQLSTATE[HY000] [2002] Network is unreachable (SQL: select * from `baoxian_coupon_plan` where (`type` = 2) order by `id` desc), {\"s\":\"\\/api\\/admin\\/coupon\\/retrieveall\",\"type\":\"2\"}, 1, GET, 1, 2019-03-08 14:38:44, 2019-03-08 14:38:44, {\"s\":\"\\/api\\/admin\\/coupon\\/retrieveall\",\"type\":\"2\"})), 1, GET, 1, 2019-03-08 14:38:48, 2019-03-08 14:38:48, ?, ?))', '{\"s\":\"\\/api\\/admin\\/coupon\\/retrieveall\",\"type\":\"2\"}', 1, '2019-03-08 14:38:52', '2019-03-08 14:38:52', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (239, '/api/admin/company/retrieveall?page=1&limit=20', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Database/Connection.php', 664, 'SQLSTATE[HY000] [2002] Network is unreachable (SQL: select count(*) as aggregate from `baoxian_company`)', '{\"s\":\"\\/api\\/admin\\/company\\/retrieveall\",\"page\":\"1\",\"limit\":\"20\"}', 1, '2019-03-08 14:38:44', '2019-03-08 14:38:44', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (240, '/api/admin/coupon/retrieveall?type=1', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Database/Connection.php', 664, 'SQLSTATE[HY000] [2002] Network is unreachable (SQL: insert into `baoxian_error` (`url`, `files`, `lines`, `message`, `params`, `status`, `method`, `from`, `update_time`, `create_time`) values (/api/admin/coupon/retrieveall/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Database/Connection.phptype=1, 664, SQLSTATE[HY000] [2002] Network is unreachable (SQL: select * from `baoxian_coupon_plan` where (`type` = 1) order by `id` desc), {\"s\":\"\\/api\\/admin\\/coupon\\/retrieveall\",\"type\":\"1\"}, 1, GET, 1, 2019-03-08 14:38:44, 2019-03-08 14:38:44, ?))', '{\"s\":\"\\/api\\/admin\\/coupon\\/retrieveall\",\"type\":\"1\"}', 1, '2019-03-08 14:38:51', '2019-03-08 14:38:51', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (241, '/api/login', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 16:19:54', '2019-03-08 16:19:54', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (242, '/api/login', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 16:20:59', '2019-03-08 16:20:59', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (243, '/api/login', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 16:21:08', '2019-03-08 16:21:08', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (244, '/api/login', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 16:21:40', '2019-03-08 16:21:40', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (245, '/api/login', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 16:24:05', '2019-03-08 16:24:05', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (246, '/api/admin/login', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 16:31:45', '2019-03-08 16:31:45', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (247, '/api/admin/login', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 16:32:12', '2019-03-08 16:32:12', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (248, '/admin/login', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 16:32:32', '2019-03-08 16:32:32', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (249, '/login/admin/login', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 16:33:03', '2019-03-08 16:33:03', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (250, '/login/admin/login', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 16:33:32', '2019-03-08 16:33:32', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (251, '/api/admin/login', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 16:33:40', '2019-03-08 16:33:40', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (252, '/api/admin/login', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 16:34:15', '2019-03-08 16:34:15', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (253, '/admin/login', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 16:34:26', '2019-03-08 16:34:26', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (254, '/api/admin/login', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 16:35:03', '2019-03-08 16:35:03', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (255, '/api/admin/login', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 16:38:34', '2019-03-08 16:38:34', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (256, '/api/admin/login', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 16:38:51', '2019-03-08 16:38:51', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (257, '/api/admin/login', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 16:39:13', '2019-03-08 16:39:13', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (258, '/api/admin/login', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 16:40:23', '2019-03-08 16:40:23', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (259, '/api/admin/login', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 16:42:59', '2019-03-08 16:42:59', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (260, '/api/admin/login', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 16:43:33', '2019-03-08 16:43:33', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (261, '/api/admin/login', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 16:43:57', '2019-03-08 16:43:57', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (262, '/api/admin/login', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 16:47:36', '2019-03-08 16:47:36', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (263, '/api/admin/login', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 16:48:21', '2019-03-08 16:48:21', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (264, '/api/admin/login', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '[]', 1, '2019-03-08 16:48:24', '2019-03-08 16:48:24', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (265, '/api/getreinfo?LicenseNo=%E8%B4%B5A11111', '/home/vagrant/Code/cmbx/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '{\"LicenseNo\":\"\\u8d35A11111\"}', 1, '2019-03-08 16:53:01', '2019-03-08 16:53:01', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (266, '/api/admin/login', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '{\"mobile\":\"15085069257\",\"password\":\"yklykl\"}', 1, '2019-03-11 09:06:02', '2019-03-11 09:06:02', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (267, '/api/admin/login', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/guzzlehttp/guzzle/src/Client.php', 62, 'Argument 1 passed to GuzzleHttp\\Client::__construct() must be of the type array, string given, called in /Users/yangkunlin/git/chemi_api_insurance.com/app/Services/HttpUtil.php on line 25', '{\"mobile\":\"15085069257\",\"password\":\"yklykl\"}', 1, '2019-03-11 09:08:01', '2019-03-11 09:08:01', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (268, '/api/admin/login', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Services/HttpUtil.php', 140, '签名为空', '{\"mobile\":\"15085069257\",\"password\":\"yklykl\"}', 1, '2019-03-11 09:09:37', '2019-03-11 09:09:37', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (269, '/api/admin/login', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Database/Connection.php', 664, 'SQLSTATE[HY000] [2002] Operation timed out (SQL: insert into `baoxian_error` (`url`, `files`, `lines`, `message`, `params`, `status`, `method`, `from`, `update_time`, `create_time`) values (/api/admin/login, /Users/yangkunlin/git/chemi_api_insurance.com/app/Services/Login.php, 29, Call to undefined function App\\Services\\SignatureService(), {\"mobile\":\"15085069257\",\"password\":\"yklykl\"}, 1, POST, 1, 2019-03-11 09:29:56, 2019-03-11 09:29:56))', '{\"mobile\":\"15085069257\",\"password\":\"yklykl\"}', 1, '2019-03-11 09:30:26', '2019-03-11 09:30:26', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (270, '/api/admin/login', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Services/Login.php', 30, 'Call to undefined function App\\Services\\SignatureService()', '{\"mobile\":\"15085069257\",\"password\":\"yklykl\"}', 1, '2019-03-11 09:34:47', '2019-03-11 09:34:47', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (271, '/api/admin/login', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Services/HttpUtil.php', 140, '用户名或密码错误，您还可以登录 9 次！', '{\"mobile\":\"15085069257\",\"password\":\"yklykl\"}', 1, '2019-03-11 09:35:02', '2019-03-11 09:35:02', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (272, '/api/admin/login', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Services/HttpUtil.php', 140, '用户名或密码错误，您还可以登录 8 次！', '{\"mobile\":\"15085069257\",\"password\":\"yklykl\"}', 1, '2019-03-11 09:35:08', '2019-03-11 09:35:08', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (273, '/api/admin/login', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Services/HttpUtil.php', 140, '用户名或密码错误，您还可以登录 7 次！', '{\"mobile\":\"15085069257\",\"password\":\"yklykl\"}', 1, '2019-03-11 09:35:15', '2019-03-11 09:35:15', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (274, '/api/admin/login', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Http/Request.php', 478, 'Session store not set on request.', '{\"mobile\":\"15085069257\",\"password\":\"yklykl\"}', 1, '2019-03-11 09:53:49', '2019-03-11 09:53:49', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (275, '/api/admin/login', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Services/HttpUtil.php', 140, '用户名或密码错误，您还可以登录 9 次！', '{\"mobile\":\"15085069257\",\"password\":\"yklykl\"}', 1, '2019-03-11 10:01:20', '2019-03-11 10:01:20', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (276, '/api/admin/login', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Services/HttpUtil.php', 140, '用户名或密码错误，您还可以登录 8 次！', '{\"mobile\":\"15085069257\",\"password\":\"123123\"}', 1, '2019-03-11 10:01:40', '2019-03-11 10:01:40', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (277, '/api/admin/login', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Services/HttpUtil.php', 140, '用户名或密码错误，您还可以登录 7 次！', '{\"mobile\":\"15085069257\",\"password\":\"123123\"}', 1, '2019-03-11 10:02:04', '2019-03-11 10:02:04', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (278, '/api/admin/login', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Services/HttpUtil.php', 140, '权限不足', '{\"mobile\":\"15085069257\",\"password\":\"123123\"}', 1, '2019-03-11 10:03:50', '2019-03-11 10:03:50', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (279, '/api/admin/coupon/retrieveall?name=&page=1&limit=20', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Middleware/AdminLoginMiddleware.php', 27, '用户未登录', '{\"s\":\"\\/api\\/admin\\/coupon\\/retrieveall\",\"name\":null,\"page\":\"1\",\"limit\":\"20\"}', 1, '2019-03-11 10:13:23', '2019-03-11 10:13:23', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (280, '/api/admin/config/recommend/base', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Middleware/AdminLoginMiddleware.php', 27, '用户未登录', '{\"s\":\"\\/api\\/admin\\/config\\/recommend\\/base\"}', 1, '2019-03-11 10:20:08', '2019-03-11 10:20:08', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (281, '/api/admin/config/recommend/hot', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Middleware/AdminLoginMiddleware.php', 27, '用户未登录', '{\"s\":\"\\/api\\/admin\\/config\\/recommend\\/hot\"}', 1, '2019-03-11 10:20:08', '2019-03-11 10:20:08', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (282, '/api/admin/config/recommend/best', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Middleware/AdminLoginMiddleware.php', 27, '用户未登录', '{\"s\":\"\\/api\\/admin\\/config\\/recommend\\/best\"}', 1, '2019-03-11 10:20:08', '2019-03-11 10:20:08', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (283, '/api/admin/login/info', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 255, '', '[]', 1, '2019-03-11 11:34:13', '2019-03-11 11:34:13', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (284, '/api/admin/login/info', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 255, '', '[]', 1, '2019-03-11 11:35:49', '2019-03-11 11:35:49', 'POST', 1);
INSERT INTO `baoxian_error` VALUES (285, '/api/admin/login/info', '/Users/yangkunlin/git/chemi_api_insurance.com/app/Http/Middleware/AdminLoginMiddleware.php', 27, '用户未登录', '{\"s\":\"\\/api\\/admin\\/login\\/info\"}', 1, '2019-03-11 11:36:02', '2019-03-11 11:36:02', 'GET', 1);
INSERT INTO `baoxian_error` VALUES (286, '/api/user', '/Users/yangkunlin/git/chemi_api_insurance.com/vendor/laravel/framework/src/Illuminate/Routing/RouteCollection.php', 179, '', '{\"s\":\"\\/api\\/user\"}', 1, '2019-05-21 16:00:01', '2019-05-21 16:00:01', 'GET', 1);

-- ----------------------------
-- Table structure for baoxian_login
-- ----------------------------
DROP TABLE IF EXISTS `baoxian_login`;
CREATE TABLE `baoxian_login`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NULL DEFAULT 0 COMMENT '车秘用户ID',
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '绑定类型wx,qq等',
  `authcode` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '平台唯一授权码',
  `openid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信openid',
  `nickname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '昵称',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index`(`authcode`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '第三方平台绑定' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of baoxian_login
-- ----------------------------
INSERT INTO `baoxian_login` VALUES (1, 60351, 'wx', 'ohQOo1FyvSIfUxqN7u56mp0NSKPA', 'ohQOo1FyvSIfUxqN7u56mp0NSKPA', '', '2019-01-18 14:32:47');
INSERT INTO `baoxian_login` VALUES (2, 48225, 'wx', 'ohQOo1Puy08Q_NasJ-cW1eG8mw7I', 'ohQOo1Puy08Q_NasJ-cW1eG8mw7I', '', '2019-01-18 15:13:18');
INSERT INTO `baoxian_login` VALUES (3, 0, 'wx', 'ohQOo1PzB6hGQyWxlJoIQVOH41dw', 'ohQOo1PzB6hGQyWxlJoIQVOH41dw', '', '2019-01-18 15:40:02');
INSERT INTO `baoxian_login` VALUES (4, 58274, 'wx', 'ohQOo1G2ufsqbbQaRcH5OyMMQKMk', 'ohQOo1G2ufsqbbQaRcH5OyMMQKMk', '', '2019-01-18 16:25:52');
INSERT INTO `baoxian_login` VALUES (5, 47489, 'wx', 'ohQOo1NeZxgi0lUSdDjWTboC8Mto', 'ohQOo1NeZxgi0lUSdDjWTboC8Mto', '', '2019-01-21 09:56:55');

-- ----------------------------
-- Table structure for baoxian_order_page_201903
-- ----------------------------
DROP TABLE IF EXISTS `baoxian_order_page_201903`;
CREATE TABLE `baoxian_order_page_201903`  (
  `id` int(10) UNSIGNED NOT NULL COMMENT '订单ID',
  `uid` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '用户ID',
  `pay` mediumint(8) UNSIGNED NULL DEFAULT NULL COMMENT '订单支付金额：分，订单实际金额 = pay + deduct',
  `deduct` mediumint(8) UNSIGNED NULL DEFAULT NULL COMMENT '抵扣金额：分',
  `payway` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付方式：wx微信 cb车币',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '订单状态：-1已退款 0未支付 1已支付 2已取消',
  `target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '来源',
  `agent_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '代理人ID',
  `create_time` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '订单创建时间',
  `updated_at` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '订单状态更新时间',
  `citycode` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '城市ID',
  `licenseno` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌号',
  `source` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '保司',
  `engineno` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发动机号',
  `carvin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车架号',
  `registerdate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册日期',
  `modlename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '品牌型号',
  `forcetax` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '0:单商业，1：商业+交强车船，2：单交强+车船',
  `forcetimestamp` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '交强险起保时间',
  `biztimestamp` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '商业险起保时间（如果在单商业的情况下 ，此字段必须有值）',
  `boli` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '玻璃单独破碎险，0-不投保，1国产，2进口',
  `bujimianchesun` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '不计免赔险(车损)，0-不投保，1投保',
  `bujimiandaoqiang` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '不计免赔险(盗抢) ，0-不投保，1投保',
  `bujimiansanzhe` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '不计免赔险(三者) ，0-不投保，1投保',
  `bujimianchengke` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '不计免乘客0-不投保，1投保',
  `bujimiansiji` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '不计免司机0-不投保，1投保',
  `bujimianhuahen` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '不计免划痕0-不投保，1投保',
  `bujimiansheshui` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '不计免涉水0-不投保，1投保',
  `bujimianziran` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '不计免自燃0-不投保，1投保',
  `bujimianjingshensunshi` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '不计免精神损失0-不投保，1投保',
  `sheshui` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '涉水行驶损失险，0-不投保，1投保',
  `huahen` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '车身划痕损失险，0-不投保，>0投保(具体金额)',
  `siji` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '车上人员责任险(司机) ，0-不投保，>0投保(具体金额）',
  `chengke` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '车上人员责任险(乘客) ，0-不投保，>0投保(具体金额)',
  `chesun` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '机动车损失保险，0-不投保，1-投保',
  `daoqiang` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '全车盗抢保险，0-不投保，1-投保',
  `sanzhe` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '第三者责任保险，0-不投保，>0投保(具体金额)',
  `ziran` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '自燃损失险，0-不投保，1投保',
  `hcjingshensunshi` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '精神损失抚慰金责任险（0:不投，>0：保额）（前提是三者，司机，乘客至少有一个投保，保额支持自定义）',
  `hcsanfangteyue` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '机动车损失保险无法找到第三方特约险（0:不投，1：投保）(前提必须上车损险)',
  `shebeisunshi` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '设备损失险 1：投保 0:不投保',
  `bjmshebeisunshi` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '不计免设备损失险 1：投保 0:不投保',
  `isnewcar` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '是否新车（1：新车  2：旧车（默认）；）',
  `cartype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车辆类型',
  `carusedtype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '使用性质',
  `seatcount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '核定载客量',
  `toncount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '核定载质量',
  `transferdate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '过户车日期（yyyy-mm-dd）',
  `purchaseprice` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '购置价格',
  `negotiateprice` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '协商价格',
  `automoldcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '精友编码',
  `exhaustscale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '排气量',
  `carownersname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车主姓名',
  `owneridcardtype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车主证件类型',
  `idcard` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车主证件号',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车主邮箱',
  `ownersex` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '车主性别 1男 2女',
  `ownerauthority` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车主证件签发机关',
  `ownernation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车主民族',
  `ownerbirthday` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车主生日 格式为：xxxx-xx-xx',
  `owneraddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车主联系地址',
  `insuredtoowner` tinyint(1) NULL DEFAULT NULL COMMENT '被保险人是否同车主 0否 1是',
  `insuredpeople` tinyint(1) NULL DEFAULT NULL COMMENT '被保人类型 1个人 2团体',
  `insuredname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '被保险人姓名',
  `insuredidcard` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '被保险人证件号',
  `insuredidtype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '被保险人证件类型',
  `insuredmobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '被保险人手机号',
  `insuredemail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '被保人邮箱',
  `insuredaddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '被保险人地址',
  `insuredcertistartdate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '被保险人身份证有效期起期（yyyy-mm-dd北京平安必填）',
  `insuredcertienddate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '被保险人身份证有效期止期（yyyy-mm-dd北京平安必填；长期请标识为：9999-12-31）',
  `insuredsex` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '被保险人性别（身份证采集用）1男2女',
  `insuredauthority` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '被保险人证件签发机关（身份证采集用）',
  `insurednation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '被保险人民族',
  `insuredbirthday` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '被保险人生日（身份证采集用）格式为：xxxx-xx-xx',
  `holdertoowner` tinyint(1) NULL DEFAULT NULL COMMENT '投保人是否同车主 0否 1是',
  `holdertoinsured` tinyint(1) NULL DEFAULT NULL COMMENT '投保人是否同被保人 0否 1是',
  `holderpeople` tinyint(1) NULL DEFAULT NULL COMMENT '投保人类型 1个人 2团体',
  `holderidcard` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '投保人证件号',
  `holdername` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '投保人姓名',
  `holderidtype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '投保人证件类型（类型同被保人）',
  `holdermobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '投保人手机号',
  `holderemail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '投保人邮箱',
  `holderaddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '投保人地址',
  `holdercertistartdate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '投保人身份证有效期起期（yyyy-mm-dd北京平安必填）',
  `holdercertienddate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '投保人身份证有效期止期（yyyy-mm-dd北京平安必填；长期请标识为：9999-12-31）',
  `holdersex` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '投保人性别（身份证采集用）1男2女',
  `holderauthority` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '投保人证件签发机关',
  `holdernation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '投保人民族',
  `holderbirthday` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '投保人生日（身份证采集用）格式为：xxxx-xx-xx',
  `forceenddate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交强险截止日期',
  `businessenddate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商业险截止日期',
  `biztotal` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '商业险总额',
  `forcetotal` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '交强险总额',
  `taxtotal` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '车船税总额',
  `mailaddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '保单邮寄地址',
  `electronicaddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子保单地址',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of baoxian_order_page_201903
-- ----------------------------
INSERT INTO `baoxian_order_page_201903` VALUES (1000, 48225, 100000, NULL, 'wxpayjs', 1, NULL, NULL, NULL, NULL, NULL, NULL, 4097, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 10, 10, NULL, NULL);

-- ----------------------------
-- Table structure for baoxian_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `baoxian_userinfo`;
CREATE TABLE `baoxian_userinfo`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `citycode` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '城市ID',
  `licenseno` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '车牌号',
  `userinfo` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '车主信息json',
  `savequote` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '上年投保信息json',
  `postprecise` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '投保信息json',
  `preciseprice` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '报价信息json',
  `stockinfo` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '个人补充信息json',
  `updated_at` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '更新时间',
  `create_time` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `CityCode`(`citycode`, `licenseno`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of baoxian_userinfo
-- ----------------------------
INSERT INTO `baoxian_userinfo` VALUES (1, 95, '贵A11111', '{\"CarUsedType\":1,\"LicenseNo\":\"贵A11111\",\"LicenseOwner\":\"黎志**\",\"PurchasePrice\":122900,\"IdType\":1,\"CredentislasNum\":\"42108319970711****\",\"CityCode\":95,\"EngineNo\":\"JW482137\",\"ModleName\":\"北京现代BH6441YAV多用途乘用车\",\"RegisterDate\":\"2018-11-19\",\"CarVin\":\"LBENUBKC7JS098251\",\"ForceExpireDate\":\"2019-11-19\",\"BusinessExpireDate\":\"2019-11-19\",\"NextForceStartDate\":\"2019-11-19\",\"NextBusinessStartDate\":\"2019-11-19\",\"SeatCount\":5,\"InsuredName\":\"黎志**\",\"InsuredIdType\":1,\"InsuredIdCard\":\"42108319970711****\",\"InsuredMobile\":\"\",\"PostedName\":\"黎志**\",\"HolderIdType\":1,\"HolderIdCard\":\"42108319970711****\",\"HolderMobile\":\"\",\"FuelType\":1,\"ProofType\":0,\"ClauseType\":0,\"LicenseColor\":0,\"RunRegion\":0,\"IsPublic\":2,\"BizNo\":\"\",\"ForceNo\":\"\",\"AutoMoldCode\":\"\"}', '{\"Source\":2,\"CheSun\":118900,\"SanZhe\":1000000,\"DaoQiang\":0,\"SiJi\":0,\"ChengKe\":0,\"BoLi\":0,\"HuaHen\":0,\"SheShui\":1,\"ZiRan\":0,\"HcSanFangTeYue\":1,\"HcJingShenSunShi\":0,\"BuJiMianCheSun\":1,\"BuJiMianSanZhe\":1,\"BuJiMianDaoQiang\":0,\"BuJiMianChengKe\":0,\"BuJiMianSiJi\":0,\"BuJiMianHuaHen\":0,\"BuJiMianSheShui\":1,\"BuJiMianZiRan\":0,\"BuJiMianJingShenSunShi\":0,\"HcXiuLiChangType\":\"\",\"Fybc\":\"\",\"FybcDays\":\"\",\"SheBeiSunShi\":\"\",\"BjmSheBeiSunShi\":\"\"}', NULL, '{\"2\":{\"Company\":\"平安\",\"Msg\":\"chemi_user_keys:-10001:上次报价\\/核保值缓存到当天23:59分，请重新请求报价\\/核保再获取详情。\",\"UserInfo\":[],\"Item\":[]},\"4\":{\"Company\":\"人保\",\"Msg\":\"chemi_user_keys:-10001:上次报价\\/核保值缓存到当天23:59分，请重新请求报价\\/核保再获取详情。\",\"UserInfo\":[],\"Item\":[]}}', NULL, 1550560192, 1548660191);

-- ----------------------------
-- Table structure for pro_config
-- ----------------------------
DROP TABLE IF EXISTS `pro_config`;
CREATE TABLE `pro_config`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `app` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据源',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '配置名',
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据类型',
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '配置值',
  `min` int(11) NULL DEFAULT NULL COMMENT '最小值',
  `max` int(11) NULL DEFAULT NULL COMMENT '最大值',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统配置项' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pro_config
-- ----------------------------
INSERT INTO `pro_config` VALUES (1, 'xc', 'admin', 'textarea', '15023767336\n18198228422', NULL, NULL, '管理员列表，一行一个手机号');
INSERT INTO `pro_config` VALUES (2, 'xc', 'apikey', 'text', '64BCD13B69924837B6DF728F685A05B8', NULL, NULL, '洗车机apikey');
INSERT INTO `pro_config` VALUES (3, 'xc', 'schedule_days', 'number', '3', 3, 30, '排班天数');
INSERT INTO `pro_config` VALUES (4, 'xc', 'wash_order_expire', 'number', '300', 300, 3600, '停车场洗车未支付订单超时时间 (秒)');
INSERT INTO `pro_config` VALUES (6, 'xc', 'carport_count', 'number', '5', 1, 10, '每个用户最多添加车辆的数量');
INSERT INTO `pro_config` VALUES (7, 'xc', 'user_day_order_limit', 'number', '0', 0, 10, '每个用户每天下单数量限制 (0为不限制)');
INSERT INTO `pro_config` VALUES (9, 'xc', 'cancel_order_mintime', 'number', '300', 0, 86400, '距预约时间多久将不能取消订单 (秒)  (0为不限制)');
INSERT INTO `pro_config` VALUES (10, 'xc', 'vip_order_limit', 'number', '100', 1, 100, 'vip会员单天内下单数量限制');
INSERT INTO `pro_config` VALUES (11, 'xc', 'employee_order_limit', 'number', '1', 1, 10, '员工最大接单数');

-- ----------------------------
-- Table structure for pro_hashcheck
-- ----------------------------
DROP TABLE IF EXISTS `pro_hashcheck`;
CREATE TABLE `pro_hashcheck`  (
  `hash` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '唯一标识',
  `dateline` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`hash`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '验证唯一性记录表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for pro_loginbinding
-- ----------------------------
DROP TABLE IF EXISTS `pro_loginbinding`;
CREATE TABLE `pro_loginbinding`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `platform` tinyint(3) UNSIGNED NULL DEFAULT NULL COMMENT '第三方平台代码',
  `uid` mediumint(8) UNSIGNED NULL DEFAULT 0 COMMENT '车秘用户ID',
  `type` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '绑定类型wx,qq等',
  `authcode` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '平台唯一授权码',
  `nickname` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `tel` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `activetime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index`(`platform`, `authcode`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `authcode`(`authcode`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '第三方平台绑定' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pro_loginbinding
-- ----------------------------
INSERT INTO `pro_loginbinding` VALUES (1, 3, 61433, 'xc', '61433', '', '17621094331', '2019-04-30 19:40:41');
INSERT INTO `pro_loginbinding` VALUES (2, 3, 58827, 'xc', '58827', '', '18785097239', '2019-05-05 09:19:36');
INSERT INTO `pro_loginbinding` VALUES (4, 3, 61426, 'xc', '61426', '', '18351961798', '2019-05-13 09:43:18');
INSERT INTO `pro_loginbinding` VALUES (5, 3, 45202, 'xc', '45202', '', '18785002668', '2019-05-29 15:17:25');
INSERT INTO `pro_loginbinding` VALUES (6, 3, 63700, 'xc', '63700', '', '17621094331', '2019-06-26 19:54:17');
INSERT INTO `pro_loginbinding` VALUES (7, 3, 58274, 'xc', '58274', '', '15985107027', '2019-09-02 15:15:13');
INSERT INTO `pro_loginbinding` VALUES (8, 3, 65877, 'xc', '65877', '', '18798043154', '2019-07-03 18:30:59');
INSERT INTO `pro_loginbinding` VALUES (9, 3, 48981, 'xc', '48981', '', '15985143247', '2019-07-05 10:20:41');
INSERT INTO `pro_loginbinding` VALUES (10, 3, 60452, 'xc', '60452', '', '18623663270', '2019-07-05 10:23:08');
INSERT INTO `pro_loginbinding` VALUES (11, 3, 58256, 'xc', '58256', '', '15067365108', '2019-07-05 10:51:55');
INSERT INTO `pro_loginbinding` VALUES (12, 3, 63489, 'xc', '63489', '', '15023767336', '2019-07-10 16:50:57');
INSERT INTO `pro_loginbinding` VALUES (13, 3, 69832, 'xc', '69832', '', '15285064461', '2019-07-12 15:17:35');
INSERT INTO `pro_loginbinding` VALUES (14, 3, 64077, 'xc', '64077', '', '18926475276', '2019-07-16 11:05:28');
INSERT INTO `pro_loginbinding` VALUES (15, 3, 68797, 'xc', '68797', '', '18202397593', '2019-07-20 20:16:44');
INSERT INTO `pro_loginbinding` VALUES (16, 3, 52529, 'xc', '52529', '', '18198228422', '2019-07-25 16:20:15');

-- ----------------------------
-- Table structure for pro_payments
-- ----------------------------
DROP TABLE IF EXISTS `pro_payments`;
CREATE TABLE `pro_payments`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易场景',
  `trade_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '扩展字段 用户编号',
  `order_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '扩展字段 订单编号',
  `param_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '扩展字段 设备编号',
  `param_a` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '扩展字段 设备启动时间',
  `param_b` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '扩展字段 设备停止时间',
  `voucher_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '优惠券ID',
  `form_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '小程序模板消息 (表单提交场景下，为 submit 事件带上的 formId；支付场景下，为本次支付的 prepay_id)',
  `pay` mediumint(8) UNSIGNED NULL DEFAULT 0 COMMENT '支付金额分',
  `money` mediumint(8) UNSIGNED NULL DEFAULT NULL COMMENT '订单金额分',
  `payway` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '付款方式',
  `ordercode` char(28) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `paytime` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `mchid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商户号',
  `trade_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付类型',
  `trade_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易号',
  `trade_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易状态',
  `refundcode` varchar(28) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退款单号',
  `refundpay` mediumint(8) UNSIGNED NULL DEFAULT NULL COMMENT '退款金额分',
  `refundtime` datetime(0) NULL DEFAULT NULL COMMENT '退款时间',
  `uses` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用途',
  `createtime` datetime(0) NULL DEFAULT NULL COMMENT '下单时间',
  `mark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述字段',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '-2退款中 -1已退款 0未支付 1支付成功',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ordercode`(`ordercode`) USING BTREE,
  INDEX `trade_id`(`trade_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 324 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pro_payments
-- ----------------------------
INSERT INTO `pro_payments` VALUES (1, 'pwadd', 63489, NULL, NULL, NULL, NULL, NULL, 'wx121544575368124f888a97641480152700', 1, 10001, 'wxpaywash', '2019071235293489', '2019-07-12 15:45:10', '1525654921', 'JSAPI', '4200000317201907128347876798', '', NULL, NULL, NULL, '余额充值', '2019-07-12 15:44:57', NULL, 1);
INSERT INTO `pro_payments` VALUES (2, 'pwadd', 69832, NULL, NULL, NULL, NULL, NULL, 'wx121646360495613ffc63745f1758019400', 1, 10001, 'wxpaywash', '2019071264719832', '2019-07-12 16:47:09', '1525654921', 'JSAPI', '4200000309201907125598650011', '', NULL, NULL, NULL, '余额充值', '2019-07-12 16:46:35', NULL, 1);
INSERT INTO `pro_payments` VALUES (3, 'parkwash', 63489, 1, NULL, NULL, NULL, NULL, NULL, 0, 5, 'cbpay', '2019071232493489', '2019-07-12 15:47:43', NULL, NULL, NULL, NULL, '2019071269173489', 0, '2019-07-12 15:48:10', '洗车服务', '2019-07-12 15:47:43', '7568edb69e177cc88e0811b2796c8963', -1);
INSERT INTO `pro_payments` VALUES (4, 'parkwash', 63489, 2, NULL, NULL, NULL, NULL, NULL, 0, 2, 'cbpay', '2019071265633489', '2019-07-12 16:02:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-12 16:02:41', '04aeaa49f4d4531a2fd1a04b96765ad0', 1);
INSERT INTO `pro_payments` VALUES (5, 'parkwash', 60452, 3, NULL, NULL, NULL, NULL, NULL, 1, 1, 'cbpay', '2019071210740452', '2019-07-12 16:14:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-12 16:14:00', '91fbbbb5bca3a0719d08017b0416ef21', 1);
INSERT INTO `pro_payments` VALUES (6, 'parkwash', 63489, 4, NULL, NULL, NULL, NULL, NULL, 0, 3, 'cbpay', '2019071231233489', '2019-07-12 16:28:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-12 16:28:44', 'fa5a353bf609b4ca3b0edce097eafc4c', 1);
INSERT INTO `pro_payments` VALUES (7, 'parkwash', 63489, 5, NULL, NULL, NULL, NULL, NULL, 0, 2, 'cbpay', '2019071298393489', '2019-07-12 16:34:27', NULL, NULL, NULL, NULL, '2019071259613489', 0, '2019-07-12 16:35:24', '洗车服务', '2019-07-12 16:34:27', '541f2399e9bd00aeb0432b7cb0ffc184', -1);
INSERT INTO `pro_payments` VALUES (8, 'parkwash', 63489, 6, NULL, NULL, NULL, NULL, NULL, 0, 4, 'cbpay', '2019071267753489', '2019-07-12 16:36:23', NULL, NULL, NULL, NULL, '2019071273293489', 0, '2019-07-12 17:08:43', '洗车服务', '2019-07-12 16:36:23', '1b78f7583c394b198e05a2d78ab6cae9', -1);
INSERT INTO `pro_payments` VALUES (9, 'parkwash', 69832, 7, NULL, NULL, NULL, NULL, NULL, 0, 3, 'cbpay', '2019071278839832', '2019-07-12 16:48:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-12 16:48:33', '922ce82210026b0077d00c4c28bf95ed', 1);
INSERT INTO `pro_payments` VALUES (10, 'parkwash', 63489, 8, NULL, NULL, NULL, NULL, NULL, 10000, 20000, 'cbpay', '2019071280533489', '2019-07-12 17:10:20', NULL, NULL, NULL, NULL, '2019071277063489', 10000, '2019-07-12 17:14:04', '洗车服务', '2019-07-12 17:10:20', '647a14ed5f03f54026d406f06356a006', -1);
INSERT INTO `pro_payments` VALUES (11, 'parkwash', 63489, 9, NULL, NULL, NULL, NULL, NULL, 10000, 10000, 'cbpay', '2019071236023489', '2019-07-12 17:14:33', NULL, NULL, NULL, NULL, '2019071250233489', 10000, '2019-07-12 17:15:25', '洗车服务', '2019-07-12 17:14:33', '71bd82b5a53b96e7e4569cb7aa27099b', -1);
INSERT INTO `pro_payments` VALUES (12, 'parkwash', 63489, 10, NULL, NULL, NULL, NULL, NULL, 20000, 20000, 'cbpay', '2019071231113489', '2019-07-12 17:20:13', NULL, NULL, NULL, NULL, '2019071217923489', 20000, '2019-07-12 17:21:03', '洗车服务', '2019-07-12 17:20:13', 'f7168a18def75699e8a4487a0e9f1895', -1);
INSERT INTO `pro_payments` VALUES (13, 'parkwash', 63489, 11, NULL, NULL, NULL, NULL, NULL, 40000, 40000, 'cbpay', '2019071265483489', '2019-07-12 17:22:44', NULL, NULL, NULL, NULL, '2019071298153489', 40000, '2019-07-12 17:22:57', '洗车服务', '2019-07-12 17:22:44', 'f82b2ac482cbc82c20c0efba0500eefb', -1);
INSERT INTO `pro_payments` VALUES (14, 'parkwash', 63489, 12, NULL, NULL, NULL, NULL, NULL, 10000, 10000, 'cbpay', '2019071364973489', '2019-07-13 12:38:16', NULL, NULL, NULL, NULL, '2019071326163489', 10000, '2019-07-13 12:38:45', '洗车服务', '2019-07-13 12:38:16', '91cd373e5c4d1036234a178f8851b32d', -1);
INSERT INTO `pro_payments` VALUES (15, 'parkwash', 63489, 13, NULL, NULL, NULL, NULL, NULL, 30000, 30000, 'cbpay', '2019071454983489', '2019-07-14 21:18:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-14 21:18:51', 'df8eb787f6255bf61673842ae8e41a50', 1);
INSERT INTO `pro_payments` VALUES (16, 'parkwash', 63489, 14, NULL, NULL, NULL, NULL, NULL, 10000, 10000, 'cbpay', '2019071400723489', '2019-07-14 21:19:28', NULL, NULL, NULL, NULL, '2019071524213489', 10000, '2019-07-15 11:51:15', '洗车服务', '2019-07-14 21:19:28', 'dbde33e305865ed75c0059f2a9592149', -1);
INSERT INTO `pro_payments` VALUES (17, 'parkwash', 60452, 15, NULL, NULL, NULL, NULL, NULL, 10000, 10000, 'cbpay', '2019071585140452', '2019-07-15 10:41:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-15 10:41:36', '35270d9846ea68c71d204cae36156bdc', 1);
INSERT INTO `pro_payments` VALUES (19, 'parkwash', 63700, 16, NULL, NULL, NULL, NULL, NULL, 0, 10, 'cbpay', '2019071520483700', '2019-07-15 11:59:24', NULL, NULL, NULL, NULL, '2019071567463700', 0, '2019-07-15 11:59:49', '洗车服务', '2019-07-15 11:59:24', '8a18f13596266b72b11d74b629571a51', -1);
INSERT INTO `pro_payments` VALUES (20, 'pwadd', 63489, NULL, 2, NULL, NULL, NULL, 'wx15120033894437ed6cd066e41474563600', 1, 10001, 'wxpaywash', '2019071577293489', '2019-07-15 12:00:41', '1525654921', 'JSAPI', '4200000325201907157310287004', '', NULL, NULL, NULL, '余额充值', '2019-07-15 12:00:33', NULL, 1);
INSERT INTO `pro_payments` VALUES (21, 'parkwash', 63489, 17, NULL, NULL, NULL, NULL, NULL, 0, 10000, 'cbpay', '2019071520933489', '2019-07-15 12:01:11', NULL, NULL, NULL, NULL, '2019071514363489', 0, '2019-07-15 12:01:38', '洗车服务', '2019-07-15 12:01:11', '93c9bc059ea49ac8a764d1a27bc18a39', -1);
INSERT INTO `pro_payments` VALUES (22, 'parkwash', 63700, 18, NULL, NULL, NULL, NULL, NULL, 0, 10, 'cbpay', '2019071523803700', '2019-07-15 12:02:05', NULL, NULL, NULL, NULL, '2019071583423700', 0, '2019-07-15 12:02:19', '洗车服务', '2019-07-15 12:02:05', 'e2bca8aec6bef96b6fbc73e056637bd5', -1);
INSERT INTO `pro_payments` VALUES (23, 'parkwash', 63700, 19, NULL, NULL, NULL, NULL, NULL, 0, 30, 'cbpay', '2019071560463700', '2019-07-15 12:05:08', NULL, NULL, NULL, NULL, '2019071541863700', 0, '2019-07-15 12:05:22', '洗车服务', '2019-07-15 12:05:08', '3bf892030e9cb0cb596ad92d7d77d344', -1);
INSERT INTO `pro_payments` VALUES (24, 'parkwash', 63489, 20, NULL, NULL, NULL, NULL, NULL, 0, 10000, 'cbpay', '2019071566633489', '2019-07-15 12:07:46', NULL, NULL, NULL, NULL, '2019071548983489', 0, '2019-07-15 12:08:08', '洗车服务', '2019-07-15 12:07:46', '93c9bc059ea49ac8a764d1a27bc18a39', -1);
INSERT INTO `pro_payments` VALUES (25, 'parkwash', 63489, 21, NULL, NULL, NULL, NULL, NULL, 0, 10000, 'cbpay', '2019071597933489', '2019-07-15 12:08:53', NULL, NULL, NULL, NULL, '2019071517093489', 0, '2019-07-15 12:09:09', '洗车服务', '2019-07-15 12:08:53', '93c9bc059ea49ac8a764d1a27bc18a39', -1);
INSERT INTO `pro_payments` VALUES (26, 'parkwash', 63489, 22, NULL, NULL, NULL, NULL, NULL, 10000, 20000, 'cbpay', '2019071635193489', '2019-07-16 09:16:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-16 09:16:53', '21399795c18eb5534ebb83fa388be3e2', 1);
INSERT INTO `pro_payments` VALUES (27, 'parkwash', 63489, 23, NULL, NULL, NULL, NULL, NULL, 30000, 30000, 'cbpay', '2019071684523489', '2019-07-16 09:19:03', NULL, NULL, NULL, NULL, '2019071628413489', 30000, '2019-07-16 09:26:07', '洗车服务', '2019-07-16 09:19:03', 'a615eea1771937a7fb380bc754a1e01d', -1);
INSERT INTO `pro_payments` VALUES (28, 'parkwash', 63489, 24, NULL, NULL, NULL, NULL, NULL, 20000, 20000, 'cbpay', '2019071659313489', '2019-07-16 09:50:17', NULL, NULL, NULL, NULL, '2019071626993489', 20000, '2019-07-16 09:50:59', '洗车服务', '2019-07-16 09:50:17', 'dad6492e35ae0cd055ea8218384faebf', -1);
INSERT INTO `pro_payments` VALUES (29, 'parkwash', 60452, 25, NULL, NULL, NULL, NULL, NULL, 10000, 10000, 'cbpay', '2019071621820452', '2019-07-16 09:51:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-16 09:51:56', '47b88ee1104162a54a87e23a223d1621', 1);
INSERT INTO `pro_payments` VALUES (30, 'pwadd', 63489, NULL, 1, NULL, NULL, NULL, 'wx160956574929478e3e7b00d01072454800', 2, 20002, 'wxpaywash', '2019071633913489', '2019-07-16 09:57:05', '1525654921', 'JSAPI', '4200000331201907164943091157', '', NULL, NULL, NULL, '余额充值', '2019-07-16 09:56:56', NULL, 1);
INSERT INTO `pro_payments` VALUES (31, 'parkwash', 63489, 26, NULL, NULL, NULL, NULL, NULL, 10000, 30000, 'cbpay', '2019071688543489', '2019-07-16 09:58:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-16 09:58:24', '694f6c47c4d025e92a09d8a94b820c37', 1);
INSERT INTO `pro_payments` VALUES (32, 'pwadd', 63489, NULL, 1, NULL, NULL, NULL, 'wx16101107203742ad3c341dd21664722900', 2, 20002, 'wxpaywash', '2019071683983489', '2019-07-16 10:11:13', '1525654921', 'JSAPI', '4200000336201907167797637038', '', NULL, NULL, NULL, '余额充值', '2019-07-16 10:11:06', NULL, 1);
INSERT INTO `pro_payments` VALUES (33, 'parkwash', 63489, 27, NULL, NULL, NULL, NULL, NULL, 10000, 30000, 'cbpay', '2019071605843489', '2019-07-16 10:11:42', NULL, NULL, NULL, NULL, '2019071686313489', 10000, '2019-07-16 10:13:35', '洗车服务', '2019-07-16 10:11:42', '8fc0f98a75f3b6dedde39dcc21f76995', -1);
INSERT INTO `pro_payments` VALUES (34, 'parkwash', 63489, 28, NULL, NULL, NULL, NULL, NULL, 0, 10000, 'cbpay', '2019071690653489', '2019-07-16 10:23:38', NULL, NULL, NULL, NULL, '2019071624503489', 0, '2019-07-16 10:24:02', '洗车服务', '2019-07-16 10:23:38', '4cd1d247c10664dd4b50873a9d953db6', -1);
INSERT INTO `pro_payments` VALUES (35, 'parkwash', 63489, 29, NULL, NULL, NULL, NULL, NULL, 0, 10000, 'cbpay', '2019071621383489', '2019-07-16 10:24:53', NULL, NULL, NULL, NULL, '2019071694773489', 0, '2019-07-16 10:25:43', '洗车服务', '2019-07-16 10:24:53', '4cd1d247c10664dd4b50873a9d953db6', -1);
INSERT INTO `pro_payments` VALUES (36, 'parkwash', 69832, 30, NULL, NULL, NULL, NULL, NULL, 0, 2, 'cbpay', '2019071647079832', '2019-07-16 10:51:01', NULL, NULL, NULL, NULL, '2019071606279832', 0, '2019-07-16 10:58:07', '洗车服务', '2019-07-16 10:51:01', 'f55b0a6801b232fa709f85345c62c6fc', -1);
INSERT INTO `pro_payments` VALUES (37, 'parkwash', 69832, 31, NULL, NULL, NULL, NULL, NULL, 0, 2, 'cbpay', '2019071633649832', '2019-07-16 10:59:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-16 10:59:23', '7e948ec3ac4b65c084c1944c30059f39', 1);
INSERT INTO `pro_payments` VALUES (38, 'parkwash', 63489, 32, NULL, NULL, NULL, NULL, NULL, 0, 20000, 'cbpay', '2019071621973489', '2019-07-16 11:40:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-16 11:40:05', 'ce0d74af081c10c6c3c58b590997d07b', 1);
INSERT INTO `pro_payments` VALUES (39, 'parkwash', 63489, 33, NULL, NULL, NULL, NULL, NULL, 30000, 30000, 'cbpay', '2019071658653489', '2019-07-16 11:56:34', NULL, NULL, NULL, NULL, '2019071669913489', 30000, '2019-07-16 11:57:52', '洗车服务', '2019-07-16 11:56:34', 'acc83e2f1ab0c91b7dfb47c9cac6f0bd', -1);
INSERT INTO `pro_payments` VALUES (40, 'parkwash', 60452, 34, NULL, NULL, NULL, NULL, NULL, 1000, 1000, 'cbpay', '2019071630220452', '2019-07-16 11:58:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-16 11:58:47', '557ffa25ee961627b486e86c7c787b50', 1);
INSERT INTO `pro_payments` VALUES (41, 'parkwash', 63489, 35, NULL, NULL, NULL, NULL, NULL, 20000, 20000, 'cbpay', '2019071629653489', '2019-07-16 11:58:48', NULL, NULL, NULL, NULL, '2019071667603489', 20000, '2019-07-16 11:59:05', '洗车服务', '2019-07-16 11:58:48', 'e2dee67ba31b0ded7fdb94f7712d0570', -1);
INSERT INTO `pro_payments` VALUES (42, 'parkwash', 69832, 36, NULL, NULL, NULL, NULL, NULL, 0, 2, 'cbpay', '2019071699649832', '2019-07-16 15:24:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-16 15:24:06', '53caaa4c746cedd3552d190171b027f4', 1);
INSERT INTO `pro_payments` VALUES (43, 'parkwash', 69832, 37, NULL, NULL, NULL, NULL, NULL, 0, 2, 'cbpay', '2019071698669832', '2019-07-16 15:48:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-16 15:48:37', 'd0995c9917d2b6a2c605ccd2eef2d39f', 1);
INSERT INTO `pro_payments` VALUES (44, 'parkwash', 63489, 38, NULL, NULL, NULL, NULL, NULL, 20000, 20000, 'cbpay', '2019071716723489', '2019-07-17 14:01:40', NULL, NULL, NULL, NULL, '2019071706653489', 20000, '2019-07-17 14:02:06', '洗车服务', '2019-07-17 14:01:40', 'd5eead4d16174bd7a68b2f56b4beaa34', -1);
INSERT INTO `pro_payments` VALUES (45, 'parkwash', 63489, 39, NULL, NULL, NULL, NULL, NULL, 20000, 20000, 'cbpay', '2019071706203489', '2019-07-17 14:02:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-17 14:02:27', '0b0d5778bc9060cec243c11f291e8943', 1);
INSERT INTO `pro_payments` VALUES (46, 'parkwash', 63489, 40, NULL, NULL, NULL, NULL, NULL, 20000, 20000, 'cbpay', '2019071715183489', '2019-07-17 14:48:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-17 14:48:12', '4ba7bf0e896f9109e5971fdac1ee587a', 1);
INSERT INTO `pro_payments` VALUES (47, 'parkwash', 63489, 41, NULL, NULL, NULL, NULL, NULL, 8000, 8000, 'cbpay', '2019071739613489', '2019-07-17 15:47:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-17 15:47:39', 'ff783b3f811088a4809878bc1f732bb8', 1);
INSERT INTO `pro_payments` VALUES (48, 'parkwash', 64077, 42, NULL, NULL, NULL, NULL, NULL, 20, 20, 'cbpay', '2019071759204077', '2019-07-17 15:51:46', NULL, NULL, NULL, NULL, '2019071783494077', 20, '2019-07-17 15:51:58', '洗车服务', '2019-07-17 15:51:46', 'b394f30568f449341002e7458b5d3cd1', -1);
INSERT INTO `pro_payments` VALUES (49, 'parkwash', 64077, 43, NULL, NULL, NULL, NULL, NULL, 2000, 2000, 'cbpay', '2019071702604077', '2019-07-17 15:52:16', NULL, NULL, NULL, NULL, '2019071745484077', 2000, '2019-07-17 15:52:26', '洗车服务', '2019-07-17 15:52:16', '0d9380b5c99f2159c93f6a08ac0a7f33', -1);
INSERT INTO `pro_payments` VALUES (50, 'parkwash', 64077, 44, NULL, NULL, NULL, NULL, NULL, 2, 2, 'cbpay', '2019071707324077', '2019-07-17 15:52:47', NULL, NULL, NULL, NULL, '2019071792154077', 2, '2019-07-17 15:53:14', '洗车服务', '2019-07-17 15:52:47', 'd1f3fa0588077095679521d9877e445a', -1);
INSERT INTO `pro_payments` VALUES (51, 'parkwash', 64077, 45, NULL, NULL, NULL, NULL, NULL, 1000, 1000, 'cbpay', '2019071776754077', '2019-07-17 15:54:13', NULL, NULL, NULL, NULL, '2019071716954077', 1000, '2019-07-17 15:54:51', '洗车服务', '2019-07-17 15:54:13', '8ba2d692b8723a5fde5cb1fd7a104f94', -1);
INSERT INTO `pro_payments` VALUES (52, 'parkwash', 64077, 46, NULL, NULL, NULL, NULL, NULL, 1000, 1000, 'cbpay', '2019071794474077', '2019-07-17 15:55:02', NULL, NULL, NULL, NULL, '2019071747974077', 1000, '2019-07-17 15:56:41', '洗车服务', '2019-07-17 15:55:02', '0ede38de024eba9b616009f1886a4b3a', -1);
INSERT INTO `pro_payments` VALUES (53, 'parkwash', 64077, 47, NULL, NULL, NULL, NULL, NULL, 2, 2, 'cbpay', '2019071751804077', '2019-07-17 15:56:57', NULL, NULL, NULL, NULL, '2019071792704077', 2, '2019-07-17 15:57:12', '洗车服务', '2019-07-17 15:56:57', 'd1f3fa0588077095679521d9877e445a', -1);
INSERT INTO `pro_payments` VALUES (54, 'parkwash', 64077, 48, NULL, NULL, NULL, NULL, NULL, 2, 2, 'cbpay', '2019071756094077', '2019-07-17 16:00:52', NULL, NULL, NULL, NULL, '2019071752744077', 2, '2019-07-17 16:01:46', '洗车服务', '2019-07-17 16:00:52', 'bc55656d9de9eaa9fabc2804f927856f', -1);
INSERT INTO `pro_payments` VALUES (55, 'parkwash', 64077, 49, NULL, NULL, NULL, NULL, NULL, 2, 2, 'cbpay', '2019071748804077', '2019-07-17 16:01:59', NULL, NULL, NULL, NULL, '2019071725234077', 2, '2019-07-17 16:02:07', '洗车服务', '2019-07-17 16:01:59', 'bc55656d9de9eaa9fabc2804f927856f', -1);
INSERT INTO `pro_payments` VALUES (56, 'parkwash', 64077, 50, NULL, NULL, NULL, NULL, NULL, 1000, 1000, 'cbpay', '2019071786174077', '2019-07-17 16:02:42', NULL, NULL, NULL, NULL, '2019071739984077', 1000, '2019-07-17 16:07:03', '洗车服务', '2019-07-17 16:02:42', '1ace2e0ee634bb4ae4d9a727bb092f89', -1);
INSERT INTO `pro_payments` VALUES (57, 'parkwash', 64077, 51, NULL, NULL, NULL, NULL, NULL, 10, 10, 'cbpay', '2019071729514077', '2019-07-17 16:07:16', NULL, NULL, NULL, NULL, '2019071713754077', 10, '2019-07-17 16:10:46', '洗车服务', '2019-07-17 16:07:16', '25c1a9d8a6f2b1387dc34f527e4ba647', -1);
INSERT INTO `pro_payments` VALUES (58, 'parkwash', 64077, 52, NULL, NULL, NULL, NULL, NULL, 2, 2, 'cbpay', '2019071791864077', '2019-07-17 16:11:06', NULL, NULL, NULL, NULL, '2019071777394077', 2, '2019-07-17 16:12:54', '洗车服务', '2019-07-17 16:11:06', 'c549ed6b74b72758133d86169f4cc853', -1);
INSERT INTO `pro_payments` VALUES (59, 'parkwash', 64077, 53, NULL, NULL, NULL, NULL, NULL, 2, 2, 'cbpay', '2019071767074077', '2019-07-17 16:20:06', NULL, NULL, NULL, NULL, '2019071734074077', 2, '2019-07-17 16:20:22', '洗车服务', '2019-07-17 16:20:06', 'c549ed6b74b72758133d86169f4cc853', -1);
INSERT INTO `pro_payments` VALUES (60, 'parkwash', 64077, 54, NULL, NULL, NULL, NULL, NULL, 1000, 1000, 'cbpay', '2019071736814077', '2019-07-17 16:23:37', NULL, NULL, NULL, NULL, '2019071722504077', 1000, '2019-07-17 16:23:56', '洗车服务', '2019-07-17 16:23:37', '4bd77e0a1b30df7d65d437f38511e814', -1);
INSERT INTO `pro_payments` VALUES (61, 'parkwash', 64077, 55, NULL, NULL, NULL, NULL, NULL, 1000, 1000, 'cbpay', '2019071728304077', '2019-07-17 16:25:18', NULL, NULL, NULL, NULL, '2019071728674077', 1000, '2019-07-17 16:26:08', '洗车服务', '2019-07-17 16:25:18', '7a60bfc527b5d519302b1da7b228ca18', -1);
INSERT INTO `pro_payments` VALUES (62, 'parkwash', 64077, 56, NULL, NULL, NULL, NULL, NULL, 1000, 1000, 'cbpay', '2019071769954077', '2019-07-17 16:27:38', NULL, NULL, NULL, NULL, '2019071779714077', 1000, '2019-07-17 16:27:57', '洗车服务', '2019-07-17 16:27:38', '8ba2d692b8723a5fde5cb1fd7a104f94', -1);
INSERT INTO `pro_payments` VALUES (63, 'parkwash', 64077, 57, NULL, NULL, NULL, NULL, NULL, 1000, 1000, 'cbpay', '2019071762144077', '2019-07-17 16:28:12', NULL, NULL, NULL, NULL, '2019071757554077', 1000, '2019-07-17 16:32:11', '洗车服务', '2019-07-17 16:28:12', '8ba2d692b8723a5fde5cb1fd7a104f94', -1);
INSERT INTO `pro_payments` VALUES (64, 'parkwash', 64077, 58, NULL, NULL, NULL, NULL, NULL, 1000, 1000, 'cbpay', '2019071754964077', '2019-07-17 16:32:25', NULL, NULL, NULL, NULL, '2019071726874077', 1000, '2019-07-17 16:32:38', '洗车服务', '2019-07-17 16:32:25', '8ba2d692b8723a5fde5cb1fd7a104f94', -1);
INSERT INTO `pro_payments` VALUES (65, 'parkwash', 64077, 59, NULL, NULL, NULL, NULL, NULL, 1000, 1000, 'cbpay', '2019071768294077', '2019-07-17 16:32:49', NULL, NULL, NULL, NULL, '2019071728204077', 1000, '2019-07-17 16:33:54', '洗车服务', '2019-07-17 16:32:49', '7a60bfc527b5d519302b1da7b228ca18', -1);
INSERT INTO `pro_payments` VALUES (66, 'parkwash', 64077, 60, NULL, NULL, NULL, NULL, NULL, 1000, 1000, 'cbpay', '2019071720364077', '2019-07-17 16:34:09', NULL, NULL, NULL, NULL, '2019071767904077', 1000, '2019-07-17 16:34:59', '洗车服务', '2019-07-17 16:34:09', '7a60bfc527b5d519302b1da7b228ca18', -1);
INSERT INTO `pro_payments` VALUES (67, 'parkwash', 64077, 61, NULL, NULL, NULL, NULL, NULL, 1000, 1000, 'cbpay', '2019071792754077', '2019-07-17 16:36:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-17 16:36:46', '7a60bfc527b5d519302b1da7b228ca18', 1);
INSERT INTO `pro_payments` VALUES (68, 'parkwash', 63489, 62, NULL, NULL, NULL, NULL, NULL, 1000, 1000, 'cbpay', '2019071715233489', '2019-07-17 16:52:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-17 16:52:57', 'bc1583a2926b3edc68f3f61cdeca7f74', 1);
INSERT INTO `pro_payments` VALUES (69, 'parkwash', 63489, 63, NULL, NULL, NULL, NULL, NULL, 1000, 1000, 'cbpay', '2019071792753489', '2019-07-17 16:56:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-17 16:56:34', '2e282b215897c49454cd10e72a02b917', 1);
INSERT INTO `pro_payments` VALUES (70, 'parkwash', 63489, 64, NULL, NULL, NULL, NULL, NULL, 1000, 1000, 'cbpay', '2019071737003489', '2019-07-17 17:00:11', NULL, NULL, NULL, NULL, '2019071761793489', 1000, '2019-07-17 17:05:21', '洗车服务', '2019-07-17 17:00:11', '31c9969fa9ecb8b6b512425c8fb3805e', -1);
INSERT INTO `pro_payments` VALUES (71, 'parkwash', 63489, 65, NULL, NULL, NULL, NULL, NULL, 1000, 1000, 'cbpay', '2019071715403489', '2019-07-17 17:05:40', NULL, NULL, NULL, NULL, '2019071775513489', 1000, '2019-07-17 17:06:44', '洗车服务', '2019-07-17 17:05:40', '17e31051e3805d102afb0e898eead0e2', -1);
INSERT INTO `pro_payments` VALUES (72, 'parkwash', 63489, 66, NULL, NULL, NULL, NULL, NULL, 1000, 1000, 'cbpay', '2019071771133489', '2019-07-17 17:06:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-17 17:06:55', 'c9d2278468714ea143d2e1f60a93c5da', 1);
INSERT INTO `pro_payments` VALUES (73, 'parkwash', 63489, 67, NULL, NULL, NULL, NULL, NULL, 1000, 1000, 'cbpay', '2019071792353489', '2019-07-17 17:10:18', NULL, NULL, NULL, NULL, '2019071708263489', 1000, '2019-07-17 17:22:08', '洗车服务', '2019-07-17 17:10:18', '31c9969fa9ecb8b6b512425c8fb3805e', -1);
INSERT INTO `pro_payments` VALUES (74, 'parkwash', 63489, 68, NULL, NULL, NULL, NULL, NULL, 2000, 2000, 'cbpay', '2019071759663489', '2019-07-17 17:22:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-17 17:22:35', '7d9249b60cf2421a7f0c4afac442748e', 1);
INSERT INTO `pro_payments` VALUES (75, 'parkwash', 64077, 69, NULL, NULL, NULL, NULL, NULL, 1000, 1000, 'cbpay', '2019071779544077', '2019-07-17 17:25:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-17 17:25:04', '30839c8496cb9fa469833143e4e406f6', 1);
INSERT INTO `pro_payments` VALUES (76, 'parkwash', 63489, 70, NULL, NULL, NULL, NULL, NULL, 5000, 5000, 'cbpay', '2019071742473489', '2019-07-17 17:41:18', NULL, NULL, NULL, NULL, '2019071775403489', 5000, '2019-07-17 17:45:26', '洗车服务', '2019-07-17 17:41:22', '93aaa37a59e3fe78d25dc32b426954bd', -1);
INSERT INTO `pro_payments` VALUES (77, 'parkwash', 63489, 71, NULL, NULL, NULL, NULL, NULL, 5000, 5000, 'cbpay', '2019071788113489', '2019-07-17 17:45:53', NULL, NULL, NULL, NULL, '2019071743663489', 5000, '2019-07-17 17:46:30', '洗车服务', '2019-07-17 17:45:53', '39cbbc0058de10d616e2cbc377aa1b00', -1);
INSERT INTO `pro_payments` VALUES (78, 'parkwash', 63489, 72, NULL, NULL, NULL, NULL, NULL, 5000, 5000, 'cbpay', '2019071796943489', '2019-07-17 17:47:05', NULL, NULL, NULL, NULL, '2019071704693489', 5000, '2019-07-17 17:47:57', '洗车服务', '2019-07-17 17:47:05', 'e30b141e865fb0aa4e928007e6a91157', -1);
INSERT INTO `pro_payments` VALUES (79, 'parkwash', 63489, 73, NULL, NULL, NULL, NULL, NULL, 2000, 2000, 'cbpay', '2019071729203489', '2019-07-17 17:48:23', NULL, NULL, NULL, NULL, '2019071796443489', 2000, '2019-07-17 17:49:12', '洗车服务', '2019-07-17 17:48:23', '3d57de4aeb06e5fc5da8fc7756631aff', -1);
INSERT INTO `pro_payments` VALUES (80, 'parkwash', 63489, 74, NULL, NULL, NULL, NULL, NULL, 1000, 1000, 'cbpay', '2019071742983489', '2019-07-17 17:49:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-17 17:49:29', 'c7f32bb5f547e882166c7783cf535508', 1);
INSERT INTO `pro_payments` VALUES (81, 'pwadd', 63489, NULL, 2, NULL, NULL, NULL, 'wx17232712181752fabf87dcf81916137500', 1, 10001, 'wxpaywash', '2019071745453489', '2019-07-17 23:27:19', '1525654921', 'JSAPI', '4200000373201907175426449862', '', NULL, NULL, NULL, '余额充值', '2019-07-17 23:27:11', NULL, 1);
INSERT INTO `pro_payments` VALUES (82, 'parkwash', 60452, 75, NULL, NULL, NULL, NULL, NULL, 2, 2, 'cbpay', '2019071814420452', '2019-07-18 14:12:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-18 14:12:54', '58a8d8470a407ee747f02a19fbe35aa0', 1);
INSERT INTO `pro_payments` VALUES (83, 'parkwash', 60452, 76, NULL, NULL, NULL, NULL, NULL, 2, 2, 'cbpay', '2019071856850452', '2019-07-18 14:13:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-18 14:13:55', '58a8d8470a407ee747f02a19fbe35aa0', 1);
INSERT INTO `pro_payments` VALUES (84, 'parkwash', 60452, 77, NULL, NULL, NULL, NULL, NULL, 2, 2, 'cbpay', '2019071804450452', '2019-07-18 14:16:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-18 14:16:47', '4e3a34d13cb2031eedf8b9967a9ceb68', 1);
INSERT INTO `pro_payments` VALUES (85, 'parkwash', 60452, 78, NULL, NULL, NULL, NULL, NULL, 2, 2, 'cbpay', '2019071892600452', '2019-07-18 14:17:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-18 14:17:36', '978ad996e954706b612918fa5979acee', 1);
INSERT INTO `pro_payments` VALUES (86, 'parkwash', 63489, 79, NULL, NULL, NULL, NULL, NULL, 0, 1000, 'cbpay', '2019071900093489', '2019-07-19 10:11:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-19 10:11:02', '7609e95861dcd548b8d048323a55f9d8', 1);
INSERT INTO `pro_payments` VALUES (87, 'parkwash', 63489, 80, NULL, NULL, NULL, NULL, NULL, 0, 1000, 'cbpay', '2019071910513489', '2019-07-19 11:04:18', NULL, NULL, NULL, NULL, '2019071917933489', 0, '2019-07-19 11:12:49', '洗车服务', '2019-07-19 11:04:18', '543d28d22f7f9f75d4f7d8917e746d58', -1);
INSERT INTO `pro_payments` VALUES (88, 'parkwash', 63489, 81, NULL, NULL, NULL, NULL, NULL, 0, 1000, 'cbpay', '2019071948113489', '2019-07-19 11:13:03', NULL, NULL, NULL, NULL, '2019071932503489', 0, '2019-07-19 11:13:13', '洗车服务', '2019-07-19 11:13:03', '2e916951657af552ddf5787ad1be7c9d', -1);
INSERT INTO `pro_payments` VALUES (89, 'parkwash', 63489, 82, NULL, NULL, NULL, NULL, NULL, 0, 10, 'cbpay', '2019071925453489', '2019-07-19 11:13:40', NULL, NULL, NULL, NULL, '2019071979133489', 0, '2019-07-19 11:13:48', '洗车服务', '2019-07-19 11:13:40', 'bea8d094102eb71e11bf4d2b5a19d442', -1);
INSERT INTO `pro_payments` VALUES (90, 'parkwash', 63489, 83, NULL, NULL, NULL, NULL, NULL, 0, 1000, 'cbpay', '2019071920203489', '2019-07-19 11:14:03', NULL, NULL, NULL, NULL, '2019071922353489', 0, '2019-07-19 11:15:56', '洗车服务', '2019-07-19 11:14:03', '2e916951657af552ddf5787ad1be7c9d', -1);
INSERT INTO `pro_payments` VALUES (91, 'parkwash', 63489, 84, NULL, NULL, NULL, NULL, NULL, 0, 1000, 'cbpay', '2019071926583489', '2019-07-19 11:16:06', NULL, NULL, NULL, NULL, '2019071967033489', 0, '2019-07-19 11:17:48', '洗车服务', '2019-07-19 11:16:06', '2e916951657af552ddf5787ad1be7c9d', -1);
INSERT INTO `pro_payments` VALUES (92, 'parkwash', 63489, 85, NULL, NULL, NULL, NULL, NULL, 0, 1000, 'cbpay', '2019071924273489', '2019-07-19 11:18:00', NULL, NULL, NULL, NULL, '2019071920763489', 0, '2019-07-19 11:18:40', '洗车服务', '2019-07-19 11:18:00', '2e916951657af552ddf5787ad1be7c9d', -1);
INSERT INTO `pro_payments` VALUES (93, 'parkwash', 60452, 86, NULL, NULL, NULL, NULL, NULL, 1000, 1000, 'cbpay', '2019071986290452', '2019-07-19 11:19:06', NULL, NULL, NULL, NULL, '2019071970060452', 1000, '2019-07-19 11:58:06', '洗车服务', '2019-07-19 11:19:06', '67df873876b964c6fda154082b8f1565', -1);
INSERT INTO `pro_payments` VALUES (94, 'parkwash', 63489, 87, NULL, NULL, NULL, NULL, NULL, 0, 1000, 'cbpay', '2019071962543489', '2019-07-19 11:26:10', NULL, NULL, NULL, NULL, '2019071973633489', 0, '2019-07-19 11:43:19', '洗车服务', '2019-07-19 11:26:10', '8dc7e66cf936fcb26190516a086b599e', -1);
INSERT INTO `pro_payments` VALUES (95, 'parkwash', 63489, 88, NULL, NULL, NULL, NULL, NULL, 0, 1000, 'cbpay', '2019071966533489', '2019-07-19 11:43:33', NULL, NULL, NULL, NULL, '2019071991123489', 0, '2019-07-19 11:43:58', '洗车服务', '2019-07-19 11:43:33', '303a075cf6b0268ee956f814fd926107', -1);
INSERT INTO `pro_payments` VALUES (96, 'parkwash', 63489, 89, NULL, NULL, NULL, NULL, NULL, 0, 1000, 'cbpay', '2019071917813489', '2019-07-19 11:44:14', NULL, NULL, NULL, NULL, '2019071935063489', 0, '2019-07-19 11:45:21', '洗车服务', '2019-07-19 11:44:14', '303a075cf6b0268ee956f814fd926107', -1);
INSERT INTO `pro_payments` VALUES (97, 'parkwash', 63489, 90, NULL, NULL, NULL, NULL, NULL, 0, 2, 'cbpay', '2019071963803489', '2019-07-19 11:45:42', NULL, NULL, NULL, NULL, '2019071999333489', 0, '2019-07-19 11:47:08', '洗车服务', '2019-07-19 11:45:42', 'e970971330c432c120aadd15c5e836a1', -1);
INSERT INTO `pro_payments` VALUES (98, 'parkwash', 63489, 91, NULL, NULL, NULL, NULL, NULL, 0, 2, 'cbpay', '2019071911313489', '2019-07-19 11:47:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-19 11:47:24', 'cdb54a9864271dc38eebbf50e4b202ef', 1);
INSERT INTO `pro_payments` VALUES (99, 'parkwash', 63489, 92, NULL, NULL, NULL, NULL, NULL, 0, 2, 'cbpay', '2019071946003489', '2019-07-19 11:48:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-19 11:48:21', '4857b8ad0a46e6c3706065411067c326', 1);
INSERT INTO `pro_payments` VALUES (100, 'parkwash', 63489, 93, NULL, NULL, NULL, NULL, NULL, 0, 2, 'cbpay', '2019071915513489', '2019-07-19 11:48:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-19 11:48:48', '1ba3a561ddf2c2eac47a68a98bcef2e5', 1);
INSERT INTO `pro_payments` VALUES (101, 'parkwash', 63489, 94, NULL, NULL, NULL, NULL, NULL, 0, 2000, 'cbpay', '2019071986493489', '2019-07-19 11:55:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-19 11:55:50', '82ead7a9f0c13ebed6a39d77ffff56ea', 1);
INSERT INTO `pro_payments` VALUES (102, 'parkwash', 60452, 95, NULL, NULL, NULL, NULL, NULL, 2, 2, 'cbpay', '2019071914340452', '2019-07-19 12:02:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-19 12:02:56', '80e5eac1f246cb7cb1670f7bb8867d2a', 1);
INSERT INTO `pro_payments` VALUES (103, 'parkwash', 60452, 96, NULL, NULL, NULL, NULL, NULL, 2, 2, 'cbpay', '2019071986100452', '2019-07-19 13:54:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-19 13:54:32', '03c88a757a932910c73a4a69d8b66c2b', 1);
INSERT INTO `pro_payments` VALUES (104, 'parkwash', 60452, 97, NULL, NULL, NULL, NULL, NULL, 2, 2, 'cbpay', '2019071961580452', '2019-07-19 13:56:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-19 13:56:18', 'dc110887cab898761d6fdf3b2d20e348', 1);
INSERT INTO `pro_payments` VALUES (105, 'parkwash', 69832, 98, NULL, NULL, NULL, NULL, NULL, 0, 5000, 'cbpay', '2019071959129832', '2019-07-19 13:56:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-19 13:56:36', '3a74e95e719d91e3b4d904b5f99b3d79', 1);
INSERT INTO `pro_payments` VALUES (106, 'parkwash', 60452, 99, NULL, NULL, NULL, NULL, NULL, 2, 2, 'cbpay', '2019071939570452', '2019-07-19 13:58:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-19 13:58:21', '525e54a3607777f136cce707dc79535a', 1);
INSERT INTO `pro_payments` VALUES (107, 'parkwash', 60452, 100, NULL, NULL, NULL, NULL, NULL, 2, 2, 'cbpay', '2019071910600452', '2019-07-19 14:07:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-19 14:07:47', '84869df304935fc56df00427a34b845d', 1);
INSERT INTO `pro_payments` VALUES (108, 'parkwash', 60452, 101, NULL, NULL, NULL, NULL, NULL, 2, 2, 'cbpay', '2019071981220452', '2019-07-19 14:09:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-19 14:09:33', '2fcfc3f99539c02a3cad21e42a96e42f', 1);
INSERT INTO `pro_payments` VALUES (109, 'parkwash', 60452, 102, NULL, NULL, NULL, NULL, NULL, 2, 2, 'cbpay', '2019071907820452', '2019-07-19 14:16:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-19 14:16:48', '67d204b60e8c575eec9a7030305509f3', 1);
INSERT INTO `pro_payments` VALUES (110, 'parkwash', 63489, 103, NULL, NULL, NULL, NULL, NULL, 0, 2000, 'cbpay', '2019071974103489', '2019-07-19 14:22:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-19 14:22:47', '73f97e515bc0eb1de5bb69071944de6c', 1);
INSERT INTO `pro_payments` VALUES (111, 'parkwash', 60452, 104, NULL, NULL, NULL, NULL, NULL, 2, 2, 'cbpay', '2019071989380452', '2019-07-19 14:23:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-19 14:23:02', '67d204b60e8c575eec9a7030305509f3', 1);
INSERT INTO `pro_payments` VALUES (112, 'parkwash', 69832, 105, NULL, NULL, NULL, NULL, NULL, 0, 2000, 'cbpay', '2019071984759832', '2019-07-19 14:25:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-19 14:25:46', 'febdc31f6d36755fe2a28006f2365d4b', 1);
INSERT INTO `pro_payments` VALUES (113, 'parkwash', 60452, 106, NULL, NULL, NULL, NULL, NULL, 2, 2, 'cbpay', '2019071964250452', '2019-07-19 14:26:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-19 14:26:10', 'd0f091d54c44698da2e54c8a15b09c44', 1);
INSERT INTO `pro_payments` VALUES (114, 'parkwash', 60452, 107, NULL, NULL, NULL, NULL, NULL, 2, 2, 'cbpay', '2019071987740452', '2019-07-19 14:29:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-19 14:29:01', '254a49ca817deea0262520c7df2ad6b9', 1);
INSERT INTO `pro_payments` VALUES (115, 'parkwash', 63489, 108, NULL, NULL, NULL, NULL, 'wx19144436864845047c054c6c1107681000', 1, 1, 'wxpaywash', '2019071992373489', '2019-07-19 14:44:45', '1525654921', 'JSAPI', '4200000373201907192399429527', '', NULL, NULL, NULL, '洗车服务', '2019-07-19 14:44:36', '4256ef5c640c4559d69e8cd83314671a', 1);
INSERT INTO `pro_payments` VALUES (116, 'parkwash', 63489, 109, NULL, NULL, NULL, NULL, NULL, 0, 1000, 'cbpay', '2019071922883489', '2019-07-19 14:53:01', NULL, NULL, NULL, NULL, '2019071913353489', 0, '2019-07-19 14:53:40', '洗车服务', '2019-07-19 14:53:01', '1824b87775843c5e17706431bc4e6e94', -1);
INSERT INTO `pro_payments` VALUES (117, 'parkwash', 63489, 110, NULL, NULL, NULL, NULL, NULL, 0, 1000, 'cbpay', '2019071977413489', '2019-07-19 14:53:55', NULL, NULL, NULL, NULL, '2019071902733489', 0, '2019-07-19 14:54:54', '洗车服务', '2019-07-19 14:53:55', 'cf912fb5d2791b583762df47b8908f17', -1);
INSERT INTO `pro_payments` VALUES (118, 'parkwash', 63489, 111, NULL, NULL, NULL, NULL, NULL, 0, 1000, 'cbpay', '2019071922453489', '2019-07-19 14:55:40', NULL, NULL, NULL, NULL, '2019071934803489', 0, '2019-07-19 14:56:05', '洗车服务', '2019-07-19 14:55:40', 'ceeeadc21c6b7e266de046065d41cfa9', -1);
INSERT INTO `pro_payments` VALUES (119, 'parkwash', 63489, 112, NULL, NULL, NULL, NULL, NULL, 0, 1000, 'cbpay', '2019071945943489', '2019-07-19 14:56:34', NULL, NULL, NULL, NULL, '2019071988833489', 0, '2019-07-19 14:57:33', '洗车服务', '2019-07-19 14:56:34', 'ceeeadc21c6b7e266de046065d41cfa9', -1);
INSERT INTO `pro_payments` VALUES (120, 'parkwash', 63489, 113, NULL, NULL, NULL, NULL, NULL, 0, 1000, 'cbpay', '2019071970133489', '2019-07-19 14:58:01', NULL, NULL, NULL, NULL, '2019071998613489', 0, '2019-07-19 14:58:44', '洗车服务', '2019-07-19 14:58:01', 'cf912fb5d2791b583762df47b8908f17', -1);
INSERT INTO `pro_payments` VALUES (121, 'parkwash', 63489, 114, NULL, NULL, NULL, NULL, NULL, 0, 1000, 'cbpay', '2019071975753489', '2019-07-19 14:59:26', NULL, NULL, NULL, NULL, '2019071993483489', 0, '2019-07-19 14:59:47', '洗车服务', '2019-07-19 14:59:26', 'cf912fb5d2791b583762df47b8908f17', -1);
INSERT INTO `pro_payments` VALUES (122, 'parkwash', 63489, 115, NULL, NULL, NULL, NULL, NULL, 0, 1000, 'cbpay', '2019071905013489', '2019-07-19 14:59:58', NULL, NULL, NULL, NULL, '2019071920903489', 0, '2019-07-19 15:00:38', '洗车服务', '2019-07-19 14:59:58', 'fd1b34be77974cc99b6957ddb17dec36', -1);
INSERT INTO `pro_payments` VALUES (123, 'parkwash', 63489, 116, NULL, NULL, NULL, NULL, NULL, 0, 1, 'cbpay', '2019071935833489', '2019-07-19 15:01:25', NULL, NULL, NULL, NULL, '2019071901553489', 0, '2019-07-19 15:07:02', '洗车服务', '2019-07-19 15:01:25', '024be5e86c6b00af116ef1c24faa6fe3', -1);
INSERT INTO `pro_payments` VALUES (124, 'parkwash', 63489, 117, NULL, NULL, NULL, NULL, NULL, 6, 5000, 'cbpay', '2019071925633489', '2019-07-19 15:31:14', NULL, NULL, NULL, NULL, '2019071900813489', 6, '2019-07-19 15:31:32', '洗车服务', '2019-07-19 15:31:14', '703488124d0db2ae63fcd1b88f684ec2', -1);
INSERT INTO `pro_payments` VALUES (125, 'parkwash', 63489, 118, NULL, NULL, NULL, NULL, NULL, 0, 4000, 'cbpay', '2019071943023489', '2019-07-19 15:31:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-19 15:31:55', '3ff1dffe444c0024954c21ae38c40ab8', 1);
INSERT INTO `pro_payments` VALUES (126, 'parkwash', 63489, 119, NULL, NULL, NULL, NULL, NULL, 6, 1000, 'cbpay', '2019071964073489', '2019-07-19 15:40:33', NULL, NULL, NULL, NULL, '2019071966543489', 6, '2019-07-19 15:45:49', '洗车服务', '2019-07-19 15:40:33', '22492b1c27e0bbdaf2fa3265cc4c74e9', -1);
INSERT INTO `pro_payments` VALUES (127, 'parkwash', 63489, 120, NULL, NULL, NULL, NULL, NULL, 6, 1000, 'cbpay', '2019071963333489', '2019-07-19 15:46:08', NULL, NULL, NULL, NULL, '2019071926173489', 6, '2019-07-19 15:46:52', '洗车服务', '2019-07-19 15:46:08', '4f7c48be53021679976428498473a525', -1);
INSERT INTO `pro_payments` VALUES (128, 'parkwash', 63489, 121, NULL, NULL, NULL, NULL, NULL, 6, 1000, 'cbpay', '2019071961723489', '2019-07-19 15:47:11', NULL, NULL, NULL, NULL, '2019071955303489', 6, '2019-07-19 15:47:37', '洗车服务', '2019-07-19 15:47:11', 'f671884699358aa6bae6d1d44204f062', -1);
INSERT INTO `pro_payments` VALUES (129, 'parkwash', 63489, 122, NULL, NULL, NULL, NULL, NULL, 6, 1000, 'cbpay', '2019071989133489', '2019-07-19 15:47:56', NULL, NULL, NULL, NULL, '2019071969843489', 6, '2019-07-19 15:48:26', '洗车服务', '2019-07-19 15:47:56', '29482f9dd5186da1b9b40d76da5a043f', -1);
INSERT INTO `pro_payments` VALUES (130, 'parkwash', 63489, 123, NULL, NULL, NULL, NULL, NULL, 0, 2, 'cbpay', '2019071936423489', '2019-07-19 15:48:51', NULL, NULL, NULL, NULL, '2019071985423489', 0, '2019-07-19 15:50:12', '洗车服务', '2019-07-19 15:48:51', 'aeedf3ee791bb21b88a43b497a623049', -1);
INSERT INTO `pro_payments` VALUES (131, 'parkwash', 63489, 124, NULL, NULL, NULL, NULL, NULL, 6, 1000, 'cbpay', '2019071999733489', '2019-07-19 15:50:32', NULL, NULL, NULL, NULL, '2019071953983489', 6, '2019-07-19 15:50:45', '洗车服务', '2019-07-19 15:50:32', '29482f9dd5186da1b9b40d76da5a043f', -1);
INSERT INTO `pro_payments` VALUES (132, 'parkwash', 63489, 125, NULL, NULL, NULL, NULL, NULL, 6, 1000, 'cbpay', '2019071972063489', '2019-07-19 15:51:00', NULL, NULL, NULL, NULL, '2019071943633489', 6, '2019-07-19 15:51:24', '洗车服务', '2019-07-19 15:51:00', '29482f9dd5186da1b9b40d76da5a043f', -1);
INSERT INTO `pro_payments` VALUES (133, 'parkwash', 63489, 126, NULL, NULL, NULL, NULL, NULL, 6, 1000, 'cbpay', '2019071934933489', '2019-07-19 15:51:37', NULL, NULL, NULL, NULL, '2019071946103489', 6, '2019-07-19 15:51:55', '洗车服务', '2019-07-19 15:51:37', '6f42d3944504a2abc7ed22739ddfef7a', -1);
INSERT INTO `pro_payments` VALUES (134, 'parkwash', 63489, 127, NULL, NULL, NULL, NULL, NULL, 6, 1000, 'cbpay', '2019071982343489', '2019-07-19 15:52:07', NULL, NULL, NULL, NULL, '2019071984653489', 6, '2019-07-19 15:52:27', '洗车服务', '2019-07-19 15:52:07', '29482f9dd5186da1b9b40d76da5a043f', -1);
INSERT INTO `pro_payments` VALUES (135, 'parkwash', 63489, 128, NULL, NULL, NULL, NULL, NULL, 6, 1000, 'cbpay', '2019071927173489', '2019-07-19 15:52:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-19 15:52:48', '67a35eedb0126a860498fde42e7c0dce', 1);
INSERT INTO `pro_payments` VALUES (136, 'parkwash', 48981, 129, NULL, NULL, NULL, NULL, NULL, 2, 2, 'cbpay', '2019071958408981', '2019-07-19 15:56:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-19 15:56:29', '08bbf2f120c72aff3dc12d1ae7bd482e', 1);
INSERT INTO `pro_payments` VALUES (137, 'parkwash', 63489, 130, NULL, NULL, NULL, NULL, NULL, 1000, 1000, 'cbpay', '2019071936343489', '2019-07-19 16:06:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-19 16:06:18', '981f02fd40eeea27e38605df75126d2b', 1);
INSERT INTO `pro_payments` VALUES (138, 'pwadd', 63489, NULL, 2, NULL, NULL, NULL, 'wx20154417963131a0e0ca0ee31513099800', 1, 10001, 'wxpaywash', '2019072028193489', '2019-07-20 15:44:48', '1525654921', 'JSAPI', '4200000384201907201640301529', '', NULL, NULL, NULL, '余额充值', '2019-07-20 15:44:17', NULL, 1);
INSERT INTO `pro_payments` VALUES (139, 'parkwash', 63489, 131, NULL, NULL, NULL, NULL, NULL, 0, 1000, 'cbpay', '2019072025813489', '2019-07-20 15:45:33', NULL, NULL, NULL, NULL, '2019072029643489', 0, '2019-07-20 15:51:38', '洗车服务', '2019-07-20 15:45:33', 'ba04f4904612d6cb65de99912f2bae53', -1);
INSERT INTO `pro_payments` VALUES (140, 'parkwash', 63489, 132, NULL, NULL, NULL, NULL, NULL, 0, 2000, 'cbpay', '2019072089743489', '2019-07-20 15:56:41', NULL, NULL, NULL, NULL, '2019072017723489', 0, '2019-07-20 15:57:35', '洗车服务', '2019-07-20 15:56:41', 'ab4f8c35ccc228dfa86fb8d62a3fe267', -1);
INSERT INTO `pro_payments` VALUES (141, 'parkwash', 63489, 133, NULL, NULL, NULL, NULL, NULL, 0, 2000, 'cbpay', '2019072077803489', '2019-07-20 16:04:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-20 16:04:36', '519bf546edc1297561f1adcd66304f00', 1);
INSERT INTO `pro_payments` VALUES (142, 'parkwash', 63489, 134, NULL, NULL, NULL, NULL, NULL, 0, 1000, 'cbpay', '2019072052783489', '2019-07-20 17:34:36', NULL, NULL, NULL, NULL, '2019072068313489', 0, '2019-07-20 17:38:25', '洗车服务', '2019-07-20 17:34:36', '39d835121f51de2f04db98358533158b', -1);
INSERT INTO `pro_payments` VALUES (143, 'parkwash', 63489, 135, NULL, NULL, NULL, NULL, NULL, 0, 1000, 'cbpay', '2019072092063489', '2019-07-20 17:38:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-20 17:38:41', '2688523a15377c8e339c53a15c4cd799', 1);
INSERT INTO `pro_payments` VALUES (144, 'parkwash', 60452, 136, NULL, NULL, NULL, NULL, NULL, 2, 2, 'cbpay', '2019072294040452', '2019-07-22 10:08:31', NULL, NULL, NULL, NULL, '2019072214860452', 2, '2019-07-22 10:20:16', '洗车服务', '2019-07-22 10:08:31', 'd96a0988abf3f41d43faee65371aaeb8', -1);
INSERT INTO `pro_payments` VALUES (145, 'parkwash', 60452, 137, NULL, NULL, NULL, NULL, NULL, 2, 2, 'cbpay', '2019072283460452', '2019-07-22 10:20:53', NULL, NULL, NULL, NULL, '2019072296070452', 2, '2019-07-22 10:26:11', '洗车服务', '2019-07-22 10:20:53', 'a731c3ca34a4b46131e6e3a27bc34941', -1);
INSERT INTO `pro_payments` VALUES (146, 'parkwash', 60452, 138, NULL, NULL, NULL, NULL, NULL, 2, 2, 'cbpay', '2019072262580452', '2019-07-22 10:26:39', NULL, NULL, NULL, NULL, '2019072262980452', 2, '2019-07-22 10:27:19', '洗车服务', '2019-07-22 10:26:39', 'a731c3ca34a4b46131e6e3a27bc34941', -1);
INSERT INTO `pro_payments` VALUES (147, 'parkwash', 60452, 139, NULL, NULL, NULL, NULL, NULL, 2, 2, 'cbpay', '2019072242260452', '2019-07-22 10:31:32', NULL, NULL, NULL, NULL, '2019072281410452', 2, '2019-07-22 10:32:11', '洗车服务', '2019-07-22 10:31:32', 'a731c3ca34a4b46131e6e3a27bc34941', -1);
INSERT INTO `pro_payments` VALUES (148, 'parkwash', 60452, 140, NULL, NULL, NULL, NULL, NULL, 2, 2, 'cbpay', '2019072241920452', '2019-07-22 10:32:47', NULL, NULL, NULL, NULL, '2019072237300452', 2, '2019-07-22 10:33:14', '洗车服务', '2019-07-22 10:32:47', 'a731c3ca34a4b46131e6e3a27bc34941', -1);
INSERT INTO `pro_payments` VALUES (149, 'parkwash', 60452, 141, NULL, NULL, NULL, NULL, NULL, 2, 2, 'cbpay', '2019072241430452', '2019-07-22 10:33:34', NULL, NULL, NULL, NULL, '2019072284750452', 2, '2019-07-22 10:34:39', '洗车服务', '2019-07-22 10:33:34', 'a731c3ca34a4b46131e6e3a27bc34941', -1);
INSERT INTO `pro_payments` VALUES (150, 'parkwash', 60452, 142, NULL, NULL, NULL, NULL, NULL, 2, 2, 'cbpay', '2019072282770452', '2019-07-22 14:29:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-22 14:29:31', 'a731c3ca34a4b46131e6e3a27bc34941', 1);
INSERT INTO `pro_payments` VALUES (151, 'parkwash', 63489, 143, NULL, NULL, NULL, NULL, NULL, 0, 2000, 'cbpay', '2019072263703489', '2019-07-22 15:15:42', NULL, NULL, NULL, NULL, '2019072209953489', 0, '2019-07-22 15:16:00', '洗车服务', '2019-07-22 15:15:42', '32825c49cde6ac8309879ea8e8c96c40', -1);
INSERT INTO `pro_payments` VALUES (152, 'parkwash', 63489, 144, NULL, NULL, NULL, NULL, NULL, 0, 1000, 'cbpay', '2019072212683489', '2019-07-22 15:16:33', NULL, NULL, NULL, NULL, '2019072228173489', 0, '2019-07-22 15:17:11', '洗车服务', '2019-07-22 15:16:33', '01a482a81a240f6f764c367b16512724', -1);
INSERT INTO `pro_payments` VALUES (153, 'parkwash', 63489, 145, NULL, NULL, NULL, NULL, NULL, 0, 1000, 'cbpay', '2019072242753489', '2019-07-22 15:17:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-22 15:17:56', '4713eea7a0fce75c690e7eaef8a4820f', 1);
INSERT INTO `pro_payments` VALUES (154, 'parkwash', 63700, 146, NULL, NULL, NULL, NULL, NULL, 0, 1000, 'cbpay', '2019072220613700', '2019-07-22 15:27:20', NULL, NULL, NULL, NULL, '2019072215353700', 0, '2019-07-22 15:29:43', '洗车服务', '2019-07-22 15:27:20', 'f3e46ba3d7774a7ff31ce27f0d9b1c31', -1);
INSERT INTO `pro_payments` VALUES (155, 'parkwash', 63700, 147, NULL, NULL, NULL, NULL, NULL, 0, 1000, 'cbpay', '2019072252773700', '2019-07-22 15:29:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-22 15:29:53', '79b8ddf73394ca6ecdd0c4786d73e754', 1);
INSERT INTO `pro_payments` VALUES (156, 'parkwash', 63489, 148, NULL, NULL, NULL, NULL, NULL, 0, 2000, 'cbpay', '2019072289073489', '2019-07-22 15:36:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-22 15:36:34', 'fa6be96265520774e320a275a97f2611', 1);
INSERT INTO `pro_payments` VALUES (157, 'parkwash', 63489, 149, NULL, NULL, NULL, NULL, NULL, 0, 1000, 'cbpay', '2019072291403489', '2019-07-22 15:44:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-22 15:44:48', 'fe231a0cd89fbbc10df8c77a67ea14eb', 1);
INSERT INTO `pro_payments` VALUES (158, 'parkwash', 63489, 150, NULL, NULL, NULL, NULL, NULL, 0, 1000, 'cbpay', '2019072299663489', '2019-07-22 15:48:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-22 15:48:03', 'fe231a0cd89fbbc10df8c77a67ea14eb', 1);
INSERT INTO `pro_payments` VALUES (159, 'parkwash', 63489, 151, NULL, NULL, NULL, NULL, NULL, 0, 1000, 'cbpay', '2019072206343489', '2019-07-22 15:58:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-22 15:58:32', '4b718388331e8bffabbabce6c9ef80dd', 1);
INSERT INTO `pro_payments` VALUES (160, 'parkwash', 63489, 152, NULL, NULL, NULL, NULL, NULL, 0, 1000, 'cbpay', '2019072262743489', '2019-07-22 16:01:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-22 16:01:19', '4b718388331e8bffabbabce6c9ef80dd', 1);
INSERT INTO `pro_payments` VALUES (161, 'parkwash', 63489, 153, NULL, NULL, NULL, NULL, NULL, 1000, 1000, 'cbpay', '2019072288583489', '2019-07-22 16:03:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-22 16:03:15', '6612ededabffe00c74a3e776fbd877af', 1);
INSERT INTO `pro_payments` VALUES (162, 'parkwash', 63489, 154, NULL, NULL, NULL, NULL, NULL, 1000, 1000, 'cbpay', '2019072238073489', '2019-07-22 16:08:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-22 16:08:37', '4bc96e76351cef7c1c05fb9350e3e2a5', 1);
INSERT INTO `pro_payments` VALUES (163, 'parkwash', 63489, 155, NULL, NULL, NULL, NULL, NULL, 1000, 1000, 'cbpay', '2019072236063489', '2019-07-22 16:14:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-22 16:14:21', 'fc0ac883d4ea5a570d7037fc048efcea', 1);
INSERT INTO `pro_payments` VALUES (164, 'parkwash', 69832, 156, NULL, NULL, NULL, NULL, NULL, 0, 2000, 'cbpay', '2019072243189832', '2019-07-22 16:24:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-22 16:24:03', '4104d33dc074b09d66636b45442b3c64', 1);
INSERT INTO `pro_payments` VALUES (165, 'parkwash', 63489, 157, NULL, NULL, NULL, NULL, NULL, 2000, 2000, 'cbpay', '2019072293253489', '2019-07-22 16:39:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-22 16:39:39', '58375082463907f9b013c417b501dc7a', 1);
INSERT INTO `pro_payments` VALUES (166, 'parkwash', 64077, 158, NULL, NULL, NULL, NULL, NULL, 2000, 2000, 'cbpay', '2019072290234077', '2019-07-22 16:56:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-22 16:56:20', 'fb5457f065c55f101802c61661c1deb5', 1);
INSERT INTO `pro_payments` VALUES (167, 'parkwash', 63489, 159, NULL, NULL, NULL, NULL, NULL, 1000, 1000, 'cbpay', '2019072249283489', '2019-07-22 18:18:15', NULL, NULL, NULL, NULL, '2019072237303489', 1000, '2019-07-22 18:18:40', '洗车服务', '2019-07-22 18:18:15', '92d25efd46b903daca4bcabce7b379d3', -1);
INSERT INTO `pro_payments` VALUES (168, 'parkwash', 63489, 160, NULL, NULL, NULL, NULL, NULL, 2000, 2000, 'cbpay', '2019072238503489', '2019-07-22 18:19:08', NULL, NULL, NULL, NULL, '2019072205263489', 2000, '2019-07-22 18:19:27', '洗车服务', '2019-07-22 18:19:08', '19d9ffdd478573d3f746ad2f3341c674', -1);
INSERT INTO `pro_payments` VALUES (169, 'parkwash', 63489, 161, NULL, NULL, NULL, NULL, NULL, 2000, 2000, 'cbpay', '2019072291613489', '2019-07-22 18:19:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-22 18:19:44', 'd40cfeed912c8c8857bd8777bdd18688', 1);
INSERT INTO `pro_payments` VALUES (170, 'parkwash', 69832, 162, NULL, NULL, NULL, NULL, NULL, 2006, 3000, 'cbpay', '2019072208499832', '2019-07-22 18:28:42', NULL, NULL, NULL, NULL, '2019072249209832', 2006, '2019-07-22 18:29:39', '洗车服务', '2019-07-22 18:28:42', '083e70e9567fbf13badb930340858b41', -1);
INSERT INTO `pro_payments` VALUES (171, 'parkwash', 69832, 163, NULL, NULL, NULL, NULL, NULL, 2006, 3000, 'cbpay', '2019072231089832', '2019-07-22 18:30:17', NULL, NULL, NULL, NULL, '2019072277809832', 2006, '2019-07-22 18:31:39', '洗车服务', '2019-07-22 18:30:17', '6040e907fb0fbdf39a8efd3a7e0a32fc', -1);
INSERT INTO `pro_payments` VALUES (172, 'parkwash', 69832, 164, NULL, NULL, NULL, NULL, NULL, 2006, 3000, 'cbpay', '2019072224299832', '2019-07-22 18:32:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-22 18:32:31', '38cf5bf1c382a32b05ab293caa454cf6', 1);
INSERT INTO `pro_payments` VALUES (173, 'parkwash', 63489, 165, NULL, NULL, NULL, NULL, NULL, 3000, 3000, 'cbpay', '2019072272043489', '2019-07-22 18:49:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-22 18:49:18', 'ee62b35bcdfdd04cd31b064a0edd4f5a', 1);
INSERT INTO `pro_payments` VALUES (174, 'parkwash', 63489, 166, NULL, NULL, NULL, NULL, NULL, 3000, 3000, 'cbpay', '2019072201343489', '2019-07-22 18:55:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-22 18:55:17', 'ca3614d087c91461998b343aca1fe8a5', 1);
INSERT INTO `pro_payments` VALUES (175, 'parkwash', 63489, 167, NULL, NULL, NULL, NULL, NULL, 4000, 4000, 'cbpay', '2019072204033489', '2019-07-22 19:10:46', NULL, NULL, NULL, NULL, '2019072251403489', 4000, '2019-07-22 19:11:09', '洗车服务', '2019-07-22 19:10:46', '00ef9c14050a7cd9549d3e9e8debcfdc', -1);
INSERT INTO `pro_payments` VALUES (176, 'parkwash', 63489, 168, NULL, NULL, NULL, NULL, NULL, 3000, 3000, 'cbpay', '2019072239213489', '2019-07-22 19:11:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-22 19:11:21', '12f2d47c16f20e636f584563ca00e67c', 1);
INSERT INTO `pro_payments` VALUES (177, 'parkwash', 63489, 169, NULL, NULL, NULL, NULL, NULL, 1000, 1000, 'cbpay', '2019072243043489', '2019-07-22 19:18:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-22 19:18:16', 'ef9fc0527f97fd307bc892da0928f712', 1);
INSERT INTO `pro_payments` VALUES (178, 'parkwash', 69832, 170, NULL, NULL, NULL, NULL, NULL, 2000, 2000, 'cbpay', '2019072206489832', '2019-07-22 19:19:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-22 19:19:56', 'a188a2d8040d5c361d3d5eaee77907da', 1);
INSERT INTO `pro_payments` VALUES (179, 'parkwash', 69832, 171, NULL, NULL, NULL, NULL, NULL, 2000, 2000, 'cbpay', '2019072277099832', '2019-07-22 19:21:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-22 19:21:45', 'f97940c50c96218282f500fab1205e03', 1);
INSERT INTO `pro_payments` VALUES (180, 'parkwash', 63489, 172, NULL, NULL, NULL, NULL, NULL, 3000, 3000, 'cbpay', '2019072227123489', '2019-07-22 19:25:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-22 19:25:37', '58e10662c4c3113c51157ecc504568da', 1);
INSERT INTO `pro_payments` VALUES (181, 'parkwash', 63489, 173, NULL, NULL, NULL, NULL, 'wx221946214136448c3dc05e151957508400', 5, 5, 'wxpaywash', '2019072299003489', '2019-07-22 19:46:28', '1525654921', 'JSAPI', '4200000399201907227457807252', '', '2019072288643489', 5, '2019-07-22 19:46:58', '洗车服务', '2019-07-22 19:46:20', '721cc5ee062d8e9fb62b08a4e65b6a4c', -1);
INSERT INTO `pro_payments` VALUES (182, 'parkwash', 63489, 174, NULL, NULL, NULL, NULL, NULL, 5, 5, 'cbpay', '2019072240403489', '2019-07-22 19:48:22', NULL, NULL, NULL, NULL, '2019072224113489', 5, '2019-07-22 19:50:17', '洗车服务', '2019-07-22 19:48:22', 'cf4667fa685e167c30e51520deba2808', -1);
INSERT INTO `pro_payments` VALUES (183, 'parkwash', 63489, 175, NULL, NULL, NULL, NULL, 'wx22195112767929c2d6cc254b1326576100', 5, 5, 'wxpaywash', '2019072291003489', '2019-07-22 19:51:18', '1525654921', 'JSAPI', '4200000379201907225333043445', '', NULL, NULL, NULL, '洗车服务', '2019-07-22 19:51:12', '4edeefd3d5a9c0390b0ac9c7094b1b3d', 1);
INSERT INTO `pro_payments` VALUES (184, 'parkwash', 63489, 176, NULL, NULL, NULL, NULL, NULL, 5, 5, 'cbpay', '2019072264123489', '2019-07-22 19:55:17', NULL, NULL, NULL, NULL, '2019072257023489', 5, '2019-07-22 19:55:40', '洗车服务', '2019-07-22 19:55:17', '5b8c7036c8bec219cd4084332b3c24f2', -1);
INSERT INTO `pro_payments` VALUES (185, 'parkwash', 63489, 177, NULL, NULL, NULL, NULL, NULL, 5, 5, 'cbpay', '2019072293403489', '2019-07-22 19:55:55', NULL, NULL, NULL, NULL, '2019072251763489', 5, '2019-07-22 19:56:52', '洗车服务', '2019-07-22 19:55:55', '5440fc8951d170abdac8adcc45e2562e', -1);
INSERT INTO `pro_payments` VALUES (186, 'parkwash', 63489, 178, NULL, NULL, NULL, NULL, NULL, 3000, 3000, 'cbpay', '2019072277233489', '2019-07-22 19:57:03', NULL, NULL, NULL, NULL, '2019072283793489', 3000, '2019-07-22 19:57:23', '洗车服务', '2019-07-22 19:57:03', '0b9908bb31a0983fb3c8642448fe9273', -1);
INSERT INTO `pro_payments` VALUES (187, 'parkwash', 63489, 179, NULL, NULL, NULL, NULL, NULL, 2000, 2000, 'cbpay', '2019072230883489', '2019-07-22 19:58:20', NULL, NULL, NULL, NULL, '2019072226313489', 2000, '2019-07-22 19:58:36', '洗车服务', '2019-07-22 19:58:20', '16ad96b1fe93bbb59d1a5d3dc45476aa', -1);
INSERT INTO `pro_payments` VALUES (188, 'parkwash', 63489, 180, NULL, NULL, NULL, NULL, NULL, 5, 5, 'cbpay', '2019072265343489', '2019-07-22 19:58:47', NULL, NULL, NULL, NULL, '2019072229293489', 5, '2019-07-22 19:58:55', '洗车服务', '2019-07-22 19:58:47', '5e852e50b7bb755d3e66f4b54a108ddd', -1);
INSERT INTO `pro_payments` VALUES (189, 'parkwash', 63489, 181, NULL, NULL, NULL, NULL, NULL, 2000, 2000, 'cbpay', '2019072290023489', '2019-07-22 19:59:13', NULL, NULL, NULL, NULL, '2019072291103489', 2000, '2019-07-22 19:59:25', '洗车服务', '2019-07-22 19:59:13', '16ad96b1fe93bbb59d1a5d3dc45476aa', -1);
INSERT INTO `pro_payments` VALUES (190, 'parkwash', 63489, 182, NULL, NULL, NULL, NULL, NULL, 3000, 3000, 'cbpay', '2019072281163489', '2019-07-22 19:59:41', NULL, NULL, NULL, NULL, '2019072296463489', 3000, '2019-07-22 19:59:49', '洗车服务', '2019-07-22 19:59:41', '12f2d47c16f20e636f584563ca00e67c', -1);
INSERT INTO `pro_payments` VALUES (191, 'parkwash', 63489, 183, NULL, NULL, NULL, NULL, NULL, 8000, 8000, 'cbpay', '2019072254963489', '2019-07-22 20:07:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-22 20:07:21', '89650c72b7dd3c5c6ad320f057523dcf', 1);
INSERT INTO `pro_payments` VALUES (192, 'parkwash', 63489, 184, NULL, NULL, NULL, NULL, NULL, 8000, 8000, 'cbpay', '2019072253703489', '2019-07-22 20:10:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-22 20:10:09', '5701aaec9fac3dc52ab5cd7531976039', 1);
INSERT INTO `pro_payments` VALUES (193, 'parkwash', 63489, 185, NULL, NULL, NULL, NULL, NULL, 5, 5, 'cbpay', '2019072336303489', '2019-07-23 09:28:36', NULL, NULL, NULL, NULL, '2019072358513489', 5, '2019-07-23 09:50:03', '洗车服务', '2019-07-23 09:28:36', 'c1809ac284961b96871c159731f60cdc', -1);
INSERT INTO `pro_payments` VALUES (194, 'parkwash', 48981, 186, NULL, NULL, NULL, NULL, NULL, 2, 2, 'cbpay', '2019072389608981', '2019-07-23 09:48:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-23 09:48:27', 'dbbc5e6a8723e969c82bdedcbe841ec8', 1);
INSERT INTO `pro_payments` VALUES (195, 'pwadd', 63489, NULL, 1, NULL, NULL, NULL, 'wx23095221053348c8dc0def0f1259315600', 2, 20002, 'wxpaywash', '2019072397923489', '2019-07-23 09:52:27', '1525654921', 'JSAPI', '4200000375201907234833189103', '', NULL, NULL, NULL, '余额充值', '2019-07-23 09:52:20', NULL, 1);
INSERT INTO `pro_payments` VALUES (196, 'parkwash', 63489, 187, NULL, NULL, NULL, NULL, NULL, 0, 8000, 'cbpay', '2019072398963489', '2019-07-23 09:56:22', NULL, NULL, NULL, NULL, '2019072354063489', 0, '2019-07-23 09:56:30', '洗车服务', '2019-07-23 09:56:22', 'a7d71e9b397ab1ea10f97ee095b1641a', -1);
INSERT INTO `pro_payments` VALUES (197, 'parkwash', 63489, 188, NULL, NULL, NULL, NULL, NULL, 0, 4000, 'cbpay', '2019072313123489', '2019-07-23 09:56:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-23 09:56:42', '25305830978623fa75375448f9b18b43', 1);
INSERT INTO `pro_payments` VALUES (198, 'parkwash', 63489, 189, NULL, NULL, NULL, NULL, NULL, 0, 3000, 'cbpay', '2019072396143489', '2019-07-23 09:58:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-23 09:58:49', '04a33898020f5486213ff40a0b0a4665', 1);
INSERT INTO `pro_payments` VALUES (199, 'parkwash', 63489, 190, NULL, NULL, NULL, NULL, NULL, 0, 2000, 'cbpay', '2019072383813489', '2019-07-23 10:16:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-23 10:16:41', '7ec9ceaaa566927e113c05ba8dbbff87', 1);
INSERT INTO `pro_payments` VALUES (200, 'parkwash', 63489, 191, NULL, NULL, NULL, NULL, NULL, 0, 2000, 'cbpay', '2019072379953489', '2019-07-23 10:21:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-23 10:21:25', '7b698890687bb79f0d0c3b584ecba023', 1);
INSERT INTO `pro_payments` VALUES (201, 'parkwash', 60452, 192, NULL, NULL, NULL, NULL, NULL, 2, 2, 'cbpay', '2019072376720452', '2019-07-23 10:28:10', NULL, NULL, NULL, NULL, '2019072397190452', 2, '2019-07-23 10:31:22', '洗车服务', '2019-07-23 10:28:10', '0143f470cd924f33c2c7581e1d913055', -1);
INSERT INTO `pro_payments` VALUES (202, 'parkwash', 63489, 193, NULL, NULL, NULL, NULL, NULL, 0, 2000, 'cbpay', '2019072320223489', '2019-07-23 10:28:45', NULL, NULL, NULL, NULL, '2019072377593489', 0, '2019-07-23 10:29:31', '洗车服务', '2019-07-23 10:28:45', 'b674aa4fc6f74b3ccd007cb27260a195', -1);
INSERT INTO `pro_payments` VALUES (203, 'parkwash', 63489, 194, NULL, NULL, NULL, NULL, NULL, 0, 2000, 'cbpay', '2019072352113489', '2019-07-23 10:29:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-23 10:29:58', '7b698890687bb79f0d0c3b584ecba023', 1);
INSERT INTO `pro_payments` VALUES (204, 'parkwash', 63489, 195, NULL, NULL, NULL, NULL, NULL, 0, 2000, 'cbpay', '2019072333703489', '2019-07-23 10:31:46', NULL, NULL, NULL, NULL, '2019072347293489', 0, '2019-07-23 10:32:29', '洗车服务', '2019-07-23 10:31:46', '3d721699a5a71f8c703f4511cd4e3d4b', -1);
INSERT INTO `pro_payments` VALUES (205, 'parkwash', 63489, 196, NULL, NULL, NULL, NULL, NULL, 0, 3000, 'cbpay', '2019072367423489', '2019-07-23 10:32:43', NULL, NULL, NULL, NULL, '2019072315503489', 0, '2019-07-23 10:33:14', '洗车服务', '2019-07-23 10:32:43', '7343c599cc1a255302cf158acc9bf238', -1);
INSERT INTO `pro_payments` VALUES (206, 'parkwash', 60452, 197, NULL, NULL, NULL, NULL, NULL, 2, 2, 'cbpay', '2019072338690452', '2019-07-23 10:32:50', NULL, NULL, NULL, NULL, '2019072311360452', 2, '2019-07-23 10:37:22', '洗车服务', '2019-07-23 10:32:50', 'd1aebe3c05f2135af3f266b17b217232', -1);
INSERT INTO `pro_payments` VALUES (207, 'parkwash', 63489, 198, NULL, NULL, NULL, NULL, NULL, 0, 2000, 'cbpay', '2019072316123489', '2019-07-23 10:33:28', NULL, NULL, NULL, NULL, '2019072389253489', 0, '2019-07-23 10:33:47', '洗车服务', '2019-07-23 10:33:28', '3d721699a5a71f8c703f4511cd4e3d4b', -1);
INSERT INTO `pro_payments` VALUES (208, 'parkwash', 63489, 199, NULL, NULL, NULL, NULL, NULL, 0, 2000, 'cbpay', '2019072359743489', '2019-07-23 10:34:00', NULL, NULL, NULL, NULL, '2019072326203489', 0, '2019-07-23 10:35:14', '洗车服务', '2019-07-23 10:34:00', '449274f983e61f51bafe13061a232174', -1);
INSERT INTO `pro_payments` VALUES (209, 'parkwash', 63489, 200, NULL, NULL, NULL, NULL, NULL, 0, 2000, 'cbpay', '2019072352533489', '2019-07-23 10:35:26', NULL, NULL, NULL, NULL, '2019072339013489', 0, '2019-07-23 10:35:51', '洗车服务', '2019-07-23 10:35:26', '3d721699a5a71f8c703f4511cd4e3d4b', -1);
INSERT INTO `pro_payments` VALUES (210, 'parkwash', 63489, 201, NULL, NULL, NULL, NULL, NULL, 0, 2000, 'cbpay', '2019072382563489', '2019-07-23 10:36:03', NULL, NULL, NULL, NULL, '2019072341163489', 0, '2019-07-23 10:36:29', '洗车服务', '2019-07-23 10:36:03', '449274f983e61f51bafe13061a232174', -1);
INSERT INTO `pro_payments` VALUES (211, 'parkwash', 63489, 202, NULL, NULL, NULL, NULL, NULL, 0, 2000, 'cbpay', '2019072353013489', '2019-07-23 10:36:51', NULL, NULL, NULL, NULL, '2019072311123489', 0, '2019-07-23 10:37:08', '洗车服务', '2019-07-23 10:36:51', '3d721699a5a71f8c703f4511cd4e3d4b', -1);
INSERT INTO `pro_payments` VALUES (212, 'parkwash', 60452, 203, NULL, NULL, NULL, NULL, NULL, 5, 5, 'cbpay', '2019072354190452', '2019-07-23 10:37:36', NULL, NULL, NULL, NULL, '2019072343160452', 5, '2019-07-23 10:38:16', '洗车服务', '2019-07-23 10:37:36', '22137a5f726e9beddc236e5a6c8459aa', -1);
INSERT INTO `pro_payments` VALUES (213, 'parkwash', 60452, 204, NULL, NULL, NULL, NULL, NULL, 5, 5, 'cbpay', '2019072334850452', '2019-07-23 10:38:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-23 10:38:31', '10bf121fc72af6e6858d51eef6b42179', 1);
INSERT INTO `pro_payments` VALUES (214, 'parkwash', 63489, 205, NULL, NULL, NULL, NULL, NULL, 0, 2000, 'cbpay', '2019072324883489', '2019-07-23 11:39:59', NULL, NULL, NULL, NULL, '2019072377513489', 0, '2019-07-23 11:48:29', '洗车服务', '2019-07-23 11:39:59', '9159932bb8d627298a9a9538418e359d', -1);
INSERT INTO `pro_payments` VALUES (215, 'parkwash', 63489, 206, NULL, NULL, NULL, NULL, NULL, 0, 2000, 'cbpay', '2019072388493489', '2019-07-23 14:05:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-23 14:05:17', '1b3ec15c3ed39bc9bfd96d8c846b084f', 1);
INSERT INTO `pro_payments` VALUES (216, 'parkwash', 63489, 207, NULL, NULL, NULL, NULL, NULL, 0, 4000, 'cbpay', '2019072304223489', '2019-07-23 14:13:55', NULL, NULL, NULL, NULL, '2019072393383489', 0, '2019-07-23 14:18:44', '洗车服务', '2019-07-23 14:13:55', '75612520f3ab4cb17951754fdfb5da7d', -1);
INSERT INTO `pro_payments` VALUES (217, 'parkwash', 63700, 208, NULL, NULL, NULL, NULL, NULL, 0, 2, 'cbpay', '2019072327233700', '2019-07-23 14:16:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-23 14:16:17', 'b76e088b6f425a03a2004c7ba0f1e3a6', 1);
INSERT INTO `pro_payments` VALUES (218, 'parkwash', 63489, 209, NULL, NULL, NULL, NULL, NULL, 0, 2000, 'cbpay', '2019072355083489', '2019-07-23 14:18:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-23 14:18:56', '5b5cc8c21d3e10368b1db40d0e6d138d', 1);
INSERT INTO `pro_payments` VALUES (219, 'parkwash', 63489, 210, NULL, NULL, NULL, NULL, NULL, 0, 2000, 'cbpay', '2019072381163489', '2019-07-23 15:27:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-23 15:27:22', 'd98be1e5eb60ac6e66184079a4f509ed', 1);
INSERT INTO `pro_payments` VALUES (220, 'parkwash', 63489, 211, NULL, NULL, NULL, NULL, NULL, 0, 5, 'cbpay', '2019072378723489', '2019-07-23 15:28:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-23 15:28:51', '851b025594d2f029499edd65459f57bd', 1);
INSERT INTO `pro_payments` VALUES (221, 'parkwash', 63489, 212, NULL, NULL, NULL, NULL, NULL, 1005, 2000, 'cbpay', '2019072331653489', '2019-07-23 15:35:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-23 15:35:08', 'cc28da1b0277fe0776e73646a066b033', 1);
INSERT INTO `pro_payments` VALUES (222, 'parkwash', 63489, 213, NULL, NULL, NULL, NULL, NULL, 5, 5, 'cbpay', '2019072314463489', '2019-07-23 15:55:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-23 15:55:05', '91ad983a5f78764cc768f542a7175b28', 1);
INSERT INTO `pro_payments` VALUES (223, 'parkwash', 63489, 214, NULL, NULL, NULL, NULL, NULL, 2000, 2000, 'cbpay', '2019072353313489', '2019-07-23 16:18:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-23 16:18:56', '6164d786c756a6641b472136f05a00d1', 1);
INSERT INTO `pro_payments` VALUES (224, 'parkwash', 63489, 215, NULL, NULL, NULL, NULL, NULL, 2000, 2000, 'cbpay', '2019072329533489', '2019-07-23 16:55:10', NULL, NULL, NULL, NULL, '2019072363023489', 2000, '2019-07-23 16:56:30', '洗车服务', '2019-07-23 16:55:10', '45bc078eb185c5412b7e0ec02f61e16f', -1);
INSERT INTO `pro_payments` VALUES (225, 'parkwash', 63489, 216, NULL, NULL, NULL, NULL, NULL, 5, 5, 'cbpay', '2019072308493489', '2019-07-23 16:56:52', NULL, NULL, NULL, NULL, '2019072336083489', 5, '2019-07-23 16:57:04', '洗车服务', '2019-07-23 16:56:52', 'f13e576c86184ff4acbe3e5313bc9e20', -1);
INSERT INTO `pro_payments` VALUES (226, 'parkwash', 63489, 217, NULL, NULL, NULL, NULL, NULL, 5, 5, 'cbpay', '2019072385243489', '2019-07-23 16:57:37', NULL, NULL, NULL, NULL, '2019072374313489', 5, '2019-07-23 16:57:56', '洗车服务', '2019-07-23 16:57:37', 'f13e576c86184ff4acbe3e5313bc9e20', -1);
INSERT INTO `pro_payments` VALUES (227, 'parkwash', 63489, 218, NULL, NULL, NULL, NULL, NULL, 5, 5, 'cbpay', '2019072385513489', '2019-07-23 16:58:15', NULL, NULL, NULL, NULL, '2019072328933489', 5, '2019-07-23 16:58:41', '洗车服务', '2019-07-23 16:58:15', '6e7ea1fa9f0252aa40b3b5a0bbe2b2b0', -1);
INSERT INTO `pro_payments` VALUES (228, 'parkwash', 63489, 219, NULL, NULL, NULL, NULL, NULL, 5, 5, 'cbpay', '2019072343913489', '2019-07-23 17:00:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-23 17:00:59', '58cb863b3d8cc07e907d6adf821ca4da', 1);
INSERT INTO `pro_payments` VALUES (229, 'parkwash', 63489, 220, NULL, NULL, NULL, NULL, NULL, 2000, 2000, 'cbpay', '2019072368293489', '2019-07-23 17:07:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-23 17:07:49', '45bc078eb185c5412b7e0ec02f61e16f', 1);
INSERT INTO `pro_payments` VALUES (230, 'parkwash', 48981, 221, NULL, NULL, NULL, NULL, NULL, 2, 2, 'cbpay', '2019072318198981', '2019-07-23 17:29:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-23 17:29:18', 'c9f24b8f2e3744279fb946ad616e8411', 1);
INSERT INTO `pro_payments` VALUES (231, 'parkwash', 69832, 222, NULL, NULL, NULL, NULL, NULL, 5, 5, 'cbpay', '2019072301379832', '2019-07-23 18:09:13', NULL, NULL, NULL, NULL, '2019072363609832', 5, '2019-07-23 18:10:22', '洗车服务', '2019-07-23 18:09:13', '0f80f31fe662038bdf3f49f95223bda6', -1);
INSERT INTO `pro_payments` VALUES (232, 'parkwash', 69832, 223, NULL, NULL, NULL, NULL, NULL, 5, 5, 'cbpay', '2019072364299832', '2019-07-23 18:10:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-23 18:10:33', '0f80f31fe662038bdf3f49f95223bda6', 1);
INSERT INTO `pro_payments` VALUES (233, 'parkwash', 63489, 224, NULL, NULL, NULL, NULL, NULL, 2000, 2000, 'cbpay', '2019072334673489', '2019-07-23 18:23:51', NULL, NULL, NULL, NULL, '2019072397643489', 2000, '2019-07-23 18:24:05', '洗车服务', '2019-07-23 18:23:51', 'c470ef9136c86c1ffbd1b4856749b329', -1);
INSERT INTO `pro_payments` VALUES (234, 'parkwash', 63489, 225, NULL, NULL, NULL, NULL, NULL, 5, 5, 'cbpay', '2019072397103489', '2019-07-23 18:24:34', NULL, NULL, NULL, NULL, '2019072391833489', 5, '2019-07-23 18:26:03', '洗车服务', '2019-07-23 18:24:34', '6ae10955e6a843a3961beb06bf765c77', -1);
INSERT INTO `pro_payments` VALUES (235, 'parkwash', 63489, 226, NULL, NULL, NULL, NULL, NULL, 5, 5, 'cbpay', '2019072363563489', '2019-07-23 18:26:17', NULL, NULL, NULL, NULL, '2019072320203489', 5, '2019-07-23 18:27:04', '洗车服务', '2019-07-23 18:26:17', 'bc6c69251d2c264a291f8a2547ab98d0', -1);
INSERT INTO `pro_payments` VALUES (236, 'parkwash', 63489, 227, NULL, NULL, NULL, NULL, NULL, 2000, 2000, 'cbpay', '2019072308043489', '2019-07-23 18:27:14', NULL, NULL, NULL, NULL, '2019072345793489', 2000, '2019-07-23 18:27:43', '洗车服务', '2019-07-23 18:27:14', '418ca3dff47f95544c0d62e9a9211d79', -1);
INSERT INTO `pro_payments` VALUES (237, 'parkwash', 63489, 228, NULL, NULL, NULL, NULL, NULL, 5, 5, 'cbpay', '2019072380523489', '2019-07-23 18:28:06', NULL, NULL, NULL, NULL, '2019072306843489', 5, '2019-07-23 18:29:07', '洗车服务', '2019-07-23 18:28:06', 'bc6c69251d2c264a291f8a2547ab98d0', -1);
INSERT INTO `pro_payments` VALUES (238, 'parkwash', 63489, 229, NULL, NULL, NULL, NULL, NULL, 5, 5, 'cbpay', '2019072387123489', '2019-07-23 18:29:26', NULL, NULL, NULL, NULL, '2019072383833489', 5, '2019-07-23 18:30:50', '洗车服务', '2019-07-23 18:29:26', 'bc6c69251d2c264a291f8a2547ab98d0', -1);
INSERT INTO `pro_payments` VALUES (239, 'parkwash', 63489, 230, NULL, NULL, NULL, NULL, NULL, 2000, 2000, 'cbpay', '2019072338223489', '2019-07-23 18:31:00', NULL, NULL, NULL, NULL, '2019072374633489', 2000, '2019-07-23 18:32:58', '洗车服务', '2019-07-23 18:31:00', 'cfd8db787f786c9acee68ad977b0090f', -1);
INSERT INTO `pro_payments` VALUES (240, 'parkwash', 63489, 231, NULL, NULL, NULL, NULL, NULL, 5, 5, 'cbpay', '2019072378923489', '2019-07-23 18:33:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-23 18:33:11', 'd42f0ca87f0a25b6233d5b83f5c39de3', 1);
INSERT INTO `pro_payments` VALUES (241, 'parkwash', 63489, 232, NULL, NULL, NULL, NULL, NULL, 2000, 2000, 'cbpay', '2019072462683489', '2019-07-24 09:22:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-24 09:22:00', '53744fe05cdd36d81862349a391a6bdc', 1);
INSERT INTO `pro_payments` VALUES (242, 'parkwash', 69832, 233, NULL, NULL, NULL, NULL, NULL, 2000, 2000, 'cbpay', '2019072472859832', '2019-07-24 09:23:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-24 09:23:00', '1a944794ef1c70905eddec219c81972c', 1);
INSERT INTO `pro_payments` VALUES (243, 'parkwash', 63489, 234, NULL, NULL, NULL, NULL, NULL, 8000, 8000, 'cbpay', '2019072463543489', '2019-07-24 10:11:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-24 10:11:55', '84996e645fbf80dd01b8b6e4c948e028', 1);
INSERT INTO `pro_payments` VALUES (244, 'pwadd', 63489, NULL, 4, NULL, NULL, NULL, 'wx241017437326662598304b5e1273894100', 4, 4, 'wxpaywash', '2019072482823489', '2019-07-24 10:17:50', '1525654921', 'JSAPI', '4200000372201907241292344407', '', NULL, NULL, NULL, '余额充值', '2019-07-24 10:17:43', NULL, 1);
INSERT INTO `pro_payments` VALUES (245, 'parkwash', 63489, 235, NULL, NULL, NULL, NULL, NULL, 0, 9000, 'firstpay', '2019072455163489', '2019-07-24 11:15:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-24 11:15:16', '8a466b71d40fa459c585334dcf1ed129', 1);
INSERT INTO `pro_payments` VALUES (246, 'parkwash', 63489, 236, NULL, NULL, NULL, NULL, NULL, 0, 8000, 'firstpay', '2019072400153489', '2019-07-24 11:20:53', NULL, NULL, NULL, NULL, '2019072426833489', 0, '2019-07-24 11:21:41', '洗车服务', '2019-07-24 11:20:53', 'a7b15019fe94893bf88e6185b1f0d7cc', -1);
INSERT INTO `pro_payments` VALUES (247, 'parkwash', 63489, 237, NULL, NULL, NULL, NULL, NULL, 9000, 9000, 'cbpay', '2019072435033489', '2019-07-24 11:22:09', NULL, NULL, NULL, NULL, '2019072477583489', 9000, '2019-07-24 11:22:53', '洗车服务', '2019-07-24 11:22:09', '9be6e49451627c4ca58ba861c32911f9', -1);
INSERT INTO `pro_payments` VALUES (248, 'parkwash', 63489, 238, NULL, NULL, NULL, NULL, NULL, 0, 10000, 'firstpay', '2019072450513489', '2019-07-24 11:26:58', NULL, NULL, NULL, NULL, '2019072407313489', 0, '2019-07-24 11:29:54', '洗车服务', '2019-07-24 11:26:58', 'efa18cb914971cfc0a0b032a5ea8336e', -1);
INSERT INTO `pro_payments` VALUES (249, 'parkwash', 63489, 239, NULL, NULL, NULL, NULL, NULL, 0, 5000, 'firstpay', '2019072402193489', '2019-07-24 11:44:17', NULL, NULL, NULL, NULL, '2019072454733489', 0, '2019-07-24 11:46:23', '洗车服务', '2019-07-24 11:44:17', '5df31a82f19c84908cf370866fc0e872', -1);
INSERT INTO `pro_payments` VALUES (250, 'parkwash', 63489, 240, NULL, NULL, NULL, NULL, NULL, 7000, 7000, 'cbpay', '2019072452863489', '2019-07-24 13:45:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-24 13:45:04', 'ec4795652bab97f0f38abcd6b2a68414', 1);
INSERT INTO `pro_payments` VALUES (251, 'parkwash', 63489, 241, NULL, NULL, NULL, NULL, NULL, 0, 12000, 'firstpay', '2019072452723489', '2019-07-24 14:03:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-24 14:03:40', 'baefc85481b0c4c7153b7a6d0fd023a0', 1);
INSERT INTO `pro_payments` VALUES (252, 'parkwash', 63489, 242, NULL, NULL, NULL, NULL, NULL, 0, 14000, 'firstpay', '2019072436413489', '2019-07-24 14:58:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-24 14:58:27', '04e2e44817d012d8f0f891b2bb898ca8', 1);
INSERT INTO `pro_payments` VALUES (253, 'parkwash', 63489, 243, NULL, NULL, NULL, NULL, NULL, 0, 14000, 'firstpay', '2019072450563489', '2019-07-24 15:16:35', NULL, NULL, NULL, NULL, '2019072495293489', 0, '2019-07-24 15:18:52', '洗车服务', '2019-07-24 15:16:35', 'cc6eaf323930bc7fdd8ca13d56172a4b', -1);
INSERT INTO `pro_payments` VALUES (254, 'parkwash', 63489, 244, NULL, NULL, NULL, NULL, NULL, 3000, 3000, 'cbpay', '2019072455323489', '2019-07-24 15:19:11', NULL, NULL, NULL, NULL, '2019072464553489', 3000, '2019-07-24 15:41:15', '洗车服务', '2019-07-24 15:19:11', '146eb543bb4e22d03dff1c24ed9b33bb', -1);
INSERT INTO `pro_payments` VALUES (255, 'pwadd', 63489, NULL, 2, NULL, NULL, NULL, 'wx241622162314174177c623d91756220200', 1, 10001, 'wxpaywash', '2019072497793489', '2019-07-24 16:22:23', '1525654921', 'JSAPI', '4200000395201907246060287005', '', NULL, NULL, NULL, '余额充值', '2019-07-24 16:22:15', NULL, 1);
INSERT INTO `pro_payments` VALUES (256, 'parkwash', 69832, 245, NULL, NULL, NULL, NULL, NULL, 0, 3000, 'firstpay', '2019072494819832', '2019-07-24 16:31:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-24 16:31:46', '6bd4755e7927fa68d4689ef61c9f9c6d', 1);
INSERT INTO `pro_payments` VALUES (259, 'pwadd', 69832, NULL, 2, NULL, NULL, NULL, 'wx24163415409228d1bf1fe50e1474630300', 1, 10001, 'wxpaywash', '2019072474419832', '2019-07-24 16:34:34', '1525654921', 'JSAPI', '4200000386201907244196832225', '', NULL, NULL, NULL, '余额充值', '2019-07-24 16:34:14', NULL, 1);
INSERT INTO `pro_payments` VALUES (260, 'parkwash', 69832, 246, NULL, NULL, NULL, NULL, NULL, 0, 5000, 'firstpay', '2019072468639832', '2019-07-24 16:36:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-24 16:36:26', 'a5b6835488936ac91c9f837132d241b9', 1);
INSERT INTO `pro_payments` VALUES (261, 'parkwash', 69832, 247, NULL, NULL, NULL, NULL, 'wx2416381384763238cc282b211054046000', 1, 1, 'wxpaywash', '2019072495839832', '2019-07-24 16:38:24', '1525654921', 'JSAPI', '4200000374201907244291584795', '', NULL, NULL, NULL, '洗车服务', '2019-07-24 16:38:13', '1dcf70caa386d9a70bec2576957b61ec', 1);
INSERT INTO `pro_payments` VALUES (262, 'parkwash', 69832, 248, NULL, NULL, NULL, NULL, NULL, 0, 12000, 'firstpay', '2019072455559832', '2019-07-24 16:41:56', NULL, NULL, NULL, NULL, '2019072407669832', 0, '2019-07-24 16:47:23', '洗车服务', '2019-07-24 16:41:56', 'e784a2357d22f20977e05f784895fa74', -1);
INSERT INTO `pro_payments` VALUES (263, 'parkwash', 63489, 249, NULL, NULL, NULL, NULL, NULL, 0, 1, 'cbpay', '2019072431023489', '2019-07-24 16:46:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-24 16:46:52', 'c1862bfd1b0bb9994255a68a276b1fa1', 1);
INSERT INTO `pro_payments` VALUES (264, 'parkwash', 69832, 250, NULL, NULL, NULL, NULL, NULL, 0, 7000, 'firstpay', '2019072419259832', '2019-07-24 17:31:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-24 17:31:35', '842cf426a7453491b747c288d1ee6799', 1);
INSERT INTO `pro_payments` VALUES (265, 'parkwash', 69832, 251, NULL, NULL, NULL, NULL, NULL, 0, 10000, 'firstpay', '2019072457079832', '2019-07-24 17:51:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-24 17:51:44', '280665849b8a6530a7253ab8adfd35e4', 1);
INSERT INTO `pro_payments` VALUES (266, 'parkwash', 69832, 252, NULL, NULL, NULL, NULL, NULL, 0, 7000, 'cbpay', '2019072418789832', '2019-07-24 17:52:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-24 17:52:59', '94eeaf5b77428f53dc0c51247ae70fef', 1);
INSERT INTO `pro_payments` VALUES (267, 'parkwash', 69832, 253, NULL, NULL, NULL, NULL, NULL, 2000, 5000, 'cbpay', '2019072483859832', '2019-07-24 17:54:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-24 17:54:03', '213d3df80cd3c83ba5dc2db96495e3db', 1);
INSERT INTO `pro_payments` VALUES (268, 'parkwash', 69832, 254, NULL, NULL, NULL, NULL, NULL, 10000, 10000, 'cbpay', '2019072411059832', '2019-07-24 17:57:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-24 17:57:04', 'dff95ed30880a9d34511d6413d51fbea', 1);
INSERT INTO `pro_payments` VALUES (269, 'parkwash', 63489, 255, NULL, NULL, NULL, NULL, NULL, 0, 5000, 'cbpay', '2019072487033489', '2019-07-24 17:58:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-24 17:58:13', '7e0c4254d992565a4d5ffe6a6abbc8db', 1);
INSERT INTO `pro_payments` VALUES (270, 'parkwash', 60452, 256, NULL, NULL, NULL, NULL, NULL, 2, 2, 'cbpay', '2019072483350452', '2019-07-24 18:20:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-24 18:20:44', '5d940d146d2b78b24f5188c3bc7c28ce', 1);
INSERT INTO `pro_payments` VALUES (271, 'parkwash', 63489, 257, NULL, NULL, NULL, NULL, NULL, 2001, 7000, 'cbpay', '2019072572613489', '2019-07-25 09:08:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-25 09:08:44', '8933b7f0fee36dd5cf59ea950efd7882', 1);
INSERT INTO `pro_payments` VALUES (272, 'pwadd', 69832, NULL, 2, NULL, NULL, NULL, 'wx25091220519413d1c5388eea1329738200', 1, 10001, 'wxpaywash', '2019072549629832', '2019-07-25 09:12:43', '1525654921', 'JSAPI', '4200000375201907256702631161', '', NULL, NULL, NULL, '余额充值', '2019-07-25 09:12:19', NULL, 1);
INSERT INTO `pro_payments` VALUES (273, 'parkwash', 69832, 258, NULL, NULL, NULL, NULL, NULL, 0, 7000, 'cbpay', '2019072563979832', '2019-07-25 09:14:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-25 09:14:14', '8ecf758ba04d35041ff2610a7e21863d', 1);
INSERT INTO `pro_payments` VALUES (274, 'parkwash', 60452, 259, NULL, NULL, NULL, NULL, NULL, 1, 1, 'cbpay', '2019072513520452', '2019-07-25 10:28:55', NULL, NULL, NULL, NULL, '2019072546320452', 1, '2019-07-25 10:29:38', '洗车服务', '2019-07-25 10:28:55', 'c3cbd44d804ba43a879b706a5a95a404', -1);
INSERT INTO `pro_payments` VALUES (275, 'parkwash', 60452, 260, NULL, NULL, NULL, NULL, NULL, 1, 1, 'cbpay', '2019072543970452', '2019-07-25 10:29:54', NULL, NULL, NULL, NULL, '2019072566210452', 1, '2019-07-25 10:30:04', '洗车服务', '2019-07-25 10:29:54', 'c3cbd44d804ba43a879b706a5a95a404', -1);
INSERT INTO `pro_payments` VALUES (276, 'parkwash', 60452, 261, NULL, NULL, NULL, NULL, NULL, 1, 1, 'cbpay', '2019072517110452', '2019-07-25 10:30:22', NULL, NULL, NULL, NULL, '2019072571800452', 1, '2019-07-25 10:32:56', '洗车服务', '2019-07-25 10:30:22', 'c3cbd44d804ba43a879b706a5a95a404', -1);
INSERT INTO `pro_payments` VALUES (277, 'parkwash', 60452, 262, NULL, NULL, NULL, NULL, NULL, 1, 1, 'cbpay', '2019072563080452', '2019-07-25 10:33:09', NULL, NULL, NULL, NULL, '2019072598500452', 1, '2019-07-25 10:34:31', '洗车服务', '2019-07-25 10:33:09', 'c3cbd44d804ba43a879b706a5a95a404', -1);
INSERT INTO `pro_payments` VALUES (278, 'parkwash', 60452, 263, NULL, NULL, NULL, NULL, NULL, 1, 1, 'cbpay', '2019072599060452', '2019-07-25 10:36:28', NULL, NULL, NULL, NULL, '2019072585980452', 1, '2019-07-25 10:37:04', '洗车服务', '2019-07-25 10:36:28', 'c3cbd44d804ba43a879b706a5a95a404', -1);
INSERT INTO `pro_payments` VALUES (279, 'parkwash', 60452, 264, NULL, NULL, NULL, NULL, NULL, 0, 5000, 'firstpay', '2019072517070452', '2019-07-25 10:37:38', NULL, NULL, NULL, NULL, '2019072502290452', 0, '2019-07-25 10:38:00', '洗车服务', '2019-07-25 10:37:38', '9b2e835938dda893f48072c46202bcc7', -1);
INSERT INTO `pro_payments` VALUES (280, 'parkwash', 60452, 265, NULL, NULL, NULL, NULL, NULL, 1, 1, 'cbpay', '2019072509670452', '2019-07-25 10:38:17', NULL, NULL, NULL, NULL, '2019072588000452', 1, '2019-07-25 10:55:49', '洗车服务', '2019-07-25 10:38:17', 'c3cbd44d804ba43a879b706a5a95a404', -1);
INSERT INTO `pro_payments` VALUES (281, 'parkwash', 63489, 266, NULL, NULL, NULL, NULL, NULL, 5000, 5000, 'cbpay', '2019072584843489', '2019-07-25 10:43:50', NULL, NULL, NULL, NULL, '2019072583823489', 5000, '2019-07-25 10:45:36', '洗车服务', '2019-07-25 10:43:50', '9c278b48ac1355318c510e00d2fe88ef', -1);
INSERT INTO `pro_payments` VALUES (282, 'parkwash', 63489, 267, NULL, NULL, NULL, NULL, NULL, 5000, 5000, 'cbpay', '2019072565103489', '2019-07-25 10:45:45', NULL, NULL, NULL, NULL, '2019072524083489', 5000, '2019-07-25 10:45:56', '洗车服务', '2019-07-25 10:45:45', '9c278b48ac1355318c510e00d2fe88ef', -1);
INSERT INTO `pro_payments` VALUES (283, 'parkwash', 63489, 268, NULL, NULL, NULL, NULL, NULL, 5000, 5000, 'cbpay', '2019072543993489', '2019-07-25 10:47:17', NULL, NULL, NULL, NULL, '2019072563483489', 5000, '2019-07-25 10:48:14', '洗车服务', '2019-07-25 10:47:17', 'ded621287ac3cf1fdcd7986006aed380', -1);
INSERT INTO `pro_payments` VALUES (284, 'parkwash', 63489, 269, NULL, NULL, NULL, NULL, NULL, 5000, 5000, 'cbpay', '2019072583343489', '2019-07-25 10:48:25', NULL, NULL, NULL, NULL, '2019072596603489', 5000, '2019-07-25 10:48:39', '洗车服务', '2019-07-25 10:48:25', 'f922e2a6b89fbaf4a4bb705d259dde7a', -1);
INSERT INTO `pro_payments` VALUES (285, 'parkwash', 63489, 270, NULL, NULL, NULL, NULL, NULL, 5000, 5000, 'cbpay', '2019072557323489', '2019-07-25 10:49:06', NULL, NULL, NULL, NULL, '2019072520953489', 5000, '2019-07-25 10:49:31', '洗车服务', '2019-07-25 10:49:06', '9c278b48ac1355318c510e00d2fe88ef', -1);
INSERT INTO `pro_payments` VALUES (286, 'parkwash', 63489, 271, NULL, NULL, NULL, NULL, NULL, 5000, 5000, 'cbpay', '2019072514403489', '2019-07-25 10:49:41', NULL, NULL, NULL, NULL, '2019072507613489', 5000, '2019-07-25 10:49:58', '洗车服务', '2019-07-25 10:49:41', '9c278b48ac1355318c510e00d2fe88ef', -1);
INSERT INTO `pro_payments` VALUES (287, 'parkwash', 63489, 272, NULL, NULL, NULL, NULL, NULL, 5000, 5000, 'cbpay', '2019072561253489', '2019-07-25 10:52:07', NULL, NULL, NULL, NULL, '2019072519233489', 5000, '2019-07-25 10:54:04', '洗车服务', '2019-07-25 10:52:07', 'f922e2a6b89fbaf4a4bb705d259dde7a', -1);
INSERT INTO `pro_payments` VALUES (288, 'parkwash', 63489, 273, NULL, NULL, NULL, NULL, NULL, 5000, 5000, 'cbpay', '2019072503883489', '2019-07-25 10:54:20', NULL, NULL, NULL, NULL, '2019072554053489', 5000, '2019-07-25 10:54:35', '洗车服务', '2019-07-25 10:54:20', '9c278b48ac1355318c510e00d2fe88ef', -1);
INSERT INTO `pro_payments` VALUES (289, 'parkwash', 60452, 274, NULL, NULL, NULL, NULL, NULL, 1, 1, 'cbpay', '2019072585500452', '2019-07-25 10:56:08', NULL, NULL, NULL, NULL, '2019072529730452', 1, '2019-07-25 10:56:34', '洗车服务', '2019-07-25 10:56:08', 'c3cbd44d804ba43a879b706a5a95a404', -1);
INSERT INTO `pro_payments` VALUES (290, 'parkwash', 60452, 275, NULL, NULL, NULL, NULL, NULL, 1, 1, 'cbpay', '2019072591650452', '2019-07-25 10:58:25', NULL, NULL, NULL, NULL, '2019072501710452', 1, '2019-07-25 10:59:18', '洗车服务', '2019-07-25 10:58:25', 'c3cbd44d804ba43a879b706a5a95a404', -1);
INSERT INTO `pro_payments` VALUES (291, 'parkwash', 60452, 276, NULL, NULL, NULL, NULL, NULL, 1, 1, 'cbpay', '2019072533610452', '2019-07-25 11:00:02', NULL, NULL, NULL, NULL, '2019072560900452', 1, '2019-07-25 11:10:52', '洗车服务', '2019-07-25 11:00:02', 'c3cbd44d804ba43a879b706a5a95a404', -1);
INSERT INTO `pro_payments` VALUES (292, 'parkwash', 60452, 277, NULL, NULL, NULL, NULL, NULL, 1, 1, 'cbpay', '2019072533330452', '2019-07-25 11:11:32', NULL, NULL, NULL, NULL, '2019072583600452', 1, '2019-07-25 11:12:03', '洗车服务', '2019-07-25 11:11:32', 'c3cbd44d804ba43a879b706a5a95a404', -1);
INSERT INTO `pro_payments` VALUES (293, 'parkwash', 60452, 278, NULL, NULL, NULL, NULL, NULL, 1, 1, 'cbpay', '2019072545470452', '2019-07-25 11:12:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-25 11:12:19', 'c3cbd44d804ba43a879b706a5a95a404', 1);
INSERT INTO `pro_payments` VALUES (294, 'parkwash', 63489, 279, NULL, NULL, NULL, NULL, NULL, 5000, 5000, 'cbpay', '2019072560923489', '2019-07-25 11:47:49', NULL, NULL, NULL, NULL, '2019072507993489', 5000, '2019-07-25 11:47:59', '洗车服务', '2019-07-25 11:47:49', '5da50494655184c18eafafcd832a7b64', -1);
INSERT INTO `pro_payments` VALUES (295, 'parkwash', 63489, 280, NULL, NULL, NULL, NULL, NULL, 5000, 5000, 'cbpay', '2019072550553489', '2019-07-25 11:48:13', NULL, NULL, NULL, NULL, '2019072545123489', 5000, '2019-07-25 11:48:26', '洗车服务', '2019-07-25 11:48:13', '5da50494655184c18eafafcd832a7b64', -1);
INSERT INTO `pro_payments` VALUES (296, 'parkwash', 63489, 281, NULL, NULL, NULL, NULL, NULL, 5000, 5000, 'cbpay', '2019072560613489', '2019-07-25 11:48:39', NULL, NULL, NULL, NULL, '2019072523223489', 5000, '2019-07-25 11:48:54', '洗车服务', '2019-07-25 11:48:39', '1cda9ea235ff147279a098d1f7e8342e', -1);
INSERT INTO `pro_payments` VALUES (297, 'parkwash', 63489, 282, NULL, NULL, NULL, NULL, NULL, 1, 1, 'cbpay', '2019072583793489', '2019-07-25 11:49:07', NULL, NULL, NULL, NULL, '2019072547673489', 1, '2019-07-25 11:49:19', '洗车服务', '2019-07-25 11:49:07', 'dc9e39d43e4b16e10965dd22dc7762ea', -1);
INSERT INTO `pro_payments` VALUES (298, 'parkwash', 63489, 283, NULL, NULL, NULL, NULL, NULL, 1, 1, 'cbpay', '2019072535433489', '2019-07-25 11:49:44', NULL, NULL, NULL, NULL, '2019072525373489', 1, '2019-07-25 11:50:10', '洗车服务', '2019-07-25 11:49:44', '959ca676e9333c2a8dbe26b8dd8ba293', -1);
INSERT INTO `pro_payments` VALUES (299, 'parkwash', 63489, 284, NULL, NULL, NULL, NULL, NULL, 5000, 5000, 'cbpay', '2019072529843489', '2019-07-25 11:50:41', NULL, NULL, NULL, NULL, '2019072516993489', 5000, '2019-07-25 11:50:51', '洗车服务', '2019-07-25 11:50:41', 'c0f1cdb618506a69700f71a08cf1554e', -1);
INSERT INTO `pro_payments` VALUES (300, 'parkwash', 63489, 285, NULL, NULL, NULL, NULL, 'wx251151033171677d1db9df0c1515074000', 1, 1, 'wxpaywash', '2019072585343489', '2019-07-25 11:51:11', '1525654921', 'JSAPI', '4200000381201907254204796682', '', '2019072532373489', 1, '2019-07-25 11:53:29', '洗车服务', '2019-07-25 11:51:02', 'dc9e39d43e4b16e10965dd22dc7762ea', -1);
INSERT INTO `pro_payments` VALUES (301, 'parkwash', 63489, 286, NULL, NULL, NULL, NULL, NULL, 1, 1, 'cbpay', '2019072564473489', '2019-07-25 11:54:14', NULL, NULL, NULL, NULL, '2019072574123489', 1, '2019-07-25 11:54:30', '洗车服务', '2019-07-25 11:54:14', 'f688f5096e2a06590e4c56070342ea67', -1);
INSERT INTO `pro_payments` VALUES (302, 'pwadd', 64077, NULL, 2, NULL, NULL, NULL, 'wx251447328160757d799bdcab1359329400', 1, 1000001, 'wxpaywash', '2019072512224077', '2019-07-25 14:47:44', '1525654921', 'JSAPI', '4200000399201907254109088353', '', NULL, NULL, NULL, '余额充值', '2019-07-25 14:47:32', NULL, 1);
INSERT INTO `pro_payments` VALUES (303, 'parkwash', 64077, 287, NULL, NULL, NULL, NULL, NULL, 0, 3000, 'firstpay', '2019072560844077', '2019-07-25 14:48:42', NULL, NULL, NULL, NULL, '2019072582654077', 0, '2019-07-25 14:49:30', '洗车服务', '2019-07-25 14:48:42', 'b2a766a066ddef62876765fed8053e1c', -1);
INSERT INTO `pro_payments` VALUES (304, 'parkwash', 64077, 288, NULL, NULL, NULL, NULL, NULL, 0, 10000, 'firstpay', '2019072512314077', '2019-07-25 14:49:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-25 14:49:59', '3100740e2b772704a5f926fc774c0e1e', 1);
INSERT INTO `pro_payments` VALUES (305, 'parkwash', 64077, 289, NULL, NULL, NULL, NULL, NULL, 0, 10000, 'cbpay', '2019072567114077', '2019-07-25 14:53:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-25 14:53:12', '3100740e2b772704a5f926fc774c0e1e', 1);
INSERT INTO `pro_payments` VALUES (306, 'parkwash', 64077, 290, NULL, NULL, NULL, NULL, NULL, 0, 5000, 'firstpay', '2019072593754077', '2019-07-25 14:56:11', NULL, NULL, NULL, NULL, '2019072556794077', 0, '2019-07-25 15:08:43', '洗车服务', '2019-07-25 14:56:11', '7b12b67b3d132251eaea1b795c9786ab', -1);
INSERT INTO `pro_payments` VALUES (307, 'parkwash', 64077, 291, NULL, NULL, NULL, NULL, NULL, 0, 20000, 'firstpay', '2019072539444077', '2019-07-25 15:09:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-25 15:09:02', '3b699b93a53b4435e3060acf55bd1d74', 1);
INSERT INTO `pro_payments` VALUES (308, 'parkwash', 63489, 292, NULL, NULL, NULL, NULL, NULL, 3000, 3000, 'cbpay', '2019072557453489', '2019-07-25 16:12:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-25 16:12:37', '898e49975b68f0a26d10877ad86b616b', 1);
INSERT INTO `pro_payments` VALUES (309, 'parkwash', 63489, 293, NULL, NULL, NULL, NULL, NULL, 7000, 7000, 'cbpay', '2019072588823489', '2019-07-25 16:16:50', NULL, NULL, NULL, NULL, '2019072504703489', 7000, '2019-07-25 16:18:21', '洗车服务', '2019-07-25 16:16:50', '751ac7d9ff387da0beebb872459c896e', -1);
INSERT INTO `pro_payments` VALUES (310, 'pwadd', 52529, NULL, 2, NULL, NULL, NULL, 'wx25162144142870e96fb719421466586500', 1, 1000001, 'wxpaywash', '2019072508322529', NULL, '1525654921', NULL, NULL, NULL, NULL, NULL, NULL, '余额充值', '2019-07-25 16:21:43', NULL, 0);
INSERT INTO `pro_payments` VALUES (311, 'pwadd', 63489, NULL, 2, NULL, NULL, NULL, 'wx251632024930063d99463fb41913655900', 1, 1000001, 'wxpaywash', '2019072535623489', '2019-07-25 16:32:16', '1525654921', 'JSAPI', '4200000378201907252215839782', '', NULL, NULL, NULL, '余额充值', '2019-07-25 16:32:01', NULL, 1);
INSERT INTO `pro_payments` VALUES (312, 'parkwash', 63489, 294, NULL, NULL, NULL, NULL, NULL, 0, 4000, 'firstpay', '2019072574603489', '2019-07-25 16:41:09', NULL, NULL, NULL, NULL, '2019072537333489', 0, '2019-07-25 16:41:27', '洗车服务', '2019-07-25 16:41:09', '8165ce05b0aab7c9c9eef63a1908eccf', -1);
INSERT INTO `pro_payments` VALUES (313, 'parkwash', 63489, 295, NULL, NULL, NULL, NULL, NULL, 0, 3000, 'cbpay', '2019072519313489', '2019-07-25 16:42:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-25 16:42:51', 'f4fcdc88999e0b5fd70eaea2bb02816b', 1);
INSERT INTO `pro_payments` VALUES (314, 'parkwash', 63489, 296, NULL, NULL, NULL, NULL, NULL, 0, 4000, 'cbpay', '2019072566363489', '2019-07-25 17:07:02', NULL, NULL, NULL, NULL, '2019072540063489', 0, '2019-07-25 17:07:24', '洗车服务', '2019-07-25 17:07:02', '9615c294bc6309f66903c251256b1180', -1);
INSERT INTO `pro_payments` VALUES (315, 'parkwash', 63489, 297, NULL, NULL, NULL, NULL, NULL, 0, 4000, 'cbpay', '2019072523743489', '2019-07-25 17:07:38', NULL, NULL, NULL, NULL, '2019072596743489', 0, '2019-07-25 17:07:55', '洗车服务', '2019-07-25 17:07:38', 'e687b5123b50168aa2d23c91005f1d9d', -1);
INSERT INTO `pro_payments` VALUES (316, 'parkwash', 63489, 298, NULL, NULL, NULL, NULL, NULL, 0, 4000, 'cbpay', '2019072599243489', '2019-07-25 17:08:12', NULL, NULL, NULL, NULL, '2019072522953489', 0, '2019-07-25 17:09:02', '洗车服务', '2019-07-25 17:08:12', '9615c294bc6309f66903c251256b1180', -1);
INSERT INTO `pro_payments` VALUES (317, 'parkwash', 63489, 299, NULL, NULL, NULL, NULL, NULL, 0, 4000, 'cbpay', '2019072524353489', '2019-07-25 17:10:50', NULL, NULL, NULL, NULL, '2019072522803489', 0, '2019-07-25 17:22:11', '洗车服务', '2019-07-25 17:10:50', 'b7d8bb41bb4683853b5b4d6a4a8275ad', -1);
INSERT INTO `pro_payments` VALUES (318, 'parkwash', 63489, 300, NULL, NULL, NULL, NULL, NULL, 0, 4000, 'cbpay', '2019072505073489', '2019-07-25 17:42:52', NULL, NULL, NULL, NULL, '2019072509973489', 0, '2019-07-25 17:46:30', '洗车服务', '2019-07-25 17:42:52', '68643297f0e4b040b1f34514783e34a2', -1);
INSERT INTO `pro_payments` VALUES (319, 'parkwash', 63489, 301, NULL, NULL, NULL, NULL, NULL, 0, 6000, 'firstpay', '2019072564703489', '2019-07-25 17:48:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-25 17:48:02', 'c1de3ca8b5608797eca1ce52ea80ac74', 1);
INSERT INTO `pro_payments` VALUES (320, 'parkwash', 63489, 302, NULL, NULL, NULL, NULL, NULL, 0, 10000, 'cbpay', '2019072661993489', '2019-07-26 09:16:16', NULL, NULL, NULL, NULL, '2019072645663489', 0, '2019-07-26 09:18:50', '洗车服务', '2019-07-26 09:16:16', 'ec54c5aa142a74f64a737e790b04db5c', -1);
INSERT INTO `pro_payments` VALUES (321, 'parkwash', 63489, 303, NULL, NULL, NULL, NULL, NULL, 0, 10000, 'cbpay', '2019072672623489', '2019-07-26 09:19:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-26 09:19:14', 'c0e798188f91bfee9dc8f6de5e4af3f0', 1);
INSERT INTO `pro_payments` VALUES (322, 'parkwash', 63489, 304, NULL, NULL, NULL, NULL, NULL, 0, 10000, 'cbpay', '2019072656083489', '2019-07-26 09:20:40', NULL, NULL, NULL, NULL, '2019072609203489', 0, '2019-07-26 09:35:20', '洗车服务', '2019-07-26 09:20:40', 'c0e798188f91bfee9dc8f6de5e4af3f0', -1);
INSERT INTO `pro_payments` VALUES (323, 'parkwash', 63489, 305, NULL, NULL, NULL, NULL, NULL, 0, 6000, 'cbpay', '2019072667183489', '2019-07-26 09:36:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '洗车服务', '2019-07-26 09:36:03', '2a0bb61c9365f3ba7e8a2e9598cff86a', 1);

-- ----------------------------
-- Table structure for pro_platform
-- ----------------------------
DROP TABLE IF EXISTS `pro_platform`;
CREATE TABLE `pro_platform`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pfcode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '平台代码',
  `aes_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Aes加密key',
  `aes_iv` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Aes加密iv',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `status` tinyint(3) UNSIGNED NULL DEFAULT 1 COMMENT '状态0未启用1已启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pro_platform
-- ----------------------------
INSERT INTO `pro_platform` VALUES (1, '1', '0zcvnI48RbXvnmmn+1wCwOabNOlzjVgy04DIxIhiDCY=', 'K77uZoIHxeDBMp0Rjdn6Mg==', 'shop', 1);
INSERT INTO `pro_platform` VALUES (2, '2', 'rBtgc6dHk4xyfEESx5qJVFLkyRa59pUJgBOdme7OSJI=', 's1Fs6VwMuzJaiQ6WalUpSg==', 'shop', 1);

-- ----------------------------
-- Table structure for pro_ratelimit
-- ----------------------------
DROP TABLE IF EXISTS `pro_ratelimit`;
CREATE TABLE `pro_ratelimit`  (
  `skey` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '唯一key',
  `min_num` mediumint(8) UNSIGNED NULL DEFAULT NULL COMMENT '分钟访问次数',
  `hour_num` mediumint(8) UNSIGNED NULL DEFAULT NULL COMMENT '小时访问次数',
  `day_num` mediumint(8) UNSIGNED NULL DEFAULT NULL COMMENT '天访问次数',
  `time` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '访问时间',
  `microtime` mediumint(3) UNSIGNED NULL DEFAULT NULL COMMENT '毫秒',
  `version` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '版本号',
  PRIMARY KEY (`skey`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '访问限流控制' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pro_ratelimit
-- ----------------------------
INSERT INTO `pro_ratelimit` VALUES ('00fba961714e3cfde90c40761295d841', 2, 2, 2, 1564604275, 795, 8);
INSERT INTO `pro_ratelimit` VALUES ('05ceca66efc40d82ef787f179cd82f2d', 2, 5, 5, 1564104954, 368, 4);
INSERT INTO `pro_ratelimit` VALUES ('08a4c5e70bc4c799ab5a0aebbf9ab811', 1, 34, 34, 1564104906, 760, 33);
INSERT INTO `pro_ratelimit` VALUES ('0da5bc116b94b03b5b7c899e27a15260', 3, 3, 3, 1564604409, 917, 5);
INSERT INTO `pro_ratelimit` VALUES ('18b120c52b02445a2df366f7d6ca82f3', 1, 2, 2, 1564105553, 529, 1);
INSERT INTO `pro_ratelimit` VALUES ('1d1fe95b87924c3645dce8d56fedb3fc', 1, 4, 4, 1564104963, 228, 3);
INSERT INTO `pro_ratelimit` VALUES ('20c6bd6eac9f7cc5187b073fb0f4b29f', 2, 74, 74, 1564104906, 760, 73);
INSERT INTO `pro_ratelimit` VALUES ('214fbdb75050cc559ac13d93924423d8', 1, 2, 2, 1564604404, 364, 3);
INSERT INTO `pro_ratelimit` VALUES ('221035826a58e40652fe6d91ddfe2e01', 1, 5, 5, 1564106481, 937, 4);
INSERT INTO `pro_ratelimit` VALUES ('23b3d02920532160987f20566ea603a0', 1, 4, 9, 1564106478, 945, 8);
INSERT INTO `pro_ratelimit` VALUES ('2b961bfa41aa9cec0ff44c8348ea0c81', 1, 1, 1, 1564104005, 898, 0);
INSERT INTO `pro_ratelimit` VALUES ('2c47a8442c31d5d54f5c1a40384965cc', 1, 1, 1, 1564103992, 905, 0);
INSERT INTO `pro_ratelimit` VALUES ('326af9d98bcc104b80c53193a3957b65', 1, 5, 5, 1567408682, 875, 4);
INSERT INTO `pro_ratelimit` VALUES ('374a816d55f381adb1cd2b6c33f8cdf8', 1, 1, 1, 1567408460, 563, 0);
INSERT INTO `pro_ratelimit` VALUES ('37f26ff9f7b3328a0e81d393c7f92bd4', 1, 2, 2, 1564105553, 530, 1);
INSERT INTO `pro_ratelimit` VALUES ('39ec51beb94a77fda44b5b5f2ed45bd8', 1, 1, 1, 1564103690, 200, 0);
INSERT INTO `pro_ratelimit` VALUES ('3b97be72b8d076d43aa07dd7828dff3f', 1, 4, 9, 1564106590, 297, 8);
INSERT INTO `pro_ratelimit` VALUES ('3bd11b1250d27842af5f86d68640cf74', 1, 6, 139, 1564106479, 369, 138);
INSERT INTO `pro_ratelimit` VALUES ('3c934b353eafe5a1bd1c005cf8924759', 1, 4, 8, 1564106587, 381, 7);
INSERT INTO `pro_ratelimit` VALUES ('3e8bb16c2a1a985e11b02f23e4c2165b', 2, 14, 372, 1564106479, 463, 371);
INSERT INTO `pro_ratelimit` VALUES ('40a14f89ddcaa01be7cff25188d1fdc1', 1, 2, 2, 1567408682, 628, 1);
INSERT INTO `pro_ratelimit` VALUES ('428e7e3d0dcc18758db6b82a4b57e753', 1, 9, 9, 1564104974, 872, 8);
INSERT INTO `pro_ratelimit` VALUES ('45b3cba3a19e320ce7961b6f73bdb114', 1, 1, 1, 1564104949, 389, 0);
INSERT INTO `pro_ratelimit` VALUES ('485f3cf425b8140503f8082e169c1388', 1, 1, 1, 1567408657, 186, 0);
INSERT INTO `pro_ratelimit` VALUES ('4d4f0707e0c66067eb6a9c936b056f56', 1, 1, 1, 1564105303, 380, 0);
INSERT INTO `pro_ratelimit` VALUES ('516e254de814aca25619dd089793fee3', 1, 8, 17, 1564106587, 560, 16);
INSERT INTO `pro_ratelimit` VALUES ('51ad709b4c00820f8a6a68f4694afb08', 1, 1, 1, 1564103992, 717, 0);
INSERT INTO `pro_ratelimit` VALUES ('5776e3b5f527d69607cc5c72451ed8ed', 4, 7, 7, 1564104954, 362, 6);
INSERT INTO `pro_ratelimit` VALUES ('61df15d601e33f61abbe40669be3def0', 3, 6, 6, 1564105073, 648, 5);
INSERT INTO `pro_ratelimit` VALUES ('6d754dea11e6a00aae023369ecf76193', 1, 1, 1, 1564104021, 882, 0);
INSERT INTO `pro_ratelimit` VALUES ('72d5b0e1c11f50a23ccddb45d4298ad6', 1, 1, 1, 1564104890, 539, 0);
INSERT INTO `pro_ratelimit` VALUES ('7526c5d77f04ced79666136623bcbff1', 1, 5, 5, 1564104966, 26, 4);
INSERT INTO `pro_ratelimit` VALUES ('755ff8dd4062457365f125c628930c82', 1, 19, 19, 1564104967, 65, 18);
INSERT INTO `pro_ratelimit` VALUES ('767e95b74d1eba37209fe715ab31e848', 1, 1, 1, 1564604283, 654, 11);
INSERT INTO `pro_ratelimit` VALUES ('7b06e4a9a07e2953ee408431f9084c7c', 1, 32, 32, 1564104896, 499, 31);
INSERT INTO `pro_ratelimit` VALUES ('7c08aa981256b88d8c1b24851ff57288', 1, 4, 4, 1564104974, 259, 3);
INSERT INTO `pro_ratelimit` VALUES ('7fac303e57602a79acd57e30bfa89b09', 1, 1, 1, 1567408460, 772, 0);
INSERT INTO `pro_ratelimit` VALUES ('81d0c9c4c1808b279f417b20a0ac2f75', 1, 6, 6, 1564604596, 873, 50);
INSERT INTO `pro_ratelimit` VALUES ('827191927d65620b96941377dca7c751', 1, 1, 1, 1564103999, 732, 0);
INSERT INTO `pro_ratelimit` VALUES ('83db3e739e113f534e3d381ad4e1b2da', 3, 7, 7, 1564106378, 656, 6);
INSERT INTO `pro_ratelimit` VALUES ('88dbe1ad8264c6f930c6429aa3a8b474', 1, 1, 1, 1564104943, 571, 0);
INSERT INTO `pro_ratelimit` VALUES ('961561888cbd34aabc36457766eb1419', 1, 6, 154, 1564106479, 379, 153);
INSERT INTO `pro_ratelimit` VALUES ('9a39023e744ca99c44beb19191d64184', 2, 4, 9, 1564106594, 208, 8);
INSERT INTO `pro_ratelimit` VALUES ('a3b86a103750d9ad8abd56da0639eade', 2, 5, 5, 1564104954, 897, 4);
INSERT INTO `pro_ratelimit` VALUES ('a42ac89b406ef4f738aca7bea1061fef', 4, 16, 31, 1564106594, 673, 30);
INSERT INTO `pro_ratelimit` VALUES ('ae008f861500feed864fd7a9df75b148', 1, 1, 1, 1567408650, 611, 0);
INSERT INTO `pro_ratelimit` VALUES ('b40db04d9ab295b8cffac25e1834b412', 1, 1, 1, 1564604390, 87, 6);
INSERT INTO `pro_ratelimit` VALUES ('b63cd3ccbd09b2c6692a1a6291a5a3b2', 1, 2, 2, 1564604404, 131, 8);
INSERT INTO `pro_ratelimit` VALUES ('b81234d1418e64f01a3f87a42ad088cb', 2, 2, 2, 1564381726, 606, 148);
INSERT INTO `pro_ratelimit` VALUES ('bab6ae2bb7ecd6e4368232e6e98d5ace', 2, 4, 9, 1564106576, 986, 8);
INSERT INTO `pro_ratelimit` VALUES ('bd2fc11796bde2d0caae1b5544e8ef4c', 1, 5, 5, 1564104968, 565, 4);
INSERT INTO `pro_ratelimit` VALUES ('c2b9a9b804bdc6819e5da17a9343fb27', 1, 2, 2, 1564604404, 492, 8);
INSERT INTO `pro_ratelimit` VALUES ('c7598205308676bc19e88e3c1ee094d5', 1, 1, 1, 1567408514, 594, 0);
INSERT INTO `pro_ratelimit` VALUES ('cde6f6014b7d3d648df7f25e16448f15', 1, 2, 2, 1564104920, 53, 1);
INSERT INTO `pro_ratelimit` VALUES ('d7a6804e6d0a9c69ccf229db244ee757', 1, 2, 2, 1564604404, 379, 11);
INSERT INTO `pro_ratelimit` VALUES ('ea96822bd1326504f1204cd9a01f953e', 1, 9, 9, 1564104964, 746, 8);
INSERT INTO `pro_ratelimit` VALUES ('f68eff4481146f5b8505cce7e6af9e25', 2, 7, 13, 1564106594, 563, 12);
INSERT INTO `pro_ratelimit` VALUES ('f79d921330a8f6b863ce016d56857675', 1, 5, 5, 1564104967, 931, 4);
INSERT INTO `pro_ratelimit` VALUES ('f8035173571a170b34e8894f09af7a2c', 1, 1, 1, 1564604390, 201, 7);
INSERT INTO `pro_ratelimit` VALUES ('f9743355ea239a7dbb2f28fd1fcc681c', 1, 2, 2, 1567408682, 876, 1);
INSERT INTO `pro_ratelimit` VALUES ('fc164bc39169199272cdfb44b6ec80a2', 1, 4, 4, 1564104964, 225, 3);

-- ----------------------------
-- Table structure for pro_session
-- ----------------------------
DROP TABLE IF EXISTS `pro_session`;
CREATE TABLE `pro_session`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) UNSIGNED NOT NULL,
  `scode` char(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `clienttype` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `clientapp` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stoken` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `clientinfo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `online` tinyint(1) NULL DEFAULT 1,
  `loginip` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `u`(`userid`, `clienttype`) USING BTREE,
  INDEX `u1`(`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1687 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pro_session
-- ----------------------------
INSERT INTO `pro_session` VALUES (1, 61433, '5d135a1b5476b', 'mp', NULL, NULL, NULL, 1, '1.204.113.43', '2019-06-26 19:42:19');
INSERT INTO `pro_session` VALUES (5, 58827, '5d300f0641529', 'mp', NULL, NULL, NULL, 1, '111.121.70.11', '2019-07-18 14:17:42');
INSERT INTO `pro_session` VALUES (6, 61427, '5d0dca88de407', 'pc', NULL, NULL, NULL, 1, '111.121.79.17', '2019-06-22 14:28:24');
INSERT INTO `pro_session` VALUES (8, 48225, '5d3fa0428d318', 'pc', NULL, NULL, NULL, 1, '192.168.1.164', '2019-07-30 09:41:22');
INSERT INTO `pro_session` VALUES (17, 61427, '5d25a4419509b', 'mp', NULL, NULL, NULL, 1, '114.135.188.222', '2019-07-10 16:39:29');
INSERT INTO `pro_session` VALUES (23, 61427, '5cd5b7b0bee80', 'mobile', NULL, NULL, NULL, 1, '111.121.47.147', '2019-05-11 01:41:04');
INSERT INTO `pro_session` VALUES (24, 61426, '5d3512678fae5', 'mp', NULL, NULL, NULL, 1, '223.104.96.184', '2019-07-22 09:33:27');
INSERT INTO `pro_session` VALUES (27, 45202, '5cee3205e0c34', 'mp', NULL, NULL, NULL, 1, '111.121.77.141', '2019-05-29 15:17:25');
INSERT INTO `pro_session` VALUES (37, 2, '5d107ede79975', 'yee', NULL, NULL, NULL, 1, '1.204.118.229', '2019-06-24 15:42:22');
INSERT INTO `pro_session` VALUES (77, 63489, '5d3a52847034c', 'pc', NULL, NULL, NULL, 1, '1.204.116.96', '2019-07-26 09:08:20');
INSERT INTO `pro_session` VALUES (79, 4, '5d3578239cca8', 'yee', 'android', '', NULL, 1, '123.147.246.51', '2019-07-22 16:47:31');
INSERT INTO `pro_session` VALUES (171, 63700, '5d3907042df57', 'mp', NULL, NULL, NULL, 1, '117.187.225.131', '2019-07-25 09:33:55');
INSERT INTO `pro_session` VALUES (238, 5, '5d395255a226a', 'yee', 'ios', NULL, NULL, 1, '1.204.116.96', '2019-07-25 14:55:17');
INSERT INTO `pro_session` VALUES (271, 7, '5d3a5f624e7a4', 'yee', 'android', '18071adc0375c67f4e0', NULL, 1, '1.204.116.96', '2019-07-26 10:03:14');
INSERT INTO `pro_session` VALUES (626, 58274, '5d351d324d0fb', 'mp', NULL, NULL, NULL, 1, '1.204.112.77', '2019-07-22 10:19:29');
INSERT INTO `pro_session` VALUES (757, 65877, '5d1c847237ec9', 'mp', NULL, NULL, NULL, 1, '1.204.117.100', '2019-07-03 18:33:21');
INSERT INTO `pro_session` VALUES (868, 48981, '5d36d36fb9a34', 'mp', NULL, NULL, NULL, 1, '111.121.72.6', '2019-07-23 17:29:19');
INSERT INTO `pro_session` VALUES (869, 8, '5d3132e61752e', 'yee', 'android', '', NULL, 1, '114.135.241.52', '2019-07-19 11:03:01');
INSERT INTO `pro_session` VALUES (870, 60452, '5d391e1b60ea8', 'mp', NULL, NULL, NULL, 1, '117.187.225.131', '2019-07-25 11:12:27');
INSERT INTO `pro_session` VALUES (890, 58256, '5d1ebbf9595ac', 'mp', NULL, NULL, NULL, 1, '223.104.94.242', '2019-07-05 10:54:49');
INSERT INTO `pro_session` VALUES (1015, 9, '5d3a5cb0ba45a', 'yee', 'android', '', NULL, 1, '114.135.173.69', '2019-07-26 09:51:44');
INSERT INTO `pro_session` VALUES (1173, 10, '5d244b78aef08', 'yee', 'android', '100d855909325c4fb64', NULL, 1, '1.204.114.21', '2019-07-09 16:08:24');
INSERT INTO `pro_session` VALUES (1242, 11, '5d3a5eef0eabd', 'yee', 'android', '', NULL, 1, '114.135.173.69', '2019-07-26 10:01:18');
INSERT INTO `pro_session` VALUES (1243, 63489, '5d3a590652674', 'mp', NULL, NULL, NULL, 1, '114.135.173.69', '2019-07-26 09:36:06');
INSERT INTO `pro_session` VALUES (1247, 13, '5d25a856e97bf', 'yee', 'android', '', NULL, 1, '1.204.112.147', '2019-07-10 16:56:54');
INSERT INTO `pro_session` VALUES (1260, 69832, '5d39648dbb5f7', 'mp', NULL, NULL, NULL, 1, '114.135.244.185', '2019-07-25 16:13:01');
INSERT INTO `pro_session` VALUES (1290, 63489, '5d33d4d900863', 'mobile', NULL, NULL, NULL, 1, '111.121.44.249', '2019-07-21 10:58:32');
INSERT INTO `pro_session` VALUES (1362, 64077, '5d3955907826c', 'mp', NULL, NULL, NULL, 1, '150.138.181.167', '2019-07-25 15:09:04');
INSERT INTO `pro_session` VALUES (1402, 6, '5d2eecf591f88', 'yee', 'ios', NULL, NULL, 1, '114.135.209.57', '2019-07-17 17:40:05');
INSERT INTO `pro_session` VALUES (1432, 29, '5d36cfc209561', 'yee', 'android', '', NULL, 1, '117.187.225.131', '2019-07-23 17:13:37');
INSERT INTO `pro_session` VALUES (1434, 43, '5d3a5ec3c4803', 'yee', 'android', '', NULL, 1, '114.135.173.69', '2019-07-26 10:00:35');
INSERT INTO `pro_session` VALUES (1435, 45, '5d3a5eb259264', 'yee', 'android', '', NULL, 1, '114.135.173.69', '2019-07-26 10:00:18');
INSERT INTO `pro_session` VALUES (1455, 46, '5d3962066e967', 'yee', 'android', '160a3797c87da947d31', NULL, 1, '106.43.217.131', '2019-07-25 16:02:14');
INSERT INTO `pro_session` VALUES (1509, 68797, '5d33cd3aabeab', 'mp', NULL, NULL, NULL, 1, '111.121.44.249', '2019-07-21 10:26:02');
INSERT INTO `pro_session` VALUES (1599, 47, '5d3a5ed78240f', 'yee', 'android', '', NULL, 1, '114.135.173.69', '2019-07-26 10:00:55');
INSERT INTO `pro_session` VALUES (1604, 48, '5d36a32ac9afe', 'yee', 'android', '', NULL, 1, '106.108.27.44', '2019-07-23 14:03:22');
INSERT INTO `pro_session` VALUES (1652, 52529, '5d394bf836f34', 'pc', NULL, NULL, NULL, 1, '1.204.116.96', '2019-07-25 14:28:08');
INSERT INTO `pro_session` VALUES (1667, 49, '5d394e725c1bb', 'yee', 'android', '100d85590933937bab3', NULL, 1, '114.135.176.218', '2019-07-25 14:38:42');
INSERT INTO `pro_session` VALUES (1668, 50, '5d3a5dec471d5', 'yee', 'android', '1507bfd3f7b2ef99929', NULL, 1, '114.135.173.69', '2019-07-26 09:57:00');
INSERT INTO `pro_session` VALUES (1669, 51, '5d395c0bcde75', 'yee', 'ios', '161a3797c87f254e347', NULL, 1, '114.135.244.185', '2019-07-25 15:36:43');
INSERT INTO `pro_session` VALUES (1686, 52529, '5d39688ca91cc', 'mp', NULL, NULL, NULL, 1, '106.43.217.131', '2019-07-25 16:30:04');

-- ----------------------------
-- Table structure for pro_smscode
-- ----------------------------
DROP TABLE IF EXISTS `pro_smscode`;
CREATE TABLE `pro_smscode`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tel` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `code` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '验证码',
  `sendtime` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '发送时间',
  `errorcount` tinyint(2) UNSIGNED NULL DEFAULT 0 COMMENT '错误次数',
  `hour_fc` tinyint(2) UNSIGNED NULL DEFAULT 0 COMMENT '时级限制',
  `day_fc` tinyint(2) UNSIGNED NULL DEFAULT 0 COMMENT '天级限制',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tel`(`tel`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '短信验证码' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pro_smscode
-- ----------------------------
INSERT INTO `pro_smscode` VALUES (1, '17621094331', '0281', 1562294654, 0, 2, 2);
INSERT INTO `pro_smscode` VALUES (2, '15285642781', '263540', 1560335022, 0, 1, 1);
INSERT INTO `pro_smscode` VALUES (6, '13522988364', '3545', 1562665629, 0, 1, 1);
INSERT INTO `pro_smscode` VALUES (8, '15285064461', '7622', 1562915823, 1, 1, 1);
INSERT INTO `pro_smscode` VALUES (9, '17784900891', '0187', 1563776733, 0, 1, 1);
INSERT INTO `pro_smscode` VALUES (10, '12345678900', '3288', 1563345273, 0, 1, 1);
INSERT INTO `pro_smscode` VALUES (11, '18784900891', '5737', 1563503535, 0, 1, 1);
INSERT INTO `pro_smscode` VALUES (12, '18202397593', '0900', 1563624995, 1, 1, 1);
INSERT INTO `pro_smscode` VALUES (14, '18623663270', '0892', 1564024905, 0, 1, 1);

-- ----------------------------
-- Table structure for pro_trades
-- ----------------------------
DROP TABLE IF EXISTS `pro_trades`;
CREATE TABLE `pro_trades`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `platform` tinyint(3) UNSIGNED NULL DEFAULT NULL COMMENT '平台代码',
  `trade_no` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易号',
  `money` mediumint(8) UNSIGNED NULL DEFAULT NULL COMMENT '交易金额分',
  `type` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '1:充值 2:消费',
  `uid` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '用户ID',
  `createtime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `trade_no`(`platform`, `trade_no`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 425 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '交易记录表' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of pro_trades
-- ----------------------------
INSERT INTO `pro_trades` VALUES (1, 3, '2019051017451427', 3, 2, 61427, '2019-05-10 18:18:01');
INSERT INTO `pro_trades` VALUES (2, 3, '2019051003461427', 2, 2, 61427, '2019-05-10 20:44:46');
INSERT INTO `pro_trades` VALUES (3, 3, '2019051016971427', 2, 1, 61427, '2019-05-10 20:45:19');
INSERT INTO `pro_trades` VALUES (4, 3, '2019051165381427', 20, 2, 61427, '2019-05-11 01:44:41');
INSERT INTO `pro_trades` VALUES (5, 3, '2019062743723700', 1, 1, 63700, '2019-06-27 19:33:58');
INSERT INTO `pro_trades` VALUES (6, 3, '2019062770423700', 1, 1, 63700, '2019-06-27 19:42:21');
INSERT INTO `pro_trades` VALUES (7, 3, '2019062795363700', 1, 1, 63700, '2019-06-27 19:44:19');
INSERT INTO `pro_trades` VALUES (8, 3, '2019062794883700', 1, 1, 63700, '2019-06-27 19:45:19');
INSERT INTO `pro_trades` VALUES (9, 3, '2019062803483700', 1, 1, 63700, '2019-06-28 14:46:30');
INSERT INTO `pro_trades` VALUES (10, 3, '2019062891343700', 1, 1, 63700, '2019-06-28 14:47:16');
INSERT INTO `pro_trades` VALUES (11, 3, '2019062855973700', 1, 1, 63700, '2019-06-28 14:47:22');
INSERT INTO `pro_trades` VALUES (12, 3, '2019062843703700', 1, 1, 63700, '2019-06-28 14:47:28');
INSERT INTO `pro_trades` VALUES (13, 3, '2019062850203700', 1, 1, 63700, '2019-06-28 14:47:34');
INSERT INTO `pro_trades` VALUES (14, 3, '2019062881383700', 1, 1, 63700, '2019-06-28 14:47:53');
INSERT INTO `pro_trades` VALUES (15, 3, '2019062834883700', 1, 1, 63700, '2019-06-28 15:52:37');
INSERT INTO `pro_trades` VALUES (16, 3, '2019062829293700', 1, 1, 63700, '2019-06-28 15:52:49');
INSERT INTO `pro_trades` VALUES (17, 3, '2019062842673700', 1, 1, 63700, '2019-06-28 15:53:08');
INSERT INTO `pro_trades` VALUES (18, 3, '2019062865993700', 1, 1, 63700, '2019-06-28 15:53:39');
INSERT INTO `pro_trades` VALUES (19, 3, '2019062816903700', 1, 1, 63700, '2019-06-28 15:54:21');
INSERT INTO `pro_trades` VALUES (20, 3, '2019062878343700', 1, 1, 63700, '2019-06-28 15:55:54');
INSERT INTO `pro_trades` VALUES (21, 3, '2019070138913700', 1, 1, 63700, '2019-07-01 16:47:21');
INSERT INTO `pro_trades` VALUES (22, 3, '2019070233263700', 10, 1, 63700, '2019-07-02 15:36:35');
INSERT INTO `pro_trades` VALUES (23, 3, '2019070211583700', 30, 1, 63700, '2019-07-02 15:41:58');
INSERT INTO `pro_trades` VALUES (24, 3, '2019070232783700', 10, 1, 63700, '2019-07-02 16:09:21');
INSERT INTO `pro_trades` VALUES (25, 3, '2019070254533700', 10, 1, 63700, '2019-07-02 16:52:40');
INSERT INTO `pro_trades` VALUES (26, 3, '2019070269113700', 30, 1, 63700, '2019-07-02 17:52:50');
INSERT INTO `pro_trades` VALUES (27, 3, '2019070264913700', 10, 1, 63700, '2019-07-02 18:11:07');
INSERT INTO `pro_trades` VALUES (28, 3, '2019070210343700', 10, 1, 63700, '2019-07-02 18:11:25');
INSERT INTO `pro_trades` VALUES (29, 3, '2019070504848981', 10, 2, 48981, '2019-07-05 10:50:43');
INSERT INTO `pro_trades` VALUES (30, 3, '2019070500680452', 1, 2, 60452, '2019-07-05 10:50:56');
INSERT INTO `pro_trades` VALUES (31, 3, '2019070502148981', 1, 2, 48981, '2019-07-05 10:52:04');
INSERT INTO `pro_trades` VALUES (32, 3, '2019070569590452', 3, 2, 60452, '2019-07-05 10:57:18');
INSERT INTO `pro_trades` VALUES (33, 3, '2019070527410452', 2, 2, 60452, '2019-07-05 11:32:45');
INSERT INTO `pro_trades` VALUES (34, 3, '2019070534028981', 2, 2, 48981, '2019-07-05 14:55:10');
INSERT INTO `pro_trades` VALUES (35, 3, '2019070543138981', 10, 2, 48981, '2019-07-05 15:02:06');
INSERT INTO `pro_trades` VALUES (36, 3, '2019070557798981', 1, 2, 48981, '2019-07-05 15:02:32');
INSERT INTO `pro_trades` VALUES (37, 3, '2019070541628981', 1, 2, 48981, '2019-07-05 16:10:46');
INSERT INTO `pro_trades` VALUES (38, 3, '2019070597080452', 1, 2, 60452, '2019-07-05 16:15:10');
INSERT INTO `pro_trades` VALUES (39, 3, '2019070569678981', 1, 2, 48981, '2019-07-05 16:22:37');
INSERT INTO `pro_trades` VALUES (40, 3, '2019070586698981', 1, 2, 48981, '2019-07-05 16:27:36');
INSERT INTO `pro_trades` VALUES (41, 3, '2019070525890452', 1, 2, 60452, '2019-07-05 16:27:37');
INSERT INTO `pro_trades` VALUES (42, 3, '2019070522978981', 1, 2, 48981, '2019-07-05 16:32:52');
INSERT INTO `pro_trades` VALUES (43, 3, '2019070549738981', 1, 2, 48981, '2019-07-05 16:35:39');
INSERT INTO `pro_trades` VALUES (44, 3, '2019070546118981', 1, 2, 48981, '2019-07-05 16:38:01');
INSERT INTO `pro_trades` VALUES (45, 3, '2019070529970452', 1, 2, 60452, '2019-07-05 16:42:24');
INSERT INTO `pro_trades` VALUES (46, 3, '2019070536438981', 1, 2, 48981, '2019-07-05 16:45:04');
INSERT INTO `pro_trades` VALUES (47, 3, '2019070591858981', 2, 2, 48981, '2019-07-05 16:46:38');
INSERT INTO `pro_trades` VALUES (48, 3, '2019070551238981', 1, 2, 48981, '2019-07-05 16:53:44');
INSERT INTO `pro_trades` VALUES (49, 3, '2019070541698981', 1, 2, 48981, '2019-07-05 17:02:45');
INSERT INTO `pro_trades` VALUES (50, 3, '2019070550058981', 1, 2, 48981, '2019-07-05 17:13:30');
INSERT INTO `pro_trades` VALUES (51, 3, '2019070562850452', 1, 2, 60452, '2019-07-05 18:56:17');
INSERT INTO `pro_trades` VALUES (52, 3, '2019070537570452', 1, 2, 60452, '2019-07-05 19:12:42');
INSERT INTO `pro_trades` VALUES (53, 3, '2019070595780452', 1, 2, 60452, '2019-07-05 19:21:21');
INSERT INTO `pro_trades` VALUES (54, 3, '2019070565480452', 3, 2, 60452, '2019-07-05 19:22:42');
INSERT INTO `pro_trades` VALUES (55, 3, '2019070506600452', 1, 2, 60452, '2019-07-05 20:24:55');
INSERT INTO `pro_trades` VALUES (56, 3, '2019070661000452', 1, 2, 60452, '2019-07-06 11:11:21');
INSERT INTO `pro_trades` VALUES (57, 3, '2019070675760452', 10, 2, 60452, '2019-07-06 11:38:34');
INSERT INTO `pro_trades` VALUES (58, 3, '2019070600100452', 3, 2, 60452, '2019-07-06 11:39:18');
INSERT INTO `pro_trades` VALUES (59, 3, '2019070638610452', 3, 2, 60452, '2019-07-06 11:40:35');
INSERT INTO `pro_trades` VALUES (60, 3, '2019070611550452', 1, 2, 60452, '2019-07-06 14:54:15');
INSERT INTO `pro_trades` VALUES (61, 3, '2019070845360452', 1, 2, 60452, '2019-07-08 11:15:40');
INSERT INTO `pro_trades` VALUES (62, 3, '2019070864460452', 1, 2, 60452, '2019-07-08 11:29:14');
INSERT INTO `pro_trades` VALUES (63, 3, '2019070850730452', 10, 2, 60452, '2019-07-08 11:29:59');
INSERT INTO `pro_trades` VALUES (64, 3, '2019070831750452', 1, 2, 60452, '2019-07-08 11:30:42');
INSERT INTO `pro_trades` VALUES (65, 3, '2019070885060452', 1, 2, 60452, '2019-07-08 11:31:33');
INSERT INTO `pro_trades` VALUES (66, 3, '2019070854330452', 1, 2, 60452, '2019-07-08 11:35:43');
INSERT INTO `pro_trades` VALUES (67, 3, '2019070832040452', 1, 2, 60452, '2019-07-08 11:36:34');
INSERT INTO `pro_trades` VALUES (68, 3, '2019070813750452', 1, 2, 60452, '2019-07-08 11:39:47');
INSERT INTO `pro_trades` VALUES (69, 3, '2019070869700452', 1, 2, 60452, '2019-07-08 11:41:49');
INSERT INTO `pro_trades` VALUES (70, 3, '2019070833370452', 1, 2, 60452, '2019-07-08 11:43:59');
INSERT INTO `pro_trades` VALUES (71, 3, '2019070802030452', 1, 2, 60452, '2019-07-08 11:45:57');
INSERT INTO `pro_trades` VALUES (72, 3, '2019070806500452', 1, 2, 60452, '2019-07-08 11:48:10');
INSERT INTO `pro_trades` VALUES (73, 3, '2019070864470452', 1, 2, 60452, '2019-07-08 11:52:17');
INSERT INTO `pro_trades` VALUES (74, 3, '2019070844370452', 1, 2, 60452, '2019-07-08 13:44:13');
INSERT INTO `pro_trades` VALUES (75, 3, '2019071021223700', 10, 1, 63700, '2019-07-10 10:32:05');
INSERT INTO `pro_trades` VALUES (76, 3, '2019071057920452', 1, 2, 60452, '2019-07-10 14:41:53');
INSERT INTO `pro_trades` VALUES (77, 3, '2019071032070452', 1, 2, 60452, '2019-07-10 14:51:25');
INSERT INTO `pro_trades` VALUES (78, 3, '2019071064623489', 5, 2, 63489, '2019-07-10 16:55:20');
INSERT INTO `pro_trades` VALUES (79, 3, '2019071035273489', 20000, 2, 63489, '2019-07-10 16:55:46');
INSERT INTO `pro_trades` VALUES (80, 3, '2019071097103489', 20000, 1, 63489, '2019-07-10 17:02:56');
INSERT INTO `pro_trades` VALUES (81, 3, '2019071070373489', 5, 2, 63489, '2019-07-10 17:03:58');
INSERT INTO `pro_trades` VALUES (82, 3, '2019071024580452', 1, 2, 60452, '2019-07-10 17:06:27');
INSERT INTO `pro_trades` VALUES (83, 3, '2019071028733489', 5, 2, 63489, '2019-07-10 17:10:45');
INSERT INTO `pro_trades` VALUES (84, 3, '2019071062380452', 1, 2, 60452, '2019-07-10 17:23:06');
INSERT INTO `pro_trades` VALUES (85, 3, '2019071020710452', 1, 2, 60452, '2019-07-10 17:25:02');
INSERT INTO `pro_trades` VALUES (86, 3, '2019071002900452', 1, 2, 60452, '2019-07-10 17:26:14');
INSERT INTO `pro_trades` VALUES (87, 3, '2019071084030452', 1, 2, 60452, '2019-07-10 17:27:51');
INSERT INTO `pro_trades` VALUES (88, 3, '2019071052623489', 20000, 2, 63489, '2019-07-10 17:31:54');
INSERT INTO `pro_trades` VALUES (89, 3, '2019071002563489', 20000, 1, 63489, '2019-07-10 17:32:26');
INSERT INTO `pro_trades` VALUES (90, 3, '2019071046003489', 5, 2, 63489, '2019-07-10 17:32:51');
INSERT INTO `pro_trades` VALUES (91, 3, '2019071073713489', 5, 1, 63489, '2019-07-10 17:33:31');
INSERT INTO `pro_trades` VALUES (92, 3, '2019071005753489', 1, 2, 63489, '2019-07-10 17:33:59');
INSERT INTO `pro_trades` VALUES (93, 3, '2019071011010452', 1, 2, 60452, '2019-07-10 17:37:42');
INSERT INTO `pro_trades` VALUES (94, 3, '2019071081530452', 1, 2, 60452, '2019-07-10 17:42:58');
INSERT INTO `pro_trades` VALUES (95, 3, '2019071115140452', 1, 2, 60452, '2019-07-11 09:41:53');
INSERT INTO `pro_trades` VALUES (96, 3, '2019071169540452', 1, 1, 60452, '2019-07-11 09:48:09');
INSERT INTO `pro_trades` VALUES (97, 3, '2019071134580452', 1, 2, 60452, '2019-07-11 09:53:10');
INSERT INTO `pro_trades` VALUES (98, 3, '2019071128200452', 1, 1, 60452, '2019-07-11 09:54:06');
INSERT INTO `pro_trades` VALUES (99, 3, '2019071127380452', 1, 2, 60452, '2019-07-11 09:54:39');
INSERT INTO `pro_trades` VALUES (100, 3, '2019071146360452', 1, 1, 60452, '2019-07-11 10:10:43');
INSERT INTO `pro_trades` VALUES (101, 3, '2019071100230452', 1, 2, 60452, '2019-07-11 10:11:10');
INSERT INTO `pro_trades` VALUES (102, 3, '2019071100000452', 1, 2, 60452, '2019-07-11 10:12:06');
INSERT INTO `pro_trades` VALUES (103, 3, '2019071165480452', 2, 2, 60452, '2019-07-11 10:12:53');
INSERT INTO `pro_trades` VALUES (104, 3, '2019071103780452', 1, 2, 60452, '2019-07-11 10:17:25');
INSERT INTO `pro_trades` VALUES (105, 3, '2019071106460452', 1, 2, 60452, '2019-07-11 10:25:22');
INSERT INTO `pro_trades` VALUES (106, 3, '2019071155593489', 1, 1, 63489, '2019-07-11 11:45:29');
INSERT INTO `pro_trades` VALUES (107, 3, '2019071102680452', 1, 2, 60452, '2019-07-11 18:05:55');
INSERT INTO `pro_trades` VALUES (108, 3, '2019071116410452', 1, 2, 60452, '2019-07-11 18:06:44');
INSERT INTO `pro_trades` VALUES (109, 3, '2019071286100452', 1, 2, 60452, '2019-07-12 10:28:23');
INSERT INTO `pro_trades` VALUES (110, 3, '2019071205770452', 1, 2, 60452, '2019-07-12 10:28:48');
INSERT INTO `pro_trades` VALUES (111, 3, '2019071273953489', 5, 2, 63489, '2019-07-12 13:59:12');
INSERT INTO `pro_trades` VALUES (112, 3, '2019071208483489', 5, 1, 63489, '2019-07-12 14:04:21');
INSERT INTO `pro_trades` VALUES (113, 3, '2019071285173489', 2, 2, 63489, '2019-07-12 14:04:44');
INSERT INTO `pro_trades` VALUES (114, 3, '2019071282383489', 1, 2, 63489, '2019-07-12 14:34:20');
INSERT INTO `pro_trades` VALUES (115, 3, '2019071235293489', 1, 1, 63489, '2019-07-12 15:45:10');
INSERT INTO `pro_trades` VALUES (116, 3, '2019071210740452', 1, 2, 60452, '2019-07-12 16:14:00');
INSERT INTO `pro_trades` VALUES (117, 3, '2019071264719832', 1, 1, 69832, '2019-07-12 16:47:09');
INSERT INTO `pro_trades` VALUES (118, 3, '2019071280533489', 10000, 2, 63489, '2019-07-12 17:10:20');
INSERT INTO `pro_trades` VALUES (119, 3, '2019071277063489', 10000, 1, 63489, '2019-07-12 17:14:04');
INSERT INTO `pro_trades` VALUES (120, 3, '2019071236023489', 10000, 2, 63489, '2019-07-12 17:14:33');
INSERT INTO `pro_trades` VALUES (121, 3, '2019071250233489', 10000, 1, 63489, '2019-07-12 17:15:25');
INSERT INTO `pro_trades` VALUES (122, 3, '2019071231113489', 20000, 2, 63489, '2019-07-12 17:20:13');
INSERT INTO `pro_trades` VALUES (123, 3, '2019071217923489', 20000, 1, 63489, '2019-07-12 17:21:03');
INSERT INTO `pro_trades` VALUES (124, 3, '2019071265483489', 40000, 2, 63489, '2019-07-12 17:22:44');
INSERT INTO `pro_trades` VALUES (125, 3, '2019071298153489', 40000, 1, 63489, '2019-07-12 17:22:57');
INSERT INTO `pro_trades` VALUES (126, 3, '2019071364973489', 10000, 2, 63489, '2019-07-13 12:38:16');
INSERT INTO `pro_trades` VALUES (127, 3, '2019071326163489', 10000, 1, 63489, '2019-07-13 12:38:45');
INSERT INTO `pro_trades` VALUES (128, 3, '2019071454983489', 30000, 2, 63489, '2019-07-14 21:18:51');
INSERT INTO `pro_trades` VALUES (129, 3, '2019071400723489', 10000, 2, 63489, '2019-07-14 21:19:28');
INSERT INTO `pro_trades` VALUES (130, 3, '2019071585140452', 10000, 2, 60452, '2019-07-15 10:41:36');
INSERT INTO `pro_trades` VALUES (131, 3, '2019071524213489', 10000, 1, 63489, '2019-07-15 11:51:15');
INSERT INTO `pro_trades` VALUES (132, 3, '2019071577293489', 1, 1, 63489, '2019-07-15 12:00:41');
INSERT INTO `pro_trades` VALUES (133, 3, '2019071635193489', 10000, 2, 63489, '2019-07-16 09:16:53');
INSERT INTO `pro_trades` VALUES (134, 3, '2019071684523489', 30000, 2, 63489, '2019-07-16 09:19:03');
INSERT INTO `pro_trades` VALUES (135, 3, '2019071628413489', 30000, 1, 63489, '2019-07-16 09:26:07');
INSERT INTO `pro_trades` VALUES (136, 3, '2019071659313489', 20000, 2, 63489, '2019-07-16 09:50:17');
INSERT INTO `pro_trades` VALUES (137, 3, '2019071626993489', 20000, 1, 63489, '2019-07-16 09:50:59');
INSERT INTO `pro_trades` VALUES (138, 3, '2019071621820452', 10000, 2, 60452, '2019-07-16 09:51:56');
INSERT INTO `pro_trades` VALUES (139, 3, '2019071633913489', 2, 1, 63489, '2019-07-16 09:57:05');
INSERT INTO `pro_trades` VALUES (140, 3, '2019071688543489', 10000, 2, 63489, '2019-07-16 09:58:24');
INSERT INTO `pro_trades` VALUES (141, 3, '2019071683983489', 2, 1, 63489, '2019-07-16 10:11:13');
INSERT INTO `pro_trades` VALUES (142, 3, '2019071605843489', 10000, 2, 63489, '2019-07-16 10:11:42');
INSERT INTO `pro_trades` VALUES (143, 3, '2019071686313489', 10000, 1, 63489, '2019-07-16 10:13:35');
INSERT INTO `pro_trades` VALUES (144, 3, '2019071658653489', 30000, 2, 63489, '2019-07-16 11:56:34');
INSERT INTO `pro_trades` VALUES (145, 3, '2019071669913489', 30000, 1, 63489, '2019-07-16 11:57:52');
INSERT INTO `pro_trades` VALUES (146, 3, '2019071630220452', 1000, 2, 60452, '2019-07-16 11:58:47');
INSERT INTO `pro_trades` VALUES (147, 3, '2019071629653489', 20000, 2, 63489, '2019-07-16 11:58:48');
INSERT INTO `pro_trades` VALUES (148, 3, '2019071667603489', 20000, 1, 63489, '2019-07-16 11:59:05');
INSERT INTO `pro_trades` VALUES (149, 3, '2019071716723489', 20000, 2, 63489, '2019-07-17 14:01:40');
INSERT INTO `pro_trades` VALUES (150, 3, '2019071706653489', 20000, 1, 63489, '2019-07-17 14:02:06');
INSERT INTO `pro_trades` VALUES (151, 3, '2019071706203489', 20000, 2, 63489, '2019-07-17 14:02:27');
INSERT INTO `pro_trades` VALUES (152, 3, '2019071715183489', 20000, 2, 63489, '2019-07-17 14:48:12');
INSERT INTO `pro_trades` VALUES (153, 3, '2019071739613489', 8000, 2, 63489, '2019-07-17 15:47:39');
INSERT INTO `pro_trades` VALUES (154, 3, '2019071759204077', 20, 2, 64077, '2019-07-17 15:51:46');
INSERT INTO `pro_trades` VALUES (155, 3, '2019071783494077', 20, 1, 64077, '2019-07-17 15:51:58');
INSERT INTO `pro_trades` VALUES (156, 3, '2019071702604077', 2000, 2, 64077, '2019-07-17 15:52:16');
INSERT INTO `pro_trades` VALUES (157, 3, '2019071745484077', 2000, 1, 64077, '2019-07-17 15:52:26');
INSERT INTO `pro_trades` VALUES (158, 3, '2019071707324077', 2, 2, 64077, '2019-07-17 15:52:47');
INSERT INTO `pro_trades` VALUES (159, 3, '2019071792154077', 2, 1, 64077, '2019-07-17 15:53:14');
INSERT INTO `pro_trades` VALUES (160, 3, '2019071776754077', 1000, 2, 64077, '2019-07-17 15:54:13');
INSERT INTO `pro_trades` VALUES (161, 3, '2019071716954077', 1000, 1, 64077, '2019-07-17 15:54:51');
INSERT INTO `pro_trades` VALUES (162, 3, '2019071794474077', 1000, 2, 64077, '2019-07-17 15:55:02');
INSERT INTO `pro_trades` VALUES (163, 3, '2019071747974077', 1000, 1, 64077, '2019-07-17 15:56:41');
INSERT INTO `pro_trades` VALUES (164, 3, '2019071751804077', 2, 2, 64077, '2019-07-17 15:56:57');
INSERT INTO `pro_trades` VALUES (165, 3, '2019071792704077', 2, 1, 64077, '2019-07-17 15:57:12');
INSERT INTO `pro_trades` VALUES (166, 3, '2019071756094077', 2, 2, 64077, '2019-07-17 16:00:52');
INSERT INTO `pro_trades` VALUES (167, 3, '2019071752744077', 2, 1, 64077, '2019-07-17 16:01:46');
INSERT INTO `pro_trades` VALUES (168, 3, '2019071748804077', 2, 2, 64077, '2019-07-17 16:01:59');
INSERT INTO `pro_trades` VALUES (169, 3, '2019071725234077', 2, 1, 64077, '2019-07-17 16:02:07');
INSERT INTO `pro_trades` VALUES (170, 3, '2019071786174077', 1000, 2, 64077, '2019-07-17 16:02:42');
INSERT INTO `pro_trades` VALUES (171, 3, '2019071739984077', 1000, 1, 64077, '2019-07-17 16:07:03');
INSERT INTO `pro_trades` VALUES (172, 3, '2019071729514077', 10, 2, 64077, '2019-07-17 16:07:16');
INSERT INTO `pro_trades` VALUES (173, 3, '2019071713754077', 10, 1, 64077, '2019-07-17 16:10:46');
INSERT INTO `pro_trades` VALUES (174, 3, '2019071791864077', 2, 2, 64077, '2019-07-17 16:11:06');
INSERT INTO `pro_trades` VALUES (175, 3, '2019071777394077', 2, 1, 64077, '2019-07-17 16:12:54');
INSERT INTO `pro_trades` VALUES (176, 3, '2019071767074077', 2, 2, 64077, '2019-07-17 16:20:06');
INSERT INTO `pro_trades` VALUES (177, 3, '2019071734074077', 2, 1, 64077, '2019-07-17 16:20:22');
INSERT INTO `pro_trades` VALUES (178, 3, '2019071736814077', 1000, 2, 64077, '2019-07-17 16:23:37');
INSERT INTO `pro_trades` VALUES (179, 3, '2019071722504077', 1000, 1, 64077, '2019-07-17 16:23:56');
INSERT INTO `pro_trades` VALUES (180, 3, '2019071728304077', 1000, 2, 64077, '2019-07-17 16:25:18');
INSERT INTO `pro_trades` VALUES (181, 3, '2019071728674077', 1000, 1, 64077, '2019-07-17 16:26:08');
INSERT INTO `pro_trades` VALUES (182, 3, '2019071769954077', 1000, 2, 64077, '2019-07-17 16:27:38');
INSERT INTO `pro_trades` VALUES (183, 3, '2019071779714077', 1000, 1, 64077, '2019-07-17 16:27:57');
INSERT INTO `pro_trades` VALUES (184, 3, '2019071762144077', 1000, 2, 64077, '2019-07-17 16:28:12');
INSERT INTO `pro_trades` VALUES (185, 3, '2019071757554077', 1000, 1, 64077, '2019-07-17 16:32:11');
INSERT INTO `pro_trades` VALUES (186, 3, '2019071754964077', 1000, 2, 64077, '2019-07-17 16:32:25');
INSERT INTO `pro_trades` VALUES (187, 3, '2019071726874077', 1000, 1, 64077, '2019-07-17 16:32:38');
INSERT INTO `pro_trades` VALUES (188, 3, '2019071768294077', 1000, 2, 64077, '2019-07-17 16:32:49');
INSERT INTO `pro_trades` VALUES (189, 3, '2019071728204077', 1000, 1, 64077, '2019-07-17 16:33:54');
INSERT INTO `pro_trades` VALUES (190, 3, '2019071720364077', 1000, 2, 64077, '2019-07-17 16:34:09');
INSERT INTO `pro_trades` VALUES (191, 3, '2019071767904077', 1000, 1, 64077, '2019-07-17 16:34:59');
INSERT INTO `pro_trades` VALUES (192, 3, '2019071792754077', 1000, 2, 64077, '2019-07-17 16:36:46');
INSERT INTO `pro_trades` VALUES (193, 3, '2019071715233489', 1000, 2, 63489, '2019-07-17 16:52:57');
INSERT INTO `pro_trades` VALUES (194, 3, '2019071792753489', 1000, 2, 63489, '2019-07-17 16:56:34');
INSERT INTO `pro_trades` VALUES (195, 3, '2019071737003489', 1000, 2, 63489, '2019-07-17 17:00:11');
INSERT INTO `pro_trades` VALUES (196, 3, '2019071761793489', 1000, 1, 63489, '2019-07-17 17:05:21');
INSERT INTO `pro_trades` VALUES (197, 3, '2019071715403489', 1000, 2, 63489, '2019-07-17 17:05:40');
INSERT INTO `pro_trades` VALUES (198, 3, '2019071775513489', 1000, 1, 63489, '2019-07-17 17:06:44');
INSERT INTO `pro_trades` VALUES (199, 3, '2019071771133489', 1000, 2, 63489, '2019-07-17 17:06:55');
INSERT INTO `pro_trades` VALUES (200, 3, '2019071792353489', 1000, 2, 63489, '2019-07-17 17:10:18');
INSERT INTO `pro_trades` VALUES (201, 3, '2019071708263489', 1000, 1, 63489, '2019-07-17 17:22:08');
INSERT INTO `pro_trades` VALUES (202, 3, '2019071759663489', 2000, 2, 63489, '2019-07-17 17:22:35');
INSERT INTO `pro_trades` VALUES (203, 3, '2019071779544077', 1000, 2, 64077, '2019-07-17 17:25:04');
INSERT INTO `pro_trades` VALUES (204, 3, '2019071742473489', 5000, 2, 63489, '2019-07-17 17:41:18');
INSERT INTO `pro_trades` VALUES (205, 3, '2019071705373489', 5000, 2, 63489, '2019-07-17 17:41:22');
INSERT INTO `pro_trades` VALUES (206, 3, '2019071775403489', 5000, 1, 63489, '2019-07-17 17:45:26');
INSERT INTO `pro_trades` VALUES (207, 3, '2019071788113489', 5000, 2, 63489, '2019-07-17 17:45:53');
INSERT INTO `pro_trades` VALUES (208, 3, '2019071743663489', 5000, 1, 63489, '2019-07-17 17:46:30');
INSERT INTO `pro_trades` VALUES (209, 3, '2019071796943489', 5000, 2, 63489, '2019-07-17 17:47:05');
INSERT INTO `pro_trades` VALUES (210, 3, '2019071704693489', 5000, 1, 63489, '2019-07-17 17:47:57');
INSERT INTO `pro_trades` VALUES (211, 3, '2019071729203489', 2000, 2, 63489, '2019-07-17 17:48:23');
INSERT INTO `pro_trades` VALUES (212, 3, '2019071796443489', 2000, 1, 63489, '2019-07-17 17:49:12');
INSERT INTO `pro_trades` VALUES (213, 3, '2019071742983489', 1000, 2, 63489, '2019-07-17 17:49:29');
INSERT INTO `pro_trades` VALUES (214, 3, '2019071745453489', 1, 1, 63489, '2019-07-17 23:27:19');
INSERT INTO `pro_trades` VALUES (215, 3, '2019071814420452', 2, 2, 60452, '2019-07-18 14:12:54');
INSERT INTO `pro_trades` VALUES (216, 3, '2019071856850452', 2, 2, 60452, '2019-07-18 14:13:55');
INSERT INTO `pro_trades` VALUES (217, 3, '2019071804450452', 2, 2, 60452, '2019-07-18 14:16:47');
INSERT INTO `pro_trades` VALUES (218, 3, '2019071892600452', 2, 2, 60452, '2019-07-18 14:17:36');
INSERT INTO `pro_trades` VALUES (219, 3, '2019071986290452', 1000, 2, 60452, '2019-07-19 11:19:06');
INSERT INTO `pro_trades` VALUES (220, 3, '2019071970060452', 1000, 1, 60452, '2019-07-19 11:58:06');
INSERT INTO `pro_trades` VALUES (221, 3, '2019071914340452', 2, 2, 60452, '2019-07-19 12:02:56');
INSERT INTO `pro_trades` VALUES (222, 3, '2019071986100452', 2, 2, 60452, '2019-07-19 13:54:32');
INSERT INTO `pro_trades` VALUES (223, 3, '2019071961580452', 2, 2, 60452, '2019-07-19 13:56:18');
INSERT INTO `pro_trades` VALUES (224, 3, '2019071939570452', 2, 2, 60452, '2019-07-19 13:58:21');
INSERT INTO `pro_trades` VALUES (225, 3, '2019071910600452', 2, 2, 60452, '2019-07-19 14:07:47');
INSERT INTO `pro_trades` VALUES (226, 3, '2019071981220452', 2, 2, 60452, '2019-07-19 14:09:33');
INSERT INTO `pro_trades` VALUES (227, 3, '2019071907820452', 2, 2, 60452, '2019-07-19 14:16:48');
INSERT INTO `pro_trades` VALUES (228, 3, '2019071989380452', 2, 2, 60452, '2019-07-19 14:23:02');
INSERT INTO `pro_trades` VALUES (229, 3, '2019071964250452', 2, 2, 60452, '2019-07-19 14:26:10');
INSERT INTO `pro_trades` VALUES (230, 3, '2019071987740452', 2, 2, 60452, '2019-07-19 14:29:01');
INSERT INTO `pro_trades` VALUES (231, 3, '2019071925633489', 6, 2, 63489, '2019-07-19 15:31:14');
INSERT INTO `pro_trades` VALUES (232, 3, '2019071900813489', 6, 1, 63489, '2019-07-19 15:31:32');
INSERT INTO `pro_trades` VALUES (233, 3, '2019071964073489', 6, 2, 63489, '2019-07-19 15:40:33');
INSERT INTO `pro_trades` VALUES (234, 3, '2019071966543489', 6, 1, 63489, '2019-07-19 15:45:49');
INSERT INTO `pro_trades` VALUES (235, 3, '2019071963333489', 6, 2, 63489, '2019-07-19 15:46:08');
INSERT INTO `pro_trades` VALUES (236, 3, '2019071926173489', 6, 1, 63489, '2019-07-19 15:46:52');
INSERT INTO `pro_trades` VALUES (237, 3, '2019071961723489', 6, 2, 63489, '2019-07-19 15:47:11');
INSERT INTO `pro_trades` VALUES (238, 3, '2019071955303489', 6, 1, 63489, '2019-07-19 15:47:37');
INSERT INTO `pro_trades` VALUES (239, 3, '2019071989133489', 6, 2, 63489, '2019-07-19 15:47:56');
INSERT INTO `pro_trades` VALUES (240, 3, '2019071969843489', 6, 1, 63489, '2019-07-19 15:48:26');
INSERT INTO `pro_trades` VALUES (241, 3, '2019071999733489', 6, 2, 63489, '2019-07-19 15:50:32');
INSERT INTO `pro_trades` VALUES (242, 3, '2019071953983489', 6, 1, 63489, '2019-07-19 15:50:45');
INSERT INTO `pro_trades` VALUES (243, 3, '2019071972063489', 6, 2, 63489, '2019-07-19 15:51:00');
INSERT INTO `pro_trades` VALUES (244, 3, '2019071943633489', 6, 1, 63489, '2019-07-19 15:51:24');
INSERT INTO `pro_trades` VALUES (245, 3, '2019071934933489', 6, 2, 63489, '2019-07-19 15:51:37');
INSERT INTO `pro_trades` VALUES (246, 3, '2019071946103489', 6, 1, 63489, '2019-07-19 15:51:55');
INSERT INTO `pro_trades` VALUES (247, 3, '2019071982343489', 6, 2, 63489, '2019-07-19 15:52:07');
INSERT INTO `pro_trades` VALUES (248, 3, '2019071984653489', 6, 1, 63489, '2019-07-19 15:52:27');
INSERT INTO `pro_trades` VALUES (249, 3, '2019071927173489', 6, 2, 63489, '2019-07-19 15:52:48');
INSERT INTO `pro_trades` VALUES (250, 3, '2019071958408981', 2, 2, 48981, '2019-07-19 15:56:29');
INSERT INTO `pro_trades` VALUES (251, 3, '2019071936343489', 1000, 2, 63489, '2019-07-19 16:06:18');
INSERT INTO `pro_trades` VALUES (252, 3, '2019072028193489', 1, 1, 63489, '2019-07-20 15:44:48');
INSERT INTO `pro_trades` VALUES (253, 3, '2019072294040452', 2, 2, 60452, '2019-07-22 10:08:31');
INSERT INTO `pro_trades` VALUES (254, 3, '2019072214860452', 2, 1, 60452, '2019-07-22 10:20:16');
INSERT INTO `pro_trades` VALUES (255, 3, '2019072283460452', 2, 2, 60452, '2019-07-22 10:20:53');
INSERT INTO `pro_trades` VALUES (256, 3, '2019072296070452', 2, 1, 60452, '2019-07-22 10:26:11');
INSERT INTO `pro_trades` VALUES (257, 3, '2019072262580452', 2, 2, 60452, '2019-07-22 10:26:39');
INSERT INTO `pro_trades` VALUES (258, 3, '2019072262980452', 2, 1, 60452, '2019-07-22 10:27:19');
INSERT INTO `pro_trades` VALUES (259, 3, '2019072242260452', 2, 2, 60452, '2019-07-22 10:31:32');
INSERT INTO `pro_trades` VALUES (260, 3, '2019072281410452', 2, 1, 60452, '2019-07-22 10:32:11');
INSERT INTO `pro_trades` VALUES (261, 3, '2019072241920452', 2, 2, 60452, '2019-07-22 10:32:47');
INSERT INTO `pro_trades` VALUES (262, 3, '2019072237300452', 2, 1, 60452, '2019-07-22 10:33:14');
INSERT INTO `pro_trades` VALUES (263, 3, '2019072241430452', 2, 2, 60452, '2019-07-22 10:33:34');
INSERT INTO `pro_trades` VALUES (264, 3, '2019072284750452', 2, 1, 60452, '2019-07-22 10:34:39');
INSERT INTO `pro_trades` VALUES (265, 3, '2019072282770452', 2, 2, 60452, '2019-07-22 14:29:31');
INSERT INTO `pro_trades` VALUES (266, 3, '2019072288583489', 1000, 2, 63489, '2019-07-22 16:03:15');
INSERT INTO `pro_trades` VALUES (267, 3, '2019072238073489', 1000, 2, 63489, '2019-07-22 16:08:37');
INSERT INTO `pro_trades` VALUES (268, 3, '2019072236063489', 1000, 2, 63489, '2019-07-22 16:14:21');
INSERT INTO `pro_trades` VALUES (269, 3, '2019072293253489', 2000, 2, 63489, '2019-07-22 16:39:39');
INSERT INTO `pro_trades` VALUES (270, 3, '2019072290234077', 2000, 2, 64077, '2019-07-22 16:56:20');
INSERT INTO `pro_trades` VALUES (271, 3, '2019072249283489', 1000, 2, 63489, '2019-07-22 18:18:15');
INSERT INTO `pro_trades` VALUES (272, 3, '2019072237303489', 1000, 1, 63489, '2019-07-22 18:18:40');
INSERT INTO `pro_trades` VALUES (273, 3, '2019072238503489', 2000, 2, 63489, '2019-07-22 18:19:08');
INSERT INTO `pro_trades` VALUES (274, 3, '2019072205263489', 2000, 1, 63489, '2019-07-22 18:19:27');
INSERT INTO `pro_trades` VALUES (275, 3, '2019072291613489', 2000, 2, 63489, '2019-07-22 18:19:44');
INSERT INTO `pro_trades` VALUES (276, 3, '2019072208499832', 2006, 2, 69832, '2019-07-22 18:28:42');
INSERT INTO `pro_trades` VALUES (277, 3, '2019072249209832', 2006, 1, 69832, '2019-07-22 18:29:39');
INSERT INTO `pro_trades` VALUES (278, 3, '2019072231089832', 2006, 2, 69832, '2019-07-22 18:30:17');
INSERT INTO `pro_trades` VALUES (279, 3, '2019072277809832', 2006, 1, 69832, '2019-07-22 18:31:39');
INSERT INTO `pro_trades` VALUES (280, 3, '2019072224299832', 2006, 2, 69832, '2019-07-22 18:32:31');
INSERT INTO `pro_trades` VALUES (281, 3, '2019072272043489', 3000, 2, 63489, '2019-07-22 18:49:18');
INSERT INTO `pro_trades` VALUES (282, 3, '2019072201343489', 3000, 2, 63489, '2019-07-22 18:55:17');
INSERT INTO `pro_trades` VALUES (283, 3, '2019072204033489', 4000, 2, 63489, '2019-07-22 19:10:46');
INSERT INTO `pro_trades` VALUES (284, 3, '2019072251403489', 4000, 1, 63489, '2019-07-22 19:11:09');
INSERT INTO `pro_trades` VALUES (285, 3, '2019072239213489', 3000, 2, 63489, '2019-07-22 19:11:21');
INSERT INTO `pro_trades` VALUES (286, 3, '2019072243043489', 1000, 2, 63489, '2019-07-22 19:18:16');
INSERT INTO `pro_trades` VALUES (287, 3, '2019072206489832', 2000, 2, 69832, '2019-07-22 19:19:56');
INSERT INTO `pro_trades` VALUES (288, 3, '2019072277099832', 2000, 2, 69832, '2019-07-22 19:21:45');
INSERT INTO `pro_trades` VALUES (289, 3, '2019072227123489', 3000, 2, 63489, '2019-07-22 19:25:37');
INSERT INTO `pro_trades` VALUES (290, 3, '2019072288643489', 5, 1, 63489, '2019-07-22 19:46:58');
INSERT INTO `pro_trades` VALUES (291, 3, '2019072240403489', 5, 2, 63489, '2019-07-22 19:48:22');
INSERT INTO `pro_trades` VALUES (292, 3, '2019072224113489', 5, 1, 63489, '2019-07-22 19:50:17');
INSERT INTO `pro_trades` VALUES (293, 3, '2019072264123489', 5, 2, 63489, '2019-07-22 19:55:17');
INSERT INTO `pro_trades` VALUES (294, 3, '2019072257023489', 5, 1, 63489, '2019-07-22 19:55:40');
INSERT INTO `pro_trades` VALUES (295, 3, '2019072293403489', 5, 2, 63489, '2019-07-22 19:55:55');
INSERT INTO `pro_trades` VALUES (296, 3, '2019072251763489', 5, 1, 63489, '2019-07-22 19:56:52');
INSERT INTO `pro_trades` VALUES (297, 3, '2019072277233489', 3000, 2, 63489, '2019-07-22 19:57:03');
INSERT INTO `pro_trades` VALUES (298, 3, '2019072283793489', 3000, 1, 63489, '2019-07-22 19:57:23');
INSERT INTO `pro_trades` VALUES (299, 3, '2019072230883489', 2000, 2, 63489, '2019-07-22 19:58:20');
INSERT INTO `pro_trades` VALUES (300, 3, '2019072226313489', 2000, 1, 63489, '2019-07-22 19:58:36');
INSERT INTO `pro_trades` VALUES (301, 3, '2019072265343489', 5, 2, 63489, '2019-07-22 19:58:47');
INSERT INTO `pro_trades` VALUES (302, 3, '2019072229293489', 5, 1, 63489, '2019-07-22 19:58:55');
INSERT INTO `pro_trades` VALUES (303, 3, '2019072290023489', 2000, 2, 63489, '2019-07-22 19:59:13');
INSERT INTO `pro_trades` VALUES (304, 3, '2019072291103489', 2000, 1, 63489, '2019-07-22 19:59:25');
INSERT INTO `pro_trades` VALUES (305, 3, '2019072281163489', 3000, 2, 63489, '2019-07-22 19:59:41');
INSERT INTO `pro_trades` VALUES (306, 3, '2019072296463489', 3000, 1, 63489, '2019-07-22 19:59:49');
INSERT INTO `pro_trades` VALUES (307, 3, '2019072254963489', 8000, 2, 63489, '2019-07-22 20:07:21');
INSERT INTO `pro_trades` VALUES (308, 3, '2019072253703489', 8000, 2, 63489, '2019-07-22 20:10:09');
INSERT INTO `pro_trades` VALUES (309, 3, '2019072336303489', 5, 2, 63489, '2019-07-23 09:28:36');
INSERT INTO `pro_trades` VALUES (310, 3, '2019072389608981', 2, 2, 48981, '2019-07-23 09:48:27');
INSERT INTO `pro_trades` VALUES (311, 3, '2019072358513489', 5, 1, 63489, '2019-07-23 09:50:03');
INSERT INTO `pro_trades` VALUES (312, 3, '2019072397923489', 2, 1, 63489, '2019-07-23 09:52:27');
INSERT INTO `pro_trades` VALUES (313, 3, '2019072376720452', 2, 2, 60452, '2019-07-23 10:28:10');
INSERT INTO `pro_trades` VALUES (314, 3, '2019072397190452', 2, 1, 60452, '2019-07-23 10:31:22');
INSERT INTO `pro_trades` VALUES (315, 3, '2019072338690452', 2, 2, 60452, '2019-07-23 10:32:50');
INSERT INTO `pro_trades` VALUES (316, 3, '2019072311360452', 2, 1, 60452, '2019-07-23 10:37:22');
INSERT INTO `pro_trades` VALUES (317, 3, '2019072354190452', 5, 2, 60452, '2019-07-23 10:37:36');
INSERT INTO `pro_trades` VALUES (318, 3, '2019072343160452', 5, 1, 60452, '2019-07-23 10:38:16');
INSERT INTO `pro_trades` VALUES (319, 3, '2019072334850452', 5, 2, 60452, '2019-07-23 10:38:31');
INSERT INTO `pro_trades` VALUES (320, 3, '2019072331653489', 1005, 2, 63489, '2019-07-23 15:35:08');
INSERT INTO `pro_trades` VALUES (321, 3, '2019072314463489', 5, 2, 63489, '2019-07-23 15:55:05');
INSERT INTO `pro_trades` VALUES (322, 3, '2019072353313489', 2000, 2, 63489, '2019-07-23 16:18:56');
INSERT INTO `pro_trades` VALUES (323, 3, '2019072329533489', 2000, 2, 63489, '2019-07-23 16:55:10');
INSERT INTO `pro_trades` VALUES (324, 3, '2019072363023489', 2000, 1, 63489, '2019-07-23 16:56:30');
INSERT INTO `pro_trades` VALUES (325, 3, '2019072308493489', 5, 2, 63489, '2019-07-23 16:56:52');
INSERT INTO `pro_trades` VALUES (326, 3, '2019072336083489', 5, 1, 63489, '2019-07-23 16:57:04');
INSERT INTO `pro_trades` VALUES (327, 3, '2019072385243489', 5, 2, 63489, '2019-07-23 16:57:37');
INSERT INTO `pro_trades` VALUES (328, 3, '2019072374313489', 5, 1, 63489, '2019-07-23 16:57:56');
INSERT INTO `pro_trades` VALUES (329, 3, '2019072385513489', 5, 2, 63489, '2019-07-23 16:58:15');
INSERT INTO `pro_trades` VALUES (330, 3, '2019072328933489', 5, 1, 63489, '2019-07-23 16:58:41');
INSERT INTO `pro_trades` VALUES (331, 3, '2019072343913489', 5, 2, 63489, '2019-07-23 17:00:59');
INSERT INTO `pro_trades` VALUES (332, 3, '2019072368293489', 2000, 2, 63489, '2019-07-23 17:07:49');
INSERT INTO `pro_trades` VALUES (333, 3, '2019072318198981', 2, 2, 48981, '2019-07-23 17:29:18');
INSERT INTO `pro_trades` VALUES (334, 3, '2019072301379832', 5, 2, 69832, '2019-07-23 18:09:13');
INSERT INTO `pro_trades` VALUES (335, 3, '2019072363609832', 5, 1, 69832, '2019-07-23 18:10:22');
INSERT INTO `pro_trades` VALUES (336, 3, '2019072364299832', 5, 2, 69832, '2019-07-23 18:10:33');
INSERT INTO `pro_trades` VALUES (337, 3, '2019072334673489', 2000, 2, 63489, '2019-07-23 18:23:51');
INSERT INTO `pro_trades` VALUES (338, 3, '2019072397643489', 2000, 1, 63489, '2019-07-23 18:24:05');
INSERT INTO `pro_trades` VALUES (339, 3, '2019072397103489', 5, 2, 63489, '2019-07-23 18:24:34');
INSERT INTO `pro_trades` VALUES (340, 3, '2019072391833489', 5, 1, 63489, '2019-07-23 18:26:03');
INSERT INTO `pro_trades` VALUES (341, 3, '2019072363563489', 5, 2, 63489, '2019-07-23 18:26:17');
INSERT INTO `pro_trades` VALUES (342, 3, '2019072320203489', 5, 1, 63489, '2019-07-23 18:27:04');
INSERT INTO `pro_trades` VALUES (343, 3, '2019072308043489', 2000, 2, 63489, '2019-07-23 18:27:14');
INSERT INTO `pro_trades` VALUES (344, 3, '2019072345793489', 2000, 1, 63489, '2019-07-23 18:27:43');
INSERT INTO `pro_trades` VALUES (345, 3, '2019072380523489', 5, 2, 63489, '2019-07-23 18:28:06');
INSERT INTO `pro_trades` VALUES (346, 3, '2019072306843489', 5, 1, 63489, '2019-07-23 18:29:07');
INSERT INTO `pro_trades` VALUES (347, 3, '2019072387123489', 5, 2, 63489, '2019-07-23 18:29:26');
INSERT INTO `pro_trades` VALUES (348, 3, '2019072383833489', 5, 1, 63489, '2019-07-23 18:30:50');
INSERT INTO `pro_trades` VALUES (349, 3, '2019072338223489', 2000, 2, 63489, '2019-07-23 18:31:00');
INSERT INTO `pro_trades` VALUES (350, 3, '2019072374633489', 2000, 1, 63489, '2019-07-23 18:32:58');
INSERT INTO `pro_trades` VALUES (351, 3, '2019072378923489', 5, 2, 63489, '2019-07-23 18:33:11');
INSERT INTO `pro_trades` VALUES (352, 3, '2019072462683489', 2000, 2, 63489, '2019-07-24 09:22:00');
INSERT INTO `pro_trades` VALUES (353, 3, '2019072472859832', 2000, 2, 69832, '2019-07-24 09:23:00');
INSERT INTO `pro_trades` VALUES (354, 3, '2019072463543489', 8000, 2, 63489, '2019-07-24 10:11:55');
INSERT INTO `pro_trades` VALUES (355, 3, '2019072482823489', 4, 1, 63489, '2019-07-24 10:17:50');
INSERT INTO `pro_trades` VALUES (356, 3, '2019072435033489', 9000, 2, 63489, '2019-07-24 11:22:09');
INSERT INTO `pro_trades` VALUES (357, 3, '2019072477583489', 9000, 1, 63489, '2019-07-24 11:22:53');
INSERT INTO `pro_trades` VALUES (358, 3, '2019072452863489', 7000, 2, 63489, '2019-07-24 13:45:04');
INSERT INTO `pro_trades` VALUES (359, 3, '2019072455323489', 3000, 2, 63489, '2019-07-24 15:19:11');
INSERT INTO `pro_trades` VALUES (360, 3, '2019072464553489', 3000, 1, 63489, '2019-07-24 15:41:15');
INSERT INTO `pro_trades` VALUES (361, 3, '2019072497793489', 1, 1, 63489, '2019-07-24 16:22:23');
INSERT INTO `pro_trades` VALUES (362, 3, '2019072474419832', 1, 1, 69832, '2019-07-24 16:34:34');
INSERT INTO `pro_trades` VALUES (363, 3, '2019072483859832', 2000, 2, 69832, '2019-07-24 17:54:03');
INSERT INTO `pro_trades` VALUES (364, 3, '2019072411059832', 10000, 2, 69832, '2019-07-24 17:57:04');
INSERT INTO `pro_trades` VALUES (365, 3, '2019072483350452', 2, 2, 60452, '2019-07-24 18:20:44');
INSERT INTO `pro_trades` VALUES (366, 3, '2019072572613489', 2001, 2, 63489, '2019-07-25 09:08:44');
INSERT INTO `pro_trades` VALUES (367, 3, '2019072549629832', 1, 1, 69832, '2019-07-25 09:12:43');
INSERT INTO `pro_trades` VALUES (368, 3, '2019072513520452', 1, 2, 60452, '2019-07-25 10:28:55');
INSERT INTO `pro_trades` VALUES (369, 3, '2019072546320452', 1, 1, 60452, '2019-07-25 10:29:38');
INSERT INTO `pro_trades` VALUES (370, 3, '2019072543970452', 1, 2, 60452, '2019-07-25 10:29:54');
INSERT INTO `pro_trades` VALUES (371, 3, '2019072566210452', 1, 1, 60452, '2019-07-25 10:30:04');
INSERT INTO `pro_trades` VALUES (372, 3, '2019072517110452', 1, 2, 60452, '2019-07-25 10:30:22');
INSERT INTO `pro_trades` VALUES (373, 3, '2019072571800452', 1, 1, 60452, '2019-07-25 10:32:56');
INSERT INTO `pro_trades` VALUES (374, 3, '2019072563080452', 1, 2, 60452, '2019-07-25 10:33:09');
INSERT INTO `pro_trades` VALUES (375, 3, '2019072598500452', 1, 1, 60452, '2019-07-25 10:34:31');
INSERT INTO `pro_trades` VALUES (376, 3, '2019072599060452', 1, 2, 60452, '2019-07-25 10:36:28');
INSERT INTO `pro_trades` VALUES (377, 3, '2019072585980452', 1, 1, 60452, '2019-07-25 10:37:04');
INSERT INTO `pro_trades` VALUES (378, 3, '2019072509670452', 1, 2, 60452, '2019-07-25 10:38:17');
INSERT INTO `pro_trades` VALUES (379, 3, '2019072584843489', 5000, 2, 63489, '2019-07-25 10:43:50');
INSERT INTO `pro_trades` VALUES (380, 3, '2019072583823489', 5000, 1, 63489, '2019-07-25 10:45:36');
INSERT INTO `pro_trades` VALUES (381, 3, '2019072565103489', 5000, 2, 63489, '2019-07-25 10:45:45');
INSERT INTO `pro_trades` VALUES (382, 3, '2019072524083489', 5000, 1, 63489, '2019-07-25 10:45:56');
INSERT INTO `pro_trades` VALUES (383, 3, '2019072543993489', 5000, 2, 63489, '2019-07-25 10:47:17');
INSERT INTO `pro_trades` VALUES (384, 3, '2019072563483489', 5000, 1, 63489, '2019-07-25 10:48:14');
INSERT INTO `pro_trades` VALUES (385, 3, '2019072583343489', 5000, 2, 63489, '2019-07-25 10:48:25');
INSERT INTO `pro_trades` VALUES (386, 3, '2019072596603489', 5000, 1, 63489, '2019-07-25 10:48:39');
INSERT INTO `pro_trades` VALUES (387, 3, '2019072557323489', 5000, 2, 63489, '2019-07-25 10:49:06');
INSERT INTO `pro_trades` VALUES (388, 3, '2019072520953489', 5000, 1, 63489, '2019-07-25 10:49:31');
INSERT INTO `pro_trades` VALUES (389, 3, '2019072514403489', 5000, 2, 63489, '2019-07-25 10:49:41');
INSERT INTO `pro_trades` VALUES (390, 3, '2019072507613489', 5000, 1, 63489, '2019-07-25 10:49:58');
INSERT INTO `pro_trades` VALUES (391, 3, '2019072561253489', 5000, 2, 63489, '2019-07-25 10:52:07');
INSERT INTO `pro_trades` VALUES (392, 3, '2019072519233489', 5000, 1, 63489, '2019-07-25 10:54:04');
INSERT INTO `pro_trades` VALUES (393, 3, '2019072503883489', 5000, 2, 63489, '2019-07-25 10:54:20');
INSERT INTO `pro_trades` VALUES (394, 3, '2019072554053489', 5000, 1, 63489, '2019-07-25 10:54:35');
INSERT INTO `pro_trades` VALUES (395, 3, '2019072588000452', 1, 1, 60452, '2019-07-25 10:55:49');
INSERT INTO `pro_trades` VALUES (396, 3, '2019072585500452', 1, 2, 60452, '2019-07-25 10:56:08');
INSERT INTO `pro_trades` VALUES (397, 3, '2019072529730452', 1, 1, 60452, '2019-07-25 10:56:34');
INSERT INTO `pro_trades` VALUES (398, 3, '2019072591650452', 1, 2, 60452, '2019-07-25 10:58:25');
INSERT INTO `pro_trades` VALUES (399, 3, '2019072501710452', 1, 1, 60452, '2019-07-25 10:59:18');
INSERT INTO `pro_trades` VALUES (400, 3, '2019072533610452', 1, 2, 60452, '2019-07-25 11:00:02');
INSERT INTO `pro_trades` VALUES (401, 3, '2019072560900452', 1, 1, 60452, '2019-07-25 11:10:52');
INSERT INTO `pro_trades` VALUES (402, 3, '2019072533330452', 1, 2, 60452, '2019-07-25 11:11:32');
INSERT INTO `pro_trades` VALUES (403, 3, '2019072583600452', 1, 1, 60452, '2019-07-25 11:12:03');
INSERT INTO `pro_trades` VALUES (404, 3, '2019072545470452', 1, 2, 60452, '2019-07-25 11:12:19');
INSERT INTO `pro_trades` VALUES (405, 3, '2019072560923489', 5000, 2, 63489, '2019-07-25 11:47:49');
INSERT INTO `pro_trades` VALUES (406, 3, '2019072507993489', 5000, 1, 63489, '2019-07-25 11:47:59');
INSERT INTO `pro_trades` VALUES (407, 3, '2019072550553489', 5000, 2, 63489, '2019-07-25 11:48:13');
INSERT INTO `pro_trades` VALUES (408, 3, '2019072545123489', 5000, 1, 63489, '2019-07-25 11:48:26');
INSERT INTO `pro_trades` VALUES (409, 3, '2019072560613489', 5000, 2, 63489, '2019-07-25 11:48:39');
INSERT INTO `pro_trades` VALUES (410, 3, '2019072523223489', 5000, 1, 63489, '2019-07-25 11:48:54');
INSERT INTO `pro_trades` VALUES (411, 3, '2019072583793489', 1, 2, 63489, '2019-07-25 11:49:07');
INSERT INTO `pro_trades` VALUES (412, 3, '2019072547673489', 1, 1, 63489, '2019-07-25 11:49:19');
INSERT INTO `pro_trades` VALUES (413, 3, '2019072535433489', 1, 2, 63489, '2019-07-25 11:49:44');
INSERT INTO `pro_trades` VALUES (414, 3, '2019072525373489', 1, 1, 63489, '2019-07-25 11:50:10');
INSERT INTO `pro_trades` VALUES (415, 3, '2019072529843489', 5000, 2, 63489, '2019-07-25 11:50:41');
INSERT INTO `pro_trades` VALUES (416, 3, '2019072516993489', 5000, 1, 63489, '2019-07-25 11:50:51');
INSERT INTO `pro_trades` VALUES (417, 3, '2019072532373489', 1, 1, 63489, '2019-07-25 11:53:29');
INSERT INTO `pro_trades` VALUES (418, 3, '2019072564473489', 1, 2, 63489, '2019-07-25 11:54:14');
INSERT INTO `pro_trades` VALUES (419, 3, '2019072574123489', 1, 1, 63489, '2019-07-25 11:54:30');
INSERT INTO `pro_trades` VALUES (420, 3, '2019072512224077', 1, 1, 64077, '2019-07-25 14:47:44');
INSERT INTO `pro_trades` VALUES (421, 3, '2019072557453489', 3000, 2, 63489, '2019-07-25 16:12:37');
INSERT INTO `pro_trades` VALUES (422, 3, '2019072588823489', 7000, 2, 63489, '2019-07-25 16:16:50');
INSERT INTO `pro_trades` VALUES (423, 3, '2019072504703489', 7000, 1, 63489, '2019-07-25 16:18:21');
INSERT INTO `pro_trades` VALUES (424, 3, '2019072535623489', 1, 1, 63489, '2019-07-25 16:32:16');

-- ----------------------------
-- Table structure for pro_xiche_device
-- ----------------------------
DROP TABLE IF EXISTS `pro_xiche_device`;
CREATE TABLE `pro_xiche_device`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `adcode` mediumint(5) UNSIGNED NULL DEFAULT 0 COMMENT '城市代码',
  `location` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经纬度',
  `geohash` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经纬度geo码',
  `site` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '场地,用于地图显示合并场地',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `order_count` mediumint(8) UNSIGNED NULL DEFAULT 0 COMMENT '订单数',
  `money` mediumint(8) UNSIGNED NULL DEFAULT 0 COMMENT '总收益 (分)',
  `devcode` char(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备编码',
  `isonline` tinyint(1) NULL DEFAULT NULL COMMENT '0-离线;1-在线',
  `usestate` tinyint(1) NULL DEFAULT NULL COMMENT '0:空闲;1:投币洗车;2:刷卡洗车;3:微信洗车;4:停售;5:手机号洗车;6:会员扫码洗车; 7:缺泡沫',
  `usetime` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '设备开始使用时间戳',
  `areaid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区块唯一ID',
  `areaname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区块名称',
  `price` mediumint(8) UNSIGNED NULL DEFAULT NULL COMMENT '价格：分',
  `parameters` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '设备参数',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `sort` mediumint(8) UNSIGNED NULL DEFAULT 0 COMMENT '排序 从大到小',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `devcode`(`devcode`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '洗车机设备信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pro_xiche_device
-- ----------------------------
INSERT INTO `pro_xiche_device` VALUES (1, 520100, '106.643940,26.635290', 'wkezd8z9zcvj', 'A区', '贵阳市会展城', 2, 200, 'F52700B503D9BB', 1, 0, 71, '20160401114150', '贵阳1111', 100, '{\"AreaID\":20160401114150,\"AreaName\":\"贵阳\",\"Price\":1,\"Channel1\":1800,\"Channel2\":1800,\"Channel3\":1800,\"Channel4\":1800,\"Channel5\":1800,\"MaxPauseTime\":10,\"WashTotal\":30,\"NotPauseTime\":2,\"FromTime\":\"18:30\",\"ToTime\":\"00:57\",\"VXPrice\":10}', '2018-12-19 16:22:44', '2019-04-28 14:19:27', 0);
INSERT INTO `pro_xiche_device` VALUES (2, 520100, '106.622178,26.674343', 'wkezdpzvkcfm', 'B区', '贵阳市1', 1, 10, 'F527009C072522', 1, 0, 0, '20160401114150', '贵阳', 100, '{\"AreaID\":20160401114150,\"AreaName\":\"贵阳\",\"Price\":1,\"Channel1\":1800,\"Channel2\":1800,\"Channel3\":1800,\"Channel4\":1800,\"Channel5\":1800,\"MaxPauseTime\":10,\"WashTotal\":30,\"NotPauseTime\":2,\"FromTime\":\"18:30\",\"ToTime\":\"00:57\",\"VXPrice\":10}', '2018-12-20 14:47:37', '2019-04-18 16:24:03', 0);
INSERT INTO `pro_xiche_device` VALUES (3, 520100, '106.618780,26.641560', 'wkezd1vqmdsx', 'C区', '贵阳市观山湖', 0, 0, 'F52700A408497E', 1, 0, 0, '20160401114150', '贵阳', 100, '{\"AreaID\":20160401114150,\"AreaName\":\"贵阳\",\"Price\":1,\"Channel1\":1800,\"Channel2\":1800,\"Channel3\":1800,\"Channel4\":1800,\"Channel5\":1800,\"MaxPauseTime\":10,\"WashTotal\":30,\"NotPauseTime\":2,\"FromTime\":\"18:30\",\"ToTime\":\"00:57\",\"VXPrice\":10}', '2019-01-16 16:14:53', '2019-04-18 16:24:00', 0);
INSERT INTO `pro_xiche_device` VALUES (4, 520100, '106.796978,26.605943', 'wkezq5rnvgq8', 'B区', ' 贵阳市', 0, 0, 'F527007504ADD3', 0, 0, 17, '20160401114150', '深圳4', 100, '{\"AreaID\":20160401114150,\"AreaName\":\"贵阳\",\"Price\":1,\"Channel1\":1800,\"Channel2\":1800,\"Channel3\":1800,\"Channel4\":1800,\"Channel5\":1800,\"MaxPauseTime\":10,\"WashTotal\":30,\"NotPauseTime\":2,\"FromTime\":\"18:30\",\"ToTime\":\"00:57\",\"VXPrice\":10}', '2019-01-16 16:15:55', '2019-04-16 09:29:10', 0);
INSERT INTO `pro_xiche_device` VALUES (5, 520100, '106.546278,26.659643', 'wkez8t0xsjxj', 'C区', '123', 0, 0, 'F52700B1058AA7', 0, 0, 0, '20160401114150', '贵阳', 100, '{\"AreaID\":20160401114150,\"AreaName\":\"贵阳\",\"Price\":1,\"Channel1\":1800,\"Channel2\":1800,\"Channel3\":1800,\"Channel4\":1800,\"Channel5\":1800,\"MaxPauseTime\":10,\"WashTotal\":30,\"NotPauseTime\":2,\"FromTime\":\"18:30\",\"ToTime\":\"00:57\",\"VXPrice\":10}', '2019-01-18 10:56:10', '2019-04-16 09:29:13', 0);
INSERT INTO `pro_xiche_device` VALUES (6, 520100, '106.649778,26.663843', 'wkezdy5bpuw6', 'C区', 'bbb', 2, 200, 'F52700B1058AAA', 0, 0, 239, '20160401114149', '深圳123', 100, '{\"AreaID\":20160401114149,\"AreaName\":\"深圳\",\"Price\":1,\"Channel1\":720,\"Channel2\":720,\"Channel3\":720,\"Channel4\":720,\"Channel5\":720,\"MaxPauseTime\":5,\"WashTotal\":12,\"NotPauseTime\":2,\"FromTime\":\"17:50\",\"ToTime\":\"22:30\",\"VXPrice\":10}', '2019-04-14 16:04:27', '2019-06-22 15:49:42', 0);

-- ----------------------------
-- Table structure for pro_xiche_log
-- ----------------------------
DROP TABLE IF EXISTS `pro_xiche_log`;
CREATE TABLE `pro_xiche_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志级别',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志名称',
  `uid` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '操作用户',
  `orderno` char(27) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `devcode` char(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备编号',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '日志详情',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `devcode`(`devcode`) USING BTREE,
  INDEX `orderno`(`orderno`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pro_xiche_log
-- ----------------------------
INSERT INTO `pro_xiche_log` VALUES (1, 'ReportStatus', '洗车机状态上报异常(ReportStatus)', NULL, NULL, NULL, '{\"get\":[],\"post\":[],\"result\":{\"errorcode\":-1,\"errNo\":-1,\"message\":\"apikey错误\",\"result\":[]}}', '2019-07-19 10:31:04', NULL);
INSERT INTO `pro_xiche_log` VALUES (2, 'ReportStatus', '洗车机状态上报异常(ReportStatus)', NULL, NULL, NULL, '{\"get\":[],\"post\":[],\"result\":{\"errorcode\":-1,\"errNo\":-1,\"message\":\"apikey错误\",\"result\":[]}}', '2019-07-19 10:31:20', NULL);
INSERT INTO `pro_xiche_log` VALUES (3, 'ReportStatus', '洗车机状态上报异常(ReportStatus)', NULL, NULL, NULL, '{\"get\":[],\"post\":[],\"result\":{\"errorcode\":-1,\"errNo\":-1,\"message\":\"apikey错误\",\"result\":[]}}', '2019-07-19 10:31:21', NULL);
INSERT INTO `pro_xiche_log` VALUES (4, 'ReportStatus', '洗车机状态上报异常(ReportStatus)', NULL, NULL, NULL, '{\"get\":[],\"post\":[],\"result\":{\"errorcode\":-1,\"errNo\":-1,\"message\":\"apikey错误\",\"result\":[]}}', '2019-07-19 10:31:22', NULL);
INSERT INTO `pro_xiche_log` VALUES (5, 'ReportStatus', '洗车机状态上报异常(ReportStatus)', NULL, NULL, NULL, '{\"get\":[],\"post\":[],\"result\":{\"errorcode\":-1,\"errNo\":-1,\"message\":\"apikey错误\",\"result\":[]}}', '2019-07-19 10:31:26', NULL);
INSERT INTO `pro_xiche_log` VALUES (6, 'ReportStatus', '洗车机状态上报异常(ReportStatus)', NULL, NULL, NULL, '{\"get\":[],\"post\":[],\"result\":{\"errorcode\":-1,\"errNo\":-1,\"message\":\"apikey错误\",\"result\":[]}}', '2019-07-19 10:31:30', NULL);
INSERT INTO `pro_xiche_log` VALUES (7, 'ReportStatus', '洗车机状态上报异常(ReportStatus)', NULL, NULL, NULL, '{\"get\":[],\"post\":[],\"result\":{\"errorcode\":-1,\"errNo\":-1,\"message\":\"apikey错误\",\"result\":[]}}', '2019-07-19 10:31:34', NULL);
INSERT INTO `pro_xiche_log` VALUES (8, 'ReportStatus', '洗车机状态上报异常(ReportStatus)', NULL, NULL, NULL, '{\"get\":[],\"post\":[],\"result\":{\"errorcode\":-1,\"errNo\":-1,\"message\":\"apikey错误\",\"result\":[]}}', '2019-07-19 10:31:49', NULL);
INSERT INTO `pro_xiche_log` VALUES (9, 'ReportStatus', '洗车机状态上报异常(ReportStatus)', NULL, NULL, NULL, '{\"get\":[],\"post\":[],\"result\":{\"errorcode\":-1,\"errNo\":-1,\"message\":\"apikey错误\",\"result\":[]}}', '2019-07-19 10:31:51', NULL);
INSERT INTO `pro_xiche_log` VALUES (10, 'ReportStatus', '洗车机状态上报异常(ReportStatus)', NULL, NULL, NULL, '{\"get\":[],\"post\":[],\"result\":{\"errorcode\":-1,\"errNo\":-1,\"message\":\"apikey错误\",\"result\":[]}}', '2019-07-19 10:31:52', NULL);
INSERT INTO `pro_xiche_log` VALUES (11, 'ReportStatus', '洗车机状态上报异常(ReportStatus)', NULL, NULL, NULL, '{\"get\":[],\"post\":[],\"result\":{\"errorcode\":-1,\"errNo\":-1,\"message\":\"apikey错误\",\"result\":[]}}', '2019-07-19 10:31:53', NULL);
INSERT INTO `pro_xiche_log` VALUES (12, 'ReportStatus', '洗车机状态上报异常(ReportStatus)', NULL, NULL, '1', '{\"get\":{\"DevCode\":\"1\"},\"post\":[],\"result\":{\"errorcode\":-1,\"errNo\":-1,\"message\":\"apikey错误\",\"result\":[]}}', '2019-07-19 10:32:31', NULL);
INSERT INTO `pro_xiche_log` VALUES (13, 'ReportStatus', '洗车机状态上报异常(ReportStatus)', NULL, NULL, '1', '{\"get\":{\"DevCode\":\"1\"},\"post\":[],\"result\":{\"errorcode\":-1,\"errNo\":-1,\"message\":\"apikey错误\",\"result\":[]}}', '2019-07-19 10:36:54', NULL);
INSERT INTO `pro_xiche_log` VALUES (14, 'ReportStatus', '洗车机状态上报异常(ReportStatus)', NULL, NULL, '2', '{\"get\":{\"DevCode\":\"2\"},\"post\":[],\"result\":{\"errorcode\":-1,\"errNo\":-1,\"message\":\"apikey错误\",\"result\":[]}}', '2019-07-19 10:37:14', NULL);
INSERT INTO `pro_xiche_log` VALUES (15, 'ReportStatus', '洗车机状态上报异常(ReportStatus)', NULL, NULL, '3', '{\"get\":{\"DevCode\":\"3\"},\"post\":[],\"result\":{\"errorcode\":-1,\"errNo\":-1,\"message\":\"apikey错误\",\"result\":[]}}', '2019-07-19 10:37:20', NULL);
INSERT INTO `pro_xiche_log` VALUES (16, 'ReportStatus', '洗车机状态上报异常(ReportStatus)', NULL, NULL, '3', '{\"get\":{\"DevCode\":\"3\"},\"post\":[],\"result\":{\"errorcode\":-1,\"errNo\":-1,\"message\":\"apikey错误\",\"result\":[]}}', '2019-07-19 10:42:16', NULL);
INSERT INTO `pro_xiche_log` VALUES (17, 'ReportStatus', '洗车机状态上报异常(ReportStatus)', NULL, NULL, '3', '{\"get\":{\"DevCode\":\"3\"},\"post\":[],\"result\":{\"errorcode\":-1,\"errNo\":-1,\"message\":\"apikey错误\",\"result\":[]}}', '2019-07-19 10:42:39', NULL);
INSERT INTO `pro_xiche_log` VALUES (18, 'ReportStatus', '洗车机状态上报异常(ReportStatus)', NULL, NULL, '3', '{\"get\":{\"DevCode\":\"3\"},\"post\":[],\"result\":{\"errorcode\":-1,\"errNo\":-1,\"message\":\"apikey错误\",\"result\":[]}}', '2019-07-19 10:42:51', NULL);

-- ----------------------------
-- Table structure for pro_xiche_login
-- ----------------------------
DROP TABLE IF EXISTS `pro_xiche_login`;
CREATE TABLE `pro_xiche_login`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NULL DEFAULT 0 COMMENT '车秘用户ID',
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '绑定类型wx,qq等',
  `authcode` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '平台唯一授权码',
  `openid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信openid',
  `nickname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index`(`authcode`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '第三方平台绑定' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pro_xiche_login
-- ----------------------------
INSERT INTO `pro_xiche_login` VALUES (1, 63700, 'mp', 'ooabE5JRhnYMnf4lrjOy5b_mZ6ao', 'ooabE5JRhnYMnf4lrjOy5b_mZ6ao', NULL, '2019-04-30 19:40:27');
INSERT INTO `pro_xiche_login` VALUES (2, 58827, 'mp', 'ooabE5BgCmFyMgaina03QZsIJynE', 'ooabE5BgCmFyMgaina03QZsIJynE', NULL, '2019-05-05 09:19:30');
INSERT INTO `pro_xiche_login` VALUES (3, 0, 'mp', 'ooabE5ADOt7jDdaD2Sd_xmHj4nNU', 'ooabE5ADOt7jDdaD2Sd_xmHj4nNU', NULL, '2019-05-05 09:41:29');
INSERT INTO `pro_xiche_login` VALUES (5, 61426, 'mp', 'ooabE5JSdBPB7n40nIyTqQynFm4U', 'ooabE5JSdBPB7n40nIyTqQynFm4U', NULL, '2019-05-11 15:46:59');
INSERT INTO `pro_xiche_login` VALUES (6, 45202, 'mp', 'ooabE5FUjtvk1sXr6AigU6-nGGUk', 'ooabE5FUjtvk1sXr6AigU6-nGGUk', NULL, '2019-05-29 15:17:19');
INSERT INTO `pro_xiche_login` VALUES (7, 58274, 'mp', 'ooabE5EAG3ZciWfxD5Re3GhSivi4', 'ooabE5EAG3ZciWfxD5Re3GhSivi4', NULL, '2019-09-02 15:14:20');
INSERT INTO `pro_xiche_login` VALUES (8, 65877, 'mp', 'ooabE5KI7k9z82uA5duAUu_71lDY', 'ooabE5KI7k9z82uA5duAUu_71lDY', NULL, '2019-07-03 18:30:40');
INSERT INTO `pro_xiche_login` VALUES (9, 48981, 'mp', 'ooabE5D7I6aK0yhwdYifN_CVm_k8', 'ooabE5D7I6aK0yhwdYifN_CVm_k8', NULL, '2019-07-05 10:20:31');
INSERT INTO `pro_xiche_login` VALUES (10, 60452, 'mp', 'ooabE5BXna1dSGDHxsZGhKB3XH6w', 'ooabE5BXna1dSGDHxsZGhKB3XH6w', NULL, '2019-07-05 10:21:24');
INSERT INTO `pro_xiche_login` VALUES (11, 58256, 'mp', 'ooabE5DsSKx3ygz62AYZlX7_bDEA', 'ooabE5DsSKx3ygz62AYZlX7_bDEA', NULL, '2019-07-05 10:51:38');
INSERT INTO `pro_xiche_login` VALUES (13, 63489, 'mp', 'ooabE5IlGguJNV1QiQH6yb20YPeY', 'ooabE5IlGguJNV1QiQH6yb20YPeY', NULL, '2019-07-12 14:10:44');
INSERT INTO `pro_xiche_login` VALUES (14, 69832, 'mp', 'ooabE5DXLmIKkUYTon0xpDb-ZHxQ', 'ooabE5DXLmIKkUYTon0xpDb-ZHxQ', NULL, '2019-07-12 15:15:39');
INSERT INTO `pro_xiche_login` VALUES (15, 64077, 'mp', 'ooabE5FV5tPYDhtcwwR2Gt7U_W5c', 'ooabE5FV5tPYDhtcwwR2Gt7U_W5c', NULL, '2019-07-16 11:05:12');
INSERT INTO `pro_xiche_login` VALUES (16, 68797, 'mp', 'ooabE5LwFryeViUjjDk2ZIYRT0Hs', 'ooabE5LwFryeViUjjDk2ZIYRT0Hs', NULL, '2019-07-20 20:16:23');
INSERT INTO `pro_xiche_login` VALUES (17, 52529, 'mp', 'ooabE5DXXTCDj8OPhVPqlyEp2Rrs', 'ooabE5DXXTCDj8OPhVPqlyEp2Rrs', NULL, '2019-07-25 16:18:29');

SET FOREIGN_KEY_CHECKS = 1;
