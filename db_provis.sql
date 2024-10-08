-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2024 at 01:03 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_provis`
--

-- --------------------------------------------------------

--
-- Table structure for table `daftar_profil`
--

CREATE TABLE `daftar_profil` (
  `id` int(11) NOT NULL,
  `id_profil` int(11) DEFAULT NULL,
  `id_profil_lain` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `daftar_profil`
--

INSERT INTO `daftar_profil` (`id`, `id_profil`, `id_profil_lain`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `daftar_profil_penyakit`
--

CREATE TABLE `daftar_profil_penyakit` (
  `id` int(11) NOT NULL,
  `id_daftar_profil` int(11) NOT NULL,
  `id_penyakit` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `id_reservasi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL DEFAULT '',
  `foto` varchar(255) NOT NULL DEFAULT '',
  `id_spesialis` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id`, `nama`, `foto`, `id_spesialis`) VALUES
(1, 'dr. Aulia Putri', 'aulia_putri.png', 1),
(2, 'dr. Budi Santoso', 'budi_santoso.png', 1),
(3, 'dr. Clara Setiawan', 'clara_setiawan.png', 1),
(4, 'dr. Dedi Kusuma', 'dedi_kusuma.png', 1),
(5, 'dr. Eliza Putri', 'eliza_putri.png', 1),
(6, 'dr. Fahmi Syahputra', 'fahmi_syahputra.png', 2),
(7, 'dr. Gina Lestari', 'gina_lestari.png', 2),
(8, 'dr. Hadi Wirawan', 'hadi_wirawan.png', 2),
(9, 'dr. Indah Sari', 'indah_sari.png', 2),
(10, 'dr. Joko Susanto', 'joko_susanto.png', 2),
(11, 'dr. Kurniawan', 'kurniawan.png', 3),
(12, 'dr. Lisa Permata', 'lisa_permata.png', 3),
(13, 'dr. M. Arifin', 'm_arifin.png', 3),
(14, 'dr. Nani Wijaya', 'nani_wijaya.png', 3),
(15, 'dr. Oka Pratama', 'oka_pratama.png', 3),
(16, 'dr. Prita Sari', 'prita_sari.png', 4),
(17, 'dr. Qori Astuti', 'qori_astuti.png', 4),
(18, 'dr. Rudi Hartono', 'rudi_hartono.png', 4),
(19, 'dr. Sari Wulandari', 'sari_wulandari.png', 4),
(20, 'dr. Tono Prasetyo', 'tono_prasetyo.png', 4),
(21, 'dr. Umar Faruq', 'umar_faruq.png', 5),
(22, 'dr. Vina Sari', 'vina_sari.png', 5),
(23, 'dr. Wawan Setiawan', 'wawan_setiawan.png', 5),
(24, 'dr. Xena Putri', 'xena_putri.png', 5),
(25, 'dr. Yudi Permana', 'yudi_permana.png', 5),
(26, 'dr. Zamzam Hariri', 'zamzam_hariri.png', 6),
(27, 'dr. Aditya Wijaya', 'aditya_wijaya.png', 6),
(28, 'dr. Bunga Melati', 'bunga_melati.png', 6),
(29, 'dr. Candra Wibowo', 'candra_wibowo.png', 6),
(30, 'dr. Dewi Sartika', 'dewi_sartika.png', 6),
(31, 'dr. Edi Prasetyo', 'edi_prasetyo.png', 7),
(32, 'dr. Fanny Permata', 'fanny_permata.png', 7),
(33, 'dr. Gunawan Setiawan', 'gunawan_setiawan.png', 7),
(34, 'dr. Hendra Wibowo', 'hendra_wibowo.png', 7),
(35, 'dr. Intan Sari', 'intan_sari.png', 7),
(36, 'dr. Jati Rahardjo', 'jati_rahardjo.png', 8),
(37, 'dr. Kurnia Dewi', 'kurnia_dewi.png', 8),
(38, 'dr. Lestari Putri', 'lestari_putri.png', 8),
(39, 'dr. Mulyadi Kusuma', 'mulyadi_kusuma.png', 8),
(40, 'dr. Nia Safitri', 'nia_safitri.png', 8);

-- --------------------------------------------------------

--
-- Table structure for table `hari`
--

CREATE TABLE `hari` (
  `id` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `hari`
--

INSERT INTO `hari` (`id`, `nama`) VALUES
(1, 'Senin'),
(2, 'Selasa'),
(3, 'Rabu'),
(4, 'Kamis'),
(5, 'Jumat'),
(6, 'Sabtu'),
(7, 'Minggu');

-- --------------------------------------------------------

--
-- Table structure for table `jam`
--

CREATE TABLE `jam` (
  `id` int(11) NOT NULL,
  `jam_awal` time NOT NULL,
  `jam_akhir` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `jam`
--

INSERT INTO `jam` (`id`, `jam_awal`, `jam_akhir`) VALUES
(1, '08:00:00', '08:30:00'),
(2, '08:30:00', '09:00:00'),
(3, '09:00:00', '09:30:00'),
(4, '09:30:00', '10:00:00'),
(5, '10:00:00', '10:30:00'),
(6, '10:30:00', '11:00:00'),
(7, '11:00:00', '11:30:00'),
(8, '11:30:00', '12:00:00'),
(9, '12:00:00', '12:30:00'),
(10, '12:30:00', '13:00:00'),
(11, '13:00:00', '13:30:00'),
(12, '13:30:00', '14:00:00'),
(13, '14:00:00', '14:30:00'),
(14, '14:30:00', '15:00:00'),
(15, '15:00:00', '15:30:00'),
(16, '15:30:00', '16:00:00'),
(17, '16:00:00', '16:30:00'),
(18, '16:30:00', '17:00:00'),
(19, '17:00:00', '17:30:00'),
(20, '17:30:00', '18:00:00'),
(21, '18:00:00', '18:30:00'),
(22, '18:30:00', '19:00:00'),
(23, '19:00:00', '19:30:00'),
(24, '19:30:00', '20:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `jam_kerja_dokter`
--

CREATE TABLE `jam_kerja_dokter` (
  `id` int(11) NOT NULL,
  `id_hari` int(11) NOT NULL,
  `id_jam` int(11) NOT NULL,
  `id_dokter` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `jam_kerja_dokter`
--

INSERT INTO `jam_kerja_dokter` (`id`, `id_hari`, `id_jam`, `id_dokter`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 1, 3, 1),
(4, 1, 4, 1),
(5, 1, 5, 1),
(6, 1, 6, 1),
(7, 3, 1, 1),
(8, 3, 2, 1),
(9, 3, 3, 1),
(10, 3, 4, 1),
(11, 3, 5, 1),
(12, 3, 6, 1),
(13, 5, 1, 1),
(14, 5, 2, 1),
(15, 5, 3, 1),
(16, 5, 4, 1),
(17, 5, 5, 1),
(18, 5, 6, 1),
(19, 2, 7, 2),
(20, 2, 8, 2),
(21, 2, 9, 2),
(22, 2, 10, 2),
(23, 2, 11, 2),
(24, 2, 12, 2),
(25, 4, 7, 2),
(26, 4, 8, 2),
(27, 4, 9, 2),
(28, 4, 10, 2),
(29, 4, 11, 2),
(30, 4, 12, 2),
(31, 6, 7, 2),
(32, 6, 8, 2),
(33, 6, 9, 2),
(34, 6, 10, 2),
(35, 6, 11, 2),
(36, 6, 12, 2),
(37, 1, 13, 3),
(38, 1, 14, 3),
(39, 1, 15, 3),
(40, 1, 16, 3),
(41, 1, 17, 3),
(42, 1, 18, 3),
(43, 4, 13, 3),
(44, 4, 14, 3),
(45, 4, 15, 3),
(46, 4, 16, 3),
(47, 4, 17, 3),
(48, 4, 18, 3),
(49, 7, 13, 3),
(50, 7, 14, 3),
(51, 7, 15, 3),
(52, 7, 16, 3),
(53, 7, 17, 3),
(54, 7, 18, 3),
(55, 2, 19, 4),
(56, 2, 20, 4),
(57, 2, 21, 4),
(58, 2, 22, 4),
(59, 2, 23, 4),
(60, 2, 24, 4),
(61, 3, 19, 4),
(62, 3, 20, 4),
(63, 3, 21, 4),
(64, 3, 22, 4),
(65, 3, 23, 4),
(66, 3, 24, 4),
(67, 6, 19, 4),
(68, 6, 20, 4),
(69, 6, 21, 4),
(70, 6, 22, 4),
(71, 6, 23, 4),
(72, 6, 24, 4),
(73, 5, 13, 5),
(74, 5, 14, 5),
(75, 5, 15, 5),
(76, 5, 16, 5),
(77, 5, 17, 5),
(78, 5, 18, 5),
(79, 6, 13, 5),
(80, 6, 14, 5),
(81, 6, 15, 5),
(82, 6, 16, 5),
(83, 6, 17, 5),
(84, 6, 18, 5),
(85, 7, 1, 5),
(86, 7, 2, 5),
(87, 7, 3, 5),
(88, 7, 4, 5),
(89, 7, 5, 5),
(90, 7, 6, 5),
(91, 1, 1, 6),
(92, 1, 2, 6),
(93, 1, 3, 6),
(94, 1, 4, 6),
(95, 1, 5, 6),
(96, 1, 6, 6),
(97, 3, 1, 6),
(98, 3, 2, 6),
(99, 3, 3, 6),
(100, 3, 4, 6),
(101, 3, 5, 6),
(102, 3, 6, 6),
(103, 5, 1, 6),
(104, 5, 2, 6),
(105, 5, 3, 6),
(106, 5, 4, 6),
(107, 5, 5, 6),
(108, 5, 6, 6),
(109, 2, 7, 7),
(110, 2, 8, 7),
(111, 2, 9, 7),
(112, 2, 10, 7),
(113, 2, 11, 7),
(114, 2, 12, 7),
(115, 4, 7, 7),
(116, 4, 8, 7),
(117, 4, 9, 7),
(118, 4, 10, 7),
(119, 4, 11, 7),
(120, 4, 12, 7),
(121, 6, 7, 7),
(122, 6, 8, 7),
(123, 6, 9, 7),
(124, 6, 10, 7),
(125, 6, 11, 7),
(126, 6, 12, 7),
(127, 1, 13, 8),
(128, 1, 14, 8),
(129, 1, 15, 8),
(130, 1, 16, 8),
(131, 1, 17, 8),
(132, 1, 18, 8),
(133, 4, 13, 8),
(134, 4, 14, 8),
(135, 4, 15, 8),
(136, 4, 16, 8),
(137, 4, 17, 8),
(138, 4, 18, 8),
(139, 7, 13, 8),
(140, 7, 14, 8),
(141, 7, 15, 8),
(142, 7, 16, 8),
(143, 7, 17, 8),
(144, 7, 18, 8),
(145, 2, 19, 9),
(146, 2, 20, 9),
(147, 2, 21, 9),
(148, 2, 22, 9),
(149, 2, 23, 9),
(150, 2, 24, 9),
(151, 3, 19, 9),
(152, 3, 20, 9),
(153, 3, 21, 9),
(154, 3, 22, 9),
(155, 3, 23, 9),
(156, 3, 24, 9),
(157, 6, 19, 9),
(158, 6, 20, 9),
(159, 6, 21, 9),
(160, 6, 22, 9),
(161, 6, 23, 9),
(162, 6, 24, 9),
(163, 5, 13, 10),
(164, 5, 14, 10),
(165, 5, 15, 10),
(166, 5, 16, 10),
(167, 5, 17, 10),
(168, 5, 18, 10),
(169, 6, 13, 10),
(170, 6, 14, 10),
(171, 6, 15, 10),
(172, 6, 16, 10),
(173, 6, 17, 10),
(174, 6, 18, 10),
(175, 7, 1, 10),
(176, 7, 2, 10),
(177, 7, 3, 10),
(178, 7, 4, 10),
(179, 7, 5, 10),
(180, 7, 6, 10),
(181, 1, 1, 11),
(182, 1, 2, 11),
(183, 1, 3, 11),
(184, 1, 4, 11),
(185, 1, 5, 11),
(186, 1, 6, 11),
(187, 3, 1, 11),
(188, 3, 2, 11),
(189, 3, 3, 11),
(190, 3, 4, 11),
(191, 3, 5, 11),
(192, 3, 6, 11),
(193, 5, 1, 11),
(194, 5, 2, 11),
(195, 5, 3, 11),
(196, 5, 4, 11),
(197, 5, 5, 11),
(198, 5, 6, 11),
(199, 2, 7, 12),
(200, 2, 8, 12),
(201, 2, 9, 12),
(202, 2, 10, 12),
(203, 2, 11, 12),
(204, 2, 12, 12),
(205, 4, 7, 12),
(206, 4, 8, 12),
(207, 4, 9, 12),
(208, 4, 10, 12),
(209, 4, 11, 12),
(210, 4, 12, 12),
(211, 6, 7, 12),
(212, 6, 8, 12),
(213, 6, 9, 12),
(214, 6, 10, 12),
(215, 6, 11, 12),
(216, 6, 12, 12),
(217, 1, 13, 13),
(218, 1, 14, 13),
(219, 1, 15, 13),
(220, 1, 16, 13),
(221, 1, 17, 13),
(222, 1, 18, 13),
(223, 4, 13, 13),
(224, 4, 14, 13),
(225, 4, 15, 13),
(226, 4, 16, 13),
(227, 4, 17, 13),
(228, 4, 18, 13),
(229, 7, 13, 13),
(230, 7, 14, 13),
(231, 7, 15, 13),
(232, 7, 16, 13),
(233, 7, 17, 13),
(234, 7, 18, 13),
(235, 2, 19, 14),
(236, 2, 20, 14),
(237, 2, 21, 14),
(238, 2, 22, 14),
(239, 2, 23, 14),
(240, 2, 24, 14),
(241, 3, 19, 14),
(242, 3, 20, 14),
(243, 3, 21, 14),
(244, 3, 22, 14),
(245, 3, 23, 14),
(246, 3, 24, 14),
(247, 6, 19, 14),
(248, 6, 20, 14),
(249, 6, 21, 14),
(250, 6, 22, 14),
(251, 6, 23, 14),
(252, 6, 24, 14),
(253, 5, 13, 15),
(254, 5, 14, 15),
(255, 5, 15, 15),
(256, 5, 16, 15),
(257, 5, 17, 15),
(258, 5, 18, 15),
(259, 6, 13, 15),
(260, 6, 14, 15),
(261, 6, 15, 15),
(262, 6, 16, 15),
(263, 6, 17, 15),
(264, 6, 18, 15),
(265, 7, 1, 15),
(266, 7, 2, 15),
(267, 7, 3, 15),
(268, 7, 4, 15),
(269, 7, 5, 15),
(270, 7, 6, 15),
(271, 1, 1, 16),
(272, 1, 2, 16),
(273, 1, 3, 16),
(274, 1, 4, 16),
(275, 1, 5, 16),
(276, 1, 6, 16),
(277, 3, 1, 16),
(278, 3, 2, 16),
(279, 3, 3, 16),
(280, 3, 4, 16),
(281, 3, 5, 16),
(282, 3, 6, 16),
(283, 5, 1, 16),
(284, 5, 2, 16),
(285, 5, 3, 16),
(286, 5, 4, 16),
(287, 5, 5, 16),
(288, 5, 6, 16),
(289, 2, 7, 17),
(290, 2, 8, 17),
(291, 2, 9, 17),
(292, 2, 10, 17),
(293, 2, 11, 17),
(294, 2, 12, 17),
(295, 4, 7, 17),
(296, 4, 8, 17),
(297, 4, 9, 17),
(298, 4, 10, 17),
(299, 4, 11, 17),
(300, 4, 12, 17),
(301, 6, 7, 17),
(302, 6, 8, 17),
(303, 6, 9, 17),
(304, 6, 10, 17),
(305, 6, 11, 17),
(306, 6, 12, 17),
(307, 1, 13, 18),
(308, 1, 14, 18),
(309, 1, 15, 18),
(310, 1, 16, 18),
(311, 1, 17, 18),
(312, 1, 18, 18),
(313, 4, 13, 18),
(314, 4, 14, 18),
(315, 4, 15, 18),
(316, 4, 16, 18),
(317, 4, 17, 18),
(318, 4, 18, 18),
(319, 7, 13, 18),
(320, 7, 14, 18),
(321, 7, 15, 18),
(322, 7, 16, 18),
(323, 7, 17, 18),
(324, 7, 18, 18),
(325, 2, 19, 19),
(326, 2, 20, 19),
(327, 2, 21, 19),
(328, 2, 22, 19),
(329, 2, 23, 19),
(330, 2, 24, 19),
(331, 3, 19, 19),
(332, 3, 20, 19),
(333, 3, 21, 19),
(334, 3, 22, 19),
(335, 3, 23, 19),
(336, 3, 24, 19),
(337, 6, 19, 19),
(338, 6, 20, 19),
(339, 6, 21, 19),
(340, 6, 22, 19),
(341, 6, 23, 19),
(342, 6, 24, 19),
(343, 5, 13, 20),
(344, 5, 14, 20),
(345, 5, 15, 20),
(346, 5, 16, 20),
(347, 5, 17, 20),
(348, 5, 18, 20),
(349, 6, 13, 20),
(350, 6, 14, 20),
(351, 6, 15, 20),
(352, 6, 16, 20),
(353, 6, 17, 20),
(354, 6, 18, 20),
(355, 7, 1, 20),
(356, 7, 2, 20),
(357, 7, 3, 20),
(358, 7, 4, 20),
(359, 7, 5, 20),
(360, 7, 6, 20),
(361, 1, 1, 21),
(362, 1, 2, 21),
(363, 1, 3, 21),
(364, 1, 4, 21),
(365, 1, 5, 21),
(366, 1, 6, 21),
(367, 3, 1, 21),
(368, 3, 2, 21),
(369, 3, 3, 21),
(370, 3, 4, 21),
(371, 3, 5, 21),
(372, 3, 6, 21),
(373, 5, 1, 21),
(374, 5, 2, 21),
(375, 5, 3, 21),
(376, 5, 4, 21),
(377, 5, 5, 21),
(378, 5, 6, 21),
(379, 2, 7, 22),
(380, 2, 8, 22),
(381, 2, 9, 22),
(382, 2, 10, 22),
(383, 2, 11, 22),
(384, 2, 12, 22),
(385, 4, 7, 22),
(386, 4, 8, 22),
(387, 4, 9, 22),
(388, 4, 10, 22),
(389, 4, 11, 22),
(390, 4, 12, 22),
(391, 6, 7, 22),
(392, 6, 8, 22),
(393, 6, 9, 22),
(394, 6, 10, 22),
(395, 6, 11, 22),
(396, 6, 12, 22),
(397, 1, 13, 23),
(398, 1, 14, 23),
(399, 1, 15, 23),
(400, 1, 16, 23),
(401, 1, 17, 23),
(402, 1, 18, 23),
(403, 4, 13, 23),
(404, 4, 14, 23),
(405, 4, 15, 23),
(406, 4, 16, 23),
(407, 4, 17, 23),
(408, 4, 18, 23),
(409, 7, 13, 23),
(410, 7, 14, 23),
(411, 7, 15, 23),
(412, 7, 16, 23),
(413, 7, 17, 23),
(414, 7, 18, 23),
(415, 2, 19, 24),
(416, 2, 20, 24),
(417, 2, 21, 24),
(418, 2, 22, 24),
(419, 2, 23, 24),
(420, 2, 24, 24),
(421, 3, 19, 24),
(422, 3, 20, 24),
(423, 3, 21, 24),
(424, 3, 22, 24),
(425, 3, 23, 24),
(426, 3, 24, 24),
(427, 6, 19, 24),
(428, 6, 20, 24),
(429, 6, 21, 24),
(430, 6, 22, 24),
(431, 6, 23, 24),
(432, 6, 24, 24),
(433, 5, 13, 25),
(434, 5, 14, 25),
(435, 5, 15, 25),
(436, 5, 16, 25),
(437, 5, 17, 25),
(438, 5, 18, 25),
(439, 6, 13, 25),
(440, 6, 14, 25),
(441, 6, 15, 25),
(442, 6, 16, 25),
(443, 6, 17, 25),
(444, 6, 18, 25),
(445, 7, 1, 25),
(446, 7, 2, 25),
(447, 7, 3, 25),
(448, 7, 4, 25),
(449, 7, 5, 25),
(450, 7, 6, 25),
(451, 1, 1, 26),
(452, 1, 2, 26),
(453, 1, 3, 26),
(454, 1, 4, 26),
(455, 1, 5, 26),
(456, 1, 6, 26),
(457, 3, 1, 26),
(458, 3, 2, 26),
(459, 3, 3, 26),
(460, 3, 4, 26),
(461, 3, 5, 26),
(462, 3, 6, 26),
(463, 5, 1, 26),
(464, 5, 2, 26),
(465, 5, 3, 26),
(466, 5, 4, 26),
(467, 5, 5, 26),
(468, 5, 6, 26),
(469, 2, 7, 27),
(470, 2, 8, 27),
(471, 2, 9, 27),
(472, 2, 10, 27),
(473, 2, 11, 27),
(474, 2, 12, 27),
(475, 4, 7, 27),
(476, 4, 8, 27),
(477, 4, 9, 27),
(478, 4, 10, 27),
(479, 4, 11, 27),
(480, 4, 12, 27),
(481, 6, 7, 27),
(482, 6, 8, 27),
(483, 6, 9, 27),
(484, 6, 10, 27),
(485, 6, 11, 27),
(486, 6, 12, 27),
(487, 1, 13, 28),
(488, 1, 14, 28),
(489, 1, 15, 28),
(490, 1, 16, 28),
(491, 1, 17, 28),
(492, 1, 18, 28),
(493, 4, 13, 28),
(494, 4, 14, 28),
(495, 4, 15, 28),
(496, 4, 16, 28),
(497, 4, 17, 28),
(498, 4, 18, 28),
(499, 7, 13, 28),
(500, 7, 14, 28),
(501, 7, 15, 28),
(502, 7, 16, 28),
(503, 7, 17, 28),
(504, 7, 18, 28),
(505, 2, 19, 29),
(506, 2, 20, 29),
(507, 2, 21, 29),
(508, 2, 22, 29),
(509, 2, 23, 29),
(510, 2, 24, 29),
(511, 3, 19, 29),
(512, 3, 20, 29),
(513, 3, 21, 29),
(514, 3, 22, 29),
(515, 3, 23, 29),
(516, 3, 24, 29),
(517, 6, 19, 29),
(518, 6, 20, 29),
(519, 6, 21, 29),
(520, 6, 22, 29),
(521, 6, 23, 29),
(522, 6, 24, 29),
(523, 5, 13, 30),
(524, 5, 14, 30),
(525, 5, 15, 30),
(526, 5, 16, 30),
(527, 5, 17, 30),
(528, 5, 18, 30),
(529, 6, 13, 30),
(530, 6, 14, 30),
(531, 6, 15, 30),
(532, 6, 16, 30),
(533, 6, 17, 30),
(534, 6, 18, 30),
(535, 7, 1, 30),
(536, 7, 2, 30),
(537, 7, 3, 30),
(538, 7, 4, 30),
(539, 7, 5, 30),
(540, 7, 6, 30),
(541, 1, 1, 31),
(542, 1, 2, 31),
(543, 1, 3, 31),
(544, 1, 4, 31),
(545, 1, 5, 31),
(546, 1, 6, 31),
(547, 3, 1, 31),
(548, 3, 2, 31),
(549, 3, 3, 31),
(550, 3, 4, 31),
(551, 3, 5, 31),
(552, 3, 6, 31),
(553, 5, 1, 31),
(554, 5, 2, 31),
(555, 5, 3, 31),
(556, 5, 4, 31),
(557, 5, 5, 31),
(558, 5, 6, 31),
(559, 2, 7, 32),
(560, 2, 8, 32),
(561, 2, 9, 32),
(562, 2, 10, 32),
(563, 2, 11, 32),
(564, 2, 12, 32),
(565, 4, 7, 32),
(566, 4, 8, 32),
(567, 4, 9, 32),
(568, 4, 10, 32),
(569, 4, 11, 32),
(570, 4, 12, 32),
(571, 6, 7, 32),
(572, 6, 8, 32),
(573, 6, 9, 32),
(574, 6, 10, 32),
(575, 6, 11, 32),
(576, 6, 12, 32),
(577, 1, 13, 33),
(578, 1, 14, 33),
(579, 1, 15, 33),
(580, 1, 16, 33),
(581, 1, 17, 33),
(582, 1, 18, 33),
(583, 4, 13, 33),
(584, 4, 14, 33),
(585, 4, 15, 33),
(586, 4, 16, 33),
(587, 4, 17, 33),
(588, 4, 18, 33),
(589, 7, 13, 33),
(590, 7, 14, 33),
(591, 7, 15, 33),
(592, 7, 16, 33),
(593, 7, 17, 33),
(594, 7, 18, 33),
(595, 2, 19, 34),
(596, 2, 20, 34),
(597, 2, 21, 34),
(598, 2, 22, 34),
(599, 2, 23, 34),
(600, 2, 24, 34),
(601, 3, 19, 34),
(602, 3, 20, 34),
(603, 3, 21, 34),
(604, 3, 22, 34),
(605, 3, 23, 34),
(606, 3, 24, 34),
(607, 6, 19, 34),
(608, 6, 20, 34),
(609, 6, 21, 34),
(610, 6, 22, 34),
(611, 6, 23, 34),
(612, 6, 24, 34),
(613, 5, 13, 35),
(614, 5, 14, 35),
(615, 5, 15, 35),
(616, 5, 16, 35),
(617, 5, 17, 35),
(618, 5, 18, 35),
(619, 6, 13, 35),
(620, 6, 14, 35),
(621, 6, 15, 35),
(622, 6, 16, 35),
(623, 6, 17, 35),
(624, 6, 18, 35),
(625, 7, 1, 35),
(626, 7, 2, 35),
(627, 7, 3, 35),
(628, 7, 4, 35),
(629, 7, 5, 35),
(630, 7, 6, 35),
(631, 1, 1, 36),
(632, 1, 2, 36),
(633, 1, 3, 36),
(634, 1, 4, 36),
(635, 1, 5, 36),
(636, 1, 6, 36),
(637, 3, 1, 36),
(638, 3, 2, 36),
(639, 3, 3, 36),
(640, 3, 4, 36),
(641, 3, 5, 36),
(642, 3, 6, 36),
(643, 5, 1, 36),
(644, 5, 2, 36),
(645, 5, 3, 36),
(646, 5, 4, 36),
(647, 5, 5, 36),
(648, 5, 6, 36),
(649, 2, 7, 37),
(650, 2, 8, 37),
(651, 2, 9, 37),
(652, 2, 10, 37),
(653, 2, 11, 37),
(654, 2, 12, 37),
(655, 4, 7, 37),
(656, 4, 8, 37),
(657, 4, 9, 37),
(658, 4, 10, 37),
(659, 4, 11, 37),
(660, 4, 12, 37),
(661, 6, 7, 37),
(662, 6, 8, 37),
(663, 6, 9, 37),
(664, 6, 10, 37),
(665, 6, 11, 37),
(666, 6, 12, 37),
(667, 1, 13, 38),
(668, 1, 14, 38),
(669, 1, 15, 38),
(670, 1, 16, 38),
(671, 1, 17, 38),
(672, 1, 18, 38),
(673, 4, 13, 38),
(674, 4, 14, 38),
(675, 4, 15, 38),
(676, 4, 16, 38),
(677, 4, 17, 38),
(678, 4, 18, 38),
(679, 7, 13, 38),
(680, 7, 14, 38),
(681, 7, 15, 38),
(682, 7, 16, 38),
(683, 7, 17, 38),
(684, 7, 18, 38),
(685, 2, 19, 39),
(686, 2, 20, 39),
(687, 2, 21, 39),
(688, 2, 22, 39),
(689, 2, 23, 39),
(690, 2, 24, 39),
(691, 3, 19, 39),
(692, 3, 20, 39),
(693, 3, 21, 39),
(694, 3, 22, 39),
(695, 3, 23, 39),
(696, 3, 24, 39),
(697, 6, 19, 39),
(698, 6, 20, 39),
(699, 6, 21, 39),
(700, 6, 22, 39),
(701, 6, 23, 39),
(702, 6, 24, 39),
(703, 5, 13, 40),
(704, 5, 14, 40),
(705, 5, 15, 40),
(706, 5, 16, 40),
(707, 5, 17, 40),
(708, 5, 18, 40),
(709, 6, 13, 40),
(710, 6, 14, 40),
(711, 6, 15, 40),
(712, 6, 16, 40),
(713, 6, 17, 40),
(714, 6, 18, 40),
(715, 7, 1, 40),
(716, 7, 2, 40),
(717, 7, 3, 40),
(718, 7, 4, 40),
(719, 7, 5, 40),
(720, 7, 6, 40);

-- --------------------------------------------------------

--
-- Table structure for table `lab`
--

CREATE TABLE `lab` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `deskripsi` varchar(255) NOT NULL,
  `id_penyakit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `lab`
