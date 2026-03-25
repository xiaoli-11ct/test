/*
 Navicat Premium Dump SQL

 Source Server         : shixun
 Source Server Type    : MySQL
 Source Server Version : 80042 (8.0.42)
 Source Host           : localhost:3306
 Source Schema         : java

 Target Server Type    : MySQL
 Target Server Version : 80042 (8.0.42)
 File Encoding         : 65001

 Date: 22/03/2026 18:51:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sort_order` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_code`(`code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '民间文学', 'folk_literature', 1);
INSERT INTO `category` VALUES (2, '传统音乐', 'traditional_music', 2);
INSERT INTO `category` VALUES (3, '传统舞蹈', 'traditional_dance', 3);
INSERT INTO `category` VALUES (4, '传统戏剧', 'traditional_drama', 4);
INSERT INTO `category` VALUES (5, '曲艺', 'folk_art', 5);
INSERT INTO `category` VALUES (6, '传统体育、游艺与杂技', 'traditional_sports', 6);
INSERT INTO `category` VALUES (7, '传统美术', 'traditional_art', 7);
INSERT INTO `category` VALUES (8, '传统技艺', 'traditional_craft', 8);
INSERT INTO `category` VALUES (9, '传统医药', 'traditional_medicine', 9);
INSERT INTO `category` VALUES (10, '民俗', 'folk_custom', 10);

-- ----------------------------
-- Table structure for heritage
-- ----------------------------
DROP TABLE IF EXISTS `heritage`;
CREATE TABLE `heritage`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `province_id` int NOT NULL,
  `category_id` int NOT NULL,
  `level` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '国家级',
  `intro` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `video_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `inheritor` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `declaration_year` int NULL DEFAULT NULL,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_province`(`province_id` ASC) USING BTREE,
  INDEX `idx_category`(`category_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of heritage
-- ----------------------------
INSERT INTO `heritage` VALUES (1, '梁祝传说', 11, 1, '国家级', '梁山伯与祝英台的爱情故事，是中国四大民间传说之一', '梁祝传说讲述了梁山伯与祝英台相识于书院，相知相恋。', '/img/梁祝传说.jpeg', 'https://www.bilibili.com/video/BV1fF411i7eM/', '集体传承', 2006, '01-I-1', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (2, '白蛇传传说', 10, 1, '国家级', '白蛇与许仙的爱情神话故事', '白蛇传是中国四大民间传说之一。', '/img/白蛇传传说.jpeg', 'https://www.bilibili.com/video/BV1wPyABWEHE/', '集体传承', 2006, '01-I-2', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (3, '孟姜女传说', 27, 1, '国家级', '孟姜女哭长城的传说故事', '孟姜女传说讲述了在秦朝时期的故事。', '/img/孟姜女传说.webp', 'https://www.bilibili.com/video/BV11w411s776/', '集体传承', 2006, '01-I-3', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (4, '牛郎织女传说', 27, 1, '国家级', '牛郎织女的爱情传说', '牛郎织女是中国四大民间传说之一。', '/img/牛郎织女传说.webp', 'https://www.bilibili.com/video/BV1F4411C7de/', '集体传承', 2006, '01-I-4', '2026-03-22 18:18:24', '2026-03-22 18:36:28');
INSERT INTO `heritage` VALUES (5, '西厢记', 14, 1, '国家级', '元代戏曲名著', '《西厢记》是元代著名戏曲家王实甫创作的杂剧。', '/img/西厢记.webp', 'https://www.bilibili.com/video/BV1aq4y197DB/', '集体传承', 2006, '01-I-5', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (6, '古琴艺术', 1, 2, '国家级', '中国最古老的弹拨乐器艺术', '古琴艺术有三千余年历史。', '/img/古琴艺术.webp', 'https://www.bilibili.com/video/BV1qA411V7jo/', '李祥霆', 2003, '02-II-1', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (7, '江南丝竹', 10, 2, '国家级', '江苏地区的传统器乐合奏形式', '江南丝竹是以丝弦乐器和竹管乐器为主的传统器乐合奏形式。', '/img/江南丝竹.webp', 'https://www.bilibili.com/video/BV1FW411f71S/', '集体传承', 2006, '02-II-2', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (8, '蒙古族长调民歌', 5, 2, '国家级', '蒙古族传统歌唱艺术', '蒙古族长调民歌是蒙古族最具代表性的音乐形式。', '/img/蒙古族长调民歌.webp', 'https://www.bilibili.com/video/BV16N411X71S/', '宝音德力格尔', 2005, '02-II-3', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (9, '侗族大歌', 24, 2, '国家级', '贵州侗族的多声部民歌', '侗族大歌是贵州侗族人民创造的多声部民间合唱艺术。', '/img/侗族大歌.webp', 'https://www.bilibili.com/video/BV1Bc4ae2EmK/', '吴品仙', 2006, '02-II-4', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (10, '南音', 13, 2, '国家级', '福建泉州的古老音乐形式', '南音是中国现存最古老的乐种之一。', '/img/南音.webp', 'https://www.bilibili.com/video/BV1RA411N757/', '王大浩', 2006, '02-II-5', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (11, '西安鼓乐', 27, 2, '国家级', '陕西西安的传统器乐演奏形式', '西安鼓乐是源于唐代的古老乐种。', '/img/西安鼓乐webp.webp', 'https://www.bilibili.com/video/BV1ht41127UG/', '田春瘤', 2006, '02-II-6', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (12, '敦煌乐舞', 28, 2, '国家级', '敦煌壁画中的音乐舞蹈艺术', '敦煌乐舞源于敦煌壁画中的舞蹈形象。', '/img/敦煌乐舞.webp', 'https://www.bilibili.com/video/BV1gb421p7ek/', '集体传承', 2006, '02-II-7', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (13, '秧歌', 15, 3, '国家级', '北方地区的传统民间舞蹈', '秧歌是中国北方地区广为流传的民间舞蹈。', '/img/秧歌.webp', 'https://www.bilibili.com/video/BV1Gi4y1A78w/', '集体传承', 2006, '03-III-1', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (14, '狮舞', 19, 3, '国家级', '中国传统民间舞蹈', '狮舞是中国传统民间舞蹈，有两千多年历史。', '/img/狮舞.webp', 'https://www.douyin.com/video/7618629647434110586', '集体传承', 2006, '03-III-2', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (15, '龙舞', 23, 3, '国家级', '中国传统的民间舞蹈', '龙舞是中华民族的象征。', '/img/龙舞.webp', 'https://www.bilibili.com/video/BV1Z2421c7RU/', '集体传承', 2006, '03-III-3', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (16, '傣族孔雀舞', 25, 3, '国家级', '云南傣族的传统舞蹈', '孔雀舞是傣族最具代表性的舞蹈。', '/img/傣族孔雀舞.webp', 'https://www.bilibili.com/video/BV1oY41157zZ/', '刀美兰', 2006, '03-III-4', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (17, '朝鲜族农乐舞', 7, 3, '国家级', '吉林朝鲜族的传统舞蹈', '朝鲜族农乐舞是朝鲜族传统舞蹈。', '/img/朝鲜族农乐舞.webp', 'https://www.bilibili.com/video/BV1iv411J7jy/', '金明春', 2006, '03-III-5', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (18, '土家族摆手舞', 18, 3, '国家级', '湖南土家族的祭祀舞蹈', '摆手舞是土家族最古老的舞蹈。', '/img/土家族摆手舞.webp', 'https://www.bilibili.com/video/av487290762/', '集体传承', 2006, '03-III-6', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (19, '京剧', 1, 4, '国家级', '中国五大戏曲剧种之首', '京剧被誉为\"国粹\"。', '/img/京剧.webp', 'https://www.bilibili.com/video/BV1tx411s7nW/', '梅兰芳', 2006, '04-IV-1', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (20, '昆曲', 10, 4, '国家级', '中国最古老的剧种之一', '昆曲被称为\"百戏之祖\"。', '/img/昆曲.webp', 'https://www.bilibili.com/video/BV1p3411H7N9/', '张继青', 2001, '04-IV-2', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (21, '越剧', 11, 4, '国家级', '中国五大戏曲剧种之一', '越剧以\"女子越剧\"闻名天下。', '/img/越剧.webp', 'https://www.bilibili.com/video/BV1qz4y1d7ZH/', '茅威涛', 2006, '04-IV-3', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (22, '豫剧', 16, 4, '国家级', '中国五大戏曲剧种之一', '豫剧是河南省的主要剧种。', '/img/豫剧.webp', 'https://www.bilibili.com/video/av971025323/', '常香玉', 2006, '04-IV-4', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (23, '黄梅戏', 12, 4, '国家级', '中国五大戏曲剧种之一', '黄梅戏起源于湖北黄梅。', '/img/黄梅戏.webp', 'https://www.bilibili.com/video/av90146122/', '严凤英', 2006, '04-IV-5', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (24, '粤剧', 19, 4, '国家级', '广东传统戏曲剧种', '粤剧是岭南文化的代表剧种。', '/img/粤剧.webp', 'https://www.bilibili.com/video/av418900617/', '红线女', 2006, '04-IV-6', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (25, '川剧', 23, 4, '国家级', '四川传统戏曲剧种', '川剧是四川文化的重要组成部分。', '/img/川剧.webp', 'https://www.bilibili.com/video/BV16s411s7PU/', '陈智林', 2006, '04-IV-7', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (26, '秦腔', 27, 4, '国家级', '陕西传统戏曲剧种', '秦腔是中国最古老的剧种之一。', '/img/秦腔.webp', 'https://www.bilibili.com/video/BV1aL411v72k/', '李梅', 2006, '04-IV-8', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (27, '晋剧', 4, 4, '国家级', '山西地方戏曲剧种', '晋剧是山西省的主要剧种。', '/img/晋剧.webp', 'https://www.bilibili.com/video/BV1g44y1u71E/', '丁果仙', 2006, '04-IV-9', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (28, '河北梆子', 3, 4, '国家级', '河北传统戏曲剧种', '河北梆子是河北省的主要剧种。', '/img/河北梆子.webp', 'https://www.bilibili.com/video/BV1Mt411f7H4/', '裴艳玲', 2006, '04-IV-10', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (29, '相声', 1, 5, '国家级', '中国北方曲艺形式', '相声是以说、学、逗、唱为主要艺术手段的曲艺形式。', '/img/相声.webp', 'https://www.bilibili.com/video/av10423888/', '马三立', 2008, '05-V-1', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (30, '评书', 1, 5, '国家级', '北方评书艺术', '评书是以叙述故事为主的曲艺形式。', '/img/评书.webp', 'https://www.bilibili.com/video/BV1Tf4y1q7aK/', '单田芳', 2008, '05-V-2', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (31, '东北二人转', 6, 5, '国家级', '东北地区曲艺形式', '东北二人转史称\"蹦蹦\"。', '/img/东北二人转.webp', 'https://www.bilibili.com/video/BV14b411r7S6/', '赵本山', 2006, '05-V-3', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (32, '山东快书', 15, 5, '国家级', '山东传统曲艺', '山东快书是以说唱为主的曲艺形式。', '/img/山东快书.webp', 'https://www.bilibili.com/video/av14593828/', '集体传承', 2008, '05-V-4', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (33, '河南坠子', 16, 5, '国家级', '河南传统曲艺', '河南坠子是河南省的主要曲艺形式。', '/img/河南坠子.webp', 'https://www.bilibili.com/video/BV1C64y1v7dJ/', '集体传承', 2008, '05-V-5', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (34, '少林功夫', 16, 6, '国家级', '嵩山少林寺武术', '少林功夫历史悠久。', '/img/少林功夫.webp', 'https://www.bilibili.com/video/BV1PL4y1B7UH/', '释永信', 2006, '06-VI-1', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (35, '武当武术', 17, 6, '国家级', '武当山道教武术', '武当武术以柔克刚，以静制动。', '/img/武当武术.webp', 'https://www.bilibili.com/video/BV1t3411q7zZ/', '钟云龙', 2006, '06-VI-2', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (36, '吴桥杂技', 3, 6, '国家级', '河北吴桥传统杂技', '吴桥被誉为\"杂技之乡\"。', '/img/吴桥杂技.webp', 'https://www.bilibili.com/video/BV15u411Q7TY/', '王宝合', 2006, '06-VI-3', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (37, '太极拳', 16, 6, '国家级', '中国传统武术', '太极拳柔中带刚，养生技击兼备。', '/img/太极拳.webp', 'https://www.douyin.com/video/7619664588422111993', '陈小旺', 2006, '06-VI-4', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (38, '八卦掌', 1, 6, '国家级', '中国传统武术', '八卦掌是中国传统内家拳法之一。', '/img/八卦掌.webp', 'https://www.bilibili.com/video/BV1Zz4y127q1/', '集体传承', 2006, '06-VI-5', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (39, '中国剪纸', 3, 7, '国家级', '中国民间传统装饰艺术', '剪纸是中国民间传统装饰艺术。', '/img/中国剪纸.webp', 'https://www.bilibili.com/video/av369204548/', '郭佩珍', 2006, '07-VII-1', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (40, '中国篆刻', 10, 7, '国家级', '中国书法与雕刻艺术', '篆刻是书法与雕刻相结合的艺术。', '/img/中国篆刻.webp', 'https://www.bilibili.com/video/BV1hh4y1v7Ue/', '韩天衡', 2006, '07-VII-2', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (41, '中国书法', 1, 7, '国家级', '中国传统书写艺术', '书法是中国文化核心艺术之一。', '/img/中国书法.webp', 'https://www.bilibili.com/video/av90618410/', '欧阳中石', 2006, '07-VII-3', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (42, '中国画', 1, 7, '国家级', '中国传统绘画艺术', '中国画分人物、山水、花鸟三大科。', '/img/中国画.webp', 'https://www.bilibili.com/video/BV1Ue4y1y7GB/', '集体传承', 2006, '07-VII-4', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (43, '苏州刺绣', 10, 7, '国家级', '江苏苏州传统刺绣艺术', '苏绣是中国四大名绣之一。', '/img/苏州刺绣.webp', 'https://www.bilibili.com/video/av465803547/', '姚建萍', 2006, '07-VII-5', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (44, '湘绣', 18, 7, '国家级', '湖南传统刺绣艺术', '湘绣是中国四大名绣之一。', '/img/湘绣.webp', 'https://www.bilibili.com/video/BV1Et411z7cp/', '刘爱云', 2006, '07-VII-6', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (45, '蜀绣', 23, 7, '国家级', '四川传统刺绣艺术', '蜀绣是中国四大名绣之一。', '/img/粤绣.webp', 'https://www.bilibili.com/video/BV1xm4y1E7Zy/', '郝淑萍', 2006, '07-VII-7', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (46, '粤绣', 19, 7, '国家级', '广东传统刺绣艺术', '粤绣包括广绣和潮绣两大流派。', '/img/粤绣.webp', 'https://www.bilibili.com/video/BV1Tb421b7oP/', '陈少芳', 2006, '07-VII-8', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (47, '泥人张彩塑', 2, 7, '国家级', '天津传统泥塑艺术', '泥人张彩塑是天津传统民间艺术。', '/img/泥人张彩塑.webp', 'https://www.bilibili.com/video/av288030256/', '张明山', 2006, '07-VII-9', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (48, '杨柳青木版年画', 2, 7, '国家级', '天津传统年画', '杨柳青木版年画是中国著名的木版年画。', '/img/杨柳青木版年画.webp', 'https://www.bilibili.com/video/BV1SoJPzbE6c/', '霍庆有', 2006, '07-VII-10', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (49, '藏族唐卡', 26, 7, '国家级', '西藏传统卷轴画', '唐卡是藏传佛教艺术珍品。', '/img/藏族唐卡.webp', 'https://www.bilibili.com/video/BV17S4y1A73N/', '勉冲·罗布顿珠', 2006, '07-VII-11', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (50, '热贡艺术', 29, 7, '国家级', '青海热贡地区唐卡艺术', '热贡艺术是青海省同仁县热贡地区的传统艺术。', '/img/热贡艺术webp.webp', 'https://www.bilibili.com/video/BV1xq4y1575p/', '西合道', 2006, '07-VII-12', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (51, '景德镇手工制瓷技艺', 14, 8, '国家级', '江西景德镇制瓷技艺', '景德镇制瓷历史悠久。', '/img/景德镇手工制瓷技艺webp.webp', 'https://www.bilibili.com/video/BV12Y411g7RR/', '王锡良', 2006, '08-VIII-1', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (52, '宜兴紫砂陶制作技艺', 10, 8, '国家级', '江苏宜兴紫砂壶制作技艺', '宜兴紫砂壶是珍贵茶具。', '/img/宜兴紫砂陶制作技艺.webp', 'https://www.bilibili.com/video/BV1abbreKERP/', '顾景舟', 2006, '08-VIII-2', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (53, '龙泉青瓷烧制技艺', 11, 8, '国家级', '浙江龙泉青瓷烧制技艺', '龙泉青瓷是中国瓷器中的珍品。', '/img/龙泉青瓷烧制技艺.webp', 'https://www.douyin.com/video/6838882015635426568', '徐朝兴', 2006, '08-VIII-3', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (54, '景泰蓝制作技艺', 1, 8, '国家级', '北京传统珐琅工艺', '景泰蓝是北京传统特种金属工艺品。', '/img/景泰蓝制作技艺.webp', 'https://www.bilibili.com/video/av304708386/', '张同禄', 2006, '08-VIII-4', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (55, '中国传统桑蚕丝织技艺', 11, 8, '国家级', '浙江丝绸制作技艺', '丝绸是中国对外贸易的重要商品。', '/img/中国传统桑蚕丝织技艺.webp', 'https://www.bilibili.com/video/BV1vP41187zW/', '集体传承', 2006, '08-VIII-5', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (56, '宣纸制作技艺', 12, 8, '国家级', '安徽宣城宣纸制作技艺', '宣纸产于安徽宣城。', '/img/宣纸制作技艺.webp', 'https://www.bilibili.com/video/BV18a4y1B7iw/', '邢春荣', 2006, '08-VIII-6', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (57, '徽墨制作技艺', 12, 8, '国家级', '安徽黄山徽墨制作技艺', '徽墨产于安徽黄山歙县。', '/img/徽墨制作技艺.webp', 'https://www.bilibili.com/video/BV1Vh411g7Tb/', '周美洪', 2006, '08-VIII-7', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (58, '中国雕版印刷技艺', 10, 8, '国家级', '江苏扬州雕版印刷技艺', '雕版印刷是中国古代四大发明之一。', '/img/中国雕版印刷技艺：.webp', 'https://tv.cctv.com/2021/01/01/VIDEY75AwDvR5mYKs2x2Jodn210101.shtml', '集体传承', 2006, '08-VIII-8', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (59, '中国传统木结构营造技艺', 10, 8, '国家级', '中国传统建筑技艺', '中国传统木结构建筑以榫卯结构为核心。', '/img/中国传统木结构营造技艺.webp', 'https://www.bilibili.com/video/BV1bM411o7WV/', '集体传承', 2006, '08-VIII-9', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (60, '钧瓷烧制技艺', 16, 8, '国家级', '河南禹州钧瓷烧制技艺', '钧瓷产于河南禹州。', '/img/钧瓷烧制技艺：.webp', 'https://www.bilibili.com/video/BV1Ta4y1L7Sc/', '任星航', 2006, '08-VIII-10', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (61, '汝瓷烧制技艺', 16, 8, '国家级', '河南汝州汝瓷烧制技艺', '汝瓷产于河南汝州。', '/img/汝瓷烧制技艺.webp', 'https://www.bilibili.com/video/av427619352/', '集体传承', 2006, '08-VIII-11', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (62, '德化瓷烧制技艺', 13, 8, '国家级', '福建德化白瓷烧制技艺', '德化瓷以\"中国白\"著称。', '/img/德化瓷烧制技艺.webp', 'https://www.bilibili.com/video/BV1NRvHBfEZX/', '苏清河', 2006, '08-VIII-12', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (63, '中医针灸', 1, 9, '国家级', '中国传统医疗方法', '中医针灸包括针法和灸法。', '/img/中医针灸webp.webp', 'https://www.bilibili.com/video/BV1s34y1N73J/', '王雪苔', 2010, '09-IX-1', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (64, '中医正骨疗法', 16, 9, '国家级', '河南洛阳正骨技艺', '洛阳正骨历史悠久。', '/img/中医正骨疗法.webp', 'https://www.bilibili.com/video/BV1Sv421y7AR/', '集体传承', 2010, '09-IX-2', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (65, '中药炮制技术', 10, 9, '国家级', '传统中药炮制技艺', '中药炮制是根据中医药理论。', '/img/中药炮制技术.webp', 'https://www.bilibili.com/video/BV1wD4y1u7fY/', '集体传承', 2010, '09-IX-3', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (66, '同仁堂中医药文化', 1, 9, '国家级', '北京同仁堂制药技艺', '同仁堂创建于1669年。', '/img/同仁堂中医药文化.webp', 'https://www.bilibili.com/video/BV19NKZeYEqj/', '集体传承', 2010, '09-IX-4', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (67, '胡庆余堂中药文化', 11, 9, '国家级', '浙江胡庆余堂制药技艺', '胡庆余堂创建于1884年。', '/img/胡庆余堂中药文化.webp', 'https://www.bilibili.com/video/BV1X5NzeeEGD/', '集体传承', 2010, '09-IX-5', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (68, '端午节', 18, 10, '国家级', '中国传统节日', '端午节在每年农历五月初五。', '/img/端午节.webp', 'https://www.bilibili.com/video/av286002063/', '集体传承', 2006, '10-X-1', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (69, '中秋节', 10, 10, '国家级', '中国传统节日', '中秋节在每年农历八月十五。', '/img/中秋节.webp', 'https://www.bilibili.com/video/BV1A341127zA/', '集体传承', 2006, '10-X-2', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (70, '春节', 1, 10, '国家级', '中国传统节日', '春节是中华民族最重要的传统节日。', '/img/春节.webp', 'https://www.bilibili.com/video/BV1rL4y1W7iK/', '集体传承', 2006, '10-X-3', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (71, '清明节', 10, 10, '国家级', '中国传统节日', '清明节在每年公历4月4日至6日之间。', '/img/清明节.webp', 'https://www.bilibili.com/video/BV1Y44y1T7xj/', '集体传承', 2006, '10-X-4', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (72, '重阳节', 27, 10, '国家级', '中国传统节日', '重阳节在每年农历九月初九。', '/img/重阳节.webp', 'https://www.bilibili.com/video/av280024539/', '集体传承', 2006, '10-X-5', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (73, '元宵节', 10, 10, '国家级', '中国传统节日', '元宵节在农历正月十五。', '/img/元宵节.webp', 'https://www.bilibili.com/video/BV1MUAKzREue/', '集体传承', 2006, '10-X-6', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (74, '妈祖祭典', 13, 10, '国家级', '福建湄洲妈祖信俗', '妈祖是海神。', '/img/妈祖祭典.webp', 'https://www.bilibili.com/video/BV1Zt411i77m/', '集体传承', 2006, '10-X-7', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (75, '黄帝陵祭典', 27, 10, '国家级', '陕西黄帝陵祭祀活动', '黄帝是中华民族的始祖。', '/img/黄帝陵祭典.webp', 'https://www.bilibili.com/video/BV1viZ9YcEFr/', '集体传承', 2006, '10-X-8', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (76, '傣族泼水节', 25, 10, '国家级', '云南傣族传统节日', '泼水节是傣族的新年。', '/img/傣族泼水节.webp', 'https://www.bilibili.com/video/BV1EM411K7sg/', '集体传承', 2006, '10-X-9', '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `heritage` VALUES (77, '那达慕', 5, 10, '国家级', '蒙古族传统盛会', '那达慕是蒙古族的传统盛会。', '/img/那达慕.webp', 'https://www.bilibili.com/video/BV1HG411V7Mn/', '集体传承', 2006, '10-X-10', '2026-03-22 18:18:24', '2026-03-22 18:18:24');

-- ----------------------------
-- Table structure for inheritor
-- ----------------------------
DROP TABLE IF EXISTS `inheritor`;
CREATE TABLE `inheritor`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `gender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `province_id` int NOT NULL,
  `category_id` int NULL DEFAULT NULL,
  `level` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '国家级',
  `birthday` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `intro` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_province`(`province_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inheritor
-- ----------------------------
INSERT INTO `inheritor` VALUES (1, '李祥霆', '男', 1, 2, '国家级', '1940年', '古琴大师', NULL, '2026-03-21 19:09:48');
INSERT INTO `inheritor` VALUES (2, '梅兰芳', '男', 1, 4, '国家级', '1894年', '京剧大师', NULL, '2026-03-21 19:09:48');
INSERT INTO `inheritor` VALUES (3, '常香玉', '女', 16, 4, '国家级', '1923年', '豫剧大师', NULL, '2026-03-21 19:09:48');
INSERT INTO `inheritor` VALUES (4, '红线女', '女', 19, 4, '国家级', '1924年', '粤剧大师', NULL, '2026-03-21 19:09:48');
INSERT INTO `inheritor` VALUES (5, '严凤英', '女', 12, 4, '国家级', '1930年', '黄梅戏大师', NULL, '2026-03-21 19:09:48');
INSERT INTO `inheritor` VALUES (6, '赵本山', '男', 6, 5, '国家级', '1957年', '二人转演员', NULL, '2026-03-21 19:09:48');
INSERT INTO `inheritor` VALUES (7, '马三立', '男', 1, 5, '国家级', '1914年', '相声大师', NULL, '2026-03-21 19:09:48');
INSERT INTO `inheritor` VALUES (8, '单田芳', '男', 1, 5, '国家级', '1934年', '评书艺术家', NULL, '2026-03-21 19:09:48');
INSERT INTO `inheritor` VALUES (9, '释永信', '男', 16, 6, '国家级', '1965年', '少林寺方丈', NULL, '2026-03-21 19:09:48');
INSERT INTO `inheritor` VALUES (10, '钟云龙', '男', 17, 6, '国家级', '1964年', '武当武术传承人', NULL, '2026-03-21 19:09:48');
INSERT INTO `inheritor` VALUES (11, '王宝合', '男', 3, 6, '国家级', '1944年', '吴桥杂技传承人', NULL, '2026-03-21 19:09:48');
INSERT INTO `inheritor` VALUES (12, '姚建萍', '女', 10, 7, '国家级', '1968年', '苏绣大师', NULL, '2026-03-21 19:09:48');
INSERT INTO `inheritor` VALUES (13, '张同禄', '男', 1, 8, '国家级', '1942年', '景泰蓝大师', NULL, '2026-03-21 19:09:48');
INSERT INTO `inheritor` VALUES (14, '顾景舟', '男', 10, 8, '国家级', '1915年', '紫砂壶大师', NULL, '2026-03-21 19:09:48');
INSERT INTO `inheritor` VALUES (15, '王锡良', '男', 14, 8, '国家级', '1922年', '景德镇陶瓷大师', NULL, '2026-03-21 19:09:48');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `publish_date` date NULL DEFAULT NULL,
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (1, '2025年文化和自然遗产日活动成功举办', '2025年文化和自然遗产日期间,全国各地举办了丰富多彩的非遗展示活动', '新闻动态', '2025-06-10', NULL, '2026-03-21 19:09:48');
INSERT INTO `news` VALUES (2, '中国传统工艺振兴计划取得新进展', '中国传统工艺振兴计划实施以来,传统工艺项目保护传承情况显著改善', '专题报道', '2025-08-01', NULL, '2026-03-21 19:09:48');
INSERT INTO `news` VALUES (3, '中国非物质文化遗产数字化保护标准发布', '我国首个非物质文化遗产数字化保护行业标准正式发布', '政策动态', '2025-08-05', NULL, '2026-03-21 19:09:48');
INSERT INTO `news` VALUES (4, '非遗传承人群研修培训计划十年总结', '中国非物质文化遗产传承人群研修培训计划实施十年来成果丰硕', '新闻动态', '2025-06-04', NULL, '2026-03-21 19:09:48');
INSERT INTO `news` VALUES (5, '全国非遗普查工作全面启动', '新一轮全国非物质文化遗产普查工作在各省市全面启动', '新闻动态', '2025-03-18', NULL, '2026-03-21 19:09:48');
INSERT INTO `news` VALUES (6, '传统技艺类非遗项目保护与发展论坛举办', '传统技艺类非遗项目保护与发展论坛在北京举办', '专题报道', '2025-05-20', NULL, '2026-03-21 19:09:48');

-- ----------------------------
-- Table structure for province
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `province_code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `province_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `longitude` decimal(10, 6) NULL DEFAULT NULL,
  `latitude` decimal(10, 6) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_code`(`province_code` ASC) USING BTREE,
  UNIQUE INDEX `uk_name`(`province_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of province
-- ----------------------------
INSERT INTO `province` VALUES (1, '110000', '北京市', 116.407526, 39.904030, '2026-03-21 19:03:44', '2026-03-21 19:03:44');
INSERT INTO `province` VALUES (2, '120000', '天津市', 117.190182, 39.125596, '2026-03-21 19:03:44', '2026-03-21 19:03:44');
INSERT INTO `province` VALUES (3, '130000', '河北省', 114.502461, 38.045474, '2026-03-21 19:03:44', '2026-03-21 19:03:44');
INSERT INTO `province` VALUES (4, '140000', '山西省', 112.549248, 37.857014, '2026-03-21 19:03:44', '2026-03-21 19:03:44');
INSERT INTO `province` VALUES (5, '150000', '内蒙古自治区', 111.670801, 40.818311, '2026-03-21 19:03:44', '2026-03-21 19:03:44');
INSERT INTO `province` VALUES (6, '210000', '辽宁省', 123.429096, 41.796767, '2026-03-21 19:03:44', '2026-03-21 19:03:44');
INSERT INTO `province` VALUES (7, '220000', '吉林省', 125.324500, 43.886841, '2026-03-21 19:03:44', '2026-03-21 19:03:44');
INSERT INTO `province` VALUES (8, '230000', '黑龙江省', 126.642464, 45.756967, '2026-03-21 19:03:44', '2026-03-21 19:03:44');
INSERT INTO `province` VALUES (9, '310000', '上海市', 121.473701, 31.230416, '2026-03-21 19:03:44', '2026-03-21 19:03:44');
INSERT INTO `province` VALUES (10, '320000', '江苏省', 118.767413, 32.041544, '2026-03-21 19:03:44', '2026-03-21 19:03:44');
INSERT INTO `province` VALUES (11, '330000', '浙江省', 120.153576, 30.287459, '2026-03-21 19:03:44', '2026-03-21 19:03:44');
INSERT INTO `province` VALUES (12, '340000', '安徽省', 117.283042, 31.861191, '2026-03-21 19:03:44', '2026-03-21 19:03:44');
INSERT INTO `province` VALUES (13, '350000', '福建省', 119.306239, 26.075302, '2026-03-21 19:03:44', '2026-03-21 19:03:44');
INSERT INTO `province` VALUES (14, '360000', '江西省', 115.892151, 28.676493, '2026-03-21 19:03:44', '2026-03-21 19:03:44');
INSERT INTO `province` VALUES (15, '370000', '山东省', 117.000923, 36.675807, '2026-03-21 19:03:44', '2026-03-21 19:03:44');
INSERT INTO `province` VALUES (16, '410000', '河南省', 113.665412, 34.757975, '2026-03-21 19:03:44', '2026-03-21 19:03:44');
INSERT INTO `province` VALUES (17, '420000', '湖北省', 114.298572, 30.584355, '2026-03-21 19:03:44', '2026-03-21 19:03:44');
INSERT INTO `province` VALUES (18, '430000', '湖南省', 112.982279, 28.194090, '2026-03-21 19:03:44', '2026-03-21 19:03:44');
INSERT INTO `province` VALUES (19, '440000', '广东省', 113.280637, 23.125178, '2026-03-21 19:03:44', '2026-03-21 19:03:44');
INSERT INTO `province` VALUES (20, '450000', '广西壮族自治区', 108.320004, 22.824020, '2026-03-21 19:03:44', '2026-03-21 19:03:44');
INSERT INTO `province` VALUES (21, '460000', '海南省', 110.331190, 20.031971, '2026-03-21 19:03:44', '2026-03-21 19:03:44');
INSERT INTO `province` VALUES (22, '500000', '重庆市', 106.504962, 29.533155, '2026-03-21 19:03:44', '2026-03-21 19:03:44');
INSERT INTO `province` VALUES (23, '510000', '四川省', 104.065735, 30.659462, '2026-03-21 19:03:44', '2026-03-21 19:03:44');
INSERT INTO `province` VALUES (24, '520000', '贵州省', 106.713478, 26.578343, '2026-03-21 19:03:44', '2026-03-21 19:03:44');
INSERT INTO `province` VALUES (25, '530000', '云南省', 102.712251, 25.040609, '2026-03-21 19:03:44', '2026-03-21 19:03:44');
INSERT INTO `province` VALUES (26, '540000', '西藏自治区', 91.132212, 29.660361, '2026-03-21 19:03:44', '2026-03-21 19:03:44');
INSERT INTO `province` VALUES (27, '610000', '陕西省', 108.948024, 34.263161, '2026-03-21 19:03:44', '2026-03-21 19:03:44');
INSERT INTO `province` VALUES (28, '620000', '甘肃省', 103.823557, 36.058039, '2026-03-21 19:03:44', '2026-03-21 19:03:44');
INSERT INTO `province` VALUES (29, '630000', '青海省', 101.778916, 36.623178, '2026-03-21 19:03:44', '2026-03-21 19:03:44');
INSERT INTO `province` VALUES (30, '640000', '宁夏回族自治区', 106.278179, 38.466370, '2026-03-21 19:03:44', '2026-03-21 19:03:44');
INSERT INTO `province` VALUES (31, '650000', '新疆维吾尔自治区', 87.617733, 43.792818, '2026-03-21 19:03:44', '2026-03-21 19:03:44');
INSERT INTO `province` VALUES (32, '710000', '台湾省', 121.509062, 25.044332, '2026-03-21 19:03:44', '2026-03-21 19:03:44');
INSERT INTO `province` VALUES (33, '810000', '香港特别行政区', 114.173355, 22.320048, '2026-03-21 19:03:44', '2026-03-21 19:03:44');
INSERT INTO `province` VALUES (34, '820000', '澳门特别行政区', 113.549090, 22.198951, '2026-03-21 19:03:44', '2026-03-21 19:03:44');

-- ----------------------------
-- Table structure for statistics
-- ----------------------------
DROP TABLE IF EXISTS `statistics`;
CREATE TABLE `statistics`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `province_id` int NOT NULL,
  `total_count` int NULL DEFAULT 0,
  `national_count` int NULL DEFAULT 0,
  `provincial_count` int NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_province`(`province_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 340 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of statistics
-- ----------------------------
INSERT INTO `statistics` VALUES (309, 1, 11, 11, 0, '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `statistics` VALUES (310, 2, 2, 2, 0, '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `statistics` VALUES (311, 3, 3, 3, 0, '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `statistics` VALUES (312, 4, 1, 1, 0, '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `statistics` VALUES (313, 5, 2, 2, 0, '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `statistics` VALUES (314, 6, 1, 1, 0, '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `statistics` VALUES (315, 7, 1, 1, 0, '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `statistics` VALUES (316, 10, 12, 12, 0, '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `statistics` VALUES (317, 11, 5, 5, 0, '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `statistics` VALUES (318, 12, 3, 3, 0, '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `statistics` VALUES (319, 13, 3, 3, 0, '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `statistics` VALUES (320, 14, 2, 2, 0, '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `statistics` VALUES (321, 15, 2, 2, 0, '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `statistics` VALUES (322, 16, 7, 7, 0, '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `statistics` VALUES (323, 17, 1, 1, 0, '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `statistics` VALUES (324, 18, 3, 3, 0, '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `statistics` VALUES (325, 19, 3, 3, 0, '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `statistics` VALUES (326, 23, 3, 3, 0, '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `statistics` VALUES (327, 24, 1, 1, 0, '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `statistics` VALUES (328, 25, 2, 2, 0, '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `statistics` VALUES (329, 26, 1, 1, 0, '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `statistics` VALUES (330, 27, 6, 6, 0, '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `statistics` VALUES (331, 28, 1, 1, 0, '2026-03-22 18:18:24', '2026-03-22 18:18:24');
INSERT INTO `statistics` VALUES (332, 29, 1, 1, 0, '2026-03-22 18:18:24', '2026-03-22 18:18:24');

SET FOREIGN_KEY_CHECKS = 1;
