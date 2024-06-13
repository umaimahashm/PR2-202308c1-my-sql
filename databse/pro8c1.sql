-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2024 at 08:11 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pro8c1`
--

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

CREATE TABLE `artist` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `songname` varchar(200) NOT NULL,
  `releaseyear` int(11) NOT NULL,
  `city` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `artist`
--

INSERT INTO `artist` (`id`, `name`, `songname`, `releaseyear`, `city`) VALUES
(1, 'Asim Azhar', 'Tum mile', 2013, 'Karachi'),
(2, 'Atif Aslam', 'Pheli Dafa', 2017, 'Faisalabad'),
(3, 'Atif Aslam', 'Jeena Jeena', 2010, 'Faisalabad'),
(4, 'Arjit singh', 'Oh maahi', 2010, 'Faisalabad');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `name`) VALUES
(1, 'admin'),
(2, 'faculty'),
(3, 'accounts'),
(4, 'HR');

-- --------------------------------------------------------

--
-- Table structure for table `employe`
--

CREATE TABLE `employe` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` enum('male','female') DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employe`
--

INSERT INTO `employe` (`id`, `name`, `salary`, `city`, `age`, `gender`, `dept_id`) VALUES
(1, '\'umaima\'', NULL, 'karachi', 22, 'female', 1),
(2, 'fahad', NULL, 'multan', 20, 'male', 2),
(3, 'sara', 29000, 'karachi', 20, 'female', 4),
(4, 'faizan', 98000, 'multan', 22, 'male', 3),
(5, 'umer', 39000, 'lahore', 23, 'male', NULL),
(6, 'hiba', 23000, 'karachi', 21, 'female', NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `myallemp`
-- (See below for the actual view)
--
CREATE TABLE `myallemp` (
`empname` varchar(200)
,`salary` int(11)
,`department` varchar(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `id` int(11) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `gender` varchar(25) NOT NULL,
  `D_O_B` date NOT NULL,
  `age` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `song`
--

CREATE TABLE `song` (
  `id` int(11) NOT NULL,
  `song_name` varchar(200) NOT NULL,
  `release_year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `song`
--

INSERT INTO `song` (`id`, `song_name`, `release_year`) VALUES
(1, 'tum mile', 2013),
(2, 'Jeena Jeena', 2010);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `stdId` int(11) NOT NULL,
  `studentName` varchar(10) DEFAULT NULL,
  `stdEmail` varchar(50) DEFAULT NULL,
  `stdge` int(11) DEFAULT NULL,
  `stdTeacher` varchar(200) DEFAULT NULL,
  `stdgender` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`stdId`, `studentName`, `stdEmail`, `stdge`, `stdTeacher`, `stdgender`) VALUES
(1, 'umaima', 'umaima@gmail.com', 21, 'miss sana', 'male'),
(2, 'aqsa', 'aqsa@gmail.com', 22, 'sir ali', 'female');

-- --------------------------------------------------------

--
-- Structure for view `myallemp`
--
DROP TABLE IF EXISTS `myallemp`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `myallemp`  AS SELECT `employe`.`name` AS `empname`, `employe`.`salary` AS `salary`, `department`.`name` AS `department` FROM (`employe` join `department` on(`employe`.`dept_id` = `department`.`id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employe`
--
ALTER TABLE `employe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`stdId`),
  ADD UNIQUE KEY `stdEmail` (`stdEmail`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artist`
--
ALTER TABLE `artist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employe`
--
ALTER TABLE `employe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `stdId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employe`
--
ALTER TABLE `employe`
  ADD CONSTRAINT `employe_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `department` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