--

INSERT INTO `lab` (`id`, `nama`, `deskripsi`, `id_penyakit`) VALUES
(1, 'Tes Darah Lengkap', 'Tes darah untuk memeriksa jumlah sel darah dan fungsi organ.', 1),
(2, 'Tes Urine', 'Tes urine untuk mendeteksi infeksi saluran kemih.', 5);

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `dosis` varchar(255) NOT NULL,
  `pemakaian` varchar(255) NOT NULL,
  `harga` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `id_spesialis` int(11) NOT NULL,
  `id_penyakit` int(11) NOT NULL,
  `durasi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`id`, `nama`, `dosis`, `pemakaian`, `harga`, `foto`, `id_spesialis`, `id_penyakit`, `durasi`) VALUES
(1, 'Paracetamol Sirup', '3x1 sendok teh (5 ml)', 'Setelah makan', '15000', 'paracetamol_sirup.png', 1, 1, 4),
(2, 'Amoxicillin Sirup', '3x1 sendok teh (5 ml)', 'Setelah makan', '20000', 'amoxicillin_sirup.png', 1, 1, 4),
(3, 'Gabapentin', '2x1 kapsul (300 mg)', 'Setelah makan', '150000', 'gabapentin.png', 2, 2, 15),
(4, 'Dexamethasone', '2x1 kaplet (0.5 mg)', 'Sebelum makan', '50000', 'dexamethasone.png', 2, 2, 15),
(5, 'Paracetamol Kaplet', '3x1 kaplet (500 mg)', 'Setelah makan', '10000', 'paracetamol_kaplet.png', 3, 11, 10),
(6, 'Ibuprofen', '3x1 tablet (400 mg)', 'Setelah makan', '20000', 'ibuprofen.png', 3, 5, 10),
(7, 'Hydrocortisone Cream', '2x dioleskan pada area yang terkena', 'Sesuai kebutuhan', '30000', 'hydrocortisone_cream.png', 4, 6, 15),
(8, 'Clindamycin Gel', '2x dioleskan pada area yang terkena', 'Sesuai kebutuhan', '50000', 'clindamycin_gel.png', 4, 10, 15),
(9, 'Imatinib', '1x1 tablet (400 mg)', 'Setelah makan', '1500000', 'imatinib.png', 5, 3, 30),
(10, 'Methotrexate', '1x1 tablet (2.5 mg)', 'Sesuai instruksi dokter', '200000', 'methotrexate.png', 5, 3, 30),
(11, 'Amlodipine', '1x1 tablet (5 mg)', 'Sebelum makan', '30000', 'amlodipine.png', 6, 4, 30),
(12, 'Atorvastatin', '1x1 tablet (20 mg)', 'Sebelum tidur', '100000', 'atorvastatin.png', 6, 4, 30),
(13, 'Mefenamic Acid', '3x1 tablet (500 mg)', 'Setelah makan', '20000', 'mefenamic_acid.png', 7, 8, 10),
(14, 'Chlorhexidine Mouthwash', 'Kumur 2x sehari', 'Setelah menyikat gigi', '25000', 'chlorhexidine_mouthwash.png', 7, 8, 8),
(15, 'Cetirizine', '1x1 tablet (10 mg)', 'Sebelum tidur', '15000', 'cetirizine.png', 8, 9, 30),
(16, 'Fluticasone Nasal Spray', '2x semprotan di setiap lubang hidung, 1x sehari', 'Pagi hari', '100000', 'fluticasone_nasal_spray.png', 8, 7, 30);

-- --------------------------------------------------------

--
-- Table structure for table `penyakit`
--

CREATE TABLE `penyakit` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `penyakit`
--

INSERT INTO `penyakit` (`id`, `nama`) VALUES
(1, 'Demam Dengue'),
(2, 'Tumor Otak'),
(3, 'Leukimia'),
(4, 'Jantung Koroner'),
(5, 'Infeksi Saluran Kemih'),
(6, 'Alergi Kulit'),
(7, 'Asma'),
(8, 'Karies Gigi'),
(9, 'Rhinitis'),
(10, 'Jerawat'),
(11, 'Demam');

-- --------------------------------------------------------

--
-- Table structure for table `profil`
--

CREATE TABLE `profil` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL DEFAULT '',
  `jenis_kelamin` varchar(255) NOT NULL DEFAULT '',
  `notelp` varchar(255) NOT NULL DEFAULT '',
  `tanggal_lahir` date NOT NULL,
  `foto` varchar(255) NOT NULL DEFAULT '',
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `profil`
--

INSERT INTO `profil` (`id`, `nama`, `jenis_kelamin`, `notelp`, `tanggal_lahir`, `foto`, `id_user`) VALUES
(1, 'Naufal Nabil Anugrah', 'PRIA', '081234567890', '2004-07-14', 'profile8.jpg', 1);

--
-- Triggers `profil`
--
DELIMITER $$
CREATE TRIGGER `after_insert_profil` AFTER INSERT ON `profil` FOR EACH ROW BEGIN
   INSERT INTO daftar_profil (id_profil, id_profil_lain)
   VALUES (NEW.id, NULL);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `profil_lain`
--

CREATE TABLE `profil_lain` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL DEFAULT '',
  `jenis_kelamin` varchar(255) NOT NULL DEFAULT '',
  `tanggal_lahir` date NOT NULL,
  `foto` varchar(255) NOT NULL DEFAULT '',
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `profil_lain`
--

INSERT INTO `profil_lain` (`id`, `nama`, `jenis_kelamin`, `tanggal_lahir`, `foto`, `id_user`) VALUES
(1, 'Muhammad Iqbal Firdaus', 'PRIA', '2004-02-13', '', 1);

--
-- Triggers `profil_lain`
--
DELIMITER $$
CREATE TRIGGER `update_daftar_profil` AFTER INSERT ON `profil_lain` FOR EACH ROW BEGIN
   INSERT INTO daftar_profil (id_profil, id_profil_lain)
   VALUES (NULL, NEW.id);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `radiologi`
--

CREATE TABLE `radiologi` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `deskripsi` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `id_penyakit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `radiologi`
--

