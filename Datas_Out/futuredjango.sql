/*
 Navicat Premium Data Transfer

 Source Server         : sql_test
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : futuredjango

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 21/05/2025 23:23:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for api_test_book
-- ----------------------------
DROP TABLE IF EXISTS `api_test_book`;
CREATE TABLE `api_test_book`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `book_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of api_test_book
-- ----------------------------
INSERT INTO `api_test_book` VALUES (1, 'test1', '2025-03-20 11:01:11.000000');

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id` ASC, `codename` ASC) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add populations', 7, 'add_populations');
INSERT INTO `auth_permission` VALUES (26, 'Can change populations', 7, 'change_populations');
INSERT INTO `auth_permission` VALUES (27, 'Can delete populations', 7, 'delete_populations');
INSERT INTO `auth_permission` VALUES (28, 'Can view populations', 7, 'view_populations');
INSERT INTO `auth_permission` VALUES (29, 'Can add population', 8, 'add_population');
INSERT INTO `auth_permission` VALUES (30, 'Can change population', 8, 'change_population');
INSERT INTO `auth_permission` VALUES (31, 'Can delete population', 8, 'delete_population');
INSERT INTO `auth_permission` VALUES (32, 'Can view population', 8, 'view_population');
INSERT INTO `auth_permission` VALUES (33, 'Can add population data', 9, 'add_populationdata');
INSERT INTO `auth_permission` VALUES (34, 'Can change population data', 9, 'change_populationdata');
INSERT INTO `auth_permission` VALUES (35, 'Can delete population data', 9, 'delete_populationdata');
INSERT INTO `auth_permission` VALUES (36, 'Can view population data', 9, 'view_populationdata');
INSERT INTO `auth_permission` VALUES (37, 'Can add provinces', 10, 'add_provinces');
INSERT INTO `auth_permission` VALUES (38, 'Can change provinces', 10, 'change_provinces');
INSERT INTO `auth_permission` VALUES (39, 'Can delete provinces', 10, 'delete_provinces');
INSERT INTO `auth_permission` VALUES (40, 'Can view provinces', 10, 'view_provinces');
INSERT INTO `auth_permission` VALUES (41, 'Can add books', 11, 'add_books');
INSERT INTO `auth_permission` VALUES (42, 'Can change books', 11, 'change_books');
INSERT INTO `auth_permission` VALUES (43, 'Can delete books', 11, 'delete_books');
INSERT INTO `auth_permission` VALUES (44, 'Can view books', 11, 'view_books');
INSERT INTO `auth_permission` VALUES (45, 'Can add book', 12, 'add_book');
INSERT INTO `auth_permission` VALUES (46, 'Can change book', 12, 'change_book');
INSERT INTO `auth_permission` VALUES (47, 'Can delete book', 12, 'delete_book');
INSERT INTO `auth_permission` VALUES (48, 'Can view book', 12, 'view_book');
INSERT INTO `auth_permission` VALUES (49, 'Can add book', 13, 'add_book');
INSERT INTO `auth_permission` VALUES (50, 'Can change book', 13, 'change_book');
INSERT INTO `auth_permission` VALUES (51, 'Can delete book', 13, 'delete_book');
INSERT INTO `auth_permission` VALUES (52, 'Can view book', 13, 'view_book');
INSERT INTO `auth_permission` VALUES (53, 'Can add 中国生产总值数据', 14, 'add_gdpdata');
INSERT INTO `auth_permission` VALUES (54, 'Can change 中国生产总值数据', 14, 'change_gdpdata');
INSERT INTO `auth_permission` VALUES (55, 'Can delete 中国生产总值数据', 14, 'delete_gdpdata');
INSERT INTO `auth_permission` VALUES (56, 'Can view 中国生产总值数据', 14, 'view_gdpdata');
INSERT INTO `auth_permission` VALUES (57, 'Can add 中国人口数据', 15, 'add_populationdata');
INSERT INTO `auth_permission` VALUES (58, 'Can change 中国人口数据', 15, 'change_populationdata');
INSERT INTO `auth_permission` VALUES (59, 'Can delete 中国人口数据', 15, 'delete_populationdata');
INSERT INTO `auth_permission` VALUES (60, 'Can view 中国人口数据', 15, 'view_populationdata');
INSERT INTO `auth_permission` VALUES (61, 'Can add 省份', 16, 'add_provinces');
INSERT INTO `auth_permission` VALUES (62, 'Can change 省份', 16, 'change_provinces');
INSERT INTO `auth_permission` VALUES (63, 'Can delete 省份', 16, 'delete_provinces');
INSERT INTO `auth_permission` VALUES (64, 'Can view 省份', 16, 'view_provinces');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$870000$xDaXbxUMH61QJhmXEckuE6$lTbhT4af6aqz5UQHzIp/yYA959D9Ck9V0oIB/QPiMns=', '2025-03-25 00:25:52.418094', 1, 'root', '', '', '', 1, 1, '2025-03-25 00:24:53.498789');
INSERT INTO `auth_user` VALUES (2, 'pbkdf2_sha256$870000$mobAgA99lCm0m2FsDVY6a2$MC+f/ZWEir3S+wcCs+3q5avqiS7Hkfa2PYY2ywOu9As=', '2025-04-01 02:21:02.022221', 1, 'admin', '', '', '', 1, 1, '2025-03-25 00:26:50.903083');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id` ASC, `group_id` ASC) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id` ASC) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for books_book
-- ----------------------------
DROP TABLE IF EXISTS `books_book`;
CREATE TABLE `books_book`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `book_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of books_book
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `content_type_id` int NULL DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id` ASC) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_chk_1` CHECK (`action_flag` >= 0)
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label` ASC, `model` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (13, 'api_test', 'book');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (12, 'books', 'book');
INSERT INTO `django_content_type` VALUES (11, 'books', 'books');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (9, 'index', 'populationdata');
INSERT INTO `django_content_type` VALUES (7, 'index', 'populations');
INSERT INTO `django_content_type` VALUES (10, 'index', 'provinces');
INSERT INTO `django_content_type` VALUES (14, 'population', 'gdpdata');
INSERT INTO `django_content_type` VALUES (15, 'population', 'populationdata');
INSERT INTO `django_content_type` VALUES (16, 'population', 'provinces');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (8, 'web', 'population');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2025-03-24 08:26:06.561331');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2025-03-24 08:26:06.825296');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2025-03-24 08:26:06.890308');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2025-03-24 08:26:06.894878');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2025-03-24 08:26:06.900868');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2025-03-24 08:26:06.940467');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2025-03-24 08:26:06.966468');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2025-03-24 08:26:06.994231');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2025-03-24 08:26:07.001269');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2025-03-24 08:26:07.027833');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2025-03-24 08:26:07.029831');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2025-03-24 08:26:07.034831');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2025-03-24 08:26:07.064808');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2025-03-24 08:26:07.094814');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2025-03-24 08:26:07.123526');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2025-03-24 08:26:07.129549');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2025-03-24 08:26:07.156303');
INSERT INTO `django_migrations` VALUES (18, 'sessions', '0001_initial', '2025-03-24 08:26:07.175843');
INSERT INTO `django_migrations` VALUES (19, 'index', '0001_initial', '2025-03-24 08:30:08.080461');
INSERT INTO `django_migrations` VALUES (20, 'web', '0001_initial', '2025-03-24 08:30:08.086269');
INSERT INTO `django_migrations` VALUES (21, 'index', '0002_populationdata_provinces', '2025-03-25 13:28:47.286356');
INSERT INTO `django_migrations` VALUES (22, 'index', '0003_delete_populations_alter_populationdata_options_and_more', '2025-03-28 10:49:51.640589');
INSERT INTO `django_migrations` VALUES (23, 'books', '0001_initial', '2025-03-28 12:32:08.187851');
INSERT INTO `django_migrations` VALUES (24, 'books', '0002_book_delete_books', '2025-03-29 02:13:44.163541');
INSERT INTO `django_migrations` VALUES (25, 'api_test', '0001_initial', '2025-03-29 02:55:13.454669');
INSERT INTO `django_migrations` VALUES (26, 'population', '0001_initial', '2025-04-05 06:11:21.892404');
INSERT INTO `django_migrations` VALUES (27, 'population', '0002_alter_gdpdata_table', '2025-04-05 06:54:23.148512');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('4012svjq5xhxdf264mrxmyhetzxos8iq', '.eJzFVMtu2zAQ_BWDZz8kUhIlH3sv0EtPVWAsyZXNRA9DlHoJ_O_Vym6aqHJMIG56WnJnOcOdJfjMdtB3h13vsN1Zw7aMs-XrnAL9hDUB5hHqfbPWTd21Vq2pZH1B3fprY7D8cql9Q3AAdxhOKyNRpDrinKMSQRYUiVCpKJJMGI4GJRSay1AJBYZLTCWqrMhSnhZgZBYrIq2w7t3A9eM5ZzVUmLPtImffmmNfQmebOmfLYW81rQgpoF0UsNK21SWewYru6Qh-S5LnfYTcDCFOCjPuFNBOoBhCEsuAgkjQQ6RvyzO2AVPZenN8ueGrpYEONud6MOa795Gh-HJMtQhGt32lZhryduW0XPwbJ04PBKM1hIZBwG8qyTgsxiRIkgiEIiwQ-p4T2Jujt_W_az_d8_s4MZ2AmNGVMghHpUH3Yy-7bX7aWqPze9Qv1Z_grX-PU8eiaSKcoU8VRGPQpBJH6TglkaYUZCT-1nSk6Q4WS7OCsrv5NcmYj2RcyCsN0Fc7PyL6iTcEX5_LnxLPYdyn6blJeTY6HUsyx4U6unILInEr3ezfsWzfNv3xhmfnmv9umlejU8vkNBGfHtjpF2ORjgk:1u0xz5:v8DdTyr8DMtQjZKM7J-HjUZDwBZ_VVNSHpWHVTRp7Gw', '2025-04-19 07:30:31.162712');
INSERT INTO `django_session` VALUES ('9e99ctsfwe8kp9z2wkn5woagh5yb3cn3', '.eJzNVE2PmzAU_CuRz0kAG7DZY-899lRW0bP9SNyCiWyoKq3y32uHqB-UbFC1VXt6kmc845kneCEHGIfTYfToDkaTJ0LJ9uczCeoz2gjoT2CP_V71dnBG7iNlf0P9_n2vsX134_4icAJ_Crel5siEyimlKFlapU3JpGBNWTFNUSOHRlGeSSZBU46Co6yaSlDRgOZVIaNoh3b0QevjS00sdFiTp01N6nrMUUIYBUMWRlnwNA5WYhhcQhZHnpY12Qa-CQmmmw24TQM7ZZxqcQK7mMNHeMGE6mhSNvpVy8cmo2snLAHdGZsYq_Frcu7PYwuD6a2GAZKJClp_WMMOvNsN6RC0cmMn78V4i64u283f6efyHGE0OqJZmtIFJ87T7GoRnP64bdd_MVahf1j0d-J_0PH65PMe2fwgW5AXEvLrUNGlyIW6vluIOHjOfvf00dOfDLZ6B-3w8CPiBb2KUcbvBIg_jeXFxX9KEuH7K_tBWb-sNwi9tKmVQedrKZa0UOV3XhFF_E71x1cqO7p-PD_obOL889JWBZ1XVs4P8sszuXwDLmoltQ:1tzSIV:KmB6_4b9asqq1-Tlhtp8WyEsktIEPk1ZA_ow9DXJUNY', '2025-04-15 03:28:19.701064');

-- ----------------------------
-- Table structure for gdp_data
-- ----------------------------
DROP TABLE IF EXISTS `gdp_data`;
CREATE TABLE `gdp_data`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `province_id` int NOT NULL,
  `year` year NOT NULL,
  `gdp` int NULL DEFAULT NULL,
  `average_revenue` int NULL DEFAULT NULL COMMENT '居民人均可支配收入(元)',
  `average_consume` int NULL DEFAULT NULL COMMENT '居民人均消费支出(元)',
  `city_revenue` int NULL DEFAULT NULL COMMENT '城镇居民人均可支配收入(元)',
  `country_revenue` int NULL DEFAULT NULL COMMENT '农村居民人均可支配收入(元)',
  `city_consume` int NULL DEFAULT NULL COMMENT '城镇居民人均消费支出(元)',
  `country_consume` int NULL DEFAULT NULL COMMENT '农村居民人均消费支出(元)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 611 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gdp_data
-- ----------------------------
INSERT INTO `gdp_data` VALUES (2, 2, 2023, 43761, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (3, 2, 2022, 41541, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (4, 2, 2021, 41046, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (5, 2, 2020, 35943, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (6, 2, 2019, 35445, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (7, 2, 2018, 33106, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (8, 2, 2017, 29883, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (9, 2, 2016, 27041, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (10, 2, 2015, 24779, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (11, 2, 2014, 22926, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (12, 2, 2013, 21135, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (13, 2, 2012, 19025, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (14, 2, 2011, 17189, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (15, 2, 2010, 14964, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (16, 2, 2009, 12901, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (17, 2, 2008, 11813, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (18, 2, 2007, 10426, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (19, 2, 2006, 8387, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (20, 2, 2005, 7150, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (22, 4, 2023, 16737, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (23, 4, 2022, 16132, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (24, 4, 2021, 15685, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (25, 4, 2020, 14008, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (26, 4, 2019, 14056, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (27, 4, 2018, 13363, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (28, 4, 2017, 12451, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (29, 4, 2016, 11477, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (30, 4, 2015, 10880, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (31, 4, 2014, 10641, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (32, 4, 2013, 9945, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (33, 4, 2012, 9043, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (34, 4, 2011, 8113, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (35, 4, 2010, 6831, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (36, 4, 2009, 5710, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (37, 4, 2008, 5182, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (38, 4, 2007, 4158, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (39, 4, 2006, 3538, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (40, 4, 2005, 3159, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (41, 6, 2023, 43944, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (42, 6, 2022, 41988, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (43, 6, 2021, 40397, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (44, 6, 2020, 36014, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (45, 6, 2019, 34979, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (46, 6, 2018, 32495, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (47, 6, 2017, 30641, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (48, 6, 2016, 28474, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (49, 6, 2015, 26398, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (50, 6, 2014, 25209, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (51, 6, 2013, 24260, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (52, 6, 2012, 23078, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (53, 6, 2011, 21385, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (54, 6, 2010, 18004, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (55, 6, 2009, 15307, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (56, 6, 2008, 14200, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (57, 6, 2007, 12153, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (58, 6, 2006, 10043, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (59, 6, 2005, 8773, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (60, 7, 2023, 25698, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (61, 7, 2022, 25584, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (62, 7, 2021, 22870, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (63, 7, 2020, 17836, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (64, 7, 2019, 16962, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (65, 7, 2018, 15958, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (66, 7, 2017, 14484, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (67, 7, 2016, 11946, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (68, 7, 2015, 11836, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (69, 7, 2014, 12095, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (70, 7, 2013, 11987, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (71, 7, 2012, 11683, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (72, 7, 2011, 10894, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (73, 7, 2010, 8904, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (74, 7, 2009, 7148, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (75, 7, 2008, 7223, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (76, 7, 2007, 5936, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (77, 7, 2006, 4714, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (78, 7, 2005, 4079, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (79, 28, 2023, 24627, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (80, 28, 2022, 23389, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (81, 28, 2021, 21166, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (82, 28, 2020, 17258, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (83, 28, 2019, 17213, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (84, 28, 2018, 16141, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (85, 28, 2017, 14898, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (86, 28, 2016, 13789, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (87, 28, 2015, 12949, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (88, 28, 2014, 12158, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (89, 28, 2013, 11392, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (90, 28, 2012, 10470, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (91, 28, 2011, 9458, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (92, 28, 2010, 8200, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (93, 28, 2009, 7104, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (94, 28, 2008, 6242, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (95, 28, 2007, 5167, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (96, 28, 2006, 4162, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (97, 28, 2005, 3524, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (98, 8, 2023, 30209, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (99, 8, 2022, 28826, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (100, 8, 2021, 27570, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (101, 8, 2020, 25011, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (102, 8, 2019, 24855, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (103, 8, 2018, 23511, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (104, 8, 2017, 21693, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (105, 8, 2016, 20393, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (106, 8, 2015, 20210, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (107, 8, 2014, 20026, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (108, 8, 2013, 19209, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (109, 8, 2012, 17849, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (110, 8, 2011, 16355, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (111, 8, 2010, 13896, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (112, 8, 2009, 12816, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (113, 8, 2008, 12138, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (114, 8, 2007, 10292, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (115, 8, 2006, 8390, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (116, 8, 2005, 7261, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (117, 9, 2023, 13531, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (118, 9, 2022, 12818, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (119, 9, 2021, 13164, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (120, 9, 2020, 12256, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (121, 9, 2019, 11727, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (122, 9, 2018, 11254, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (123, 9, 2017, 10922, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (124, 9, 2016, 10427, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (125, 9, 2015, 10018, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (126, 9, 2014, 9967, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (127, 9, 2013, 9428, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (128, 9, 2012, 8678, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (129, 9, 2011, 7735, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (130, 9, 2010, 6411, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (131, 9, 2009, 5435, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (132, 9, 2008, 4835, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (133, 9, 2007, 4080, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (134, 9, 2006, 3227, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (135, 9, 2005, 2777, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (136, 10, 2023, 15884, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (137, 10, 2022, 15832, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (138, 10, 2021, 14858, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (139, 10, 2020, 13633, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (140, 10, 2019, 13544, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (141, 10, 2018, 12847, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (142, 10, 2017, 12313, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (143, 10, 2016, 11895, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (144, 10, 2015, 11690, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (145, 10, 2014, 12171, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (146, 10, 2013, 11849, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (147, 10, 2012, 11016, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (148, 10, 2011, 9935, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (149, 10, 2010, 8308, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (150, 10, 2009, 7219, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (151, 10, 2008, 7134, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (152, 10, 2007, 6126, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (153, 10, 2006, 5330, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (154, 10, 2005, 4756, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (155, 3, 2023, 47219, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (156, 3, 2022, 44809, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (157, 3, 2021, 43653, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (158, 3, 2020, 38963, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (159, 3, 2019, 37988, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (160, 3, 2018, 36012, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (161, 3, 2017, 32925, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (162, 3, 2016, 29887, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (163, 3, 2015, 26887, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (164, 3, 2014, 25270, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (165, 3, 2013, 23204, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (166, 3, 2012, 21306, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (167, 3, 2011, 20010, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (168, 3, 2010, 17915, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (169, 3, 2009, 15742, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (170, 3, 2008, 14537, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (171, 3, 2007, 12879, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (172, 3, 2006, 10599, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (173, 3, 2005, 9197, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (174, 11, 2023, 128222, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (175, 11, 2022, 122089, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (176, 11, 2021, 117392, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (177, 11, 2020, 102808, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (178, 11, 2019, 98657, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (179, 11, 2018, 93208, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (180, 11, 2017, 85870, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (181, 11, 2016, 77351, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (182, 11, 2015, 71256, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (183, 11, 2014, 64831, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (184, 11, 2013, 59349, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (185, 11, 2012, 53702, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (186, 11, 2011, 48839, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (187, 11, 2010, 41384, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (188, 11, 2009, 34472, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (189, 11, 2008, 30946, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (190, 11, 2007, 25988, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (191, 11, 2006, 21241, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (192, 11, 2005, 18121, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (193, 12, 2023, 82553, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (194, 12, 2022, 78061, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (195, 12, 2021, 74041, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (196, 12, 2020, 64689, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (197, 12, 2019, 62462, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (198, 12, 2018, 58003, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (199, 12, 2017, 52403, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (200, 12, 2016, 47254, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (201, 12, 2015, 43508, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (202, 12, 2014, 40024, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (203, 12, 2013, 37335, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (204, 12, 2012, 34382, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (205, 12, 2011, 31855, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (206, 12, 2010, 27400, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (207, 12, 2009, 22834, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (208, 12, 2008, 21285, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (209, 12, 2007, 18640, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (210, 12, 2006, 15303, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (211, 12, 2005, 13028, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (212, 13, 2023, 47051, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (213, 13, 2022, 44608, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (214, 13, 2021, 42565, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (215, 13, 2020, 38062, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (216, 13, 2019, 36846, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (217, 13, 2018, 34011, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (218, 13, 2017, 29676, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (219, 13, 2016, 26308, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (220, 13, 2015, 23831, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (221, 13, 2014, 22520, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (222, 13, 2013, 20584, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (223, 13, 2012, 18342, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (224, 13, 2011, 16285, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (225, 13, 2010, 13250, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (226, 13, 2009, 10865, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (227, 13, 2008, 9518, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (228, 13, 2007, 7942, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (229, 13, 2006, 6500, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (230, 13, 2005, 5676, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (231, 14, 2023, 54355, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (232, 14, 2022, 51765, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (233, 14, 2021, 49566, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (234, 14, 2020, 43609, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (235, 14, 2019, 42327, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (236, 14, 2018, 38688, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (237, 14, 2017, 33842, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (238, 14, 2016, 29609, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (239, 14, 2015, 26820, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (240, 14, 2014, 24942, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (241, 14, 2013, 22504, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (242, 14, 2012, 20191, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (243, 14, 2011, 17918, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (244, 14, 2010, 15003, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (245, 14, 2009, 12418, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (246, 14, 2008, 10932, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (247, 14, 2007, 9326, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (248, 14, 2006, 7469, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (249, 14, 2005, 6416, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (250, 15, 2023, 32200, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (251, 15, 2022, 31214, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (252, 15, 2021, 29828, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (253, 15, 2020, 25782, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (254, 15, 2019, 24667, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (255, 15, 2018, 22717, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (256, 15, 2017, 20211, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (257, 15, 2016, 18389, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (258, 15, 2015, 16781, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (259, 15, 2014, 15668, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (260, 15, 2013, 14300, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (261, 15, 2012, 12808, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (262, 15, 2011, 11585, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (263, 15, 2010, 9383, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (264, 15, 2009, 7630, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (265, 15, 2008, 6934, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (266, 15, 2007, 5778, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (267, 15, 2006, 4697, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (268, 15, 2005, 3941, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (269, 16, 2023, 92069, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (270, 16, 2022, 87577, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (271, 16, 2021, 82875, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (272, 16, 2020, 72798, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (273, 16, 2019, 70541, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (274, 16, 2018, 66649, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (275, 16, 2017, 63012, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (276, 16, 2016, 58763, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (277, 16, 2015, 55289, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (278, 16, 2014, 50775, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (279, 16, 2013, 47344, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (280, 16, 2012, 42957, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (281, 16, 2011, 39065, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (282, 16, 2010, 33923, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (283, 16, 2009, 29541, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (284, 16, 2008, 27106, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (285, 16, 2007, 22718, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (286, 16, 2006, 18968, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (287, 16, 2005, 15948, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (288, 17, 2023, 59132, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (289, 17, 2022, 58220, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (290, 17, 2021, 58071, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (291, 17, 2020, 54259, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (292, 17, 2019, 53718, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (293, 17, 2018, 49936, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (294, 17, 2017, 44825, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (295, 17, 2016, 40249, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (296, 17, 2015, 37084, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (297, 17, 2014, 34575, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (298, 17, 2013, 31633, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (299, 17, 2012, 28962, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (300, 17, 2011, 26319, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (301, 17, 2010, 22655, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (302, 17, 2009, 19181, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (303, 17, 2008, 17736, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (304, 17, 2007, 14825, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (305, 17, 2006, 11978, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (306, 17, 2005, 10244, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (307, 18, 2023, 55804, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (308, 18, 2022, 52742, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (309, 18, 2021, 50091, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (310, 18, 2020, 43005, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (311, 18, 2019, 45429, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (312, 18, 2018, 42022, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (313, 18, 2017, 37235, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (314, 18, 2016, 33353, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (315, 18, 2015, 30344, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (316, 18, 2014, 28242, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (317, 18, 2013, 25378, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (318, 18, 2012, 22591, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (319, 18, 2011, 19943, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (320, 18, 2010, 16227, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (321, 18, 2009, 13192, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (322, 18, 2008, 11498, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (323, 18, 2007, 9451, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (324, 18, 2006, 7532, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (325, 18, 2005, 6470, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (326, 19, 2023, 50013, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (327, 19, 2022, 47559, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (328, 19, 2021, 45714, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (329, 19, 2020, 41543, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (330, 19, 2019, 39894, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (331, 19, 2018, 36330, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (332, 19, 2017, 33828, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (333, 19, 2016, 30854, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (334, 19, 2015, 28539, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (335, 19, 2014, 25881, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (336, 19, 2013, 23545, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (337, 19, 2012, 21207, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (338, 19, 2011, 18915, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (339, 19, 2010, 15574, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (340, 19, 2009, 12773, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (341, 19, 2008, 11307, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (342, 19, 2007, 9286, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (343, 19, 2006, 7432, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (344, 19, 2005, 6370, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (345, 20, 2023, 135673, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (346, 20, 2022, 129514, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (347, 20, 2021, 124720, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (348, 20, 2020, 111152, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (349, 20, 2019, 107987, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (350, 20, 2018, 99945, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (351, 20, 2017, 91649, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (352, 20, 2016, 82163, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (353, 20, 2015, 74732, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (354, 20, 2014, 68173, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (355, 20, 2013, 62503, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (356, 20, 2012, 57008, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (357, 20, 2011, 53073, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (358, 20, 2010, 45945, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (359, 20, 2009, 39465, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (360, 20, 2008, 36704, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (361, 20, 2007, 31743, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (362, 20, 2006, 25961, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (363, 20, 2005, 21963, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (364, 29, 2023, 27202, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (365, 29, 2022, 26186, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (366, 29, 2021, 25209, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (367, 29, 2020, 22121, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (368, 29, 2019, 21237, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (369, 29, 2018, 19628, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (370, 29, 2017, 17791, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (371, 29, 2016, 16117, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (372, 29, 2015, 14798, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (373, 29, 2014, 13588, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (374, 29, 2013, 12448, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (375, 29, 2012, 11304, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (376, 29, 2011, 10300, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (377, 29, 2010, 8552, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (378, 29, 2009, 7113, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (379, 29, 2008, 6455, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (380, 29, 2007, 5475, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (381, 29, 2006, 4418, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (382, 29, 2005, 3742, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (383, 21, 2023, 7551, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (384, 21, 2022, 6890, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (385, 21, 2021, 6504, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (386, 21, 2020, 5566, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (387, 21, 2019, 5331, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (388, 21, 2018, 4911, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (389, 21, 2017, 4498, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (390, 21, 2016, 4090, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (391, 21, 2015, 3734, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (392, 21, 2014, 3449, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (393, 21, 2013, 3116, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (394, 21, 2012, 2789, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (395, 21, 2011, 2464, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (396, 21, 2010, 2021, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (397, 21, 2009, 1620, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (398, 21, 2008, 1475, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (399, 21, 2007, 1234, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (400, 21, 2006, 1028, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (401, 21, 2005, 885, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (402, 5, 2023, 30146, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (403, 5, 2022, 28576, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (404, 5, 2021, 28077, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (405, 5, 2020, 25041, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (406, 5, 2019, 23606, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (407, 5, 2018, 21589, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (408, 5, 2017, 20066, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (409, 5, 2016, 18023, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (410, 5, 2015, 16041, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (411, 5, 2014, 14624, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (412, 5, 2013, 13028, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (413, 5, 2012, 11595, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (414, 5, 2011, 10161, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (415, 5, 2010, 8065, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (416, 5, 2009, 6651, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (417, 5, 2008, 5900, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (418, 5, 2007, 4771, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (419, 5, 2006, 3900, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (420, 5, 2005, 3448, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (421, 22, 2023, 60133, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (422, 22, 2022, 56610, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (423, 22, 2021, 54088, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (424, 22, 2020, 48502, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (425, 22, 2019, 46364, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (426, 22, 2018, 42902, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (427, 22, 2017, 37905, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (428, 22, 2016, 33139, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (429, 22, 2015, 30342, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (430, 22, 2014, 28891, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (431, 22, 2013, 26518, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (432, 22, 2012, 23922, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (433, 22, 2011, 21051, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (434, 22, 2010, 17225, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (435, 22, 2009, 14191, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (436, 22, 2008, 12756, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (437, 22, 2007, 10562, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (438, 22, 2006, 8495, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (439, 22, 2005, 7196, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (440, 23, 2023, 20913, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (441, 23, 2022, 20010, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (442, 23, 2021, 19459, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (443, 23, 2020, 17860, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (444, 23, 2019, 16769, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (445, 23, 2018, 15353, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (446, 23, 2017, 13605, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (447, 23, 2016, 11792, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (448, 23, 2015, 10541, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (449, 23, 2014, 9173, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (450, 23, 2013, 7973, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (451, 23, 2012, 6742, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (452, 23, 2011, 5616, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (453, 23, 2010, 4519, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (454, 23, 2009, 3857, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (455, 23, 2008, 3505, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (456, 23, 2007, 2848, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (457, 23, 2006, 2264, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (458, 23, 2005, 1940, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (459, 24, 2023, 30021, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (460, 24, 2022, 28556, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (461, 24, 2021, 27162, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (462, 24, 2020, 24556, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (463, 24, 2019, 23224, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (464, 24, 2018, 20881, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (465, 24, 2017, 18486, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (466, 24, 2016, 16369, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (467, 24, 2015, 14960, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (468, 24, 2014, 14042, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (469, 24, 2013, 12826, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (470, 24, 2012, 11097, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (471, 24, 2011, 9523, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (472, 24, 2010, 7735, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (473, 24, 2009, 6574, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (474, 24, 2008, 6017, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (475, 24, 2007, 5077, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (476, 24, 2006, 4091, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (477, 24, 2005, 3498, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (478, 30, 2023, 2393, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (479, 30, 2022, 2150, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (480, 30, 2021, 2080, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (481, 30, 2020, 1903, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (482, 30, 2019, 1698, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (483, 30, 2018, 1548, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (484, 30, 2017, 1349, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (485, 30, 2016, 1173, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (486, 30, 2015, 1043, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (487, 30, 2014, 940, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (488, 30, 2013, 828, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (489, 30, 2012, 710, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (490, 30, 2011, 612, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (491, 30, 2010, 513, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (492, 30, 2009, 446, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (493, 30, 2008, 398, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (494, 30, 2007, 344, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (495, 30, 2006, 286, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (496, 30, 2005, 243, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (497, 25, 2023, 33786, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (498, 25, 2022, 32838, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (499, 25, 2021, 30122, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (500, 25, 2020, 26014, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (501, 25, 2019, 25793, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (502, 25, 2018, 23942, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (503, 25, 2017, 21474, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (504, 25, 2016, 19046, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (505, 25, 2015, 17899, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (506, 25, 2014, 17403, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (507, 25, 2013, 15905, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (508, 25, 2012, 14142, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (509, 25, 2011, 12175, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (510, 25, 2010, 9845, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (511, 25, 2009, 7998, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (512, 25, 2008, 7178, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (513, 25, 2007, 5682, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (514, 25, 2006, 4596, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (515, 25, 2005, 3817, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (516, 26, 2023, 11864, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (517, 26, 2022, 11121, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (518, 26, 2021, 10226, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (519, 26, 2020, 8980, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (520, 26, 2019, 8718, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (521, 26, 2018, 8104, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (522, 26, 2017, 7337, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (523, 26, 2016, 6908, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (524, 26, 2015, 6557, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (525, 26, 2014, 6518, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (526, 26, 2013, 6015, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (527, 26, 2012, 5393, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (528, 26, 2011, 4817, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (529, 26, 2010, 3944, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (530, 26, 2009, 3268, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (531, 26, 2008, 3072, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (532, 26, 2007, 2675, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (533, 26, 2006, 2203, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (534, 26, 2005, 1865, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (535, 27, 2023, 3799, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (536, 27, 2022, 3623, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (537, 27, 2021, 3385, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (538, 27, 2020, 3010, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (539, 27, 2019, 2941, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (540, 27, 2018, 2748, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (541, 27, 2017, 2465, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (542, 27, 2016, 2258, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (543, 27, 2015, 2011, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (544, 27, 2014, 1848, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (545, 27, 2013, 1713, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (546, 27, 2012, 1529, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (547, 27, 2011, 1370, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (548, 27, 2010, 1144, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (549, 27, 2009, 940, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (550, 27, 2008, 897, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (551, 27, 2007, 720, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (552, 27, 2006, 585, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (553, 27, 2005, 499, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (554, 31, 2023, 5315, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (555, 31, 2022, 5105, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (556, 31, 2021, 4588, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (557, 31, 2020, 3956, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (558, 31, 2019, 3749, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (559, 31, 2018, 3510, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (560, 31, 2017, 3200, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (561, 31, 2016, 2781, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (562, 31, 2015, 2579, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (563, 31, 2014, 2474, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (564, 31, 2013, 2328, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (565, 31, 2012, 2131, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (566, 31, 2011, 1932, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (567, 31, 2010, 1572, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (568, 31, 2009, 1267, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (569, 31, 2008, 1139, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (570, 31, 2007, 878, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (571, 31, 2006, 683, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (572, 31, 2005, 580, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (573, 32, 2023, 19126, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (574, 32, 2022, 18043, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (575, 32, 2021, 16312, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (576, 32, 2020, 13801, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (577, 32, 2019, 13597, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (578, 32, 2018, 12809, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (579, 32, 2017, 11160, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (580, 32, 2016, 9631, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (581, 32, 2015, 9307, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (582, 32, 2014, 9265, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (583, 32, 2013, 8393, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (584, 32, 2012, 7412, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (585, 32, 2011, 6532, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (586, 32, 2010, 5360, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (587, 32, 2009, 4237, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (588, 32, 2008, 4143, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (589, 32, 2007, 3500, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (590, 32, 2006, 2957, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (591, 32, 2005, 2521, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gdp_data` VALUES (592, 1, 2024, 1349084, 41314, 28227, 54188, 23119, 34557, 34557);
INSERT INTO `gdp_data` VALUES (593, 1, 2023, 1294272, 39218, 26796, 51821, 21691, 32994, 18175);
INSERT INTO `gdp_data` VALUES (594, 1, 2022, 1234029, 36883, 24538, 49283, 20133, 30391, 16632);
INSERT INTO `gdp_data` VALUES (595, 1, 2021, 1173823, 35128, 24100, 47412, 18931, 30307, 15916);
INSERT INTO `gdp_data` VALUES (596, 1, 2020, 1034868, 32189, 21210, 43834, 17131, 27007, 13713);
INSERT INTO `gdp_data` VALUES (597, 1, 2019, 1005872, 30733, 21559, 42359, 16021, 28063, 13328);
INSERT INTO `gdp_data` VALUES (598, 1, 2018, 936010, 28228, 19853, 39251, 14617, 26112, 12124);
INSERT INTO `gdp_data` VALUES (599, 1, 2017, 847383, 25974, 18322, 36396, 13432, 24445, 10955);
INSERT INTO `gdp_data` VALUES (600, 1, 2016, 761193, 23821, 17111, 33616, 12363, 23079, 10130);
INSERT INTO `gdp_data` VALUES (601, 1, 2015, 702512, 21966, 15712, 31195, 11422, 21392, 9223);
INSERT INTO `gdp_data` VALUES (602, 1, 2014, 655783, 20167, 14491, 28844, 10489, 19968, 8383);
INSERT INTO `gdp_data` VALUES (603, 1, 2013, 603660, 18311, 13220, 26467, 9430, 18488, 7485);
INSERT INTO `gdp_data` VALUES (604, 1, 2012, 547511, 16510, 12054, 24127, 8389, 17107, 6667);
INSERT INTO `gdp_data` VALUES (605, 1, 2011, 495708, 14551, 10820, 21427, 7394, 15554, 5892);
INSERT INTO `gdp_data` VALUES (606, 1, 2010, 419253, 12520, 9378, 18779, 6272, 13821, 4945);
INSERT INTO `gdp_data` VALUES (607, 1, 2009, 354522, 10977, 8377, 16901, 5435, 12558, 4464);
INSERT INTO `gdp_data` VALUES (608, 1, 2008, 324318, 9957, 7548, 15549, 4999, 11489, 4054);
INSERT INTO `gdp_data` VALUES (609, 1, 2007, 274180, 8584, 6592, 13603, 4327, 10196, 3536);
INSERT INTO `gdp_data` VALUES (610, 1, 2006, 222578, 7229, 5634, 11620, 3731, 8851, 3072);
INSERT INTO `gdp_data` VALUES (611, 1, 2005, 189908, 6385, 5035, 10382, 3370, 8068, 2749);

-- ----------------------------
-- Table structure for population
-- ----------------------------
DROP TABLE IF EXISTS `population`;
CREATE TABLE `population`  (
  `Province` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '省份、自治区、以及全国',
  `year_2023` int NULL DEFAULT NULL COMMENT '2023年末总人口数量',
  `year_2022` int NULL DEFAULT NULL COMMENT '2022年末总人口数量',
  `year_2021` int NULL DEFAULT NULL COMMENT '2021年末总人口数量',
  `year_2020` int NULL DEFAULT NULL COMMENT '2020年末总人口数量',
  PRIMARY KEY (`Province`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of population
-- ----------------------------
INSERT INTO `population` VALUES ('上海市', 2487, 2475, 2489, 2488);
INSERT INTO `population` VALUES ('云南省', 4673, 4693, 4690, 4722);
INSERT INTO `population` VALUES ('全国', 140967, 141175, 141260, 141212);
INSERT INTO `population` VALUES ('内蒙古自治区', 2396, 2401, 2400, 2403);
INSERT INTO `population` VALUES ('北京市', 2186, 2184, 2189, 2189);
INSERT INTO `population` VALUES ('吉林省', 2339, 2348, 2375, 2399);
INSERT INTO `population` VALUES ('四川省', 8368, 8374, 8372, 8371);
INSERT INTO `population` VALUES ('天津市', 1364, 1363, 1373, 1387);
INSERT INTO `population` VALUES ('宁夏回族自治区', 729, 728, 725, 721);
INSERT INTO `population` VALUES ('安徽省', 6121, 6127, 6113, 6105);
INSERT INTO `population` VALUES ('山东省', 10123, 10163, 10170, 10165);
INSERT INTO `population` VALUES ('山西省', 3466, 3481, 3480, 3490);
INSERT INTO `population` VALUES ('广东省', 12706, 12657, 12684, 12624);
INSERT INTO `population` VALUES ('广西壮族自治区', 5027, 5047, 5037, 5019);
INSERT INTO `population` VALUES ('新疆维吾尔自治区', 2598, 2587, 2589, 2590);
INSERT INTO `population` VALUES ('江苏省', 8526, 8515, 8505, 8477);
INSERT INTO `population` VALUES ('江西省', 4515, 4528, 4517, 4519);
INSERT INTO `population` VALUES ('河北省', 7393, 7420, 7448, 7464);
INSERT INTO `population` VALUES ('河南省', 9815, 9872, 9883, 9941);
INSERT INTO `population` VALUES ('浙江省', 6627, 6577, 6540, 6468);
INSERT INTO `population` VALUES ('海南省', 1043, 1027, 1020, 1012);
INSERT INTO `population` VALUES ('湖北省', 5838, 5844, 5830, 5745);
INSERT INTO `population` VALUES ('湖南省', 6568, 6604, 6622, 6645);
INSERT INTO `population` VALUES ('甘肃省', 2465, 2492, 2490, 2501);
INSERT INTO `population` VALUES ('福建省', 4183, 4188, 4187, 4161);
INSERT INTO `population` VALUES ('西藏自治区', 365, 364, 366, 366);
INSERT INTO `population` VALUES ('贵州省', 3865, 3856, 3852, 3858);
INSERT INTO `population` VALUES ('辽宁省', 4182, 4197, 4229, 4255);
INSERT INTO `population` VALUES ('重庆市', 3191, 3213, 3212, 3209);
INSERT INTO `population` VALUES ('陕西省', 3952, 3956, 3954, 3955);
INSERT INTO `population` VALUES ('青海省', 594, 595, 594, 593);
INSERT INTO `population` VALUES ('香港特别行政区', 753, 747, 741, 748);
INSERT INTO `population` VALUES ('黑龙江省', 3062, 3099, 3125, 3171);

-- ----------------------------
-- Table structure for population_data
-- ----------------------------
DROP TABLE IF EXISTS `population_data`;
CREATE TABLE `population_data`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `province_id` int NOT NULL,
  `year` year NOT NULL,
  `total` int NULL DEFAULT NULL,
  `birth_rate` float NULL DEFAULT NULL,
  `death_rate` float NULL DEFAULT NULL,
  `nature_growth_rate` float NULL DEFAULT NULL,
  `country` int NULL DEFAULT NULL,
  `city` int NULL DEFAULT NULL,
  `man` int NULL DEFAULT NULL,
  `woman` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_province_id`(`province_id` ASC) USING BTREE,
  CONSTRAINT `fk_province_id` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 700 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of population_data
-- ----------------------------
INSERT INTO `population_data` VALUES (1, 1, 2023, 140967, 12.09, 6.81, 5.28, 47700, 93267, 72032, 68935);
INSERT INTO `population_data` VALUES (2, 1, 2022, 141175, 12.1, 6.93, 5.17, 49104, 92071, 72206, 68969);
INSERT INTO `population_data` VALUES (3, 1, 2021, 141260, 12.14, 7.06, 5.08, 49835, 91425, 72311, 68949);
INSERT INTO `population_data` VALUES (4, 1, 2020, 141212, 11.95, 7.08, 4.87, 50992, 90220, 72357, 68855);
INSERT INTO `population_data` VALUES (5, 1, 2019, 141008, 11.9, 7.11, 4.79, 52582, 88426, 72039, 68969);
INSERT INTO `population_data` VALUES (6, 1, 2018, 140541, 13.27, 7.14, 6.13, 54108, 86433, 71864, 68677);
INSERT INTO `population_data` VALUES (7, 1, 2017, 140011, 14.57, 7.13, 7.43, 55668, 84343, 71650, 68361);
INSERT INTO `population_data` VALUES (8, 1, 2016, 139232, 13.03, 7.13, 5.9, 57308, 81924, 71307, 67925);
INSERT INTO `population_data` VALUES (9, 1, 2015, 138326, 13.83, 7.12, 6.71, 59024, 79302, 70857, 67469);
INSERT INTO `population_data` VALUES (10, 1, 2014, 137646, 11.99, 7.07, 4.93, 60908, 76738, 70522, 67124);
INSERT INTO `population_data` VALUES (11, 1, 2013, 136726, 13.57, 7.04, 6.53, 62224, 74502, 70063, 66663);
INSERT INTO `population_data` VALUES (12, 1, 2012, 135922, 12.64, 7.06, 5.58, 63747, 72175, 69660, 66262);
INSERT INTO `population_data` VALUES (13, 1, 2011, 134916, 10.86, 7.08, 3.78, 64989, 69927, 69161, 65755);
INSERT INTO `population_data` VALUES (14, 1, 2010, 134091, 10.41, 7.09, 3.32, 67113, 66978, 68748, 65343);
INSERT INTO `population_data` VALUES (15, 1, 2009, 133450, 8.52, 7.07, 1.45, 68938, 64512, 68647, 64803);
INSERT INTO `population_data` VALUES (16, 1, 2008, 132802, 7.52, 7.18, 0.34, 70399, 62403, 68357, 64445);
INSERT INTO `population_data` VALUES (17, 1, 2007, 132129, 6.77, 7.37, -0.6, 71496, 60633, 68048, 64081);
INSERT INTO `population_data` VALUES (18, 1, 2006, 131448, 6.39, 7.87, -1.48, 73160, 58288, 67728, 63720);
INSERT INTO `population_data` VALUES (19, 1, 2005, 130756, 6.77, 7.76, -0.99, 74544, 56212, 67375, 63381);
INSERT INTO `population_data` VALUES (20, 2, 2023, 2186, 5.63, 6.13, -0.5, 266, 1920, 11718, 11299);
INSERT INTO `population_data` VALUES (21, 2, 2022, 2184, 5.67, 5.72, -0.05, 271, 1913, 11415, 10957);
INSERT INTO `population_data` VALUES (22, 2, 2021, 2189, 6.35, 5.39, 0.96, 273, 1916, 11835, 11351);
INSERT INTO `population_data` VALUES (23, 2, 2020, 2189, 6.99, 5.19, 1.8, 273, 1916, NULL, NULL);
INSERT INTO `population_data` VALUES (24, 2, 2019, 2190, 8.12, 5.49, 2.63, 277, 1913, 8398, 8269);
INSERT INTO `population_data` VALUES (25, 2, 2018, 2192, 8.24, 5.58, 2.66, 283, 1909, 8781, 8892);
INSERT INTO `population_data` VALUES (26, 2, 2017, 2194, 9.06, 5.3, 3.76, 287, 1907, 9017, 8784);
INSERT INTO `population_data` VALUES (27, 2, 2016, 2195, 9.32, 5.2, 4.12, 291, 1904, 9324, 8808);
INSERT INTO `population_data` VALUES (28, 2, 2015, 2188, 7.96, 4.95, 3.01, 291, 1897, 175460, 160315);
INSERT INTO `population_data` VALUES (29, 2, 2014, 2171, 9.75, 4.92, 4.83, 293, 1878, 8977, 8780);
INSERT INTO `population_data` VALUES (30, 2, 2013, 2125, 8.93, 4.52, 4.41, 289, 1836, 9047, 8407);
INSERT INTO `population_data` VALUES (31, 2, 2012, 2078, 9.05, 4.31, 4.74, 285, 1793, 8851, 8415);
INSERT INTO `population_data` VALUES (32, 2, 2011, 2024, 8.29, 4.27, 4.02, 279, 1745, 8796, 8450);
INSERT INTO `population_data` VALUES (33, 2, 2010, 1962, 7.48, 4.41, 3.07, 275, 1686, NULL, NULL);
INSERT INTO `population_data` VALUES (34, 2, 2009, 1860, 8.06, 4.56, 3.5, 279, 1581, 7705, 7390);
INSERT INTO `population_data` VALUES (35, 2, 2008, 1771, 8.17, 4.75, 3.42, 267, 1504, 7530, 7284);
INSERT INTO `population_data` VALUES (36, 2, 2007, 1676, 8.32, 4.92, 3.4, 260, 1416, 7243, 7311);
INSERT INTO `population_data` VALUES (37, 2, 2006, 1601, 6.26, 4.97, 1.29, 251, 1350, 7046, 7248);
INSERT INTO `population_data` VALUES (38, 2, 2005, 1538, 6.29, 5.2, 1.09, 252, 1286, 103122, 100461);
INSERT INTO `population_data` VALUES (39, 3, 2023, 2487, 3.95, 6.37, -2.42, 262, 2225, 13555, 12632);
INSERT INTO `population_data` VALUES (40, 3, 2022, 2475, 4.35, 5.96, -1.61, 264, 2211, 13153, 12194);
INSERT INTO `population_data` VALUES (41, 3, 2021, 2489, 4.67, 5.59, -0.92, 266, 2223, 13674, 12691);
INSERT INTO `population_data` VALUES (42, 3, 2020, 2488, 5.02, 5.58, -0.56, 266, 2222, NULL, NULL);
INSERT INTO `population_data` VALUES (43, 3, 2019, 2481, 7, 5.5, 1.5, 267, 2214, 9748, 9038);
INSERT INTO `population_data` VALUES (44, 3, 2018, 2475, 7.2, 5.4, 1.8, 269, 2206, 10256, 9621);
INSERT INTO `population_data` VALUES (45, 3, 2017, 2466, 8.1, 5.3, 2.8, 269, 2197, 10085, 9740);
INSERT INTO `population_data` VALUES (46, 3, 2016, 2467, 9, 5, 4, 271, 2196, 10382, 9806);
INSERT INTO `population_data` VALUES (47, 3, 2015, 2458, 7.52, 5.07, 2.45, 282, 2176, 194485, 179471);
INSERT INTO `population_data` VALUES (48, 3, 2014, 2467, 8.35, 5.21, 3.14, 264, 2203, 10334, 9685);
INSERT INTO `population_data` VALUES (49, 3, 2013, 2448, 8.18, 5.24, 2.94, 255, 2193, 10268, 9664);
INSERT INTO `population_data` VALUES (50, 3, 2012, 2399, 9.56, 5.36, 4.2, 257, 2142, 10349, 9513);
INSERT INTO `population_data` VALUES (51, 3, 2011, 2356, 6.97, 5.1, 1.87, 252, 2104, 10644, 9412);
INSERT INTO `population_data` VALUES (52, 3, 2010, 2303, 7.05, 5.07, 1.98, 246, 2056, NULL, NULL);
INSERT INTO `population_data` VALUES (53, 3, 2009, 2210, 8.64, 5.94, 2.7, 252, 1958, 8363, 8452);
INSERT INTO `population_data` VALUES (54, 3, 2008, 2141, 8.89, 6.17, 2.72, 244, 1897, 8435, 8420);
INSERT INTO `population_data` VALUES (55, 3, 2007, 2064, 9.07, 6.03, 3.04, 233, 1830, 8325, 8384);
INSERT INTO `population_data` VALUES (56, 3, 2006, 1964, 7.47, 5.89, 1.58, 222, 1742, 8209, 8316);
INSERT INTO `population_data` VALUES (57, 3, 2005, 1890, 7.04, 6.08, 0.96, 206, 1684, 118419, 116932);
INSERT INTO `population_data` VALUES (58, 4, 2023, 1364, 4.47, 7.04, -2.57, 198, 1166, 7343, 7019);
INSERT INTO `population_data` VALUES (59, 4, 2022, 1363, 4.75, 6.43, -1.68, 203, 1160, 7150, 6809);
INSERT INTO `population_data` VALUES (60, 4, 2021, 1373, 5.3, 6.23, -0.93, 208, 1165, 7457, 7083);
INSERT INTO `population_data` VALUES (61, 4, 2020, 1387, 5.99, 5.92, 0.07, 212, 1175, NULL, NULL);
INSERT INTO `population_data` VALUES (62, 4, 2019, 1385, 6.73, 5.3, 1.43, 217, 1168, 6675, 5419);
INSERT INTO `population_data` VALUES (63, 4, 2018, 1383, 6.67, 5.42, 1.25, 222, 1161, 6863, 5931);
INSERT INTO `population_data` VALUES (64, 4, 2017, 1410, 7.65, 5.05, 2.6, 232, 1178, 6725, 6053);
INSERT INTO `population_data` VALUES (65, 4, 2016, 1443, 7.37, 5.54, 1.83, 241, 1202, 6961, 6085);
INSERT INTO `population_data` VALUES (66, 4, 2015, 1439, 5.84, 5.61, 0.23, 246, 1193, 130778, 108592);
INSERT INTO `population_data` VALUES (67, 4, 2014, 1429, 8.19, 6.05, 2.14, 249, 1180, 6269, 6248);
INSERT INTO `population_data` VALUES (68, 4, 2013, 1410, 8.28, 6, 2.28, 250, 1160, 6040, 6109);
INSERT INTO `population_data` VALUES (69, 4, 2012, 1378, 8.75, 6.12, 2.63, 254, 1124, 5854, 5937);
INSERT INTO `population_data` VALUES (70, 4, 2011, 1341, 8.58, 6.08, 2.5, 262, 1079, 5754, 5822);
INSERT INTO `population_data` VALUES (71, 4, 2010, 1299, 8.18, 5.58, 2.6, 266, 1034, NULL, NULL);
INSERT INTO `population_data` VALUES (72, 4, 2009, 1228, 8.3, 5.7, 2.6, 270, 958, 5298, 5175);
INSERT INTO `population_data` VALUES (73, 4, 2008, 1176, 8.13, 5.94, 2.19, 268, 908, 4986, 5129);
INSERT INTO `population_data` VALUES (74, 4, 2007, 1115, 7.91, 5.86, 2.05, 264, 851, 4956, 4940);
INSERT INTO `population_data` VALUES (75, 4, 2006, 1075, 7.67, 6.07, 1.6, 261, 814, 4768, 4926);
INSERT INTO `population_data` VALUES (76, 4, 2005, 1043, 7.44, 6.01, 1.43, 259, 783, 69308, 68752);
INSERT INTO `population_data` VALUES (77, 5, 2023, 3191, 5.58, 8.9, -3.32, 904, 2287, 16928, 16673);
INSERT INTO `population_data` VALUES (78, 5, 2022, 3213, 5.98, 8.09, -2.11, 933, 2280, 16623, 16291);
INSERT INTO `population_data` VALUES (79, 5, 2021, 3212, 6.49, 8.04, -1.55, 953, 2259, 17206, 16814);
INSERT INTO `population_data` VALUES (80, 5, 2020, 3209, 7.47, 7.7, -0.23, 980, 2229, NULL, NULL);
INSERT INTO `population_data` VALUES (81, 5, 2019, 3188, 10.48, 7.57, 2.91, 1013, 2175, 12147, 12126);
INSERT INTO `population_data` VALUES (82, 5, 2018, 3163, 11.02, 7.54, 3.48, 1056, 2107, 12730, 12686);
INSERT INTO `population_data` VALUES (83, 5, 2017, 3144, 11.18, 7.27, 3.91, 1100, 2044, 12641, 12696);
INSERT INTO `population_data` VALUES (84, 5, 2016, 3110, 11.77, 7.24, 4.53, 1140, 1970, 12992, 12568);
INSERT INTO `population_data` VALUES (85, 5, 2015, 3070, 11.05, 7.19, 3.86, 1183, 1887, 234986, 233577);
INSERT INTO `population_data` VALUES (86, 5, 2014, 3043, 10.67, 7.05, 3.62, 1225, 1818, 12696, 11991);
INSERT INTO `population_data` VALUES (87, 5, 2013, 3011, 10.37, 6.77, 3.6, 1256, 1755, 12494, 12018);
INSERT INTO `population_data` VALUES (88, 5, 2012, 2975, 10.86, 6.86, 4, 1290, 1685, 12370, 12203);
INSERT INTO `population_data` VALUES (89, 5, 2011, 2944, 9.88, 6.71, 3.17, 1325, 1619, 12716, 12223);
INSERT INTO `population_data` VALUES (90, 5, 2010, 2885, 9.17, 6.4, 2.77, 1355, 1529, NULL, NULL);
INSERT INTO `population_data` VALUES (91, 5, 2009, 2859, 9.9, 6.2, 3.7, 1384, 1475, 12683, 12601);
INSERT INTO `population_data` VALUES (92, 5, 2008, 2839, 10.1, 6.3, 3.8, 1420, 1419, 12878, 12667);
INSERT INTO `population_data` VALUES (93, 5, 2007, 2816, 10.1, 6.3, 3.8, 1456, 1360, 13088, 12762);
INSERT INTO `population_data` VALUES (94, 5, 2006, 2808, 9.9, 6.5, 3.4, 1497, 1311, 13167, 12838);
INSERT INTO `population_data` VALUES (95, 5, 2005, 2798, 9.4, 6.4, 3, 1533, 1265, 186623, 183744);
INSERT INTO `population_data` VALUES (96, 6, 2023, 7393, 5.54, 8.33, -2.79, 2752, 4641, 38660, 39186);
INSERT INTO `population_data` VALUES (97, 6, 2022, 7420, 6.09, 7.8, -1.71, 2845, 4575, 37765, 38237);
INSERT INTO `population_data` VALUES (98, 6, 2021, 7448, 7.15, 7.58, -0.43, 2894, 4554, 39240, 39645);
INSERT INTO `population_data` VALUES (99, 6, 2020, 7464, 8.16, 7.22, 0.94, 2980, 4484, NULL, NULL);
INSERT INTO `population_data` VALUES (100, 6, 2019, 7447, 10.83, 6.12, 4.71, 3070, 4377, 30160, 28927);
INSERT INTO `population_data` VALUES (101, 6, 2018, 7426, 11.26, 6.38, 4.88, 3169, 4257, 31210, 30697);
INSERT INTO `population_data` VALUES (102, 6, 2017, 7409, 13.2, 6.6, 6.6, 3279, 4130, 31523, 30563);
INSERT INTO `population_data` VALUES (103, 6, 2016, 7375, 12.42, 6.36, 6.06, 3402, 3973, 32082, 30668);
INSERT INTO `population_data` VALUES (104, 6, 2015, 7345, 11.35, 5.79, 5.56, 3550, 3795, 583919, 571624);
INSERT INTO `population_data` VALUES (105, 6, 2014, 7323, 13.18, 6.23, 6.95, 3708, 3615, 31198, 29738);
INSERT INTO `population_data` VALUES (106, 6, 2013, 7288, 13.04, 6.87, 6.17, 3788, 3500, 31069, 29449);
INSERT INTO `population_data` VALUES (107, 6, 2012, 7262, 12.88, 6.41, 6.47, 3878, 3384, 31087, 29719);
INSERT INTO `population_data` VALUES (108, 6, 2011, 7232, 13.02, 6.52, 6.5, 3935, 3297, 32083, 29778);
INSERT INTO `population_data` VALUES (109, 6, 2010, 7194, 13.22, 6.41, 6.81, 3993, 3201, NULL, NULL);
INSERT INTO `population_data` VALUES (110, 6, 2009, 7034, 12.93, 6.43, 6.5, 3957, 3077, 31671, 30572);
INSERT INTO `population_data` VALUES (111, 6, 2008, 6989, 13.04, 6.49, 6.55, 4060, 2928, 32103, 30879);
INSERT INTO `population_data` VALUES (112, 6, 2007, 6943, 13.33, 6.78, 6.55, 4148, 2795, 32330, 31171);
INSERT INTO `population_data` VALUES (113, 6, 2006, 6898, 12.82, 6.59, 6.23, 4224, 2674, 32179, 31495);
INSERT INTO `population_data` VALUES (114, 6, 2005, 6851, 12.84, 6.75, 6.09, 4269, 2582, 455500, 451355);
INSERT INTO `population_data` VALUES (115, 7, 2023, 3466, 6.13, 8.38, -2.25, 1214, 2252, 18634, 17862);
INSERT INTO `population_data` VALUES (116, 7, 2022, 3481, 6.75, 7.73, -0.98, 1255, 2226, 18209, 17446);
INSERT INTO `population_data` VALUES (117, 7, 2021, 3480, 7.06, 7.32, -0.26, 1273, 2207, 18828, 18035);
INSERT INTO `population_data` VALUES (118, 7, 2020, 3490, 8.26, 7.02, 1.24, 1308, 2182, NULL, NULL);
INSERT INTO `population_data` VALUES (119, 7, 2019, 3497, 9.12, 5.85, 3.27, 1354, 2143, 14672, 14339);
INSERT INTO `population_data` VALUES (120, 7, 2018, 3502, 9.63, 5.32, 4.31, 1406, 2096, 15593, 14888);
INSERT INTO `population_data` VALUES (121, 7, 2017, 3510, 11.06, 5.45, 5.61, 1453, 2057, 15887, 14664);
INSERT INTO `population_data` VALUES (122, 7, 2016, 3514, 10.29, 5.52, 4.77, 1502, 2012, 15909, 15002);
INSERT INTO `population_data` VALUES (123, 7, 2015, 3519, 9.98, 5.56, 4.42, 1553, 1966, 295031, 274461);
INSERT INTO `population_data` VALUES (124, 7, 2014, 3528, 10.92, 5.93, 4.99, 1612, 1916, 15298, 14809);
INSERT INTO `population_data` VALUES (125, 7, 2013, 3535, 10.81, 5.57, 5.24, 1666, 1869, 15381, 14576);
INSERT INTO `population_data` VALUES (126, 7, 2012, 3548, 10.7, 5.83, 4.87, 1727, 1821, 15393, 14736);
INSERT INTO `population_data` VALUES (127, 7, 2011, 3562, 10.47, 5.61, 4.86, 1788, 1774, 15718, 14980);
INSERT INTO `population_data` VALUES (128, 7, 2010, 3574, 10.68, 5.38, 5.3, 1857, 1717, NULL, NULL);
INSERT INTO `population_data` VALUES (129, 7, 2009, 3427, 10.87, 5.98, 4.89, 1851, 1576, 15503, 14875);
INSERT INTO `population_data` VALUES (130, 7, 2008, 3411, 11.32, 6.01, 5.31, 1872, 1539, 15611, 15167);
INSERT INTO `population_data` VALUES (131, 7, 2007, 3393, 11.3, 5.97, 5.33, 1899, 1494, 15829, 15240);
INSERT INTO `population_data` VALUES (132, 7, 2006, 3375, 11.48, 5.73, 5.75, 1923, 1451, 15766, 15416);
INSERT INTO `population_data` VALUES (133, 7, 2005, 3355, 12.02, 6, 6.02, 1942, 1413, 225294, 218802);
INSERT INTO `population_data` VALUES (134, 8, 2023, 4182, 4.06, 9.69, -5.63, 1108, 3074, 21693, 22342);
INSERT INTO `population_data` VALUES (135, 8, 2022, 4197, 4.08, 9.04, -4.96, 1133, 3064, 21196, 21795);
INSERT INTO `population_data` VALUES (136, 8, 2021, 4229, 4.71, 8.89, -4.18, 1150, 3079, 22127, 22671);
INSERT INTO `population_data` VALUES (137, 8, 2020, 4255, 5.16, 8.59, -3.43, 1185, 3070, NULL, NULL);
INSERT INTO `population_data` VALUES (138, 8, 2019, 4277, 6.45, 7.25, -0.8, 1231, 3046, 16960, 16840);
INSERT INTO `population_data` VALUES (139, 8, 2018, 4291, 6.39, 7.39, -1, 1276, 3015, 17905, 17839);
INSERT INTO `population_data` VALUES (140, 8, 2017, 4312, 6.49, 6.93, -0.44, 1316, 2996, 17996, 17973);
INSERT INTO `population_data` VALUES (141, 8, 2016, 4327, 6.6, 6.78, -0.18, 1347, 2980, 18503, 18165);
INSERT INTO `population_data` VALUES (142, 8, 2015, 4338, 6.17, 6.59, -0.42, 1386, 2952, 341193, 339666);
INSERT INTO `population_data` VALUES (143, 8, 2014, 4358, 6.49, 6.23, 0.26, 1436, 2922, 18363, 17873);
INSERT INTO `population_data` VALUES (144, 8, 2013, 4365, 6.09, 6.12, -0.03, 1464, 2901, 18292, 17939);
INSERT INTO `population_data` VALUES (145, 8, 2012, 4375, 6.15, 6.54, -0.39, 1503, 2872, 18359, 18263);
INSERT INTO `population_data` VALUES (146, 8, 2011, 4379, 5.71, 6.05, -0.34, 1574, 2805, 18846, 18601);
INSERT INTO `population_data` VALUES (147, 8, 2010, 4375, 6.68, 6.26, 0.42, 1658, 2717, NULL, NULL);
INSERT INTO `population_data` VALUES (148, 8, 2009, 4341, 6.06, 5.09, 0.97, 1721, 2620, 19344, 19085);
INSERT INTO `population_data` VALUES (149, 8, 2008, 4315, 6.32, 5.22, 1.1, 1724, 2591, 19583, 19405);
INSERT INTO `population_data` VALUES (150, 8, 2007, 4298, 6.89, 5.36, 1.53, 1754, 2544, 19778, 19539);
INSERT INTO `population_data` VALUES (151, 8, 2006, 4271, 6.4, 5.3, 1.1, 1752, 2519, 19811, 19420);
INSERT INTO `population_data` VALUES (152, 8, 2005, 4221, 7.01, 6.04, 0.97, 1743, 2478, 280107, 278620);
INSERT INTO `population_data` VALUES (153, 9, 2023, 2339, 3.76, 9.17, -5.41, 825, 1514, 12287, 12342);
INSERT INTO `population_data` VALUES (154, 9, 2022, 2348, 4.32, 8.39, -4.07, 852, 1496, 12012, 12033);
INSERT INTO `population_data` VALUES (155, 9, 2021, 2375, 4.7, 8.08, -3.38, 870, 1505, 12597, 12560);
INSERT INTO `population_data` VALUES (156, 9, 2020, 2399, 4.84, 7.81, -2.97, 896, 1503, NULL, NULL);
INSERT INTO `population_data` VALUES (157, 9, 2019, 2448, 6.05, 6.9, -0.85, 939, 1509, 10570, 10369);
INSERT INTO `population_data` VALUES (158, 9, 2018, 2484, 6.62, 6.26, 0.36, 972, 1512, 11198, 10975);
INSERT INTO `population_data` VALUES (159, 9, 2017, 2526, 6.76, 6.5, 0.26, 1018, 1508, 11346, 11078);
INSERT INTO `population_data` VALUES (160, 9, 2016, 2567, 5.55, 5.6, -0.05, 1059, 1508, 11665, 11280);
INSERT INTO `population_data` VALUES (161, 9, 2015, 2613, 5.87, 5.53, 0.34, 1107, 1506, 216398, 212112);
INSERT INTO `population_data` VALUES (162, 9, 2014, 2642, 6.62, 6.22, 0.4, 1141, 1501, 11561, 11154);
INSERT INTO `population_data` VALUES (163, 9, 2013, 2668, 5.36, 5.04, 0.32, 1181, 1487, 11696, 11010);
INSERT INTO `population_data` VALUES (164, 9, 2012, 2698, 5.73, 5.37, 0.36, 1227, 1471, 11670, 11279);
INSERT INTO `population_data` VALUES (165, 9, 2011, 2725, 6.53, 5.51, 1.02, 1270, 1455, 12002, 11488);
INSERT INTO `population_data` VALUES (166, 9, 2010, 2747, 7.91, 5.88, 2.03, 1281, 1465, NULL, NULL);
INSERT INTO `population_data` VALUES (167, 9, 2009, 2740, 6.69, 4.74, 1.95, 1279, 1461, 12465, 11884);
INSERT INTO `population_data` VALUES (168, 9, 2008, 2734, 6.65, 5.04, 1.61, 1279, 1455, 12527, 12237);
INSERT INTO `population_data` VALUES (169, 9, 2007, 2730, 7.55, 5.05, 2.5, 1279, 1451, 12697, 12370);
INSERT INTO `population_data` VALUES (170, 9, 2006, 2723, 7.67, 5, 2.67, 1281, 1442, 12772, 12471);
INSERT INTO `population_data` VALUES (171, 9, 2005, 2716, 7.89, 5.32, 2.57, 1290, 1426, 182545, 176968);
INSERT INTO `population_data` VALUES (172, 10, 2023, 3062, 2.92, 9.84, -6.92, 1007, 2055, 16111, 16131);
INSERT INTO `population_data` VALUES (173, 10, 2022, 3099, 3.34, 9.09, -5.75, 1047, 2052, 15869, 15875);
INSERT INTO `population_data` VALUES (174, 10, 2021, 3125, 3.59, 8.7, -5.11, 1072, 2053, 16584, 16514);
INSERT INTO `population_data` VALUES (175, 10, 2020, 3171, 3.75, 8.23, -4.48, 1091, 2080, NULL, NULL);
INSERT INTO `population_data` VALUES (176, 10, 2019, 3255, 5.73, 6.74, -1.01, 1152, 2103, 14788, 14389);
INSERT INTO `population_data` VALUES (177, 10, 2018, 3327, 5.98, 6.67, -0.69, 1216, 2111, 15697, 15249);
INSERT INTO `population_data` VALUES (178, 10, 2017, 3399, 6.22, 6.63, -0.41, 1295, 2104, 15919, 15332);
INSERT INTO `population_data` VALUES (179, 10, 2016, 3463, 6.12, 6.61, -0.49, 1347, 2116, 16104, 15770);
INSERT INTO `population_data` VALUES (180, 10, 2015, 3529, 6, 6.6, -0.6, 1395, 2134, 298696, 294010);
INSERT INTO `population_data` VALUES (181, 10, 2014, 3608, 7.37, 6.46, 0.91, 1471, 2137, 15829, 15803);
INSERT INTO `population_data` VALUES (182, 10, 2013, 3666, 6.86, 6.08, 0.78, 1538, 2128, 16055, 15596);
INSERT INTO `population_data` VALUES (183, 10, 2012, 3724, 7.3, 6.03, 1.27, 1606, 2118, 16283, 15707);
INSERT INTO `population_data` VALUES (184, 10, 2011, 3782, 6.99, 5.92, 1.07, 1646, 2136, 16483, 16273);
INSERT INTO `population_data` VALUES (185, 10, 2010, 3833, 7.35, 5.03, 2.32, 1700, 2134, NULL, NULL);
INSERT INTO `population_data` VALUES (186, 10, 2009, 3826, 7.48, 5.42, 2.06, 1703, 2123, 17310, 16755);
INSERT INTO `population_data` VALUES (187, 10, 2008, 3825, 7.91, 5.68, 2.23, 1706, 2119, 17540, 17149);
INSERT INTO `population_data` VALUES (188, 10, 2007, 3824, 7.88, 5.39, 2.49, 1763, 2061, 17781, 17412);
INSERT INTO `population_data` VALUES (189, 10, 2006, 3823, 7.57, 5.18, 2.39, 1778, 2045, 18034, 17470);
INSERT INTO `population_data` VALUES (190, 10, 2005, 3820, 7.87, 5.2, 2.67, 1792, 2028, 255867, 249780);
INSERT INTO `population_data` VALUES (191, 11, 2023, 8526, 4.81, 7.55, -2.74, 2128, 6398, 45505, 44271);
INSERT INTO `population_data` VALUES (192, 11, 2022, 8515, 5.23, 7.04, -1.81, 2178, 6337, 44255, 42967);
INSERT INTO `population_data` VALUES (193, 11, 2021, 8505, 5.65, 6.77, -1.12, 2216, 6289, 45718, 44367);
INSERT INTO `population_data` VALUES (194, 11, 2020, 8477, 6.65, 6.49, 0.16, 2251, 6226, NULL, NULL);
INSERT INTO `population_data` VALUES (195, 11, 2019, 8469, 9.12, 7.04, 2.08, 2332, 6137, 31847, 30805);
INSERT INTO `population_data` VALUES (196, 11, 2018, 8446, 9.32, 7.03, 2.29, 2433, 6013, 33555, 32441);
INSERT INTO `population_data` VALUES (197, 11, 2017, 8423, 9.71, 7.03, 2.68, 2512, 5911, 33542, 32558);
INSERT INTO `population_data` VALUES (198, 11, 2016, 8381, 9.76, 7.03, 2.73, 2604, 5777, 33738, 33260);
INSERT INTO `population_data` VALUES (199, 11, 2015, 8315, 9.05, 7.03, 2.02, 2703, 5612, 628275, 609917);
INSERT INTO `population_data` VALUES (200, 11, 2014, 8281, 9.45, 7.02, 2.43, 2840, 5441, 33116, 32576);
INSERT INTO `population_data` VALUES (201, 11, 2013, 8192, 9.44, 7.01, 2.43, 2917, 5275, 32754, 32772);
INSERT INTO `population_data` VALUES (202, 11, 2012, 8120, 9.44, 6.99, 2.45, 3004, 5116, 32859, 33225);
INSERT INTO `population_data` VALUES (203, 11, 2011, 8023, 9.59, 6.98, 2.61, 3048, 4975, 33888, 33597);
INSERT INTO `population_data` VALUES (204, 11, 2010, 7869, 9.73, 6.88, 2.85, 3102, 4767, NULL, NULL);
INSERT INTO `population_data` VALUES (205, 11, 2009, 7810, 9.55, 6.99, 2.56, 3468, 4343, 33718, 34653);
INSERT INTO `population_data` VALUES (206, 11, 2008, 7762, 9.34, 7.04, 2.3, 3547, 4215, 33709, 35459);
INSERT INTO `population_data` VALUES (207, 11, 2007, 7723, 9.37, 7.07, 2.3, 3614, 4109, 33967, 35536);
INSERT INTO `population_data` VALUES (208, 11, 2006, 7656, 9.36, 7.08, 2.28, 3682, 3973, 33832, 35642);
INSERT INTO `population_data` VALUES (209, 11, 2005, 7588, 9.24, 7.03, 2.21, 3756, 3832, 485494, 503960);
INSERT INTO `population_data` VALUES (210, 12, 2023, 6627, 5.8, 6.66, -0.86, 1708, 4919, 36423, 33358);
INSERT INTO `population_data` VALUES (211, 12, 2022, 6577, 6.28, 6.24, 0.04, 1751, 4826, 35195, 32173);
INSERT INTO `population_data` VALUES (212, 12, 2021, 6540, 6.9, 5.9, 1, 1788, 4752, 36198, 33074);
INSERT INTO `population_data` VALUES (213, 12, 2020, 6468, 7.13, 6.56, 0.57, 1800, 4668, NULL, NULL);
INSERT INTO `population_data` VALUES (214, 12, 2019, 6375, 10.51, 5.52, 4.99, 1812, 4563, 23546, 21874);
INSERT INTO `population_data` VALUES (215, 12, 2018, 6273, 11.02, 5.58, 5.44, 1881, 4392, 24418, 22616);
INSERT INTO `population_data` VALUES (216, 12, 2017, 6170, 11.92, 5.56, 6.36, 1918, 4252, 24550, 22023);
INSERT INTO `population_data` VALUES (217, 12, 2016, 6072, 11.22, 5.52, 5.7, 1960, 4112, 24377, 22454);
INSERT INTO `population_data` VALUES (218, 12, 2015, 5985, 10.52, 5.5, 5.02, 2016, 3969, 445155, 414618);
INSERT INTO `population_data` VALUES (219, 12, 2014, 5890, 10.51, 5.51, 5, 2064, 3826, 23808, 21648);
INSERT INTO `population_data` VALUES (220, 12, 2013, 5784, 10.01, 5.45, 4.56, 2086, 3698, 23512, 21864);
INSERT INTO `population_data` VALUES (221, 12, 2012, 5685, 10.12, 5.52, 4.6, 2109, 3576, 23361, 22338);
INSERT INTO `population_data` VALUES (222, 12, 2011, 5570, 9.47, 5.4, 4.07, 2100, 3470, 22833, 23842);
INSERT INTO `population_data` VALUES (223, 12, 2010, 5447, 10.27, 5.54, 4.73, 2090, 3356, NULL, NULL);
INSERT INTO `population_data` VALUES (224, 12, 2009, 5276, 10.22, 5.59, 4.63, 2221, 3055, 22954, 22519);
INSERT INTO `population_data` VALUES (225, 12, 2008, 5212, 10.2, 5.62, 4.58, 2210, 3002, 23358, 22543);
INSERT INTO `population_data` VALUES (226, 12, 2007, 5155, 10.38, 5.57, 4.81, 2206, 2949, 23447, 22397);
INSERT INTO `population_data` VALUES (227, 12, 2006, 5072, 10.29, 5.42, 4.87, 2206, 2866, 22972, 22551);
INSERT INTO `population_data` VALUES (228, 12, 2005, 4991, 11.1, 6.08, 5.02, 2195, 2796, 328876, 319465);
INSERT INTO `population_data` VALUES (229, 13, 2023, 6121, 6.45, 8.56, -2.11, 2356, 3765, 32922, 31530);
INSERT INTO `population_data` VALUES (230, 13, 2022, 6127, 7.16, 8.09, -0.93, 2441, 3686, 32034, 30729);
INSERT INTO `population_data` VALUES (231, 13, 2021, 6113, 8.05, 8, 0.05, 2482, 3631, 33061, 31684);
INSERT INTO `population_data` VALUES (232, 13, 2020, 6105, 9.45, 7.96, 1.49, 2544, 3561, NULL, NULL);
INSERT INTO `population_data` VALUES (233, 13, 2019, 6092, 12.03, 6.04, 5.99, 2618, 3474, 25042, 24519);
INSERT INTO `population_data` VALUES (234, 13, 2018, 6076, 12.41, 5.96, 6.45, 2695, 3381, 26667, 25145);
INSERT INTO `population_data` VALUES (235, 13, 2017, 6057, 14.07, 5.9, 8.17, 2769, 3288, 26449, 25209);
INSERT INTO `population_data` VALUES (236, 13, 2016, 6033, 13.02, 5.96, 7.06, 2858, 3175, 26727, 25329);
INSERT INTO `population_data` VALUES (237, 13, 2015, 6011, 12.92, 5.94, 6.98, 2947, 3064, 489359, 466486);
INSERT INTO `population_data` VALUES (238, 13, 2014, 5997, 12.86, 5.89, 6.97, 3040, 2957, 24924, 25277);
INSERT INTO `population_data` VALUES (239, 13, 2013, 5988, 12.88, 6.06, 6.82, 3122, 2866, 25383, 24382);
INSERT INTO `population_data` VALUES (240, 13, 2012, 5978, 13, 6.14, 6.86, 3210, 2768, 26032, 23931);
INSERT INTO `population_data` VALUES (241, 13, 2011, 5972, 12.23, 5.91, 6.32, 3297, 2675, 25834, 25155);
INSERT INTO `population_data` VALUES (242, 13, 2010, 5957, 12.7, 5.95, 6.75, 3395, 2562, NULL, NULL);
INSERT INTO `population_data` VALUES (243, 13, 2009, 6131, 13.07, 6.6, 6.47, 3550, 2581, 28195, 26443);
INSERT INTO `population_data` VALUES (244, 13, 2008, 6135, 13.05, 6.6, 6.45, 3650, 2485, 28469, 27029);
INSERT INTO `population_data` VALUES (245, 13, 2007, NULL, 12.75, 6.4, 6.35, 3750, 2368, 28463, 27783);
INSERT INTO `population_data` VALUES (246, 13, 2006, NULL, 12.6, 6.3, 6.3, 3843, 2267, 28953, 27928);
INSERT INTO `population_data` VALUES (247, 13, 2005, NULL, 12.43, 6.23, 6.2, 3947, 2173, 406651, 403444);
INSERT INTO `population_data` VALUES (248, 14, 2023, 4183, 6.81, 6.95, -0.14, 1211, 2972, 22785, 21261);
INSERT INTO `population_data` VALUES (249, 14, 2022, 4188, 7.07, 6.52, 0.55, 1251, 2937, 22213, 20687);
INSERT INTO `population_data` VALUES (250, 14, 2021, 4187, 8.26, 6.28, 1.98, 1269, 2918, 22978, 21374);
INSERT INTO `population_data` VALUES (251, 14, 2020, 4161, 9.21, 6.24, 2.97, 1300, 2861, NULL, NULL);
INSERT INTO `population_data` VALUES (252, 14, 2019, 4137, 12.9, 6.1, 6.8, 1329, 2808, 15993, 14876);
INSERT INTO `population_data` VALUES (253, 14, 2018, 4104, 13.2, 6.2, 7, 1355, 2749, 16806, 15503);
INSERT INTO `population_data` VALUES (254, 14, 2017, 4065, 15, 6.2, 8.8, 1391, 2674, 16435, 15786);
INSERT INTO `population_data` VALUES (255, 14, 2016, 4016, 14.5, 6.2, 8.3, 1430, 2586, 16540, 15934);
INSERT INTO `population_data` VALUES (256, 14, 2015, 3984, 13.9, 6.1, 7.8, 1465, 2519, 306388, 289836);
INSERT INTO `population_data` VALUES (257, 14, 2014, 3945, 13.7, 6.2, 7.5, 1499, 2446, 16349, 15060);
INSERT INTO `population_data` VALUES (258, 14, 2013, 3885, 12.2, 6.01, 6.19, 1523, 2362, 16165, 14982);
INSERT INTO `population_data` VALUES (259, 14, 2012, 3841, 12.74, 5.73, 7.01, 1563, 2278, 15783, 15490);
INSERT INTO `population_data` VALUES (260, 14, 2011, 3784, 11.41, 5.2, 6.21, 1585, 2199, 15680, 16103);
INSERT INTO `population_data` VALUES (261, 14, 2010, 3693, 11.27, 5.16, 6.11, 1584, 2109, NULL, NULL);
INSERT INTO `population_data` VALUES (262, 14, 2009, 3666, 12.2, 6, 6.2, 1646, 2020, 16048, 16049);
INSERT INTO `population_data` VALUES (263, 14, 2008, 3639, 12.2, 5.9, 6.3, 1710, 1929, 16342, 16142);
INSERT INTO `population_data` VALUES (264, 14, 2007, 3612, 11.9, 5.9, 6, 1755, 1857, 16463, 16291);
INSERT INTO `population_data` VALUES (265, 14, 2006, 3585, 12, 5.75, 6.25, 1778, 1807, 16593, 16262);
INSERT INTO `population_data` VALUES (266, 14, 2005, 3557, 11.6, 5.62, 5.98, 1800, 1757, 235254, 232669);
INSERT INTO `population_data` VALUES (267, 15, 2023, 4515, 6.52, 7.36, -0.84, 1665, 2850, 24563, 22978);
INSERT INTO `population_data` VALUES (268, 15, 2022, 4528, 7.19, 6.94, 0.25, 1717, 2811, 23966, 22414);
INSERT INTO `population_data` VALUES (269, 15, 2021, 4517, 8.34, 6.71, 1.63, 1741, 2776, 24739, 23109);
INSERT INTO `population_data` VALUES (270, 15, 2020, 4519, 9.48, 6.61, 2.87, 1788, 2731, NULL, NULL);
INSERT INTO `population_data` VALUES (271, 15, 2019, 4516, 12.59, 6.03, 6.56, 1848, 2668, 18541, 17778);
INSERT INTO `population_data` VALUES (272, 15, 2018, 4513, 13.43, 6.06, 7.37, 1925, 2588, 19579, 18500);
INSERT INTO `population_data` VALUES (273, 15, 2017, 4511, 13.79, 6.08, 7.71, 1998, 2513, 19840, 18323);
INSERT INTO `population_data` VALUES (274, 15, 2016, 4496, 13.45, 6.16, 7.29, 2069, 2427, 20069, 18506);
INSERT INTO `population_data` VALUES (275, 15, 2015, 4485, 13.2, 6.24, 6.96, 2139, 2346, 365820, 344733);
INSERT INTO `population_data` VALUES (276, 15, 2014, 4480, 13.24, 6.26, 6.98, 2215, 2265, 19573, 17913);
INSERT INTO `population_data` VALUES (277, 15, 2013, 4476, 13.19, 6.28, 6.91, 2281, 2195, 19423, 17898);
INSERT INTO `population_data` VALUES (278, 15, 2012, 4475, 13.46, 6.14, 7.32, 2354, 2121, 19481, 18099);
INSERT INTO `population_data` VALUES (279, 15, 2011, 4474, 13.48, 5.98, 7.5, 2427, 2047, 20190, 18157);
INSERT INTO `population_data` VALUES (280, 15, 2010, 4462, 13.72, 6.06, 7.66, 2496, 1966, NULL, NULL);
INSERT INTO `population_data` VALUES (281, 15, 2009, 4432, 13.87, 5.98, 7.89, 2518, 1914, 20050, 19136);
INSERT INTO `population_data` VALUES (282, 15, 2008, 4400, 13.92, 6.01, 7.91, 2580, 1820, 20253, 19370);
INSERT INTO `population_data` VALUES (283, 15, 2007, 4368, 13.86, 5.99, 7.87, 2630, 1739, 20425, 19519);
INSERT INTO `population_data` VALUES (284, 15, 2006, 4339, 13.8, 6.01, 7.79, 2661, 1678, 20535, 19534);
INSERT INTO `population_data` VALUES (285, 15, 2005, 4311, 13.79, 5.96, 7.83, 2716, 1595, 290449, 280223);
INSERT INTO `population_data` VALUES (286, 16, 2023, 10123, 6.01, 8.19, -2.18, 3489, 6634, 53864, 52727);
INSERT INTO `population_data` VALUES (287, 16, 2022, 10163, 6.71, 7.64, -0.93, 3604, 6559, 52785, 51309);
INSERT INTO `population_data` VALUES (288, 16, 2021, 10170, 7.38, 7.36, 0.02, 3667, 6503, 54665, 53047);
INSERT INTO `population_data` VALUES (289, 16, 2020, 10165, 8.56, 7.25, 1.31, 3756, 6409, NULL, NULL);
INSERT INTO `population_data` VALUES (290, 16, 2019, 10106, 11.77, 7.5, 4.27, 3854, 6252, 39531, 38787);
INSERT INTO `population_data` VALUES (291, 16, 2018, 10077, 13.26, 7.18, 6.08, 3884, 6193, 41363, 41045);
INSERT INTO `population_data` VALUES (292, 16, 2017, 10033, 17.54, 7.4, 10.14, 3934, 6099, 41595, 40907);
INSERT INTO `population_data` VALUES (293, 16, 2016, 9973, 17.89, 7.05, 10.84, 4076, 5897, 42579, 40886);
INSERT INTO `population_data` VALUES (294, 16, 2015, 9866, 12.55, 6.67, 5.88, 4245, 5621, 782050, 748712);
INSERT INTO `population_data` VALUES (295, 16, 2014, 9808, 14.23, 6.84, 7.39, 4436, 5372, 40923, 39865);
INSERT INTO `population_data` VALUES (296, 16, 2013, 9746, 11.41, 6.4, 5.01, 4536, 5210, 40928, 39403);
INSERT INTO `population_data` VALUES (297, 16, 2012, 9708, 11.9, 6.95, 4.95, 4657, 5051, 40832, 39978);
INSERT INTO `population_data` VALUES (298, 16, 2011, 9665, 11.5, 6.4, 5.1, 4749, 4916, 41319, 41017);
INSERT INTO `population_data` VALUES (299, 16, 2010, 9588, 11.65, 6.26, 5.39, 4823, 4765, NULL, NULL);
INSERT INTO `population_data` VALUES (300, 16, 2009, 9470, 11.7, 6.08, 5.62, 4894, 4576, 42411, 41456);
INSERT INTO `population_data` VALUES (301, 16, 2008, 9417, 11.25, 6.16, 5.09, 4935, 4483, 42513, 42457);
INSERT INTO `population_data` VALUES (302, 16, 2007, 9367, 11.11, 6.11, 5, 4988, 4379, 43033, 42662);
INSERT INTO `population_data` VALUES (303, 16, 2006, 9309, 11.6, 6.1, 5.5, 5017, 4291, 43164, 42789);
INSERT INTO `population_data` VALUES (304, 16, 2005, 9248, 12.14, 6.31, 5.83, 5086, 4162, 611975, 612167);
INSERT INTO `population_data` VALUES (305, 17, 2023, 9815, 7.06, 8, -0.94, 4114, 5701, 51822, 51527);
INSERT INTO `population_data` VALUES (306, 17, 2022, 9872, 7.42, 7.5, -0.08, 4239, 5633, 50756, 50357);
INSERT INTO `population_data` VALUES (307, 17, 2021, 9883, 8, 7.36, 0.64, 4304, 5579, 52601, 52078);
INSERT INTO `population_data` VALUES (308, 17, 2020, 9941, 9.24, 7.15, 2.09, 4431, 5510, NULL, NULL);
INSERT INTO `population_data` VALUES (309, 17, 2019, 9901, 11.02, 6.84, 4.18, 4553, 5348, 37920, 37167);
INSERT INTO `population_data` VALUES (310, 17, 2018, 9864, 11.72, 6.8, 4.92, 4711, 5153, 39815, 38864);
INSERT INTO `population_data` VALUES (311, 17, 2017, 9829, 12.95, 6.97, 5.98, 4859, 4970, 40370, 38635);
INSERT INTO `population_data` VALUES (312, 17, 2016, 9778, 13.26, 7.11, 6.15, 5008, 4770, 40834, 39306);
INSERT INTO `population_data` VALUES (313, 17, 2015, 9701, 12.7, 7.05, 5.65, 5140, 4561, 752496, 723658);
INSERT INTO `population_data` VALUES (314, 17, 2014, 9645, 12.8, 7.02, 5.78, 5300, 4345, 39385, 38488);
INSERT INTO `population_data` VALUES (315, 17, 2013, 9573, 12.27, 6.76, 5.51, 5399, 4174, 39055, 38633);
INSERT INTO `population_data` VALUES (316, 17, 2012, 9532, 11.87, 6.71, 5.16, 5530, 4002, 39680, 38803);
INSERT INTO `population_data` VALUES (317, 17, 2011, 9461, 11.56, 6.62, 4.94, 5632, 3829, 41614, 38595);
INSERT INTO `population_data` VALUES (318, 17, 2010, 9405, 11.52, 6.57, 4.95, 5784, 3621, NULL, NULL);
INSERT INTO `population_data` VALUES (319, 17, 2009, 9487, 11.45, 6.46, 4.99, 5910, 3577, 42511, 41463);
INSERT INTO `population_data` VALUES (320, 17, 2008, 9429, 11.42, 6.45, 4.97, 6032, 3397, 42929, 41978);
INSERT INTO `population_data` VALUES (321, 17, 2007, 9360, 11.26, 6.32, 4.94, 6146, 3214, 44047, 42412);
INSERT INTO `population_data` VALUES (322, 17, 2006, 9392, 11.59, 6.27, 5.32, 6342, 3050, 44191, 42989);
INSERT INTO `population_data` VALUES (323, 17, 2005, 9380, 11.55, 6.3, 5.25, 6505, 2875, 630613, 611003);
INSERT INTO `population_data` VALUES (324, 18, 2023, 5838, 5.48, 8.63, -3.15, 2016, 3822, 31477, 29996);
INSERT INTO `population_data` VALUES (325, 18, 2022, 5844, 6.08, 8.09, -2.01, 2065, 3779, 30827, 29033);
INSERT INTO `population_data` VALUES (326, 18, 2021, 5830, 6.98, 7.86, -0.88, 2094, 3736, 31813, 29934);
INSERT INTO `population_data` VALUES (327, 18, 2020, 5745, 8.28, 7.67, 0.61, 2132, 3613, NULL, NULL);
INSERT INTO `population_data` VALUES (328, 18, 2019, 5927, 11.35, 7.08, 4.27, 2262, 3665, 23216, 22885);
INSERT INTO `population_data` VALUES (329, 18, 2018, 5917, 11.54, 7, 4.54, 2308, 3609, 24973, 23525);
INSERT INTO `population_data` VALUES (330, 18, 2017, 5904, 12.6, 7.01, 5.59, 2369, 3535, 25090, 23594);
INSERT INTO `population_data` VALUES (331, 18, 2016, 5885, 12.04, 6.97, 5.07, 2438, 3447, 25352, 24032);
INSERT INTO `population_data` VALUES (332, 18, 2015, 5850, 10.74, 5.83, 4.91, 2505, 3345, 463807, 445464);
INSERT INTO `population_data` VALUES (333, 18, 2014, 5816, 11.86, 6.96, 4.9, 2575, 3241, 24458, 23539);
INSERT INTO `population_data` VALUES (334, 18, 2013, 5798, 11.08, 6.15, 4.93, 2638, 3160, 24322, 23538);
INSERT INTO `population_data` VALUES (335, 18, 2012, 5781, 11, 6.12, 4.88, 2704, 3077, 24562, 23657);
INSERT INTO `population_data` VALUES (336, 18, 2011, 5760, 10.39, 6.01, 4.38, 2777, 2983, 25274, 23917);
INSERT INTO `population_data` VALUES (337, 18, 2010, 5728, 10.36, 6.02, 4.34, 2881, 2847, NULL, NULL);
INSERT INTO `population_data` VALUES (338, 18, 2009, 5720, 9.48, 6, 3.48, 3089, 2631, 26070, 24792);
INSERT INTO `population_data` VALUES (339, 18, 2008, 5711, 9.21, 6.5, 2.71, 3130, 2581, 26215, 25482);
INSERT INTO `population_data` VALUES (340, 18, 2007, 5699, 9.19, 5.96, 3.23, 3174, 2525, 26640, 25767);
INSERT INTO `population_data` VALUES (341, 18, 2006, 5693, 9.08, 5.95, 3.13, 3199, 2494, 26858, 26211);
INSERT INTO `population_data` VALUES (342, 18, 2005, 5710, 8.74, 5.69, 3.05, 3243, 2467, 384490, 371334);
INSERT INTO `population_data` VALUES (343, 19, 2023, 6568, 6, 9.08, -3.08, 2551, 4017, 35420, 33739);
INSERT INTO `population_data` VALUES (344, 19, 2022, 6604, 6.23, 8.54, -2.31, 2621, 3983, 34622, 33028);
INSERT INTO `population_data` VALUES (345, 19, 2021, 6622, 7.13, 8.28, -1.15, 2668, 3954, 35937, 34205);
INSERT INTO `population_data` VALUES (346, 19, 2020, 6645, 8.53, 7.92, 0.61, 2740, 3905, NULL, NULL);
INSERT INTO `population_data` VALUES (347, 19, 2019, 6640, 10.39, 7.28, 3.11, 2825, 3815, 27438, 26413);
INSERT INTO `population_data` VALUES (348, 19, 2018, 6635, 12.19, 7.08, 5.11, 2913, 3722, 28469, 28047);
INSERT INTO `population_data` VALUES (349, 19, 2017, 6633, 13.27, 7.08, 6.19, 3010, 3623, 28560, 28087);
INSERT INTO `population_data` VALUES (350, 19, 2016, 6625, 13.57, 7.01, 6.56, 3134, 3491, 29286, 28024);
INSERT INTO `population_data` VALUES (351, 19, 2015, 6615, 13.58, 6.86, 6.72, 3255, 3360, 535812, 520326);
INSERT INTO `population_data` VALUES (352, 19, 2014, 6611, 13.52, 6.89, 6.63, 3373, 3238, 28516, 27084);
INSERT INTO `population_data` VALUES (353, 19, 2013, 6600, 13.5, 6.96, 6.54, 3456, 3144, 28374, 26845);
INSERT INTO `population_data` VALUES (354, 19, 2012, 6590, 13.58, 7.01, 6.57, 3544, 3046, 28577, 26817);
INSERT INTO `population_data` VALUES (355, 19, 2011, 6581, 13.35, 6.8, 6.55, 3622, 2959, 28993, 27358);
INSERT INTO `population_data` VALUES (356, 19, 2010, 6570, 13.1, 6.7, 6.4, 3725, 2845, NULL, NULL);
INSERT INTO `population_data` VALUES (357, 19, 2009, 6406, 13.05, 6.94, 6.11, 3639, 2767, 29087, 27732);
INSERT INTO `population_data` VALUES (358, 19, 2008, 6380, 12.68, 7.28, 5.4, 3691, 2689, 29812, 27835);
INSERT INTO `population_data` VALUES (359, 19, 2007, 6355, 11.96, 6.71, 5.25, 3784, 2571, 30075, 28307);
INSERT INTO `population_data` VALUES (360, 19, 2006, 6342, 11.92, 6.73, 5.19, 3887, 2455, 29953, 28842);
INSERT INTO `population_data` VALUES (361, 19, 2005, 6326, 11.9, 6.75, 5.15, 3985, 2341, 428236, 409126);
INSERT INTO `population_data` VALUES (362, 20, 2023, 12706, 8.12, 5.36, 2.76, 3123, 9583, 70433, 63357);
INSERT INTO `population_data` VALUES (363, 20, 2022, 12657, 8.3, 4.97, 3.33, 3192, 9465, 68360, 61283);
INSERT INTO `population_data` VALUES (364, 20, 2021, 12684, 9.35, 4.83, 4.52, 3218, 9466, 70883, 63458);
INSERT INTO `population_data` VALUES (365, 20, 2020, 12624, 10.28, 4.7, 5.58, 3263, 9361, NULL, NULL);
INSERT INTO `population_data` VALUES (366, 20, 2019, 12489, 12.54, 4.46, 8.08, 3416, 9073, 48416, 41012);
INSERT INTO `population_data` VALUES (367, 20, 2018, 12348, 12.79, 4.55, 8.24, 3481, 8867, 50209, 42815);
INSERT INTO `population_data` VALUES (368, 20, 2017, 12141, 13.68, 4.52, 9.16, 3552, 8589, 48859, 43063);
INSERT INTO `population_data` VALUES (369, 20, 2016, 11908, 11.85, 4.41, 7.44, 3555, 8353, 48869, 43238);
INSERT INTO `population_data` VALUES (370, 20, 2015, 11678, 11.12, 4.32, 6.8, 3561, 8117, 894033, 787633);
INSERT INTO `population_data` VALUES (371, 20, 2014, 11489, 10.8, 4.7, 6.1, 3605, 7884, 48021, 40482);
INSERT INTO `population_data` VALUES (372, 20, 2013, 11270, 10.71, 4.69, 6.02, 3596, 7674, 46183, 41665);
INSERT INTO `population_data` VALUES (373, 20, 2012, 11041, 11.6, 4.65, 6.95, 3627, 7414, 46688, 41707);
INSERT INTO `population_data` VALUES (374, 20, 2011, 10756, 10.45, 4.35, 6.1, 3596, 7160, 48050, 41700);
INSERT INTO `population_data` VALUES (375, 20, 2010, 10441, 11.18, 4.21, 6.97, 3531, 6910, NULL, NULL);
INSERT INTO `population_data` VALUES (376, 20, 2009, 10130, 11.78, 4.52, 7.26, 3708, 6423, 42960, 42021);
INSERT INTO `population_data` VALUES (377, 20, 2008, 9893, 11.8, 4.55, 7.25, 3624, 6269, 43920, 41794);
INSERT INTO `population_data` VALUES (378, 20, 2007, 9660, 11.96, 4.66, 7.3, 3560, 6099, 43606, 42043);
INSERT INTO `population_data` VALUES (379, 20, 2006, 9442, 11.78, 4.49, 7.29, 3494, 5949, 43780, 41671);
INSERT INTO `population_data` VALUES (380, 20, 2005, 9194, 11.7, 4.68, 7.02, 3615, 5579, 616339, 600667);
INSERT INTO `population_data` VALUES (381, 21, 2023, 1043, 9.28, 6.47, 2.81, 392, 651, 5831, 5152);
INSERT INTO `population_data` VALUES (382, 21, 2022, 1027, 8.6, 6.16, 2.44, 396, 631, 5587, 4929);
INSERT INTO `population_data` VALUES (383, 21, 2021, 1020, 9.74, 6.01, 3.73, 398, 622, 5741, 5059);
INSERT INTO `population_data` VALUES (384, 21, 2020, 1012, 10.36, 5.85, 4.51, 402, 610, NULL, NULL);
INSERT INTO `population_data` VALUES (385, 21, 2019, 995, 12.87, 6.11, 6.76, 404, 591, 3788, 3562);
INSERT INTO `population_data` VALUES (386, 21, 2018, 982, 14.48, 6.01, 8.47, 401, 581, 3917, 3741);
INSERT INTO `population_data` VALUES (387, 21, 2017, 972, 14.73, 6.01, 8.72, 408, 564, 4002, 3638);
INSERT INTO `population_data` VALUES (388, 21, 2016, 957, 14.57, 6, 8.57, 414, 543, 4058, 3641);
INSERT INTO `population_data` VALUES (389, 21, 2015, 945, 14.57, 6, 8.57, 426, 519, 74321, 67274);
INSERT INTO `population_data` VALUES (390, 21, 2014, 936, 14.56, 5.95, 8.61, 437, 499, 3994, 3462);
INSERT INTO `population_data` VALUES (391, 21, 2013, 920, 14.59, 5.9, 8.69, 439, 481, 3899, 3490);
INSERT INTO `population_data` VALUES (392, 21, 2012, 910, 14.66, 5.81, 8.85, 446, 464, 3934, 3463);
INSERT INTO `population_data` VALUES (393, 21, 2011, 890, 14.72, 5.75, 8.97, 442, 448, 3897, 3599);
INSERT INTO `population_data` VALUES (394, 21, 2010, 869, 14.71, 5.73, 8.98, 436, 433, NULL, NULL);
INSERT INTO `population_data` VALUES (395, 21, 2009, 864, 14.66, 5.7, 8.96, 440, 425, 4054, 3551);
INSERT INTO `population_data` VALUES (396, 21, 2008, 854, 14.71, 5.72, 8.99, 444, 410, 4012, 3653);
INSERT INTO `population_data` VALUES (397, 21, 2007, 845, 14.62, 5.71, 8.91, 446, 399, 4030, 3666);
INSERT INTO `population_data` VALUES (398, 21, 2006, 836, 14.59, 5.73, 8.86, 451, 385, 4030, 3666);
INSERT INTO `population_data` VALUES (399, 21, 2005, 828, 14.65, 5.72, 8.93, 454, 374, 57525, 52076);
INSERT INTO `population_data` VALUES (400, 22, 2023, 8368, 6.32, 9.44, -3.12, 3390, 4978, 44450, 43662);
INSERT INTO `population_data` VALUES (401, 22, 2022, 8374, 6.39, 9.04, -2.65, 3488, 4886, 43264, 42508);
INSERT INTO `population_data` VALUES (402, 22, 2021, 8372, 6.85, 8.74, -1.89, 3531, 4841, 44782, 43889);
INSERT INTO `population_data` VALUES (403, 22, 2020, 8371, 7.6, 8.48, -0.88, 3622, 4749, NULL, NULL);
INSERT INTO `population_data` VALUES (404, 22, 2019, 8351, 10.7, 7.09, 3.61, 3728, 4623, 32073, 33157);
INSERT INTO `population_data` VALUES (405, 22, 2018, 8321, 11.05, 7.01, 4.04, 3869, 4452, 33944, 34400);
INSERT INTO `population_data` VALUES (406, 22, 2017, 8289, 11.26, 7.03, 4.23, 3997, 4292, 34633, 33976);
INSERT INTO `population_data` VALUES (407, 22, 2016, 8251, 10.48, 6.99, 3.49, 4126, 4126, 34682, 34775);
INSERT INTO `population_data` VALUES (408, 22, 2015, 8196, 10.3, 6.94, 3.36, 4240, 3956, 641473, 635816);
INSERT INTO `population_data` VALUES (409, 22, 2014, 8139, 10.22, 7.02, 3.2, 4354, 3785, 33289, 33890);
INSERT INTO `population_data` VALUES (410, 22, 2013, 8109, 9.9, 6.9, 3, 4463, 3646, 34111, 32793);
INSERT INTO `population_data` VALUES (411, 22, 2012, 8085, 9.89, 6.92, 2.97, 4580, 3505, 35292, 32094);
INSERT INTO `population_data` VALUES (412, 22, 2011, 8064, 9.79, 6.81, 2.98, 4689, 3375, 35134, 33643);
INSERT INTO `population_data` VALUES (413, 22, 2010, 8045, 8.93, 6.62, 2.31, 4812, 3232, NULL, NULL);
INSERT INTO `population_data` VALUES (414, 22, 2009, 8185, 9.15, 6.43, 2.72, 5017, 3168, 36402, 36069);
INSERT INTO `population_data` VALUES (415, 22, 2008, 8138, 9.54, 7.15, 2.39, 5094, 3044, 37341, 36381);
INSERT INTO `population_data` VALUES (416, 22, 2007, 8127, 9.21, 6.29, 2.92, 5234, 2893, 37813, 37388);
INSERT INTO `population_data` VALUES (417, 22, 2006, 8169, 9.14, 6.28, 2.86, 5367, 2802, 38769, 37555);
INSERT INTO `population_data` VALUES (418, 22, 2005, 8212, 9.7, 6.8, 2.9, 5502, 2710, 541978, 545031);
INSERT INTO `population_data` VALUES (419, 23, 2023, 3865, 10.65, 7.77, 2.88, 1703, 2162, 20820, 19877);
INSERT INTO `population_data` VALUES (420, 23, 2022, 3856, 11.03, 7.32, 3.71, 1742, 2114, 20190, 19310);
INSERT INTO `population_data` VALUES (421, 23, 2021, 3852, 12.17, 7.19, 4.98, 1759, 2093, 20876, 19922);
INSERT INTO `population_data` VALUES (422, 23, 2020, 3858, 13.7, 7.17, 6.53, 1807, 2051, NULL, NULL);
INSERT INTO `population_data` VALUES (423, 23, 2019, 3848, 13.65, 6.95, 6.7, 1867, 1981, 14628, 13617);
INSERT INTO `population_data` VALUES (424, 23, 2018, 3822, 13.9, 6.85, 7.05, 1929, 1893, 15403, 14084);
INSERT INTO `population_data` VALUES (425, 23, 2017, 3803, 13.98, 6.88, 7.1, 1987, 1816, 15323, 14290);
INSERT INTO `population_data` VALUES (426, 23, 2016, 3758, 13.43, 6.93, 6.5, 2046, 1712, 15438, 14476);
INSERT INTO `population_data` VALUES (427, 23, 2015, 3708, 13, 7.2, 5.8, 2115, 1593, 284548, 265624);
INSERT INTO `population_data` VALUES (428, 23, 2014, 3677, 12.98, 7.18, 5.8, 2197, 1480, 14806, 14144);
INSERT INTO `population_data` VALUES (429, 23, 2013, 3632, 13.05, 7.15, 5.9, 2256, 1376, 14944, 13960);
INSERT INTO `population_data` VALUES (430, 23, 2012, 3587, 13.27, 6.96, 6.31, 2285, 1302, 14935, 14135);
INSERT INTO `population_data` VALUES (431, 23, 2011, 3530, 13.31, 6.93, 6.38, 2293, 1237, 15658, 13978);
INSERT INTO `population_data` VALUES (432, 23, 2010, 3479, 13.96, 6.55, 7.41, 2303, 1176, NULL, NULL);
INSERT INTO `population_data` VALUES (433, 23, 2009, 3537, 13.65, 6.69, 6.96, 2480, 1057, 17464, 16316);
INSERT INTO `population_data` VALUES (434, 23, 2008, 3596, 13.49, 6.77, 6.72, 2549, 1047, 17736, 16390);
INSERT INTO `population_data` VALUES (435, 23, 2007, 3632, 13.28, 6.6, 6.68, 2606, 1026, 17888, 16699);
INSERT INTO `population_data` VALUES (436, 23, 2006, 3690, 13.97, 6.71, 7.26, 2677, 1013, 17919, 16747);
INSERT INTO `population_data` VALUES (437, 23, 2005, 3730, 14.59, 7.21, 7.38, 2728, 1002, 254202, 239513);
INSERT INTO `population_data` VALUES (438, 24, 2023, 4673, 8.22, 8.61, -0.39, 2200, 2473, 25289, 23916);
INSERT INTO `population_data` VALUES (439, 24, 2022, 4693, 8.14, 8.21, -0.07, 2266, 2427, 24744, 23322);
INSERT INTO `population_data` VALUES (440, 24, 2021, 4690, 9.35, 8.12, 1.23, 2296, 2394, 25602, 24076);
INSERT INTO `population_data` VALUES (441, 24, 2020, 4722, 10.96, 7.92, 3.04, 2359, 2363, NULL, NULL);
INSERT INTO `population_data` VALUES (442, 24, 2019, 4714, 12.63, 6.2, 6.43, 2420, 2294, 19321, 18553);
INSERT INTO `population_data` VALUES (443, 24, 2018, 4703, 13.19, 6.32, 6.87, 2472, 2231, 20523, 19061);
INSERT INTO `population_data` VALUES (444, 24, 2017, 4693, 13.53, 6.68, 6.85, 2521, 2172, 20564, 19145);
INSERT INTO `population_data` VALUES (445, 24, 2016, 4677, 13.16, 6.55, 6.61, 2589, 2088, 20285, 19855);
INSERT INTO `population_data` VALUES (446, 24, 2015, 4663, 12.88, 6.48, 6.4, 2661, 2002, 378276, 360337);
INSERT INTO `population_data` VALUES (447, 24, 2014, 4653, 12.65, 6.45, 6.2, 2735, 1918, 19962, 18940);
INSERT INTO `population_data` VALUES (448, 24, 2013, 4641, 12.6, 6.43, 6.17, 2785, 1856, 20044, 18635);
INSERT INTO `population_data` VALUES (449, 24, 2012, 4631, 12.63, 6.41, 6.22, 2849, 1782, 19993, 18882);
INSERT INTO `population_data` VALUES (450, 24, 2011, 4620, 12.71, 6.36, 6.35, 2930, 1690, 20179, 19385);
INSERT INTO `population_data` VALUES (451, 24, 2010, 4602, 13.1, 6.56, 6.54, 3005, 1597, NULL, NULL);
INSERT INTO `population_data` VALUES (452, 24, 2009, 4571, 12.53, 6.45, 6.08, 3017, 1554, 21008, 19451);
INSERT INTO `population_data` VALUES (453, 24, 2008, 4543, 12.63, 6.31, 6.32, 3044, 1499, 21290, 19658);
INSERT INTO `population_data` VALUES (454, 24, 2007, 4514, 13.08, 6.22, 6.86, 3088, 1426, 21266, 20003);
INSERT INTO `population_data` VALUES (455, 24, 2006, 4483, 13.2, 6.3, 6.9, 3116, 1367, 21394, 19965);
INSERT INTO `population_data` VALUES (456, 24, 2005, 4450, 14.72, 6.75, 7.97, 3138, 1313, 303893, 285146);
INSERT INTO `population_data` VALUES (457, 25, 2023, 3952, 6.83, 8.14, -1.31, 1377, 2575, 21234, 20379);
INSERT INTO `population_data` VALUES (458, 25, 2022, 3956, 7.36, 7.64, -0.28, 1424, 2532, 20665, 19852);
INSERT INTO `population_data` VALUES (459, 25, 2021, 3954, 7.89, 7.38, 0.51, 1438, 2516, 21375, 20502);
INSERT INTO `population_data` VALUES (460, 25, 2020, 3955, 8.95, 7.11, 1.84, 1477, 2478, NULL, NULL);
INSERT INTO `population_data` VALUES (461, 25, 2019, 3944, 10.55, 6.28, 4.27, 1527, 2417, 15302, 14856);
INSERT INTO `population_data` VALUES (462, 25, 2018, 3931, 10.67, 6.24, 4.43, 1586, 2345, 15879, 15804);
INSERT INTO `population_data` VALUES (463, 25, 2017, 3904, 11.11, 6.24, 4.87, 1637, 2267, 15615, 16034);
INSERT INTO `population_data` VALUES (464, 25, 2016, 3874, 10.64, 6.23, 4.41, 1689, 2185, 16160, 15854);
INSERT INTO `population_data` VALUES (465, 25, 2015, 3846, 10.1, 6.28, 3.82, 1741, 2105, 298442, 290904);
INSERT INTO `population_data` VALUES (466, 25, 2014, 3827, 10.13, 6.26, 3.87, 1798, 2029, 16108, 15047);
INSERT INTO `population_data` VALUES (467, 25, 2013, 3804, 10.01, 6.15, 3.86, 1842, 1962, 15912, 15151);
INSERT INTO `population_data` VALUES (468, 25, 2012, 3787, 10.12, 6.24, 3.88, 1904, 1883, 16193, 15123);
INSERT INTO `population_data` VALUES (469, 25, 2011, 3765, 9.75, 6.06, 3.69, 1982, 1783, 16410, 15566);
INSERT INTO `population_data` VALUES (470, 25, 2010, 3735, 9.73, 6.01, 3.72, 2026, 1709, NULL, NULL);
INSERT INTO `population_data` VALUES (471, 25, 2009, 3727, 10.24, 6.24, 4, 2106, 1621, 16965, 16539);
INSERT INTO `population_data` VALUES (472, 25, 2008, 3718, 10.29, 6.21, 4.08, 2153, 1565, 17233, 16766);
INSERT INTO `population_data` VALUES (473, 25, 2007, 3708, 10.21, 6.16, 4.05, 2202, 1506, 17324, 17059);
INSERT INTO `population_data` VALUES (474, 25, 2006, 3699, 10.19, 6.15, 4.04, 2252, 1447, 17389, 17185);
INSERT INTO `population_data` VALUES (475, 25, 2005, 3690, 10.02, 6.01, 4.01, 2316, 1374, 248660, 243750);
INSERT INTO `population_data` VALUES (476, 26, 2023, 2465, 7.71, 9.04, -1.33, 1097, 1368, 13175, 12780);
INSERT INTO `population_data` VALUES (477, 26, 2022, 2492, 8.47, 8.51, -0.04, 1141, 1351, 12966, 12563);
INSERT INTO `population_data` VALUES (478, 26, 2021, 2490, 9.68, 8.26, 1.42, 1162, 1328, 13407, 12961);
INSERT INTO `population_data` VALUES (479, 26, 2020, 2501, 10.55, 7.91, 2.64, 1195, 1306, NULL, NULL);
INSERT INTO `population_data` VALUES (480, 26, 2019, 2509, 10.6, 6.75, 3.85, 1237, 1272, 10433, 10209);
INSERT INTO `population_data` VALUES (481, 26, 2018, 2515, 11.07, 6.65, 4.42, 1265, 1250, 11001, 10613);
INSERT INTO `population_data` VALUES (482, 26, 2017, 2522, 12.54, 6.52, 6.02, 1308, 1214, 11035, 10685);
INSERT INTO `population_data` VALUES (483, 26, 2016, 2520, 12.18, 6.18, 6, 1359, 1161, 11134, 10826);
INSERT INTO `population_data` VALUES (484, 26, 2015, 2523, 12.36, 6.15, 6.21, 1407, 1116, 208500, 196363);
INSERT INTO `population_data` VALUES (485, 26, 2014, 2531, 12.21, 6.11, 6.1, 1461, 1070, 11082, 10299);
INSERT INTO `population_data` VALUES (486, 26, 2013, 2537, 12.16, 6.08, 6.08, 1510, 1027, 10948, 10363);
INSERT INTO `population_data` VALUES (487, 26, 2012, 2550, 12.11, 6.05, 6.06, 1561, 989, 11067, 10440);
INSERT INTO `population_data` VALUES (488, 26, 2011, 2552, 12.08, 6.03, 6.05, 1601, 951, 11384, 10523);
INSERT INTO `population_data` VALUES (489, 26, 2010, 2560, 12.05, 6.02, 6.03, 1635, 925, NULL, NULL);
INSERT INTO `population_data` VALUES (490, 26, 2009, 2555, 13.32, 6.71, 6.61, 1664, 891, 11921, 11484);
INSERT INTO `population_data` VALUES (491, 26, 2008, 2551, 13.22, 6.68, 6.54, 1695, 856, 12010, 11730);
INSERT INTO `population_data` VALUES (492, 26, 2007, 2548, 13.14, 6.65, 6.49, 1726, 822, 12162, 11828);
INSERT INTO `population_data` VALUES (493, 26, 2006, 2547, 12.86, 6.62, 6.24, 1755, 792, 12205, 11904);
INSERT INTO `population_data` VALUES (494, 26, 2005, 2545, 12.59, 6.57, 6.02, 1781, 764, 173235, 170129);
INSERT INTO `population_data` VALUES (495, 27, 2023, 594, 9.25, 7.57, 1.68, 221, 373, 3145, 3110);
INSERT INTO `population_data` VALUES (496, 27, 2022, 595, 10.6, 7.23, 3.37, 229, 366, 3061, 3033);
INSERT INTO `population_data` VALUES (497, 27, 2021, 594, 11.22, 6.91, 4.31, 232, 362, 3163, 3126);
INSERT INTO `population_data` VALUES (498, 27, 2020, 593, 11.43, 6.65, 4.78, 237, 356, NULL, NULL);
INSERT INTO `population_data` VALUES (499, 27, 2019, 590, 13.66, 6.08, 7.58, 243, 347, 2445, 2287);
INSERT INTO `population_data` VALUES (500, 27, 2018, 587, 14.31, 6.25, 8.06, 251, 336, 2571, 2373);
INSERT INTO `population_data` VALUES (501, 27, 2017, 586, 14.42, 6.17, 8.25, 261, 325, 2541, 2399);
INSERT INTO `population_data` VALUES (502, 27, 2016, 582, 14.7, 6.18, 8.52, 270, 312, 2564, 2423);
INSERT INTO `population_data` VALUES (503, 27, 2015, 577, 14.72, 6.17, 8.55, 279, 298, 47839, 43771);
INSERT INTO `population_data` VALUES (504, 27, 2014, 576, 14.67, 6.18, 8.49, 283, 293, 2420, 2394);
INSERT INTO `population_data` VALUES (505, 27, 2013, 571, 14.16, 6.13, 8.03, 290, 281, 2429, 2339);
INSERT INTO `population_data` VALUES (506, 27, 2012, 571, 14.3, 6.06, 8.24, 298, 273, 2465, 2318);
INSERT INTO `population_data` VALUES (507, 27, 2011, 568, 14.43, 6.12, 8.31, 304, 264, 2458, 2396);
INSERT INTO `population_data` VALUES (508, 27, 2010, 563, 14.94, 6.31, 8.63, 311, 252, NULL, NULL);
INSERT INTO `population_data` VALUES (509, 27, 2009, 557, 14.51, 6.19, 8.32, 324, 234, 2482, 2452);
INSERT INTO `population_data` VALUES (510, 27, 2008, 554, 14.49, 6.14, 8.35, 328, 226, 2524, 2484);
INSERT INTO `population_data` VALUES (511, 27, 2007, 552, 14.93, 6.13, 8.8, 331, 221, 2556, 2488);
INSERT INTO `population_data` VALUES (512, 27, 2006, 548, 15.24, 6.27, 8.97, 333, 215, 2563, 2485);
INSERT INTO `population_data` VALUES (513, 27, 2005, 543, 15.7, 6.21, 9.49, 330, 213, 36328, 35574);
INSERT INTO `population_data` VALUES (514, 28, 2023, 2396, 5, 8.42, -3.42, 729, 1667, 12921, 12308);
INSERT INTO `population_data` VALUES (515, 28, 2022, 2401, 5.58, 7.83, -2.25, 754, 1647, 12545, 12050);
INSERT INTO `population_data` VALUES (516, 28, 2021, 2400, 6.26, 7.54, -1.28, 763, 1637, 12981, 12436);
INSERT INTO `population_data` VALUES (517, 28, 2020, 2403, 7.2, 7.3, -0.1, 781, 1622, NULL, NULL);
INSERT INTO `population_data` VALUES (518, 28, 2019, 2415, 8.23, 5.66, 2.57, 810, 1605, 10191, 9553);
INSERT INTO `population_data` VALUES (519, 28, 2018, 2422, 8.35, 5.95, 2.4, 835, 1587, 10608, 10174);
INSERT INTO `population_data` VALUES (520, 28, 2017, 2433, 9.47, 5.74, 3.73, 861, 1572, 10465, 10384);
INSERT INTO `population_data` VALUES (521, 28, 2016, 2436, 9.03, 5.69, 3.34, 892, 1544, 10675, 10461);
INSERT INTO `population_data` VALUES (522, 28, 2015, 2440, 7.72, 5.32, 2.4, 925, 1515, 199239, 190983);
INSERT INTO `population_data` VALUES (523, 28, 2014, 2449, 9.31, 5.75, 3.56, 956, 1493, 10533, 10138);
INSERT INTO `population_data` VALUES (524, 28, 2013, 2455, 8.98, 5.62, 3.36, 986, 1469, 10699, 9914);
INSERT INTO `population_data` VALUES (525, 28, 2012, 2464, 9.17, 5.52, 3.65, 1025, 1439, 10613, 10162);
INSERT INTO `population_data` VALUES (526, 28, 2011, 2470, 8.94, 5.43, 3.51, 1061, 1409, 10540, 10663);
INSERT INTO `population_data` VALUES (527, 28, 2010, 2472, 9.3, 5.54, 3.76, 1100, 1372, NULL, NULL);
INSERT INTO `population_data` VALUES (528, 28, 2009, 2458, 9.57, 5.61, 3.96, 1146, 1313, 11012, 10487);
INSERT INTO `population_data` VALUES (529, 28, 2008, 2444, 9.81, 5.54, 4.27, 1180, 1264, 11185, 10631);
INSERT INTO `population_data` VALUES (530, 28, 2007, 2429, 10.21, 5.73, 4.48, 1211, 1218, 11201, 10865);
INSERT INTO `population_data` VALUES (531, 28, 2006, 2415, 9.87, 5.91, 3.96, 1240, 1175, 11310, 10870);
INSERT INTO `population_data` VALUES (532, 28, 2005, 2403, 10.08, 5.46, 4.62, 1269, 1134, 161560, 154324);
INSERT INTO `population_data` VALUES (533, 29, 2023, 5027, 8.04, 7.62, 0.42, 2173, 2854, 27367, 25566);
INSERT INTO `population_data` VALUES (534, 29, 2022, 5047, 8.51, 7.08, 1.43, 2238, 2809, 26753, 24945);
INSERT INTO `population_data` VALUES (535, 29, 2021, 5037, 9.68, 6.8, 2.88, 2263, 2774, 27634, 25713);
INSERT INTO `population_data` VALUES (536, 29, 2020, 5019, 11.36, 6.46, 4.9, 2299, 2720, NULL, NULL);
INSERT INTO `population_data` VALUES (537, 29, 2019, 4982, 13.31, 6.14, 7.17, 2343, 2639, 19978, 18675);
INSERT INTO `population_data` VALUES (538, 29, 2018, 4947, 14.12, 5.96, 8.16, 2383, 2564, 20996, 19357);
INSERT INTO `population_data` VALUES (539, 29, 2017, 4907, 15.14, 6.22, 8.92, 2425, 2482, 21080, 19305);
INSERT INTO `population_data` VALUES (540, 29, 2016, 4857, 13.82, 5.95, 7.87, 2465, 2392, 21161, 19516);
INSERT INTO `population_data` VALUES (541, 29, 2015, 4811, 14.05, 6.15, 7.9, 2502, 2309, 383669, 363424);
INSERT INTO `population_data` VALUES (542, 29, 2014, 4770, 14.07, 6.21, 7.86, 2550, 2220, 20403, 18829);
INSERT INTO `population_data` VALUES (543, 29, 2013, 4731, 14.28, 6.35, 7.93, 2597, 2134, 20352, 18595);
INSERT INTO `population_data` VALUES (544, 29, 2012, 4694, 14.2, 6.31, 7.89, 2653, 2041, 20259, 18807);
INSERT INTO `population_data` VALUES (545, 29, 2011, 4655, 13.71, 6.04, 7.67, 2705, 1950, 20785, 18900);
INSERT INTO `population_data` VALUES (546, 29, 2010, 4610, 14.13, 5.48, 8.65, 2766, 1844, NULL, NULL);
INSERT INTO `population_data` VALUES (547, 29, 2009, 4856, 14.17, 5.64, 8.53, 2952, 1904, 22541, 20350);
INSERT INTO `population_data` VALUES (548, 29, 2008, 4816, 14.4, 5.7, 8.7, 2978, 1838, 22578, 20674);
INSERT INTO `population_data` VALUES (549, 29, 2007, 4768, 14.19, 5.99, 8.2, 3040, 1728, 22617, 20824);
INSERT INTO `population_data` VALUES (550, 29, 2006, 4719, 14.44, 6.1, 8.34, 3084, 1635, 22606, 20705);
INSERT INTO `population_data` VALUES (551, 29, 2005, 4660, 14.26, 6.09, 8.16, 3093, 1567, 319740, 297097);
INSERT INTO `population_data` VALUES (552, 30, 2023, 365, 13.72, 5.76, 7.96, 223, 142, 2023, 1820);
INSERT INTO `population_data` VALUES (553, 30, 2022, 364, 14.24, 5.48, 8.76, 228, 136, 1951, 1779);
INSERT INTO `population_data` VALUES (554, 30, 2021, 366, 14.17, 5.47, 8.7, 232, 134, 2029, 1844);
INSERT INTO `population_data` VALUES (555, 30, 2020, 366, 13.96, 5.37, 8.59, 235, 131, NULL, NULL);
INSERT INTO `population_data` VALUES (556, 30, 2019, 361, 14.6, 4.46, 10.14, 236, 125, 1373, 1369);
INSERT INTO `population_data` VALUES (557, 30, 2018, 354, 15.22, 4.58, 10.64, 234, 120, 1401, 1416);
INSERT INTO `population_data` VALUES (558, 30, 2017, 349, 16, 4.95, 11.05, 233, 116, 1404, 1393);
INSERT INTO `population_data` VALUES (559, 30, 2016, 340, 15.79, 5.11, 10.68, 233, 107, 1410, 1380);
INSERT INTO `population_data` VALUES (560, 30, 2015, 330, 15.75, 5.1, 10.65, 235, 95, 25609, 25025);
INSERT INTO `population_data` VALUES (561, 30, 2014, 325, 15.76, 5.21, 10.55, 240, 85, 1317, 1303);
INSERT INTO `population_data` VALUES (562, 30, 2013, 317, 15.77, 5.39, 10.38, 241, 76, 1308, 1267);
INSERT INTO `population_data` VALUES (563, 30, 2012, 315, 15.48, 5.21, 10.27, 243, 72, 1275, 1292);
INSERT INTO `population_data` VALUES (564, 30, 2011, 309, 15.39, 5.13, 10.26, 239, 70, 1324, 1268);
INSERT INTO `population_data` VALUES (565, 30, 2010, 300, 15.8, 5.55, 10.25, 232, 68, NULL, NULL);
INSERT INTO `population_data` VALUES (566, 30, 2009, 296, 15.31, 5.07, 10.24, 230, 66, 1256, 1300);
INSERT INTO `population_data` VALUES (567, 30, 2008, 292, 15.5, 5.2, 10.3, 228, 64, 1253, 1323);
INSERT INTO `population_data` VALUES (568, 30, 2007, 289, 16.4, 5.1, 11.3, 227, 62, 1270, 1317);
INSERT INTO `population_data` VALUES (569, 30, 2006, 285, 17.4, 5.7, 11.7, 225, 60, 1259, 1315);
INSERT INTO `population_data` VALUES (570, 30, 2005, 280, 17.94, 7.15, 10.79, 222, 58, 18149, 18517);
INSERT INTO `population_data` VALUES (571, 31, 2023, 729, 10.02, 6.59, 3.43, 238, 491, 3903, 3773);
INSERT INTO `population_data` VALUES (572, 31, 2022, 728, 10.6, 6.19, 4.41, 245, 483, 3801, 3659);
INSERT INTO `population_data` VALUES (573, 31, 2021, 725, 11.62, 6.09, 5.53, 246, 479, 3916, 3762);
INSERT INTO `population_data` VALUES (574, 31, 2020, 721, 11.59, 5.88, 5.71, 253, 468, NULL, NULL);
INSERT INTO `population_data` VALUES (575, 31, 2019, 717, 13.72, 5.69, 8.03, 261, 456, 2780, 2624);
INSERT INTO `population_data` VALUES (576, 31, 2018, 710, 13.32, 5.54, 7.78, 269, 441, 2794, 2844);
INSERT INTO `population_data` VALUES (577, 31, 2017, 705, 13.44, 4.75, 8.69, 275, 430, 2769, 2858);
INSERT INTO `population_data` VALUES (578, 31, 2016, 695, 13.69, 4.72, 8.97, 287, 408, 2925, 2741);
INSERT INTO `population_data` VALUES (579, 31, 2015, 684, 12.62, 4.58, 8.04, 294, 390, 53462, 50358);
INSERT INTO `population_data` VALUES (580, 31, 2014, 678, 13.1, 4.53, 8.57, 306, 372, 2807, 2653);
INSERT INTO `population_data` VALUES (581, 31, 2013, 666, 13.12, 4.5, 8.62, 314, 352, 2757, 2642);
INSERT INTO `population_data` VALUES (582, 31, 2012, 659, 13.26, 4.33, 8.93, 322, 337, 2760, 2640);
INSERT INTO `population_data` VALUES (583, 31, 2011, 648, 13.65, 4.68, 8.97, 323, 325, 2875, 2588);
INSERT INTO `population_data` VALUES (584, 31, 2010, 633, 14.14, 5.1, 9.04, 330, 303, NULL, NULL);
INSERT INTO `population_data` VALUES (585, 31, 2009, 625, 14.38, 4.7, 9.68, 337, 288, 2809, 2695);
INSERT INTO `population_data` VALUES (586, 31, 2008, 618, 14.31, 4.62, 9.69, 340, 278, 2817, 2716);
INSERT INTO `population_data` VALUES (587, 31, 2007, 610, 14.8, 5.04, 9.76, 342, 269, 2822, 2738);
INSERT INTO `population_data` VALUES (588, 31, 2006, 604, 15.53, 4.84, 10.69, 344, 260, 2822, 2718);
INSERT INTO `population_data` VALUES (589, 31, 2005, 596, 15.93, 4.95, 10.98, 344, 252, 39733, 39159);
INSERT INTO `population_data` VALUES (590, 32, 2023, 2598, 7.1, 6.17, 0.93, 1059, 1539, 14157, 13199);
INSERT INTO `population_data` VALUES (591, 32, 2022, 2587, 6.53, 5.76, 0.77, 1089, 1498, 13699, 12799);
INSERT INTO `population_data` VALUES (592, 32, 2021, 2589, 6.16, 5.6, 0.56, 1107, 1482, 14196, 13231);
INSERT INTO `population_data` VALUES (593, 32, 2020, 2590, 6.94, 5.46, 1.48, 1126, 1464, NULL, NULL);
INSERT INTO `population_data` VALUES (594, 32, 2019, 2559, 8.14, 4.45, 3.69, 1138, 1421, 9915, 9746);
INSERT INTO `population_data` VALUES (595, 32, 2018, 2520, 10.69, 4.56, 6.13, 1159, 1361, 10175, 10200);
INSERT INTO `population_data` VALUES (596, 32, 2017, 2480, 15.88, 4.48, 11.4, 1193, 1287, 10211, 9999);
INSERT INTO `population_data` VALUES (597, 32, 2016, 2428, 15.34, 4.26, 11.08, 1204, 1224, 10303, 9861);
INSERT INTO `population_data` VALUES (598, 32, 2015, 2385, 15.59, 4.51, 11.08, 1222, 1163, 187526, 180105);
INSERT INTO `population_data` VALUES (599, 32, 2014, 2325, 16.44, 4.97, 11.47, 1237, 1088, 9693, 9276);
INSERT INTO `population_data` VALUES (600, 32, 2013, 2285, 15.84, 4.92, 10.92, 1258, 1027, 9583, 9105);
INSERT INTO `population_data` VALUES (601, 32, 2012, 2253, 15.32, 4.48, 10.84, 1257, 996, 9496, 9134);
INSERT INTO `population_data` VALUES (602, 32, 2011, 2225, 14.99, 4.42, 10.57, 1252, 973, 9679, 9191);
INSERT INTO `population_data` VALUES (603, 32, 2010, 2185, 15.99, 5.43, 10.56, 1245, 940, NULL, NULL);
INSERT INTO `population_data` VALUES (604, 32, 2009, 2159, 15.99, 5.43, 10.56, 1298, 860, 9611, 9367);
INSERT INTO `population_data` VALUES (605, 32, 2008, 2131, 16.05, 4.88, 11.17, 1286, 845, 9649, 9355);
INSERT INTO `population_data` VALUES (606, 32, 2007, 2095, 16.79, 5.01, 11.78, 1275, 820, 9597, 9275);
INSERT INTO `population_data` VALUES (607, 32, 2006, 2050, 15.79, 5.03, 10.76, 1272, 778, 9452, 9229);
INSERT INTO `population_data` VALUES (608, 32, 2005, 2010, 16.42, 5.04, 11.38, 1264, 747, 134718, 131097);
INSERT INTO `population_data` VALUES (609, 33, 2023, 753, NULL, NULL, NULL, NULL, NULL, 343, 410);
INSERT INTO `population_data` VALUES (610, 33, 2022, 747, NULL, NULL, NULL, NULL, NULL, 341, 406);
INSERT INTO `population_data` VALUES (611, 33, 2021, 740, NULL, NULL, NULL, NULL, NULL, 338, 402);
INSERT INTO `population_data` VALUES (612, 33, 2020, 743, NULL, NULL, NULL, NULL, NULL, 339, 404);
INSERT INTO `population_data` VALUES (613, 33, 2019, 752, NULL, NULL, NULL, NULL, NULL, 343, 409);
INSERT INTO `population_data` VALUES (614, 33, 2018, 749, NULL, NULL, NULL, NULL, NULL, 342, 407);
INSERT INTO `population_data` VALUES (615, 33, 2017, 741, NULL, NULL, NULL, NULL, NULL, 340, 402);
INSERT INTO `population_data` VALUES (616, 33, 2016, 738, NULL, NULL, NULL, NULL, NULL, 339, 399);
INSERT INTO `population_data` VALUES (617, 33, 2015, 731, NULL, NULL, NULL, NULL, NULL, 337, 394);
INSERT INTO `population_data` VALUES (618, 33, 2014, 725, NULL, NULL, NULL, NULL, NULL, 335, 390);
INSERT INTO `population_data` VALUES (619, 33, 2013, 721, NULL, NULL, NULL, NULL, NULL, 334, 387);
INSERT INTO `population_data` VALUES (620, 33, 2012, 717, NULL, NULL, NULL, NULL, NULL, 333, 384);
INSERT INTO `population_data` VALUES (621, 33, 2011, 711, NULL, NULL, NULL, NULL, NULL, 331, 380);
INSERT INTO `population_data` VALUES (622, 33, 2010, 705, NULL, NULL, NULL, NULL, NULL, 330, 375);
INSERT INTO `population_data` VALUES (623, 33, 2009, 700, NULL, NULL, NULL, NULL, NULL, 329, 371);
INSERT INTO `population_data` VALUES (624, 33, 2008, 696, NULL, NULL, NULL, NULL, NULL, 329, 368);
INSERT INTO `population_data` VALUES (625, 33, 2007, 694, NULL, NULL, NULL, NULL, NULL, 329, 365);
INSERT INTO `population_data` VALUES (626, 33, 2006, 690, NULL, NULL, NULL, NULL, NULL, 329, 362);
INSERT INTO `population_data` VALUES (627, 33, 2005, 684, NULL, NULL, NULL, NULL, NULL, 327, 357);
INSERT INTO `population_data` VALUES (628, 34, 2023, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (629, 34, 2022, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (630, 34, 2021, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (631, 34, 2020, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (632, 34, 2019, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (633, 34, 2018, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (634, 34, 2017, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (635, 34, 2016, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (636, 34, 2015, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (637, 34, 2014, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (638, 34, 2013, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (639, 34, 2012, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (640, 34, 2011, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (641, 34, 2010, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (642, 34, 2009, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (643, 34, 2008, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (644, 34, 2007, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (645, 34, 2006, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (646, 34, 2005, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (647, 35, 2023, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (648, 35, 2022, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (649, 35, 2021, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (650, 35, 2020, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (651, 35, 2019, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (652, 35, 2018, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (653, 35, 2017, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (654, 35, 2016, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (655, 35, 2015, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (656, 35, 2014, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (657, 35, 2013, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (658, 35, 2012, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (659, 35, 2011, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (660, 35, 2010, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (661, 35, 2009, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (662, 35, 2008, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (663, 35, 2007, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (664, 35, 2006, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (665, 35, 2005, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (666, 1, 2024, 140828, 12.4, 6.51, 5.89, 46478, 94350, 71909, 68919);
INSERT INTO `population_data` VALUES (667, 33, 2024, 753, NULL, NULL, NULL, NULL, NULL, 342, 412);
INSERT INTO `population_data` VALUES (668, 2, 2024, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (669, 3, 2024, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (670, 4, 2024, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (671, 5, 2024, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (672, 6, 2024, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (673, 7, 2024, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (674, 8, 2024, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (675, 9, 2024, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (676, 10, 2024, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (677, 11, 2024, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (678, 12, 2024, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (679, 13, 2024, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (680, 14, 2024, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (681, 15, 2024, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (682, 16, 2024, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (683, 17, 2024, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (684, 18, 2024, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (685, 19, 2024, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (686, 20, 2024, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (687, 21, 2024, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (688, 22, 2024, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (689, 23, 2024, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (690, 24, 2024, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (691, 25, 2024, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (692, 26, 2024, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (693, 27, 2024, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (694, 28, 2024, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (695, 29, 2024, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (696, 30, 2024, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (697, 31, 2024, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (698, 34, 2024, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (699, 35, 2024, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `population_data` VALUES (700, 32, 2024, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for populations
-- ----------------------------
DROP TABLE IF EXISTS `populations`;
CREATE TABLE `populations`  (
  `Proviences` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `2023` int NULL DEFAULT NULL,
  `2022` int NULL DEFAULT NULL,
  `2021` int NULL DEFAULT NULL,
  `2020` int NULL DEFAULT NULL,
  `2019` int NULL DEFAULT NULL,
  `2018` int NULL DEFAULT NULL,
  `2017` int NULL DEFAULT NULL,
  `2016` int NULL DEFAULT NULL,
  `2015` int NULL DEFAULT NULL,
  `2014` int NULL DEFAULT NULL,
  `2013` int NULL DEFAULT NULL,
  `2012` int NULL DEFAULT NULL,
  `2011` int NULL DEFAULT NULL,
  `2010` int NULL DEFAULT NULL,
  `2009` int NULL DEFAULT NULL,
  `2008` int NULL DEFAULT NULL,
  `2007` int NULL DEFAULT NULL,
  `2006` int NULL DEFAULT NULL,
  `2005` int NULL DEFAULT NULL,
  PRIMARY KEY (`Proviences`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of populations
-- ----------------------------
INSERT INTO `populations` VALUES ('上海市', 2487, 2475, 2489, 2488, 2481, 2475, 2466, 2467, 2458, 2467, 2448, 2399, 2356, 2303, 2210, 2141, 2064, 1964, 1890);
INSERT INTO `populations` VALUES ('云南省', 4673, 4693, 4690, 4722, 4714, 4703, 4693, 4677, 4663, 4653, 4641, 4631, 4620, 4602, 4571, 4543, 4514, 4483, 4450);
INSERT INTO `populations` VALUES ('全国', 140967, 141175, 141260, 141212, 141008, 140541, 140011, 139232, 138326, 137646, 136726, 135922, 134916, 134091, 133450, 132802, 132129, 131448, 130756);
INSERT INTO `populations` VALUES ('内蒙古自治区', 2396, 2401, 2400, 2403, 2415, 2422, 2433, 2436, 2440, 2449, 2455, 2464, 2470, 2472, 2458, 2444, 2429, 2415, 2403);
INSERT INTO `populations` VALUES ('北京市', 2186, 2184, 2189, 2189, 2190, 2192, 2194, 2195, 2188, 2171, 2125, 2078, 2024, 1962, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `populations` VALUES ('吉林省', 2339, 2348, 2375, 2399, 2448, 2484, 2526, 2567, 2613, 2642, 2668, 2698, 2725, 2747, 2740, 2734, 2730, 2723, 2716);
INSERT INTO `populations` VALUES ('四川省', 8368, 8374, 8372, 8371, 8351, 8321, 8289, 8251, 8196, 8139, 8109, 8085, 8064, 8045, 8185, 8138, 8127, 8169, 8212);
INSERT INTO `populations` VALUES ('天津市', 1364, 1363, 1373, 1387, 1385, 1383, 1410, 1443, 1439, 1429, 1410, 1378, 1341, 1299, 1228, 1176, 1115, 1075, 1043);
INSERT INTO `populations` VALUES ('宁夏回族自治区', 729, 728, 725, 721, 717, 710, 705, 695, 684, 678, 666, 659, 648, 633, 625, 618, 610, 604, 596);
INSERT INTO `populations` VALUES ('安徽省', 6121, 6127, 6113, 6105, 6092, 6076, 6057, 6033, 6011, 5997, 5988, 5978, 5972, 5957, 6131, 6135, NULL, NULL, NULL);
INSERT INTO `populations` VALUES ('山东省', 10123, 10163, 10170, 10165, 10106, 10077, 10033, 9973, 9866, 9808, 9746, 9708, 9665, 9588, 9470, 9417, 9367, 9309, 9248);
INSERT INTO `populations` VALUES ('山西省', 3466, 3481, 3480, 3490, 3497, 3502, 3510, 3514, 3519, 3528, 3535, 3548, 3562, 3574, 3427, 3411, 3393, 3375, 3355);
INSERT INTO `populations` VALUES ('广东省', 12706, 12657, 12684, 12624, 12489, 12348, 12141, 11908, 11678, 11489, 11270, 11041, 10756, 10441, 10130, 9893, 9660, 9442, 9194);
INSERT INTO `populations` VALUES ('广西壮族自治区', 5027, 5047, 5037, 5019, 4982, 4947, 4907, 4857, 4811, 4770, 4731, 4694, 4655, 4610, 4856, 4816, 4768, 4719, 4660);
INSERT INTO `populations` VALUES ('新疆维吾尔自治区', 2598, 2587, 2589, 2590, 2559, 2520, 2480, 2428, 2385, 2325, 2285, 2253, 2225, 2185, 2159, 2131, 2095, 2050, 2010);
INSERT INTO `populations` VALUES ('江苏省', 8526, 8515, 8505, 8477, 8469, 8446, 8423, 8381, 8315, 8281, 8192, 8120, 8023, 7869, 7810, 7762, 7723, 7656, 7588);
INSERT INTO `populations` VALUES ('江西省', 4515, 4528, 4517, 4519, 4516, 4513, 4511, 4496, 4485, 4480, 4476, 4475, 4474, 4462, 4432, 4400, 4368, 4339, 4311);
INSERT INTO `populations` VALUES ('河北省', 7393, 7420, 7448, 7464, 7447, 7426, 7409, 7375, 7345, 7323, 7288, 7262, 7232, 7194, 7034, 6989, 6943, 6898, 6851);
INSERT INTO `populations` VALUES ('河南省', 9815, 9872, 9883, 9941, 9901, 9864, 9829, 9778, 9701, 9645, 9573, 9532, 9461, 9405, 9487, 9429, 9360, 9392, 9380);
INSERT INTO `populations` VALUES ('浙江省', 6627, 6577, 6540, 6468, 6375, 6273, 6170, 6072, 5985, 5890, 5784, 5685, 5570, 5447, 5276, 5212, 5155, 5072, 4991);
INSERT INTO `populations` VALUES ('海南省', 1043, 1027, 1020, 1012, 995, 982, 972, 957, 945, 936, 920, 910, 890, 869, 864, 854, 845, 836, 828);
INSERT INTO `populations` VALUES ('湖北省', 5838, 5844, 5830, 5745, 5927, 5917, 5904, 5885, 5850, 5816, 5798, 5781, 5760, 5728, 5720, 5711, 5699, 5693, 5710);
INSERT INTO `populations` VALUES ('湖南省', 6568, 6604, 6622, 6645, 6640, 6635, 6633, 6625, 6615, 6611, 6600, 6590, 6581, 6570, 6406, 6380, 6355, 6342, 6326);
INSERT INTO `populations` VALUES ('甘肃省', 2465, 2492, 2490, 2501, 2509, 2515, 2522, 2520, 2523, 2531, 2537, 2550, 2552, 2560, 2555, 2551, 2548, 2547, 2545);
INSERT INTO `populations` VALUES ('福建省', 4183, 4188, 4187, 4161, 4137, 4104, 4065, 4016, 3984, 3945, 3885, 3841, 3784, 3693, 3666, 3639, 3612, 3585, 3557);
INSERT INTO `populations` VALUES ('西藏自治区', 365, 364, 366, 366, 361, 354, 349, 340, 330, 325, 317, 315, 309, 300, 296, 292, 289, 285, 280);
INSERT INTO `populations` VALUES ('贵州省', 3865, 3856, 3852, 3858, 3848, 3822, 3803, 3758, 3708, 3677, 3632, 3587, 3530, 3479, 3537, 3596, 3632, 3690, 3730);
INSERT INTO `populations` VALUES ('辽宁省', 4182, 4197, 4229, 4255, 4277, 4291, 4312, 4327, 4338, 4358, 4365, 4375, 4379, 4375, 4341, 4315, 4298, 4271, 4221);
INSERT INTO `populations` VALUES ('重庆市', 3191, 3213, 3212, 3209, 3188, 3163, 3144, 3110, 3070, 3043, 3011, 2975, 2944, 2885, 2859, 2839, 2816, 2808, 2798);
INSERT INTO `populations` VALUES ('陕西省', 3952, 3956, 3954, 3955, 3944, 3931, 3904, 3874, 3846, 3827, 3804, 3787, 3765, 3735, 3727, 3718, 3708, 3699, 3690);
INSERT INTO `populations` VALUES ('青海省', 594, 595, 594, 593, 590, 587, 586, 582, 577, 576, 571, 571, 568, 563, 557, 554, 552, 548, 543);
INSERT INTO `populations` VALUES ('香港特别行政区', 753, 747, 741, 748, 751, 745, 739, 734, 729, 723, 718, 715, 707, 702, 697, 696, 692, 686, 681);
INSERT INTO `populations` VALUES ('黑龙江省', 3062, 3099, 3125, 3171, 3255, 3327, 3399, 3463, 3529, 3608, 3666, 3724, 3782, 3833, 3826, 3825, 3824, 3823, 3820);

-- ----------------------------
-- Table structure for provinces
-- ----------------------------
DROP TABLE IF EXISTS `provinces`;
CREATE TABLE `provinces`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `province_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_province_name`(`province_name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of provinces
-- ----------------------------
INSERT INTO `provinces` VALUES (3, '上海市');
INSERT INTO `provinces` VALUES (24, '云南省');
INSERT INTO `provinces` VALUES (1, '全国');
INSERT INTO `provinces` VALUES (28, '内蒙古自治区');
INSERT INTO `provinces` VALUES (2, '北京市');
INSERT INTO `provinces` VALUES (35, '台湾省');
INSERT INTO `provinces` VALUES (9, '吉林省');
INSERT INTO `provinces` VALUES (22, '四川省');
INSERT INTO `provinces` VALUES (4, '天津市');
INSERT INTO `provinces` VALUES (31, '宁夏回族自治区');
INSERT INTO `provinces` VALUES (13, '安徽省');
INSERT INTO `provinces` VALUES (16, '山东省');
INSERT INTO `provinces` VALUES (7, '山西省');
INSERT INTO `provinces` VALUES (20, '广东省');
INSERT INTO `provinces` VALUES (29, '广西壮族自治区');
INSERT INTO `provinces` VALUES (32, '新疆维吾尔自治区');
INSERT INTO `provinces` VALUES (11, '江苏省');
INSERT INTO `provinces` VALUES (15, '江西省');
INSERT INTO `provinces` VALUES (6, '河北省');
INSERT INTO `provinces` VALUES (17, '河南省');
INSERT INTO `provinces` VALUES (12, '浙江省');
INSERT INTO `provinces` VALUES (21, '海南省');
INSERT INTO `provinces` VALUES (18, '湖北省');
INSERT INTO `provinces` VALUES (19, '湖南省');
INSERT INTO `provinces` VALUES (34, '澳门特别行政区');
INSERT INTO `provinces` VALUES (26, '甘肃省');
INSERT INTO `provinces` VALUES (14, '福建省');
INSERT INTO `provinces` VALUES (30, '西藏自治区');
INSERT INTO `provinces` VALUES (23, '贵州省');
INSERT INTO `provinces` VALUES (8, '辽宁省');
INSERT INTO `provinces` VALUES (5, '重庆市');
INSERT INTO `provinces` VALUES (25, '陕西省');
INSERT INTO `provinces` VALUES (27, '青海省');
INSERT INTO `provinces` VALUES (33, '香港特别行政区');
INSERT INTO `provinces` VALUES (10, '黑龙江省');

-- ----------------------------
-- Table structure for yearspopulations
-- ----------------------------
DROP TABLE IF EXISTS `yearspopulations`;
CREATE TABLE `yearspopulations`  (
  `日期` year NOT NULL,
  `年末总人口数` int NULL DEFAULT NULL,
  `省份` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yearspopulations
-- ----------------------------
INSERT INTO `yearspopulations` VALUES (2005, 100, '北京市');
INSERT INTO `yearspopulations` VALUES (2006, 600, '北京市');
INSERT INTO `yearspopulations` VALUES (2005, 100, '北京市');
INSERT INTO `yearspopulations` VALUES (2006, NULL, '北京市');

SET FOREIGN_KEY_CHECKS = 1;
