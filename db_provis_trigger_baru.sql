/*
Navicat MySQL Data Transfer

Source Server         : koneksi01
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : db_provis

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2024-06-21 05:36:38
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
  CONSTRAINT `fk_profil` FOREIGN KEY (`id_profil`) REFERENCES `profil` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_profil_lain` FOREIGN KEY (`id_profil_lain`) REFERENCES `profil_lain` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of daftar_profil
-- ----------------------------
INSERT INTO `daftar_profil` VALUES ('1', '1', '1');
INSERT INTO `daftar_profil` VALUES ('2', '3', null);
INSERT INTO `daftar_profil` VALUES ('3', null, '2');
INSERT INTO `daftar_profil` VALUES ('4', null, null);
INSERT INTO `daftar_profil` VALUES ('5', null, null);
INSERT INTO `daftar_profil` VALUES ('6', null, null);
INSERT INTO `daftar_profil` VALUES ('7', null, '6');

-- ----------------------------
-- Table structure for `daftar_profil_penyakit`
-- ----------------------------
DROP TABLE IF EXISTS `daftar_profil_penyakit`;
CREATE TABLE `daftar_profil_penyakit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_daftar_profil` int(11) NOT NULL,
  `id_penyakit` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `id_reservasi` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_daftar_profil_profil_penyakit` (`id_daftar_profil`) USING BTREE,
  KEY `fk_penyakit_daftar_penyakit` (`id_penyakit`) USING BTREE,
  KEY `fk_reservasi` (`id_reservasi`) USING BTREE,
  CONSTRAINT `fk_daftar_profil_profil_penyakit` FOREIGN KEY (`id_daftar_profil`) REFERENCES `daftar_profil` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_penyakit_daftar_penyakit` FOREIGN KEY (`id_penyakit`) REFERENCES `penyakit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_reservasi` FOREIGN KEY (`id_reservasi`) REFERENCES `reservasi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of daftar_profil_penyakit
-- ----------------------------
INSERT INTO `daftar_profil_penyakit` VALUES ('10', '2', '8', '1', '9');
INSERT INTO `daftar_profil_penyakit` VALUES ('11', '2', '2', '1', '10');
INSERT INTO `daftar_profil_penyakit` VALUES ('12', '7', '10', '1', '11');
INSERT INTO `daftar_profil_penyakit` VALUES ('13', '3', '9', '1', '12');

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
  CONSTRAINT `id_spesialis` FOREIGN KEY (`id_spesialis`) REFERENCES `spesialis` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dokter
-- ----------------------------
INSERT INTO `dokter` VALUES ('1', 'dr. Aulia Putri', 'aulia_putri.png', '1');
INSERT INTO `dokter` VALUES ('2', 'dr. Budi Santoso', 'budi_santoso.png', '1');
INSERT INTO `dokter` VALUES ('3', 'dr. Clara Setiawan', 'clara_setiawan.png', '1');
INSERT INTO `dokter` VALUES ('4', 'dr. Dedi Kusuma', 'dedi_kusuma.png', '1');
INSERT INTO `dokter` VALUES ('5', 'dr. Eliza Putri', 'eliza_putri.png', '1');
INSERT INTO `dokter` VALUES ('6', 'dr. Fahmi Syahputra', 'fahmi_syahputra.png', '2');
INSERT INTO `dokter` VALUES ('7', 'dr. Gina Lestari', 'gina_lestari.png', '2');
INSERT INTO `dokter` VALUES ('8', 'dr. Hadi Wirawan', 'hadi_wirawan.png', '2');
INSERT INTO `dokter` VALUES ('9', 'dr. Indah Sari', 'indah_sari.png', '2');
INSERT INTO `dokter` VALUES ('10', 'dr. Joko Susanto', 'joko_susanto.png', '2');
INSERT INTO `dokter` VALUES ('11', 'dr. Kurniawan', 'kurniawan.png', '3');
INSERT INTO `dokter` VALUES ('12', 'dr. Lisa Permata', 'lisa_permata.png', '3');
INSERT INTO `dokter` VALUES ('13', 'dr. M. Arifin', 'm_arifin.png', '3');
INSERT INTO `dokter` VALUES ('14', 'dr. Nani Wijaya', 'nani_wijaya.png', '3');
INSERT INTO `dokter` VALUES ('15', 'dr. Oka Pratama', 'oka_pratama.png', '3');
INSERT INTO `dokter` VALUES ('16', 'dr. Prita Sari', 'prita_sari.png', '4');
INSERT INTO `dokter` VALUES ('17', 'dr. Qori Astuti', 'qori_astuti.png', '4');
INSERT INTO `dokter` VALUES ('18', 'dr. Rudi Hartono', 'rudi_hartono.png', '4');
INSERT INTO `dokter` VALUES ('19', 'dr. Sari Wulandari', 'sari_wulandari.png', '4');
INSERT INTO `dokter` VALUES ('20', 'dr. Tono Prasetyo', 'tono_prasetyo.png', '4');
INSERT INTO `dokter` VALUES ('21', 'dr. Umar Faruq', 'umar_faruq.png', '5');
INSERT INTO `dokter` VALUES ('22', 'dr. Vina Sari', 'vina_sari.png', '5');
INSERT INTO `dokter` VALUES ('23', 'dr. Wawan Setiawan', 'wawan_setiawan.png', '5');
INSERT INTO `dokter` VALUES ('24', 'dr. Xena Putri', 'xena_putri.png', '5');
INSERT INTO `dokter` VALUES ('25', 'dr. Yudi Permana', 'yudi_permana.png', '5');
INSERT INTO `dokter` VALUES ('26', 'dr. Zamzam Hariri', 'zamzam_hariri.png', '6');
INSERT INTO `dokter` VALUES ('27', 'dr. Aditya Wijaya', 'aditya_wijaya.png', '6');
INSERT INTO `dokter` VALUES ('28', 'dr. Bunga Melati', 'bunga_melati.png', '6');
INSERT INTO `dokter` VALUES ('29', 'dr. Candra Wibowo', 'candra_wibowo.png', '6');
INSERT INTO `dokter` VALUES ('30', 'dr. Dewi Sartika', 'dewi_sartika.png', '6');
INSERT INTO `dokter` VALUES ('31', 'dr. Edi Prasetyo', 'edi_prasetyo.png', '7');
INSERT INTO `dokter` VALUES ('32', 'dr. Fanny Permata', 'fanny_permata.png', '7');
INSERT INTO `dokter` VALUES ('33', 'dr. Gunawan Setiawan', 'gunawan_setiawan.png', '7');
INSERT INTO `dokter` VALUES ('34', 'dr. Hendra Wibowo', 'hendra_wibowo.png', '7');
INSERT INTO `dokter` VALUES ('35', 'dr. Intan Sari', 'intan_sari.png', '7');
INSERT INTO `dokter` VALUES ('36', 'dr. Jati Rahardjo', 'jati_rahardjo.png', '8');
INSERT INTO `dokter` VALUES ('37', 'dr. Kurnia Dewi', 'kurnia_dewi.png', '8');
INSERT INTO `dokter` VALUES ('38', 'dr. Lestari Putri', 'lestari_putri.png', '8');
INSERT INTO `dokter` VALUES ('39', 'dr. Mulyadi Kusuma', 'mulyadi_kusuma.png', '8');
INSERT INTO `dokter` VALUES ('40', 'dr. Nia Safitri', 'nia_safitri.png', '8');

-- ----------------------------
-- Table structure for `hari`
-- ----------------------------
DROP TABLE IF EXISTS `hari`;
CREATE TABLE `hari` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

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
-- Table structure for `jam`
-- ----------------------------
DROP TABLE IF EXISTS `jam`;
CREATE TABLE `jam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jam_awal` time NOT NULL,
  `jam_akhir` time NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

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
INSERT INTO `jam` VALUES ('9', '12:00:00', '12:30:00');
INSERT INTO `jam` VALUES ('10', '12:30:00', '13:00:00');
INSERT INTO `jam` VALUES ('11', '13:00:00', '13:30:00');
INSERT INTO `jam` VALUES ('12', '13:30:00', '14:00:00');
INSERT INTO `jam` VALUES ('13', '14:00:00', '14:30:00');
INSERT INTO `jam` VALUES ('14', '14:30:00', '15:00:00');
INSERT INTO `jam` VALUES ('15', '15:00:00', '15:30:00');
INSERT INTO `jam` VALUES ('16', '15:30:00', '16:00:00');
INSERT INTO `jam` VALUES ('17', '16:00:00', '16:30:00');
INSERT INTO `jam` VALUES ('18', '16:30:00', '17:00:00');
INSERT INTO `jam` VALUES ('19', '17:00:00', '17:30:00');
INSERT INTO `jam` VALUES ('20', '17:30:00', '18:00:00');
INSERT INTO `jam` VALUES ('21', '18:00:00', '18:30:00');
INSERT INTO `jam` VALUES ('22', '18:30:00', '19:00:00');
INSERT INTO `jam` VALUES ('23', '19:00:00', '19:30:00');
INSERT INTO `jam` VALUES ('24', '19:30:00', '20:00:00');

-- ----------------------------
-- Table structure for `jam_kerja_dokter`
-- ----------------------------
DROP TABLE IF EXISTS `jam_kerja_dokter`;
CREATE TABLE `jam_kerja_dokter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_hari` int(11) NOT NULL,
  `id_jam` int(11) NOT NULL,
  `id_dokter` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_JAM` (`id_jam`) USING BTREE,
  KEY `FK_HARI` (`id_hari`) USING BTREE,
  KEY `FK_DOKTERR` (`id_dokter`) USING BTREE,
  CONSTRAINT `FK_DOKTERR` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_HARI` FOREIGN KEY (`id_hari`) REFERENCES `hari` (`id`),
  CONSTRAINT `FK_JAM` FOREIGN KEY (`id_jam`) REFERENCES `jam` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=721 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of jam_kerja_dokter
-- ----------------------------
INSERT INTO `jam_kerja_dokter` VALUES ('1', '1', '1', '1');
INSERT INTO `jam_kerja_dokter` VALUES ('2', '1', '2', '1');
INSERT INTO `jam_kerja_dokter` VALUES ('3', '1', '3', '1');
INSERT INTO `jam_kerja_dokter` VALUES ('4', '1', '4', '1');
INSERT INTO `jam_kerja_dokter` VALUES ('5', '1', '5', '1');
INSERT INTO `jam_kerja_dokter` VALUES ('6', '1', '6', '1');
INSERT INTO `jam_kerja_dokter` VALUES ('7', '3', '1', '1');
INSERT INTO `jam_kerja_dokter` VALUES ('8', '3', '2', '1');
INSERT INTO `jam_kerja_dokter` VALUES ('9', '3', '3', '1');
INSERT INTO `jam_kerja_dokter` VALUES ('10', '3', '4', '1');
INSERT INTO `jam_kerja_dokter` VALUES ('11', '3', '5', '1');
INSERT INTO `jam_kerja_dokter` VALUES ('12', '3', '6', '1');
INSERT INTO `jam_kerja_dokter` VALUES ('13', '5', '1', '1');
INSERT INTO `jam_kerja_dokter` VALUES ('14', '5', '2', '1');
INSERT INTO `jam_kerja_dokter` VALUES ('15', '5', '3', '1');
INSERT INTO `jam_kerja_dokter` VALUES ('16', '5', '4', '1');
INSERT INTO `jam_kerja_dokter` VALUES ('17', '5', '5', '1');
INSERT INTO `jam_kerja_dokter` VALUES ('18', '5', '6', '1');
INSERT INTO `jam_kerja_dokter` VALUES ('19', '2', '7', '2');
INSERT INTO `jam_kerja_dokter` VALUES ('20', '2', '8', '2');
INSERT INTO `jam_kerja_dokter` VALUES ('21', '2', '9', '2');
INSERT INTO `jam_kerja_dokter` VALUES ('22', '2', '10', '2');
INSERT INTO `jam_kerja_dokter` VALUES ('23', '2', '11', '2');
INSERT INTO `jam_kerja_dokter` VALUES ('24', '2', '12', '2');
INSERT INTO `jam_kerja_dokter` VALUES ('25', '4', '7', '2');
INSERT INTO `jam_kerja_dokter` VALUES ('26', '4', '8', '2');
INSERT INTO `jam_kerja_dokter` VALUES ('27', '4', '9', '2');
INSERT INTO `jam_kerja_dokter` VALUES ('28', '4', '10', '2');
INSERT INTO `jam_kerja_dokter` VALUES ('29', '4', '11', '2');
INSERT INTO `jam_kerja_dokter` VALUES ('30', '4', '12', '2');
INSERT INTO `jam_kerja_dokter` VALUES ('31', '6', '7', '2');
INSERT INTO `jam_kerja_dokter` VALUES ('32', '6', '8', '2');
INSERT INTO `jam_kerja_dokter` VALUES ('33', '6', '9', '2');
INSERT INTO `jam_kerja_dokter` VALUES ('34', '6', '10', '2');
INSERT INTO `jam_kerja_dokter` VALUES ('35', '6', '11', '2');
INSERT INTO `jam_kerja_dokter` VALUES ('36', '6', '12', '2');
INSERT INTO `jam_kerja_dokter` VALUES ('37', '1', '13', '3');
INSERT INTO `jam_kerja_dokter` VALUES ('38', '1', '14', '3');
INSERT INTO `jam_kerja_dokter` VALUES ('39', '1', '15', '3');
INSERT INTO `jam_kerja_dokter` VALUES ('40', '1', '16', '3');
INSERT INTO `jam_kerja_dokter` VALUES ('41', '1', '17', '3');
INSERT INTO `jam_kerja_dokter` VALUES ('42', '1', '18', '3');
INSERT INTO `jam_kerja_dokter` VALUES ('43', '4', '13', '3');
INSERT INTO `jam_kerja_dokter` VALUES ('44', '4', '14', '3');
INSERT INTO `jam_kerja_dokter` VALUES ('45', '4', '15', '3');
INSERT INTO `jam_kerja_dokter` VALUES ('46', '4', '16', '3');
INSERT INTO `jam_kerja_dokter` VALUES ('47', '4', '17', '3');
INSERT INTO `jam_kerja_dokter` VALUES ('48', '4', '18', '3');
INSERT INTO `jam_kerja_dokter` VALUES ('49', '7', '13', '3');
INSERT INTO `jam_kerja_dokter` VALUES ('50', '7', '14', '3');
INSERT INTO `jam_kerja_dokter` VALUES ('51', '7', '15', '3');
INSERT INTO `jam_kerja_dokter` VALUES ('52', '7', '16', '3');
INSERT INTO `jam_kerja_dokter` VALUES ('53', '7', '17', '3');
INSERT INTO `jam_kerja_dokter` VALUES ('54', '7', '18', '3');
INSERT INTO `jam_kerja_dokter` VALUES ('55', '2', '19', '4');
INSERT INTO `jam_kerja_dokter` VALUES ('56', '2', '20', '4');
INSERT INTO `jam_kerja_dokter` VALUES ('57', '2', '21', '4');
INSERT INTO `jam_kerja_dokter` VALUES ('58', '2', '22', '4');
INSERT INTO `jam_kerja_dokter` VALUES ('59', '2', '23', '4');
INSERT INTO `jam_kerja_dokter` VALUES ('60', '2', '24', '4');
INSERT INTO `jam_kerja_dokter` VALUES ('61', '3', '19', '4');
INSERT INTO `jam_kerja_dokter` VALUES ('62', '3', '20', '4');
INSERT INTO `jam_kerja_dokter` VALUES ('63', '3', '21', '4');
INSERT INTO `jam_kerja_dokter` VALUES ('64', '3', '22', '4');
INSERT INTO `jam_kerja_dokter` VALUES ('65', '3', '23', '4');
INSERT INTO `jam_kerja_dokter` VALUES ('66', '3', '24', '4');
INSERT INTO `jam_kerja_dokter` VALUES ('67', '6', '19', '4');
INSERT INTO `jam_kerja_dokter` VALUES ('68', '6', '20', '4');
INSERT INTO `jam_kerja_dokter` VALUES ('69', '6', '21', '4');
INSERT INTO `jam_kerja_dokter` VALUES ('70', '6', '22', '4');
INSERT INTO `jam_kerja_dokter` VALUES ('71', '6', '23', '4');
INSERT INTO `jam_kerja_dokter` VALUES ('72', '6', '24', '4');
INSERT INTO `jam_kerja_dokter` VALUES ('73', '5', '13', '5');
INSERT INTO `jam_kerja_dokter` VALUES ('74', '5', '14', '5');
INSERT INTO `jam_kerja_dokter` VALUES ('75', '5', '15', '5');
INSERT INTO `jam_kerja_dokter` VALUES ('76', '5', '16', '5');
INSERT INTO `jam_kerja_dokter` VALUES ('77', '5', '17', '5');
INSERT INTO `jam_kerja_dokter` VALUES ('78', '5', '18', '5');
INSERT INTO `jam_kerja_dokter` VALUES ('79', '6', '13', '5');
INSERT INTO `jam_kerja_dokter` VALUES ('80', '6', '14', '5');
INSERT INTO `jam_kerja_dokter` VALUES ('81', '6', '15', '5');
INSERT INTO `jam_kerja_dokter` VALUES ('82', '6', '16', '5');
INSERT INTO `jam_kerja_dokter` VALUES ('83', '6', '17', '5');
INSERT INTO `jam_kerja_dokter` VALUES ('84', '6', '18', '5');
INSERT INTO `jam_kerja_dokter` VALUES ('85', '7', '1', '5');
INSERT INTO `jam_kerja_dokter` VALUES ('86', '7', '2', '5');
INSERT INTO `jam_kerja_dokter` VALUES ('87', '7', '3', '5');
INSERT INTO `jam_kerja_dokter` VALUES ('88', '7', '4', '5');
INSERT INTO `jam_kerja_dokter` VALUES ('89', '7', '5', '5');
INSERT INTO `jam_kerja_dokter` VALUES ('90', '7', '6', '5');
INSERT INTO `jam_kerja_dokter` VALUES ('91', '1', '1', '6');
INSERT INTO `jam_kerja_dokter` VALUES ('92', '1', '2', '6');
INSERT INTO `jam_kerja_dokter` VALUES ('93', '1', '3', '6');
INSERT INTO `jam_kerja_dokter` VALUES ('94', '1', '4', '6');
INSERT INTO `jam_kerja_dokter` VALUES ('95', '1', '5', '6');
INSERT INTO `jam_kerja_dokter` VALUES ('96', '1', '6', '6');
INSERT INTO `jam_kerja_dokter` VALUES ('97', '3', '1', '6');
INSERT INTO `jam_kerja_dokter` VALUES ('98', '3', '2', '6');
INSERT INTO `jam_kerja_dokter` VALUES ('99', '3', '3', '6');
INSERT INTO `jam_kerja_dokter` VALUES ('100', '3', '4', '6');
INSERT INTO `jam_kerja_dokter` VALUES ('101', '3', '5', '6');
INSERT INTO `jam_kerja_dokter` VALUES ('102', '3', '6', '6');
INSERT INTO `jam_kerja_dokter` VALUES ('103', '5', '1', '6');
INSERT INTO `jam_kerja_dokter` VALUES ('104', '5', '2', '6');
INSERT INTO `jam_kerja_dokter` VALUES ('105', '5', '3', '6');
INSERT INTO `jam_kerja_dokter` VALUES ('106', '5', '4', '6');
INSERT INTO `jam_kerja_dokter` VALUES ('107', '5', '5', '6');
INSERT INTO `jam_kerja_dokter` VALUES ('108', '5', '6', '6');
INSERT INTO `jam_kerja_dokter` VALUES ('109', '2', '7', '7');
INSERT INTO `jam_kerja_dokter` VALUES ('110', '2', '8', '7');
INSERT INTO `jam_kerja_dokter` VALUES ('111', '2', '9', '7');
INSERT INTO `jam_kerja_dokter` VALUES ('112', '2', '10', '7');
INSERT INTO `jam_kerja_dokter` VALUES ('113', '2', '11', '7');
INSERT INTO `jam_kerja_dokter` VALUES ('114', '2', '12', '7');
INSERT INTO `jam_kerja_dokter` VALUES ('115', '4', '7', '7');
INSERT INTO `jam_kerja_dokter` VALUES ('116', '4', '8', '7');
INSERT INTO `jam_kerja_dokter` VALUES ('117', '4', '9', '7');
INSERT INTO `jam_kerja_dokter` VALUES ('118', '4', '10', '7');
INSERT INTO `jam_kerja_dokter` VALUES ('119', '4', '11', '7');
INSERT INTO `jam_kerja_dokter` VALUES ('120', '4', '12', '7');
INSERT INTO `jam_kerja_dokter` VALUES ('121', '6', '7', '7');
INSERT INTO `jam_kerja_dokter` VALUES ('122', '6', '8', '7');
INSERT INTO `jam_kerja_dokter` VALUES ('123', '6', '9', '7');
INSERT INTO `jam_kerja_dokter` VALUES ('124', '6', '10', '7');
INSERT INTO `jam_kerja_dokter` VALUES ('125', '6', '11', '7');
INSERT INTO `jam_kerja_dokter` VALUES ('126', '6', '12', '7');
INSERT INTO `jam_kerja_dokter` VALUES ('127', '1', '13', '8');
INSERT INTO `jam_kerja_dokter` VALUES ('128', '1', '14', '8');
INSERT INTO `jam_kerja_dokter` VALUES ('129', '1', '15', '8');
INSERT INTO `jam_kerja_dokter` VALUES ('130', '1', '16', '8');
INSERT INTO `jam_kerja_dokter` VALUES ('131', '1', '17', '8');
INSERT INTO `jam_kerja_dokter` VALUES ('132', '1', '18', '8');
INSERT INTO `jam_kerja_dokter` VALUES ('133', '4', '13', '8');
INSERT INTO `jam_kerja_dokter` VALUES ('134', '4', '14', '8');
INSERT INTO `jam_kerja_dokter` VALUES ('135', '4', '15', '8');
INSERT INTO `jam_kerja_dokter` VALUES ('136', '4', '16', '8');
INSERT INTO `jam_kerja_dokter` VALUES ('137', '4', '17', '8');
INSERT INTO `jam_kerja_dokter` VALUES ('138', '4', '18', '8');
INSERT INTO `jam_kerja_dokter` VALUES ('139', '7', '13', '8');
INSERT INTO `jam_kerja_dokter` VALUES ('140', '7', '14', '8');
INSERT INTO `jam_kerja_dokter` VALUES ('141', '7', '15', '8');
INSERT INTO `jam_kerja_dokter` VALUES ('142', '7', '16', '8');
INSERT INTO `jam_kerja_dokter` VALUES ('143', '7', '17', '8');
INSERT INTO `jam_kerja_dokter` VALUES ('144', '7', '18', '8');
INSERT INTO `jam_kerja_dokter` VALUES ('145', '2', '19', '9');
INSERT INTO `jam_kerja_dokter` VALUES ('146', '2', '20', '9');
INSERT INTO `jam_kerja_dokter` VALUES ('147', '2', '21', '9');
INSERT INTO `jam_kerja_dokter` VALUES ('148', '2', '22', '9');
INSERT INTO `jam_kerja_dokter` VALUES ('149', '2', '23', '9');
INSERT INTO `jam_kerja_dokter` VALUES ('150', '2', '24', '9');
INSERT INTO `jam_kerja_dokter` VALUES ('151', '3', '19', '9');
INSERT INTO `jam_kerja_dokter` VALUES ('152', '3', '20', '9');
INSERT INTO `jam_kerja_dokter` VALUES ('153', '3', '21', '9');
INSERT INTO `jam_kerja_dokter` VALUES ('154', '3', '22', '9');
INSERT INTO `jam_kerja_dokter` VALUES ('155', '3', '23', '9');
INSERT INTO `jam_kerja_dokter` VALUES ('156', '3', '24', '9');
INSERT INTO `jam_kerja_dokter` VALUES ('157', '6', '19', '9');
INSERT INTO `jam_kerja_dokter` VALUES ('158', '6', '20', '9');
INSERT INTO `jam_kerja_dokter` VALUES ('159', '6', '21', '9');
INSERT INTO `jam_kerja_dokter` VALUES ('160', '6', '22', '9');
INSERT INTO `jam_kerja_dokter` VALUES ('161', '6', '23', '9');
INSERT INTO `jam_kerja_dokter` VALUES ('162', '6', '24', '9');
INSERT INTO `jam_kerja_dokter` VALUES ('163', '5', '13', '10');
INSERT INTO `jam_kerja_dokter` VALUES ('164', '5', '14', '10');
INSERT INTO `jam_kerja_dokter` VALUES ('165', '5', '15', '10');
INSERT INTO `jam_kerja_dokter` VALUES ('166', '5', '16', '10');
INSERT INTO `jam_kerja_dokter` VALUES ('167', '5', '17', '10');
INSERT INTO `jam_kerja_dokter` VALUES ('168', '5', '18', '10');
INSERT INTO `jam_kerja_dokter` VALUES ('169', '6', '13', '10');
INSERT INTO `jam_kerja_dokter` VALUES ('170', '6', '14', '10');
INSERT INTO `jam_kerja_dokter` VALUES ('171', '6', '15', '10');
INSERT INTO `jam_kerja_dokter` VALUES ('172', '6', '16', '10');
INSERT INTO `jam_kerja_dokter` VALUES ('173', '6', '17', '10');
INSERT INTO `jam_kerja_dokter` VALUES ('174', '6', '18', '10');
INSERT INTO `jam_kerja_dokter` VALUES ('175', '7', '1', '10');
INSERT INTO `jam_kerja_dokter` VALUES ('176', '7', '2', '10');
INSERT INTO `jam_kerja_dokter` VALUES ('177', '7', '3', '10');
INSERT INTO `jam_kerja_dokter` VALUES ('178', '7', '4', '10');
INSERT INTO `jam_kerja_dokter` VALUES ('179', '7', '5', '10');
INSERT INTO `jam_kerja_dokter` VALUES ('180', '7', '6', '10');
INSERT INTO `jam_kerja_dokter` VALUES ('181', '1', '1', '11');
INSERT INTO `jam_kerja_dokter` VALUES ('182', '1', '2', '11');
INSERT INTO `jam_kerja_dokter` VALUES ('183', '1', '3', '11');
INSERT INTO `jam_kerja_dokter` VALUES ('184', '1', '4', '11');
INSERT INTO `jam_kerja_dokter` VALUES ('185', '1', '5', '11');
INSERT INTO `jam_kerja_dokter` VALUES ('186', '1', '6', '11');
INSERT INTO `jam_kerja_dokter` VALUES ('187', '3', '1', '11');
INSERT INTO `jam_kerja_dokter` VALUES ('188', '3', '2', '11');
INSERT INTO `jam_kerja_dokter` VALUES ('189', '3', '3', '11');
INSERT INTO `jam_kerja_dokter` VALUES ('190', '3', '4', '11');
INSERT INTO `jam_kerja_dokter` VALUES ('191', '3', '5', '11');
INSERT INTO `jam_kerja_dokter` VALUES ('192', '3', '6', '11');
INSERT INTO `jam_kerja_dokter` VALUES ('193', '5', '1', '11');
INSERT INTO `jam_kerja_dokter` VALUES ('194', '5', '2', '11');
INSERT INTO `jam_kerja_dokter` VALUES ('195', '5', '3', '11');
INSERT INTO `jam_kerja_dokter` VALUES ('196', '5', '4', '11');
INSERT INTO `jam_kerja_dokter` VALUES ('197', '5', '5', '11');
INSERT INTO `jam_kerja_dokter` VALUES ('198', '5', '6', '11');
INSERT INTO `jam_kerja_dokter` VALUES ('199', '2', '7', '12');
INSERT INTO `jam_kerja_dokter` VALUES ('200', '2', '8', '12');
INSERT INTO `jam_kerja_dokter` VALUES ('201', '2', '9', '12');
INSERT INTO `jam_kerja_dokter` VALUES ('202', '2', '10', '12');
INSERT INTO `jam_kerja_dokter` VALUES ('203', '2', '11', '12');
INSERT INTO `jam_kerja_dokter` VALUES ('204', '2', '12', '12');
INSERT INTO `jam_kerja_dokter` VALUES ('205', '4', '7', '12');
INSERT INTO `jam_kerja_dokter` VALUES ('206', '4', '8', '12');
INSERT INTO `jam_kerja_dokter` VALUES ('207', '4', '9', '12');
INSERT INTO `jam_kerja_dokter` VALUES ('208', '4', '10', '12');
INSERT INTO `jam_kerja_dokter` VALUES ('209', '4', '11', '12');
INSERT INTO `jam_kerja_dokter` VALUES ('210', '4', '12', '12');
INSERT INTO `jam_kerja_dokter` VALUES ('211', '6', '7', '12');
INSERT INTO `jam_kerja_dokter` VALUES ('212', '6', '8', '12');
INSERT INTO `jam_kerja_dokter` VALUES ('213', '6', '9', '12');
INSERT INTO `jam_kerja_dokter` VALUES ('214', '6', '10', '12');
INSERT INTO `jam_kerja_dokter` VALUES ('215', '6', '11', '12');
INSERT INTO `jam_kerja_dokter` VALUES ('216', '6', '12', '12');
INSERT INTO `jam_kerja_dokter` VALUES ('217', '1', '13', '13');
INSERT INTO `jam_kerja_dokter` VALUES ('218', '1', '14', '13');
INSERT INTO `jam_kerja_dokter` VALUES ('219', '1', '15', '13');
INSERT INTO `jam_kerja_dokter` VALUES ('220', '1', '16', '13');
INSERT INTO `jam_kerja_dokter` VALUES ('221', '1', '17', '13');
INSERT INTO `jam_kerja_dokter` VALUES ('222', '1', '18', '13');
INSERT INTO `jam_kerja_dokter` VALUES ('223', '4', '13', '13');
INSERT INTO `jam_kerja_dokter` VALUES ('224', '4', '14', '13');
INSERT INTO `jam_kerja_dokter` VALUES ('225', '4', '15', '13');
INSERT INTO `jam_kerja_dokter` VALUES ('226', '4', '16', '13');
INSERT INTO `jam_kerja_dokter` VALUES ('227', '4', '17', '13');
INSERT INTO `jam_kerja_dokter` VALUES ('228', '4', '18', '13');
INSERT INTO `jam_kerja_dokter` VALUES ('229', '7', '13', '13');
INSERT INTO `jam_kerja_dokter` VALUES ('230', '7', '14', '13');
INSERT INTO `jam_kerja_dokter` VALUES ('231', '7', '15', '13');
INSERT INTO `jam_kerja_dokter` VALUES ('232', '7', '16', '13');
INSERT INTO `jam_kerja_dokter` VALUES ('233', '7', '17', '13');
INSERT INTO `jam_kerja_dokter` VALUES ('234', '7', '18', '13');
INSERT INTO `jam_kerja_dokter` VALUES ('235', '2', '19', '14');
INSERT INTO `jam_kerja_dokter` VALUES ('236', '2', '20', '14');
INSERT INTO `jam_kerja_dokter` VALUES ('237', '2', '21', '14');
INSERT INTO `jam_kerja_dokter` VALUES ('238', '2', '22', '14');
INSERT INTO `jam_kerja_dokter` VALUES ('239', '2', '23', '14');
INSERT INTO `jam_kerja_dokter` VALUES ('240', '2', '24', '14');
INSERT INTO `jam_kerja_dokter` VALUES ('241', '3', '19', '14');
INSERT INTO `jam_kerja_dokter` VALUES ('242', '3', '20', '14');
INSERT INTO `jam_kerja_dokter` VALUES ('243', '3', '21', '14');
INSERT INTO `jam_kerja_dokter` VALUES ('244', '3', '22', '14');
INSERT INTO `jam_kerja_dokter` VALUES ('245', '3', '23', '14');
INSERT INTO `jam_kerja_dokter` VALUES ('246', '3', '24', '14');
INSERT INTO `jam_kerja_dokter` VALUES ('247', '6', '19', '14');
INSERT INTO `jam_kerja_dokter` VALUES ('248', '6', '20', '14');
INSERT INTO `jam_kerja_dokter` VALUES ('249', '6', '21', '14');
INSERT INTO `jam_kerja_dokter` VALUES ('250', '6', '22', '14');
INSERT INTO `jam_kerja_dokter` VALUES ('251', '6', '23', '14');
INSERT INTO `jam_kerja_dokter` VALUES ('252', '6', '24', '14');
INSERT INTO `jam_kerja_dokter` VALUES ('253', '5', '13', '15');
INSERT INTO `jam_kerja_dokter` VALUES ('254', '5', '14', '15');
INSERT INTO `jam_kerja_dokter` VALUES ('255', '5', '15', '15');
INSERT INTO `jam_kerja_dokter` VALUES ('256', '5', '16', '15');
INSERT INTO `jam_kerja_dokter` VALUES ('257', '5', '17', '15');
INSERT INTO `jam_kerja_dokter` VALUES ('258', '5', '18', '15');
INSERT INTO `jam_kerja_dokter` VALUES ('259', '6', '13', '15');
INSERT INTO `jam_kerja_dokter` VALUES ('260', '6', '14', '15');
INSERT INTO `jam_kerja_dokter` VALUES ('261', '6', '15', '15');
INSERT INTO `jam_kerja_dokter` VALUES ('262', '6', '16', '15');
INSERT INTO `jam_kerja_dokter` VALUES ('263', '6', '17', '15');
INSERT INTO `jam_kerja_dokter` VALUES ('264', '6', '18', '15');
INSERT INTO `jam_kerja_dokter` VALUES ('265', '7', '1', '15');
INSERT INTO `jam_kerja_dokter` VALUES ('266', '7', '2', '15');
INSERT INTO `jam_kerja_dokter` VALUES ('267', '7', '3', '15');
INSERT INTO `jam_kerja_dokter` VALUES ('268', '7', '4', '15');
INSERT INTO `jam_kerja_dokter` VALUES ('269', '7', '5', '15');
INSERT INTO `jam_kerja_dokter` VALUES ('270', '7', '6', '15');
INSERT INTO `jam_kerja_dokter` VALUES ('271', '1', '1', '16');
INSERT INTO `jam_kerja_dokter` VALUES ('272', '1', '2', '16');
INSERT INTO `jam_kerja_dokter` VALUES ('273', '1', '3', '16');
INSERT INTO `jam_kerja_dokter` VALUES ('274', '1', '4', '16');
INSERT INTO `jam_kerja_dokter` VALUES ('275', '1', '5', '16');
INSERT INTO `jam_kerja_dokter` VALUES ('276', '1', '6', '16');
INSERT INTO `jam_kerja_dokter` VALUES ('277', '3', '1', '16');
INSERT INTO `jam_kerja_dokter` VALUES ('278', '3', '2', '16');
INSERT INTO `jam_kerja_dokter` VALUES ('279', '3', '3', '16');
INSERT INTO `jam_kerja_dokter` VALUES ('280', '3', '4', '16');
INSERT INTO `jam_kerja_dokter` VALUES ('281', '3', '5', '16');
INSERT INTO `jam_kerja_dokter` VALUES ('282', '3', '6', '16');
INSERT INTO `jam_kerja_dokter` VALUES ('283', '5', '1', '16');
INSERT INTO `jam_kerja_dokter` VALUES ('284', '5', '2', '16');
INSERT INTO `jam_kerja_dokter` VALUES ('285', '5', '3', '16');
INSERT INTO `jam_kerja_dokter` VALUES ('286', '5', '4', '16');
INSERT INTO `jam_kerja_dokter` VALUES ('287', '5', '5', '16');
INSERT INTO `jam_kerja_dokter` VALUES ('288', '5', '6', '16');
INSERT INTO `jam_kerja_dokter` VALUES ('289', '2', '7', '17');
INSERT INTO `jam_kerja_dokter` VALUES ('290', '2', '8', '17');
INSERT INTO `jam_kerja_dokter` VALUES ('291', '2', '9', '17');
INSERT INTO `jam_kerja_dokter` VALUES ('292', '2', '10', '17');
INSERT INTO `jam_kerja_dokter` VALUES ('293', '2', '11', '17');
INSERT INTO `jam_kerja_dokter` VALUES ('294', '2', '12', '17');
INSERT INTO `jam_kerja_dokter` VALUES ('295', '4', '7', '17');
INSERT INTO `jam_kerja_dokter` VALUES ('296', '4', '8', '17');
INSERT INTO `jam_kerja_dokter` VALUES ('297', '4', '9', '17');
INSERT INTO `jam_kerja_dokter` VALUES ('298', '4', '10', '17');
INSERT INTO `jam_kerja_dokter` VALUES ('299', '4', '11', '17');
INSERT INTO `jam_kerja_dokter` VALUES ('300', '4', '12', '17');
INSERT INTO `jam_kerja_dokter` VALUES ('301', '6', '7', '17');
INSERT INTO `jam_kerja_dokter` VALUES ('302', '6', '8', '17');
INSERT INTO `jam_kerja_dokter` VALUES ('303', '6', '9', '17');
INSERT INTO `jam_kerja_dokter` VALUES ('304', '6', '10', '17');
INSERT INTO `jam_kerja_dokter` VALUES ('305', '6', '11', '17');
INSERT INTO `jam_kerja_dokter` VALUES ('306', '6', '12', '17');
INSERT INTO `jam_kerja_dokter` VALUES ('307', '1', '13', '18');
INSERT INTO `jam_kerja_dokter` VALUES ('308', '1', '14', '18');
INSERT INTO `jam_kerja_dokter` VALUES ('309', '1', '15', '18');
INSERT INTO `jam_kerja_dokter` VALUES ('310', '1', '16', '18');
INSERT INTO `jam_kerja_dokter` VALUES ('311', '1', '17', '18');
INSERT INTO `jam_kerja_dokter` VALUES ('312', '1', '18', '18');
INSERT INTO `jam_kerja_dokter` VALUES ('313', '4', '13', '18');
INSERT INTO `jam_kerja_dokter` VALUES ('314', '4', '14', '18');
INSERT INTO `jam_kerja_dokter` VALUES ('315', '4', '15', '18');
INSERT INTO `jam_kerja_dokter` VALUES ('316', '4', '16', '18');
INSERT INTO `jam_kerja_dokter` VALUES ('317', '4', '17', '18');
INSERT INTO `jam_kerja_dokter` VALUES ('318', '4', '18', '18');
INSERT INTO `jam_kerja_dokter` VALUES ('319', '7', '13', '18');
INSERT INTO `jam_kerja_dokter` VALUES ('320', '7', '14', '18');
INSERT INTO `jam_kerja_dokter` VALUES ('321', '7', '15', '18');
INSERT INTO `jam_kerja_dokter` VALUES ('322', '7', '16', '18');
INSERT INTO `jam_kerja_dokter` VALUES ('323', '7', '17', '18');
INSERT INTO `jam_kerja_dokter` VALUES ('324', '7', '18', '18');
INSERT INTO `jam_kerja_dokter` VALUES ('325', '2', '19', '19');
INSERT INTO `jam_kerja_dokter` VALUES ('326', '2', '20', '19');
INSERT INTO `jam_kerja_dokter` VALUES ('327', '2', '21', '19');
INSERT INTO `jam_kerja_dokter` VALUES ('328', '2', '22', '19');
INSERT INTO `jam_kerja_dokter` VALUES ('329', '2', '23', '19');
INSERT INTO `jam_kerja_dokter` VALUES ('330', '2', '24', '19');
INSERT INTO `jam_kerja_dokter` VALUES ('331', '3', '19', '19');
INSERT INTO `jam_kerja_dokter` VALUES ('332', '3', '20', '19');
INSERT INTO `jam_kerja_dokter` VALUES ('333', '3', '21', '19');
INSERT INTO `jam_kerja_dokter` VALUES ('334', '3', '22', '19');
INSERT INTO `jam_kerja_dokter` VALUES ('335', '3', '23', '19');
INSERT INTO `jam_kerja_dokter` VALUES ('336', '3', '24', '19');
INSERT INTO `jam_kerja_dokter` VALUES ('337', '6', '19', '19');
INSERT INTO `jam_kerja_dokter` VALUES ('338', '6', '20', '19');
INSERT INTO `jam_kerja_dokter` VALUES ('339', '6', '21', '19');
INSERT INTO `jam_kerja_dokter` VALUES ('340', '6', '22', '19');
INSERT INTO `jam_kerja_dokter` VALUES ('341', '6', '23', '19');
INSERT INTO `jam_kerja_dokter` VALUES ('342', '6', '24', '19');
INSERT INTO `jam_kerja_dokter` VALUES ('343', '5', '13', '20');
INSERT INTO `jam_kerja_dokter` VALUES ('344', '5', '14', '20');
INSERT INTO `jam_kerja_dokter` VALUES ('345', '5', '15', '20');
INSERT INTO `jam_kerja_dokter` VALUES ('346', '5', '16', '20');
INSERT INTO `jam_kerja_dokter` VALUES ('347', '5', '17', '20');
INSERT INTO `jam_kerja_dokter` VALUES ('348', '5', '18', '20');
INSERT INTO `jam_kerja_dokter` VALUES ('349', '6', '13', '20');
INSERT INTO `jam_kerja_dokter` VALUES ('350', '6', '14', '20');
INSERT INTO `jam_kerja_dokter` VALUES ('351', '6', '15', '20');
INSERT INTO `jam_kerja_dokter` VALUES ('352', '6', '16', '20');
INSERT INTO `jam_kerja_dokter` VALUES ('353', '6', '17', '20');
INSERT INTO `jam_kerja_dokter` VALUES ('354', '6', '18', '20');
INSERT INTO `jam_kerja_dokter` VALUES ('355', '7', '1', '20');
INSERT INTO `jam_kerja_dokter` VALUES ('356', '7', '2', '20');
INSERT INTO `jam_kerja_dokter` VALUES ('357', '7', '3', '20');
INSERT INTO `jam_kerja_dokter` VALUES ('358', '7', '4', '20');
INSERT INTO `jam_kerja_dokter` VALUES ('359', '7', '5', '20');
INSERT INTO `jam_kerja_dokter` VALUES ('360', '7', '6', '20');
INSERT INTO `jam_kerja_dokter` VALUES ('361', '1', '1', '21');
INSERT INTO `jam_kerja_dokter` VALUES ('362', '1', '2', '21');
INSERT INTO `jam_kerja_dokter` VALUES ('363', '1', '3', '21');
INSERT INTO `jam_kerja_dokter` VALUES ('364', '1', '4', '21');
INSERT INTO `jam_kerja_dokter` VALUES ('365', '1', '5', '21');
INSERT INTO `jam_kerja_dokter` VALUES ('366', '1', '6', '21');
INSERT INTO `jam_kerja_dokter` VALUES ('367', '3', '1', '21');
INSERT INTO `jam_kerja_dokter` VALUES ('368', '3', '2', '21');
INSERT INTO `jam_kerja_dokter` VALUES ('369', '3', '3', '21');
INSERT INTO `jam_kerja_dokter` VALUES ('370', '3', '4', '21');
INSERT INTO `jam_kerja_dokter` VALUES ('371', '3', '5', '21');
INSERT INTO `jam_kerja_dokter` VALUES ('372', '3', '6', '21');
INSERT INTO `jam_kerja_dokter` VALUES ('373', '5', '1', '21');
INSERT INTO `jam_kerja_dokter` VALUES ('374', '5', '2', '21');
INSERT INTO `jam_kerja_dokter` VALUES ('375', '5', '3', '21');
INSERT INTO `jam_kerja_dokter` VALUES ('376', '5', '4', '21');
INSERT INTO `jam_kerja_dokter` VALUES ('377', '5', '5', '21');
INSERT INTO `jam_kerja_dokter` VALUES ('378', '5', '6', '21');
INSERT INTO `jam_kerja_dokter` VALUES ('379', '2', '7', '22');
INSERT INTO `jam_kerja_dokter` VALUES ('380', '2', '8', '22');
INSERT INTO `jam_kerja_dokter` VALUES ('381', '2', '9', '22');
INSERT INTO `jam_kerja_dokter` VALUES ('382', '2', '10', '22');
INSERT INTO `jam_kerja_dokter` VALUES ('383', '2', '11', '22');
INSERT INTO `jam_kerja_dokter` VALUES ('384', '2', '12', '22');
INSERT INTO `jam_kerja_dokter` VALUES ('385', '4', '7', '22');
INSERT INTO `jam_kerja_dokter` VALUES ('386', '4', '8', '22');
INSERT INTO `jam_kerja_dokter` VALUES ('387', '4', '9', '22');
INSERT INTO `jam_kerja_dokter` VALUES ('388', '4', '10', '22');
INSERT INTO `jam_kerja_dokter` VALUES ('389', '4', '11', '22');
INSERT INTO `jam_kerja_dokter` VALUES ('390', '4', '12', '22');
INSERT INTO `jam_kerja_dokter` VALUES ('391', '6', '7', '22');
INSERT INTO `jam_kerja_dokter` VALUES ('392', '6', '8', '22');
INSERT INTO `jam_kerja_dokter` VALUES ('393', '6', '9', '22');
INSERT INTO `jam_kerja_dokter` VALUES ('394', '6', '10', '22');
INSERT INTO `jam_kerja_dokter` VALUES ('395', '6', '11', '22');
INSERT INTO `jam_kerja_dokter` VALUES ('396', '6', '12', '22');
INSERT INTO `jam_kerja_dokter` VALUES ('397', '1', '13', '23');
INSERT INTO `jam_kerja_dokter` VALUES ('398', '1', '14', '23');
INSERT INTO `jam_kerja_dokter` VALUES ('399', '1', '15', '23');
INSERT INTO `jam_kerja_dokter` VALUES ('400', '1', '16', '23');
INSERT INTO `jam_kerja_dokter` VALUES ('401', '1', '17', '23');
INSERT INTO `jam_kerja_dokter` VALUES ('402', '1', '18', '23');
INSERT INTO `jam_kerja_dokter` VALUES ('403', '4', '13', '23');
INSERT INTO `jam_kerja_dokter` VALUES ('404', '4', '14', '23');
INSERT INTO `jam_kerja_dokter` VALUES ('405', '4', '15', '23');
INSERT INTO `jam_kerja_dokter` VALUES ('406', '4', '16', '23');
INSERT INTO `jam_kerja_dokter` VALUES ('407', '4', '17', '23');
INSERT INTO `jam_kerja_dokter` VALUES ('408', '4', '18', '23');
INSERT INTO `jam_kerja_dokter` VALUES ('409', '7', '13', '23');
INSERT INTO `jam_kerja_dokter` VALUES ('410', '7', '14', '23');
INSERT INTO `jam_kerja_dokter` VALUES ('411', '7', '15', '23');
INSERT INTO `jam_kerja_dokter` VALUES ('412', '7', '16', '23');
INSERT INTO `jam_kerja_dokter` VALUES ('413', '7', '17', '23');
INSERT INTO `jam_kerja_dokter` VALUES ('414', '7', '18', '23');
INSERT INTO `jam_kerja_dokter` VALUES ('415', '2', '19', '24');
INSERT INTO `jam_kerja_dokter` VALUES ('416', '2', '20', '24');
INSERT INTO `jam_kerja_dokter` VALUES ('417', '2', '21', '24');
INSERT INTO `jam_kerja_dokter` VALUES ('418', '2', '22', '24');
INSERT INTO `jam_kerja_dokter` VALUES ('419', '2', '23', '24');
INSERT INTO `jam_kerja_dokter` VALUES ('420', '2', '24', '24');
INSERT INTO `jam_kerja_dokter` VALUES ('421', '3', '19', '24');
INSERT INTO `jam_kerja_dokter` VALUES ('422', '3', '20', '24');
INSERT INTO `jam_kerja_dokter` VALUES ('423', '3', '21', '24');
INSERT INTO `jam_kerja_dokter` VALUES ('424', '3', '22', '24');
INSERT INTO `jam_kerja_dokter` VALUES ('425', '3', '23', '24');
INSERT INTO `jam_kerja_dokter` VALUES ('426', '3', '24', '24');
INSERT INTO `jam_kerja_dokter` VALUES ('427', '6', '19', '24');
INSERT INTO `jam_kerja_dokter` VALUES ('428', '6', '20', '24');
INSERT INTO `jam_kerja_dokter` VALUES ('429', '6', '21', '24');
INSERT INTO `jam_kerja_dokter` VALUES ('430', '6', '22', '24');
INSERT INTO `jam_kerja_dokter` VALUES ('431', '6', '23', '24');
INSERT INTO `jam_kerja_dokter` VALUES ('432', '6', '24', '24');
INSERT INTO `jam_kerja_dokter` VALUES ('433', '5', '13', '25');
INSERT INTO `jam_kerja_dokter` VALUES ('434', '5', '14', '25');
INSERT INTO `jam_kerja_dokter` VALUES ('435', '5', '15', '25');
INSERT INTO `jam_kerja_dokter` VALUES ('436', '5', '16', '25');
INSERT INTO `jam_kerja_dokter` VALUES ('437', '5', '17', '25');
INSERT INTO `jam_kerja_dokter` VALUES ('438', '5', '18', '25');
INSERT INTO `jam_kerja_dokter` VALUES ('439', '6', '13', '25');
INSERT INTO `jam_kerja_dokter` VALUES ('440', '6', '14', '25');
INSERT INTO `jam_kerja_dokter` VALUES ('441', '6', '15', '25');
INSERT INTO `jam_kerja_dokter` VALUES ('442', '6', '16', '25');
INSERT INTO `jam_kerja_dokter` VALUES ('443', '6', '17', '25');
INSERT INTO `jam_kerja_dokter` VALUES ('444', '6', '18', '25');
INSERT INTO `jam_kerja_dokter` VALUES ('445', '7', '1', '25');
INSERT INTO `jam_kerja_dokter` VALUES ('446', '7', '2', '25');
INSERT INTO `jam_kerja_dokter` VALUES ('447', '7', '3', '25');
INSERT INTO `jam_kerja_dokter` VALUES ('448', '7', '4', '25');
INSERT INTO `jam_kerja_dokter` VALUES ('449', '7', '5', '25');
INSERT INTO `jam_kerja_dokter` VALUES ('450', '7', '6', '25');
INSERT INTO `jam_kerja_dokter` VALUES ('451', '1', '1', '26');
INSERT INTO `jam_kerja_dokter` VALUES ('452', '1', '2', '26');
INSERT INTO `jam_kerja_dokter` VALUES ('453', '1', '3', '26');
INSERT INTO `jam_kerja_dokter` VALUES ('454', '1', '4', '26');
INSERT INTO `jam_kerja_dokter` VALUES ('455', '1', '5', '26');
INSERT INTO `jam_kerja_dokter` VALUES ('456', '1', '6', '26');
INSERT INTO `jam_kerja_dokter` VALUES ('457', '3', '1', '26');
INSERT INTO `jam_kerja_dokter` VALUES ('458', '3', '2', '26');
INSERT INTO `jam_kerja_dokter` VALUES ('459', '3', '3', '26');
INSERT INTO `jam_kerja_dokter` VALUES ('460', '3', '4', '26');
INSERT INTO `jam_kerja_dokter` VALUES ('461', '3', '5', '26');
INSERT INTO `jam_kerja_dokter` VALUES ('462', '3', '6', '26');
INSERT INTO `jam_kerja_dokter` VALUES ('463', '5', '1', '26');
INSERT INTO `jam_kerja_dokter` VALUES ('464', '5', '2', '26');
INSERT INTO `jam_kerja_dokter` VALUES ('465', '5', '3', '26');
INSERT INTO `jam_kerja_dokter` VALUES ('466', '5', '4', '26');
INSERT INTO `jam_kerja_dokter` VALUES ('467', '5', '5', '26');
INSERT INTO `jam_kerja_dokter` VALUES ('468', '5', '6', '26');
INSERT INTO `jam_kerja_dokter` VALUES ('469', '2', '7', '27');
INSERT INTO `jam_kerja_dokter` VALUES ('470', '2', '8', '27');
INSERT INTO `jam_kerja_dokter` VALUES ('471', '2', '9', '27');
INSERT INTO `jam_kerja_dokter` VALUES ('472', '2', '10', '27');
INSERT INTO `jam_kerja_dokter` VALUES ('473', '2', '11', '27');
INSERT INTO `jam_kerja_dokter` VALUES ('474', '2', '12', '27');
INSERT INTO `jam_kerja_dokter` VALUES ('475', '4', '7', '27');
INSERT INTO `jam_kerja_dokter` VALUES ('476', '4', '8', '27');
INSERT INTO `jam_kerja_dokter` VALUES ('477', '4', '9', '27');
INSERT INTO `jam_kerja_dokter` VALUES ('478', '4', '10', '27');
INSERT INTO `jam_kerja_dokter` VALUES ('479', '4', '11', '27');
INSERT INTO `jam_kerja_dokter` VALUES ('480', '4', '12', '27');
INSERT INTO `jam_kerja_dokter` VALUES ('481', '6', '7', '27');
INSERT INTO `jam_kerja_dokter` VALUES ('482', '6', '8', '27');
INSERT INTO `jam_kerja_dokter` VALUES ('483', '6', '9', '27');
INSERT INTO `jam_kerja_dokter` VALUES ('484', '6', '10', '27');
INSERT INTO `jam_kerja_dokter` VALUES ('485', '6', '11', '27');
INSERT INTO `jam_kerja_dokter` VALUES ('486', '6', '12', '27');
INSERT INTO `jam_kerja_dokter` VALUES ('487', '1', '13', '28');
INSERT INTO `jam_kerja_dokter` VALUES ('488', '1', '14', '28');
INSERT INTO `jam_kerja_dokter` VALUES ('489', '1', '15', '28');
INSERT INTO `jam_kerja_dokter` VALUES ('490', '1', '16', '28');
INSERT INTO `jam_kerja_dokter` VALUES ('491', '1', '17', '28');
INSERT INTO `jam_kerja_dokter` VALUES ('492', '1', '18', '28');
INSERT INTO `jam_kerja_dokter` VALUES ('493', '4', '13', '28');
INSERT INTO `jam_kerja_dokter` VALUES ('494', '4', '14', '28');
INSERT INTO `jam_kerja_dokter` VALUES ('495', '4', '15', '28');
INSERT INTO `jam_kerja_dokter` VALUES ('496', '4', '16', '28');
INSERT INTO `jam_kerja_dokter` VALUES ('497', '4', '17', '28');
INSERT INTO `jam_kerja_dokter` VALUES ('498', '4', '18', '28');
INSERT INTO `jam_kerja_dokter` VALUES ('499', '7', '13', '28');
INSERT INTO `jam_kerja_dokter` VALUES ('500', '7', '14', '28');
INSERT INTO `jam_kerja_dokter` VALUES ('501', '7', '15', '28');
INSERT INTO `jam_kerja_dokter` VALUES ('502', '7', '16', '28');
INSERT INTO `jam_kerja_dokter` VALUES ('503', '7', '17', '28');
INSERT INTO `jam_kerja_dokter` VALUES ('504', '7', '18', '28');
INSERT INTO `jam_kerja_dokter` VALUES ('505', '2', '19', '29');
INSERT INTO `jam_kerja_dokter` VALUES ('506', '2', '20', '29');
INSERT INTO `jam_kerja_dokter` VALUES ('507', '2', '21', '29');
INSERT INTO `jam_kerja_dokter` VALUES ('508', '2', '22', '29');
INSERT INTO `jam_kerja_dokter` VALUES ('509', '2', '23', '29');
INSERT INTO `jam_kerja_dokter` VALUES ('510', '2', '24', '29');
INSERT INTO `jam_kerja_dokter` VALUES ('511', '3', '19', '29');
INSERT INTO `jam_kerja_dokter` VALUES ('512', '3', '20', '29');
INSERT INTO `jam_kerja_dokter` VALUES ('513', '3', '21', '29');
INSERT INTO `jam_kerja_dokter` VALUES ('514', '3', '22', '29');
INSERT INTO `jam_kerja_dokter` VALUES ('515', '3', '23', '29');
INSERT INTO `jam_kerja_dokter` VALUES ('516', '3', '24', '29');
INSERT INTO `jam_kerja_dokter` VALUES ('517', '6', '19', '29');
INSERT INTO `jam_kerja_dokter` VALUES ('518', '6', '20', '29');
INSERT INTO `jam_kerja_dokter` VALUES ('519', '6', '21', '29');
INSERT INTO `jam_kerja_dokter` VALUES ('520', '6', '22', '29');
INSERT INTO `jam_kerja_dokter` VALUES ('521', '6', '23', '29');
INSERT INTO `jam_kerja_dokter` VALUES ('522', '6', '24', '29');
INSERT INTO `jam_kerja_dokter` VALUES ('523', '5', '13', '30');
INSERT INTO `jam_kerja_dokter` VALUES ('524', '5', '14', '30');
INSERT INTO `jam_kerja_dokter` VALUES ('525', '5', '15', '30');
INSERT INTO `jam_kerja_dokter` VALUES ('526', '5', '16', '30');
INSERT INTO `jam_kerja_dokter` VALUES ('527', '5', '17', '30');
INSERT INTO `jam_kerja_dokter` VALUES ('528', '5', '18', '30');
INSERT INTO `jam_kerja_dokter` VALUES ('529', '6', '13', '30');
INSERT INTO `jam_kerja_dokter` VALUES ('530', '6', '14', '30');
INSERT INTO `jam_kerja_dokter` VALUES ('531', '6', '15', '30');
INSERT INTO `jam_kerja_dokter` VALUES ('532', '6', '16', '30');
INSERT INTO `jam_kerja_dokter` VALUES ('533', '6', '17', '30');
INSERT INTO `jam_kerja_dokter` VALUES ('534', '6', '18', '30');
INSERT INTO `jam_kerja_dokter` VALUES ('535', '7', '1', '30');
INSERT INTO `jam_kerja_dokter` VALUES ('536', '7', '2', '30');
INSERT INTO `jam_kerja_dokter` VALUES ('537', '7', '3', '30');
INSERT INTO `jam_kerja_dokter` VALUES ('538', '7', '4', '30');
INSERT INTO `jam_kerja_dokter` VALUES ('539', '7', '5', '30');
INSERT INTO `jam_kerja_dokter` VALUES ('540', '7', '6', '30');
INSERT INTO `jam_kerja_dokter` VALUES ('541', '1', '1', '31');
INSERT INTO `jam_kerja_dokter` VALUES ('542', '1', '2', '31');
INSERT INTO `jam_kerja_dokter` VALUES ('543', '1', '3', '31');
INSERT INTO `jam_kerja_dokter` VALUES ('544', '1', '4', '31');
INSERT INTO `jam_kerja_dokter` VALUES ('545', '1', '5', '31');
INSERT INTO `jam_kerja_dokter` VALUES ('546', '1', '6', '31');
INSERT INTO `jam_kerja_dokter` VALUES ('547', '3', '1', '31');
INSERT INTO `jam_kerja_dokter` VALUES ('548', '3', '2', '31');
INSERT INTO `jam_kerja_dokter` VALUES ('549', '3', '3', '31');
INSERT INTO `jam_kerja_dokter` VALUES ('550', '3', '4', '31');
INSERT INTO `jam_kerja_dokter` VALUES ('551', '3', '5', '31');
INSERT INTO `jam_kerja_dokter` VALUES ('552', '3', '6', '31');
INSERT INTO `jam_kerja_dokter` VALUES ('553', '5', '1', '31');
INSERT INTO `jam_kerja_dokter` VALUES ('554', '5', '2', '31');
INSERT INTO `jam_kerja_dokter` VALUES ('555', '5', '3', '31');
INSERT INTO `jam_kerja_dokter` VALUES ('556', '5', '4', '31');
INSERT INTO `jam_kerja_dokter` VALUES ('557', '5', '5', '31');
INSERT INTO `jam_kerja_dokter` VALUES ('558', '5', '6', '31');
INSERT INTO `jam_kerja_dokter` VALUES ('559', '2', '7', '32');
INSERT INTO `jam_kerja_dokter` VALUES ('560', '2', '8', '32');
INSERT INTO `jam_kerja_dokter` VALUES ('561', '2', '9', '32');
INSERT INTO `jam_kerja_dokter` VALUES ('562', '2', '10', '32');
INSERT INTO `jam_kerja_dokter` VALUES ('563', '2', '11', '32');
INSERT INTO `jam_kerja_dokter` VALUES ('564', '2', '12', '32');
INSERT INTO `jam_kerja_dokter` VALUES ('565', '4', '7', '32');
INSERT INTO `jam_kerja_dokter` VALUES ('566', '4', '8', '32');
INSERT INTO `jam_kerja_dokter` VALUES ('567', '4', '9', '32');
INSERT INTO `jam_kerja_dokter` VALUES ('568', '4', '10', '32');
INSERT INTO `jam_kerja_dokter` VALUES ('569', '4', '11', '32');
INSERT INTO `jam_kerja_dokter` VALUES ('570', '4', '12', '32');
INSERT INTO `jam_kerja_dokter` VALUES ('571', '6', '7', '32');
INSERT INTO `jam_kerja_dokter` VALUES ('572', '6', '8', '32');
INSERT INTO `jam_kerja_dokter` VALUES ('573', '6', '9', '32');
INSERT INTO `jam_kerja_dokter` VALUES ('574', '6', '10', '32');
INSERT INTO `jam_kerja_dokter` VALUES ('575', '6', '11', '32');
INSERT INTO `jam_kerja_dokter` VALUES ('576', '6', '12', '32');
INSERT INTO `jam_kerja_dokter` VALUES ('577', '1', '13', '33');
INSERT INTO `jam_kerja_dokter` VALUES ('578', '1', '14', '33');
INSERT INTO `jam_kerja_dokter` VALUES ('579', '1', '15', '33');
INSERT INTO `jam_kerja_dokter` VALUES ('580', '1', '16', '33');
INSERT INTO `jam_kerja_dokter` VALUES ('581', '1', '17', '33');
INSERT INTO `jam_kerja_dokter` VALUES ('582', '1', '18', '33');
INSERT INTO `jam_kerja_dokter` VALUES ('583', '4', '13', '33');
INSERT INTO `jam_kerja_dokter` VALUES ('584', '4', '14', '33');
INSERT INTO `jam_kerja_dokter` VALUES ('585', '4', '15', '33');
INSERT INTO `jam_kerja_dokter` VALUES ('586', '4', '16', '33');
INSERT INTO `jam_kerja_dokter` VALUES ('587', '4', '17', '33');
INSERT INTO `jam_kerja_dokter` VALUES ('588', '4', '18', '33');
INSERT INTO `jam_kerja_dokter` VALUES ('589', '7', '13', '33');
INSERT INTO `jam_kerja_dokter` VALUES ('590', '7', '14', '33');
INSERT INTO `jam_kerja_dokter` VALUES ('591', '7', '15', '33');
INSERT INTO `jam_kerja_dokter` VALUES ('592', '7', '16', '33');
INSERT INTO `jam_kerja_dokter` VALUES ('593', '7', '17', '33');
INSERT INTO `jam_kerja_dokter` VALUES ('594', '7', '18', '33');
INSERT INTO `jam_kerja_dokter` VALUES ('595', '2', '19', '34');
INSERT INTO `jam_kerja_dokter` VALUES ('596', '2', '20', '34');
INSERT INTO `jam_kerja_dokter` VALUES ('597', '2', '21', '34');
INSERT INTO `jam_kerja_dokter` VALUES ('598', '2', '22', '34');
INSERT INTO `jam_kerja_dokter` VALUES ('599', '2', '23', '34');
INSERT INTO `jam_kerja_dokter` VALUES ('600', '2', '24', '34');
INSERT INTO `jam_kerja_dokter` VALUES ('601', '3', '19', '34');
INSERT INTO `jam_kerja_dokter` VALUES ('602', '3', '20', '34');
INSERT INTO `jam_kerja_dokter` VALUES ('603', '3', '21', '34');
INSERT INTO `jam_kerja_dokter` VALUES ('604', '3', '22', '34');
INSERT INTO `jam_kerja_dokter` VALUES ('605', '3', '23', '34');
INSERT INTO `jam_kerja_dokter` VALUES ('606', '3', '24', '34');
INSERT INTO `jam_kerja_dokter` VALUES ('607', '6', '19', '34');
INSERT INTO `jam_kerja_dokter` VALUES ('608', '6', '20', '34');
INSERT INTO `jam_kerja_dokter` VALUES ('609', '6', '21', '34');
INSERT INTO `jam_kerja_dokter` VALUES ('610', '6', '22', '34');
INSERT INTO `jam_kerja_dokter` VALUES ('611', '6', '23', '34');
INSERT INTO `jam_kerja_dokter` VALUES ('612', '6', '24', '34');
INSERT INTO `jam_kerja_dokter` VALUES ('613', '5', '13', '35');
INSERT INTO `jam_kerja_dokter` VALUES ('614', '5', '14', '35');
INSERT INTO `jam_kerja_dokter` VALUES ('615', '5', '15', '35');
INSERT INTO `jam_kerja_dokter` VALUES ('616', '5', '16', '35');
INSERT INTO `jam_kerja_dokter` VALUES ('617', '5', '17', '35');
INSERT INTO `jam_kerja_dokter` VALUES ('618', '5', '18', '35');
INSERT INTO `jam_kerja_dokter` VALUES ('619', '6', '13', '35');
INSERT INTO `jam_kerja_dokter` VALUES ('620', '6', '14', '35');
INSERT INTO `jam_kerja_dokter` VALUES ('621', '6', '15', '35');
INSERT INTO `jam_kerja_dokter` VALUES ('622', '6', '16', '35');
INSERT INTO `jam_kerja_dokter` VALUES ('623', '6', '17', '35');
INSERT INTO `jam_kerja_dokter` VALUES ('624', '6', '18', '35');
INSERT INTO `jam_kerja_dokter` VALUES ('625', '7', '1', '35');
INSERT INTO `jam_kerja_dokter` VALUES ('626', '7', '2', '35');
INSERT INTO `jam_kerja_dokter` VALUES ('627', '7', '3', '35');
INSERT INTO `jam_kerja_dokter` VALUES ('628', '7', '4', '35');
INSERT INTO `jam_kerja_dokter` VALUES ('629', '7', '5', '35');
INSERT INTO `jam_kerja_dokter` VALUES ('630', '7', '6', '35');
INSERT INTO `jam_kerja_dokter` VALUES ('631', '1', '1', '36');
INSERT INTO `jam_kerja_dokter` VALUES ('632', '1', '2', '36');
INSERT INTO `jam_kerja_dokter` VALUES ('633', '1', '3', '36');
INSERT INTO `jam_kerja_dokter` VALUES ('634', '1', '4', '36');
INSERT INTO `jam_kerja_dokter` VALUES ('635', '1', '5', '36');
INSERT INTO `jam_kerja_dokter` VALUES ('636', '1', '6', '36');
INSERT INTO `jam_kerja_dokter` VALUES ('637', '3', '1', '36');
INSERT INTO `jam_kerja_dokter` VALUES ('638', '3', '2', '36');
INSERT INTO `jam_kerja_dokter` VALUES ('639', '3', '3', '36');
INSERT INTO `jam_kerja_dokter` VALUES ('640', '3', '4', '36');
INSERT INTO `jam_kerja_dokter` VALUES ('641', '3', '5', '36');
INSERT INTO `jam_kerja_dokter` VALUES ('642', '3', '6', '36');
INSERT INTO `jam_kerja_dokter` VALUES ('643', '5', '1', '36');
INSERT INTO `jam_kerja_dokter` VALUES ('644', '5', '2', '36');
INSERT INTO `jam_kerja_dokter` VALUES ('645', '5', '3', '36');
INSERT INTO `jam_kerja_dokter` VALUES ('646', '5', '4', '36');
INSERT INTO `jam_kerja_dokter` VALUES ('647', '5', '5', '36');
INSERT INTO `jam_kerja_dokter` VALUES ('648', '5', '6', '36');
INSERT INTO `jam_kerja_dokter` VALUES ('649', '2', '7', '37');
INSERT INTO `jam_kerja_dokter` VALUES ('650', '2', '8', '37');
INSERT INTO `jam_kerja_dokter` VALUES ('651', '2', '9', '37');
INSERT INTO `jam_kerja_dokter` VALUES ('652', '2', '10', '37');
INSERT INTO `jam_kerja_dokter` VALUES ('653', '2', '11', '37');
INSERT INTO `jam_kerja_dokter` VALUES ('654', '2', '12', '37');
INSERT INTO `jam_kerja_dokter` VALUES ('655', '4', '7', '37');
INSERT INTO `jam_kerja_dokter` VALUES ('656', '4', '8', '37');
INSERT INTO `jam_kerja_dokter` VALUES ('657', '4', '9', '37');
INSERT INTO `jam_kerja_dokter` VALUES ('658', '4', '10', '37');
INSERT INTO `jam_kerja_dokter` VALUES ('659', '4', '11', '37');
INSERT INTO `jam_kerja_dokter` VALUES ('660', '4', '12', '37');
INSERT INTO `jam_kerja_dokter` VALUES ('661', '6', '7', '37');
INSERT INTO `jam_kerja_dokter` VALUES ('662', '6', '8', '37');
INSERT INTO `jam_kerja_dokter` VALUES ('663', '6', '9', '37');
INSERT INTO `jam_kerja_dokter` VALUES ('664', '6', '10', '37');
INSERT INTO `jam_kerja_dokter` VALUES ('665', '6', '11', '37');
INSERT INTO `jam_kerja_dokter` VALUES ('666', '6', '12', '37');
INSERT INTO `jam_kerja_dokter` VALUES ('667', '1', '13', '38');
INSERT INTO `jam_kerja_dokter` VALUES ('668', '1', '14', '38');
INSERT INTO `jam_kerja_dokter` VALUES ('669', '1', '15', '38');
INSERT INTO `jam_kerja_dokter` VALUES ('670', '1', '16', '38');
INSERT INTO `jam_kerja_dokter` VALUES ('671', '1', '17', '38');
INSERT INTO `jam_kerja_dokter` VALUES ('672', '1', '18', '38');
INSERT INTO `jam_kerja_dokter` VALUES ('673', '4', '13', '38');
INSERT INTO `jam_kerja_dokter` VALUES ('674', '4', '14', '38');
INSERT INTO `jam_kerja_dokter` VALUES ('675', '4', '15', '38');
INSERT INTO `jam_kerja_dokter` VALUES ('676', '4', '16', '38');
INSERT INTO `jam_kerja_dokter` VALUES ('677', '4', '17', '38');
INSERT INTO `jam_kerja_dokter` VALUES ('678', '4', '18', '38');
INSERT INTO `jam_kerja_dokter` VALUES ('679', '7', '13', '38');
INSERT INTO `jam_kerja_dokter` VALUES ('680', '7', '14', '38');
INSERT INTO `jam_kerja_dokter` VALUES ('681', '7', '15', '38');
INSERT INTO `jam_kerja_dokter` VALUES ('682', '7', '16', '38');
INSERT INTO `jam_kerja_dokter` VALUES ('683', '7', '17', '38');
INSERT INTO `jam_kerja_dokter` VALUES ('684', '7', '18', '38');
INSERT INTO `jam_kerja_dokter` VALUES ('685', '2', '19', '39');
INSERT INTO `jam_kerja_dokter` VALUES ('686', '2', '20', '39');
INSERT INTO `jam_kerja_dokter` VALUES ('687', '2', '21', '39');
INSERT INTO `jam_kerja_dokter` VALUES ('688', '2', '22', '39');
INSERT INTO `jam_kerja_dokter` VALUES ('689', '2', '23', '39');
INSERT INTO `jam_kerja_dokter` VALUES ('690', '2', '24', '39');
INSERT INTO `jam_kerja_dokter` VALUES ('691', '3', '19', '39');
INSERT INTO `jam_kerja_dokter` VALUES ('692', '3', '20', '39');
INSERT INTO `jam_kerja_dokter` VALUES ('693', '3', '21', '39');
INSERT INTO `jam_kerja_dokter` VALUES ('694', '3', '22', '39');
INSERT INTO `jam_kerja_dokter` VALUES ('695', '3', '23', '39');
INSERT INTO `jam_kerja_dokter` VALUES ('696', '3', '24', '39');
INSERT INTO `jam_kerja_dokter` VALUES ('697', '6', '19', '39');
INSERT INTO `jam_kerja_dokter` VALUES ('698', '6', '20', '39');
INSERT INTO `jam_kerja_dokter` VALUES ('699', '6', '21', '39');
INSERT INTO `jam_kerja_dokter` VALUES ('700', '6', '22', '39');
INSERT INTO `jam_kerja_dokter` VALUES ('701', '6', '23', '39');
INSERT INTO `jam_kerja_dokter` VALUES ('702', '6', '24', '39');
INSERT INTO `jam_kerja_dokter` VALUES ('703', '5', '13', '40');
INSERT INTO `jam_kerja_dokter` VALUES ('704', '5', '14', '40');
INSERT INTO `jam_kerja_dokter` VALUES ('705', '5', '15', '40');
INSERT INTO `jam_kerja_dokter` VALUES ('706', '5', '16', '40');
INSERT INTO `jam_kerja_dokter` VALUES ('707', '5', '17', '40');
INSERT INTO `jam_kerja_dokter` VALUES ('708', '5', '18', '40');
INSERT INTO `jam_kerja_dokter` VALUES ('709', '6', '13', '40');
INSERT INTO `jam_kerja_dokter` VALUES ('710', '6', '14', '40');
INSERT INTO `jam_kerja_dokter` VALUES ('711', '6', '15', '40');
INSERT INTO `jam_kerja_dokter` VALUES ('712', '6', '16', '40');
INSERT INTO `jam_kerja_dokter` VALUES ('713', '6', '17', '40');
INSERT INTO `jam_kerja_dokter` VALUES ('714', '6', '18', '40');
INSERT INTO `jam_kerja_dokter` VALUES ('715', '7', '1', '40');
INSERT INTO `jam_kerja_dokter` VALUES ('716', '7', '2', '40');
INSERT INTO `jam_kerja_dokter` VALUES ('717', '7', '3', '40');
INSERT INTO `jam_kerja_dokter` VALUES ('718', '7', '4', '40');
INSERT INTO `jam_kerja_dokter` VALUES ('719', '7', '5', '40');
INSERT INTO `jam_kerja_dokter` VALUES ('720', '7', '6', '40');

-- ----------------------------
-- Table structure for `lab`
-- ----------------------------
DROP TABLE IF EXISTS `lab`;
CREATE TABLE `lab` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `deskripsi` varchar(255) NOT NULL,
  `id_penyakit` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_penyakit_lab` (`id_penyakit`) USING BTREE,
  CONSTRAINT `fk_penyakit_lab` FOREIGN KEY (`id_penyakit`) REFERENCES `penyakit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lab
-- ----------------------------
INSERT INTO `lab` VALUES ('1', 'Tes Darah Lengkap', 'Tes darah untuk memeriksa jumlah sel darah dan fungsi organ.', '1');
INSERT INTO `lab` VALUES ('2', 'Tes Urine', 'Tes urine untuk mendeteksi infeksi saluran kemih.', '5');

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
  `foto` varchar(255) NOT NULL,
  `id_spesialis` int(11) NOT NULL,
  `id_penyakit` int(11) NOT NULL,
  `durasi` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_spesialis` (`id_spesialis`) USING BTREE,
  KEY `ix_obat_id` (`id`) USING BTREE,
  KEY `fk_penyakit` (`id_penyakit`) USING BTREE,
  CONSTRAINT `fk_penyakit` FOREIGN KEY (`id_penyakit`) REFERENCES `penyakit` (`id`),
  CONSTRAINT `obat_ibfk_1` FOREIGN KEY (`id_spesialis`) REFERENCES `spesialis` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of obat
-- ----------------------------
INSERT INTO `obat` VALUES ('1', 'Paracetamol Sirup', '3x1 sendok teh (5 ml)', 'Setelah makan', '15000', 'paracetamol_sirup.png', '1', '1', '4');
INSERT INTO `obat` VALUES ('2', 'Amoxicillin Sirup', '3x1 sendok teh (5 ml)', 'Setelah makan', '20000', 'amoxicillin_sirup.png', '1', '1', '4');
INSERT INTO `obat` VALUES ('3', 'Gabapentin', '2x1 kapsul (300 mg)', 'Setelah makan', '150000', 'gabapentin.png', '2', '2', '15');
INSERT INTO `obat` VALUES ('4', 'Dexamethasone', '2x1 kaplet (0.5 mg)', 'Sebelum makan', '50000', 'dexamethasone.png', '2', '2', '15');
INSERT INTO `obat` VALUES ('5', 'Paracetamol Kaplet', '3x1 kaplet (500 mg)', 'Setelah makan', '10000', 'paracetamol_kaplet.png', '3', '11', '10');
INSERT INTO `obat` VALUES ('6', 'Ibuprofen', '3x1 tablet (400 mg)', 'Setelah makan', '20000', 'ibuprofen.png', '3', '5', '10');
INSERT INTO `obat` VALUES ('7', 'Hydrocortisone Cream', '2x dioleskan pada area yang terkena', 'Sesuai kebutuhan', '30000', 'hydrocortisone_cream.png', '4', '6', '15');
INSERT INTO `obat` VALUES ('8', 'Clindamycin Gel', '2x dioleskan pada area yang terkena', 'Sesuai kebutuhan', '50000', 'clindamycin_gel.png', '4', '10', '15');
INSERT INTO `obat` VALUES ('9', 'Imatinib', '1x1 tablet (400 mg)', 'Setelah makan', '1500000', 'imatinib.png', '5', '3', '30');
INSERT INTO `obat` VALUES ('10', 'Methotrexate', '1x1 tablet (2.5 mg)', 'Sesuai instruksi dokter', '200000', 'methotrexate.png', '5', '3', '30');
INSERT INTO `obat` VALUES ('11', 'Amlodipine', '1x1 tablet (5 mg)', 'Sebelum makan', '30000', 'amlodipine.png', '6', '4', '30');
INSERT INTO `obat` VALUES ('12', 'Atorvastatin', '1x1 tablet (20 mg)', 'Sebelum tidur', '100000', 'atorvastatin.png', '6', '4', '30');
INSERT INTO `obat` VALUES ('13', 'Mefenamic Acid', '3x1 tablet (500 mg)', 'Setelah makan', '20000', 'mefenamic_acid.png', '7', '8', '10');
INSERT INTO `obat` VALUES ('14', 'Chlorhexidine Mouthwash', 'Kumur 2x sehari', 'Setelah menyikat gigi', '25000', 'chlorhexidine_mouthwash.png', '7', '8', '8');
INSERT INTO `obat` VALUES ('15', 'Cetirizine', '1x1 tablet (10 mg)', 'Sebelum tidur', '15000', 'cetirizine.png', '8', '9', '30');
INSERT INTO `obat` VALUES ('16', 'Fluticasone Nasal Spray', '2x semprotan di setiap lubang hidung, 1x sehari', 'Pagi hari', '100000', 'fluticasone_nasal_spray.png', '8', '7', '30');

-- ----------------------------
-- Table structure for `penyakit`
-- ----------------------------
DROP TABLE IF EXISTS `penyakit`;
CREATE TABLE `penyakit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of penyakit
-- ----------------------------
INSERT INTO `penyakit` VALUES ('1', 'Demam Dengue');
INSERT INTO `penyakit` VALUES ('2', 'Tumor Otak');
INSERT INTO `penyakit` VALUES ('3', 'Leukimia');
INSERT INTO `penyakit` VALUES ('4', 'Jantung Koroner');
INSERT INTO `penyakit` VALUES ('5', 'Infeksi Saluran Kemih');
INSERT INTO `penyakit` VALUES ('6', 'Alergi Kulit');
INSERT INTO `penyakit` VALUES ('7', 'Asma');
INSERT INTO `penyakit` VALUES ('8', 'Karies Gigi');
INSERT INTO `penyakit` VALUES ('9', 'Rhinitis');
INSERT INTO `penyakit` VALUES ('10', 'Jerawat');
INSERT INTO `penyakit` VALUES ('11', 'Demam');

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
  CONSTRAINT `fk_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of profil
-- ----------------------------
INSERT INTO `profil` VALUES ('1', 'Naufal Nabil Anugrah', 'PRIA', '081234567890', '2004-07-14', 'profile8.jpg', '1');
INSERT INTO `profil` VALUES ('3', 'Muhammad RIfky Afandi', 'PRIA', '123412341234', '2024-06-05', '', '2');

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
  CONSTRAINT `fk_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of profil_lain
-- ----------------------------
INSERT INTO `profil_lain` VALUES ('1', 'Muhammad Iqbal Firdaus', 'PRIA', '2004-02-13', '', '1');
INSERT INTO `profil_lain` VALUES ('2', 'Iki', 'PRIA', '2019-06-05', '', '2');
INSERT INTO `profil_lain` VALUES ('6', 'Riki Affandi', 'PRIA', '2011-06-12', '', '2');

-- ----------------------------
-- Table structure for `radiologi`
-- ----------------------------
DROP TABLE IF EXISTS `radiologi`;
CREATE TABLE `radiologi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `deskripsi` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `id_penyakit` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_penyakit_radiologi` (`id_penyakit`) USING BTREE,
  CONSTRAINT `fk_penyakit_radiologi` FOREIGN KEY (`id_penyakit`) REFERENCES `penyakit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of radiologi
-- ----------------------------
INSERT INTO `radiologi` VALUES ('1', 'MRI Otak', 'Pemeriksaan MRI untuk melihat adanya tumor di otak.', 'mri_otak.jpg', '2');
INSERT INTO `radiologi` VALUES ('2', 'CT Scan Jantung', 'Pemeriksaan CT scan untuk melihat kondisi pembuluh darah di jantung.', 'ct_scan_jantung.jpg', '4');
INSERT INTO `radiologi` VALUES ('3', 'X-Ray Gigi', 'Pemeriksaan X-ray untuk melihat tingkat kerusakan gigi.', 'xray_gigi.jpg', '8');

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
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_daftar_profil` (`id_daftar_profil`) USING BTREE,
  KEY `fk_jadwall` (`id_jam_kerja_dokter`) USING BTREE,
  CONSTRAINT `fk_daftar_profil` FOREIGN KEY (`id_daftar_profil`) REFERENCES `daftar_profil` (`id`),
  CONSTRAINT `fk_jadwall` FOREIGN KEY (`id_jam_kerja_dokter`) REFERENCES `jam_kerja_dokter` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of reservasi
-- ----------------------------
INSERT INTO `reservasi` VALUES ('9', '2024-06-12', 'Rp. 50.000', '2', '547', '5');
INSERT INTO `reservasi` VALUES ('10', '2024-06-22', 'Rp. 50.000', '2', '121', '5');
INSERT INTO `reservasi` VALUES ('11', '2024-06-27', 'Rp. 50.000', '7', '295', '5');
INSERT INTO `reservasi` VALUES ('12', '2024-06-29', 'Rp. 50.000', '3', '697', '5');
INSERT INTO `reservasi` VALUES ('13', '2024-06-25', 'Rp. 50.000', '3', '19', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of spesialis
-- ----------------------------
INSERT INTO `spesialis` VALUES ('1', 'Anak', 'anak.png', 'Spesialis anak, atau pediatrik, adalah cabang medis yang berfokus pada kesehatan dan perawatan medis anak-anak mulai dari bayi baru lahir hingga remaja. Dokter spesialis anak, yang disebut dokter pediatrik, memiliki keahlian khusus dalam diagnosis, pengobatan, dan pencegahan penyakit serta masalah kesehatan yang unik pada populasi anak-anak', 'Asma\r\nInfeksi dan Penyakit Menular\r\nPenyakit Kronis\r\nMasalah Pertumbuhan dan Perkembangan\r\nKesehatan Mental\r\nMasalah Nutrisi\r\nPenyakit SIstem Imun', 'Pemeriksaan Rutin dan Imunisasi\r\nDiagnosis dan Pengobatan Penyakit Akut dan Kronis\r\nKonsultasi Perkembangan dan Perilaku\r\nPemeriksaan Fisik Menyeluruh\r\nRujukan ke Spesialis Lain\r\nEdukasi Kesehatan');
INSERT INTO `spesialis` VALUES ('2', 'Bedah Saraf', 'saraf.png', 'Spesialis bedah saraf, atau neurosurgeon, adalah dokter yang memiliki keahlian dalam mendiagnosis dan melakukan pembedahan pada gangguan sistem saraf, termasuk otak, tulang belakang, dan saraf perifer. Mereka dilatih untuk menangani kondisi yang memerlukan intervensi bedah pada sistem saraf', 'Tumor Otak dan Tulang Belakang\r\nCidera Kepala dan Tulang Belakang\r\nGangguan Pembuluh Darah di Otak\r\nHerniated Discs\r\nPenyakit Neurodegeneratif\r\nEpilepsi\r\nKelainan Kongenital\r\nInfeksi Sistem Saraf\r\nGangguan Saraf Perifer', 'Konsultasi dan Diagnosis\r\nPembedahan Otak dan Tulang Belakang\r\nProsedur Minimally Invasive\r\nOperasi Epilepsi\r\nPerawatan Trauma\r\nNeurostimulasi dan Implan\r\nManajemen Nyeri Kronis\r\nFollow-up dan Rehabilitasi');
INSERT INTO `spesialis` VALUES ('3', 'Dokter Umum', 'umum.png', 'Dokter Umum\', \'umum.png\', \'Dokter umum, atau dikenal juga sebagai dokter keluarga atau dokter layanan primer, adalah profesional medis yang menyediakan perawatan kesehatan dasar kepada pasien dari segala usia. Mereka memiliki pengetahuan luas dalam berbagai bidang medis dan berperan sebagai titik pertama dalam sistem perawatan kesehatan, menangani berbagai masalah kesehatan dan mengkoordinasikan perawatan lebih lanjut dengan spesialis jika diperlukan', 'Penyakit Akut\r\nPenyakit Kronis\r\nPemeriksaan Rutin\r\nMasalah Kesehatan Mental\r\nKesehatan Anak\r\nKesehatan Wanita\r\nCedera dan Luka\r\nKesehatan Lansia', 'Pemeriksaan Fisik dan Skrining Kesehatan\r\nDiagnosis dan Pengobatan\r\nPemberian Vaksinasi\r\nKonseling Kesehatan\r\nManajemen Penyakit Kronis\r\nRujukan ke Spesialis\r\nPerawatan Keluarga Berencana\r\nPerawatan Kesehatan Reproduksi\r\nPerawatan Paliatif dan Dukungan Pasien Terminal');
INSERT INTO `spesialis` VALUES ('4', 'Dermatologi (Kulit)', 'kulit.png', 'Dermatologi (Kulit)\', \'kulit.png\', \'Dermatologi adalah cabang medis yang berfokus pada diagnosis, pengobatan, dan pencegahan penyakit kulit, rambut, dan kuku. Dokter spesialis kulit, atau dermatolog, memiliki keahlian khusus dalam menangani berbagai masalah kulit dan melakukan prosedur medis serta kosmetik', 'Penyakit Kulit Umum\r\nJerawat\r\nInfeksi Kulit\r\nKelainan Pigmen\r\nAlergi Kulit\r\nKanker Kulit\r\nMasalah Rambut dan Kuku\r\nGangguan Autoimun\r\nPenyakit Menular Seksual\r\nGangguan Keringat', 'Konsultasi dan Diagnosis\r\nTerapi Obat\r\nProsedur Bedah\r\nPerawatan Laser\r\nCryotherapy\r\nTerapi Fotodinamik\r\nPengelupasan Kimia\r\nPerawatan Kosmetik\r\nMikrodermabrasi dan Dermabrasi\r\nTerapi Cahaya');
INSERT INTO `spesialis` VALUES ('5', 'Darah dan Kanker', 'kanker.png', 'Spesialis hematologi dan onkologi medik adalah dokter yang memiliki keahlian dalam diagnosis, pengobatan, dan pencegahan penyakit darah serta kanker. Hematologi berfokus pada masalah yang berkaitan dengan darah dan sumsum tulang, sementara onkologi medik berkaitan dengan pengobatan kanker', 'Gangguan Darah\r\nPenyakit Mieloproliferatif\r\nKanker Darah\r\nKanker Padat\r\nSindrom Myelodisplastik\r\nTrombosis dan Embolisme\r\nPenyakit Autoimun', 'Kemoterapi\r\nRadioterapi\r\nImunoterapi\r\nTerapi Targeted\r\nTransplantasi Sumsum Tulang\r\nPerawatan Paliatif\r\nPhlebotomy\r\nTransfusi Darah\r\nPemeriksaan Darah dan Biopsi Sumsum Tulang\r\nKonseling Genetik\r\nManajemen Nyeri dan Gejala');
INSERT INTO `spesialis` VALUES ('6', 'Kardiologi (Jantung)', 'jantung.png', 'Dokter spesialis jantung dan pembuluh darah atau ahli kardiologi merupakan dokter yang berfokus pada diagnosis dan penanganan masalah kesehatan, yang berkaitan dengan jantung dan pembuluh darah', 'Henti Jantung\r\nSerangan Jantung\r\nKardiomiopati\r\nAngina\r\nPenyakit pada Pembuluh Darah', 'Diagnostik\r\nPenanganan Darurat\r\nPengobatan Obat\r\nProsedur Invasive\r\nRehabilitasi Jantung');
INSERT INTO `spesialis` VALUES ('7', 'Kedokteran Gigi', 'gigi.png', 'Kedokteran gigi adalah cabang medis yang berfokus pada kesehatan mulut, gigi, dan jaringan terkait. Dokter gigi bertanggung jawab untuk mendiagnosis, mencegah, dan merawat berbagai kondisi yang mempengaruhi gigi, gusi, dan bagian lain dari mulut', 'Karies Gigi\r\nPenyakit Gusi\r\nInfeksi Gigi\r\nMasalah Gigi Bungsu\r\nMaloklusi\r\nTrauma Gigi\r\nKelainan Kelenjar Ludah\r\nGangguan Sendi Temporomandibular (TMJ)\r\nKondisi Mulut Lainnya', 'Pemeriksaan dan Diagnostik\r\nPembersihan Gigi\r\nPengisian Gigi (Tambal Gigi)\r\nPerawatan Saluran Akar\r\nEkstraksi Gigi\r\nProstodontik\r\nOrtodontik\r\nImplan Gigi\r\nBedah Mulut dan Maksilofasial');
INSERT INTO `spesialis` VALUES ('8', 'Otolaringologi (THT)', 'tht.png', 'Otolaringologi, atau THT (Telinga, Hidung, dan Tenggorokan), adalah cabang kedokteran yang berfokus pada diagnosis dan pengobatan penyakit serta gangguan pada telinga, hidung, tenggorokan, serta kepala dan leher. Dokter spesialis THT, atau otolaringolog, memiliki keahlian dalam menangani berbagai kondisi yang mempengaruhi organ-organ ini', 'Masalah Telinga\r\nGangguan Hidung\r\nMasalah Tenggorokan\r\nGangguan Tidur\r\nTumor dan Kanker Kepala & Leher\r\nMasalah Tiroid dan Kelenjar Liur\r\nKelainan Kongenital', 'Pemeriksaan dan Diagnostik\r\nPerawatan Medis\r\nBedah THT\r\nTerapi Pendengaran dan Vertigo\r\nManajemen Gangguan Tidur\r\nRehabilitasi Suara\r\nPerawatan Kosmetik dan Rekonstruktif\r\nImunoterapi dan Penanganan Alergi\r\nManajemen Nyeri dan Ketidaknyamanan');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'naufal@gmail.com', '$2b$12$kbucQQr9Z4FWtXvkAQABVeASxTh8BU58LvH17Xq6g9j1qL1KueUhW');
INSERT INTO `users` VALUES ('2', 'iki@gmail.com', '$2b$12$WGoKt8SYoP.l3ymWlR3DmOSzhLZJscQ2yaqLzzUjdvhOXgSawuQj.');
DELIMITER ;;
CREATE TRIGGER `after_insert_profil` AFTER INSERT ON `profil` FOR EACH ROW BEGIN
   INSERT INTO daftar_profil (id_profil, id_profil_lain)
   VALUES (NEW.id, NULL);
END
;;
DELIMITER ;
DELIMITER ;;
CREATE TRIGGER `update_daftar_profil` AFTER INSERT ON `profil_lain` FOR EACH ROW BEGIN
   INSERT INTO daftar_profil (id_profil, id_profil_lain)
   VALUES (NULL, NEW.id);
END
;;
DELIMITER ;
