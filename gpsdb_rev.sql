-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 24, 2017 at 05:03 PM
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
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `survey_type_id` int(1) DEFAULT NULL,
  `marker_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `survey_types`
--

CREATE TABLE `survey_types` (
  `id` int(1) NOT NULL,
  `type` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
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