INSERT INTO `radiologi` (`id`, `nama`, `deskripsi`, `foto`, `id_penyakit`) VALUES
(1, 'MRI Otak', 'Pemeriksaan MRI untuk melihat adanya tumor di otak.', 'mri_otak.jpg', 2),
(2, 'CT Scan Jantung', 'Pemeriksaan CT scan untuk melihat kondisi pembuluh darah di jantung.', 'ct_scan_jantung.jpg', 4),
(3, 'X-Ray Gigi', 'Pemeriksaan X-ray untuk melihat tingkat kerusakan gigi.', 'xray_gigi.jpg', 8);

-- --------------------------------------------------------

--
-- Table structure for table `reservasi`
--

CREATE TABLE `reservasi` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `biaya` varchar(255) NOT NULL DEFAULT '',
  `id_daftar_profil` int(11) NOT NULL,
  `id_jam_kerja_dokter` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `spesialis`
--

CREATE TABLE `spesialis` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL DEFAULT '',
  `foto` varchar(255) NOT NULL DEFAULT '',
  `pengertian` text NOT NULL,
  `kondisi` text NOT NULL,
  `pengobatan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `spesialis`
--

INSERT INTO `spesialis` (`id`, `nama`, `foto`, `pengertian`, `kondisi`, `pengobatan`) VALUES
(1, 'Anak', 'anak.png', 'Spesialis anak, atau pediatrik, adalah cabang medis yang berfokus pada kesehatan dan perawatan medis anak-anak mulai dari bayi baru lahir hingga remaja. Dokter spesialis anak, yang disebut dokter pediatrik, memiliki keahlian khusus dalam diagnosis, pengobatan, dan pencegahan penyakit serta masalah kesehatan yang unik pada populasi anak-anak', 'Asma\r\nInfeksi dan Penyakit Menular\r\nPenyakit Kronis\r\nMasalah Pertumbuhan dan Perkembangan\r\nKesehatan Mental\r\nMasalah Nutrisi\r\nPenyakit SIstem Imun', 'Pemeriksaan Rutin dan Imunisasi\r\nDiagnosis dan Pengobatan Penyakit Akut dan Kronis\r\nKonsultasi Perkembangan dan Perilaku\r\nPemeriksaan Fisik Menyeluruh\r\nRujukan ke Spesialis Lain\r\nEdukasi Kesehatan'),
(2, 'Bedah Saraf', 'saraf.png', 'Spesialis bedah saraf, atau neurosurgeon, adalah dokter yang memiliki keahlian dalam mendiagnosis dan melakukan pembedahan pada gangguan sistem saraf, termasuk otak, tulang belakang, dan saraf perifer. Mereka dilatih untuk menangani kondisi yang memerlukan intervensi bedah pada sistem saraf', 'Tumor Otak dan Tulang Belakang\r\nCidera Kepala dan Tulang Belakang\r\nGangguan Pembuluh Darah di Otak\r\nHerniated Discs\r\nPenyakit Neurodegeneratif\r\nEpilepsi\r\nKelainan Kongenital\r\nInfeksi Sistem Saraf\r\nGangguan Saraf Perifer', 'Konsultasi dan Diagnosis\r\nPembedahan Otak dan Tulang Belakang\r\nProsedur Minimally Invasive\r\nOperasi Epilepsi\r\nPerawatan Trauma\r\nNeurostimulasi dan Implan\r\nManajemen Nyeri Kronis\r\nFollow-up dan Rehabilitasi'),
(3, 'Dokter Umum', 'umum.png', 'Dokter Umum\', \'umum.png\', \'Dokter umum, atau dikenal juga sebagai dokter keluarga atau dokter layanan primer, adalah profesional medis yang menyediakan perawatan kesehatan dasar kepada pasien dari segala usia. Mereka memiliki pengetahuan luas dalam berbagai bidang medis dan berperan sebagai titik pertama dalam sistem perawatan kesehatan, menangani berbagai masalah kesehatan dan mengkoordinasikan perawatan lebih lanjut dengan spesialis jika diperlukan', 'Penyakit Akut\r\nPenyakit Kronis\r\nPemeriksaan Rutin\r\nMasalah Kesehatan Mental\r\nKesehatan Anak\r\nKesehatan Wanita\r\nCedera dan Luka\r\nKesehatan Lansia', 'Pemeriksaan Fisik dan Skrining Kesehatan\r\nDiagnosis dan Pengobatan\r\nPemberian Vaksinasi\r\nKonseling Kesehatan\r\nManajemen Penyakit Kronis\r\nRujukan ke Spesialis\r\nPerawatan Keluarga Berencana\r\nPerawatan Kesehatan Reproduksi\r\nPerawatan Paliatif dan Dukungan Pasien Terminal'),
(4, 'Dermatologi (Kulit)', 'kulit.png', 'Dermatologi (Kulit)\', \'kulit.png\', \'Dermatologi adalah cabang medis yang berfokus pada diagnosis, pengobatan, dan pencegahan penyakit kulit, rambut, dan kuku. Dokter spesialis kulit, atau dermatolog, memiliki keahlian khusus dalam menangani berbagai masalah kulit dan melakukan prosedur medis serta kosmetik', 'Penyakit Kulit Umum\r\nJerawat\r\nInfeksi Kulit\r\nKelainan Pigmen\r\nAlergi Kulit\r\nKanker Kulit\r\nMasalah Rambut dan Kuku\r\nGangguan Autoimun\r\nPenyakit Menular Seksual\r\nGangguan Keringat', 'Konsultasi dan Diagnosis\r\nTerapi Obat\r\nProsedur Bedah\r\nPerawatan Laser\r\nCryotherapy\r\nTerapi Fotodinamik\r\nPengelupasan Kimia\r\nPerawatan Kosmetik\r\nMikrodermabrasi dan Dermabrasi\r\nTerapi Cahaya'),
(5, 'Darah dan Kanker', 'kanker.png', 'Spesialis hematologi dan onkologi medik adalah dokter yang memiliki keahlian dalam diagnosis, pengobatan, dan pencegahan penyakit darah serta kanker. Hematologi berfokus pada masalah yang berkaitan dengan darah dan sumsum tulang, sementara onkologi medik berkaitan dengan pengobatan kanker', 'Gangguan Darah\r\nPenyakit Mieloproliferatif\r\nKanker Darah\r\nKanker Padat\r\nSindrom Myelodisplastik\r\nTrombosis dan Embolisme\r\nPenyakit Autoimun', 'Kemoterapi\r\nRadioterapi\r\nImunoterapi\r\nTerapi Targeted\r\nTransplantasi Sumsum Tulang\r\nPerawatan Paliatif\r\nPhlebotomy\r\nTransfusi Darah\r\nPemeriksaan Darah dan Biopsi Sumsum Tulang\r\nKonseling Genetik\r\nManajemen Nyeri dan Gejala'),
(6, 'Kardiologi (Jantung)', 'jantung.png', 'Dokter spesialis jantung dan pembuluh darah atau ahli kardiologi merupakan dokter yang berfokus pada diagnosis dan penanganan masalah kesehatan, yang berkaitan dengan jantung dan pembuluh darah', 'Henti Jantung\r\nSerangan Jantung\r\nKardiomiopati\r\nAngina\r\nPenyakit pada Pembuluh Darah', 'Diagnostik\r\nPenanganan Darurat\r\nPengobatan Obat\r\nProsedur Invasive\r\nRehabilitasi Jantung'),
(7, 'Kedokteran Gigi', 'gigi.png', 'Kedokteran gigi adalah cabang medis yang berfokus pada kesehatan mulut, gigi, dan jaringan terkait. Dokter gigi bertanggung jawab untuk mendiagnosis, mencegah, dan merawat berbagai kondisi yang mempengaruhi gigi, gusi, dan bagian lain dari mulut', 'Karies Gigi\r\nPenyakit Gusi\r\nInfeksi Gigi\r\nMasalah Gigi Bungsu\r\nMaloklusi\r\nTrauma Gigi\r\nKelainan Kelenjar Ludah\r\nGangguan Sendi Temporomandibular (TMJ)\r\nKondisi Mulut Lainnya', 'Pemeriksaan dan Diagnostik\r\nPembersihan Gigi\r\nPengisian Gigi (Tambal Gigi)\r\nPerawatan Saluran Akar\r\nEkstraksi Gigi\r\nProstodontik\r\nOrtodontik\r\nImplan Gigi\r\nBedah Mulut dan Maksilofasial'),
(8, 'Otolaringologi (THT)', 'tht.png', 'Otolaringologi, atau THT (Telinga, Hidung, dan Tenggorokan), adalah cabang kedokteran yang berfokus pada diagnosis dan pengobatan penyakit serta gangguan pada telinga, hidung, tenggorokan, serta kepala dan leher. Dokter spesialis THT, atau otolaringolog, memiliki keahlian dalam menangani berbagai kondisi yang mempengaruhi organ-organ ini', 'Masalah Telinga\r\nGangguan Hidung\r\nMasalah Tenggorokan\r\nGangguan Tidur\r\nTumor dan Kanker Kepala & Leher\r\nMasalah Tiroid dan Kelenjar Liur\r\nKelainan Kongenital', 'Pemeriksaan dan Diagnostik\r\nPerawatan Medis\r\nBedah THT\r\nTerapi Pendengaran dan Vertigo\r\nManajemen Gangguan Tidur\r\nRehabilitasi Suara\r\nPerawatan Kosmetik dan Rekonstruktif\r\nImunoterapi dan Penanganan Alergi\r\nManajemen Nyeri dan Ketidaknyamanan');

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE `token` (
  `access_token` varchar(450) NOT NULL,
  `refresh_token` varchar(450) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`) VALUES
