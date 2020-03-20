/*
版本：5.7
 Date: 16/03/2020 23:22:44
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `product_create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '商品登记时间（新增）',
  `product_sale_model` int(8) NOT NULL COMMENT '销售模式（1：现货销售；2：预售模式）--必填项',
  `product_name_value` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品智能显示名称',
  `product_standards_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品规格显示',
  `product_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称--必填项',
  `product_sale_num` int(8) NULL DEFAULT NULL COMMENT '销量',
  `product_type_id` int(8) NOT NULL COMMENT '商品分类ID-外键--必选项',
  `product_img_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片-URL地址（多张图逗号分开）-外键',
  `product_img_index_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第一张图片URL（用于后台列表展现、前端列表、首页等地方）',
  `product_video_id` int(8) NULL DEFAULT NULL COMMENT '商品视频-URL地址（单个视频）-外键',
  `product_sku` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品唯一编码（如：白色巧克力、黑色巧克力）',
  `product_spu` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品编码-但不是唯一的（如：巧克力）',
  `product_sale_price` decimal(8, 2) NOT NULL COMMENT '出售价格（单位：元）--必填项',
  `product_sale_unit_id` int(11) NULL DEFAULT NULL COMMENT '商品单位（如：市场价：20元/公斤）',
  `product_cost_price` decimal(8, 2) NULL DEFAULT NULL COMMENT '成本价格（单位：元）',
  `product_market_price` decimal(8, 2) NULL DEFAULT NULL COMMENT '市场价格（用于对比）（单位：元）',
  `product_amount` int(8) NULL DEFAULT NULL COMMENT '库存总数量（后台可更新【增加-减少】）',
  `product_standards` decimal(8, 2) NULL DEFAULT NULL COMMENT '规格',
  `product_amount_unit_id` int(8) NULL DEFAULT NULL COMMENT '重量单位-外键',
  `product_copies` int(8) NULL DEFAULT NULL COMMENT '份数',
  `product_volume` decimal(8, 2) NULL DEFAULT NULL COMMENT '体积',
  `product_volume_unit_id` int(8) NULL DEFAULT NULL COMMENT '体积单位-外键',
  `product_sale_model2_num` int(8) NULL DEFAULT NULL COMMENT '预售商品数量',
  `product_tag_id` int(8) NULL DEFAULT NULL COMMENT '商品标签-外键',
  `product_state` int(8) NULL DEFAULT NULL COMMENT '商品状态（1：上架、0：下架0，2：售完）【可通过时间控制：发布即上架、发布不上架、设置一个时间上架】',
  `product_information` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品详细描述信息',
  `product_view_num` int(11) NULL DEFAULT NULL COMMENT '访问量',
  `product_view_from` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '访问来源【移动端、PC端(预留)】',
  `product_up_time` datetime(0) NULL DEFAULT NULL COMMENT '商品发布时间',
  `product_pn_value` tinyint(1) NULL DEFAULT NULL COMMENT '是否启用智能标题',
  `product_gg_value` tinyint(1) NULL DEFAULT NULL COMMENT '是否启用大约规格',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (21, '2019-10-13 01:24:59', 1, '自家种的梨子 约100g', '约100g', '自家种的梨子', 0, 1, '87', 'JHG.jpeg', 0, '', '', 3.00, 21, 0.80, 5.00, 0, 100.00, 0, 0, 0.00, 0, 0, 4, 0, '', 0, '', NULL, 1, 1);
INSERT INTO `product` VALUES (25, '2019-10-13 13:15:58', 1, '内蒙风干牛肉 约100g', '约100g', '内蒙风干牛肉', 0, 5, '99', '风干牛肉200gl.jpeg', 0, '', '', 5.86, 21, 5.00, 9.80, 0, 100.00, 0, 0, 0.00, 0, 0, 2, 0, '', 0, '', NULL, 1, 1);
INSERT INTO `product` VALUES (32, '2019-10-15 11:00:00', 2, '伊利 纯牛奶 250ml*24', '250ml*24', '伊利 纯牛奶', 0, 7, '100,98', '伊利48ml.jpeg', 0, '', '', 88.00, 23, 49.00, 100.80, 0, 250.00, 0, 24, 0.00, 0, 0, 1, 0, '', 0, '', NULL, 1, 0);
INSERT INTO `product` VALUES (35, '2019-10-13 23:28:49', 1, '洋河镇中国梦酒 52°【满199减100】', '500ml*6', '洋河镇中国梦酒 52°【满199减100】', 0, 4, '101,102', '酒水-中国梦1.jpg', 0, '', '', 258.00, 23, 180.00, 580.00, 500, 500.00, 0, 6, 0.00, 0, 0, 3, 0, '', 0, '', NULL, 0, 0);
INSERT INTO `product` VALUES (36, '2019-10-14 01:15:57', 2, '冰激凌 10个*2', '10个*2', '冰激凌', 0, 5, '89', 'HGFF.jpeg', 0, '', '', 15.00, 4, 12.00, 0.00, 0, 10.00, 0, 2, 0.00, 0, 0, 1, 0, '', 0, '', NULL, 1, 0);
INSERT INTO `product` VALUES (37, '2019-10-14 01:16:55', 1, '百草味甘栗仁栗子干果混合 800g', '800g', '百草味甘栗仁栗子干果混合', 0, 5, '104', '休闲零食-多种混合1.jpg', 0, '', '', 5.80, 21, 4.00, 8.00, 0, 800.00, 0, 2, 0.00, 0, 0, 2, 0, '', 0, '', NULL, 1, 0);
INSERT INTO `product` VALUES (38, '2019-10-14 11:00:00', 2, '五粮液 情醇品浓香型 500ml*6', '500ml*6', '五粮液 情醇品浓香型', 0, 4, '103', '酒水-五粮液.jpg', 0, '', '', 498.00, 23, 300.00, 1080.00, 0, 500.00, 0, 6, 0.00, 0, 0, 3, 0, '', 0, '', NULL, 1, 0);
INSERT INTO `product` VALUES (41, '2019-10-14 13:01:29', 1, '金龙鱼 食用油花生浓香型 5L', '5L', '金龙鱼 食用油花生浓香型', 0, 2, '105,106', '金龙鱼.jpg', 0, '', '', 47.00, 22, 43.00, 52.00, 2, 5.00, 0, 0, 0.00, 0, 0, 3, 0, '', 0, '', NULL, 1, 0);
INSERT INTO `product` VALUES (43, '2019-10-19 11:00:00', 1, '油烟机  去油污厨房清洁剂 免拆 500g*2', '500g*2', '油烟机  去油污厨房清洁剂 免拆', 0, 3, '107', '清洁-雅彩洁.jpg', 0, '', '', 39.90, 21, 35.00, 45.00, 0, 500.00, 0, 2, 0.00, 0, 0, 2, 0, '', 0, '', NULL, 1, 0);
INSERT INTO `product` VALUES (44, '2019-10-19 11:00:00', 1, '原泽味 泰国进口龙眼水果 新鲜桂圆 1.5kg', '1.5kg', '原泽味 泰国进口龙眼水果 新鲜桂圆', 0, 1, '110,111,112', '桂圆1.jpg', 0, '', '', 49.90, 20, 30.00, 80.00, 0, 1.50, 0, 12, 0.00, 0, 0, 3, 0, '', 0, '', NULL, 1, 0);
INSERT INTO `product` VALUES (45, '2019-10-19 11:00:00', 2, '农夫山泉 饮用天然水5L*4桶 整箱装', '5L*4', '农夫山泉 饮用天然水5L*4桶 整箱装', 0, 4, '113', '农夫山泉.jpg', 0, '', '', 36.90, 22, 30.50, 45.58, 0, 5.00, 0, 4, 0.00, 0, 0, 2, 0, '', 0, '', NULL, 0, 0);
INSERT INTO `product` VALUES (46, '2019-10-19 11:00:00', 2, '苏泊尔（SUPOR）小容量高压锅迷你压力锅家 咖啡色 2.5L*12', '2.5L*12', '苏泊尔（SUPOR）小容量高压锅迷你压力锅家 咖啡色', 0, 8, '108,101', '苏泊尔2.jpg', 0, '', '', 278.00, 22, 230.00, 399.00, 0, 2.50, 0, 12, 0.00, 0, 0, 1, 0, '', 0, '', NULL, 1, 0);
INSERT INTO `product` VALUES (47, '2019-10-23 11:00:00', 2, '樱桃 约500g*5', '约500g*5', '樱桃', 0, 1, '94,77', 'tj3.jpg', 0, '', '', 88.00, 21, 60.00, 128.00, 0, 500.00, 0, 5, 0.00, 0, 0, 1, 0, '', 0, '', NULL, 1, 1);
INSERT INTO `product` VALUES (48, '2019-10-27 11:00:00', 1, '麻花 100g*15', '100g*15', '麻花', 0, 5, '116,101', '麻花0000.jpg', 0, '', '', 28.00, 21, 20.00, 35.00, 0, 100.00, 0, 15, 0.00, 0, 0, 1, 0, '', 0, '', NULL, 1, 0);
INSERT INTO `product` VALUES (49, '2020-03-15 16:00:00', 1, '58888 8件*8', '8件*8', '58888', NULL, 3, NULL, NULL, NULL, NULL, NULL, 8.00, 2, 8.00, 18.00, NULL, 8.00, NULL, 8, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, 1, 0);
INSERT INTO `product` VALUES (50, '2020-03-15 16:00:00', 1, '58888 8件*8', '8件*8', '58888', NULL, 3, NULL, NULL, NULL, NULL, NULL, 8.00, 2, 8.00, 18.00, NULL, 8.00, NULL, 8, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, 1, 0);
INSERT INTO `product` VALUES (51, '2019-10-13 01:24:59', 1, '自家种的梨子 约100g', '约100g', '自家种的梨子', 0, 1, '87', 'JHG.jpeg', 0, '', '', 3.00, 21, 0.80, 5.00, 0, 100.00, 0, 0, 0.00, 0, 0, 4, 0, '', 0, '', NULL, 1, 1);
INSERT INTO `product` VALUES (52, '2020-03-17 16:00:00', 1, '二锅头 1袋*5', '1袋*5', '二锅头', NULL, 4, NULL, NULL, NULL, NULL, NULL, 88.00, 3, 35.00, 180.00, NULL, 1.00, NULL, 5, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, 1, 0);
INSERT INTO `product` VALUES (53, '2020-03-15 16:00:00', 1, '888789 8盒*8', '8盒*8', '888789', NULL, 4, NULL, NULL, NULL, NULL, NULL, 91.00, 1, 97.00, 199.00, NULL, 8.00, NULL, 8, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, 1, 0);
INSERT INTO `product` VALUES (54, '2020-03-01 16:00:00', 2, '9999999 3袋*8', '3袋*8', '9999999', NULL, 4, NULL, NULL, NULL, NULL, NULL, 7.00, 3, 7.00, 7.00, NULL, 3.00, NULL, 8, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, 1, 0);
INSERT INTO `product` VALUES (55, '2020-03-01 16:00:00', 2, '9999999 3袋*8', '3袋*8', '9999999', NULL, 4, NULL, NULL, NULL, NULL, NULL, 7.00, 3, 7.00, 7.00, NULL, 3.00, NULL, 8, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, 1, 0);

-- ----------------------------
-- Table structure for product_attributes
-- ----------------------------
DROP TABLE IF EXISTS `product_attributes`;
CREATE TABLE `product_attributes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品属性ID',
  `product_attributes_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品属性名称',
  `product_attributes_sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product_review
-- ----------------------------
DROP TABLE IF EXISTS `product_review`;
CREATE TABLE `product_review`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一ID',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `review_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `review_stars` int(11) NULL DEFAULT NULL COMMENT '等级【1~5等级】',
  `review_img_id` int(11) NULL DEFAULT NULL COMMENT '用户晒图ID',
  `review_vidoe_id` int(11) NULL DEFAULT NULL COMMENT '用户晒短视频ID',
  `review_from` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源（1移动端、PC端【预留】）',
  `review_perent_id` int(11) NULL DEFAULT NULL COMMENT '父节点ID【追评使用】',
  `review_likes` int(11) NULL DEFAULT NULL COMMENT '点赞数量',
  `review_reply` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '客服回复（后台回复）',
  `review_reply_time` datetime(0) NULL DEFAULT NULL COMMENT '客服回复时间',
  `review_state` int(11) NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product_table
-- ----------------------------
DROP TABLE IF EXISTS `product_table`;
CREATE TABLE `product_table`  (
  `product_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `product_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `num` int(11) NULL DEFAULT NULL,
  `price` decimal(8, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_table
-- ----------------------------
INSERT INTO `product_table` VALUES ('4001d341639e40b0aa40bc685d57c37c', '榴莲', 45, 15.00);
INSERT INTO `product_table` VALUES ('7b635cc84bce7d35179a21259e0ae52e', '葡萄', 50, 6.80);
INSERT INTO `product_table` VALUES ('a970e6817a3fb3f575a2caeef0658eb1', '梨子', 5800, 6.00);
INSERT INTO `product_table` VALUES ('c5df33344a096427297262f6bfcf9dc3', '柚子', 6, 6.00);
INSERT INTO `product_table` VALUES ('e399083c104bb7aeb0e2371a85275ee3', '苹果', 5, 6.80);
INSERT INTO `product_table` VALUES ('e68bc88cfa5ae593d7f4bbee38a74735', '香蕉', 6, 3.00);

-- ----------------------------
-- Table structure for product_tag
-- ----------------------------
DROP TABLE IF EXISTS `product_tag`;
CREATE TABLE `product_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一ID',
  `product_tag_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品标签名称【如：爆款、最爱、超喜欢、女神节热销品、熬夜最佳搭档零食】',
  `product_tag_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_tag_sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_tag
-- ----------------------------
INSERT INTO `product_tag` VALUES (1, '新品', 'primary', 1);
INSERT INTO `product_tag` VALUES (2, '畅销', 'danger', 2);
INSERT INTO `product_tag` VALUES (3, '特价', 'success', 3);
INSERT INTO `product_tag` VALUES (4, '1元购', 'warning', 4);

-- ----------------------------
-- Table structure for product_type
-- ----------------------------
DROP TABLE IF EXISTS `product_type`;
CREATE TABLE `product_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一ID',
  `product_type_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品分类名称',
  `product_type_perent_id` int(11) NOT NULL COMMENT '父节点ID（如果是顶级则是0）',
  `product_type_sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `product_type_state` int(11) NULL DEFAULT NULL COMMENT '状态（1：可用；0：不可用；）',
  `product_type_img_id` int(11) NULL DEFAULT NULL COMMENT '分类图片【可以带图片】',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_type
-- ----------------------------
INSERT INTO `product_type` VALUES (1, '新鲜水果', 0, 1, 1, NULL);
INSERT INTO `product_type` VALUES (2, '粮油散货', 0, 1, 1, NULL);
INSERT INTO `product_type` VALUES (3, '清洁洗护', 0, 2, 1, NULL);
INSERT INTO `product_type` VALUES (4, '酒水饮料', 0, 3, 1, NULL);
INSERT INTO `product_type` VALUES (5, '休闲零食', 0, 2, 1, NULL);
INSERT INTO `product_type` VALUES (6, '进口零食', 0, 1, 1, NULL);
INSERT INTO `product_type` VALUES (7, '牛奶乳品', 0, 2, 1, NULL);
INSERT INTO `product_type` VALUES (8, '家居日用', 0, 1, 1, NULL);
INSERT INTO `product_type` VALUES (9, '精品推荐', 0, 1, 1, NULL);
INSERT INTO `product_type` VALUES (29, 'uuuuu ', 0, 5, 1, 0);

-- ----------------------------
-- Table structure for product_unit
-- ----------------------------
DROP TABLE IF EXISTS `product_unit`;
CREATE TABLE `product_unit`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一ID',
  `unit_name_zh` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中文单位名称（如：千克）',
  `unit_name_en` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文单位名称（如：kg）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_unit
-- ----------------------------
INSERT INTO `product_unit` VALUES (1, '盒', 'dw');
INSERT INTO `product_unit` VALUES (2, '件', 'dw');
INSERT INTO `product_unit` VALUES (3, '袋', 'dw');
INSERT INTO `product_unit` VALUES (4, '个', 'dw');
INSERT INTO `product_unit` VALUES (20, 'kg', 'gg');
INSERT INTO `product_unit` VALUES (21, 'g', 'gg');
INSERT INTO `product_unit` VALUES (22, 'L', 'gg');
INSERT INTO `product_unit` VALUES (23, 'ml', 'gg');

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource`  (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '唯一ID',
  `type_id` int(8) NULL DEFAULT NULL COMMENT '资源类型ID-外键',
  `resource_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源名称（URL地址）',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '上传时间',
  `resource_size` decimal(8, 2) NULL DEFAULT NULL COMMENT '资源大小（单位MB：9.35MB)',
  `resource_state` int(8) NULL DEFAULT NULL COMMENT '资源状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 123 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES (77, NULL, '4.jpeg', '2019-10-19 20:33:51', 36023.00, 1);
INSERT INTO `resource` VALUES (78, NULL, '3.jpeg', '2019-10-19 20:33:51', 64542.00, 1);
INSERT INTO `resource` VALUES (79, NULL, 'timgxx1.jpeg', '2019-10-19 20:33:51', 91378.00, 1);
INSERT INTO `resource` VALUES (83, NULL, '656.jpg', '2019-10-20 11:32:32', 11257.00, 1);
INSERT INTO `resource` VALUES (86, NULL, 'HGFEW.jpeg', '2019-10-24 16:11:39', 46507.00, 1);
INSERT INTO `resource` VALUES (87, NULL, 'JHG.jpeg', '2019-10-24 16:11:39', 36831.00, 1);
INSERT INTO `resource` VALUES (88, NULL, '8.jpeg', '2019-10-24 16:11:39', 86465.00, 1);
INSERT INTO `resource` VALUES (89, NULL, 'HGFF.jpeg', '2019-10-24 16:11:39', 59796.00, 1);
INSERT INTO `resource` VALUES (90, NULL, 'TEWD.jpeg', '2019-10-24 16:11:39', 61884.00, 1);
INSERT INTO `resource` VALUES (91, NULL, '10.jpeg', '2019-10-24 16:11:39', 58456.00, 1);
INSERT INTO `resource` VALUES (92, NULL, 'hh.jpeg', '2019-10-24 16:11:40', 105630.00, 1);
INSERT INTO `resource` VALUES (93, NULL, 'JJ.jpeg', '2019-10-24 16:11:40', 39670.00, 1);
INSERT INTO `resource` VALUES (94, NULL, 'tj3.jpg', '2019-10-24 16:11:40', 85107.00, 1);
INSERT INTO `resource` VALUES (95, NULL, 'tj2.jpg', '2019-10-24 16:11:40', 145113.00, 1);
INSERT INTO `resource` VALUES (96, NULL, 'yy.jpeg', '2019-10-24 17:39:12', 55454.00, 1);
INSERT INTO `resource` VALUES (97, NULL, 'U.jpeg', '2019-10-24 17:55:51', 30115.00, 1);
INSERT INTO `resource` VALUES (98, NULL, '2.jpeg', '2019-10-24 17:55:58', 98629.00, 1);
INSERT INTO `resource` VALUES (99, NULL, '风干牛肉200gl.jpeg', '2019-10-24 21:57:41', 135051.00, 1);
INSERT INTO `resource` VALUES (100, NULL, '伊利48ml.jpeg', '2019-10-24 22:02:43', 224150.00, 1);
INSERT INTO `resource` VALUES (101, NULL, '酒水-中国梦1.jpg', '2019-10-24 22:09:47', 187711.00, 1);
INSERT INTO `resource` VALUES (102, NULL, '酒水-中国梦2.jpg', '2019-10-24 22:09:47', 392238.00, 1);
INSERT INTO `resource` VALUES (103, NULL, '酒水-五粮液.jpg', '2019-10-24 22:13:30', 110358.00, 1);
INSERT INTO `resource` VALUES (104, NULL, '休闲零食-多种混合1.jpg', '2019-10-24 22:16:31', 86443.00, 1);
INSERT INTO `resource` VALUES (105, NULL, '金龙鱼.jpg', '2019-10-24 22:23:41', 47908.00, 1);
INSERT INTO `resource` VALUES (106, NULL, '金龙鱼1.png', '2019-10-24 22:23:46', 47908.00, 1);
INSERT INTO `resource` VALUES (107, NULL, '清洁-雅彩洁.jpg', '2019-10-24 22:28:41', 94008.00, 1);
INSERT INTO `resource` VALUES (108, NULL, '苏泊尔2.jpg', '2019-10-24 22:33:43', 68609.00, 1);
INSERT INTO `resource` VALUES (109, NULL, '苏泊尔1.jpg', '2019-10-24 22:33:44', 86770.00, 1);
INSERT INTO `resource` VALUES (110, NULL, '桂圆1.jpg', '2019-10-24 22:39:40', 63724.00, 1);
INSERT INTO `resource` VALUES (111, NULL, '桂圆2.jpg', '2019-10-24 22:39:40', 65624.00, 1);
INSERT INTO `resource` VALUES (112, NULL, '桂圆3.jpg', '2019-10-24 22:39:40', 89306.00, 1);
INSERT INTO `resource` VALUES (113, NULL, '农夫山泉.jpg', '2019-10-24 22:42:50', 64900.00, 1);
INSERT INTO `resource` VALUES (114, NULL, '梨子.jpg', '2019-10-24 23:28:50', 100556.00, 1);
INSERT INTO `resource` VALUES (115, NULL, '农夫山泉3333.jpg', '2019-10-26 15:50:29', 64900.00, 1);
INSERT INTO `resource` VALUES (116, NULL, '麻花0000.jpg', '2019-10-28 16:26:03', 39754.00, 1);
INSERT INTO `resource` VALUES (117, NULL, 'UD.jpeg', '2019-11-12 16:10:56', 94049.00, 1);
INSERT INTO `resource` VALUES (118, NULL, 'zf.png', '2019-11-12 16:27:26', 1213.00, 1);
INSERT INTO `resource` VALUES (119, NULL, '0.png', '2020-03-16 17:43:24', 440026.00, 1);
INSERT INTO `resource` VALUES (121, NULL, '0.png', '2020-03-16 17:47:24', 440026.00, 1);
INSERT INTO `resource` VALUES (122, NULL, '0.png', '2020-03-16 17:48:11', 440026.00, 1);

-- ----------------------------
-- Table structure for resource_type
-- ----------------------------
DROP TABLE IF EXISTS `resource_type`;
CREATE TABLE `resource_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_type_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源类型名称',
  `resource_type_sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `resource_group` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源分类【1：图片，2：视频；3：压缩文件；4：其他】',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resource_type
-- ----------------------------
INSERT INTO `resource_type` VALUES (1, '', 1, '未分类');
INSERT INTO `resource_type` VALUES (2, 'img', 1, '商品图库');
INSERT INTO `resource_type` VALUES (3, 'img', 2, '品牌LOGO');
INSERT INTO `resource_type` VALUES (4, 'img', 3, '系统图标');

-- ----------------------------
-- Table structure for sys_backend_api_table
-- ----------------------------
DROP TABLE IF EXISTS `sys_backend_api_table`;
CREATE TABLE `sys_backend_api_table`  (
  `backend_api_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `backend_api_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'API名称',
  `backend_api_url` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'API请求地址',
  `backend_api_method` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'API请求方式：GET、POST、PUT、DELETE',
  `pid` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父ID',
  `backend_api_sort` int(11) NOT NULL COMMENT '排序',
  `description` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`backend_api_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_backend_api_table
-- ----------------------------
INSERT INTO `sys_backend_api_table` VALUES ('1', '所有API', '/**', 'GET,POST,PUT,DELETE', NULL, 100, NULL);
INSERT INTO `sys_backend_api_table` VALUES ('234dbd90c37363e2a6dea629adc7389e', '编辑商品', '/productTag', 'GET', '4725d5b946c8789ebd2f758a93d416d8', 204, '');
INSERT INTO `sys_backend_api_table` VALUES ('3c4593addf852016a49bab68b7539441', '商品查询', '/product/list', 'GET', '4725d5b946c8789ebd2f758a93d416d8', 201, NULL);
INSERT INTO `sys_backend_api_table` VALUES ('4725d5b946c8789ebd2f758a93d416d8', '商品管理', 'none', '', NULL, 200, '商品管理下所有API');
INSERT INTO `sys_backend_api_table` VALUES ('49bcd49553fd6274c5ea8b6fcc84097e', '订单模块', 'none', NULL, NULL, 300, '订单模块下的所有API');
INSERT INTO `sys_backend_api_table` VALUES ('4d4b203cfcb195ba2b4710f05c6f42e1', '所有', '/**', 'GET', '', 0, 'admin特有');
INSERT INTO `sys_backend_api_table` VALUES ('623c3f7156fb4a345f3c030f87d09aa9', '菜单管理', '/sysFrontendMenuTable', 'GET,POST,PUT,DELETE', 'ccb6659817cf193adc6bfb4dc17709ec', 902, '前端菜单管理');
INSERT INTO `sys_backend_api_table` VALUES ('73b81575b6737e4d38e6716bc773c5bb', '订单查询', '/order', 'GET', '49bcd49553fd6274c5ea8b6fcc84097e', 301, '订单查询');
INSERT INTO `sys_backend_api_table` VALUES ('750be7ac660b8572993d540117b93758', '商品单位', '/productUnit', 'GET', '4725d5b946c8789ebd2f758a93d416d8', 205, NULL);
INSERT INTO `sys_backend_api_table` VALUES ('760ba9bf47fcda793203b1f3cd731083', '删除商品', '/productTable', 'DELETE', '4725d5b946c8789ebd2f758a93d416d8', 208, '');
INSERT INTO `sys_backend_api_table` VALUES ('8ba918894b2ed504e2a3db56b33327b4', '订单处理', '/order/?', 'GET', '49bcd49553fd6274c5ea8b6fcc84097e', 302, '单条查询');
INSERT INTO `sys_backend_api_table` VALUES ('9e70d298027fc5a101f40b1cd38d3d41', '前端菜单显示', '/frontendMenu', 'GET', 'ccb6659817cf193adc6bfb4dc17709ec', 901, '前端左侧菜单显示');
INSERT INTO `sys_backend_api_table` VALUES ('adc60ab150c543223d9d454b1e9d43a6', '商品销售模式', '/productSaleModelEnum', 'GET', '4725d5b946c8789ebd2f758a93d416d8', 202, '');
INSERT INTO `sys_backend_api_table` VALUES ('ccb6659817cf193adc6bfb4dc17709ec', '系统管理', 'none', NULL, NULL, 900, NULL);
INSERT INTO `sys_backend_api_table` VALUES ('fa0c9a0b71a1d654f4ad2db4aac8e903', '商品类型', '/productType', 'GET', '4725d5b946c8789ebd2f758a93d416d8', 203, '');

-- ----------------------------
-- Table structure for sys_frontend_menu_table
-- ----------------------------
DROP TABLE IF EXISTS `sys_frontend_menu_table`;
CREATE TABLE `sys_frontend_menu_table`  (
  `frontend_menu_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `frontend_menu_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '前端菜单名称',
  `frontend_menu_url` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前端菜单访问HTML地址',
  `pid` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父ID',
  `frontend_menu_sort` int(11) NOT NULL COMMENT '排序',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`frontend_menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_frontend_menu_table
-- ----------------------------
INSERT INTO `sys_frontend_menu_table` VALUES ('0af385f5e237445d369a49cb35b20da4', '系统管理', NULL, NULL, 900, NULL);
INSERT INTO `sys_frontend_menu_table` VALUES ('105eb6c65a907eb589dbd3a9eeea013a', '商品管理', NULL, NULL, 100, '商品管理');
INSERT INTO `sys_frontend_menu_table` VALUES ('2e5739a73173a22ed55eca37bb67aae6', '购物分析', NULL, 'b65d3ad4906ffc8be6932f9a1f51df1d', 601, NULL);
INSERT INTO `sys_frontend_menu_table` VALUES ('3a8846521659085ed6ce0b0187d6d72a', '商品属性', 'productattr.html', '105eb6c65a907eb589dbd3a9eeea013a', 103, NULL);
INSERT INTO `sys_frontend_menu_table` VALUES ('40ca076892e16ef6f788eb4d753df964', '用户管理', 'user.html', '0af385f5e237445d369a49cb35b20da4', 901, NULL);
INSERT INTO `sys_frontend_menu_table` VALUES ('434e4bd50799bd145f4590d0f4705162', '订单管理', '', NULL, 200, NULL);
INSERT INTO `sys_frontend_menu_table` VALUES ('6423ae277e4ec862ff23bd7b2c0922ce', '商品图片上传', 'upphoto.html', 'b3c72fd354b3df32ceb1dd7db0c61086', 402, NULL);
INSERT INTO `sys_frontend_menu_table` VALUES ('737addccb1ac6307d29802ad988b13d8', '订单查询', 'order.html', '434e4bd50799bd145f4590d0f4705162', 201, '前端的订单查询页面');
INSERT INTO `sys_frontend_menu_table` VALUES ('76cb7b2df76c79d159c561ecfbd54ef2', 'swagger api管理', NULL, '0af385f5e237445d369a49cb35b20da4', 909, NULL);
INSERT INTO `sys_frontend_menu_table` VALUES ('7f448ccf628eb577e20f6413c5810300', '客户分析', NULL, 'b65d3ad4906ffc8be6932f9a1f51df1d', 602, NULL);
INSERT INTO `sys_frontend_menu_table` VALUES ('80c23202f9d72076359518ef33854a4f', '角色-菜单分配', 'rolemenu.html', '0af385f5e237445d369a49cb35b20da4', 906, '角色-菜单分配');
INSERT INTO `sys_frontend_menu_table` VALUES ('94025c8731dc0dc403b66f9e8899cbc7', '商品查询', './product/list.html', '105eb6c65a907eb589dbd3a9eeea013a', 101, '前端的商品查询页面');
INSERT INTO `sys_frontend_menu_table` VALUES ('a3baa2f584b4032be78d38bd49b891c8', '未处理订单', 'notordertask.html', '434e4bd50799bd145f4590d0f4705162', 203, '未处理订单');
INSERT INTO `sys_frontend_menu_table` VALUES ('ab9fdc8116dab6c8d110aa4387c97e08', '角色-API分配', 'roleapi.html', '0af385f5e237445d369a49cb35b20da4', 907, '角色-API分配');
INSERT INTO `sys_frontend_menu_table` VALUES ('b2dcfb940a72deb68b338b934128a1e4', '商品图片查询', 'photo.html', 'b3c72fd354b3df32ceb1dd7db0c61086', 401, NULL);
INSERT INTO `sys_frontend_menu_table` VALUES ('b3c72fd354b3df32ceb1dd7db0c61086', '资源管理', NULL, NULL, 400, NULL);
INSERT INTO `sys_frontend_menu_table` VALUES ('b65d3ad4906ffc8be6932f9a1f51df1d', '运营管理', NULL, NULL, 600, NULL);
INSERT INTO `sys_frontend_menu_table` VALUES ('b973d15c229778a6d98e742d096b2e41', '角色管理', 'role1.html', '0af385f5e237445d369a49cb35b20da4', 902, '角色管理页面');
INSERT INTO `sys_frontend_menu_table` VALUES ('c7eb10d6513f40ac25f75e34a2679eab', '商品类目', 'category.html', '105eb6c65a907eb589dbd3a9eeea013a', 102, '前端商品类目');
INSERT INTO `sys_frontend_menu_table` VALUES ('c9fe45ef063af26c3e4c3208ffe1ff9f', '供应商供货', NULL, 'b65d3ad4906ffc8be6932f9a1f51df1d', 603, NULL);
INSERT INTO `sys_frontend_menu_table` VALUES ('d2948d3e4a0914825f70aa39ce1c9d23', '组织机构', NULL, '0af385f5e237445d369a49cb35b20da4', 908, NULL);
INSERT INTO `sys_frontend_menu_table` VALUES ('e1fc2013f32ece3c772becb9489296e4', '后端API管理', 'api.html', '0af385f5e237445d369a49cb35b20da4', 904, '后端API管理页面');
INSERT INTO `sys_frontend_menu_table` VALUES ('e529e97e6ab0f95fc85cfbda5247eeaa', '前端菜单管理', 'menu.html', '0af385f5e237445d369a49cb35b20da4', 903, NULL);
INSERT INTO `sys_frontend_menu_table` VALUES ('eb70ecd66ed156ca2f49e4d0e32b36f6', '角色-用户分配', 'roleuser.html', '0af385f5e237445d369a49cb35b20da4', 905, '角色用户分配');

-- ----------------------------
-- Table structure for sys_role_backend_api_table
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_backend_api_table`;
CREATE TABLE `sys_role_backend_api_table`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色ID',
  `backend_api_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'API管理表ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_backend_api_table
-- ----------------------------
INSERT INTO `sys_role_backend_api_table` VALUES (10, 'd04c2ebb1e32995f384ad49f6d4b421d', '234dbd90c37363e2a6dea629adc7389e');
INSERT INTO `sys_role_backend_api_table` VALUES (11, 'd04c2ebb1e32995f384ad49f6d4b421d', 'fa0c9a0b71a1d654f4ad2db4aac8e903');
INSERT INTO `sys_role_backend_api_table` VALUES (12, 'd04c2ebb1e32995f384ad49f6d4b421d', '4725d5b946c8789ebd2f758a93d416d8');
INSERT INTO `sys_role_backend_api_table` VALUES (13, 'd04c2ebb1e32995f384ad49f6d4b421d', '760ba9bf47fcda793203b1f3cd731083');
INSERT INTO `sys_role_backend_api_table` VALUES (14, 'd04c2ebb1e32995f384ad49f6d4b421d', '49bcd49553fd6274c5ea8b6fcc84097e');
INSERT INTO `sys_role_backend_api_table` VALUES (15, 'd04c2ebb1e32995f384ad49f6d4b421d', 'adc60ab150c543223d9d454b1e9d43a6');
INSERT INTO `sys_role_backend_api_table` VALUES (16, 'd04c2ebb1e32995f384ad49f6d4b421d', '73b81575b6737e4d38e6716bc773c5bb');
INSERT INTO `sys_role_backend_api_table` VALUES (17, 'd04c2ebb1e32995f384ad49f6d4b421d', '8ba918894b2ed504e2a3db56b33327b4');
INSERT INTO `sys_role_backend_api_table` VALUES (18, '1', '1');
INSERT INTO `sys_role_backend_api_table` VALUES (22, '2f412c59e5077e0cd53d21fac3eee402', '8ba918894b2ed504e2a3db56b33327b4');
INSERT INTO `sys_role_backend_api_table` VALUES (23, '2f412c59e5077e0cd53d21fac3eee402', '73b81575b6737e4d38e6716bc773c5bb');
INSERT INTO `sys_role_backend_api_table` VALUES (24, '2f412c59e5077e0cd53d21fac3eee402', '49bcd49553fd6274c5ea8b6fcc84097e');
INSERT INTO `sys_role_backend_api_table` VALUES (25, '2f412c59e5077e0cd53d21fac3eee402', 'adc60ab150c543223d9d454b1e9d43a6');

-- ----------------------------
-- Table structure for sys_role_frontend_menu_table
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_frontend_menu_table`;
CREATE TABLE `sys_role_frontend_menu_table`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色ID',
  `frontend_menu_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '前端菜单管理ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 145 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_frontend_menu_table
-- ----------------------------
INSERT INTO `sys_role_frontend_menu_table` VALUES (52, '1', '*');
INSERT INTO `sys_role_frontend_menu_table` VALUES (53, '1', 'b2dcfb940a72deb68b338b934128a1e4');
INSERT INTO `sys_role_frontend_menu_table` VALUES (54, '1', 'c9fe45ef063af26c3e4c3208ffe1ff9f');
INSERT INTO `sys_role_frontend_menu_table` VALUES (55, '1', '105eb6c65a907eb589dbd3a9eeea013a');
INSERT INTO `sys_role_frontend_menu_table` VALUES (56, '1', '434e4bd50799bd145f4590d0f4705162');
INSERT INTO `sys_role_frontend_menu_table` VALUES (57, '1', 'e529e97e6ab0f95fc85cfbda5247eeaa');
INSERT INTO `sys_role_frontend_menu_table` VALUES (58, '1', 'e1fc2013f32ece3c772becb9489296e4');
INSERT INTO `sys_role_frontend_menu_table` VALUES (59, '1', '737addccb1ac6307d29802ad988b13d8');
INSERT INTO `sys_role_frontend_menu_table` VALUES (60, '1', '6423ae277e4ec862ff23bd7b2c0922ce');
INSERT INTO `sys_role_frontend_menu_table` VALUES (61, '1', 'b65d3ad4906ffc8be6932f9a1f51df1d');
INSERT INTO `sys_role_frontend_menu_table` VALUES (62, '1', 'd2948d3e4a0914825f70aa39ce1c9d23');
INSERT INTO `sys_role_frontend_menu_table` VALUES (63, '1', 'b3c72fd354b3df32ceb1dd7db0c61086');
INSERT INTO `sys_role_frontend_menu_table` VALUES (64, '1', 'eb70ecd66ed156ca2f49e4d0e32b36f6');
INSERT INTO `sys_role_frontend_menu_table` VALUES (65, '1', '94025c8731dc0dc403b66f9e8899cbc7');
INSERT INTO `sys_role_frontend_menu_table` VALUES (66, '1', 'b973d15c229778a6d98e742d096b2e41');
INSERT INTO `sys_role_frontend_menu_table` VALUES (67, '1', '7f448ccf628eb577e20f6413c5810300');
INSERT INTO `sys_role_frontend_menu_table` VALUES (68, '1', '40ca076892e16ef6f788eb4d753df964');
INSERT INTO `sys_role_frontend_menu_table` VALUES (69, '1', '0af385f5e237445d369a49cb35b20da4');
INSERT INTO `sys_role_frontend_menu_table` VALUES (70, '1', 'ab9fdc8116dab6c8d110aa4387c97e08');
INSERT INTO `sys_role_frontend_menu_table` VALUES (71, '1', '76cb7b2df76c79d159c561ecfbd54ef2');
INSERT INTO `sys_role_frontend_menu_table` VALUES (72, '1', '2e5739a73173a22ed55eca37bb67aae6');
INSERT INTO `sys_role_frontend_menu_table` VALUES (73, '1', 'a3baa2f584b4032be78d38bd49b891c8');
INSERT INTO `sys_role_frontend_menu_table` VALUES (74, '1', 'c7eb10d6513f40ac25f75e34a2679eab');
INSERT INTO `sys_role_frontend_menu_table` VALUES (75, '1', '3a8846521659085ed6ce0b0187d6d72a');
INSERT INTO `sys_role_frontend_menu_table` VALUES (120, 'd04c2ebb1e32995f384ad49f6d4b421d', 'b3c72fd354b3df32ceb1dd7db0c61086');
INSERT INTO `sys_role_frontend_menu_table` VALUES (121, 'd04c2ebb1e32995f384ad49f6d4b421d', '6423ae277e4ec862ff23bd7b2c0922ce');
INSERT INTO `sys_role_frontend_menu_table` VALUES (122, 'd04c2ebb1e32995f384ad49f6d4b421d', 'c7eb10d6513f40ac25f75e34a2679eab');
INSERT INTO `sys_role_frontend_menu_table` VALUES (123, 'd04c2ebb1e32995f384ad49f6d4b421d', '105eb6c65a907eb589dbd3a9eeea013a');
INSERT INTO `sys_role_frontend_menu_table` VALUES (124, 'd04c2ebb1e32995f384ad49f6d4b421d', 'b65d3ad4906ffc8be6932f9a1f51df1d');
INSERT INTO `sys_role_frontend_menu_table` VALUES (125, 'd04c2ebb1e32995f384ad49f6d4b421d', '2e5739a73173a22ed55eca37bb67aae6');
INSERT INTO `sys_role_frontend_menu_table` VALUES (126, 'd04c2ebb1e32995f384ad49f6d4b421d', '434e4bd50799bd145f4590d0f4705162');
INSERT INTO `sys_role_frontend_menu_table` VALUES (127, 'd04c2ebb1e32995f384ad49f6d4b421d', '94025c8731dc0dc403b66f9e8899cbc7');
INSERT INTO `sys_role_frontend_menu_table` VALUES (128, 'd04c2ebb1e32995f384ad49f6d4b421d', '7f448ccf628eb577e20f6413c5810300');
INSERT INTO `sys_role_frontend_menu_table` VALUES (129, 'd04c2ebb1e32995f384ad49f6d4b421d', '3a8846521659085ed6ce0b0187d6d72a');
INSERT INTO `sys_role_frontend_menu_table` VALUES (130, 'd04c2ebb1e32995f384ad49f6d4b421d', 'b2dcfb940a72deb68b338b934128a1e4');
INSERT INTO `sys_role_frontend_menu_table` VALUES (131, 'd04c2ebb1e32995f384ad49f6d4b421d', '737addccb1ac6307d29802ad988b13d8');
INSERT INTO `sys_role_frontend_menu_table` VALUES (132, 'd04c2ebb1e32995f384ad49f6d4b421d', 'a3baa2f584b4032be78d38bd49b891c8');
INSERT INTO `sys_role_frontend_menu_table` VALUES (133, 'd04c2ebb1e32995f384ad49f6d4b421d', 'c9fe45ef063af26c3e4c3208ffe1ff9f');
INSERT INTO `sys_role_frontend_menu_table` VALUES (140, '2f412c59e5077e0cd53d21fac3eee402', 'a3baa2f584b4032be78d38bd49b891c8');
INSERT INTO `sys_role_frontend_menu_table` VALUES (141, '2f412c59e5077e0cd53d21fac3eee402', '94025c8731dc0dc403b66f9e8899cbc7');
INSERT INTO `sys_role_frontend_menu_table` VALUES (142, '2f412c59e5077e0cd53d21fac3eee402', '434e4bd50799bd145f4590d0f4705162');
INSERT INTO `sys_role_frontend_menu_table` VALUES (143, '2f412c59e5077e0cd53d21fac3eee402', '105eb6c65a907eb589dbd3a9eeea013a');
INSERT INTO `sys_role_frontend_menu_table` VALUES (144, '2f412c59e5077e0cd53d21fac3eee402', '737addccb1ac6307d29802ad988b13d8');

-- ----------------------------
-- Table structure for sys_role_table
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_table`;
CREATE TABLE `sys_role_table`  (
  `role_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `role_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色ID',
  `description` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE INDEX `sys_role_table_pk`(`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_table
-- ----------------------------
INSERT INTO `sys_role_table` VALUES ('1', 'ROLE_ADMIN', '超级管理员');
INSERT INTO `sys_role_table` VALUES ('284cc0b1ce8fd305221e237449b8c854', 'ROLE_SHOP_MANAGER', '店长');
INSERT INTO `sys_role_table` VALUES ('2f412c59e5077e0cd53d21fac3eee402', 'ROLE_收银员', '收银员');
INSERT INTO `sys_role_table` VALUES ('a60c7ef8dca355ff54a14800748fabba', 'ROLE_ADMIN', '老板');
INSERT INTO `sys_role_table` VALUES ('ad6c8c05447aa8e6f941832d09b76559', 'ROLE_SHOP_BUSINESS', '运营');
INSERT INTO `sys_role_table` VALUES ('d04c2ebb1e32995f384ad49f6d4b421d', 'ROLE_店长', '店长');

-- ----------------------------
-- Table structure for sys_role_user_table
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user_table`;
CREATE TABLE `sys_role_user_table`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色ID',
  `user_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_user_table
-- ----------------------------
INSERT INTO `sys_role_user_table` VALUES (43, 'd04c2ebb1e32995f384ad49f6d4b421d', '6268cbe21e573513a66799114d925e04');
INSERT INTO `sys_role_user_table` VALUES (44, '1', 'bcad19f214499feab47f15b18ae9bc88');
INSERT INTO `sys_role_user_table` VALUES (45, '1', 'da52a0c77af941b43fb54074313ebd9a');
INSERT INTO `sys_role_user_table` VALUES (46, '2f412c59e5077e0cd53d21fac3eee402', '1f540f553a4dd536e52aeca3d470dad7');
INSERT INTO `sys_role_user_table` VALUES (47, '2f412c59e5077e0cd53d21fac3eee402', 'd01c54801e8155223f3a6656056fa2dd');
INSERT INTO `sys_role_user_table` VALUES (48, '2f412c59e5077e0cd53d21fac3eee402', 'b0b4c302687e1c29409ebb688298b667');

-- ----------------------------
-- Table structure for sys_user_table
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_table`;
CREATE TABLE `sys_user_table`  (
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `user_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名称',
  `pass_word` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码-BCR算法加密',
  `description` varchar(800) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `state` int(11) NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_table
-- ----------------------------
INSERT INTO `sys_user_table` VALUES ('0f09bb6fd9b516d25932fcd4c2d1fbfc', '刘伟', '$2a$10$mKVSgJnapbUKoBYfIVJyT.19wG3SuSrn6ZYu20eeon0Mrpc/D1Oey', NULL, 1);
INSERT INTO `sys_user_table` VALUES ('13a0d86310b052bb1d7c57786316077a', '白杨树', '$2a$10$jalwt9mC7GWOkM5HjZroeOuD/1xhXcqvXgSYYX7ruCXBSeIX/ypW6', NULL, 1);
INSERT INTO `sys_user_table` VALUES ('1a9fa07a96f44f40a020b24c54b52428', '程小东', '$2a$10$TKeidhFBUt5oAnCkYkmQj.DpMULqZR3ITCqKep0J36kf50HEgXRZa', NULL, 1);
INSERT INTO `sys_user_table` VALUES ('1f540f553a4dd536e52aeca3d470dad7', '郭强', '$2a$10$Q7Xcmhe8N71niSFriYRREOKACg8nSA8cFDk1NUQTm2JStuasGllN.', NULL, 1);
INSERT INTO `sys_user_table` VALUES ('330708e6680c4e9dd0d772af7343f01e', '谭红红', '$2a$10$jVFVJ59rKW1VObOVWX7Wpedhlb.oubFIFWfqg9RWby5jE2AkPw3bS', NULL, 1);
INSERT INTO `sys_user_table` VALUES ('40529d21d3f4fb975043c63e43630253', '韦博', '$2a$10$Gwk0Oaz04AxZz1O9s7LSfuOw56H9zGX2HG1I3wqLtpEPh/fRbdR2y', NULL, 1);
INSERT INTO `sys_user_table` VALUES ('469c4d4d21d900d2446edaf5f646c663', '郭德纲', '$2a$10$y4d3fWr7ajYQ9qyAdGfW/OG8qInla9U7U4gL0/EDwRvCm2fAeJl6m', NULL, 1);
INSERT INTO `sys_user_table` VALUES ('5ae28c392a6779e41c7d0f8c9f7dfb09', '任静', '$2a$10$VCRbyDApB15zA5wLNTfkNeEvG7Yu3h3fHeG82Cgz6JpaSXeXx/fHe', NULL, 1);
INSERT INTO `sys_user_table` VALUES ('6268cbe21e573513a66799114d925e04', '李兰', '$2a$10$uAU6hwGYTdynwnjOpQFfYO.a17DWhqkaKU52fdw9IKdYY7Pj/QOuy', NULL, 1);
INSERT INTO `sys_user_table` VALUES ('b0b4c302687e1c29409ebb688298b667', '李四', '$2a$10$mjMbuWPgl/ZkBkfv.uHTk.6k1LTbpPvFoKHivz5I16mEnRbq0REcu', NULL, 1);
INSERT INTO `sys_user_table` VALUES ('b3c9e9218fdf0347cc358755c365f2fa', '郭明', '$2a$10$UdhLqkJ.uCD3e/3Z13mV3eEkIrbxpG3oXNyBLm4y8Kwxs8NnXcOly', NULL, 1);
INSERT INTO `sys_user_table` VALUES ('bcad19f214499feab47f15b18ae9bc88', 'admin', '$2a$10$CQ6c6EsMWwxNdrGm0VljHeGudYG6silgEtyFlfdcyLTEV3dvpHG5C', '超级管理员', 1);
INSERT INTO `sys_user_table` VALUES ('c2ea699c481735cd2288dcedbc558d54', '魏艳梅', '$2a$10$h5RdNWDVHmwdRV4X/HYR0eOXT9ISRtDXf8RA5/y3nmczAGCZI/iya', NULL, 1);
INSERT INTO `sys_user_table` VALUES ('c915222fff04f4a3e29afff8d62a56f2', '胡柳杨', '$2a$10$VRtWxeuvWP8ILmGWKoDPv.5AACxhznGKV.pspWYVqLrVYHdWp3PAC', NULL, 1);
INSERT INTO `sys_user_table` VALUES ('c9b52031507db4e87e128747afb686bc', '伊能静', '$2a$10$Z./P3eWTSs9klr9cmHwC9uui/BFtfhF5pzwUrKP8Jyi0TisqFL5S2', NULL, 1);
INSERT INTO `sys_user_table` VALUES ('d01c54801e8155223f3a6656056fa2dd', '张三', '$2a$10$4ed508knTPCdkBp5TfiZROge2WWxcYTTCV.LHo3/jI6tbZPK5wwna', NULL, 1);
INSERT INTO `sys_user_table` VALUES ('da52a0c77af941b43fb54074313ebd9a', '郭敬明', '$2a$10$9hWszcWfimQNiwEiet.dCueLMkXxiUAfX35KBLcaNUdwZu4ZvwpZe', NULL, 1);

SET FOREIGN_KEY_CHECKS = 1;
