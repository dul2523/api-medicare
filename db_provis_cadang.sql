/*
Navicat MySQL Data Transfer

Source Server         : koneksi01
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : db_provis

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2024-06-06 23:28:39
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `daftar_profil`
-- ----------------------------
DROP TABLE IF EXISTS `daftar_profil`;
CREATE TABLE `daftar_profil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_profil` int(11) DEFAULT NULL,
  `id_profil_lain` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_profil` (`id_profil`) USING BTREE,
  KEY `fk_profil_lain` (`id_profil_lain`) USING BTREE,
  CONSTRAINT `fk_profil` FOREIGN KEY (`id_profil`) REFERENCES `profil` (`id`),
  CONSTRAINT `fk_profil_lain` FOREIGN KEY (`id_profil_lain`) REFERENCES `profil_lain` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of daftar_profil
-- ----------------------------
INSERT INTO `daftar_profil` VALUES ('1', '2', null);

-- ----------------------------
-- Table structure for `dokter`
-- ----------------------------
DROP TABLE IF EXISTS `dokter`;
CREATE TABLE `dokter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL DEFAULT '',
  `foto` varchar(255) NOT NULL DEFAULT '',
  `id_spesialis` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_spesialis` (`id_spesialis`) USING BTREE,
  CONSTRAINT `id_spesialis` FOREIGN KEY (`id_spesialis`) REFERENCES `spesialis` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dokter
-- ----------------------------
INSERT INTO `dokter` VALUES ('1', 'dr. Shidiq Arifin', 'Doktor1.png', '1');
INSERT INTO `dokter` VALUES ('2', 'dr. Abdul Hafidz', 'Doktor2.png', '1');
INSERT INTO `dokter` VALUES ('3', 'dr. Daoa', 'Doktor1.png', '1');

-- ----------------------------
-- Table structure for `hari`
-- ----------------------------
DROP TABLE IF EXISTS `hari`;
CREATE TABLE `hari` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of hari
-- ----------------------------
INSERT INTO `hari` VALUES ('1', 'Senin');
INSERT INTO `hari` VALUES ('2', 'Selasa');
INSERT INTO `hari` VALUES ('3', 'Rabu');
INSERT INTO `hari` VALUES ('4', 'Kamis');
INSERT INTO `hari` VALUES ('5', 'Jumat');
INSERT INTO `hari` VALUES ('6', 'Sabtu');
INSERT INTO `hari` VALUES ('7', 'Minggu');

-- ----------------------------
-- Table structure for `jadwal`
-- ----------------------------
DROP TABLE IF EXISTS `jadwal`;
CREATE TABLE `jadwal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` date NOT NULL,
  `jam_awal` time NOT NULL,
  `jam_akhir` time NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of jadwal
-- ----------------------------
INSERT INTO `jadwal` VALUES ('1', '2024-06-05', '15:00:00', '15:30:00');
INSERT INTO `jadwal` VALUES ('2', '2024-06-05', '15:30:00', '16:00:00');
INSERT INTO `jadwal` VALUES ('3', '2024-06-05', '16:00:00', '16:30:00');
INSERT INTO `jadwal` VALUES ('4', '2024-06-05', '16:30:00', '17:00:00');
INSERT INTO `jadwal` VALUES ('5', '2024-06-05', '17:00:00', '17:30:00');
INSERT INTO `jadwal` VALUES ('6', '2024-06-05', '17:30:00', '18:00:00');
INSERT INTO `jadwal` VALUES ('7', '2024-06-07', '13:00:00', '13:30:00');
INSERT INTO `jadwal` VALUES ('8', '2024-06-07', '13:30:00', '14:00:00');
INSERT INTO `jadwal` VALUES ('9', '2024-06-07', '14:00:00', '14:30:00');
INSERT INTO `jadwal` VALUES ('10', '2024-06-07', '14:30:00', '15:00:00');
INSERT INTO `jadwal` VALUES ('11', '2024-06-07', '15:00:00', '15:30:00');

-- ----------------------------
-- Table structure for `jadwal_dokter`
-- ----------------------------
DROP TABLE IF EXISTS `jadwal_dokter`;
CREATE TABLE `jadwal_dokter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_dokter` int(11) NOT NULL,
  `id_jadwal` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_dokter` (`id_dokter`) USING BTREE,
  KEY `fk_jadwal` (`id_jadwal`) USING BTREE,
  CONSTRAINT `fk_dokter` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jadwal` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of jadwal_dokter
-- ----------------------------
INSERT INTO `jadwal_dokter` VALUES ('1', '1', '1', '1');
INSERT INTO `jadwal_dokter` VALUES ('2', '1', '2', '1');
INSERT INTO `jadwal_dokter` VALUES ('3', '1', '3', '1');
INSERT INTO `jadwal_dokter` VALUES ('4', '1', '4', '1');
INSERT INTO `jadwal_dokter` VALUES ('5', '1', '5', '1');
INSERT INTO `jadwal_dokter` VALUES ('6', '1', '6', '1');
INSERT INTO `jadwal_dokter` VALUES ('8', '1', '7', '1');
INSERT INTO `jadwal_dokter` VALUES ('9', '1', '8', '1');
INSERT INTO `jadwal_dokter` VALUES ('10', '1', '9', '1');
INSERT INTO `jadwal_dokter` VALUES ('11', '1', '10', '1');
INSERT INTO `jadwal_dokter` VALUES ('12', '1', '11', '1');

-- ----------------------------
-- Table structure for `jam`
-- ----------------------------
DROP TABLE IF EXISTS `jam`;
CREATE TABLE `jam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jam_awal` time NOT NULL,
  `jam_akhir` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of jam
-- ----------------------------
INSERT INTO `jam` VALUES ('1', '08:00:00', '08:30:00');
INSERT INTO `jam` VALUES ('2', '08:30:00', '09:00:00');
INSERT INTO `jam` VALUES ('3', '09:00:00', '09:30:00');
INSERT INTO `jam` VALUES ('4', '09:30:00', '10:00:00');
INSERT INTO `jam` VALUES ('5', '10:00:00', '10:30:00');
INSERT INTO `jam` VALUES ('6', '10:30:00', '11:00:00');
INSERT INTO `jam` VALUES ('7', '11:00:00', '11:30:00');
INSERT INTO `jam` VALUES ('8', '11:30:00', '12:00:00');

-- ----------------------------
-- Table structure for `jam_kerja_dokter`
-- ----------------------------
DROP TABLE IF EXISTS `jam_kerja_dokter`;
CREATE TABLE `jam_kerja_dokter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_hari` int(11) NOT NULL,
  `id_jam` int(11) NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_JAM` (`id_jam`),
  KEY `FK_HARI` (`id_hari`),
  KEY `FK_DOKTERR` (`id_dokter`),
  CONSTRAINT `FK_DOKTERR` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id`),
  CONSTRAINT `FK_HARI` FOREIGN KEY (`id_hari`) REFERENCES `hari` (`id`),
  CONSTRAINT `FK_JAM` FOREIGN KEY (`id_jam`) REFERENCES `jam` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of jam_kerja_dokter
-- ----------------------------
INSERT INTO `jam_kerja_dokter` VALUES ('7', '1', '1', '1', '0');
INSERT INTO `jam_kerja_dokter` VALUES ('8', '1', '2', '1', '0');
INSERT INTO `jam_kerja_dokter` VALUES ('9', '3', '3', '1', '1');
INSERT INTO `jam_kerja_dokter` VALUES ('10', '3', '4', '1', '0');
INSERT INTO `jam_kerja_dokter` VALUES ('11', '5', '5', '1', '0');
INSERT INTO `jam_kerja_dokter` VALUES ('12', '5', '6', '1', '0');
INSERT INTO `jam_kerja_dokter` VALUES ('13', '2', '7', '2', '0');
INSERT INTO `jam_kerja_dokter` VALUES ('14', '2', '8', '2', '0');

-- ----------------------------
-- Table structure for `obat`
-- ----------------------------
DROP TABLE IF EXISTS `obat`;
CREATE TABLE `obat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `dosis` varchar(255) NOT NULL,
  `pemakaian` varchar(255) NOT NULL,
  `harga` varchar(255) NOT NULL,
  `foto` int(11) NOT NULL,
  `id_spesialis` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_spesialis` (`id_spesialis`),
  KEY `ix_obat_id` (`id`),
  CONSTRAINT `obat_ibfk_1` FOREIGN KEY (`id_spesialis`) REFERENCES `spesialis` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of obat
-- ----------------------------

-- ----------------------------
-- Table structure for `profil`
-- ----------------------------
DROP TABLE IF EXISTS `profil`;
CREATE TABLE `profil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL DEFAULT '',
  `jenis_kelamin` varchar(255) NOT NULL DEFAULT '',
  `notelp` varchar(255) NOT NULL DEFAULT '',
  `tanggal_lahir` date NOT NULL,
  `foto` varchar(255) NOT NULL DEFAULT '',
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_users` (`id_user`) USING BTREE,
  CONSTRAINT `fk_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of profil
-- ----------------------------
INSERT INTO `profil` VALUES ('1', 'Naufal Nabil Anugrah', 'Laki - Laki', '085112341234', '2024-05-22', 'profile8.jpg', '8');
INSERT INTO `profil` VALUES ('2', 'Muhammad Rifky Afandi', 'Laki - Laki', '0812312341234', '2024-04-09', 'profile9.jpg', '10');

-- ----------------------------
-- Table structure for `profil_lain`
-- ----------------------------
DROP TABLE IF EXISTS `profil_lain`;
CREATE TABLE `profil_lain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL DEFAULT '',
  `jenis_kelamin` varchar(255) NOT NULL DEFAULT '',
  `tanggal_lahir` date NOT NULL,
  `foto` varchar(255) NOT NULL DEFAULT '',
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_user` (`id_user`) USING BTREE,
  CONSTRAINT `fk_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of profil_lain
-- ----------------------------

-- ----------------------------
-- Table structure for `reservasi`
-- ----------------------------
DROP TABLE IF EXISTS `reservasi`;
CREATE TABLE `reservasi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` date NOT NULL,
  `biaya` varchar(255) NOT NULL DEFAULT '',
  `id_daftar_profil` int(11) NOT NULL,
  `id_jam_kerja_dokter` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_daftar_profil` (`id_daftar_profil`) USING BTREE,
  KEY `fk_jadwall` (`id_jam_kerja_dokter`),
  CONSTRAINT `fk_daftar_profil` FOREIGN KEY (`id_daftar_profil`) REFERENCES `daftar_profil` (`id`),
  CONSTRAINT `fk_jadwall` FOREIGN KEY (`id_jam_kerja_dokter`) REFERENCES `jam_kerja_dokter` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of reservasi
-- ----------------------------

-- ----------------------------
-- Table structure for `spesialis`
-- ----------------------------
DROP TABLE IF EXISTS `spesialis`;
CREATE TABLE `spesialis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL DEFAULT '',
  `foto` varchar(255) NOT NULL DEFAULT '',
  `pengertian` text NOT NULL,
  `kondisi` text NOT NULL,
  `pengobatan` text NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of spesialis
-- ----------------------------
INSERT INTO `spesialis` VALUES ('1', 'Jantung', 'jantung.png', 'blablabalbalbabalab', 'asdsadadadadassd', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
INSERT INTO `spesialis` VALUES ('2', 'Gigi', 'gigi.png', 'wwwwwwwwwwwwwwwwwwwwwwwwwwwww', 'wwwwwwwwwwwwwwwwwww', 'wwwwwwwwwwwwwww');
INSERT INTO `spesialis` VALUES ('3', 'Anak', 'anak.png', 'wwwwwwwwwwwwww', 'wadadadadas', 'ssssssssssssssssssssssss');
INSERT INTO `spesialis` VALUES ('4', 'Umum', 'umum.png', 'aa', 'aewae', 'asdasddsa');

-- ----------------------------
-- Table structure for `token`
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token` (
  `access_token` varchar(450) NOT NULL,
  `refresh_token` varchar(450) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`access_token`) USING BTREE,
  KEY `id_user` (`id_user`) USING BTREE,
  CONSTRAINT `id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of token
-- ----------------------------

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`email`) USING BTREE,
  KEY `ix_users_id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('3', 'string', 'string');
INSERT INTO `users` VALUES ('4', 'yy@gmail.com', '$2b$12$mp2GnaD0Unqdes3MZSfSHeHgBeAc/A78GvaEoBx00yA');
INSERT INTO `users` VALUES ('5', 'sidiq@gmail.com', '$2b$12$UfppXbmUD9iywl6/7JzEnOvhxamWTg8B/AN/vKLq4H1');
INSERT INTO `users` VALUES ('6', 'coba@gmail.com', '$2b$12$CJfnWtntbdn70PKEi4L/B.lqe./t3QK7rqvDhbXkyVxXcfE6tAsrO');
INSERT INTO `users` VALUES ('7', 'nopal@gmail.com', '$2b$12$XCLcBWVvhLVUDAR0k9h6B./O2jCpVkfqMdB4yMY5GQ1nRmEnJZbUq');
INSERT INTO `users` VALUES ('8', 'nopal1@gmail.com', '$2b$12$AqeY4xhVMI.wiWlroUVzRe2VLVJmV9QnzQBiEKof6HzMaAz8hDFnq');
INSERT INTO `users` VALUES ('10', 'iki', '$2b$12$iydq4JbvC8/jHOxF7Tah5OrX02jXymoiMwJWvjYhRJAQU7g05aKwK');
INSERT INTO `users` VALUES ('11', 'sidiq', '$2b$12$Br.esnNzGCrjlap.q1P9vulwbZ2c4lwpgb9tjASs76hEnv4ma5rGi');
