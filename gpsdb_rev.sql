-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 25, 2017 at 11:50 AM
-- Server version: 5.7.20-0ubuntu0.17.04.1
-- PHP Version: 7.0.22-0ubuntu0.17.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gpsdb_rev`
--

-- --------------------------------------------------------

--
-- Table structure for table `access_levels`
--

CREATE TABLE `access_levels` (
  `id` int(11) NOT NULL,
  `type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `antennas`
--

CREATE TABLE `antennas` (
  `id` int(11) NOT NULL,
  `serial_number` varchar(150) NOT NULL,
  `part_number` varchar(150) NOT NULL,
  `retirement_date` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `antenna_model_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `antenna_models`
--

CREATE TABLE `antenna_models` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `equipment_brand_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_logsheets`
--

CREATE TABLE `campaign_logsheets` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `height_north_meters` double NOT NULL,
  `height_east_meters` double NOT NULL,
  `height_south_meters` double NOT NULL,
  `height_west_meters` double NOT NULL,
  `time_start` time DEFAULT NULL,
  `time_end` time DEFAULT NULL,
  `failure_time` time DEFAULT NULL,
  `azimuth` float DEFAULT NULL,
  `notes` varchar(1024) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `site_id` int(11) DEFAULT NULL,
  `antenna_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_observers`
--

CREATE TABLE `campaign_observers` (
  `campaign_logsheet_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contact_numbers`
--

CREATE TABLE `contact_numbers` (
  `id` int(11) NOT NULL,
  `number` varchar(30) NOT NULL,
  `person_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_numbers`
--

INSERT INTO `contact_numbers` (`id`, `number`, `person_id`) VALUES
(1, '09209647632', 1),
(2, '09177021092', 2),
(3, '09214442132', 2),
(4, '09064999059', 3),
(5, '09065619965', 4),
(6, '09175005328', 5),
(7, '09065653712', 6),
(8, '09755241067', 7),
(9, '09420948765', 7),
(10, '09219361594', 7),
(11, '09177699912', 8),
(12, '09268199760', 9),
(13, '09067622636', 10),
(14, '09266684954', 11),
(15, '09169141571', 12),
(16, '09168606479', 13),
(17, '09778308547', 14),
(18, '09287155877', 15),
(19, '09629851740', 16),
(20, '09392204390', 16),
(21, '09494494591', 17),
(22, '09163571883', 18),
(23, '09203375863', 19),
(24, '09154382970', 20),
(25, '09152147534', 21),
(26, '09159121087', 22),
(27, '0906898297', 23),
(28, '09214408764', 24),
(29, '09174422952', 25),
(30, '09085334194', 26),
(31, '09955559284', 26),
(32, '09186008331', 27),
(33, '09186008331', 27),
(34, '09056006821', 28),
(35, '09154985767', 29),
(36, '09182046263', 29),
(37, '09068935838', 30),
(38, '09309900683', 31),
(39, '09426544702', 32),
(40, '09297275495', 33),
(41, '09219588822', 34),
(42, '09162711598', 35),
(43, '09063476052', 36),
(44, '09987211247', 37),
(45, '09236922204', 38);

-- --------------------------------------------------------

--
-- Table structure for table `continuous_logsheets`
--

CREATE TABLE `continuous_logsheets` (
  `id` int(11) NOT NULL,
  `is_power_on` int(1) NOT NULL,
  `date` datetime NOT NULL,
  `battery_condition` varchar(1024) DEFAULT NULL,
  `charger_condition` varchar(1024) DEFAULT NULL,
  `other_notes` varchar(1024) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `site_id` int(11) DEFAULT NULL,
  `antenna_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `continuous_observers`
--

CREATE TABLE `continuous_observers` (
  `continuous_logsheet_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `divisions`
--

CREATE TABLE `divisions` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `divisions`
--

INSERT INTO `divisions` (`id`, `name`) VALUES
(1, 'GGRDD'),
(2, 'SOEPD'),
(3, 'VMEPD'),
(4, 'ADMIN/SCIENCE AIDE');

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `person_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emails`
--

INSERT INTO `emails` (`id`, `address`, `person_id`) VALUES
(1, 'tbacolcol@yahoo.com', 1),
(2, 'apelicano@gmail.com', 2),
(3, 'alfie.pelicano@phivolcs.dost.gov.ph', 2),
(4, 'genesissaplajr@gmail.com', 3),
(5, 'bryan.marfito@gmail.com', 4),
(6, 'yonparas@gmail.com', 5),
(7, 'ragadiozach@gmail.com', 6),
(8, 'albert.baloto19@gmail.com', 7),
(9, 'kathleencrizeldamon@gmail.com', 8),
(10, 'oriel.absin@gmail.com', 9),
(11, 'lafradesruescelle@gmail.com', 10),
(12, 'deollamas08@gmail.com', 11),
(13, 'robelynmangahas@gmail.com', 12),
(14, 'kmvitto@gmail.com', 13),
(15, ' mmpronald@yahoo.com.ph', 14),
(16, 'rjorgio@yahoo.com', 15),
(17, 'rlabayog@yahoo.com', 16),
(18, 'esplidar@yahoo.com.ph', 17),
(19, 'marjesjaime@yahoo.com', 18),
(20, 'wilmeral2000@yahoo.com', 19),
(21, 'laicramv2@yahoo.com', 20),
(22, 'nolanbohol@yahoo.com', 21),
(23, 'milotabigue@yahoo.com', 22),
(24, 'elauron@yahoo.com', 23),
(25, 'rainer_amilbahar@yahoo.com', 24),
(26, 'rudylacson@yahoo.com', 25),
(27, 'lumbar99@yahoo.com', 26),
(28, 'bong_luis@yahoo.com', 27),
(29, 'lsalugsugan@yahoo.com', 28),
(30, 'r_pigtain@yahoo.com', 29),
(31, 'angelo.abang@philvolcs.dost.gov.ph', 30);

-- --------------------------------------------------------

--
-- Table structure for table `equipment_brands`
--

CREATE TABLE `equipment_brands` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `markers`
--

CREATE TABLE `markers` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `non_staff_positions`
--

CREATE TABLE `non_staff_positions` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `office_locations`
--

CREATE TABLE `office_locations` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

CREATE TABLE `people` (
  `id` int(11) NOT NULL,
  `first_name` varchar(35) NOT NULL,
  `last_name` varchar(35) NOT NULL,
  `nick_name` varchar(35) NOT NULL,
  `birthdate` datetime DEFAULT NULL,
  `profile_photo` blob,
  `position_id` int(11) DEFAULT NULL,
  `division_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `person_type_id` int(11) DEFAULT NULL,
  `non_staff_position_id` int(11) DEFAULT NULL,
  `office_location_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `people`
--

INSERT INTO `people` (`id`, `first_name`, `last_name`, `nick_name`, `birthdate`, `profile_photo`, `position_id`, `division_id`, `site_id`, `person_type_id`, `non_staff_position_id`, `office_location_id`) VALUES
(1, 'Teresito', 'Bacolcol ', 'Toto', '1973-03-30 16:00:00', NULL, 1, 1, NULL, NULL, NULL, NULL),
(2, 'Alfie', 'Pelicano', 'Alfie', '1982-11-02 16:00:00', NULL, 4, 1, NULL, NULL, NULL, NULL),
(3, 'Genesis', 'Sapla', 'Geno', '1987-11-18 16:00:00', NULL, 5, 1, NULL, NULL, NULL, NULL),
(4, 'Bryan', 'Marfito', 'Bryan', '1993-07-20 16:00:00', NULL, 5, 1, NULL, NULL, NULL, NULL),
(5, 'Marion', 'Paras', 'Marion', '1994-08-09 16:00:00', NULL, 7, 1, NULL, NULL, NULL, NULL),
(6, 'Zachary', 'Ragadio', 'Zach', '1990-09-20 16:00:00', NULL, 7, 1, NULL, NULL, NULL, NULL),
(7, 'Alberto', 'Baloto', 'Albert', '1972-06-18 16:00:00', NULL, 7, 1, NULL, NULL, NULL, NULL),
(8, 'Kathleen Crizelda', 'Guillo', 'KayCee', '1989-03-31 16:00:00', NULL, 7, 1, NULL, NULL, NULL, NULL),
(9, 'Oriel Vinci', 'Absin', 'Oriel', '1989-12-02 16:00:00', NULL, 7, 1, NULL, NULL, NULL, NULL),
(10, 'Reuscelle', 'Lafrades', 'Celle', '1994-06-01 16:00:00', NULL, 7, 1, NULL, NULL, NULL, NULL),
(11, 'Deo', 'Llamas', 'Deo', '1993-10-08 16:00:00', NULL, 5, 1, NULL, NULL, NULL, NULL),
(12, 'Robelyn', 'Mangahas', 'Robelyn', '1992-10-07 16:00:00', NULL, 5, 1, NULL, NULL, NULL, NULL),
(13, 'Kimberly', 'Vitto', 'Kim', '1992-04-27 16:00:00', NULL, 5, 1, NULL, NULL, NULL, NULL),
(14, 'Ronald', 'Dela Cruz', 'Ronald', '1969-09-09 16:00:00', NULL, 2, 2, NULL, NULL, NULL, NULL),
(15, 'Robinson', 'Jorgio', 'Bombom', '1967-04-27 16:00:00', NULL, 5, 2, NULL, NULL, NULL, NULL),
(16, 'Allan', 'Labayog', 'Allan', '1979-04-20 16:00:00', NULL, 2, 2, NULL, NULL, NULL, NULL),
(17, 'Roberto', 'Esplida', 'Robert', '1972-06-12 16:00:00', NULL, 2, 2, NULL, NULL, NULL, NULL),
(18, 'Jaime', 'Marjes', 'Jaime', '1957-04-12 16:00:00', NULL, 5, 2, NULL, NULL, NULL, NULL),
(19, 'Wilmer ', 'Legaspi', 'Wilmer', '1967-02-09 16:00:00', NULL, 2, 2, NULL, NULL, NULL, NULL),
(20, 'Maricial', 'Vito', 'Maricial', '1967-11-01 16:00:00', NULL, 3, 2, NULL, NULL, NULL, NULL),
(21, 'Nolan', 'Evangelista', 'Nolan', '1968-10-27 16:00:00', NULL, 2, 2, NULL, NULL, NULL, NULL),
(22, 'Milo', 'Tabigue', 'Milo', '1970-03-22 16:00:00', NULL, 2, 2, NULL, NULL, NULL, NULL),
(23, 'Eduardo', 'Lauron', 'Bong', '1968-04-22 16:00:00', NULL, 2, 2, NULL, NULL, NULL, NULL),
(24, 'Rainier', 'Amilbahar', 'Rainer', '1971-06-23 16:00:00', NULL, 2, 2, NULL, NULL, NULL, NULL),
(25, 'Rudy', 'Lacson', 'Rudy', '1971-04-25 16:00:00', NULL, 6, 3, NULL, NULL, NULL, NULL),
(26, 'Rey', 'Lumbag', 'Rey', '1971-09-20 16:00:00', NULL, 5, 3, NULL, NULL, NULL, NULL),
(27, 'Artemio', 'Luis', 'Bong', '1971-04-14 16:00:00', NULL, 4, 3, NULL, NULL, NULL, NULL),
(28, 'Luisito', 'Salugsugan', 'Diding', '1957-07-23 16:00:00', NULL, 2, 3, NULL, NULL, NULL, NULL),
(29, 'Ronald', 'Pigtain', 'Ronald', '1964-09-15 16:00:00', NULL, 4, 3, NULL, NULL, NULL, NULL),
(30, 'Angelo', 'Abang', 'Angelo', '1964-10-13 16:00:00', NULL, 3, 3, NULL, NULL, NULL, NULL),
(31, 'Allan ', 'Loza', 'Allan', '1972-04-13 16:00:00', NULL, 5, 3, NULL, NULL, NULL, NULL),
(32, 'Renato', 'Garduque', 'Atoy', '1968-08-02 16:00:00', NULL, 8, 4, NULL, NULL, NULL, NULL),
(33, 'Edwin', 'Ariola', 'Nono', '1959-08-03 16:00:00', NULL, 9, 4, NULL, NULL, NULL, NULL),
(34, 'Manolito', 'Begonia', 'Lito', '1963-01-27 16:00:00', NULL, 9, 4, NULL, NULL, NULL, NULL),
(35, 'Eric', 'Tejerero', 'Eric', '1978-03-04 16:00:00', NULL, 10, 4, NULL, NULL, NULL, NULL),
(36, 'Noah', 'Reblora', 'Noah', '1972-12-10 16:00:00', NULL, 7, 4, NULL, NULL, NULL, NULL),
(37, 'Roderick', 'Ramos', 'Deck', '1973-11-23 16:00:00', NULL, 7, 4, NULL, NULL, NULL, NULL),
(38, 'Jay', 'Gusi', 'Jay', '1973-05-30 16:00:00', NULL, 7, 4, NULL, NULL, NULL, NULL),
(39, 'Norberto', 'Salili', 'Bert', '1959-02-14 16:00:00', NULL, 9, 4, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `person_types`
--

CREATE TABLE `person_types` (
  `id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `description` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`id`, `name`) VALUES
(1, 'Associate Scientist'),
(2, 'SR Analyst'),
(3, 'SR Assistant'),
(4, 'SRS II'),
(5, 'SRS I'),
(6, 'Senior SRS'),
(7, 'Job Order'),
(8, 'Science Aide'),
(9, 'Admin Aide IV'),
(10, 'Admin Aide III');

-- --------------------------------------------------------

--
-- Table structure for table `receivers`
--

CREATE TABLE `receivers` (
  `id` int(11) NOT NULL,
  `serial_number` varchar(150) NOT NULL,
  `part_number` varchar(150) NOT NULL,
  `retirement_date` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `receiver_model_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `receiver_models`
--

CREATE TABLE `receiver_models` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `equipment_brand_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sites`
--

CREATE TABLE `sites` (
  `id` int(11) NOT NULL,
  `name` char(4) NOT NULL,
  `date_established` datetime DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `location` varchar(300) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `survey_type_id` int(1) DEFAULT NULL,
  `marker_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sites`
--

INSERT INTO `sites` (`id`, `name`, `date_established`, `latitude`, `longitude`, `location`, `description`, `createdAt`, `updatedAt`, `survey_type_id`, `marker_id`) VALUES
(1, 'AB14', NULL, 17.53837081, 120.7184678, 'Brgy. Poblacion, Bucay, Abra	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(2, 'ABLA', NULL, 13.4452747, 120.7284352, 'Abra de Ilog Catholic Church, Occidental Mindoro	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(3, 'ADMI', NULL, 11.1470564, 124.6383871, 'NOC-EDC Administration Building, Tongonan, Ormoc City	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(4, 'ALAB', NULL, 14.1024228, 122.0134832, 'Sangguniang Bayan Session Hall, Alabat Municipal Hall, Alabat, Quezon	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(5, 'ALBU', NULL, 10.9166844, 124.6941344, 'NCKU: Albuera Municipal Hall, Municipal Trial Court (2nd Floor), Leyte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(6, 'ALIC', NULL, 23.6701143, 133.8855175, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(7, 'ANGT', NULL, 14.9306337, 121.0268617, 'Matias A. Fernando Memorial School (formerly Angat Elementary School), Bulacan (2017) | Angat Municipal Hall, San Roque Angat, Bulacan	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(8, 'ANQ0', NULL, 16.2603114, 121.6494068, '[Nearby QRN16 (Destroyed) and QRN17] DENR Cenro, Abbag Nagtipunan,Quirino	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(9, 'ANTP', NULL, 14.6259637, 121.1684136, 'Bagong Nayon Barangay Hall, Antipolo City, Rizal	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(10, 'APAR', NULL, 18.3553058, 121.6472913, 'SSG office, 2nd floor, Aparri School of Arts and Trades (ASAT) DepED, Aparri Cagayan	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(11, 'AR17', NULL, 15.73977397, 121.3888477, 'Dianawa, Francisco Q dagyapen Memorial Elementary School, Maria Aurora, Aurora	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(12, 'AR30', NULL, 15.3329749, 121.3725308, 'Paaralang Elementarya ng Cabog, Cabog, Matawe Dingalan, Aurora	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(13, 'AROY', NULL, 12.5117133, 123.3986397, 'Aroroy, Masbate	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(14, 'ATIM', NULL, 13.9961616, 121.9122135, 'Municipio ng atimonan, Tagbakin Manggalayan Labak, Atimonan, Quezon	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(15, 'AUR1', NULL, NULL, NULL, '(Unknown Status last data 2008) Barangay 4, Poblacion, Baler, Aurora, Philippines	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(16, 'AURA', NULL, 15.7470585, 121.5323561, 'DepED Schools Division of Aurora, San luis, Aurora , Baler	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(17, 'AURO', NULL, 15.7571605, 121.5629633, '(Unknown Status last data 2010)Baler Elementary School, Aurora, Baler Bagbaguin	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(18, 'BACO', NULL, 13.3593457, 121.096718, '2nd floor, Solid Waste Management Office, Baco Municipal Hall, Baco, Oriental Mindoro	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(19, 'BAGB', NULL, 14.7178095, 121.0041737, 'Barangay Hall, Barangay 165, Zone 15, District 1, Bagbaguin, Caloocan City	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(20, 'BAGU', NULL, 16.4610586, 120.5884682, 'Bagio DOST office, La Trinidad, Benguet	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(21, 'BAKO', NULL, 6.4910545, 106.8489104, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(22, 'BALA', NULL, 14.6748317, 120.5303655, 'Provincial Capitol, Tenejero Fourlane Commercial, Balanga Bataan	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(23, 'BALU', NULL, 12.0391613, 123.19218, 'Balud, Masbate	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(24, 'BANI', NULL, 7.50562752, 124.6950133, 'Banisilan Municipal Hall, North Cotabato	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(25, 'BARB', NULL, 15.9744285, 120.4726615, 'Minien West, Brgy. Oraan East, Santa Barbara, Pangasinan	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(26, 'BASC', NULL, 20.4500633, 121.969457, 'Provincial Capitol, Assesors office Bldg., Provincial Capital of Batanes, Basco, Batanes	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(27, 'BATC', NULL, 18.0635916, 120.5595521, 'DOST Ilocos norte Science and Technology Center, National Highway Batac CIty, Ilocos Norte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(28, 'BAYB', NULL, 10.67701583, 124.7981036, 'NCKU: City Hall Compound of Baybay, Baybay City, Leyte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(29, 'BGB1', NULL, 15.6560544, 121.2144075, 'Private land Brgy. Calaanan, Bongabon, Nueva Ejica	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(30, 'BICA', NULL, 13.2397021, 123.8222801, 'Salvacion, Santo Domingo, Albay	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(31, 'BLNA', NULL, 16.3786876, 119.9146828, 'Bolinao seismic station, Bolinao, Pangasinan	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(32, 'BNBA', NULL, 15.8337086, 120.9597474, 'Sto. niño, Zone 7, San Jose City, Nueva Ecija	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(33, 'BNOR', NULL, NULL, NULL, 'Negros Oriental State University, Bais City	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(34, 'BOLI', NULL, 16.3856034, 119.8939018, 'Bolinao Central School, Bolinao, Pangasinan	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(35, 'BONG', NULL, 9.362423, 122.8083838, 'Bayawan City East Central School (BCECS), Telesforo Diao St., Bayawan, Negros Oriental	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(36, 'BONT', NULL, 17.0907531, 120.9779419, 'Provincial Engineering Office, Mount Province Tabuk Enrile, Cagayan Rd Bontoc, Mountain Province, Cordillera 	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(37, 'BRG1', NULL, 18.5203399, 120.6007594, 'Brgy. Ablan, Burgos, Ilocos Norte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(38, 'BRGC', NULL, 18.520349, 120.6007455, 'Pan-Philippine Hi-way, Burgos, Ilocos Norte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(39, 'BSCS', NULL, 16.98654364, 121.9587723, 'Benito Soliven Central Elementary School, Benito Soliven, Isabela	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(40, 'BTS3', NULL, 20.4383143, 121.9628131, 'Chanarian, Basco, Batanes	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(41, 'BTUN', NULL, 8.9530625, 125.5979939, 'DOST Butuan, Caraga State University, Butuan City, Agusan del Norte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(42, 'BUCA', NULL, 13.9126994, 121.5447799, 'Bucal Elementary School, Brgy. Bucal, Sariaya, Quezon	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(43, 'BUGS', NULL, 16.8000614, 120.8221146, 'Buguias Town Hall, Abatan, Buguias, Benguet	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(44, 'BULA', NULL, 12.3253948, 121.3439113, 'Bulalacao Municipal Hall, Bulalacao Oriental Mindoro	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(45, 'BURG', NULL, 13.9178117, 121.8178012, 'Padre Burgos Central School, Padre Burgos, Quezon	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(46, 'BURN', NULL, 10.97430382, 124.8923936, 'NCKU: Burauen, Leyte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(47, 'CABN', NULL, 15.4796009, 120.9602327, '6 Pan-Philippine High way, Cabanatuan City, 3100 Nueva Ecija	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(48, 'CACA', NULL, 13.9303073, 120.8127971, 'Calaca Municipal Hall, Calaca, Batangas	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(49, 'CALA', NULL, 13.4115063, 121.1797421, 'PDIC Building Calapan, Oriental Mindoro	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(50, 'CALB', NULL, 13.28915297, 123.7282787, 'VMEPD: Mayon cGPS	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(51, 'CALC', NULL, 14.7178096, 121.0041737, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(52, 'CALI', NULL, 11.1224904, 122.5373974, 'Town Plaza, Calinog, Iloilo	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(53, 'CARI', NULL, 11.3006865, 124.6866773, 'Town Plaza fronting catholic church, brgy. Ponog, Carigara Leyte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(54, 'CATA', NULL, 13.5865324, 124.2358596, 'Poblacion, Cataingan, Masbate	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(55, 'CATM', NULL, 8.6461533, 125.7066191, 'Catmonon Elementary School, Catmonon, Esperanza, Agusan del Sur	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(56, 'CEA1', NULL, 10.382953, 123.6571769, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(57, 'CEB1', NULL, 10.7285052, 124.0128965, 'Catmon Central Elementary School, Cebu	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(58, 'CEBA', NULL, 10.3829549, 123.6571761, '[Auxiliary CEA1] Middle of the oval, Toledo Vocational National High School Toledo City, Cebu	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(59, 'CEBB', NULL, 9.9388347, 123.3925638, 'Moalboal Central Elementary School, Moalboal, Cebu	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(60, 'CEBC', NULL, 11.08148285, 123.9378031, 'San Remegio Central Elementary School, M. Quezon Street, San Remegio, Cebu	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(61, 'CEBD', NULL, 10.9415456, 124.0279516, 'Tabogon Central Elementary school, Tabogon, Cebu Province	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(62, 'CEBU', NULL, 10.31688257, 123.9661401, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(63, 'CG95', NULL, NULL, NULL, 'Appari, Bangag, Cagayan	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(64, 'CLAV', NULL, 18.6069283, 121.083895, '(Claveria Grassroots Multi- Purpose Cooperative) Centro 3, Claveria, Cagayan 3519 Nangasangan St. Claveria, Cagayan	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(65, 'CLYN', NULL, 19.2617882, 121.475183, 'Municipal Hall of Calayan, Calayan Island, Cagayan	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(66, 'CMGN', NULL, 18.9070999, 121.8672626, 'Lyceum of Camiguin Church, Camiguin Island, Cagayan	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(67, 'CMN2', NULL, 14.1344237, 122.982716, 'Barangay Bagasbas, Daet City, Camarines Norte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(68, 'CMS2', NULL, 13.7608793, 123.2861196, 'Brgy. Sibobo, Calabanga, Camarines Sur	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(69, 'CNTA', NULL, 14.5796656, 121.1148132, 'Cainta People Center, Sto. Domingo, Cainta, Rizal	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(70, 'COTA', NULL, 7.854524, 125.0492082, 'Central Mindanao University, Musuan Campus, Maramag, Bukidnon	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(71, 'COTB', NULL, 7.00634053, 125.0900923, 'Kidapawan COty Pilot School, Kidapawan City, Cotabatao	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(72, 'COTC', NULL, 6.750466, 125.3575165, 'Digos City National High School, Digos City, Davao Del Sur	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(73, 'COTD', NULL, 6.06684688, 125.1254645, 'Mindanao State University, Tambler Campus, Gen. Santos City	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(74, 'COTE', NULL, 6.63532756, 124.5995237, '(Nearby CTE1) Isulan Central School, Isulan, Sultan Kudarat	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(75, 'COTF', NULL, 5.99245822, 124.6219092, 'Kiamba National High School, Kiamba, Saranggani	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(76, 'COTG', NULL, 7.2225326, 124.2457335, 'Cotabato City Central Pilot School, Sinsuat Avenue, Cotabato City	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(77, 'COTH', NULL, 7.99538553, 124.2581582, '(MSU Open Field) Mindanao State University, Lanao Del Sur, Marawi	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(78, 'CRIS', NULL, 15.7829321, 121.0595317, 'Brgy. San Juan, San jose city, Nueva Ecija	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(79, 'CRLN', NULL, 15.9596132, 121.0640068, 'Carangalan Central Elementary School, Carangalan, Nueva Ecija	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(80, 'CTE1', NULL, 6.63531556, 124.5995666, '(Nearby COTE) Isulan Central School, Isulan, Sultan Kudarat	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(81, 'CUSV', NULL, 13.735914, 100.5339205, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(82, 'CUYP', NULL, 15.8120983, 120.6774886, 'Cuyapo Reststop and Resturant, Barangay Sabit, Cuyapo, Nueva Ecija	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(83, 'DAEJ', NULL, 36.3994288, 127.3744791, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(84, 'DARW', NULL, 12.8437028, 131.1327404, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(85, 'DIMA', NULL, 12.1922693, 123.8570701, 'Dimasalang, Masbate	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(86, 'DINA', NULL, 16.1396539, 121.9524092, 'Juan C. Angara Memorial National High School, Dinalungan, Aurora	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(87, 'DIPA', NULL, 15.9225982, 121.5739335, 'Brgy. Ditale, Paaralang Elementarya ng Ditale, Dipaculao, Aurora	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(88, 'DULA', NULL, 8.82452525, 125.5347508, 'Dulag Elementary School, Brgy. Dulag, Butuan City	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(89, 'ELNA', NULL, 14.1803529, 122.3909672, 'Santa Elena Municipal Elna, Camarines Norte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(90, 'GABU', NULL, 17.96479918, 120.4743705, 'Replaced ILN5(Destroyed) Gabut Norte, Badoc, Ilocos Norte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(91, 'GONZ', NULL, 18.26117298, 121.9969164, 'Gonzaga Town Hall, Gonzaga, Cagayan	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(92, 'GUAM', NULL, 13.5893293, 144.8683612, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(93, 'GUIN', NULL, 13.9070456, 122.4448599, 'Calimpak, Guinayangan, Quezon	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(94, 'GUMA', NULL, 13.9215028, 122.0984972, 'umaca Municipal Agriculture Office, Municipal Hall Gumaca, Quezon	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(95, 'GUNG', NULL, 13.906435, 122.4453492, 'Guinayangan Seismic Station (GQP), Quezon	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(96, 'GUNY', NULL, 13.89482896, 122.4539262, 'Guinayangan Elementary School, Roldan Avenue, Guinayangan, Quezon	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(97, 'HINA', NULL, 11.7020809, 125.067095, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(98, 'IBAZ', NULL, 15.3218358, 119.9850959, '2nd flr. Boy Scott Bldg., Ramon Magsaysay Tech. Universtiy Iba, Zambales / 2nd flr. Estrada Bldg. Brgy Zone 6, Iba, Zambales at Ramon Magsaysay Tech. University	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(99, 'IFG1', NULL, 16.92058941, 121.0515322, '[Auxiliary IFR3] Private lot, Brgy. Gohang, Banaue, Mt. Hiwang, Ifugao	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(100, 'IFR3', NULL, NULL, NULL, 'Banaue, Ifugao	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(101, 'ILN3', NULL, 18.08462281, 120.8146969, 'Brgy. Manalpac, Solsona, Ilocos Norte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(102, 'ILO1', NULL, 10.96815, 122.7322764, 'Anilao National High School, Anilao, Iloilo	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(103, 'ILO2', NULL, 10.9681499, 122.7322772, 'Anilao National High School, Anilao, Iloilo	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(104, 'INFA', NULL, 14.7464619, 121.648731, 'Infanta Municipal Hall, Infanta Quezon	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(105, 'IS26', NULL, NULL, NULL, ' Quinabalangayan, Sta. Lucia, Ilocos Sur	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(106, 'IS31', NULL, 16.98800777, 120.7362885, ' Brgy. Poblacion / Rosario, Cervantes, Ilocos Sur	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(107, 'ISAB', NULL, 10.9266385, 124.4346219, 'sabel Municipal Hall, Leyte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(108, 'ISB4', NULL, 16.5035901, 121.7370363, 'Brgy. Masaya Centro, San Agustin, Isabela	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(109, 'ITBA', NULL, 20.7879413, 121.8418275, 'Itbayat Town Hall, Itbayat Island, Batanes	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(110, 'ITGN', NULL, 16.40040034, 120.6462142, 'Pacalso Elementary School, Bua Tuding, Itogon, Benguet	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(111, 'JOSE', NULL, 12.3525422, 121.067505, 'San Jose Municipal Hall, San Jose, Occidental Mindoro	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(112, 'KA08', NULL, 17.40350218, 121.3647726, 'Bantay Elementary School, Brgy. Bantay, Tabuk City, Kalinga	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(113, 'KAYT', NULL, 13.9868804, 120.9777398, 'San Nicolas, Batangas, (Kaygabak Taal)	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(114, 'KIBU', NULL, 7.30869206, 124.7803828, 'Kibudtungan Cenrtral Elementary School, Carmen, North Cotabato	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(115, 'KUNM', NULL, 25.0295389, 102.7971955, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(116, 'KVMN', NULL, 10.3864214, 123.1708647, 'Mananauin, Canlaon, Negros, Oriental	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(117, 'LABO', NULL, 14.1541714, 122.8301474, 'MDRRMC operation center, Labo Municipal Hall, Labo, Camarines Norte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(118, 'LAGW', NULL, 16.7973825, 121.1228542, 'Provincial Capital of Ifugao, Lagawe, Ifugao	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(119, 'LAPS', NULL, 10.89096315, 124.9579642, 'NCKU: La Paz, Leyte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(120, 'LAPU', NULL, 10.31688255, 123.9661407, ' CEBU]: Lapu Lapu Seismic Station, Lapu-Lapu City, Cebu	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(121, 'LBAN', NULL, 13.863678, 120.0941739, 'Lubang Tsunami station, Lubang Island, Occidental Mindoro	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(122, 'LEA1', NULL, 11.0775761, 124.3888092, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(123, 'LEB1', NULL, 11.2149215, 124.3926888, 'Villaba South Central School, Villaba, Leyte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(124, 'LEB2', NULL, 11.2111632, 124.3893269, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(125, 'LEC1', NULL, 11.3026939, 124.5679697, 'old Auxiliary LEC2] Ansubas, Cabul an,  Capoocan, Leyte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(126, 'LEC2', NULL, 11.3028312, 124.5671593, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(127, 'LED1', NULL, NULL, NULL, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(128, 'LEF1', NULL, 11.4542909, 124.4761908, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(129, 'LEH1', NULL, 11.4221167, 124.8435614, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(130, 'LEYA', NULL, 11.0775759, 124.3888092, '[Auxiliary LEA1]  Sabang Elementary School, Palompon, Leyte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(131, 'LEYB', NULL, 11.2111947, 124.3892917, '[Auxiliary LEB2] Pier Site, Poblacion del Sur, Villaba, Southern Leyte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(132, 'LEYC', NULL, 11.3026941, 124.5679698, 'new Auxiliary LEC2]  Ansubas, Cabul an,  Capoocan, Leyte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(133, 'LEYD', NULL, 11.3298578, 124.4802752, '[Auxiliary LED1] Gibacungan, Tabango, Northern Leyte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(134, 'LEYE', NULL, 11.4283044, 124.4372962, 'Calubian cemetery, Brgy Herrera, Calubian Northern Leyte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(135, 'LEYF', NULL, 11.4542694, 124.476228, '[Auxiliary LEF1] Poblacion, Biliran, Leyte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(136, 'LEYG', NULL, 11.1717513, 125.0116453, 'MacArthur Park, Palo, Leyte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(137, 'LEYH', NULL, 11.4221225, 124.8435575, '(AKA LEH1) Babatngon Elementary School, Babatngon Northern, Leyte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(138, 'LEYJ', NULL, 11.9037282, 125.4188727, '[Auxiliary TAFT] Front of Municipal Hall, Taft, Eastern Samar	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(139, 'LEYM', NULL, 11.406705, 124.3539465, '(Nearby NLSI) San Isidro Central School, Math Park, Northern Leyte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(140, 'LEYO', NULL, 11.8167542, 125.2278241, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(141, 'LGYE', NULL, 16.032589, 120.2344773, 'DOST office, Provincial Science And Technology Center (DOST-PSTC), Alvear St., Maniboc, Lingayen, Pangasinan	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(142, 'LGYN', NULL, NULL, NULL, 'DOST office, Provincial Science And Technology Center (DOST-PSTC), Alvear St., Maniboc, Lingayen, Pangasinan	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(143, 'LHOV', NULL, 13.15957463, 123.7279268, 'VMEPD: Mayon cGPS	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(144, 'LIBA', NULL, 11.48205536, 122.305217, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(145, 'LIDO', NULL, 13.2189788, 123.7569904, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(146, 'LOPE', NULL, 13.9146109, 122.2761697, 'Pulong Central, Canda Ibaba, Lopez, Quezon	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(147, 'LUBU', NULL, 17.35503545, 121.1789179, 'Lubuagan Central School, Lubuagan, Kalinga	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(148, 'LUCB', NULL, 25.0404519, 121.6138582, 'Lucban Municipal Hall, Majayjay-Lucban Rd-Recelis Ave. Lucban, Quezon	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(149, 'LUN1', NULL, 16.58255748, 120.3044237, 'Brgy. San Vicente, SanFernando, La Union	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(150, 'LUN2', NULL, 16.36065438, 120.3601135, 'Brgy. Sta. Ana, Agoo, La Union	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(151, 'LUZA', NULL, 14.8775471, 120.1952802, 'Brgy. Cauag, Subic, Zambales	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(152, 'LUZB', NULL, 15.3727706, 120.5171147, 'Lawy, Capaz	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(153, 'LUZC', NULL, 16.3879592, 120.5682047, '(Near by LZC1) Benguet, Baguio PHIVOLCS Seismic staion	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(154, 'LUZD', NULL, 17.5509283, 120.4555575, 'Santa, Ilocos Sur	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(155, 'LUZE', NULL, 15.5610444, 121.0969644, 'Palayan Seismic Station, Palayan City, Nueva Ecija	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(156, 'LUZF', NULL, 15.8135559, 121.1131018, 'Pantabangan Dam, Nueva Ejica	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(157, 'LUZG', NULL, 16.6075358, 121.482136, 'Brgy. Gabriela, Diffun, Quirino	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(158, 'LUZH', NULL, 17.7174053, 121.8038381, 'Brgy Quibal, Penablanca, Cagayan, Tuguegarao	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(159, 'LUZI', NULL, 18.2458455, 121.9279389, 'Brgy. Mission, Sta. Teresita, Cagayan	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(160, 'LUZL', NULL, 14.6201245, 121.2080053, 'Bosoboso, Baras, Rizal / San Jose Antipolo, Rizal	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(161, 'LUZN', NULL, 13.786053, 122.0605411, '(QZN-9) Brgy. Sumag Este, Pitogo, Quezon	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(162, 'LUZP', NULL, 13.8145055, 120.9753002, '(BTG-1) Durungao Elementary School, Brgy. Durangao, Bauan, Batangas	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(163, 'LUZR', NULL, NULL, NULL, '(Unknown Status last data 2006) Baguio, Benguet	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(164, 'LZA1', NULL, NULL, NULL, '(Unknown Status) Subic, Zambales	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(165, 'LZC1', NULL, NULL, NULL, '(Near by LUZC / Auxiliary of LUZC) Benguet, Baguio PHIVOLCS Seismic staion	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(166, 'MAA1', NULL, 12.8407044, 123.2234767, 'Manapao Elementary School, Manapao, Claveria, Masbate	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(167, 'MAB1', NULL, 12.5026265, 123.4001341, 'GK Housing, Sitio Hill Top, Brgy.Ambulong, Aroroy, Masbate	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(168, 'MAB2', NULL, 12.5080218, 123.3969048, '(No recent data) Poblacion, Aroroy, Masbate	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(169, 'MABN', NULL, 16.0692302, 119.940621, 'Mabini Town Hall, 3rd floor kitchen, Mabini Municipal Hall, Mabini Pangasinan	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(170, 'MAC2', NULL, 12.60296528, 123.5999628, 'Sto. Nino Elementary School, Monreal, Ticao, Masbate	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(171, 'MACR', NULL, 16.01066007, 120.8201416, 'Sitio Malasin, Sn. Macario Sur Natividad Pangasinan	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(172, 'MAD1', NULL, 12.403095, 123.72813, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(173, 'MAD2', NULL, 12.40287828, 123.7281192, '[Nearby MASD and MAD1]Ticao, Brgy. Danao, Batuan, Masbate	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(174, 'MAE1', NULL, 12.36815859, 123.6258117, 'Provincial Athletic Ground (Oval), Masbate City	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(175, 'MAF1', NULL, 12.1459164, 123.9235034, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(176, 'MAGA', NULL, 15.2200031, 120.6957172, 'Pampanga Agricultural College (Institute of Arts and Sciences), Magalang, Pampanga	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(177, 'MAL1', NULL, 12.66736293, 123.8819515, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(178, 'MALA', NULL, 14.1637952, 122.6171685, 'Malatap Barangay Hall, Labo Camarines Norte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(179, 'MALG', NULL, 17.2051042, 121.6067675, 'Room 305, 3rd floor Mallig Plains College, Isabela, Quezon	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(180, 'MALS', NULL, 14.856731, 120.8142776, 'Bulacan GIS Center, Provincial Capital of Bulacan, Malolos Bulacan	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(181, 'MALY', NULL, 14.708615, 121.1314587, 'Maly Elementary School, Gen. Luna St., SAN MATEO, RIZAL, Region IV-A	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(182, 'MAMB', NULL, 13.2223233, 120.6078939, '2nd Floor, Provincial Engineers Office, Capitol W Rd. Mamburao, Occidental, Mindoro	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(183, 'MAR2', NULL, NULL, NULL, 'Marilao Municipal Hall, Bulacan	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(184, 'MARI', NULL, NULL, NULL, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(185, 'MARK', NULL, 14.6290988, 121.0984429, 'San Roque Baragay Hall, Marikina, Metro Manila	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(186, 'MARL', NULL, 14.7682417, 120.9477759, 'Tabing Ilog, Marilao, Bulacan	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(187, 'MASA', NULL, 12.8377225, 123.2305899, 'Borobantique, Mabitan, Claveria, Masbate	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(188, 'MASB', NULL, 12.5079069, 123.3970675, '(No recent data) Poblacion, Aroroy, Masbate	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(189, 'MASC', NULL, 12.600846, 123.5995569, 'Sto. Nino, Monreal, Ticao, Masbate	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(190, 'MASD', NULL, 12.4026801, 123.7282232, '[Nearby MAD2] Danao, Ticao, Masbate	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(191, 'MASE', NULL, 12.371401, 123.6233458, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(192, 'MASF', NULL, 12.1459556, 123.9236208, '[Auxiliary MAF1]  Palanas Central School, Sto. Nino St., Poblacion, Palanas, Masbate	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(193, 'MASG', NULL, 12.1786678, 123.7920197, 'Buenavista National High School, Buenavista, Uson, Masbate	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(194, 'MASH', NULL, 12.2113115, 123.8139861, 'Badjang/Crossing Dungon, Uson, Masbate	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(195, 'MASI', NULL, 12.224617, 123.5085396, 'Milagros West Central School, Brgy. Bacolod, Milagros, Masbate	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(196, 'MASJ', NULL, 12.0400078, 123.1927173, '[Auxiliary MSJ1]Balud Central School, Balud, Masbate	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(197, 'MASK', NULL, 11.8837085, 124.0501086, 'Pio V Corpus Municipal Hall grounds, Pio V. Corpus, Masbate	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(198, 'MASL', NULL, 12.66736017, 123.881953, 'orsogon State College, Bulan, Sorsogon	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(199, 'MATA', NULL, 7.04680704, 124.8966402, 'Dalapitan Elementary School, Matalam, Cotabato	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(200, 'MAUB', NULL, 14.1899713, 121.7316475, 'Mauban Municipal Hall, Mauban, Quezon	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(201, 'MAYA', NULL, 15.5249315, 120.9553995, 'Mayapyap National High School, Maypyap Norte, Cabanatuan	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(202, 'MDQT', NULL, 13.2842065, 122.0543162, 'Cabuyo Elementary School, Brgy. Cabuyo, Torrijos, Marinduque 	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(203, 'MDVS', NULL, 6.7823096, 125.1720207, 'Barayong Nat\'l HS, Barayong, Magsaysay, Davao Del Sur	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(204, 'MNAY', NULL, 7.2103223, 126.5391751, '2nd Floor Manay Municipal Hall (KALHI-CIDSS : NCDDP Office), Manay	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(205, 'MPCK', NULL, 11.8842851, 124.0473377, 'Pio V. Corpus Central Elementary School, Poblacion, Pio V. Corpus, Masbate	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(206, 'MPV1', NULL, NULL, NULL, 'Town Proper, Bontoc, Mountain Province	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(207, 'MRHO', NULL, 13.2844869, 123.6711093, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(208, 'MRIK', NULL, 15.79975998, 121.2482956, 'Purok 7, Cadaclan, Marikit, Pantabangan	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(209, 'MRK1', NULL, 14.7470847, 121.1211268, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(210, 'MRK5', NULL, 14.6413558, 121.2205153, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(211, 'MSW3', NULL, 8.2911044, 123.8434232, 'Hilarion ramiro Infirmary, Sinacaban, Misamis Occidental	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(212, 'MUNT', NULL, 14.4034506, 121.0510047, 'Muntinlupa, Metro Manila	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(213, 'MUNZ', NULL, 15.7441984, 120.9430044, '4th floor near rooftop door Main Bldg. Philippine Carabao Center Science City of Muñoz, 3120 Munoz, Nueva Ecija	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(214, 'MVBM', NULL, 10.3717356, 123.2816194, 'Bapor Mayon, Brgy Tagbino, Vallehermoso, Negros Oriental	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(215, 'MVCH', NULL, 10.4004679, 123.213112, 'Canlaon City District Hospital, Negros	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(216, 'MVIC', NULL, 10.4674449, 123.2245248, 'Sitio Iliranan, Brgy. Codcod, San Carlos City, Iliranan,  Negros Occidental	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(217, 'MVLC', NULL, 10.41514686, 122.9617103, 'La Carlota, La Carlota City, Kanlaon Volcano Observatory	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(218, 'MVMH', NULL, 10.35838833, 123.1077362, 'Mansalanao, La Castellana, Negros Occidental	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(219, 'MVML', NULL, 10.52022357, 123.1123265, 'Mambucal, Murcia, Negros Occidental	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(220, 'MVMN', NULL, 10.38844307, 123.1681512, 'Upper Masulog, Mananauin, Canlaon, Negros Oriental	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(221, 'MVMP', NULL, 10.2779101, 123.0664627, 'Negros State College of Agriculture (NSCA) – Moises Padilla campus, Moises Padilla, Negros Occidental	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(222, 'MVMR', NULL, 10.3411915, 123.0923279, 'Mabigo, Canlaon City, Negros Oriental	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(223, 'MVMY', NULL, 9.362423, 122.8083839, 'Manghumay, Bago City, Negros Occidental	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(224, 'MVSB', NULL, 10.42664915, 123.0896662, 'Santo Bama, Guintubdan, La Carlota City, Negros Occidental	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(225, 'MVSC', NULL, 10.41934875, 123.3504519, 'San Carlos, Ledesma Hermanos Agricultural Corp. (LHAC)	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(226, 'MVSM', NULL, 10.4157634, 123.0211266, 'Brgy. San Miguel Health Center, San Miguel, La Carlota City, Negros Occidental	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(227, 'MVUP', NULL, 10.4133974, 123.1774737, 'Upper Pantao, Canlaon, Negros Oriental	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(228, 'N132', NULL, 15.5243882, 120.7973514, 'Brgy. San Jose, Licab, Nueva Ecija	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(229, 'N47A', NULL, NULL, NULL, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(230, 'N688', NULL, 13.8183001, 123.3269851, 'Tinambac Elementary School, Tinambac, Camarines Sur	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(231, 'NAMR', NULL, NULL, NULL, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(232, 'NAUJ', NULL, 13.3194151, 121.300695, 'Bahay Tuklasan Conference Hall, Naujan, Oriental Mindoro	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(233, 'NAV1', NULL, 11.5619242, 124.3982691, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(234, 'NAVA', NULL, 11.562027, 124.3986662, '[Auxiliary NAV1] Oval Ground Naval Central School, Naval, Biliran	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(235, 'NE21', NULL, 15.67174037, 120.8535379, 'Brgy. Curva, Munoz, Nueva Ecija	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(236, 'NLCE', NULL, 11.4424461, 124.4296409, 'Calubian National Vocational School (TESDA), Calubian, Leyte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(237, 'NLCR', NULL, 11.3038994, 124.7066407, 'Middle of the Oval, Eastern Visayas State University, Carigara Campus, Carigara, Leyte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(238, 'NLL1', NULL, 11.3704498, 124.4859148, 'Leyte Central Elementary School Grounds, Poblacion, Northern Leyte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(239, 'NLL2', NULL, 11.3524965, 124.5250959, 'Front Yard of Libas Elementary School	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(240, 'NLSB', NULL, 11.2849252, 125.0690515, 'Basey II Central Elementary School, Suguijon St., Brgy. Palaypay, Basey, Samar	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(241, 'NLSI', NULL, 11.4074926, 124.3539158, '(Nearby LEYM) Oval Ground, San Isidro Central School, Leyte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(242, 'NLSN', NULL, 11.2335487, 124.5718023, '(SNNI) Sto. Niño Elem. School, Sto. Niño, Capoocan, Leyte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(243, 'NMAB', NULL, 8.9559388, 125.5965735, 'NORMISIST / Caraga State University, Ampayon, Butuan City, Agusan Del Norte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(244, 'NMCO', NULL, 8.48169783, 124.6467782, 'Don Gregorio Pelaez Sports Complex, Cagayan de Oro City, Misamis Oriental	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(245, 'NMLM', NULL, 9.5350809, 125.5237539, '(School Playground) Mainit National High School, Surigao Del Norte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(246, 'NMMA', NULL, NULL, NULL, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(247, 'NMMB', NULL, 8.74523653, 124.7807025, 'Balingasag Central School, Poblacion, Balingasag, Misamis Oriental	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(248, 'NMSF', NULL, 7.91723301, 125.3264235, 'Halapitan Central Elementary School / Halapitan National High School, Halapitan, San Fernando, Bukidnon	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(249, 'NMSM', NULL, 9.6182514, 125.4023297, '(School Playground) Malimono National High School, Surigao del Norte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(250, 'NOMA', NULL, 9.2437753, 124.7310479, 'Camiguin Polytechnic State College, Balbagon, Mambajao, Camiguin Island	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(251, 'NOMB', NULL, 9.17052237, 125.5318955, 'Tubay National Secondary High School, Tubay, Agusan del Norte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(252, 'NOMC', NULL, 9.6596861, 125.5282779, 'Paaralang Sentral Elementarya ng Sison, Sison, Surigao del Norte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(253, 'NOMD', NULL, 10.01712021, 126.0735579, 'Burgos Elementary School, Burgos Siargao Island, Surigao del Norte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(254, 'NOME', NULL, 8.8230316, 125.1046118, 'Don Restituto Baul Central School, Gingoog City, Misamis Oriental	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(255, 'NOMF', NULL, 9.2635925, 125.5519026, 'Santiago National High School, Santiago, Agusan del Norte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(256, 'NOMG', NULL, 9.6089435, 125.6366412, 'Bacuag National Agro-Industrial School, Bacuag, Surigao del Norte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(257, 'NOMH', NULL, 9.3700657, 125.9478581, 'Carrascal Central Elementary School, Carrascal, Surigao del Sur	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(258, 'NOMI', NULL, 9.7822795, 126.1572657, 'Gen. Luna Elementary School, Gen. Luna, Siargao Island, Surigao del Norte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(259, 'NOMK', NULL, 8.8241893, 125.6951162, 'Sibagat Central Elementary School, Sibagat, Agusan del Sur	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(260, 'NOML', NULL, 9.03951748, 126.2161011, 'Surigao del Sur Polytechnic State College (SSPSC), Rosario,Tandag, Surigao del Sur	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(261, 'NOMZ', NULL, 9.11636733, 124.687354, 'Camiguin Polytechnic State College, Catarman, Camiguin	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(262, 'NPAK', NULL, 11.7037445, 122.3778022, 'Track Oval, Aklan State University, Kalibo Campus, Kalibo, Aklan	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(263, 'NPAL', NULL, 11.7706384, 121.9217849, 'Libertad National Vocational High School, Libertad, Antique	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(264, 'NPIE', NULL, 11.4550611, 123.1477431, 'Northern Iloilo Polytechnic State College-Estancia (West Campus), Estancia, Iloilo	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(265, 'NTUS', NULL, 1.345802, 103.6799574, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(266, 'NV47', NULL, 16.50232796, 121.1172807, 'Brgy. Masoc, Bayombong, Nueva Vizcaya	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(267, 'NVSM', NULL, NULL, NULL, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(268, 'NVY2', NULL, 16.32725441, 121.2611025, 'Sitio Tinalo, Brgy Kongkong, Kasibu, Nueva Vizcaya	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(269, 'NVY3', NULL, 16.132925, 120.9300186, '(Dalton Pass) Balete Pass Tourist View Deck, Brgy. Dalton Pass, Sta. Fe, Nueva Vizcaya	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(270, 'NVY9', NULL, 16.3579947, 120.8883483, 'Brgy. Pampang, Kayapa, Nueva Vizcaya	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(271, 'ODON', NULL, 15.3240686, 120.4231977, 'Barangay Sta. Juliana, Capas, Tarlac	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(272, 'PABL', NULL, 15.7856164, 121.061507, 'Brgy. San juan, San jose City, Nueva Ecija	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(273, 'PAGP', NULL, 18.5596567, 120.7874501, 'Conference room near Mayor\'s office. 2nd floor, Pagudpud Municipal Hall, Ilocos Norte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(274, 'PAGU', NULL, NULL, NULL, 'Municipal Building of Pagudpud, Ilocos Norte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(275, 'PALA', NULL, 12.1467576, 123.9247815, 'Palanas, Masbate	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(276, 'PALM', NULL, 11.0482147, 124.3824015, 'NCKU: Palompon, Leyte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(277, 'PANC', NULL, 18.55081654, 120.9270768, 'Barangay Pancian, Pagupud, Ilocos Norte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(278, 'PBAY', NULL, 16.4815516, 121.1429332, 'NAMRIA PageNET: Bayombong, Nueva Vizcaya	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(279, 'PCAB', NULL, 15.4502123, 120.9387579, 'NAMRIA PageNET: Cabanatuan City, Nueva Ecija	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(280, 'PCAN', NULL, 13.9323327, 121.3967753, 'NAMRIA PageNET: Candelaria, Quezon	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(281, 'PCB2', NULL, 15.4460556, 120.9388082, 'NAMRIA PageNET: Cabanatuan City, Nueva Ecija	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(282, 'PDAV', NULL, 7.12648975, 125.6434036, 'NAMRIA PageNET: Francisco Bangoy International Airport, Davao City	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(283, 'PERT', NULL, 31.8019664, 115.8852506, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(284, 'PFLO', NULL, 14.982933, 120.4993583, 'NAMRIA PageNET: Floridablanca, Pampanga	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(285, 'PGEN', NULL, 6.0649126, 125.1316607, 'NAMRIA PageNET: General Santos, South Cotabato	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(286, 'PHIC', NULL, 14.6519758, 121.058768, 'PHIVOLCS Building, C.P. Garcia Avenue UP Campus, Diliman, Quezon City	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(287, 'PHIV', NULL, 14.6521883, 121.0587237, 'PHIVOLCS Building, C.P. Garcia Avenue UP Campus, Diliman, Quezon City	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(288, 'PIBU', NULL, 14.6753112, 121.2080581, 'Pintong Bukawe Barangay Hall, San Mateo, Rizal	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(289, 'PILC', NULL, 10.7628843, 122.5544061, 'NAMRIA PageNET: Pavia, Iloilo	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(290, 'PIMO', NULL, 14.6357197, 121.0777321, '[IGS Site] Ateneo , Quezon City	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(291, 'PIVS', NULL, 14.6519759, 121.0587642, 'PHIVOLCS Building, C.P. Garcia Avenue UP Campus, Diliman, Quezon City	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(292, 'PLEG', NULL, 13.1612182, 123.7297249, 'NAMRIA PageNET: Legazpi City, Albay	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(293, 'PLWN', NULL, 10.0857732, 118.8514052, 'Tagbinet, Puerto Princesa City, Palawan	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(294, 'PLYN', NULL, 15.5620415, 121.1008009, '(Near Palayan Seismic Station)Barangay Atate, Palayan, Nueva Ecija	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(295, 'PNBO', NULL, 7.2836567, 125.6719746, 'Panabo City Hall, Panabo, Davao del Norte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(296, 'PNG3', NULL, 16.0632957, 120.1079021, 'Tubuan, Sual, Pangasinan, bolt flush mounted on solid rock overlooking farmland	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(297, 'PNG5', NULL, 15.8676809, 120.2536836, 'Caranglaan, Aguilar, Pangasinan	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(298, 'POLI', NULL, NULL, NULL, 'Polilio Municipal Disaster Office Bldg. kitchen, Polilio, Quezon	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(299, 'POTR', NULL, 14.6630489, 120.983503, 'Potrero Elementary School, Potrero, Malabon, Metro Manila	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(300, 'PPPC', NULL, 9.7729326, 118.740232, 'NAMRIA PageNET: Puerto Princesa, Palawan	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(301, 'PSTC', NULL, 14.28164917, 121.4145074, 'NAMRIA PageNET: Santa Cruz, Laguna	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(302, 'PSUR', NULL, 9.7918086, 125.4936963, 'NAMRIA PageNET: Surigao City, Surigao Del Norte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(303, 'PTAC', NULL, 11.2498916, 125.0042294, 'NAMRIA PageNET: Tacloban City, Leyte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(304, 'PTAG', NULL, 14.5354413, 121.0407666, 'NAMRIA PageNET: NAMRIA Building, Taguig, Metro Manila	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(305, 'PTBN', NULL, 15.8080856, 121.1431515, 'Pantabangan Town hall, Pantabangan, Nueva Ecija	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(306, 'PTGY', NULL, 14.1002798, 120.9382877, 'NAMRIA PageNET: Tagaytay, Cavite	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(307, 'PUER', NULL, 13.5019939, 120.9542887, 'Puerto Galera Church, Puerto Galera, Oriental Mindoro	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(308, 'PUGA', NULL, 15.7260919, 121.0407088, 'Mt. Pugaro, Bagong Sikat, San Jose, Nueva Ecija	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(309, 'PURD', NULL, 16.0041955, 120.5756152, 'NAMRIA PageNET: Urdaneta City, Pangasinan	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(310, 'QN42', NULL, 13.7389311, 122.4655619, 'Buenavista Elementary School, Buenavista, Quezon	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(311, 'QZN2', NULL, 14.1881354, 121.7286384, '(Unknown Status) Mauban South Elementary School, Mauban, Quezon	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(312, 'QZN3', NULL, 14.1890306, 121.72861, '[Nearby QZN2 and QZN6] Mauban South Elementary School, Mauban, Quezon	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(313, 'QZN6', NULL, 14.1881671, 121.7286797, '(Unknown Status) Mauban South Elementary School, Mauban, Quezon	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(314, 'RCPS', NULL, 11.5613387, 122.7642246, 'RCP Roxas Seismic Station, Milibili, Roxas City, Capiz	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(315, 'ROXA', NULL, 12.5932585, 121.5297057, '2/F, Phil. Port Authority, Dangay Port, Roxas, Mindoro	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(316, 'S289', NULL, 18.51372159, 121.3217794, 'Bidduang National High School, Brgy. Bidduang, Pamplona, Cagayan	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(317, 'SABL', NULL, 12.8438213, 120.7799978, 'Sablayan Municipal Hall, Sablayan, Occidental Mindoro	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL);
INSERT INTO `sites` (`id`, `name`, `date_established`, `latitude`, `longitude`, `location`, `description`, `createdAt`, `updatedAt`, `survey_type_id`, `marker_id`) VALUES
(318, 'SANA', NULL, 13.26138487, 123.7848649, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(319, 'SHAO', NULL, 31.0996423, 121.2004448, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(320, 'SIBA', NULL, 13.2699931, 121.9117834, 'Daykitin Elementary School, Brgy. Daykitin, Buenavista, Marinduque	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(321, 'SIBB', NULL, 13.4574433, 122.0590643, 'Matalaba National High School, Matalaba, Sta. Cruz, Marinduque	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(322, 'SIBC', NULL, 13.5937118, 122.3248096, 'Catanauan Central School, Catanauan, Quezon	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(323, 'SIBD', NULL, NULL, NULL, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(324, 'SIBE', NULL, 13.8248143, 122.7337737, 'nd Auxiliary LIBO]Ragay National Agricultural and Fisheries School, Liboro Ragay, Camarines Sur	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(325, 'SIBF', NULL, 12.9490953, 122.0962369, 'Paaralang Sentral ng Banton, Banton Island, Romblon	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(326, 'SIBH', NULL, 13.518967, 123.013525, 'Camarines Sur Institute of Fisheries and Marine Science (CASIFMAS), Karanan Extension, Brgy. Karanan, Pasacao, Camarines Sur	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(327, 'SIBI', NULL, 12.3684212, 122.6875124, 'Cajidiocan Central School, Cajidiocan, Sibuyan Island	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(328, 'SIBJ', NULL, 13.1257624, 122.983311, 'San Pascual Central School, San Pascual, Burias Island	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(329, 'SIBK', NULL, 13.0447591, 123.4553252, 'Pio Duran Municipal Hall, Pio Duran, Albay	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(330, 'SIBL', NULL, 13.3243003, 122.6756547, 'San Andres, Quezon	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(331, 'SINA', NULL, 6.9133191, 122.0616274, 'Western Mindanao State University Normal Road, Baliwasan, Zamboanga City	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(332, 'SINB', NULL, 7.7804867, 122.5883721, 'IPIL Central School/ SPED Oval Area, Zamboanga Sibugay	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(333, 'SINC', NULL, 8.23118901, 123.0045058, '(Soccer Field) Sindangan National Agricultural School, Zamboanga Del Norte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(334, 'SIND', NULL, 8.51634367, 123.0907046, 'MWCS Field, Manukan, Zamboanga Del Norte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(335, 'SINE', NULL, 8.4888521, 123.801924, 'OCS Oval Field, Misamis Occidental National High School, Oroquieta City	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(336, 'SINF', NULL, 8.0641714, 123.7569054, 'Tangub Sports Complex Oval Field, Rangub City, Misamis Occidental	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(337, 'SING', NULL, 7.8335502, 123.4412669, 'Rotonda Area, Pagadian City, Zambonga Del Sur	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(338, 'SINH', NULL, 8.22508668, 124.2395156, 'Iligan City National High School Field, Iligan, Misamis Oriental	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(339, 'SINI', NULL, 14.41299501, 121.4481292, 'Laguna State Polytechnic University, Siniloan Campus, Siniloan Laguna	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(340, 'SISN', NULL, 16.1626083, 120.5152432, 'Barangay Poblacion Sur/Barangay Asan Sur, Sison, Pangasinan	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(341, 'SJAQ', NULL, 10.7522164, 121.9427547, 'Antique National High School, T.A. FORNIER ST., San Jose, Antique	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(342, 'SLSB', NULL, 11.1096404, 125.3881545, 'Balangiga Central Elementary School, Balangiga, Samar	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(343, 'SMAT', NULL, 16.68621138, 121.5509973, 'Santiago South Central School, Santiago City, Isabela	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(344, 'SMCL', NULL, 7.82029937, 125.7919862, 'Laak National High School, Compostela Valley, Souther Mindanao Comval Laak	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(345, 'SMCP', NULL, 7.13670198, 125.8983504, 'Pantukan Sports Complex (Kingking CES / Pantukan NHS), Pantukan, Compostela Valley	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(346, 'SMD1', NULL, 6.65678763, 126.0746208, '[Renamed from SMDS due to name conflict] Sigaboy Central Elementary School, Gov. Generoso, Davao Oriental	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(347, 'SMDB', NULL, 7.56996024, 126.5650246, '[Auxiliary SMB1] Baganga NHS, Baganga, Davao Oriental	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(348, 'SMDM', NULL, 7.21424238, 126.5373096, 'Evaristo Moralizon Nat\'l. Voc\'l. HS, Manay, Davao Oriental	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(349, 'SMDS', NULL, 16.89019228, 121.5982977, 'Daramuangan Sur Elementary School, Daramuangan Sur, San Mateo, Isabela	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(350, 'SMDT', NULL, 7.02424449, 125.4944686, 'Crossing Bayabas National High School, Southern Mindano, Davao City	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(351, 'SMMM', NULL, 7.00703042, 126.2859465, 'Don Salvador NHS, Brgy. Don Salvador Lopez, Sr., Mati, Davao Oriental	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(352, 'SMSK', NULL, 6.96526793, 125.7271848, 'Kaputian National Highschool, Poblacion Kaputian, Kaputian, Samal Island (Island Garden City of Samal), Davao del Norte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(353, 'SNNI', NULL, 11.2335255, 124.5717776, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(354, 'SOLA', NULL, 10.0614322, 124.4349203, 'Camambugan National High School, Camambugan, Ubay, Bohol	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(355, 'SOLB', NULL, 10.3688506, 124.7553367, 'Hilongos National Vocational School (HNVS), Hilongos, Leyte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(356, 'SOLC', NULL, 10.710353, 125.009335, 'Brgy. Tadoc, Abuyog, Southern Leyte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(357, 'SOLD', NULL, 11.0338586, 125.7407092, 'Guiuan Airport, Cantahay, Guiuan, Eastern Samar	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(358, 'SOLE', NULL, 9.8942029, 124.4442344, 'Alicia National High School Poblacion Uno, Alicia, Bohol	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(359, 'SOLF', NULL, 10.1876121, 124.7796464, 'Maasin Airport Panan-awan, Maasin City	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(360, 'SOLG', NULL, 10.2961287, 125.0526546, 'Libagon Central Elementary School Libagon, Southern Leyte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(361, 'SOLH', NULL, 10.2658152, 125.1704658, 'San Juan Central Elementary School, San Juan Southern Leyte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(362, 'SOLI', NULL, 10.3496297, 125.2506127, 'Hinundayan Central School Hinundayan, Southern Leyte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(363, 'SOLJ', NULL, 10.7368411, 125.7202115, 'Homonhon National High School, Homonhon Island, Eastern Samar	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(364, 'SOLK', NULL, 9.6883989, 123.8637711, 'PHIVOLCS Tagbilaran Station, Cobohan, Bohol	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(365, 'SOLL', NULL, 9.9122115, 125.2761911, 'San Ricardo Central School, San Ricardo, Panaon Island Southern Leyte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(366, 'SOMA', NULL, 8.4486584, 125.7851266, 'Talacogon Municipal Hall, Talacogon, Agusan del Sur	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(367, 'SOMB', NULL, 8.6772851, 126.1337743, 'Diatagon Elementary School, Purok 6, Diatagon, Lianga, Surigao del Sur	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(368, 'SOMC', NULL, 8.2816244, 125.8175976, 'La Paz National High School, La Paz, Agusan del Sur	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(369, 'SOMD', NULL, 8.5029904, 125.9821143, 'San Francisco National High School, San Francisco, Agusan del Sur	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(370, 'SOME', NULL, 8.528777, 126.1207238, 'Barobo National High School, Barobo, Surigao del Sur	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(371, 'SOMF', NULL, 7.5154759, 125.6190604, 'Sto. Tomas National High School, Menzi, Sto. Tomas, Davao del Norte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(372, 'SOMG', NULL, 7.5855266, 125.8259359, 'New Corella Central Elementary School, New Corella, Davao del Norte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(373, 'SOMH', NULL, 7.5058693, 125.9213417, 'Mawab Central Elementary School, Mawab, Compostela Valley	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(374, 'SOMI', NULL, 7.6711221, 126.0901855, 'Compostela Central Elementary School, Compostela, Compostela Valley	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(375, 'SOMJ', NULL, 8.3732681, 126.3342668, 'Hinatuan National Comprehensive High School, Hinatuan, Surigao del Sur	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(376, 'SOMK', NULL, 7.7895379, 126.4461384, 'Cateel Vocational National High School, Cateel, Davao Oriental	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(377, 'SOML', NULL, 6.8981491, 126.008148, 'Lupon Vocational National High School, Lupon, Davao Oriental	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(378, 'SOMM', NULL, 6.9311188, 126.2547751, 'Davao Oriental State College of Science and Technology, Mati City, Davao Oriental	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(379, 'SONO', NULL, 16.5183302, 121.1818869, '[Renamed from SOLA due to name conflict (internal); still recognized as SOLA by Academia Sinica] Brgy. Hall Poblacion North, Solano, Nueva Vizcaya	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(380, 'SPAB', NULL, 14.0745874, 121.3245901, 'San Pablo City Hall, San Pablo, Laguna	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(381, 'SRQE', NULL, 16.11782534, 120.6812703, 'Barangay San Roque, San Manuel, Pangasinan	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(382, 'STNA', NULL, 18.4575272, 122.1428426, 'Engineer\'s office, Santa Ana Municipal Hall, Cagayan	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(383, 'SUAL', NULL, 16.0724297, 120.0808686, 'Ilocos Integrated Agricultural Research Center Satellite Station, Poblacion Sual, Pangasinan	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(384, 'TABA', NULL, 13.3578443, 123.7306893, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(385, 'TACB', NULL, 11.2436701, 125.0078329, 'NCKU: Municipal Disaster Risk Reduction and Management Office, Tacloban Municipal Hall, Tacloban City, Leyte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(386, 'TACL', NULL, NULL, NULL, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(387, 'TAFT', NULL, 11.9037913, 125.4190713, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(388, 'TAGA', NULL, NULL, NULL, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(389, 'TAGB', NULL, 9.0794503, 125.6149554, 'Paaralang Elementarya ng Tagbongabong, Agusan del Norte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(390, 'TAIW', NULL, 25.0213311, 121.5365409, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(391, 'TANY', NULL, 14.581555, 121.3691099, 'Tanay Synoptic and Uper Air Station (PAGASA), Sitio Mayagay, Brgy. Sampaloc, Tanay, Rizal	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(392, 'TARL', NULL, 15.44458912, 120.5946336, 'Research Outreach Division for Lowland Development, Department of Agriculture, Paraiso, San Miguel, Tarlac	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(393, 'TAWI', NULL, 5.0242958, 119.7651468, 'Tawi-Tawi Provincial Capitol, New Housing, Bongao, Tawi Tawi	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(394, 'TCGN', NULL, 8.4488476, 125.7847262, 'Municipal Hall Building, Purok 1, Del Monte, Talacogon, Agusan del Sur	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(395, 'TGDN', NULL, 16.9340942, 120.4454083, '2nd Floor, Office of the Provincial Persecutor Tagudin Sub-office, Tagudin, Ilocos Sur	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(396, 'TNDG', NULL, 9.0401386, 126.2154057, 'Surigao Del Sur State University, Tandag, Surigao Del Sur	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(397, 'TNML', NULL, 24.7979537, 120.9873454, 'IGS: Hsinchu, Taiwan	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(398, 'TOF1', NULL, 11.1826858, 124.6255063, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(399, 'TONA', NULL, 11.1075139, 124.6544807, 'Sitio Base2, Kabawon-an, Brgy Tongonan, Ormoc City	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(400, 'TONF', NULL, 11.1826889, 124.6255056, 'op berm of Well 408, PNOC-EDC, Tongonan, Ormoc City	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(401, 'TONU', NULL, NULL, NULL, 'Villa Conzoilo Primary School, Villagonzoilo (Villa Consuelo), Jaro, Leyte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(402, 'TONW', NULL, 11.1470538, 124.6383871, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(403, 'TRC3', NULL, 15.6095267, 120.3838211, 'Barangay Poblacion, Mayantoc, Tarlac	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(404, 'TRL1', NULL, 15.444591, 120.5946343, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(405, 'TRLC', NULL, 15.4863468, 120.5892349, 'City health center-I, Tarlac City, Tarlac	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(406, 'TSKB', NULL, 36.1056798, 140.0874965, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(407, 'TUAO', NULL, 17.7349919, 121.4551562, 'Tuao Town Hall, Tuao, Cagayan	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(408, 'TUKU', NULL, 7.851625, 123.5754055, 'Tukuran Technical Vocational High School, Tukuran, Zamboanga Del Sur	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(409, 'TWTF', NULL, 24.9535645, 121.1645015, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(410, 'UP02', NULL, 14.6552731, 121.0594719, 'UP Diliman, Quezon City	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(411, 'URDT', NULL, 15.9889031, 120.5740259, 'DOST office, Urdaneta City, Pangasinan	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(412, 'USUD', NULL, 36.1331105, 138.3620436, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(413, 'VIGN', NULL, 17.5604141, 120.3834179, 'Dean\'s office, 1st floor, College of Engineering, University of Northern Philippines, Brgy. Tamag, Vigan, Ilocos Sur	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(414, 'VMAN', NULL, 13.2300589, 123.6737464, 'VMEPD: Mayon cGPS	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(415, 'VMRH', NULL, 13.2830567, 123.6712108, 'VMEPD: Mayon cGPS	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(416, 'VMSM', NULL, 13.2518305, 123.7299025, 'VMEPD: Mayon cGPS	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(417, 'VRAC', NULL, 13.5860912, 124.2357762, 'EOS|VMEPD: ~50m from CAT1; Veterans Office Building, Virac, Catanduanes	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(418, 'VRC1', NULL, 13.5659825, 124.3367912, 'Brgy. Bote (Sitio Lugsadan), Bato Town, Catanduanes Bicol	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(419, 'VRC2', NULL, 13.5659292, 124.3365657, 'multiple BM; close proximity with VRC1	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(420, 'VRC3', NULL, NULL, NULL, 'multiple BM; close proximity with VRC1	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(421, 'VRC4', NULL, 13.56649655, 124.3368166, 'multiple BM; close proximity with VRC1	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(422, 'VTBM', NULL, 13.9813199, 120.9784409, 'VMEPD: Taal cGPS	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(423, 'VTCT', NULL, 13.9979419, 121.0117445, 'VMEPD: Taal cGPS	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(424, 'VTDK', NULL, 14.0176906, 121.0012542, 'VMEPD: Taal cGPS	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(425, 'WUHA', NULL, 30.5316536, 114.3572593, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(426, 'WUHN', NULL, 30.5316528, 114.357262, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(427, 'ZBS1', NULL, 15.409209, 119.9524843, '33rd Mechanized Infantry Company, 3rd Mechanized Battalion, Barangay Bulawen, Palauig, Zambales	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(428, 'ZBS3', NULL, 15.8056872, 119.9246988, 'Sitio Pasig, Barangay Gama, Sta Cruz, Zambales	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(429, 'ZMPS', NULL, NULL, NULL, 'Zamboanga	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(432, 'TUCP', NULL, NULL, NULL, 'Tuburan Central School, Cebu	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(433, 'SRCP', NULL, NULL, NULL, 'Tambongon Intergrated School, Tambongon, San remigo, Cebu	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(434, 'BCCP', NULL, NULL, NULL, 'Bogo Central School, Bogo City, Cebu	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(435, 'SBOL', NULL, 9.5906149, 124.095295, 'Holy Rosary Church, Lila, Bohol	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(436, 'SBOI', NULL, 9.9949906, 124.0668904, 'Southern Inabanga High School, Dagohoy, Inabanga, Bohol	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(437, 'CCA5', NULL, 13.89883203, 121.0493827, 'Cuenca Central Elementary School, Cuenca, Batangas	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(438, 'TING', NULL, NULL, NULL, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(452, 'AST1', NULL, 25.04045165, 121.6138566, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(463, 'BARA', NULL, 15.97442847, 120.4726615, 'Minien West, Brgy. Oraan East, Santa Barbara, Pangasinan	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(543, 'CAT1', NULL, 13.5865323, 124.2358598, 'Virac, Catanduanes	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(549, 'CEB2', NULL, 10.74952645, 124.0056593, 'Poblacion, Sogod, Cebu	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(555, 'CGN1', NULL, 9.116367, 124.6873545, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(557, 'CLPG', NULL, 10.20370746, 124.7954107, 'Brgy. Calumpang, Matalom, Leyte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(577, 'DANC', NULL, 9.97934774, 122.7385514, 'Filomena G. Gequillana Elementary School (formerly Dancalan Elementary School), Ilog, Negros Occidental	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(584, 'ESEB', NULL, 11.60176599, 125.4392476, 'ESNSHS, Borongan City, Eastern Samar	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(585, 'ESSJ', NULL, 11.36199228, 125.6103978, 'San Jose llorente. Samar	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(586, 'ESTJ', NULL, 11.901004, 125.4192177, 'Taft Central Elementary School, Taft, Eastern Samar	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(597, 'IILO', NULL, 10.9681498, 122.7322772, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(602, 'INHS', NULL, 8.2250866, 124.2395115, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(608, 'JONA', NULL, 13.7069738, 123.7412248, 'Brgy. Sta. Maria, Presentacion, Camarines Sur 	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(620, 'LBHU', NULL, 10.17432031, 124.7997251, 'Maasin City, Southern Leyte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(636, 'LEYI', NULL, 11.70207846, 125.0670972, '(AKA HINA) Hinabangan, Samar, Near Municipal Hall, Leyte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(643, 'LIBO', NULL, 13.82481471, 122.7337035, 'nd Auxiliary of SIBE] Ragay National Agricultural and Fisheries School, Liboro Ragay, Camarines Sur	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(646, 'LOV1', NULL, 13.15976662, 123.7279958, 'VMEPD: Mayon cGPS	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 1, NULL),
(668, 'MACL', NULL, 12.7915656, 123.2925728, 'San isidro Elementary School, Claveria Burias Island, Masbate	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(676, 'MAL2', NULL, 25.0402854, 121.6140174, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(678, 'MALB', NULL, 13.4020434, 123.7033658, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(683, '2-Ma', NULL, NULL, NULL, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(698, 'MASM', NULL, 12.2278592, 123.284517, 'Jose Z. Mesa Sr. Memorial Elementary School, Mandaon, Masbate	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(699, 'MASU', NULL, 12.22345969, 123.7876324, 'Uson National High School	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(711, 'MSJ1', NULL, 12.04000788, 123.1927173, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(744, 'NMJA', NULL, 8.60662659, 124.7666862, 'Aplaya National High School, Jasaan, Misamis Oriental	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(761, 'NPAC', NULL, 11.4259745, 122.0571572, 'Northern Antique Vocational School, Alojado St., Culasi, Antique	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(765, 'NSEV', NULL, 12.42447847, 124.3245017, 'Erenas Elementary School, Victoria, Northern Samar	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(766, 'NSMC', NULL, 12.07103585, 124.5959801, '(NSNC)	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(767, 'NSPC', NULL, 12.56427765, 124.9309946, 'Pambujan Central School, Pambujan, Northern Samar	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(776, 'PAL1', NULL, 13.14651814, 123.6160745, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(814, 'QZN4', NULL, 14.6651539, 121.6049476, '(unknown status and coordinates) Dait, Polilio, Quezon	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(815, 'QZN5', NULL, 14.66515375, 121.6049467, '(NAMRIA) Town Proper, Real Elementary School, Quezon	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(818, 'ROBI', NULL, 13.7725628, 123.8645556, 'Caramoan Central School, Caramoan, Camarines Sur	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(820, 'S01R', NULL, 23.6552749, 119.5923718, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(837, 'SIE1', NULL, 13.8248149, 122.7337043, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(847, 'SIPA', NULL, 9.74819299, 122.4091717, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(852, 'SMB1', NULL, 7.56995401, 126.5650387, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(863, 'SNP1', NULL, 9.3397676, 123.2380486, 'Sibulan Seismic Station, Brgy. San Antonio, Sibulan, Negros Oriental	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(864, 'SNPI', NULL, 9.33976766, 123.2380485, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(895, 'SURI', NULL, 9.6468545, 125.5750705, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(896, 'SVAQ', NULL, 11.7037445, 122.3778027, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(906, 'TGBN', NULL, 9.68842404, 123.8637126, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(911, 'TON1', NULL, 11.18544444, 124.6251668, '[Near TONF] also within PNOC-EDC, Tongonan, Ormoc City	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(920, 'TUBY', NULL, 9.1694833, 125.5321479, 'Tubay Municipal Hall, Tubay, Agusan Del Norte	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(923, 'UBAY', NULL, 10.06143236, 124.4349202, 'Camambugan National High School, Camambugan, Ubay, Bohol	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(938, 'WMSU', NULL, 6.91331983, 122.0616271, NULL, NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', NULL, NULL),
(939, 'WSBC', NULL, 11.80763495, 124.8330615, 'Brgy. Cabugawan, Buri Airport, Catbalogan, Western Samar	', NULL, '2017-10-24 20:47:50', '2017-10-24 20:47:50', 2, NULL),
(942, 'ACDR', NULL, NULL, NULL, 'Antipolo Municipal Hall, Antipolo City	', NULL, '2017-10-24 21:28:16', '2017-10-24 21:28:16', 1, NULL),
(943, 'ADMA', NULL, NULL, NULL, 'DOST Taguig Main Compound (AdMaTeL Bldg.), Bicutan, Taguig	', NULL, '2017-10-24 21:28:16', '2017-10-24 21:28:16', 1, NULL),
(968, 'BAYA', NULL, NULL, NULL, 'Bayanihan Elementary School, Brgy. Paltok, Quezon City	', NULL, '2017-10-24 21:28:17', '2017-10-24 21:28:17', 1, NULL),
(974, 'BMJR', NULL, NULL, NULL, 'Brgy. Mabini J.Rizal Brgy. hall	', NULL, '2017-10-24 21:28:17', '2017-10-24 21:28:17', 1, NULL),
(980, 'BR14', NULL, NULL, NULL, 'BR15] Brgy. Poblacion, Bucay, Abra	', NULL, '2017-10-24 21:28:18', '2017-10-24 21:28:18', 2, NULL),
(981, 'BR15', NULL, NULL, NULL, 'Brgy. Poblacion, Bucay, Abra	', NULL, '2017-10-24 21:28:18', '2017-10-24 21:28:18', 2, NULL),
(1008, 'CEMB', NULL, NULL, NULL, 'Cembo Health Center, Makati City	', NULL, '2017-10-24 21:28:19', '2017-10-24 21:28:19', 1, NULL),
(1016, 'CMWL', NULL, NULL, NULL, 'Brgy. Commonwealth Brgy. Hall, Quezon City	', NULL, '2017-10-24 21:28:19', '2017-10-24 21:28:19', 1, NULL),
(1034, 'DLPZ', NULL, NULL, NULL, 'Dela Paz Elementary School	', NULL, '2017-10-24 21:28:20', '2017-10-24 21:28:20', 1, NULL),
(1070, 'LBCA', NULL, NULL, NULL, '(AKA LIBA) Libacao Municipal Hall, Libacao, Aklan	', NULL, '2017-10-24 21:28:21', '2017-10-24 21:28:21', 1, NULL),
(1091, 'LMSA', NULL, NULL, NULL, 'La Mesa Dam, Quezon City	', NULL, '2017-10-24 21:28:22', '2017-10-24 21:28:22', 1, NULL),
(1151, 'MLRA', NULL, NULL, NULL, 'MBR TODA, Malaria, Caloocan City North	', NULL, '2017-10-24 21:28:25', '2017-10-24 21:28:25', 1, NULL),
(1160, 'MTDW', NULL, NULL, NULL, 'Barangay Munting Dilaw, Cainta, Rizal	', NULL, '2017-10-24 21:28:25', '2017-10-24 21:28:25', 1, NULL),
(1161, 'MTLB', NULL, NULL, NULL, 'Colegio De Montalban, Montalban, Rizal	', NULL, '2017-10-24 21:28:25', '2017-10-24 21:28:25', 1, NULL),
(1162, 'MTSS', NULL, NULL, NULL, 'TGBN ] Tagbilaran Seismic Station, Tagbilaran City, Bohol	', NULL, '2017-10-24 21:28:25', '2017-10-24 21:28:25', 1, NULL),
(1181, 'NAST', NULL, NULL, NULL, 'DOST Taguig Main Compound (Heritage Bldg.), Bicutan, Taguig	', NULL, '2017-10-24 21:28:26', '2017-10-24 21:28:26', 1, NULL),
(1224, 'ORMC', NULL, NULL, NULL, 'NCKU: Ormoc, Leyte	', NULL, '2017-10-24 21:28:28', '2017-10-24 21:28:28', 1, NULL),
(1232, 'PBAS', NULL, NULL, NULL, 'NAMRIA PageNET: 	', NULL, '2017-10-24 21:28:28', '2017-10-24 21:28:28', 1, NULL),
(1236, 'PCAT', NULL, NULL, NULL, 'NAMRIA PageNET: 	', NULL, '2017-10-24 21:28:28', '2017-10-24 21:28:28', 1, NULL),
(1238, 'PCEB', NULL, NULL, NULL, 'NAMRIA PageNET: 	', NULL, '2017-10-24 21:28:28', '2017-10-24 21:28:28', 1, NULL),
(1240, 'PDCS', NULL, NULL, NULL, 'Prieto Diaz Central School, Perlas, Prieto Diaz, Sorsogon	', NULL, '2017-10-24 21:28:28', '2017-10-24 21:28:28', 2, NULL),
(1241, 'PDUM', NULL, NULL, NULL, 'NAMRIA PageNET: 	', NULL, '2017-10-24 21:28:28', '2017-10-24 21:28:28', 1, NULL),
(1242, 'PEMB', NULL, NULL, NULL, 'Pembo Community Complex, Makati City	', NULL, '2017-10-24 21:28:28', '2017-10-24 21:28:28', 1, NULL),
(1251, 'PKAL', NULL, NULL, NULL, 'NAMRIA PageNET: 	', NULL, '2017-10-24 21:28:29', '2017-10-24 21:28:29', 1, NULL),
(1255, 'PMAS', NULL, NULL, NULL, 'NAMRIA PageNET: 	', NULL, '2017-10-24 21:28:29', '2017-10-24 21:28:29', 1, NULL),
(1256, 'PMOG', NULL, NULL, NULL, 'NAMRIA PageNET: 	', NULL, '2017-10-24 21:28:29', '2017-10-24 21:28:29', 1, NULL),
(1257, 'PMRV', NULL, NULL, NULL, 'NAMRIA PageNET: 	', NULL, '2017-10-24 21:28:29', '2017-10-24 21:28:29', 1, NULL),
(1259, 'PNDO', NULL, NULL, NULL, 'NAMRIA PageNET: 	', NULL, '2017-10-24 21:28:29', '2017-10-24 21:28:29', 1, NULL),
(1262, 'PNG6', NULL, NULL, NULL, 'Dagupan City, Pangasinan	', NULL, '2017-10-24 21:28:29', '2017-10-24 21:28:29', 2, NULL),
(1266, 'PRJ4', NULL, NULL, NULL, 'Project 4 Health Center, P. Tuazon, Cubao, Quezon City	', NULL, '2017-10-24 21:28:29', '2017-10-24 21:28:29', 1, NULL),
(1267, 'PSRF', NULL, NULL, NULL, 'NAMRIA PageNET: 	', NULL, '2017-10-24 21:28:29', '2017-10-24 21:28:29', 1, NULL),
(1273, 'PTGO', NULL, NULL, NULL, 'NAMRIA PageNET: 	', NULL, '2017-10-24 21:28:30', '2017-10-24 21:28:30', 1, NULL),
(1275, 'PTUG', NULL, NULL, NULL, 'NAMRIA PageNET: 	', NULL, '2017-10-24 21:28:30', '2017-10-24 21:28:30', 1, NULL),
(1279, 'PZAM', NULL, NULL, NULL, 'NAMRIA PageNET: 	', NULL, '2017-10-24 21:28:30', '2017-10-24 21:28:30', 1, NULL),
(1287, 'RGMH', NULL, NULL, NULL, 'Rodriguez Municipal Hall, Rodriguez, Rizal	', NULL, '2017-10-24 21:28:30', '2017-10-24 21:28:30', 1, NULL),
(1288, 'RMHS', NULL, NULL, NULL, 'Ramon Magsaysay High School	', NULL, '2017-10-24 21:28:30', '2017-10-24 21:28:30', 1, NULL),
(1327, 'SMPH', NULL, NULL, NULL, 'Brgy. Sumilang Multi-purpose Hall, Pasig City	', NULL, '2017-10-24 21:28:32', '2017-10-24 21:28:32', 1, NULL),
(1329, 'SMTC', NULL, NULL, NULL, 'San Mateo Regional Trial Court and Municipal Trial Court, Rizal	', NULL, '2017-10-24 21:28:32', '2017-10-24 21:28:32', 1, NULL),
(1358, 'SPLY', NULL, NULL, NULL, 'Genaro Alvarez Elementary School, Sipalay	', NULL, '2017-10-24 21:28:33', '2017-10-24 21:28:33', 2, NULL),
(1372, 'TNHS', NULL, NULL, NULL, 'Tandang Sora National High School Belmonte Bldg.	', NULL, '2017-10-24 21:28:34', '2017-10-24 21:28:34', 1, NULL),
(1380, 'TRSA', NULL, NULL, NULL, 'Teresa Municipal Hall, Rizal	', NULL, '2017-10-24 21:28:34', '2017-10-24 21:28:34', 1, NULL),
(1385, 'TUMA', NULL, NULL, NULL, 'Tumana Health Center, Marikina City	', NULL, '2017-10-24 21:28:34', '2017-10-24 21:28:34', 1, NULL),
(1386, 'TYTY', NULL, NULL, NULL, 'Taytay Municipal Hall, Taytay, Rizal	', NULL, '2017-10-24 21:28:34', '2017-10-24 21:28:34', 1, NULL),
(1390, 'VCAC', NULL, NULL, NULL, 'Alert Center, Valenzuela City	', NULL, '2017-10-24 21:28:34', '2017-10-24 21:28:34', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `survey_types`
--

CREATE TABLE `survey_types` (
  `id` int(1) NOT NULL,
  `type` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `survey_types`
--

INSERT INTO `survey_types` (`id`, `type`) VALUES
(1, 'continuous'),
(2, 'campaign');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `access_level_id` int(11) DEFAULT NULL,
  `person_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access_levels`
--
ALTER TABLE `access_levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `antennas`
--
ALTER TABLE `antennas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `serial_number` (`serial_number`),
  ADD UNIQUE KEY `antennas_serialNumber_unique` (`serial_number`),
  ADD KEY `antenna_model_id` (`antenna_model_id`);

--
-- Indexes for table `antenna_models`
--
ALTER TABLE `antenna_models`
  ADD PRIMARY KEY (`id`),
  ADD KEY `equipment_brand_id` (`equipment_brand_id`);

--
-- Indexes for table `campaign_logsheets`
--
ALTER TABLE `campaign_logsheets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `antenna_id` (`antenna_id`),
  ADD KEY `receiver_id` (`receiver_id`);

--
-- Indexes for table `campaign_observers`
--
ALTER TABLE `campaign_observers`
  ADD PRIMARY KEY (`campaign_logsheet_id`,`person_id`),
  ADD KEY `person_id` (`person_id`);

--
-- Indexes for table `contact_numbers`
--
ALTER TABLE `contact_numbers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `person_id` (`person_id`);

--
-- Indexes for table `continuous_logsheets`
--
ALTER TABLE `continuous_logsheets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `antenna_id` (`antenna_id`),
  ADD KEY `receiver_id` (`receiver_id`);

--
-- Indexes for table `continuous_observers`
--
ALTER TABLE `continuous_observers`
  ADD PRIMARY KEY (`continuous_logsheet_id`,`person_id`),
  ADD KEY `person_id` (`person_id`);

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
  ADD UNIQUE KEY `address` (`address`),
  ADD UNIQUE KEY `emails_address_unique` (`address`),
  ADD KEY `person_id` (`person_id`);

--
-- Indexes for table `equipment_brands`
--
ALTER TABLE `equipment_brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `markers`
--
ALTER TABLE `markers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `description` (`description`),
  ADD UNIQUE KEY `markers_name_unique` (`name`),
  ADD UNIQUE KEY `markers_description_unique` (`description`);

--
-- Indexes for table `non_staff_positions`
--
ALTER TABLE `non_staff_positions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `office_locations`
--
ALTER TABLE `office_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`id`),
  ADD KEY `position_id` (`position_id`),
  ADD KEY `division_id` (`division_id`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `person_type_id` (`person_type_id`),
  ADD KEY `non_staff_position_id` (`non_staff_position_id`),
  ADD KEY `office_location_id` (`office_location_id`);

--
-- Indexes for table `person_types`
--
ALTER TABLE `person_types`
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
  ADD UNIQUE KEY `receivers_serialNumber_unique` (`serial_number`),
  ADD KEY `receiver_model_id` (`receiver_model_id`);

--
-- Indexes for table `receiver_models`
--
ALTER TABLE `receiver_models`
  ADD PRIMARY KEY (`id`),
  ADD KEY `equipment_brand_id` (`equipment_brand_id`);

--
-- Indexes for table `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `sites_name_unique` (`name`),
  ADD KEY `survey_type_id` (`survey_type_id`),
  ADD KEY `marker_id` (`marker_id`);

--
-- Indexes for table `survey_types`
--
ALTER TABLE `survey_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD KEY `access_level_id` (`access_level_id`),
  ADD KEY `person_id` (`person_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access_levels`
--
ALTER TABLE `access_levels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `antennas`
--
ALTER TABLE `antennas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `antenna_models`
--
ALTER TABLE `antenna_models`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `campaign_logsheets`
--
ALTER TABLE `campaign_logsheets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contact_numbers`
--
ALTER TABLE `contact_numbers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `continuous_logsheets`
--
ALTER TABLE `continuous_logsheets`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `equipment_brands`
--
ALTER TABLE `equipment_brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `markers`
--
ALTER TABLE `markers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `non_staff_positions`
--
ALTER TABLE `non_staff_positions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `office_locations`
--
ALTER TABLE `office_locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `people`
--
ALTER TABLE `people`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `person_types`
--
ALTER TABLE `person_types`
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
-- AUTO_INCREMENT for table `receiver_models`
--
ALTER TABLE `receiver_models`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sites`
--
ALTER TABLE `sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1391;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `antennas`
--
ALTER TABLE `antennas`
  ADD CONSTRAINT `antennas_ibfk_1` FOREIGN KEY (`antenna_model_id`) REFERENCES `antenna_models` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `antenna_models`
--
ALTER TABLE `antenna_models`
  ADD CONSTRAINT `antenna_models_ibfk_1` FOREIGN KEY (`equipment_brand_id`) REFERENCES `equipment_brands` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `campaign_logsheets`
--
ALTER TABLE `campaign_logsheets`
  ADD CONSTRAINT `campaign_logsheets_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `sites` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `campaign_logsheets_ibfk_2` FOREIGN KEY (`antenna_id`) REFERENCES `antennas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `campaign_logsheets_ibfk_3` FOREIGN KEY (`receiver_id`) REFERENCES `receivers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `campaign_observers`
--
ALTER TABLE `campaign_observers`
  ADD CONSTRAINT `campaign_observers_ibfk_1` FOREIGN KEY (`campaign_logsheet_id`) REFERENCES `campaign_logsheets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `campaign_observers_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `people` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contact_numbers`
--
ALTER TABLE `contact_numbers`
  ADD CONSTRAINT `contact_numbers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `people` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `continuous_logsheets`
--
ALTER TABLE `continuous_logsheets`
  ADD CONSTRAINT `continuous_logsheets_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `sites` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `continuous_logsheets_ibfk_2` FOREIGN KEY (`antenna_id`) REFERENCES `antennas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `continuous_logsheets_ibfk_3` FOREIGN KEY (`receiver_id`) REFERENCES `receivers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `continuous_observers`
--
ALTER TABLE `continuous_observers`
  ADD CONSTRAINT `continuous_observers_ibfk_1` FOREIGN KEY (`continuous_logsheet_id`) REFERENCES `continuous_logsheets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `continuous_observers_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `people` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `emails`
--
ALTER TABLE `emails`
  ADD CONSTRAINT `emails_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `people` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `people`
--
ALTER TABLE `people`
  ADD CONSTRAINT `people_ibfk_1` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `people_ibfk_2` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `people_ibfk_3` FOREIGN KEY (`site_id`) REFERENCES `sites` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `people_ibfk_4` FOREIGN KEY (`person_type_id`) REFERENCES `person_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `people_ibfk_5` FOREIGN KEY (`non_staff_position_id`) REFERENCES `non_staff_positions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `people_ibfk_6` FOREIGN KEY (`office_location_id`) REFERENCES `office_locations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `receivers`
--
ALTER TABLE `receivers`
  ADD CONSTRAINT `receivers_ibfk_1` FOREIGN KEY (`receiver_model_id`) REFERENCES `receiver_models` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `receiver_models`
--
ALTER TABLE `receiver_models`
  ADD CONSTRAINT `receiver_models_ibfk_1` FOREIGN KEY (`equipment_brand_id`) REFERENCES `equipment_brands` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sites`
--
ALTER TABLE `sites`
  ADD CONSTRAINT `sites_ibfk_1` FOREIGN KEY (`survey_type_id`) REFERENCES `survey_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `sites_ibfk_2` FOREIGN KEY (`marker_id`) REFERENCES `markers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`access_level_id`) REFERENCES `access_levels` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `people` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
