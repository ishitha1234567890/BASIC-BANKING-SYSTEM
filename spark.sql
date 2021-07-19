-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2021 at 03:30 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
--
-- Database: `spark`
--
-- --------------------------------------------------------
--
-- Table structure for table `transaction`
--
CREATE TABLE `transaction` (
  `sno` int(30) NOT NULL,
  `sender` varchar(30) NOT NULL,
  `receiver` varchar(30) NOT NULL,
  `balance` int(30) NOT NULL,
  `datetime` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`sno`, `sender`, `receiver`, `balance`, `datetime`) VALUES
(1, 'T.T.SONI', 'HEENA KHAN', 350, '2021-07-11 18:58:27'),
(2, 'T.T.SONI', 'HEENA KHAN', 500, '2021-07-11 19:00:31'),
(3, 'HEENA KHAN', 'MAHI SINGH', 5000, '2021-07-11 19:01:32'),
(4, 'T.T.SONI', 'T.AYUSH', 200, '2021-07-11 19:06:15'),
(5, 'T.AYUSH', 'HEENA KHAN', 700, '2021-07-11 19:28:24');

-- --------------------------------------------------------
--
-- Table structure for table `customers`
--
CREATE TABLE `cust` (
  `id` int(30) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Email-Id` varchar(30) NOT NULL,
  `Bank Name` varchar(30) NOT NULL,
  `State` varchar(30) NOT NULL,
  `balance` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
--
-- Dumping data for table `users`
INSERT INTO `cust` (`id`, `Name`, `Email-Id`, `Bank Name`, `State`, `balance`) VALUES 
(1, 'JILL JOHNSON', 'johnson@gmail.com', 'BANK OF BAORODA', 'GUJARAT', '700000'),
 (2, 'T.T.SONI', 'soni@gmail.com', 'CANARA BANK', 'BENGAL', '5430000'), 
(3, 'MILLY TOM', 'tom@gmail.com', 'UNION BANK OF INDIA', 'HYDERABAD', '100000'), 
(4, 'SHREYANSHI RAWAT', 'sr22@gmail.com', 'CENTRAL BANK OF INDIA', 'KERLA', '7500020'), 
(5, 'DARSHAN RAVAL', 'raval@gmail.com', 'INDIAN BANK', 'GOA', '806000'),
(6, 'HEENA KHAN', 'khan@gmail.com', 'STATE BANK OF INDIA', 'U.P', '5700600'), 
(7, 'T.AYUSH', 'ayus@gmail.com', 'ICICI BANK', 'HARYANA', '9000000'), 
(8, 'CHERRY SAI', 'cherry@gmail.com', 'YES BANK', 'TAMIL NADU', '7500000'), 
(9, 'SAM JACKSON', 'sam@gmail.com', 'AXIS BANK', 'DELHI', '9830000'), 
(10, 'MAHI SINGH', 'mahi@gmail.com', 'PUNJAB NATIONAL BANK', 'PUNJAB', '6400000');
--
-- Indexes for dumped tables
--
--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`sno`);
--
-- Indexes for table `users`
--
ALTER TABLE `cust`
  ADD PRIMARY KEY (`id`);
--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `sno`int(30) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `cust`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;
COMMIT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;