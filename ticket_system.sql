/*
 Navicat Premium Data Transfer

 Source Server         : 123
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : ticket_system

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 20/05/2022 14:43:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for card
-- ----------------------------
DROP TABLE IF EXISTS `card`;
CREATE TABLE `card`  (
  `cardnum` int(0) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `money` float(255, 2) NOT NULL,
  `uname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cardnum`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of card
-- ----------------------------
INSERT INTO `card` VALUES (123123, '123', 1.00, NULL);
INSERT INTO `card` VALUES (456456, '456', -1.00, NULL);

-- ----------------------------
-- Table structure for event
-- ----------------------------
DROP TABLE IF EXISTS `event`;
CREATE TABLE `event`  (
  `ename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `time` datetime(0) NOT NULL,
  `vname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`ename`) USING BTREE,
  INDEX `vname`(`vname`) USING BTREE,
  CONSTRAINT `vname` FOREIGN KEY (`vname`) REFERENCES `venue` (`vname`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of event
-- ----------------------------
INSERT INTO `event` VALUES ('China Table Tennis Club Super League', 'tableTennis', '2022-05-29 14:13:15', 'Olympic Stadium');
INSERT INTO `event` VALUES ('China Volleyball Super League', 'volleyball', '2022-06-16 15:31:38', 'Olympic Stadium');
INSERT INTO `event` VALUES ('Chinese Basketball Association', 'basketball', '2022-11-04 19:18:19', 'Cadillac Arena');
INSERT INTO `event` VALUES ('FINA World Championships', 'swimming', '2022-05-20 14:06:39', 'National Aquatics center');
INSERT INTO `event` VALUES ('Major League Baseball', 'baseball', '2022-10-26 09:17:50', 'Yankee Stadium');
INSERT INTO `event` VALUES ('National Basketball Association', 'basketball', '2022-07-16 03:53:49', 'Staples Center');
INSERT INTO `event` VALUES ('Olympic Winter Games', 'skiing', '2022-05-20 11:01:30', 'National Ski Center');
INSERT INTO `event` VALUES ('Premier League', 'football', '2022-11-17 18:05:44', 'Old Trafford');
INSERT INTO `event` VALUES ('Super Bowl', 'rugby', '2022-07-15 14:26:29', 'SoFI Stadium');

-- ----------------------------
-- Table structure for ticket
-- ----------------------------
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket`  (
  `key` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `seat` int(0) UNSIGNED NOT NULL,
  `price` float(255, 2) UNSIGNED NOT NULL DEFAULT 10.00,
  `status` int(0) NOT NULL DEFAULT 1,
  `ename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 220 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ticket
-- ----------------------------
INSERT INTO `ticket` VALUES (0, 1, 30.00, 0, 'National Basketball Association');
INSERT INTO `ticket` VALUES (1, 2, 30.00, 1, 'National Basketball Association');
INSERT INTO `ticket` VALUES (2, 3, 30.00, 1, 'National Basketball Association');
INSERT INTO `ticket` VALUES (3, 4, 30.00, 1, 'National Basketball Association');
INSERT INTO `ticket` VALUES (4, 5, 30.00, 1, 'National Basketball Association');
INSERT INTO `ticket` VALUES (5, 6, 30.00, 1, 'National Basketball Association');
INSERT INTO `ticket` VALUES (6, 7, 30.00, 1, 'National Basketball Association');
INSERT INTO `ticket` VALUES (7, 8, 30.00, 1, 'National Basketball Association');
INSERT INTO `ticket` VALUES (8, 9, 30.00, 1, 'National Basketball Association');
INSERT INTO `ticket` VALUES (9, 10, 30.00, 1, 'National Basketball Association');
INSERT INTO `ticket` VALUES (10, 11, 20.00, 1, 'National Basketball Association');
INSERT INTO `ticket` VALUES (11, 12, 20.00, 1, 'National Basketball Association');
INSERT INTO `ticket` VALUES (12, 13, 20.00, 1, 'National Basketball Association');
INSERT INTO `ticket` VALUES (13, 14, 20.00, 1, 'National Basketball Association');
INSERT INTO `ticket` VALUES (14, 15, 20.00, 1, 'National Basketball Association');
INSERT INTO `ticket` VALUES (15, 16, 20.00, 1, 'National Basketball Association');
INSERT INTO `ticket` VALUES (16, 17, 20.00, 1, 'National Basketball Association');
INSERT INTO `ticket` VALUES (17, 18, 20.00, 1, 'National Basketball Association');
INSERT INTO `ticket` VALUES (18, 19, 20.00, 1, 'National Basketball Association');
INSERT INTO `ticket` VALUES (19, 20, 20.00, 1, 'National Basketball Association');
INSERT INTO `ticket` VALUES (20, 21, 10.00, 1, 'National Basketball Association');
INSERT INTO `ticket` VALUES (21, 22, 10.00, 1, 'National Basketball Association');
INSERT INTO `ticket` VALUES (22, 23, 10.00, 1, 'National Basketball Association');
INSERT INTO `ticket` VALUES (23, 24, 10.00, 1, 'National Basketball Association');
INSERT INTO `ticket` VALUES (24, 25, 10.00, 1, 'National Basketball Association');
INSERT INTO `ticket` VALUES (25, 26, 10.00, 1, 'National Basketball Association');
INSERT INTO `ticket` VALUES (26, 27, 10.00, 1, 'National Basketball Association');
INSERT INTO `ticket` VALUES (27, 28, 10.00, 1, 'National Basketball Association');
INSERT INTO `ticket` VALUES (28, 29, 10.00, 1, 'National Basketball Association');
INSERT INTO `ticket` VALUES (29, 30, 10.00, 1, 'National Basketball Association');
INSERT INTO `ticket` VALUES (30, 1, 15.00, 0, 'Premier League');
INSERT INTO `ticket` VALUES (31, 2, 15.00, 1, 'Premier League');
INSERT INTO `ticket` VALUES (32, 3, 15.00, 1, 'Premier League');
INSERT INTO `ticket` VALUES (33, 4, 15.00, 1, 'Premier League');
INSERT INTO `ticket` VALUES (34, 5, 15.00, 1, 'Premier League');
INSERT INTO `ticket` VALUES (35, 6, 15.00, 1, 'Premier League');
INSERT INTO `ticket` VALUES (36, 7, 15.00, 1, 'Premier League');
INSERT INTO `ticket` VALUES (37, 8, 15.00, 1, 'Premier League');
INSERT INTO `ticket` VALUES (38, 9, 15.00, 1, 'Premier League');
INSERT INTO `ticket` VALUES (39, 10, 15.00, 1, 'Premier League');
INSERT INTO `ticket` VALUES (40, 11, 15.00, 1, 'Premier League');
INSERT INTO `ticket` VALUES (41, 12, 15.00, 1, 'Premier League');
INSERT INTO `ticket` VALUES (42, 13, 15.00, 1, 'Premier League');
INSERT INTO `ticket` VALUES (43, 14, 15.00, 1, 'Premier League');
INSERT INTO `ticket` VALUES (44, 15, 15.00, 1, 'Premier League');
INSERT INTO `ticket` VALUES (45, 16, 15.00, 1, 'Premier League');
INSERT INTO `ticket` VALUES (46, 17, 15.00, 1, 'Premier League');
INSERT INTO `ticket` VALUES (47, 18, 15.00, 1, 'Premier League');
INSERT INTO `ticket` VALUES (48, 19, 10.00, 1, 'Premier League');
INSERT INTO `ticket` VALUES (49, 20, 10.00, 1, 'Premier League');
INSERT INTO `ticket` VALUES (50, 21, 10.00, 1, 'Premier League');
INSERT INTO `ticket` VALUES (51, 22, 10.00, 1, 'Premier League');
INSERT INTO `ticket` VALUES (52, 23, 10.00, 1, 'Premier League');
INSERT INTO `ticket` VALUES (53, 24, 10.00, 1, 'Premier League');
INSERT INTO `ticket` VALUES (54, 25, 10.00, 1, 'Premier League');
INSERT INTO `ticket` VALUES (55, 26, 10.00, 1, 'Premier League');
INSERT INTO `ticket` VALUES (56, 27, 10.00, 1, 'Premier League');
INSERT INTO `ticket` VALUES (57, 28, 10.00, 1, 'Premier League');
INSERT INTO `ticket` VALUES (58, 29, 10.00, 1, 'Premier League');
INSERT INTO `ticket` VALUES (59, 30, 10.00, 1, 'Premier League');
INSERT INTO `ticket` VALUES (60, 31, 10.00, 1, 'Premier League');
INSERT INTO `ticket` VALUES (61, 32, 10.00, 1, 'Premier League');
INSERT INTO `ticket` VALUES (62, 33, 10.00, 1, 'Premier League');
INSERT INTO `ticket` VALUES (63, 34, 10.00, 1, 'Premier League');
INSERT INTO `ticket` VALUES (64, 35, 10.00, 1, 'Premier League');
INSERT INTO `ticket` VALUES (65, 36, 10.00, 1, 'Premier League');
INSERT INTO `ticket` VALUES (66, 1, 15.00, 0, 'China Table Tennis Club Super League');
INSERT INTO `ticket` VALUES (67, 2, 15.00, 1, 'China Table Tennis Club Super League');
INSERT INTO `ticket` VALUES (68, 3, 15.00, 1, 'China Table Tennis Club Super League');
INSERT INTO `ticket` VALUES (69, 4, 15.00, 1, 'China Table Tennis Club Super League');
INSERT INTO `ticket` VALUES (70, 5, 15.00, 1, 'China Table Tennis Club Super League');
INSERT INTO `ticket` VALUES (71, 6, 15.00, 1, 'China Table Tennis Club Super League');
INSERT INTO `ticket` VALUES (72, 7, 10.00, 1, 'China Table Tennis Club Super League');
INSERT INTO `ticket` VALUES (73, 8, 10.00, 1, 'China Table Tennis Club Super League');
INSERT INTO `ticket` VALUES (74, 9, 10.00, 1, 'China Table Tennis Club Super League');
INSERT INTO `ticket` VALUES (75, 10, 10.00, 1, 'China Table Tennis Club Super League');
INSERT INTO `ticket` VALUES (76, 11, 10.00, 1, 'China Table Tennis Club Super League');
INSERT INTO `ticket` VALUES (77, 12, 10.00, 1, 'China Table Tennis Club Super League');
INSERT INTO `ticket` VALUES (78, 1, 20.00, 0, 'Major League Baseball');
INSERT INTO `ticket` VALUES (79, 2, 20.00, 1, 'Major League Baseball');
INSERT INTO `ticket` VALUES (80, 3, 20.00, 1, 'Major League Baseball');
INSERT INTO `ticket` VALUES (81, 4, 20.00, 1, 'Major League Baseball');
INSERT INTO `ticket` VALUES (82, 5, 20.00, 1, 'Major League Baseball');
INSERT INTO `ticket` VALUES (83, 6, 20.00, 1, 'Major League Baseball');
INSERT INTO `ticket` VALUES (84, 7, 20.00, 1, 'Major League Baseball');
INSERT INTO `ticket` VALUES (85, 8, 20.00, 1, 'Major League Baseball');
INSERT INTO `ticket` VALUES (86, 9, 10.00, 1, 'Major League Baseball');
INSERT INTO `ticket` VALUES (87, 10, 10.00, 1, 'Major League Baseball');
INSERT INTO `ticket` VALUES (88, 11, 10.00, 1, 'Major League Baseball');
INSERT INTO `ticket` VALUES (89, 12, 10.00, 1, 'Major League Baseball');
INSERT INTO `ticket` VALUES (90, 13, 10.00, 1, 'Major League Baseball');
INSERT INTO `ticket` VALUES (91, 14, 10.00, 1, 'Major League Baseball');
INSERT INTO `ticket` VALUES (92, 15, 10.00, 1, 'Major League Baseball');
INSERT INTO `ticket` VALUES (93, 16, 10.00, 1, 'Major League Baseball');
INSERT INTO `ticket` VALUES (94, 1, 30.00, 0, 'Super Bowl');
INSERT INTO `ticket` VALUES (95, 2, 30.00, 1, 'Super Bowl');
INSERT INTO `ticket` VALUES (96, 3, 30.00, 1, 'Super Bowl');
INSERT INTO `ticket` VALUES (97, 4, 30.00, 1, 'Super Bowl');
INSERT INTO `ticket` VALUES (98, 5, 30.00, 1, 'Super Bowl');
INSERT INTO `ticket` VALUES (99, 6, 30.00, 1, 'Super Bowl');
INSERT INTO `ticket` VALUES (100, 7, 30.00, 1, 'Super Bowl');
INSERT INTO `ticket` VALUES (101, 8, 30.00, 1, 'Super Bowl');
INSERT INTO `ticket` VALUES (102, 9, 30.00, 1, 'Super Bowl');
INSERT INTO `ticket` VALUES (103, 10, 30.00, 1, 'Super Bowl');
INSERT INTO `ticket` VALUES (104, 11, 10.00, 1, 'Super Bowl');
INSERT INTO `ticket` VALUES (105, 12, 10.00, 1, 'Super Bowl');
INSERT INTO `ticket` VALUES (106, 13, 10.00, 1, 'Super Bowl');
INSERT INTO `ticket` VALUES (107, 14, 10.00, 1, 'Super Bowl');
INSERT INTO `ticket` VALUES (108, 15, 10.00, 1, 'Super Bowl');
INSERT INTO `ticket` VALUES (109, 16, 10.00, 1, 'Super Bowl');
INSERT INTO `ticket` VALUES (110, 17, 10.00, 1, 'Super Bowl');
INSERT INTO `ticket` VALUES (111, 18, 10.00, 1, 'Super Bowl');
INSERT INTO `ticket` VALUES (112, 19, 10.00, 1, 'Super Bowl');
INSERT INTO `ticket` VALUES (113, 20, 10.00, 1, 'Super Bowl');
INSERT INTO `ticket` VALUES (114, 21, 10.00, 1, 'Super Bowl');
INSERT INTO `ticket` VALUES (115, 22, 10.00, 1, 'Super Bowl');
INSERT INTO `ticket` VALUES (116, 23, 10.00, 1, 'Super Bowl');
INSERT INTO `ticket` VALUES (117, 24, 10.00, 1, 'Super Bowl');
INSERT INTO `ticket` VALUES (118, 25, 10.00, 1, 'Super Bowl');
INSERT INTO `ticket` VALUES (119, 1, 15.00, 1, 'China Volleyball Super League');
INSERT INTO `ticket` VALUES (120, 2, 15.00, 1, 'China Volleyball Super League');
INSERT INTO `ticket` VALUES (121, 3, 15.00, 1, 'China Volleyball Super League');
INSERT INTO `ticket` VALUES (122, 4, 15.00, 1, 'China Volleyball Super League');
INSERT INTO `ticket` VALUES (123, 5, 15.00, 1, 'China Volleyball Super League');
INSERT INTO `ticket` VALUES (124, 6, 15.00, 1, 'China Volleyball Super League');
INSERT INTO `ticket` VALUES (125, 7, 10.00, 1, 'China Volleyball Super League');
INSERT INTO `ticket` VALUES (126, 8, 10.00, 1, 'China Volleyball Super League');
INSERT INTO `ticket` VALUES (127, 9, 10.00, 1, 'China Volleyball Super League');
INSERT INTO `ticket` VALUES (128, 10, 10.00, 1, 'China Volleyball Super League');
INSERT INTO `ticket` VALUES (129, 11, 10.00, 1, 'China Volleyball Super League');
INSERT INTO `ticket` VALUES (130, 12, 10.00, 1, 'China Volleyball Super League');
INSERT INTO `ticket` VALUES (131, 1, 20.00, 0, 'Olympic Winter Games');
INSERT INTO `ticket` VALUES (132, 2, 20.00, 1, 'Olympic Winter Games');
INSERT INTO `ticket` VALUES (133, 3, 20.00, 1, 'Olympic Winter Games');
INSERT INTO `ticket` VALUES (134, 4, 20.00, 1, 'Olympic Winter Games');
INSERT INTO `ticket` VALUES (135, 5, 20.00, 1, 'Olympic Winter Games');
INSERT INTO `ticket` VALUES (136, 6, 20.00, 1, 'Olympic Winter Games');
INSERT INTO `ticket` VALUES (137, 7, 20.00, 1, 'Olympic Winter Games');
INSERT INTO `ticket` VALUES (138, 8, 20.00, 1, 'Olympic Winter Games');
INSERT INTO `ticket` VALUES (139, 9, 20.00, 1, 'Olympic Winter Games');
INSERT INTO `ticket` VALUES (140, 10, 20.00, 1, 'Olympic Winter Games');
INSERT INTO `ticket` VALUES (141, 11, 10.00, 1, 'Olympic Winter Games');
INSERT INTO `ticket` VALUES (142, 12, 10.00, 1, 'Olympic Winter Games');
INSERT INTO `ticket` VALUES (143, 13, 10.00, 1, 'Olympic Winter Games');
INSERT INTO `ticket` VALUES (144, 14, 10.00, 1, 'Olympic Winter Games');
INSERT INTO `ticket` VALUES (145, 15, 10.00, 1, 'Olympic Winter Games');
INSERT INTO `ticket` VALUES (146, 16, 10.00, 1, 'Olympic Winter Games');
INSERT INTO `ticket` VALUES (147, 17, 10.00, 1, 'Olympic Winter Games');
INSERT INTO `ticket` VALUES (148, 18, 10.00, 1, 'Olympic Winter Games');
INSERT INTO `ticket` VALUES (149, 19, 10.00, 1, 'Olympic Winter Games');
INSERT INTO `ticket` VALUES (150, 20, 10.00, 1, 'Olympic Winter Games');
INSERT INTO `ticket` VALUES (151, 1, 15.00, 0, 'FINA World Championships');
INSERT INTO `ticket` VALUES (152, 2, 15.00, 1, 'FINA World Championships');
INSERT INTO `ticket` VALUES (153, 3, 15.00, 1, 'FINA World Championships');
INSERT INTO `ticket` VALUES (154, 4, 15.00, 1, 'FINA World Championships');
INSERT INTO `ticket` VALUES (155, 5, 15.00, 1, 'FINA World Championships');
INSERT INTO `ticket` VALUES (156, 6, 15.00, 1, 'FINA World Championships');
INSERT INTO `ticket` VALUES (157, 7, 15.00, 1, 'FINA World Championships');
INSERT INTO `ticket` VALUES (158, 8, 15.00, 1, 'FINA World Championships');
INSERT INTO `ticket` VALUES (159, 9, 15.00, 1, 'FINA World Championships');
INSERT INTO `ticket` VALUES (160, 10, 15.00, 1, 'FINA World Championships');
INSERT INTO `ticket` VALUES (161, 11, 10.00, 1, 'FINA World Championships');
INSERT INTO `ticket` VALUES (162, 12, 10.00, 1, 'FINA World Championships');
INSERT INTO `ticket` VALUES (163, 13, 10.00, 1, 'FINA World Championships');
INSERT INTO `ticket` VALUES (164, 14, 10.00, 1, 'FINA World Championships');
INSERT INTO `ticket` VALUES (165, 15, 10.00, 1, 'FINA World Championships');
INSERT INTO `ticket` VALUES (166, 16, 10.00, 1, 'FINA World Championships');
INSERT INTO `ticket` VALUES (167, 17, 10.00, 1, 'FINA World Championships');
INSERT INTO `ticket` VALUES (168, 18, 10.00, 1, 'FINA World Championships');
INSERT INTO `ticket` VALUES (169, 19, 10.00, 1, 'FINA World Championships');
INSERT INTO `ticket` VALUES (170, 20, 10.00, 1, 'FINA World Championships');
INSERT INTO `ticket` VALUES (171, 1, 20.00, 0, 'Chinese Basketball Association');
INSERT INTO `ticket` VALUES (172, 2, 20.00, 1, 'Chinese Basketball Association');
INSERT INTO `ticket` VALUES (173, 3, 20.00, 1, 'Chinese Basketball Association');
INSERT INTO `ticket` VALUES (174, 4, 20.00, 1, 'Chinese Basketball Association');
INSERT INTO `ticket` VALUES (175, 5, 20.00, 1, 'Chinese Basketball Association');
INSERT INTO `ticket` VALUES (176, 6, 20.00, 1, 'Chinese Basketball Association');
INSERT INTO `ticket` VALUES (177, 7, 20.00, 1, 'Chinese Basketball Association');
INSERT INTO `ticket` VALUES (178, 8, 20.00, 1, 'Chinese Basketball Association');
INSERT INTO `ticket` VALUES (179, 9, 20.00, 1, 'Chinese Basketball Association');
INSERT INTO `ticket` VALUES (180, 10, 20.00, 1, 'Chinese Basketball Association');
INSERT INTO `ticket` VALUES (181, 11, 20.00, 1, 'Chinese Basketball Association');
INSERT INTO `ticket` VALUES (182, 12, 20.00, 1, 'Chinese Basketball Association');
INSERT INTO `ticket` VALUES (183, 13, 20.00, 1, 'Chinese Basketball Association');
INSERT INTO `ticket` VALUES (184, 14, 20.00, 1, 'Chinese Basketball Association');
INSERT INTO `ticket` VALUES (185, 15, 20.00, 1, 'Chinese Basketball Association');
INSERT INTO `ticket` VALUES (186, 16, 10.00, 1, 'Chinese Basketball Association');
INSERT INTO `ticket` VALUES (187, 17, 10.00, 1, 'Chinese Basketball Association');
INSERT INTO `ticket` VALUES (188, 18, 10.00, 1, 'Chinese Basketball Association');
INSERT INTO `ticket` VALUES (189, 19, 10.00, 1, 'Chinese Basketball Association');
INSERT INTO `ticket` VALUES (190, 20, 10.00, 1, 'Chinese Basketball Association');
INSERT INTO `ticket` VALUES (191, 21, 10.00, 1, 'Chinese Basketball Association');
INSERT INTO `ticket` VALUES (192, 22, 10.00, 1, 'Chinese Basketball Association');
INSERT INTO `ticket` VALUES (193, 23, 10.00, 1, 'Chinese Basketball Association');
INSERT INTO `ticket` VALUES (194, 24, 10.00, 1, 'Chinese Basketball Association');
INSERT INTO `ticket` VALUES (195, 25, 10.00, 1, 'Chinese Basketball Association');
INSERT INTO `ticket` VALUES (196, 26, 10.00, 1, 'Chinese Basketball Association');
INSERT INTO `ticket` VALUES (197, 27, 10.00, 1, 'Chinese Basketball Association');
INSERT INTO `ticket` VALUES (198, 28, 10.00, 1, 'Chinese Basketball Association');
INSERT INTO `ticket` VALUES (199, 29, 10.00, 1, 'Chinese Basketball Association');
INSERT INTO `ticket` VALUES (200, 30, 10.00, 1, 'Chinese Basketball Association');

-- ----------------------------
-- Table structure for tickets
-- ----------------------------
DROP TABLE IF EXISTS `tickets`;
CREATE TABLE `tickets`  (
  `uname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tickets` int(0) NOT NULL,
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `selling` int(0) UNSIGNED NOT NULL DEFAULT 0,
  `priceofsell` float(255, 2) NULL DEFAULT NULL,
  `originalprice` float(255, 2) NULL DEFAULT NULL,
  `firstprice` float(255, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`uname`, `tickets`, `info`) USING BTREE,
  INDEX `uname`(`uname`) USING BTREE,
  CONSTRAINT `uname` FOREIGN KEY (`uname`) REFERENCES `user` (`uname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tickets
-- ----------------------------
INSERT INTO `tickets` VALUES ('test', -1863941295, '{\"seatnum\":1,\"ename\":\"Chinese Basketball Association\",\"price\":20.0,\"vname\":\"Cadillac Arena\",\"address\":\"69 Fuxing Road, Haidian District, Beijing\",\"etime\":\"2022-11-04 19:18:19\"}', 0, NULL, NULL, NULL);
INSERT INTO `tickets` VALUES ('test', -815508244, '{\"seatnum\":1,\"ename\":\"National Basketball Association\",\"price\":30.0,\"vname\":\"Staples Center\",\"address\":\"Downtown Los Angeles, California, USA\",\"etime\":\"2022-07-16 03:53:49\"}', 0, NULL, NULL, NULL);
INSERT INTO `tickets` VALUES ('test', 230260334, '{\"seatnum\":1,\"ename\":\"FINA World Championships\",\"price\":15.0,\"vname\":\"National Aquatics center\",\"address\":\"Beijing Olympic Park, Chaoyang District, Beijing\",\"etime\":\"2022-05-20 14:06:39\"}', 0, NULL, NULL, NULL);
INSERT INTO `tickets` VALUES ('test', 900389631, '{\"seatnum\":1,\"ename\":\"Super Bowl\",\"vname\":\"SoFI Stadium\",\"address\":\"Inglewood, California, USA\",\"price\":\"666.0\",\"etime\":\"2022-07-15 14:26:29\"}', 1, 666.00, 30.00, 30.00);
INSERT INTO `tickets` VALUES ('test', 1395246988, '{\"seatnum\":1,\"ename\":\"China Table Tennis Club Super League\",\"price\":15.0,\"vname\":\"Olympic Stadium\",\"address\":\"Beijing University of Technology, No.100 Pingleyuan Village, Chaoyang District, Beijing\",\"etime\":\"2022-05-29 14:13:15\"}', 0, NULL, NULL, NULL);
INSERT INTO `tickets` VALUES ('test2', -2129826309, '{\"seatnum\":1,\"ename\":\"Premier League\",\"vname\":\"Old Trafford\",\"address\":\"Greater Manchester, UK\",\"price\":\"888.0\",\"etime\":\"2022-11-17 18:05:44\"}', 1, 888.00, 15.00, 15.00);
INSERT INTO `tickets` VALUES ('test2', -139694747, '{\"seatnum\":1,\"ename\":\"Olympic Winter Games\",\"price\":20.0,\"vname\":\"National Ski Center\",\"address\":\"Taizicheng, Chongli District, Zhangjiakou City, Hebei Province\",\"etime\":\"2022-05-20 11:01:30\"}', 0, NULL, NULL, NULL);
INSERT INTO `tickets` VALUES ('test2', 224949266, '{\"seatnum\":1,\"ename\":\"Major League Baseball\",\"price\":20.0,\"vname\":\"Yankee Stadium\",\"address\":\"McComposten Park in the Bronx, New York City\",\"etime\":\"2022-10-26 09:17:50\"}', 0, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pubkey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `identitynum` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `balance` float(255, 2) NOT NULL DEFAULT 100.00,
  PRIMARY KEY (`uname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('adm', '123456', 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCvetDEynp91+aslFBWlv19F4W1ZjOpsmvXY+8XO3G0rLpOsU3qO+RXM/CgMSbvVoGKh7HW0qLFRbMhycL8/ye6A6R1ohzWsaE7kDM1IlSzdsTlzhTRzrN+gfaTObC/xY2QLHonID+i6KEDuXWWYMyPWnuPIzayque+sAz7uep8qQIDAQAB', '5b32e46f1cd0f2ae6a3185bd9e925b59', 100.00);
INSERT INTO `user` VALUES ('test', '123456', 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCk/9KTlo3/jmwcINKZ7LWkr8It0sJFlAGenRvfANIkx1I6wgHLwXXFmPN/H9g/ywJTmCsFGKnZ+WXawqLYAy1Jpc6Cg6+MQFIrn4ZVnTUEtXLyhp/+V1uygJgT4+bP9xGLFOzQ5bB/veVRWZInAutMY/CG4FtdnKoG+s+US4yKCwIDAQAB', 'fef6eb6a9b2a701a74ad1962763e5f6f', 11530.00);
INSERT INTO `user` VALUES ('test2', '123456', 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCqIElMz7+PLLhrKYZ7hce+zjOQSlEzVD+vbeqpfu2xpJBeZqSqGvCn8zoxXXRlM72h1y+3jiBE5KtkjH2/RIlA6M6Upnjm1pmJxRRYc8jqROhzdQ8qWRwn+NedvAuhMsAMIWvQ8NktdtNcY4Tt617W045j/sMHqPsLH+qJwi4UqQIDAQAB', 'ac8afde3cefd048fc31f575f13542c', 191.00);

-- ----------------------------
-- Table structure for venue
-- ----------------------------
DROP TABLE IF EXISTS `venue`;
CREATE TABLE `venue`  (
  `vname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `num_seat` int(0) NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`vname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of venue
-- ----------------------------
INSERT INTO `venue` VALUES ('Cadillac Arena', 30, '69 Fuxing Road, Haidian District, Beijing');
INSERT INTO `venue` VALUES ('National Aquatics center', 20, 'Beijing Olympic Park, Chaoyang District, Beijing');
INSERT INTO `venue` VALUES ('National Ski Center', 20, 'Taizicheng, Chongli District, Zhangjiakou City, Hebei Province');
INSERT INTO `venue` VALUES ('Old Trafford', 36, 'Greater Manchester, UK');
INSERT INTO `venue` VALUES ('Olympic Stadium', 12, 'Beijing University of Technology, No.100 Pingleyuan Village, Chaoyang District, Beijing');
INSERT INTO `venue` VALUES ('SoFI Stadium', 25, 'Inglewood, California, USA');
INSERT INTO `venue` VALUES ('Staples Center', 30, 'Downtown Los Angeles, California, USA');
INSERT INTO `venue` VALUES ('Yankee Stadium', 16, 'McComposten Park in the Bronx, New York City');

SET FOREIGN_KEY_CHECKS = 1;
