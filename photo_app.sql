/*
MySQL Data Transfer
Source Host: localhost
Source Database: photo_app
Target Host: localhost
Target Database: photo_app
Date: 28/09/2018 15:28:18
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for migrations
-- ----------------------------
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for photos
-- ----------------------------
CREATE TABLE `photos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `taken_at` datetime DEFAULT NULL,
  `image_ext` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for users
-- ----------------------------
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `api_token` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_api_token_unique` (`api_token`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('3', '2018_09_24_211158_create_photos_table', '1');
INSERT INTO `migrations` VALUES ('4', '2018_09_24_220420_adds_api_token_to_users_table', '2');
INSERT INTO `photos` VALUES ('35', 'Superman', 'This is a test desccription', '2016-07-05 15:32:00', 'jpg', '2018-09-28 13:11:04', '2018-09-28 13:11:04');
INSERT INTO `photos` VALUES ('36', 'Spiderman', 'Does whatever a spider does', '2016-07-05 15:15:00', 'png', '2018-09-28 13:11:37', '2018-09-28 13:11:37');
INSERT INTO `photos` VALUES ('37', 'Iron Man', 'Blah etc ipsum ya da ya da', '2016-07-05 15:22:00', 'jpg', '2018-09-28 13:12:32', '2018-09-28 13:12:32');
INSERT INTO `photos` VALUES ('38', 'Wonder woman', 'Some more text about wonder woman', '2016-07-05 15:27:00', 'png', '2018-09-28 13:13:41', '2018-09-28 13:13:41');
INSERT INTO `photos` VALUES ('39', 'Nice Tea!', 'Me on my wedding day', '2015-03-01 12:44:00', 'png', '2018-09-28 13:15:17', '2018-09-28 13:15:17');
INSERT INTO `photos` VALUES ('44', 'A little short for a stormtrooper', 'The force is with him', '2015-11-01 16:40:00', 'jpg', '2018-09-28 13:39:27', '2018-09-28 13:39:27');
INSERT INTO `photos` VALUES ('46', 'Who shot my horse!', 'fasdfasdfsd asf dasf asd', '2014-11-01 16:40:00', 'jpg', '2018-09-28 13:46:18', '2018-09-28 13:46:18');
INSERT INTO `users` VALUES ('1', 'Administrator', 'admin@test.com', null, '$2y$10$3aLEvC2md49zr.U1DpO94e.uDyaK.wsEhwZi91zTzeels78Dp3aim', null, '2018-09-24 22:20:01', '2018-09-28 13:47:14', 'Zq0FRfe6mIoVY8chHxbHaXdtKr7gjijIGFfYVuVJXa6F40Fat1Apq6twsrqA');
INSERT INTO `users` VALUES ('2', 'Prof. Barrett Hegmann PhD', 'hintz.tavares@yahoo.com', null, '$2y$10$3aLEvC2md49zr.U1DpO94e.uDyaK.wsEhwZi91zTzeels78Dp3aim', null, '2018-09-24 22:20:01', '2018-09-24 22:20:01', null);
INSERT INTO `users` VALUES ('3', 'Valentina Spinka', 'mabelle41@pacocha.com', null, '$2y$10$3aLEvC2md49zr.U1DpO94e.uDyaK.wsEhwZi91zTzeels78Dp3aim', null, '2018-09-24 22:20:01', '2018-09-24 22:20:01', null);
INSERT INTO `users` VALUES ('4', 'Althea Nader', 'wiza.jasmin@yahoo.com', null, '$2y$10$3aLEvC2md49zr.U1DpO94e.uDyaK.wsEhwZi91zTzeels78Dp3aim', null, '2018-09-24 22:20:01', '2018-09-24 22:20:01', null);
INSERT INTO `users` VALUES ('5', 'Ally Welch', 'myrtis.treutel@eichmann.org', null, '$2y$10$3aLEvC2md49zr.U1DpO94e.uDyaK.wsEhwZi91zTzeels78Dp3aim', null, '2018-09-24 22:20:01', '2018-09-24 22:20:01', null);
INSERT INTO `users` VALUES ('6', 'Lora Nolan', 'gislason.consuelo@hotmail.com', null, '$2y$10$3aLEvC2md49zr.U1DpO94e.uDyaK.wsEhwZi91zTzeels78Dp3aim', null, '2018-09-24 22:20:01', '2018-09-24 22:20:01', null);
INSERT INTO `users` VALUES ('7', 'Tyrique Vandervort', 'ahill@yahoo.com', null, '$2y$10$3aLEvC2md49zr.U1DpO94e.uDyaK.wsEhwZi91zTzeels78Dp3aim', null, '2018-09-24 22:20:01', '2018-09-24 22:20:01', null);
INSERT INTO `users` VALUES ('8', 'Sadye Lynch IV', 'ybotsford@yahoo.com', null, '$2y$10$3aLEvC2md49zr.U1DpO94e.uDyaK.wsEhwZi91zTzeels78Dp3aim', null, '2018-09-24 22:20:01', '2018-09-24 22:20:01', null);
INSERT INTO `users` VALUES ('9', 'Clara Beier', 'thilpert@yahoo.com', null, '$2y$10$3aLEvC2md49zr.U1DpO94e.uDyaK.wsEhwZi91zTzeels78Dp3aim', null, '2018-09-24 22:20:01', '2018-09-24 22:20:01', null);
INSERT INTO `users` VALUES ('10', 'Werner Crona', 'howell.ayla@brown.com', null, '$2y$10$3aLEvC2md49zr.U1DpO94e.uDyaK.wsEhwZi91zTzeels78Dp3aim', null, '2018-09-24 22:20:01', '2018-09-24 22:20:01', null);
INSERT INTO `users` VALUES ('11', 'Javonte Lueilwitz', 'zackery22@schultz.com', null, '$2y$10$3aLEvC2md49zr.U1DpO94e.uDyaK.wsEhwZi91zTzeels78Dp3aim', null, '2018-09-24 22:20:01', '2018-09-24 22:20:01', null);
INSERT INTO `users` VALUES ('12', 'John', 'john.doe@toptal.com', null, '$2y$10$xyCluDQuDZD0tsavB9Xuy.9vBen5/CFWvvX/AqQ3tYJTi7nFveSye', null, '2018-09-25 10:06:51', '2018-09-25 10:06:51', null);
INSERT INTO `users` VALUES ('13', 'John2', 'john2.doe@toptal.com', null, '$2y$10$tlxCaAfyLMFAUjC.Vm7iv.2CCyN0ue4H5OXGSohtyM.dI78O0QgTK', null, '2018-09-25 15:45:15', '2018-09-25 15:45:15', null);
INSERT INTO `users` VALUES ('14', 'John', 'john.doe2@toptal.com', null, '$2y$10$eEJG0MVQAomEKi15U8R8FeZGqiO7yskDJv45CYjA9r.mYKhPp9E5.', null, '2018-09-25 15:52:14', '2018-09-25 15:52:14', null);
INSERT INTO `users` VALUES ('15', 'John', 'john.doe3@toptal.com', null, '$2y$10$VZBFh/HkkwdhxQBv8TCZAeuhCYh54KttXZUr1hcEh1jskhV3VP2t.', null, '2018-09-25 15:59:48', '2018-09-25 15:59:48', null);
INSERT INTO `users` VALUES ('16', 'John', 'john.doe4@toptal.com', null, '$2y$10$vQB5nUrHN.mRwolZ4JZrxuD/o2XHoEq/1R4.UGxig/gfoZZOKo0Ia', null, '2018-09-25 16:05:54', '2018-09-25 16:05:54', null);
INSERT INTO `users` VALUES ('17', 'John', 'john.doe5@toptal.com', null, '$2y$10$pr/6IDCr23fzBhPf0adhUesKIn1bHusFEEs8fnRo6bYtfXgm7a7Bq', null, '2018-09-25 16:07:22', '2018-09-25 16:07:22', null);
INSERT INTO `users` VALUES ('18', 'John', 'john.doe6@toptal.com', null, '$2y$10$k7zDy/XvNhbermhxpMrza.Fg5BXyzrb.86t0dDUXD7jKuOssUygCC', null, '2018-09-25 16:09:57', '2018-09-25 16:09:57', 'oiroS0FdHADznH7w9aH7dL8WF7wOUYg9mbRXLQJlZb1lic5hhluYc4OVKTVE');