(1, 'naufal@gmail.com', '$2b$12$kbucQQr9Z4FWtXvkAQABVeASxTh8BU58LvH17Xq6g9j1qL1KueUhW');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `daftar_profil`
--
ALTER TABLE `daftar_profil`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_profil` (`id_profil`) USING BTREE,
  ADD KEY `fk_profil_lain` (`id_profil_lain`) USING BTREE;

--
-- Indexes for table `daftar_profil_penyakit`
--
ALTER TABLE `daftar_profil_penyakit`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_daftar_profil_profil_penyakit` (`id_daftar_profil`) USING BTREE,
  ADD KEY `fk_penyakit_daftar_penyakit` (`id_penyakit`) USING BTREE,
  ADD KEY `fk_reservasi` (`id_reservasi`) USING BTREE;

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `id_spesialis` (`id_spesialis`) USING BTREE;

--
-- Indexes for table `hari`
--
ALTER TABLE `hari`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `jam`
--
ALTER TABLE `jam`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `jam_kerja_dokter`
--
ALTER TABLE `jam_kerja_dokter`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `FK_JAM` (`id_jam`) USING BTREE,
  ADD KEY `FK_HARI` (`id_hari`) USING BTREE,
  ADD KEY `FK_DOKTERR` (`id_dokter`) USING BTREE;

