-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2017 at 04:53 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gpsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `antennas`
--

CREATE TABLE `antennas` (
  `id` int(11) NOT NULL,
  `serial_number` varchar(255) NOT NULL,
  `part_number` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contact_numbers`
--

CREATE TABLE `contact_numbers` (
  `id` int(11) NOT NULL,
  `number` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `staffId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_numbers`
--

INSERT INTO `contact_numbers` (`id`, `number`, `createdAt`, `updatedAt`, `staffId`) VALUES
(1, '09209647632', '2017-04-10 02:57:41', '2017-04-10 02:57:41', 1),
(2, '09177021092', '2017-04-10 03:03:19', '2017-04-10 03:03:19', 2),
(3, '09214442132', '2017-04-10 03:03:19', '2017-04-10 03:03:19', 2),
(4, '09064999059', '2017-04-10 03:12:35', '2017-04-10 03:12:35', 3),
(5, '09065619965', '2017-04-10 03:18:32', '2017-04-10 03:18:32', 4),
(6, '09175005328', '2017-04-10 03:29:22', '2017-04-10 03:29:22', 5),
(7, '09065653712', '2017-04-10 03:37:03', '2017-04-10 03:37:03', 6),
(8, '09755241067', '2017-04-10 03:40:56', '2017-04-10 03:40:56', 7),
(9, '09420948765', '2017-04-10 03:40:56', '2017-04-10 03:40:56', 7),
(10, '09219361594', '2017-04-10 03:40:56', '2017-04-10 03:40:56', 7),
(11, '09062121697', '2017-04-10 03:44:21', '2017-04-10 03:44:21', 8),
(12, '09268199760', '2017-04-10 04:28:26', '2017-04-10 04:28:26', 9),
(13, '09067622636', '2017-04-10 04:51:57', '2017-04-10 04:51:57', 10),
(14, '09266684954', '2017-04-10 05:00:03', '2017-04-10 05:00:03', 11),
(15, '09169141571', '2017-04-10 05:11:53', '2017-04-10 05:11:53', 12),
(16, '09168606479', '2017-04-10 06:31:55', '2017-04-10 06:31:55', 13),
(17, '09778308547', '2017-04-10 06:38:39', '2017-04-10 06:38:39', 14),
(18, '09287155877', '2017-04-10 06:41:46', '2017-04-10 06:41:46', 15),
(19, '09629851740', '2017-04-10 07:14:09', '2017-04-10 07:14:09', 16),
(20, '09392204390', '2017-04-10 07:14:09', '2017-04-10 07:14:09', 16),
(21, '09494494591', '2017-04-10 07:30:32', '2017-04-10 07:30:32', 17),
(22, '09163571883', '2017-04-10 07:32:23', '2017-04-10 07:32:23', 18),
(23, '09203375863', '2017-04-10 07:46:04', '2017-04-10 07:46:04', 19),
(24, '09154382970', '2017-04-10 08:09:04', '2017-04-10 08:09:04', 20),
(25, '09152147534', '2017-04-10 08:14:08', '2017-04-10 08:14:08', 21),
(26, '09159121087', '2017-04-10 08:18:23', '2017-04-10 08:18:23', 22),
(27, '0906898297', '2017-04-10 08:21:00', '2017-04-10 08:21:00', 23),
(28, '09214408764', '2017-04-18 01:55:31', '2017-04-18 01:55:31', 24),
(29, '09174422952', '2017-04-18 01:56:41', '2017-04-18 01:56:41', 25),
(30, '09085334194', '2017-04-18 01:57:48', '2017-04-18 01:57:48', 26),
(31, '09955559284', '2017-04-18 01:57:48', '2017-04-18 01:57:48', 26),
(32, '09186008331', '2017-04-18 01:59:06', '2017-04-18 01:59:06', 27),
(33, '09186008331', '2017-04-18 01:59:06', '2017-04-18 01:59:06', 27),
(34, '09056006821', '2017-04-18 02:25:05', '2017-04-18 02:25:05', 28),
(35, '09154985767', '2017-04-18 02:26:45', '2017-04-18 02:26:45', 29),
(36, '09182046263', '2017-04-18 02:26:45', '2017-04-18 02:26:45', 29),
(37, '09068935838', '2017-04-18 02:28:41', '2017-04-18 02:28:41', 30),
(38, '09309900683', '2017-04-18 02:30:03', '2017-04-18 02:30:03', 31),
(39, '09426544702', '2017-04-18 02:31:50', '2017-04-18 02:31:50', 32),
(40, '09297275495', '2017-04-18 02:32:48', '2017-04-18 02:32:48', 33),
(41, '09219588822', '2017-04-18 02:33:47', '2017-04-18 02:33:47', 34),
(42, '09162711598', '2017-04-18 02:34:43', '2017-04-18 02:34:43', 35),
(43, '09063476052', '2017-04-18 02:35:52', '2017-04-18 02:35:52', 36),
(44, '09987211247', '2017-04-18 02:41:40', '2017-04-18 02:41:40', 37),
(45, '09236922204', '2017-04-18 02:43:17', '2017-04-18 02:43:17', 38);

-- --------------------------------------------------------

--
-- Table structure for table `contact_people`
--

CREATE TABLE `contact_people` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `position` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) NOT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `email_add` varchar(255) DEFAULT NULL,
  `address_one` varchar(255) DEFAULT NULL,
  `address_two` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `divisions`
--

CREATE TABLE `divisions` (
  `id` int(11) NOT NULL,
  `division_name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `divisions`
--

INSERT INTO `divisions` (`id`, `division_name`, `createdAt`, `updatedAt`) VALUES
(1, 'GGRDD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'SOEPD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'VMEPD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'ADMIN/SCIENCE AIDE', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `id` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `staffId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emails`
--

INSERT INTO `emails` (`id`, `address`, `createdAt`, `updatedAt`, `staffId`) VALUES
(1, 'tbacolcol@yahoo.com', '2017-04-10 02:57:41', '2017-04-10 02:57:41', 1),
(2, 'apelicano@gmail.com', '2017-04-10 03:03:19', '2017-04-10 03:03:19', 2),
(3, 'alfie.pelicano@phivolcs.dost.gov.ph', '2017-04-10 03:03:19', '2017-04-10 03:03:19', 2),
(4, 'genesissaplajr@gmail.com', '2017-04-10 03:12:35', '2017-04-10 03:12:35', 3),
(5, 'bryan.marfito@gmail.com', '2017-04-10 03:18:32', '2017-04-10 03:18:32', 4),
(6, 'yonparas@gmail.com', '2017-04-10 03:29:22', '2017-04-10 03:29:22', 5),
(7, 'ragadiozach@gmail.com', '2017-04-10 03:37:03', '2017-04-10 03:37:03', 6),
(8, 'albert.baloto19@gmail.com', '2017-04-10 03:40:56', '2017-04-10 03:40:56', 7),
(9, 'michaeljohnperalta.mjp@gmail.com', '2017-04-10 03:44:21', '2017-04-10 03:44:21', 8),
(10, 'oriel.absin@gmail.com', '2017-04-10 04:28:26', '2017-04-10 04:28:26', 9),
(11, 'lafradesruescelle@gmail.com', '2017-04-10 04:51:57', '2017-04-10 04:51:57', 10),
(12, 'deollamas08@gmail.com', '2017-04-10 05:00:03', '2017-04-10 05:00:03', 11),
(13, 'robelynmangahas@gmail.com', '2017-04-10 05:11:53', '2017-04-10 05:11:53', 12),
(14, 'kmvitto@gmail.com', '2017-04-10 06:31:55', '2017-04-10 06:31:55', 13),
(15, ' mmpronald@yahoo.com.ph', '2017-04-10 06:38:39', '2017-04-10 06:38:39', 14),
(16, 'rjorgio@yahoo.com', '2017-04-10 06:41:46', '2017-04-10 06:41:46', 15),
(17, 'rlabayog@yahoo.com', '2017-04-10 07:14:09', '2017-04-10 07:14:09', 16),
(18, 'esplidar@yahoo.com.ph', '2017-04-10 07:30:32', '2017-04-10 07:30:32', 17),
(19, 'marjesjaime@yahoo.com', '2017-04-10 07:32:23', '2017-04-10 07:32:23', 18),
(20, 'wilmeral2000@yahoo.com', '2017-04-10 07:46:04', '2017-04-10 07:46:04', 19),
(21, 'laicramv2@yahoo.com', '2017-04-10 08:09:04', '2017-04-10 08:09:04', 20),
(22, 'nolanbohol@yahoo.com', '2017-04-10 08:14:08', '2017-04-10 08:14:08', 21),
(23, 'milotabigue@yahoo.com', '2017-04-10 08:18:23', '2017-04-10 08:18:23', 22),
(24, 'elauron@yahoo.com', '2017-04-10 08:21:00', '2017-04-10 08:21:00', 23),
(25, 'rainer_amilbahar@yahoo.com', '2017-04-18 01:55:31', '2017-04-18 01:55:31', 24),
(26, 'rudylacson@yahoo.com', '2017-04-18 01:56:41', '2017-04-18 01:56:41', 25),
(27, 'lumbar99@yahoo.com', '2017-04-18 01:57:48', '2017-04-18 01:57:48', 26),
(28, 'bong_luis@yahoo.com', '2017-04-18 01:59:06', '2017-04-18 01:59:06', 27),
(29, 'lsalugsugan@yahoo.com', '2017-04-18 02:25:05', '2017-04-18 02:25:05', 28),
(30, 'r_pigtain@yahoo.com', '2017-04-18 02:26:45', '2017-04-18 02:26:45', 29),
(31, 'angelo.abang@philvolcs.dost.gov.ph', '2017-04-18 02:28:41', '2017-04-18 02:28:41', 30),
(32, 'allanloza@yahoo.com', '2017-04-18 02:30:03', '2017-04-18 02:30:03', 31);

-- --------------------------------------------------------

--
-- Table structure for table `logsheets`
--

CREATE TABLE `logsheets` (
  `id` int(11) NOT NULL,
  `fieldwork_id` int(11) DEFAULT NULL,
  `site_name` varchar(255) NOT NULL,
  `survey_type` varchar(255) NOT NULL,
  `logsheet_date` datetime NOT NULL,
  `julian_day` int(11) NOT NULL,
  `marker` varchar(255) NOT NULL,
  `receiver_serialnumber` varchar(255) NOT NULL,
  `antenna_serialnumber` varchar(255) NOT NULL,
  `height` double DEFAULT NULL,
  `north` double DEFAULT NULL,
  `east` double DEFAULT NULL,
  `south` double DEFAULT NULL,
  `west` double DEFAULT NULL,
  `time_start` time DEFAULT NULL,
  `time_end` time DEFAULT NULL,
  `azimuth` int(11) DEFAULT NULL,
  `failure_time` time DEFAULT NULL,
  `receiver_status` varchar(255) DEFAULT NULL,
  `antenna_status` varchar(255) DEFAULT NULL,
  `rod_num` int(11) DEFAULT NULL,
  `rod_correction` int(11) DEFAULT NULL,
  `avg_slant_height` double DEFAULT NULL,
  `ip_add` varchar(255) DEFAULT NULL,
  `netmask` varchar(255) DEFAULT NULL,
  `gateway` varchar(255) DEFAULT NULL,
  `dns` varchar(255) DEFAULT NULL,
  `local_tcp_port` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `site_sketch_id` int(11) DEFAULT NULL,
  `observed_situation` varchar(255) DEFAULT NULL,
  `lodging_road_information` varchar(255) DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `others` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `id` int(11) NOT NULL,
  `position_name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`id`, `position_name`, `createdAt`, `updatedAt`) VALUES
(1, 'Associate Scientist', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'SR Analyst', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'SR Assistant', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'SRS II', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'SRS I', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'Senior SRS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'Job Order', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'Science Aide', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'Admin Aide IV', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'Admin Aide III', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `receivers`
--

CREATE TABLE `receivers` (
  `id` int(11) NOT NULL,
  `serial_number` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `part_number` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `site_names`
--

CREATE TABLE `site_names` (
  `id` int(11) NOT NULL,
  `site_name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staffs`
--

CREATE TABLE `staffs` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `office_location` varchar(255) NOT NULL,
  `birthday` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `positionId` int(11) DEFAULT NULL,
  `divisionId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staffs`
--

INSERT INTO `staffs` (`id`, `first_name`, `last_name`, `nickname`, `office_location`, `birthday`, `createdAt`, `updatedAt`, `positionId`, `divisionId`) VALUES
(1, 'Teresito', 'Bacolcol ', 'Toto', 'Main Office', '1973-03-30 16:00:00', '2017-04-10 02:57:41', '2017-04-10 02:57:41', 1, 1),
(2, 'Alfie', 'Pelicano', 'Alfie', 'Main Office', '1982-11-02 16:00:00', '2017-04-10 03:03:19', '2017-04-10 03:03:19', 4, 1),
(3, 'Genesis', 'Sapla', 'Geno', 'Main Office', '1987-11-18 16:00:00', '2017-04-10 03:12:35', '2017-04-10 03:12:35', 5, 1),
(4, 'Bryan', 'Marfito', 'Bryan', 'Main Office', '1993-07-20 16:00:00', '2017-04-10 03:18:31', '2017-04-10 03:18:31', 5, 1),
(5, 'Marion', 'Paras', 'Marion', 'Main Office', '1994-08-09 16:00:00', '2017-04-10 03:29:22', '2017-04-10 03:29:22', 7, 1),
(6, 'Zachary', 'Ragadio', 'Zach', 'Main Office', '1990-09-20 16:00:00', '2017-04-10 03:37:03', '2017-04-10 03:37:03', 7, 1),
(7, 'Alberto', 'Baloto', 'Albert', 'Main Office', '1972-06-18 16:00:00', '2017-04-10 03:40:56', '2017-04-10 03:40:56', 7, 1),
(8, 'Michael John', 'Peralta', 'Michael', 'Main Office', '1988-07-29 16:00:00', '2017-04-10 03:44:21', '2017-04-10 03:44:21', 7, 1),
(9, 'Oriel Vinci', 'Absin', 'Oriel', 'Main Office', '1989-12-02 16:00:00', '2017-04-10 04:28:26', '2017-04-10 04:28:26', 7, 1),
(10, 'Reuscelle', 'Lafrades', 'Celle', 'Main Office', '1994-06-01 16:00:00', '2017-04-10 04:51:57', '2017-04-10 04:51:57', 7, 1),
(11, 'Deo', 'Llamas', 'Deo', 'Main Office', '1993-10-08 16:00:00', '2017-04-10 05:00:02', '2017-04-10 05:00:02', 5, 1),
(12, 'Robelyn', 'Mangahas', 'Robelyn', 'Main Office', '1992-10-07 16:00:00', '2017-04-10 05:11:53', '2017-04-10 05:11:53', 5, 1),
(13, 'Kimberly', 'Vitto', 'Kim', 'Main Office', '1992-04-27 16:00:00', '2017-04-10 06:31:55', '2017-04-10 06:31:55', 5, 1),
(14, 'Ronald', 'Dela Cruz', 'Ronald', 'Masbate', '1969-09-09 16:00:00', '2017-04-10 06:38:39', '2017-04-10 06:38:39', 2, 2),
(15, 'Robinson', 'Jorgio', 'Bombom', 'Lapu-Lapu', '1967-04-27 16:00:00', '2017-04-10 06:41:45', '2017-04-10 06:41:45', 5, 2),
(16, 'Allan', 'Labayog', 'Allan', 'Zamboanga', '1979-04-20 16:00:00', '2017-04-10 07:14:09', '2017-04-10 07:14:09', 2, 2),
(17, 'Roberto', 'Esplida', 'Robert', 'Puerto Princesa', '1972-06-12 16:00:00', '2017-04-10 07:30:32', '2017-04-10 07:30:32', 2, 2),
(18, 'Jaime', 'Marjes', 'Jaime', 'Guinyangan', '1957-04-12 16:00:00', '2017-04-10 07:32:23', '2017-04-10 07:32:23', 5, 2),
(19, 'Wilmer ', 'Legaspi', 'Wilmer', 'Palayan', '1967-02-09 16:00:00', '2017-04-10 07:46:04', '2017-04-10 07:46:04', 2, 2),
(20, 'Maricial', 'Vito', 'Maricial', 'Lucban', '1967-11-01 16:00:00', '2017-04-10 08:09:04', '2017-04-10 08:09:04', 3, 2),
(21, 'Nolan', 'Evangelista', 'Nolan', 'Tagbilaran', '1968-10-27 16:00:00', '2017-04-10 08:14:08', '2017-04-10 08:14:08', 2, 2),
(22, 'Milo', 'Tabigue', 'Milo', 'Kidapawan', '1970-03-22 16:00:00', '2017-04-10 08:18:23', '2017-04-10 08:18:23', 2, 2),
(23, 'Eduardo', 'Lauron', 'Bong', 'Zamboanga', '1968-04-22 16:00:00', '2017-04-10 08:21:00', '2017-04-10 08:21:00', 2, 2),
(24, 'Rainier', 'Amilbahar', 'Rainer', 'Cotabato', '1971-06-23 16:00:00', '2017-04-18 01:55:30', '2017-04-18 01:55:30', 2, 2),
(25, 'Rudy', 'Lacson', 'Rudy', 'Main Office', '1971-04-25 16:00:00', '2017-04-18 01:56:41', '2017-04-18 01:56:41', 6, 3),
(26, 'Rey', 'Lumbag', 'Rey', 'Pinatubo', '1971-09-20 16:00:00', '2017-04-18 01:57:48', '2017-04-18 01:57:48', 5, 3),
(27, 'Artemio', 'Luis', 'Bong', 'Main Office', '1971-04-14 16:00:00', '2017-04-18 01:59:05', '2017-04-18 01:59:05', 4, 3),
(28, 'Luisito', 'Salugsugan', 'Diding', 'Hibok-Hibok', '1957-07-23 16:00:00', '2017-04-18 02:25:05', '2017-04-18 02:25:05', 2, 3),
(29, 'Ronald', 'Pigtain', 'Ronald', 'Main Office', '1964-09-15 16:00:00', '2017-04-18 02:26:45', '2017-04-18 02:26:45', 4, 3),
(30, 'Angelo', 'Abang', 'Angelo', 'Hibok-Hibok', '1964-10-13 16:00:00', '2017-04-18 02:28:41', '2017-04-18 02:28:41', 3, 3),
(31, 'Allan ', 'Loza', 'Allan', 'Taal', '1972-04-13 16:00:00', '2017-04-18 02:30:03', '2017-04-18 02:30:03', 5, 3),
(32, 'Renato', 'Garduque', 'Atoy', 'Main Office', '1968-08-02 16:00:00', '2017-04-18 02:31:49', '2017-04-18 02:31:49', 8, 4),
(33, 'Edwin', 'Ariola', 'Nono', 'Main Office', '1959-08-03 16:00:00', '2017-04-18 02:32:48', '2017-04-18 02:32:48', 9, 4),
(34, 'Manolito', 'Begonia', 'Lito', 'Main Office', '1963-01-27 16:00:00', '2017-04-18 02:33:47', '2017-04-18 02:33:47', 9, 4),
(35, 'Eric', 'Tejerero', 'Eric', 'Main Office', '1978-03-04 16:00:00', '2017-04-18 02:34:43', '2017-04-18 02:34:43', 10, 4),
(36, 'Noah', 'Reblora', 'Noah', 'Main Office', '1972-12-10 16:00:00', '2017-04-18 02:35:52', '2017-04-18 02:35:52', 7, 4),
(37, 'Roderick', 'Ramos', 'Deck', 'Main Office', '1973-11-23 16:00:00', '2017-04-18 02:41:40', '2017-04-18 02:41:40', 7, 4),
(38, 'Jay', 'Gusi', 'Jay', 'Main Office', '1973-05-30 16:00:00', '2017-04-18 02:43:17', '2017-04-18 02:43:17', 7, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `antennas`
--
ALTER TABLE `antennas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `serial_number` (`serial_number`),
  ADD UNIQUE KEY `antennas_serial_number_unique` (`serial_number`);

--
-- Indexes for table `contact_numbers`
--
ALTER TABLE `contact_numbers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staffId` (`staffId`);

--
-- Indexes for table `contact_people`
--
ALTER TABLE `contact_people`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_add` (`email_add`),
  ADD UNIQUE KEY `contact_people_email_add_unique` (`email_add`);

--
-- Indexes for table `divisions`
--
ALTER TABLE `divisions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staffId` (`staffId`);

--
-- Indexes for table `logsheets`
--
ALTER TABLE `logsheets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `receivers`
--
ALTER TABLE `receivers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `serial_number` (`serial_number`),
  ADD UNIQUE KEY `receivers_serial_number_unique` (`serial_number`);

--
-- Indexes for table `site_names`
--
ALTER TABLE `site_names`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `site_name` (`site_name`),
  ADD UNIQUE KEY `site_names_site_name_unique` (`site_name`);

--
-- Indexes for table `staffs`
--
ALTER TABLE `staffs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `positionId` (`positionId`),
  ADD KEY `divisionId` (`divisionId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `antennas`
--
ALTER TABLE `antennas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contact_numbers`
--
ALTER TABLE `contact_numbers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `contact_people`
--
ALTER TABLE `contact_people`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `divisions`
--
ALTER TABLE `divisions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `logsheets`
--
ALTER TABLE `logsheets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `receivers`
--
ALTER TABLE `receivers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `site_names`
--
ALTER TABLE `site_names`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `staffs`
--
ALTER TABLE `staffs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `contact_numbers`
--
ALTER TABLE `contact_numbers`
  ADD CONSTRAINT `contact_numbers_ibfk_1` FOREIGN KEY (`staffId`) REFERENCES `staffs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `emails`
--
ALTER TABLE `emails`
  ADD CONSTRAINT `emails_ibfk_1` FOREIGN KEY (`staffId`) REFERENCES `staffs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `staffs`
--
ALTER TABLE `staffs`
  ADD CONSTRAINT `staffs_ibfk_1` FOREIGN KEY (`positionId`) REFERENCES `positions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `staffs_ibfk_2` FOREIGN KEY (`divisionId`) REFERENCES `divisions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
