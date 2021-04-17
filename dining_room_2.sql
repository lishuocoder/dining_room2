/*
 Navicat Premium Data Transfer

 Source Server         : dinging-room
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : dining_room_2

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 09/06/2020 12:31:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for banners
-- ----------------------------
DROP TABLE IF EXISTS `banners`;
CREATE TABLE `banners`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `img` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图片地址',
  `sort` int(11) NOT NULL COMMENT '排序，小的在前',
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '跳转链接',
  `status` int(11) NOT NULL COMMENT '状态(1：上架 0：下架)',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of banners
-- ----------------------------
INSERT INTO `banners` VALUES (1, '/static/index/banner2.jpg', 2, '../../activityPage/activityOne', 1, '2020-02-02 08:08:19', '2020-02-02 08:08:19');
INSERT INTO `banners` VALUES (2, '/static/index/banner1.jpg', 3, '../../activityPage/activityTwo', 1, '2020-02-02 08:08:19', '2020-02-02 08:08:19');
INSERT INTO `banners` VALUES (3, '/static/index/banner3.jpg', 1, '../../activityPage/activityThree', 1, NULL, NULL);

-- ----------------------------
-- Table structure for desks
-- ----------------------------
DROP TABLE IF EXISTS `desks`;
CREATE TABLE `desks`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `explain` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '说明',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '1:空闲 2：使用中',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of desks
-- ----------------------------
INSERT INTO `desks` VALUES (1, '4人桌', 2, NULL, NULL);
INSERT INTO `desks` VALUES (2, '4人桌', 1, NULL, NULL);
INSERT INTO `desks` VALUES (3, '4人桌', 1, NULL, NULL);
INSERT INTO `desks` VALUES (4, '4人桌', 1, NULL, NULL);
INSERT INTO `desks` VALUES (5, '4人桌', 1, NULL, NULL);
INSERT INTO `desks` VALUES (6, '6人卓', 1, NULL, NULL);

-- ----------------------------
-- Table structure for foods
-- ----------------------------
DROP TABLE IF EXISTS `foods`;
CREATE TABLE `foods`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜名',
  `explain` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '简介',
  `price` decimal(8, 2) NOT NULL COMMENT '价格',
  `img` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图片',
  `type_id` bigint(20) NOT NULL COMMENT '分类ID',
  `sales_volume` int(11) NOT NULL COMMENT '销量',
  `status` int(11) NOT NULL COMMENT '状态(1：上架 0：下架)',
  `sort` int(11) NOT NULL COMMENT '排序（小的在前）',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '简介',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 160 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of foods
-- ----------------------------
INSERT INTO `foods` VALUES (1, '招牌牛蛙', '鲜香 牛蛙', 189.00, '/static/type/xianglaniuwa.png', 1, 59, 0, 1, '主料：活牛蛙两斤   配料：花椒，辣椒，麻椒  配菜：（土豆，豆芽大白菜）任选两份配菜\n主要原料：牛蛙', NULL, '2020-04-18 20:27:08');
INSERT INTO `foods` VALUES (2, '秘制酸汤牛蛙', '酸菜 微辣', 68.00, '/static/type/suantangniuwa.png', 1, 50, 1, 2, '鲜活蛙仔.秘制汤料.配贵州辣椒段.上等六月花椒烹制而成，川菜，海鲜。味道：麻辣 咸 鲜香\r\n主要原料：丝瓜,牛蛙', NULL, '2020-04-18 12:18:24');
INSERT INTO `foods` VALUES (3, '碳烤牛蛙', '碳烤 辣椒', 68.00, '/static/type/tankaoniuwa.png', 1, 23, 1, 3, '主料：活牛蛙2斤  配料：花椒辣椒麻椒  配菜：（土豆，豆芽大白菜）任选', NULL, '2020-04-18 11:36:23');
INSERT INTO `foods` VALUES (4, '椒盐牛蛙', '椒盐 辣椒 ', 78.00, '/static/type/jiaoyanniuwa.png', 1, 18, 1, 4, '主料：活牛蛙两斤   配料：花椒，辣椒，麻椒  配菜：（土豆，豆芽大白菜）任选两份配菜\r\n主要原料：牛蛙', NULL, '2020-02-25 21:23:31');
INSERT INTO `foods` VALUES (5, '水煮鱼', '草鱼二斤以上', 56.00, '/static/type/shuizhuyu.png', 2, 1, 1, 1, '这是一款人少 又想享受美味的馋猫特别推荐的菜品。约三斤多的活草鱼的一半制作而成的美味。温馨提示：图片用的系统图片是整条，实物为半条。谢谢\r\n主要原料：草鱼', NULL, '2020-02-24 22:02:55');
INSERT INTO `foods` VALUES (6, '酸菜鱼', '草鱼二斤以上', 66.00, '/static/type/suancaiyu.png', 2, 3, 1, 2, '这是一款人少 又想享受美味的馋猫特别推荐的菜品。约三斤多的活草鱼的一半制作而成的美味。温馨提示：图片用的系统图片是整条，实物为半条。谢谢\r\n主要原料：草鱼', NULL, NULL);
INSERT INTO `foods` VALUES (7, '酱香烤乌江鱼', '乌江鱼二斤以上', 98.00, '/static/type/jiangxiangkaoyu.png', 2, 0, 1, 3, '这是一款人少 又想享受美味的馋猫特别推荐的菜品。约三斤多的活草鱼的一半制作而成的美味。温馨提示：图片用的系统图片是整条，实物为半条。谢谢\r\n主要原料：草鱼', NULL, NULL);
INSERT INTO `foods` VALUES (8, '牛蛙烤鱼', '可加配菜', 108.00, '/static/type/niuwakaoyu.png', 2, 6, 1, 4, '这是一款人少 又想享受美味的馋猫特别推荐的菜品。约三斤多的活草鱼的一半制作而成的美味。温馨提示：图片用的系统图片是整条，实物为半条。谢谢\r\n主要原料：草鱼', NULL, NULL);
INSERT INTO `foods` VALUES (18, '可乐', '小罐', 3.00, '/static/type/kele.png', 9, 7, 1, 1, '焦糖微甜的味道，给你可口又清爽', NULL, NULL);
INSERT INTO `foods` VALUES (10, '雪碧', '小罐', 3.00, '/static/type/xuebi.png', 9, 10, 1, 2, '焦糖微甜的味道，给你可口又清爽', NULL, NULL);
INSERT INTO `foods` VALUES (11, '王老吉', '小罐', 4.00, '/static/type/wanglaoji.png', 9, 10, 1, 3, '焦糖微甜的味道，给你可口又清爽', NULL, NULL);
INSERT INTO `foods` VALUES (12, '冰红茶', '小瓶', 4.00, '/static/type/hongcha.png', 9, 17, 1, 4, '焦糖微甜的味道，给你可口又清爽', NULL, NULL);
INSERT INTO `foods` VALUES (13, '燕京', '小罐', 3.00, '/static/type/yanjing.png', 9, 13, 1, 5, '进口澳大利亚大麦芽和小麦芽，经珍贵德国上面酵母发酵酿制而成，酒体浊而浑厚，色泽淡而清新，泡沫细如奶油，香气独具一格，花香浓郁。酯香突出，入口净爽\r\n主要原料：小麦', NULL, NULL);
INSERT INTO `foods` VALUES (19, '米饭', '小碗', 2.00, '/static/type/mifan.png', 8, 20, 1, 1, '泰国原产进口长粒香米，单份炖品限购3个，不单卖，谢谢\r\n主要原料：大米', NULL, NULL);
INSERT INTO `foods` VALUES (14, '农夫山泉', '小瓶', 3.00, '/static/type/nongfu.png', 9, 3, 1, 7, '焦糖微甜的味道，给你可口又清爽', NULL, NULL);
INSERT INTO `foods` VALUES (15, '橙汁', '小杯', 6.00, '/static/type/cz.png', 9, 2, 1, 8, '焦糖微甜的味道，给你可口又清爽', NULL, NULL);
INSERT INTO `foods` VALUES (16, '大雪碧', '大瓶', 9.00, '/static/type/daxuebi.png', 9, 1, 1, 9, '1.25升\r\n主要原料：汽水', NULL, NULL);
INSERT INTO `foods` VALUES (17, '果粒橙', '大瓶', 9.00, '/static/type/guolicheng.png', 9, 2, 1, 10, '没有果粒橙的夏天是不完整的，清新爽口，新鲜橙子味', NULL, NULL);
INSERT INTO `foods` VALUES (20, '豆角焖面', '猪肉丝 豆角', 19.00, '/static/type/doujiaomenmian.png', 8, 2, 1, 2, '主要原料:猪肉丝 豆角', NULL, NULL);
INSERT INTO `foods` VALUES (21, '蛋黄蔬菜砂锅面', '蛋黄蔬菜砂锅面', 25.00, '/static/type/shaguomian.png', 8, 9, 1, 3, '主要原料:鸡蛋 油菜', NULL, NULL);
INSERT INTO `foods` VALUES (22, '西红市鸡蛋拌面', '拌面 ', 18.00, '/static/type/jidanmian.png', 8, 6, 1, 5, '主要原料:西红柿 鸡蛋', NULL, NULL);
INSERT INTO `foods` VALUES (9, '麻辣牛蛙烤草鱼', '可加配菜', 108.00, '/static/type/niuwacaoyu.png', 2, 0, 1, 5, '鲜活蛙仔.秘制汤料.配贵州辣椒段.上等六月花椒烹制而成，川菜，海鲜。味道：麻辣 咸 鲜香\r\n主要原料：丝瓜,牛蛙', NULL, NULL);
INSERT INTO `foods` VALUES (23, '鹌鹑蛋', '原味  8个', 5.00, '/static/type/anchundan.png', 4, 16, 1, 1, '烤鱼,牛蛙必点配菜', NULL, NULL);
INSERT INTO `foods` VALUES (24, '青笋', '约120克', 8.00, '/static/type/qingsun.png', 4, 22, 1, 2, '烤鱼,牛蛙必点配菜', NULL, NULL);
INSERT INTO `foods` VALUES (25, '海带', '约120克', 8.00, '/static/type/haidai.png', 4, 5, 1, 3, '烤鱼,牛蛙必点配菜', NULL, NULL);
INSERT INTO `foods` VALUES (26, '土豆片', '约120克', 6.00, '/static/type/tudou.png', 4, 1, 1, 4, '当土豆遇到麻辣香锅，感觉打开了新世界大门，好吃停不下来\r\n主要原料：土豆', NULL, NULL);
INSERT INTO `foods` VALUES (27, '娃娃菜', '约120克', 7.00, '/static/type/wawacai.png', 4, 2, 1, 5, '麻辣香锅娃娃菜，夏天的鲜香麻辣进行时，百吃不腻！麻辣鲜香，味道超好！\r\n主要原料：小麦', NULL, NULL);
INSERT INTO `foods` VALUES (28, '宽粉', '约120克', 8.00, '/static/type/fentiao.png', 4, 3, 1, 6, '烤鱼,牛蛙必点配菜', NULL, NULL);
INSERT INTO `foods` VALUES (29, '金针菇', '约120克', 12.00, '/static/type/jinzhengu.png', 4, 0, 1, 7, '脆爽麻辣的金针菇，吃了一口就停不下来（仅限麻辣香锅可点）\r\n主要原料：金针菇', NULL, NULL);
INSERT INTO `foods` VALUES (30, '藕片', '约120克', 8.00, '/static/type/oupian.png', 4, 0, 1, 8, '甜蜜蜜的，连藕丁这样的小清新都化身重口味，爽甜可口\r\n主要原料：藕', NULL, NULL);
INSERT INTO `foods` VALUES (97, '辣子鸡', '干辣椒 鸡腿肉', 38.00, '/static/type/laziji.png', 3, 6, 1, 1, '鲜嫩仔鸡搭配贵州辣椒段上等六月花椒和正宗四川小麻花炒至.入口酥脆.香气回味. 川菜，\r\n主要原料：鸡肉,麻花', NULL, NULL);
INSERT INTO `foods` VALUES (98, '栗子鸡', '咸鲜 仔鸡', 68.00, '/static/type/liziji.png', 3, 2, 1, 2, '【放心吃鸡】：适合1人用餐或首次体验！窑鸡选用当日宰杀的鲜活走地鸡，通过500℃高温现烤而成！为了您能品尝到正宗的窑鸡美味，请您购买后务必趁热、手撕、沾汁食用。\r\n品质保证1-窑鸡食材中未添加味精、色素、防腐剂（老人、小孩、病人、孕妇均可食用）。\r\n品质保证2-不新鲜、不好吃、可全额退款（若您觉得窑鸡不新鲜、不好吃，请您保留2/3以上的餐品，可联系我们申请全额退款！）。\r\n主要原料：鸡肉', NULL, NULL);
INSERT INTO `foods` VALUES (99, '红烧鸡翅中（一个）', '咸甜', 5.80, '/static/type/jichi.png', 3, 6, 1, 3, '【放心吃鸡】：适合1人用餐或首次体验！窑鸡选用当日宰杀的鲜活走地鸡，通过500℃高温现烤而成！为了您能品尝到正宗的窑鸡美味，请您购买后务必趁热、手撕、沾汁食用。\r\n品质保证1-窑鸡食材中未添加味精、色素、防腐剂（老人、小孩、病人、孕妇均可食用）。\r\n品质保证2-不新鲜、不好吃、可全额退款（若您觉得窑鸡不新鲜、不好吃，请您保留2/3以上的餐品，可联系我们申请全额退款！）。\r\n主要原料：鸡肉', NULL, NULL);
INSERT INTO `foods` VALUES (100, '新疆大盘鸡', '微辣', 48.00, '/static/type/dapanji.png', 3, 5, 1, 4, '【放心吃鸡】：适合1人用餐或首次体验！窑鸡选用当日宰杀的鲜活走地鸡，通过500℃高温现烤而成！为了您能品尝到正宗的窑鸡美味，请您购买后务必趁热、手撕、沾汁食用。\r\n品质保证1-窑鸡食材中未添加味精、色素、防腐剂（老人、小孩、病人、孕妇均可食用）。\r\n品质保证2-不新鲜、不好吃、可全额退款（若您觉得窑鸡不新鲜、不好吃，请您保留2/3以上的餐品，可联系我们申请全额退款！）。\r\n主要原料：鸡肉', NULL, NULL);
INSERT INTO `foods` VALUES (101, '沧州火锅鸡', '辣味 鸡', 88.00, '/static/type/huoguoji.png', 3, 5, 1, 5, '【放心吃鸡】：适合1人用餐或首次体验！窑鸡选用当日宰杀的鲜活走地鸡，通过500℃高温现烤而成！为了您能品尝到正宗的窑鸡美味，请您购买后务必趁热、手撕、沾汁食用。\r\n品质保证1-窑鸡食材中未添加味精、色素、防腐剂（老人、小孩、病人、孕妇均可食用）。\r\n品质保证2-不新鲜、不好吃、可全额退款（若您觉得窑鸡不新鲜、不好吃，请您保留2/3以上的餐品，可联系我们申请全额退款！）。\r\n主要原料：鸡肉', NULL, NULL);
INSERT INTO `foods` VALUES (102, '回锅肉', '五花肉 杭椒', 38.00, '/static/type/huiguorou.png', 5, 2, 1, 1, '由猪肉制作成的肉丝，配上葱姜蒜末,味道极鲜\r\n主要原料：猪肉', NULL, NULL);
INSERT INTO `foods` VALUES (103, '小炒肉', '五花肉 中辣', 38.00, '/static/type/xiaochaorou.png', 5, 2, 1, 2, '由猪肉制作成的肉丝，配上葱姜蒜末,味道极鲜\r\n主要原料：猪肉', NULL, NULL);
INSERT INTO `foods` VALUES (104, '香辣虾', '虾 花椒 麻椒', 78.00, '/static/type/xianglaxia.png', 5, 2, 1, 3, '1份5只；2份起购；大小8至9钱/只\r\n选用：湖北潜江小龙虾之乡的小龙虾，贵州辣椒段，尖椒调味.\r\n主要原料：小龙虾,辣椒,青椒', NULL, NULL);
INSERT INTO `foods` VALUES (105, '腐竹烧木耳', '不辣 木耳 腐竹', 28.00, '/static/type/fuzhumuer.png', 5, 5, 1, 4, '由猪肉制作成的肉丝，配上葱姜蒜末,味道极鲜\r\n主要原料：腐竹 木耳', NULL, NULL);
INSERT INTO `foods` VALUES (106, '川香排骨', '排骨', 78.00, '/static/type/paigu.png', 5, 3, 1, 5, '由猪肉制作成的肉丝，配上葱姜蒜末,味道极鲜\r\n主要原料：猪肉', NULL, NULL);
INSERT INTO `foods` VALUES (107, '蜜汁鸡翅', '不辣 鸡翅', 9.00, '/static/type/kaojichi.png', 6, 1, 1, 1, '油光发亮的鸡翅中，外皮娇嫩、内里鲜嫩的鸡翅，麻辣鲜香而不腻，这样一份麻辣香锅让人记忆深刻（仅限麻辣香锅可点）\r\n主要原料：小麦', NULL, NULL);
INSERT INTO `foods` VALUES (108, '羊肉串', '羊腿肉  10串', 35.00, '/static/type/yangrouchuan.png', 6, 2, 1, 2, '由猪肉制作成的肉丝，配上葱姜蒜末,味道极鲜\r\n主要原料：羊肉', NULL, NULL);
INSERT INTO `foods` VALUES (109, '羊肉筋', '中辣   10串', 35.00, '/static/type/yangroujin.png', 6, 2, 1, 3, '由猪肉制作成的肉丝，配上葱姜蒜末,味道极鲜\r\n主要原料：羊肉', NULL, NULL);
INSERT INTO `foods` VALUES (110, '台湾香肠', '香肠 1个', 3.00, '/static/type/xiangchang.png', 6, 2, 1, 4, '由猪肉制作成的肉丝，配上葱姜蒜末,味道极鲜\r\n主要原料：香肠', NULL, NULL);
INSERT INTO `foods` VALUES (111, '鸭汤小米粥', '咸甜 小米', 6.00, '/static/type/xiaomizhou.png', 7, 2, 1, 1, '八岁那年，一个先生说我以后会黄袍加身，餐餐大鱼大肉为伴！为了这目标，我一直喝着健康消食的小米粥等着实现～～\r\n主要原料：小麦', NULL, NULL);
INSERT INTO `foods` VALUES (112, '皮蛋瘦肉粥', '咸鲜 皮蛋 猪瘦肉', 7.00, '/static/type/shourouzhou.png', 7, 4, 1, 2, '开业狂欢，招牌底价 万粥之wang非浪得虚名\r\n主要原料：猪肉,皮蛋', NULL, NULL);
INSERT INTO `foods` VALUES (113, '八宝粥', '甜 桂圆 红枣 花生', 5.00, '/static/type/bbz.png', 7, 13, 1, 3, '8岁收压岁钱的你走家串巷，乐乐呵呵。在吃这件事上，可能没有谁比咱们中国人更认真的了。就像打春要吃春饼，端午要吃粽子，冬至吃饺子一样，腊八节当然要吃八宝粥。大冬天，全集一人一碗热腾腾内涵丰富的粥，就跟过年一样喜气洋洋。\r\n主要原料：黑米,薏米,红豆,葡萄干,莲子,红枣', NULL, NULL);
INSERT INTO `foods` VALUES (114, '鸭血粉丝汤', '咸鲜 鸭胗 鸭血 粉丝', 15.00, '/static/type/fst.png', 7, 6, 1, 4, '早餐吃了吗？坐在洒满阳光的餐桌旁来一碗吧!晶莹剔透的面皮包裹着鲜美的虾肉，满口留香…\r\n主要原料：紫菜,虾皮', NULL, NULL);
INSERT INTO `foods` VALUES (115, '泡菜汤', '辣白菜 五花肉 豆腐', 20.00, '/static/type/pct.png', 7, 3, 1, 5, '美食和风景，可以抵抗全世界所有的悲伤和迷惘。小江家的香菇瘦肉粥满屋醇香，让人止不住流口水\r\n主要原料：大米,香菇,猪肉', NULL, NULL);

-- ----------------------------
-- Table structure for messages
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` int(11) NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `created_at` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 95 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of messages
-- ----------------------------
INSERT INTO `messages` VALUES (1, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"17\"}', '2020-02-23 14:31:38');
INSERT INTO `messages` VALUES (2, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"17\"}', '2020-02-23 14:32:11');
INSERT INTO `messages` VALUES (3, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"17\"}', '2020-02-23 14:32:13');
INSERT INTO `messages` VALUES (4, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"17\"}', '2020-02-23 14:32:38');
INSERT INTO `messages` VALUES (5, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"17\"}', '2020-02-23 14:32:38');
INSERT INTO `messages` VALUES (6, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"17\"}', '2020-02-23 14:32:39');
INSERT INTO `messages` VALUES (7, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"17\"}', '2020-02-23 15:08:42');
INSERT INTO `messages` VALUES (8, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"17\"}', '2020-02-23 15:10:20');
INSERT INTO `messages` VALUES (9, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"18\"}', '2020-02-23 15:11:24');
INSERT INTO `messages` VALUES (10, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"18\"}', '2020-02-23 15:13:53');
INSERT INTO `messages` VALUES (11, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"18\"}', '2020-02-23 15:14:43');
INSERT INTO `messages` VALUES (12, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"18\"}', '2020-02-23 15:16:47');
INSERT INTO `messages` VALUES (13, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"18\"}', '2020-02-23 15:17:11');
INSERT INTO `messages` VALUES (14, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"18\"}', '2020-02-23 15:17:47');
INSERT INTO `messages` VALUES (15, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"18\"}', '2020-02-23 15:18:35');
INSERT INTO `messages` VALUES (16, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"18\"}', '2020-02-23 15:19:39');
INSERT INTO `messages` VALUES (17, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"18\"}', '2020-02-23 15:19:54');
INSERT INTO `messages` VALUES (18, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"18\"}', '2020-02-23 15:23:26');
INSERT INTO `messages` VALUES (19, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"18\"}', '2020-02-23 15:23:55');
INSERT INTO `messages` VALUES (20, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"18\"}', '2020-02-23 15:25:46');
INSERT INTO `messages` VALUES (21, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"18\"}', '2020-02-23 15:26:10');
INSERT INTO `messages` VALUES (22, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"18\"}', '2020-02-23 15:28:05');
INSERT INTO `messages` VALUES (23, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"18\"}', '2020-02-23 15:30:04');
INSERT INTO `messages` VALUES (24, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"18\"}', '2020-02-23 15:31:01');
INSERT INTO `messages` VALUES (25, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"18\"}', '2020-02-23 15:31:39');
INSERT INTO `messages` VALUES (26, 'order', 2, '{\"desk_id\":\"2\",\"order_id\":\"19\"}', '2020-02-23 15:36:30');
INSERT INTO `messages` VALUES (27, 'order', 2, '{\"desk_id\":\"2\",\"order_id\":\"19\"}', '2020-02-23 15:37:19');
INSERT INTO `messages` VALUES (28, 'order', 2, '{\"desk_id\":\"2\",\"order_id\":\"19\"}', '2020-02-23 15:41:54');
INSERT INTO `messages` VALUES (29, 'order', 2, '{\"desk_id\":\"2\",\"order_id\":\"19\"}', '2020-02-23 15:42:16');
INSERT INTO `messages` VALUES (30, 'order', 2, '{\"desk_id\":\"2\",\"order_id\":\"19\"}', '2020-02-23 15:42:49');
INSERT INTO `messages` VALUES (31, 'order', 2, '{\"desk_id\":\"2\",\"order_id\":\"19\"}', '2020-02-23 15:42:49');
INSERT INTO `messages` VALUES (32, 'order', 2, '{\"desk_id\":\"2\",\"order_id\":\"19\"}', '2020-02-23 15:43:42');
INSERT INTO `messages` VALUES (33, 'order', 2, '{\"desk_id\":\"2\",\"order_id\":\"19\"}', '2020-02-23 15:44:29');
INSERT INTO `messages` VALUES (34, 'order', 2, '{\"desk_id\":\"2\",\"order_id\":\"20\"}', '2020-02-23 15:50:11');
INSERT INTO `messages` VALUES (35, 'order', 2, '{\"desk_id\":\"2\",\"order_id\":\"21\"}', '2020-02-23 15:50:49');
INSERT INTO `messages` VALUES (36, 'order', 2, '{\"desk_id\":\"2\",\"order_id\":\"22\"}', '2020-02-23 15:51:14');
INSERT INTO `messages` VALUES (37, 'order', 2, '{\"desk_id\":\"2\",\"order_id\":\"23\"}', '2020-02-23 15:55:43');
INSERT INTO `messages` VALUES (38, 'order', 2, '{\"desk_id\":\"2\",\"order_id\":\"24\"}', '2020-02-23 15:57:05');
INSERT INTO `messages` VALUES (39, 'order', 2, '{\"desk_id\":\"2\",\"order_id\":\"25\"}', '2020-02-23 15:57:27');
INSERT INTO `messages` VALUES (40, 'order', 2, '{\"desk_id\":\"2\",\"order_id\":\"25\"}', '2020-02-23 15:57:49');
INSERT INTO `messages` VALUES (41, 'order', 2, '{\"desk_id\":\"2\",\"order_id\":\"25\"}', '2020-02-23 16:07:31');
INSERT INTO `messages` VALUES (42, 'order', 2, '{\"desk_id\":\"2\",\"order_id\":\"25\"}', '2020-02-23 16:08:01');
INSERT INTO `messages` VALUES (43, 'order', 2, '{\"desk_id\":\"4\",\"order_id\":\"26\"}', '2020-02-23 16:08:47');
INSERT INTO `messages` VALUES (44, 'order', 2, '{\"desk_id\":\"3\",\"order_id\":\"27\"}', '2020-02-23 19:21:09');
INSERT INTO `messages` VALUES (45, 'order', 2, '{\"desk_id\":\"3\",\"order_id\":\"28\"}', '2020-02-23 19:22:08');
INSERT INTO `messages` VALUES (46, 'order', 2, '{\"desk_id\":\"3\",\"order_id\":\"29\"}', '2020-02-23 19:22:25');
INSERT INTO `messages` VALUES (47, 'order', 2, '{\"desk_id\":\"3\",\"order_id\":\"29\"}', '2020-02-23 19:23:57');
INSERT INTO `messages` VALUES (48, 'order', 2, '{\"desk_id\":\"3\",\"order_id\":\"29\"}', '2020-02-23 19:25:19');
INSERT INTO `messages` VALUES (49, 'order', 2, '{\"desk_id\":\"3\",\"order_id\":\"29\"}', '2020-02-23 19:28:15');
INSERT INTO `messages` VALUES (50, 'order', 2, '{\"desk_id\":\"3\",\"order_id\":\"29\"}', '2020-02-23 19:32:22');
INSERT INTO `messages` VALUES (51, 'order', 2, '{\"desk_id\":\"3\",\"order_id\":\"29\"}', '2020-02-23 19:33:25');
INSERT INTO `messages` VALUES (52, 'order', 2, '{\"desk_id\":\"3\",\"order_id\":\"29\"}', '2020-02-23 19:38:02');
INSERT INTO `messages` VALUES (53, 'order', 2, '{\"desk_id\":\"3\",\"order_id\":\"29\"}', '2020-02-23 19:38:34');
INSERT INTO `messages` VALUES (54, 'order', 2, '{\"desk_id\":\"3\",\"order_id\":\"29\"}', '2020-02-23 19:39:08');
INSERT INTO `messages` VALUES (55, 'order', 2, '{\"desk_id\":\"3\",\"order_id\":\"29\"}', '2020-02-23 19:41:11');
INSERT INTO `messages` VALUES (56, 'order', 2, '{\"desk_id\":\"3\",\"order_id\":\"29\"}', '2020-02-23 19:43:09');
INSERT INTO `messages` VALUES (57, 'order', 2, '{\"desk_id\":\"3\",\"order_id\":\"29\"}', '2020-02-23 19:54:04');
INSERT INTO `messages` VALUES (58, 'order', 2, '{\"desk_id\":\"3\",\"order_id\":\"29\"}', '2020-02-23 19:55:26');
INSERT INTO `messages` VALUES (59, 'order', 2, '{\"desk_id\":\"3\",\"order_id\":\"29\"}', '2020-02-23 19:55:41');
INSERT INTO `messages` VALUES (60, 'order', 2, '{\"desk_id\":\"3\",\"order_id\":\"30\"}', '2020-02-23 20:05:00');
INSERT INTO `messages` VALUES (61, 'order', 2, '{\"desk_id\":\"3\",\"order_id\":\"31\"}', '2020-02-23 21:23:09');
INSERT INTO `messages` VALUES (62, 'order', 2, '{\"desk_id\":\"3\",\"order_id\":\"32\"}', '2020-02-23 21:32:11');
INSERT INTO `messages` VALUES (63, 'order', 2, '{\"desk_id\":\"3\",\"order_id\":\"33\"}', '2020-02-23 21:36:32');
INSERT INTO `messages` VALUES (64, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"34\"}', '2020-02-23 21:39:31');
INSERT INTO `messages` VALUES (65, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"34\"}', '2020-02-23 21:39:48');
INSERT INTO `messages` VALUES (66, 'order', 2, '{\"desk_id\":\"2\",\"order_id\":\"35\"}', '2020-02-23 21:40:18');
INSERT INTO `messages` VALUES (67, 'order', 2, '{\"desk_id\":\"2\",\"order_id\":\"35\"}', '2020-02-24 11:00:16');
INSERT INTO `messages` VALUES (68, 'order', 2, '{\"desk_id\":\"2\",\"order_id\":\"36\"}', '2020-02-24 13:07:04');
INSERT INTO `messages` VALUES (69, 'order', 2, '{\"desk_id\":\"2\",\"order_id\":\"36\"}', '2020-02-24 13:07:44');
INSERT INTO `messages` VALUES (70, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"37\"}', '2020-02-25 21:24:17');
INSERT INTO `messages` VALUES (71, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"38\"}', '2020-02-25 21:36:58');
INSERT INTO `messages` VALUES (72, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"39\"}', '2020-02-25 21:56:43');
INSERT INTO `messages` VALUES (73, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"40\"}', '2020-02-25 21:58:49');
INSERT INTO `messages` VALUES (74, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"41\"}', '2020-02-25 22:03:22');
INSERT INTO `messages` VALUES (75, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"42\"}', '2020-02-25 22:04:26');
INSERT INTO `messages` VALUES (76, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"43\"}', '2020-02-25 22:23:25');
INSERT INTO `messages` VALUES (77, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"44\"}', '2020-02-25 22:26:33');
INSERT INTO `messages` VALUES (78, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"45\"}', '2020-02-25 22:30:56');
INSERT INTO `messages` VALUES (79, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"46\"}', '2020-02-25 22:37:16');
INSERT INTO `messages` VALUES (80, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"47\"}', '2020-02-25 22:46:29');
INSERT INTO `messages` VALUES (81, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"48\"}', '2020-02-26 10:53:54');
INSERT INTO `messages` VALUES (82, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"49\"}', '2020-02-26 11:04:35');
INSERT INTO `messages` VALUES (83, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"50\"}', '2020-02-26 11:47:55');
INSERT INTO `messages` VALUES (84, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"50\"}', '2020-02-26 14:46:35');
INSERT INTO `messages` VALUES (85, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"50\"}', '2020-02-26 15:06:24');
INSERT INTO `messages` VALUES (86, 'order', 2, '{\"desk_id\":\"2\",\"order_id\":\"51\"}', '2020-03-23 15:20:29');
INSERT INTO `messages` VALUES (87, 'order', 2, '{\"desk_id\":\"2\",\"order_id\":\"51\"}', '2020-03-23 15:24:08');
INSERT INTO `messages` VALUES (88, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"52\"}', '2020-03-24 12:55:04');
INSERT INTO `messages` VALUES (89, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"52\"}', '2020-04-15 21:47:00');
INSERT INTO `messages` VALUES (90, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"52\"}', '2020-04-15 21:49:58');
INSERT INTO `messages` VALUES (91, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"52\"}', '2020-04-18 18:14:48');
INSERT INTO `messages` VALUES (92, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"52\"}', '2020-04-18 21:19:15');
INSERT INTO `messages` VALUES (93, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"52\"}', '2020-04-19 11:49:49');
INSERT INTO `messages` VALUES (94, 'order', 2, '{\"desk_id\":\"1\",\"order_id\":\"53\"}', '2020-04-19 11:52:02');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2020_02_02_042313_create_banners_table', 1);
INSERT INTO `migrations` VALUES (4, '2020_02_02_044245_create_desks_table', 2);
INSERT INTO `migrations` VALUES (5, '2020_02_02_044557_create_foods_table', 2);
INSERT INTO `migrations` VALUES (6, '2020_02_02_045828_create_orders_table', 2);
INSERT INTO `migrations` VALUES (7, '2020_02_02_051142_create_order_detials_table', 2);
INSERT INTO `migrations` VALUES (8, '2020_02_02_051819_create_recommends_table', 2);
INSERT INTO `migrations` VALUES (9, '2020_02_02_052123_create_types_table', 2);
INSERT INTO `migrations` VALUES (11, '2020_02_02_070400_add_status_to_banner', 3);

-- ----------------------------
-- Table structure for order_details
-- ----------------------------
DROP TABLE IF EXISTS `order_details`;
CREATE TABLE `order_details`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '订单Id',
  `food_id` bigint(20) NOT NULL COMMENT '菜品Id',
  `num` int(11) NOT NULL COMMENT '数量',
  `price` decimal(8, 2) NOT NULL COMMENT '价格',
  `order_detail_time` datetime(0) NOT NULL COMMENT '下单时间',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 329 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of order_details
-- ----------------------------
INSERT INTO `order_details` VALUES (259, 40, 3, 0, 136.00, '2020-02-25 21:58:49', NULL, NULL);
INSERT INTO `order_details` VALUES (260, 40, 4, 0, 234.00, '2020-02-25 21:58:49', NULL, NULL);
INSERT INTO `order_details` VALUES (261, 41, 2, 5, 340.00, '2020-02-25 22:03:22', NULL, NULL);
INSERT INTO `order_details` VALUES (262, 41, 3, 3, 204.00, '2020-02-25 22:03:22', NULL, NULL);
INSERT INTO `order_details` VALUES (263, 41, 4, 0, 156.00, '2020-02-25 22:03:22', NULL, NULL);
INSERT INTO `order_details` VALUES (264, 41, 21, 0, 100.00, '2020-02-25 22:03:22', NULL, NULL);
INSERT INTO `order_details` VALUES (265, 41, 19, 0, 6.00, '2020-02-25 22:03:22', NULL, NULL);
INSERT INTO `order_details` VALUES (266, 42, 19, 0, 26.00, '2020-02-25 22:04:26', NULL, NULL);
INSERT INTO `order_details` VALUES (267, 42, 113, 0, 40.00, '2020-02-25 22:04:26', NULL, NULL);
INSERT INTO `order_details` VALUES (268, 42, 18, 0, 15.00, '2020-02-25 22:04:26', NULL, NULL);
INSERT INTO `order_details` VALUES (269, 42, 12, 0, 28.00, '2020-02-25 22:04:26', NULL, NULL);
INSERT INTO `order_details` VALUES (270, 43, 13, 0, 9.00, '2020-02-25 22:23:25', NULL, NULL);
INSERT INTO `order_details` VALUES (271, 43, 10, 0, 3.00, '2020-02-25 22:23:25', NULL, NULL);
INSERT INTO `order_details` VALUES (272, 43, 11, 0, 4.00, '2020-02-25 22:23:25', NULL, NULL);
INSERT INTO `order_details` VALUES (273, 43, 12, 1, 4.00, '2020-02-25 22:23:25', NULL, NULL);
INSERT INTO `order_details` VALUES (274, 43, 15, 1, 6.00, '2020-02-25 22:23:25', NULL, NULL);
INSERT INTO `order_details` VALUES (275, 44, 11, 0, 4.00, '2020-02-25 22:26:33', NULL, NULL);
INSERT INTO `order_details` VALUES (276, 45, 1, 0, 78.00, '2020-02-25 22:30:56', NULL, NULL);
INSERT INTO `order_details` VALUES (277, 45, 2, 0, 136.00, '2020-02-25 22:30:56', NULL, NULL);
INSERT INTO `order_details` VALUES (278, 45, 113, 0, 10.00, '2020-02-25 22:30:56', NULL, NULL);
INSERT INTO `order_details` VALUES (279, 45, 112, 0, 14.00, '2020-02-25 22:30:56', NULL, NULL);
INSERT INTO `order_details` VALUES (280, 46, 112, 0, 14.00, '2020-02-25 22:37:16', NULL, NULL);
INSERT INTO `order_details` VALUES (281, 46, 113, 0, 10.00, '2020-02-25 22:37:16', NULL, NULL);
INSERT INTO `order_details` VALUES (282, 46, 114, 0, 30.00, '2020-02-25 22:37:16', NULL, NULL);
INSERT INTO `order_details` VALUES (283, 47, 109, 1, 35.00, '2020-02-25 22:46:29', NULL, NULL);
INSERT INTO `order_details` VALUES (284, 47, 108, 2, 70.00, '2020-02-25 22:46:29', NULL, NULL);
INSERT INTO `order_details` VALUES (285, 48, 3, 0, 204.00, '2020-02-26 10:53:54', NULL, NULL);
INSERT INTO `order_details` VALUES (286, 48, 4, 0, 234.00, '2020-02-26 10:53:54', NULL, NULL);
INSERT INTO `order_details` VALUES (287, 49, 11, 0, 12.00, '2020-02-26 11:04:35', NULL, NULL);
INSERT INTO `order_details` VALUES (288, 49, 10, 0, 12.00, '2020-02-26 11:04:35', NULL, NULL);
INSERT INTO `order_details` VALUES (289, 49, 13, 0, 9.00, '2020-02-26 11:04:35', NULL, NULL);
INSERT INTO `order_details` VALUES (290, 49, 12, 0, 16.00, '2020-02-26 11:04:35', NULL, NULL);
INSERT INTO `order_details` VALUES (291, 50, 3, 0, 68.00, '2020-02-26 11:47:55', NULL, NULL);
INSERT INTO `order_details` VALUES (292, 50, 19, 0, 0.00, '2020-02-26 11:47:55', NULL, NULL);
INSERT INTO `order_details` VALUES (293, 50, 20, 0, 19.00, '2020-02-26 11:47:55', NULL, NULL);
INSERT INTO `order_details` VALUES (294, 50, 21, 0, 0.00, '2020-02-26 11:47:55', NULL, NULL);
INSERT INTO `order_details` VALUES (295, 50, 22, 2, 36.00, '2020-02-26 11:47:55', NULL, NULL);
INSERT INTO `order_details` VALUES (296, 50, 23, 0, 0.00, '2020-02-26 14:46:35', NULL, NULL);
INSERT INTO `order_details` VALUES (297, 50, 24, 4, 32.00, '2020-02-26 14:46:35', NULL, NULL);
INSERT INTO `order_details` VALUES (298, 50, 1, 1, 78.00, '2020-02-26 15:06:24', NULL, NULL);
INSERT INTO `order_details` VALUES (299, 51, 4, 1, 78.00, '2020-03-23 15:20:29', NULL, NULL);
INSERT INTO `order_details` VALUES (300, 51, 3, 1, 68.00, '2020-03-23 15:20:29', NULL, NULL);
INSERT INTO `order_details` VALUES (301, 51, 2, 1, 68.00, '2020-03-23 15:20:29', NULL, NULL);
INSERT INTO `order_details` VALUES (302, 51, 1, 1, 78.00, '2020-03-23 15:20:29', NULL, NULL);
INSERT INTO `order_details` VALUES (303, 51, 103, 1, 38.00, '2020-03-23 15:20:29', NULL, NULL);
INSERT INTO `order_details` VALUES (304, 51, 104, 2, 156.00, '2020-03-23 15:20:29', NULL, NULL);
INSERT INTO `order_details` VALUES (305, 51, 105, 3, 84.00, '2020-03-23 15:20:29', NULL, NULL);
INSERT INTO `order_details` VALUES (306, 51, 106, 2, 156.00, '2020-03-23 15:20:29', NULL, NULL);
INSERT INTO `order_details` VALUES (307, 51, 10, 1, 3.00, '2020-03-23 15:20:29', NULL, NULL);
INSERT INTO `order_details` VALUES (308, 51, 11, 1, 4.00, '2020-03-23 15:20:29', NULL, NULL);
INSERT INTO `order_details` VALUES (309, 51, 12, 1, 4.00, '2020-03-23 15:20:29', NULL, NULL);
INSERT INTO `order_details` VALUES (310, 51, 13, 1, 3.00, '2020-03-23 15:20:29', NULL, NULL);
INSERT INTO `order_details` VALUES (311, 51, 16, 1, 9.00, '2020-03-23 15:20:29', NULL, NULL);
INSERT INTO `order_details` VALUES (312, 51, 17, 2, 18.00, '2020-03-23 15:20:29', NULL, NULL);
INSERT INTO `order_details` VALUES (313, 51, 14, 1, 3.00, '2020-03-23 15:20:29', NULL, NULL);
INSERT INTO `order_details` VALUES (314, 51, 1, 1, 78.00, '2020-03-23 15:24:08', NULL, NULL);
INSERT INTO `order_details` VALUES (315, 51, 3, 1, 68.00, '2020-03-23 15:24:08', NULL, NULL);
INSERT INTO `order_details` VALUES (316, 52, 105, 1, 28.00, '2020-03-24 12:55:04', NULL, NULL);
INSERT INTO `order_details` VALUES (317, 52, 106, 1, 78.00, '2020-03-24 12:55:04', NULL, NULL);
INSERT INTO `order_details` VALUES (318, 52, 22, 1, 18.00, '2020-03-24 12:55:04', NULL, NULL);
INSERT INTO `order_details` VALUES (319, 52, 1, 1, 78.00, '2020-04-15 21:47:00', NULL, NULL);
INSERT INTO `order_details` VALUES (320, 52, 2, 1, 68.00, '2020-04-15 21:47:00', NULL, NULL);
INSERT INTO `order_details` VALUES (321, 52, 1, 1, 78.00, '2020-04-15 21:49:58', NULL, NULL);
INSERT INTO `order_details` VALUES (322, 52, 2, 1, 68.00, '2020-04-15 21:49:58', NULL, NULL);
INSERT INTO `order_details` VALUES (323, 52, 116, 0, 0.00, '2020-04-18 18:14:48', NULL, NULL);
INSERT INTO `order_details` VALUES (324, 52, 159, 3, 369.00, '2020-04-18 21:19:15', NULL, NULL);
INSERT INTO `order_details` VALUES (325, 52, 159, 1, 123.00, '2020-04-19 11:49:49', NULL, NULL);
INSERT INTO `order_details` VALUES (326, 53, 159, 2, 246.00, '2020-04-19 11:52:02', NULL, NULL);
INSERT INTO `order_details` VALUES (327, 53, 2, 1, 68.00, '2020-04-19 11:52:02', NULL, NULL);
INSERT INTO `order_details` VALUES (328, 53, 3, 1, 68.00, '2020-04-19 11:52:02', NULL, NULL);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `start_time` datetime(0) NOT NULL COMMENT '下单时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `status` int(11) NOT NULL COMMENT '1：结账 2：未结账 3：异常',
  `price` decimal(8, 2) NOT NULL COMMENT '订单金额',
  `desk_id` int(11) NOT NULL COMMENT '卓号',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 54 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (40, '2020-02-25 21:58:49', NULL, 1, 0.00, 1, NULL, NULL);
INSERT INTO `orders` VALUES (41, '2020-02-25 22:03:22', NULL, 1, 544.00, 1, NULL, NULL);
INSERT INTO `orders` VALUES (42, '2020-02-25 22:04:26', NULL, 1, 0.00, 1, NULL, NULL);
INSERT INTO `orders` VALUES (43, '2020-02-25 22:23:25', NULL, 1, 10.00, 1, NULL, NULL);
INSERT INTO `orders` VALUES (44, '2020-02-25 22:26:33', NULL, 1, 0.00, 1, NULL, NULL);
INSERT INTO `orders` VALUES (45, '2020-02-25 22:30:56', NULL, 1, 0.00, 1, NULL, NULL);
INSERT INTO `orders` VALUES (46, '2020-02-25 22:37:16', NULL, 1, 0.00, 1, NULL, NULL);
INSERT INTO `orders` VALUES (47, '2020-02-25 22:46:29', NULL, 1, 105.00, 1, NULL, NULL);
INSERT INTO `orders` VALUES (48, '2020-02-26 10:53:54', NULL, 1, 0.00, 1, NULL, NULL);
INSERT INTO `orders` VALUES (49, '2020-02-26 11:04:35', NULL, 1, 0.00, 1, NULL, NULL);
INSERT INTO `orders` VALUES (50, '2020-02-26 11:47:55', NULL, 1, 146.00, 1, NULL, NULL);
INSERT INTO `orders` VALUES (51, '2020-03-23 15:20:29', NULL, 1, 916.00, 2, NULL, NULL);
INSERT INTO `orders` VALUES (52, '2020-03-24 12:55:04', NULL, 1, 908.00, 1, NULL, NULL);
INSERT INTO `orders` VALUES (53, '2020-04-19 11:52:02', NULL, 2, 382.00, 1, NULL, NULL);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for recommends
-- ----------------------------
DROP TABLE IF EXISTS `recommends`;
CREATE TABLE `recommends`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `place` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '推荐位',
  `sort` int(11) NOT NULL COMMENT '排序（小的在前）',
  `food_id` bigint(20) NOT NULL COMMENT '菜品Id',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recommends
-- ----------------------------
INSERT INTO `recommends` VALUES (1, '1', 1, 2, NULL, NULL);
INSERT INTO `recommends` VALUES (2, '1', 2, 4, NULL, NULL);
INSERT INTO `recommends` VALUES (3, '1', 3, 5, NULL, NULL);
INSERT INTO `recommends` VALUES (4, '2', 4, 6, NULL, NULL);
INSERT INTO `recommends` VALUES (5, '2', 5, 1, NULL, NULL);
INSERT INTO `recommends` VALUES (6, '2', 7, 3, NULL, NULL);
INSERT INTO `recommends` VALUES (7, '1', 8, 7, NULL, NULL);
INSERT INTO `recommends` VALUES (8, '2', 9, 8, NULL, NULL);

-- ----------------------------
-- Table structure for types
-- ----------------------------
DROP TABLE IF EXISTS `types`;
CREATE TABLE `types`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类名',
  `status` int(11) NOT NULL COMMENT '状态（1：上架 0：下架）',
  `sort` int(11) NOT NULL COMMENT '排序（小的在前）',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of types
-- ----------------------------
INSERT INTO `types` VALUES (1, '招牌牛蛙', 1, 1, NULL, NULL);
INSERT INTO `types` VALUES (2, '秘制烤鱼', 1, 2, NULL, NULL);
INSERT INTO `types` VALUES (3, '内有玄鸡', 1, 3, NULL, NULL);
INSERT INTO `types` VALUES (4, '必点配菜', 1, 4, NULL, NULL);
INSERT INTO `types` VALUES (5, '特色川菜', 1, 5, NULL, NULL);
INSERT INTO `types` VALUES (6, '诱惑烧烤', 1, 6, NULL, NULL);
INSERT INTO `types` VALUES (7, '暖心汤粥', 1, 7, NULL, NULL);
INSERT INTO `types` VALUES (8, '主        食', 1, 8, NULL, NULL);
INSERT INTO `types` VALUES (9, '酒水饮料', 1, 9, NULL, NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `token` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE,
  UNIQUE INDEX `api_token`(`token`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '李四', '123', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, '5e9bf814e2334');

SET FOREIGN_KEY_CHECKS = 1;