--
-- Indexes for table `lab`
--
ALTER TABLE `lab`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_penyakit_lab` (`id_penyakit`) USING BTREE;

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `id_spesialis` (`id_spesialis`) USING BTREE,
  ADD KEY `ix_obat_id` (`id`) USING BTREE,
  ADD KEY `fk_penyakit` (`id_penyakit`) USING BTREE;

--
-- Indexes for table `penyakit`
--
ALTER TABLE `penyakit`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `profil`
--
ALTER TABLE `profil`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_users` (`id_user`) USING BTREE;

--
-- Indexes for table `profil_lain`
--
ALTER TABLE `profil_lain`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_user` (`id_user`) USING BTREE;

--
-- Indexes for table `radiologi`
--
ALTER TABLE `radiologi`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_penyakit_radiologi` (`id_penyakit`) USING BTREE;

--
-- Indexes for table `reservasi`
--
ALTER TABLE `reservasi`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_daftar_profil` (`id_daftar_profil`) USING BTREE,
  ADD KEY `fk_jadwall` (`id_jam_kerja_dokter`) USING BTREE;

--
-- Indexes for table `spesialis`
--
ALTER TABLE `spesialis`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`access_token`) USING BTREE,
  ADD KEY `id_user` (`id_user`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `username` (`email`) USING BTREE,
  ADD KEY `ix_users_id` (`id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `daftar_profil`
