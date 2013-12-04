-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2013 at 10:47 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `training_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

CREATE TABLE IF NOT EXISTS `admin_info` (
  `username` varchar(15) NOT NULL,
  `password` varchar(25) NOT NULL,
  `staff_id` varchar(15) NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ads_info`
--

CREATE TABLE IF NOT EXISTS `ads_info` (
  `email` varchar(25) NOT NULL,
  `department` varchar(25) NOT NULL,
  `name_dep_head` varchar(25) NOT NULL,
  `ads_status` tinyint(1) NOT NULL,
  `offer_letter_id` int(15) NOT NULL,
  `offer_letter_place` varchar(50) NOT NULL,
  PRIMARY KEY (`offer_letter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `course_attandence`
--

CREATE TABLE IF NOT EXISTS `course_attandence` (
  `staff_id` varchar(15) NOT NULL,
  `course_id` varchar(15) NOT NULL,
  `attandence_status` tinyint(1) NOT NULL,
  `category` varchar(15) NOT NULL,
  `start_date` date NOT NULL,
  PRIMARY KEY (`course_id`),
  UNIQUE KEY `staff_id` (`staff_id`),
  UNIQUE KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `course_info`
--

CREATE TABLE IF NOT EXISTS `course_info` (
  `course_id` varchar(15) NOT NULL,
  `course_name` varchar(25) NOT NULL,
  `category` varchar(15) NOT NULL,
  `organized` varchar(25) NOT NULL,
  `objective` varchar(150) NOT NULL,
  `time` time NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `place` varchar(50) NOT NULL,
  `course_status` varchar(15) NOT NULL,
  `staff_id` varchar(15) NOT NULL,
  `number_of_staff` int(4) NOT NULL,
  PRIMARY KEY (`course_id`),
  UNIQUE KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `generate_certificate`
--

CREATE TABLE IF NOT EXISTS `generate_certificate` (
  `certificate_no` int(6) NOT NULL,
  `course_id` varchar(15) NOT NULL,
  `category` varchar(25) NOT NULL,
  `name` varchar(50) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `ic_no` varchar(25) NOT NULL,
  `start_date` date NOT NULL,
  PRIMARY KEY (`certificate_no`),
  UNIQUE KEY `course_id` (`course_id`),
  UNIQUE KEY `certificate_no` (`certificate_no`),
  UNIQUE KEY `ic_no` (`ic_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `generate_report`
--

CREATE TABLE IF NOT EXISTS `generate_report` (
  `report_no` int(6) NOT NULL,
  `course_id` varchar(15) NOT NULL,
  `report_type` varchar(25) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`report_no`),
  UNIQUE KEY `course_id` (`course_id`),
  UNIQUE KEY `report_no` (`report_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `organizer_official`
--

CREATE TABLE IF NOT EXISTS `organizer_official` (
  `official_id` int(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `contact_no` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `tutelage_courses` varchar(50) NOT NULL,
  PRIMARY KEY (`official_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `participant_info`
--

CREATE TABLE IF NOT EXISTS `participant_info` (
  `course_id` varchar(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `sponsors` varchar(25) NOT NULL,
  `participant_role` varchar(25) NOT NULL,
  `staff_id` varchar(15) NOT NULL,
  `paticipation_status` tinyint(1) NOT NULL,
  `participant_status` varchar(25) NOT NULL,
  `sponsors_status` varchar(25) NOT NULL,
  UNIQUE KEY `course_id` (`course_id`),
  UNIQUE KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `report_info`
--

CREATE TABLE IF NOT EXISTS `report_info` (
  `report_no` int(6) NOT NULL,
  `report_type` varchar(25) NOT NULL,
  PRIMARY KEY (`report_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `signer_info`
--

CREATE TABLE IF NOT EXISTS `signer_info` (
  `certificate_no` int(6) NOT NULL,
  `position` varchar(25) NOT NULL,
  `signer_name` varchar(50) NOT NULL,
  PRIMARY KEY (`certificate_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `staff_info`
--

CREATE TABLE IF NOT EXISTS `staff_info` (
  `staff _id` varchar(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `username` varchar(15) NOT NULL,
  `no_ic` varchar(25) NOT NULL,
  `address` varchar(50) NOT NULL,
  `faculty` varchar(25) NOT NULL,
  `employee_types` varchar(25) NOT NULL,
  `positions` varchar(25) NOT NULL,
  `position_grade` varchar(25) NOT NULL,
  `position_status` varchar(25) NOT NULL,
  `department` varchar(25) NOT NULL,
  PRIMARY KEY (`staff _id`),
  UNIQUE KEY `no_ic` (`no_ic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `verification_info`
--

CREATE TABLE IF NOT EXISTS `verification_info` (
  `staff_id` varchar(15) NOT NULL,
  `position` varchar(25) NOT NULL,
  `department` varchar(25) NOT NULL,
  `name_dep_head` varchar(25) NOT NULL,
  `faculty` varchar(25) NOT NULL,
  UNIQUE KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD CONSTRAINT `admin_info_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff _id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `course_attandence`
--
ALTER TABLE `course_attandence`
  ADD CONSTRAINT `course_attandence_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff _id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `course_attandence_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course_info` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `course_info`
--
ALTER TABLE `course_info`
  ADD CONSTRAINT `course_info_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff _id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `generate_certificate`
--
ALTER TABLE `generate_certificate`
  ADD CONSTRAINT `generate_certificate_ibfk_1` FOREIGN KEY (`ic_no`) REFERENCES `staff_info` (`no_ic`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `generate_certificate_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course_info` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `generate_report`
--
ALTER TABLE `generate_report`
  ADD CONSTRAINT `generate_report_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course_info` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `generate_report_ibfk_2` FOREIGN KEY (`report_no`) REFERENCES `report_info` (`report_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `participant_info`
--
ALTER TABLE `participant_info`
  ADD CONSTRAINT `participant_info_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff _id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `participant_info_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course_info` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `signer_info`
--
ALTER TABLE `signer_info`
  ADD CONSTRAINT `signer_info_ibfk_1` FOREIGN KEY (`certificate_no`) REFERENCES `generate_certificate` (`certificate_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `verification_info`
--
ALTER TABLE `verification_info`
  ADD CONSTRAINT `verification_info_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff _id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
