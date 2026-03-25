-- ============================================
-- 中国省级非遗项目可视化平台 - 完整数据库脚本
-- 数据库名: java
-- 字符集: utf8mb4
-- ============================================

-- 创建数据库
CREATE DATABASE IF NOT EXISTS `java` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE `java`;

-- 禁用外键检查
SET FOREIGN_KEY_CHECKS = 0;

-- ============================================
-- 1. 省份表
-- ============================================
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '省份ID',
  `province_code` VARCHAR(6) NOT NULL COMMENT '省份行政区划编码',
  `province_name` VARCHAR(100) NOT NULL COMMENT '省份名称',
  `longitude` DECIMAL(10,6) DEFAULT NULL COMMENT '经度',
  `latitude` DECIMAL(10,6) DEFAULT NULL COMMENT '纬度',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_code` (`province_code`),
  UNIQUE KEY `uk_name` (`province_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='省份表';

-- 34个省级行政区数据
INSERT INTO `province` (`province_code`, `province_name`, `longitude`, `latitude`) VALUES
('110000', '北京市', 116.407526, 39.904030),
('120000', '天津市', 117.190182, 39.125596),
('130000', '河北省', 114.502461, 38.045474),
('140000', '山西省', 112.549248, 37.857014),
('150000', '内蒙古自治区', 111.670801, 40.818311),
('210000', '辽宁省', 123.429096, 41.796767),
('220000', '吉林省', 125.324500, 43.886841),
('230000', '黑龙江省', 126.642464, 45.756967),
('310000', '上海市', 121.473701, 31.230416),
('320000', '江苏省', 118.767413, 32.041544),
('330000', '浙江省', 120.153576, 30.287459),
('340000', '安徽省', 117.283042, 31.861191),
('350000', '福建省', 119.306239, 26.075302),
('360000', '江西省', 115.892151, 28.676493),
('370000', '山东省', 117.000923, 36.675807),
('410000', '河南省', 113.665412, 34.757975),
('420000', '湖北省', 114.298572, 30.584355),
('430000', '湖南省', 112.982279, 28.194090),
('440000', '广东省', 113.280637, 23.125178),
('450000', '广西壮族自治区', 108.320004, 22.824020),
('460000', '海南省', 110.331190, 20.031971),
('500000', '重庆市', 106.504962, 29.533155),
('510000', '四川省', 104.065735, 30.659462),
('520000', '贵州省', 106.713478, 26.578343),
('530000', '云南省', 102.712251, 25.040609),
('540000', '西藏自治区', 91.132212, 29.660361),
('610000', '陕西省', 108.948024, 34.263161),
('620000', '甘肃省', 103.823557, 36.058039),
('630000', '青海省', 101.778916, 36.623178),
('640000', '宁夏回族自治区', 106.278179, 38.466370),
('650000', '新疆维吾尔自治区', 87.617733, 43.792818),
('710000', '台湾省', 121.509062, 25.044332),
('810000', '香港特别行政区', 114.173355, 22.320048),
('820000', '澳门特别行政区', 113.549090, 22.198951);

-- ============================================
-- 2. 非遗项目分类表
-- ============================================
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL COMMENT '分类名称',
  `code` VARCHAR(20) NOT NULL COMMENT '分类编码',
  `sort_order` INT DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='非遗分类表';

INSERT INTO `category` (`name`, `code`, `sort_order`) VALUES
('民间文学', 'folk_literature', 1),
('传统音乐', 'traditional_music', 2),
('传统舞蹈', 'traditional_dance', 3),
('传统戏剧', 'traditional_drama', 4),
('曲艺', 'folk_art', 5),
('传统体育、游艺与杂技', 'traditional_sports', 6),
('传统美术', 'traditional_art', 7),
('传统技艺', 'traditional_craft', 8),
('传统医药', 'traditional_medicine', 9),
('民俗', 'folk_custom', 10);

-- ============================================
-- 3. 非遗项目表
-- ============================================
DROP TABLE IF EXISTS `heritage`;
CREATE TABLE `heritage` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL COMMENT '项目名称',
  `province_id` INT NOT NULL COMMENT '所属省份ID',
  `category_id` INT NOT NULL COMMENT '分类ID',
  `level` VARCHAR(20) NOT NULL DEFAULT '国家级' COMMENT '级别：国家级/省级',
  `intro` TEXT COMMENT '简介',
  `description` TEXT COMMENT '详细描述',
  `img_url` VARCHAR(255) DEFAULT NULL COMMENT '图片URL',
  `video_url` VARCHAR(255) DEFAULT NULL COMMENT '视频URL',
  `inheritor` VARCHAR(100) DEFAULT NULL COMMENT '传承人',
  `declaration_year` INT DEFAULT NULL COMMENT '申报年份',
  `code` VARCHAR(50) DEFAULT NULL COMMENT '项目编号',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_province` (`province_id`),
  KEY `idx_category` (`category_id`),
  KEY `idx_level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='非遗项目表';

-- ============================================
-- 4. 传承人表
-- ============================================
DROP TABLE IF EXISTS `inheritor`;
CREATE TABLE `inheritor` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL COMMENT '姓名',
  `gender` VARCHAR(10) DEFAULT NULL COMMENT '性别',
  `province_id` INT NOT NULL COMMENT '所属省份ID',
  `category_id` INT DEFAULT NULL COMMENT '非遗分类ID',
  `level` VARCHAR(20) NOT NULL DEFAULT '国家级' COMMENT '级别',
  `birthday` VARCHAR(20) DEFAULT NULL COMMENT '出生年月',
  `intro` TEXT COMMENT '简介',
  `img_url` VARCHAR(255) DEFAULT NULL COMMENT '照片URL',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_province` (`province_id`),
  KEY `idx_category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='传承人表';

-- ============================================
-- 5. 新闻表
-- ============================================
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(200) NOT NULL COMMENT '标题',
  `content` TEXT COMMENT '内容',
  `category` VARCHAR(50) DEFAULT NULL COMMENT '分类',
  `publish_date` DATE DEFAULT NULL COMMENT '发布日期',
  `img_url` VARCHAR(255) DEFAULT NULL COMMENT '封面图片',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='新闻表';

-- ============================================
-- 6. 统计数据表
-- ============================================
DROP TABLE IF EXISTS `statistics`;
CREATE TABLE `statistics` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `province_id` INT NOT NULL COMMENT '省份ID',
  `total_count` INT DEFAULT 0 COMMENT '非遗总数',
  `national_count` INT DEFAULT 0 COMMENT '国家级数量',
  `provincial_count` INT DEFAULT 0 COMMENT '省级数量',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_province` (`province_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='统计数据表';

-- 启用外键检查
SET FOREIGN_KEY_CHECKS = 1;

-- 完成
SELECT '数据库初始化完成!' AS message;
