-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2024 at 12:04 PM
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
-- Database: `bd`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `BLOOD_DATA` ()   BEGIN
    SELECT * FROM blood;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `blood`
--

CREATE TABLE `blood` (
  `B_CODE` int(4) NOT NULL,
  `D_ID` int(3) DEFAULT NULL,
  `B_GROUP` varchar(4) DEFAULT NULL,
  `PACKETS` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blood`
--

INSERT INTO `blood` (`B_CODE`, `D_ID`, `B_GROUP`, `PACKETS`) VALUES
(8, 1, 'AB+', 7),
(9, 1, 'AB+', 5),
(10, 1, 'AB+', 6),
(11, 1, 'AB+', 7);

-- --------------------------------------------------------

--
-- Table structure for table `bloodbank`
--

CREATE TABLE `bloodbank` (
  `B_GROUP` varchar(4) NOT NULL,
  `TOTAL_PACKETS` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bloodbank`
--

INSERT INTO `bloodbank` (`B_GROUP`, `TOTAL_PACKETS`) VALUES
('A+', 0),
('A-', 0),
('AB+', 1),
('AB-', 0),
('B+', 0),
('B-', 0),
('O+', 0),
('O-', 0);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `CONTACT_ID` int(3) NOT NULL,
  `B_GROUP` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `C_PACKETS` int(2) DEFAULT NULL,
  `F_NAME` varchar(50) DEFAULT NULL,
  `ADRESS` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`CONTACT_ID`, `B_GROUP`, `C_PACKETS`, `F_NAME`, `ADRESS`) VALUES
(125, 'AB+', 5, 'tom', '1234 main road'),
(126, 'O+', 2, 'tom', '1234 main road');

-- --------------------------------------------------------

--
-- Table structure for table `donor`
--

CREATE TABLE `donor` (
  `D_ID` int(3) NOT NULL,
  `DNAME` varchar(50) DEFAULT NULL,
  `SEX` varchar(10) DEFAULT NULL,
  `AGE` int(3) DEFAULT NULL,
  `WEIGHT` int(3) DEFAULT NULL,
  `ADDRESS` varchar(150) DEFAULT NULL,
  `DISEASE` varchar(50) DEFAULT NULL,
  `DEMAIL` varchar(100) DEFAULT NULL,
  `DONOR_DATE` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `donor`
--

INSERT INTO `donor` (`D_ID`, `DNAME`, `SEX`, `AGE`, `WEIGHT`, `ADDRESS`, `DISEASE`, `DEMAIL`, `DONOR_DATE`) VALUES
(1, 'test', 'Male', 45, 70, 'Bangalore', 'no', 'test@gmail.com', '2024-02-16 07:41:15'),
(2, 'test', 'Male', 45, 70, 'Bangalore', 'no', 'test@gmail.com', '2024-02-16 09:26:27');

--
-- Triggers `donor`
--
DELIMITER $$
CREATE TRIGGER `agecheck` BEFORE INSERT ON `donor` FOR EACH ROW IF NEW.AGE < 21 THEN SET NEW.AGE = 0;
    END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `N_ID` int(3) NOT NULL,
  `NB_GROUP` varchar(4) DEFAULT NULL,
  `N_PACKETS` int(2) DEFAULT NULL,
  `NF_NAME` varchar(50) DEFAULT NULL,
  `NADRESS` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`N_ID`, `NB_GROUP`, `N_PACKETS`, `NF_NAME`, `NADRESS`) VALUES
(130, 'AB+', 5, 'tom', '1234 main road'),
(131, 'O+', 2, 'tom', '1234 main road');

-- --------------------------------------------------------

--
-- Table structure for table `reception`
--

CREATE TABLE `reception` (
  `E_ID` varchar(54) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `PASSWORD` varchar(100) DEFAULT NULL,
  `REGISTER_DATE` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reception`
--

INSERT INTO `reception` (`E_ID`, `NAME`, `EMAIL`, `PASSWORD`, `REGISTER_DATE`) VALUES
('test2485', 'test', 'test@gmail.com', '$5$rounds=535000$8U/GgXa2FrOshJaq$KKy2WFBcL1qeDHune/UqHlL3vLpjRPgC6rIw.tqY64C', '2024-02-16 07:29:34'),
('test5220', 'test', 'test@gmail.com', '$5$rounds=535000$xtm4ou4eDFaTGj/z$Yh7I6TRHXv6r5.NXFWE5atw3k5t3eQXHNk3apX15B1.', '2024-02-16 09:30:46'),
('test6161', 'test', 'test@gmail.com', '$5$rounds=535000$hOrBh16zMMQtBxEZ$MR6Y1B7u4f6uny1UUVALcK/ha.jkd0Lnrc1mrVfKRBD', '2024-02-16 09:12:05'),
('test7596', 'test', 'test@gmail.com', '$5$rounds=535000$ey8CJKR4CpZ0NJXF$62rSy5sXDtHGktSRAjnD4JAzbiPfSU0FGOHIK/TG1r9', '2024-02-16 10:37:31'),
('test8024', 'test', 'test@gmail.com', '$5$rounds=535000$urX.oHmo0uKQSf7F$4fRW3A4z2wQp4nY1hlu.tZ3GY/XrpxCNUDeopbWXRa6', '2024-02-16 09:25:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blood`
--
ALTER TABLE `blood`
  ADD PRIMARY KEY (`B_CODE`),
  ADD KEY `D_ID` (`D_ID`),
  ADD KEY `B_GROUP` (`B_GROUP`);

--
-- Indexes for table `bloodbank`
--
ALTER TABLE `bloodbank`
  ADD PRIMARY KEY (`B_GROUP`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`CONTACT_ID`),
  ADD KEY `B_GROUP` (`B_GROUP`);

--
-- Indexes for table `donor`
--
ALTER TABLE `donor`
  ADD PRIMARY KEY (`D_ID`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`N_ID`);

--
-- Indexes for table `reception`
--
ALTER TABLE `reception`
  ADD PRIMARY KEY (`E_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blood`
--
ALTER TABLE `blood`
  MODIFY `B_CODE` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `CONTACT_ID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `donor`
--
ALTER TABLE `donor`
  MODIFY `D_ID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `N_ID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blood`
--
ALTER TABLE `blood`
  ADD CONSTRAINT `blood_ibfk_1` FOREIGN KEY (`D_ID`) REFERENCES `donor` (`D_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `blood_ibfk_2` FOREIGN KEY (`B_GROUP`) REFERENCES `bloodbank` (`B_GROUP`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`B_GROUP`) REFERENCES `bloodbank` (`B_GROUP`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
