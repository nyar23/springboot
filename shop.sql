/*
 Navicat Premium Data Transfer

 Source Server         : mysql8.0.33
 Source Server Type    : MySQL
 Source Server Version : 80033 (8.0.33)
 Source Host           : localhost:3306
 Source Schema         : shop

 Target Server Type    : MySQL
 Target Server Version : 80033 (8.0.33)
 File Encoding         : 65001

 Date: 14/01/2024 01:33:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ausertable
-- ----------------------------
DROP TABLE IF EXISTS `ausertable`;
CREATE TABLE `ausertable`  (
  `aname` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `apwd` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`aname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ausertable
-- ----------------------------
INSERT INTO `ausertable` VALUES ('admin', 'admin');

-- ----------------------------
-- Table structure for busertable
-- ----------------------------
DROP TABLE IF EXISTS `busertable`;
CREATE TABLE `busertable`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `bemail` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `bpwd` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `phone` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of busertable
-- ----------------------------
INSERT INTO `busertable` VALUES (6, 'chenhengdl@126.com', '78f8a7ae700c91db09facb05a675432b', '', NULL);
INSERT INTO `busertable` VALUES (9, '1346214825@qq.com', '78f8a7ae700c91db09facb05a675432b', '', NULL);
INSERT INTO `busertable` VALUES (10, '1346214825@qq.com', '78f8a7ae700c91db09facb05a675432b', '', NULL);
INSERT INTO `busertable` VALUES (11, '2904705451@qq.com', '78f8a7ae700c91db09facb05a675432b', '18977897744', NULL);
INSERT INTO `busertable` VALUES (12, 'cj@qq.com', '78f8a7ae700c91db09facb05a675432b', '114514', '陈杰');

-- ----------------------------
-- Table structure for carttable
-- ----------------------------
DROP TABLE IF EXISTS `carttable`;
CREATE TABLE `carttable`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `busertable_id` int NOT NULL,
  `goodstable_id` int NOT NULL,
  `shoppingnum` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bid`(`busertable_id` ASC) USING BTREE,
  INDEX `gno`(`goodstable_id` ASC) USING BTREE,
  CONSTRAINT `bid` FOREIGN KEY (`busertable_id`) REFERENCES `busertable` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `gno` FOREIGN KEY (`goodstable_id`) REFERENCES `goodstable` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carttable
-- ----------------------------

-- ----------------------------
-- Table structure for focustable
-- ----------------------------
DROP TABLE IF EXISTS `focustable`;
CREATE TABLE `focustable`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `goodstable_id` int NOT NULL,
  `busertable_id` int NOT NULL,
  `focustime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `gno1`(`goodstable_id` ASC) USING BTREE,
  INDEX `bid1`(`busertable_id` ASC) USING BTREE,
  CONSTRAINT `bid1` FOREIGN KEY (`busertable_id`) REFERENCES `busertable` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `gno1` FOREIGN KEY (`goodstable_id`) REFERENCES `goodstable` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of focustable
-- ----------------------------
INSERT INTO `focustable` VALUES (5, 29, 6, '2019-10-05 14:55:51');
INSERT INTO `focustable` VALUES (6, 35, 9, '2024-01-12 02:01:48');
INSERT INTO `focustable` VALUES (7, 34, 9, '2024-01-12 22:22:51');
INSERT INTO `focustable` VALUES (8, 46, 9, '2024-01-12 22:30:08');
INSERT INTO `focustable` VALUES (9, 45, 9, '2024-01-12 22:30:13');
INSERT INTO `focustable` VALUES (10, 57, 9, '2024-01-12 22:30:20');
INSERT INTO `focustable` VALUES (11, 56, 9, '2024-01-12 22:30:23');
INSERT INTO `focustable` VALUES (23, 63, 11, '2024-01-13 14:12:50');
INSERT INTO `focustable` VALUES (24, 62, 11, '2024-01-13 14:12:52');
INSERT INTO `focustable` VALUES (25, 61, 11, '2024-01-13 14:12:54');

-- ----------------------------
-- Table structure for goodstable
-- ----------------------------
DROP TABLE IF EXISTS `goodstable`;
CREATE TABLE `goodstable`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `gname` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `goprice` double NULL DEFAULT NULL,
  `grprice` double NULL DEFAULT NULL,
  `gstore` int NULL DEFAULT NULL,
  `gpicture` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  `isRecommend` tinyint NULL DEFAULT NULL,
  `isAdvertisement` tinyint NULL DEFAULT NULL,
  `goodstype_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `typeid`(`goodstype_id` ASC) USING BTREE,
  CONSTRAINT `typeid` FOREIGN KEY (`goodstype_id`) REFERENCES `goodstype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 115 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goodstable
-- ----------------------------
INSERT INTO `goodstable` VALUES (3, '电饭锅', 500, 200, 200, 'appliance1.jpg', 1, 0, 2);
INSERT INTO `goodstable` VALUES (29, '洗衣机', 1300, 1200, 180, 'appliance2--xiyiji.jpg', 1, 0, 2);
INSERT INTO `goodstable` VALUES (32, '电冰箱', 2000, 1600, 80, 'appliance3--dianbingxiang.jpg', 1, 0, 2);
INSERT INTO `goodstable` VALUES (33, '油烟机', 1300, 1000, 65, 'appliance4--youyanji.jpg', 1, 0, 2);
INSERT INTO `goodstable` VALUES (34, '空调', 2980, 2700, 60, 'appliance5--kongtiao.jpg', 1, 0, 2);
INSERT INTO `goodstable` VALUES (35, '彩电', 1900, 1500, 200, 'appliance6--caidian.jpg', 1, 0, 2);
INSERT INTO `goodstable` VALUES (36, '婴儿套装', 50, 35, 150, 'children01--taozhuang.jpg', 1, 0, 3);
INSERT INTO `goodstable` VALUES (37, '婴儿奶粉', 200, 158, 213, 'children02--naifen.jpg', 1, 0, 3);
INSERT INTO `goodstable` VALUES (38, '婴儿车', 80, 50, 56, 'children03--yingerche.jpg', 1, 0, 3);
INSERT INTO `goodstable` VALUES (39, '奶瓶', 15, 10, 30, 'children04--naiping.jpg', 1, 0, 3);
INSERT INTO `goodstable` VALUES (40, '洗澡盆', 50, 35, 90, 'children05--xizaopen.jpg', 1, 0, 3);
INSERT INTO `goodstable` VALUES (41, '婴儿车', 185, 150, 15, 'children06--yierchuang.jpg', 1, 0, 3);
INSERT INTO `goodstable` VALUES (42, '蓝色牛仔衣', 500, 350, 50, 'clothing01--niuzaiyi.jpg', 1, 0, 14);
INSERT INTO `goodstable` VALUES (43, '黑色长裙', 1000, 720, 85, 'clothing02--heise.jpg', 1, 0, 14);
INSERT INTO `goodstable` VALUES (44, '蓝色大衣', 200, 130, 45, 'clothing03--lansedayi.jpg', 1, 0, 14);
INSERT INTO `goodstable` VALUES (45, '运动服', 405, 352, 35, 'clothing04--yundonfu.jpg', 1, 0, 14);
INSERT INTO `goodstable` VALUES (46, '风衣', 500, 320, 58, 'clothing05--fengyi.jpg', 1, 0, 14);
INSERT INTO `goodstable` VALUES (47, '夹克', 700, 300, 65, 'clothing06--jiake.jpg', 1, 0, 14);
INSERT INTO `goodstable` VALUES (48, '铅笔', 2.5, 1.5, 35, 'stationery01--qianbi.jpg', 1, 0, 15);
INSERT INTO `goodstable` VALUES (49, '笔记本', 10, 7, 23, 'stationery02--bijiben.jpg', 1, 0, 15);
INSERT INTO `goodstable` VALUES (50, '橡皮擦', 2, 1, 56, 'stationery03--xiangpica.jpg', 1, 0, 15);
INSERT INTO `goodstable` VALUES (51, '文具盒', 20, 15, 65, 'stationery04--wenjuhe.jpg', 1, 0, 15);
INSERT INTO `goodstable` VALUES (52, '书包', 100, 75, 45, 'stationery05--shubao.jpg', 1, 0, 15);
INSERT INTO `goodstable` VALUES (53, '铅笔芯', 10, 8, 12, 'stationery06--qinxin.jpg', 1, 0, 15);
INSERT INTO `goodstable` VALUES (54, '漓泉啤酒', 5, 3, 230, 'drink01--liquan.jpg', 1, 0, 16);
INSERT INTO `goodstable` VALUES (55, '二锅头', 55, 35, 12, 'drink02--erguotou.jpg', 1, 0, 16);
INSERT INTO `goodstable` VALUES (56, '葡萄酒', 520, 300, 10, 'drink03--putaojiu.jpg', 1, 0, 16);
INSERT INTO `goodstable` VALUES (57, '米酒', 30, 20, 23, 'drink04--mijiu.jpg', 1, 0, 16);
INSERT INTO `goodstable` VALUES (58, '红高粱', 80, 60, 43, 'drink05--honggaoliang.jpg', 1, 0, 16);
INSERT INTO `goodstable` VALUES (59, '茅台', 5000, 3500, 5, 'drink06--maotai.jpg', 1, 0, 16);
INSERT INTO `goodstable` VALUES (60, '口红', 200, 150, 50, 'cosmetics01--kouhong.jpg', 1, 0, 17);
INSERT INTO `goodstable` VALUES (61, '眼线笔', 15, 8, 52, 'cosmetics02--yanxianbi.jpg', 1, 0, 17);
INSERT INTO `goodstable` VALUES (62, '粉底液', 50, 35, 30, 'cosmetics03--fendiye.jpg', 1, 0, 17);
INSERT INTO `goodstable` VALUES (63, '遮瑕膏', 36, 25, 97, 'cosmetics04--zhexiagao.jpg', 1, 0, 17);
INSERT INTO `goodstable` VALUES (64, '眼影盘', 40, 35, 67, 'cosmetics05--zhemaogao.jpg', 1, 0, 17);
INSERT INTO `goodstable` VALUES (65, '腮红', 75, 50, 35, 'cosmetics06--saihong.jpg', 1, 0, 17);
INSERT INTO `goodstable` VALUES (69, '舍得', 578, 356, 45, 'drink07--shede.jpg', 0, 0, 16);
INSERT INTO `goodstable` VALUES (70, '威士忌', 1530, 1200, 3, 'drink08--weisiji.jpg', 0, 0, 16);
INSERT INTO `goodstable` VALUES (71, '宜宾酒', 850, 650, 2, 'drink09--yinbingjiu.jpg', 0, 0, 16);
INSERT INTO `goodstable` VALUES (72, '人参酒', 2000, 1500, 6, 'drink10--rensengjiu.jpg', 0, 0, 16);
INSERT INTO `goodstable` VALUES (73, '口子窖', 650, 500, 5, 'drink11--kouzijiao.jpg', 0, 0, 16);
INSERT INTO `goodstable` VALUES (75, '卸妆水', 35, 25, 24, 'cosmetics07--xiezhuangshui.jpg', 0, 0, 17);
INSERT INTO `goodstable` VALUES (76, '洗面奶', 100, 80, 30, 'cosmetics08--ximiannai.jpg', 0, 0, 17);
INSERT INTO `goodstable` VALUES (77, '保湿面膜', 50, 40, 792, 'cosmetics09--baosishuang.jpg', 0, 0, 17);
INSERT INTO `goodstable` VALUES (78, '花子粉', 50, 45, 243, 'cosmetics10--huajifen.jpg', 0, 0, 17);
INSERT INTO `goodstable` VALUES (79, '玻尿酸', 50, 35, 35, 'cosmetics11--boniaoshuan.jpg', 0, 0, 17);
INSERT INTO `goodstable` VALUES (80, '补水面膜', 75, 60, 46, 'cosmetics12--bushuimianmo.jpg', 0, 0, 17);
INSERT INTO `goodstable` VALUES (81, '', 6000, 3000, 80, '清场大甩卖.jpg', 0, 1, 2);
INSERT INTO `goodstable` VALUES (82, '', 999, 500, 46, '全场7折.jpg', 0, 1, 2);
INSERT INTO `goodstable` VALUES (83, '电磁炉', 999, 399, 56, 'appliance9--diancilu.jpg', 0, 0, 2);
INSERT INTO `goodstable` VALUES (84, '豆浆机', 399, 199, 1, 'appliance9--doujiangji.jpg', 0, 0, 2);
INSERT INTO `goodstable` VALUES (85, '热水器', 1899, 1499, 23, 'appliance9--reshuiqi.jpg', 0, 0, 2);
INSERT INTO `goodstable` VALUES (86, '按摩椅', 1699, 1299, 43, 'appliance12--anmoyi.jpg', 0, 0, 2);
INSERT INTO `goodstable` VALUES (87, '尺子', 8, 5, 231, 'stationery07--chizi.jpg', 0, 0, 15);
INSERT INTO `goodstable` VALUES (88, '计算机', 20, 15, 67, 'stationery08--jishuanji.jpg', 0, 0, 15);
INSERT INTO `goodstable` VALUES (89, '削笔刀', 25, 22, 56, 'stationery09--xiaobidao.jpg', 0, 0, 15);
INSERT INTO `goodstable` VALUES (90, 'java项目实战', 60, 55, 90, 'stationery10--shizhan.jpg', 0, 0, 15);
INSERT INTO `goodstable` VALUES (91, 'javaee书', 87, 76, 68, 'stationery11--javaee.jpg', 0, 0, 15);
INSERT INTO `goodstable` VALUES (93, '苗族服饰', 250, 200, 12, 'clothing07--miaozu.jpg', 0, 0, 14);
INSERT INTO `goodstable` VALUES (94, '毕业服装', 200, 150, 10, 'clothing08--biye.jpg', 0, 0, 14);
INSERT INTO `goodstable` VALUES (95, '黑色夹克', 230, 160, 32, 'clothing09--heisejiake.jpg', 0, 0, 14);
INSERT INTO `goodstable` VALUES (96, '西装', 560, 380, 34, 'clothing09--xizhuang.jpg', 0, 0, 14);
INSERT INTO `goodstable` VALUES (97, '老年服装', 132, 87, 61, 'clothing10--laonian.jpg', 0, 0, 14);
INSERT INTO `goodstable` VALUES (99, '围兜', 32, 23, 34, 'children07--weidou.jpg', 0, 0, 3);
INSERT INTO `goodstable` VALUES (100, '玩具礼盒', 66, 56, 21, 'children08--wanjulihe.jpg', 0, 0, 3);
INSERT INTO `goodstable` VALUES (101, '浴盆', 50, 31, 209, 'children09--yupan.jpg', 0, 0, 3);
INSERT INTO `goodstable` VALUES (102, '婴儿奶嘴', 3, 2, 45, 'children10--naizui.jpg', 0, 0, 3);
INSERT INTO `goodstable` VALUES (103, '婴儿摇摇椅', 45, 31, 82, 'children11--yaoyaoyi.jpg', 0, 0, 3);
INSERT INTO `goodstable` VALUES (104, '婴儿口水巾', 10, 8, 30, 'children12--koushuijing.jpg', 0, 0, 3);
INSERT INTO `goodstable` VALUES (106, '投影仪', 1699, 1599, 3, 'appliance7--touyingyi.jpg', 0, 0, 2);
INSERT INTO `goodstable` VALUES (107, '扫地机', 599, 500, 6, 'appliance8--saodiji.jpg', 0, 0, 2);
INSERT INTO `goodstable` VALUES (109, '坛子酒', 300, 250, 4, 'drink12--tanzijiu.jpg', 0, 0, 16);
INSERT INTO `goodstable` VALUES (110, '婚纱', 2150, 1875, 97, 'clothing11--hunsha.jpg', 0, 0, 14);
INSERT INTO `goodstable` VALUES (111, 'javaweb书', 65, 50, 32, 'stationery12--javaweb.jpg', 0, 0, 15);

-- ----------------------------
-- Table structure for goodstype
-- ----------------------------
DROP TABLE IF EXISTS `goodstype`;
CREATE TABLE `goodstype`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `typename` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goodstype
-- ----------------------------
INSERT INTO `goodstype` VALUES (2, '家电');
INSERT INTO `goodstype` VALUES (3, '孕童');
INSERT INTO `goodstype` VALUES (14, '服装');
INSERT INTO `goodstype` VALUES (15, '文具');
INSERT INTO `goodstype` VALUES (16, '酒水');
INSERT INTO `goodstype` VALUES (17, '化妆品');

-- ----------------------------
-- Table structure for orderbasetable
-- ----------------------------
DROP TABLE IF EXISTS `orderbasetable`;
CREATE TABLE `orderbasetable`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `busertable_id` int NOT NULL,
  `amount` double NOT NULL,
  `status` tinyint NOT NULL,
  `orderdate` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bid2`(`busertable_id` ASC) USING BTREE,
  CONSTRAINT `bid2` FOREIGN KEY (`busertable_id`) REFERENCES `busertable` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderbasetable
-- ----------------------------
INSERT INTO `orderbasetable` VALUES (3, 6, 4000, 1, '2019-10-06 06:06:29');
INSERT INTO `orderbasetable` VALUES (4, 6, 14000, 0, '2019-10-08 05:51:43');
INSERT INTO `orderbasetable` VALUES (5, 6, 14000, 1, '2019-10-08 05:52:10');
INSERT INTO `orderbasetable` VALUES (6, 9, 3500, 1, '2024-01-12 02:02:47');

-- ----------------------------
-- Table structure for orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderbasetable_id` int NOT NULL,
  `goodstable_id` int NOT NULL,
  `shoppingnum` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `odsn`(`orderbasetable_id` ASC) USING BTREE,
  INDEX `gno3`(`goodstable_id` ASC) USING BTREE,
  CONSTRAINT `gno3` FOREIGN KEY (`goodstable_id`) REFERENCES `goodstable` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `odsn` FOREIGN KEY (`orderbasetable_id`) REFERENCES `orderbasetable` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------
INSERT INTO `orderdetail` VALUES (5, 3, 29, 20);
INSERT INTO `orderdetail` VALUES (6, 4, 33, 20);
INSERT INTO `orderdetail` VALUES (7, 6, 33, 5);

SET FOREIGN_KEY_CHECKS = 1;