--
ALTER TABLE `daftar_profil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `daftar_profil_penyakit`
--
ALTER TABLE `daftar_profil_penyakit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `hari`
--
ALTER TABLE `hari`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `jam`
--
ALTER TABLE `jam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `jam_kerja_dokter`
--
ALTER TABLE `jam_kerja_dokter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=721;

--
-- AUTO_INCREMENT for table `lab`
--
ALTER TABLE `lab`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `obat`
--
ALTER TABLE `obat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `penyakit`
--
ALTER TABLE `penyakit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `profil`
--
ALTER TABLE `profil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `profil_lain`
--
ALTER TABLE `profil_lain`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `radiologi`
--
ALTER TABLE `radiologi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reservasi`
--
ALTER TABLE `reservasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `spesialis`
--
ALTER TABLE `spesialis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `daftar_profil`
--
ALTER TABLE `daftar_profil`
  ADD CONSTRAINT `fk_profil` FOREIGN KEY (`id_profil`) REFERENCES `profil` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_profil_lain` FOREIGN KEY (`id_profil_lain`) REFERENCES `profil_lain` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `daftar_profil_penyakit`
--
ALTER TABLE `daftar_profil_penyakit`
  ADD CONSTRAINT `fk_daftar_profil_profil_penyakit` FOREIGN KEY (`id_daftar_profil`) REFERENCES `daftar_profil` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_penyakit_daftar_penyakit` FOREIGN KEY (`id_penyakit`) REFERENCES `penyakit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_reservasi` FOREIGN KEY (`id_reservasi`) REFERENCES `reservasi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dokter`
--
ALTER TABLE `dokter`
  ADD CONSTRAINT `id_spesialis` FOREIGN KEY (`id_spesialis`) REFERENCES `spesialis` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jam_kerja_dokter`
