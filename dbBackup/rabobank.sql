-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 17, 2020 at 09:48 AM
-- Server version: 5.7.32-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rabobank`
--

-- --------------------------------------------------------

--
-- Table structure for table `record_description`
--

CREATE TABLE `record_description` (
  `id` int(11) NOT NULL,
  `transaction_reference` varchar(250) DEFAULT NULL,
  `account_number` varchar(250) DEFAULT NULL,
  `start_balance` int(250) DEFAULT NULL,
  `mutation` varchar(250) DEFAULT NULL,
  `description` text,
  `end_balance` int(250) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `record_description`
--

INSERT INTO `record_description` (`id`, `transaction_reference`, `account_number`, `start_balance`, `mutation`, `description`, `end_balance`, `created_at`) VALUES
(140, '130498', 'NL69ABNA0433647324', 27, '-18.78', 'Tickets for Peter Theuß', 8, '2020-11-16 12:08:54'),
(141, '147674', 'NL93ABNA0585619023', 75, '-44.91', 'Subscription from Peter Dekker', 30, '2020-11-16 12:08:54'),
(142, '135607', 'NL27SNSB0917829871', 70, '+34.42', 'Subscription from Peter Theuß', 105, '2020-11-16 12:08:55'),
(143, '169639', 'NL43AEGO0773393871', 32, '-6.14', 'Tickets for Rik de Vries', 26, '2020-11-16 12:08:55'),
(144, '105549', 'NL43AEGO0773393871', 106, '-26.17', 'Flowers from Peter de Vries', 80, '2020-11-16 12:08:55'),
(145, '150438', 'NL74ABNA0248990274', 10, '-0.3', 'Tickets from Richard de Vries', 10, '2020-11-16 12:08:55'),
(146, '172833', 'NL69ABNA0433647324', 67, '-41.74', 'Tickets for Willem Theuß', 25, '2020-11-16 12:08:55'),
(147, '170148', 'NL43AEGO0773393871', 17, '+43.09', 'Flowers for Jan Theuß', 60, '2020-11-16 12:08:55'),
(148, '194261', 'NL91RABO0315273637', 22, '-41.83', 'Clothes from Jan Bakker', -20, '2020-11-16 12:08:55'),
(149, '112806', 'NL27SNSB0917829871', 91, '+15.57', 'Clothes for Willem Dekker', 107, '2020-11-16 12:08:55'),
(150, '183049', 'NL69ABNA0433647324', 87, '+44.5', 'Clothes for Jan King', 131, '2020-11-16 12:08:55'),
(151, '183356', 'NL74ABNA0248990274', 93, '-46.65', 'Subscription for Peter de Vries', 46, '2020-11-16 12:08:55'),
(152, '139524', 'NL43AEGO0773393871', 99, '+41.23', 'Flowers from Jan Bakker', 141, '2020-11-16 12:08:55'),
(153, '179430', 'NL93ABNA0585619023', 24, '-27.43', 'Clothes for Vincent Bakker', -3, '2020-11-16 12:08:55'),
(154, '141223', 'NL93ABNA0585619023', 94, '+41.6', 'Clothes from Erik Bakker', 136, '2020-11-16 12:08:55'),
(155, '195446', 'NL74ABNA0248990274', 26, '+48.98', 'Flowers for Willem Dekker', 75, '2020-11-16 12:08:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `record_description`
--
ALTER TABLE `record_description`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `record_description`
--
ALTER TABLE `record_description`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