--
ALTER TABLE `jam_kerja_dokter`
  ADD CONSTRAINT `FK_DOKTERR` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_HARI` FOREIGN KEY (`id_hari`) REFERENCES `hari` (`id`),
  ADD CONSTRAINT `FK_JAM` FOREIGN KEY (`id_jam`) REFERENCES `jam` (`id`);

--
-- Constraints for table `lab`
--
ALTER TABLE `lab`
  ADD CONSTRAINT `fk_penyakit_lab` FOREIGN KEY (`id_penyakit`) REFERENCES `penyakit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `obat`
--
ALTER TABLE `obat`
  ADD CONSTRAINT `fk_penyakit` FOREIGN KEY (`id_penyakit`) REFERENCES `penyakit` (`id`),
  ADD CONSTRAINT `obat_ibfk_1` FOREIGN KEY (`id_spesialis`) REFERENCES `spesialis` (`id`);

--
-- Constraints for table `profil`
--
ALTER TABLE `profil`
  ADD CONSTRAINT `fk_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `profil_lain`
--
ALTER TABLE `profil_lain`
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `radiologi`
--
ALTER TABLE `radiologi`
  ADD CONSTRAINT `fk_penyakit_radiologi` FOREIGN KEY (`id_penyakit`) REFERENCES `penyakit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reservasi`
--
ALTER TABLE `reservasi`
  ADD CONSTRAINT `fk_daftar_profil` FOREIGN KEY (`id_daftar_profil`) REFERENCES `daftar_profil` (`id`),
  ADD CONSTRAINT `fk_jadwall` FOREIGN KEY (`id_jam_kerja_dokter`) REFERENCES `jam_kerja_dokter` (`id`);

--
-- Constraints for table `token`
--
ALTER TABLE `token`
  ADD CONSTRAINT `id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
