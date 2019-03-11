-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2019 at 01:47 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `facefly`
--

-- --------------------------------------------------------

--
-- Table structure for table `airlines`
--

CREATE TABLE `airlines` (
  `airline_id` int(11) NOT NULL,
  `airline_name` varchar(55) NOT NULL,
  `airline_nation_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `airlines`
--

INSERT INTO `airlines` (`airline_id`, `airline_name`, `airline_nation_id`) VALUES
(1, 'Qatar Airways', 1),
(2, 'Vietnam Airlines', 1),
(3, 'VietJet', 3),
(4, 'Japan Airlines', 3);

-- --------------------------------------------------------

--
-- Table structure for table `airports`
--

CREATE TABLE `airports` (
  `airport_id` int(11) NOT NULL,
  `airport_name` varchar(55) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `airports`
--

INSERT INTO `airports` (`airport_id`, `airport_name`) VALUES
(1, 'Doha Hamad International Airport'),
(2, 'Soekarno Hatta Intl Airport'),
(3, 'Abu Dhabi Intl'),
(4, 'Tan Son Nhat International Airport');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `city_id` int(11) NOT NULL,
  `city_name` varchar(55) NOT NULL,
  `city_code` varchar(15) NOT NULL,
  `city_airport_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`city_id`, `city_name`, `city_code`, `city_airport_id`) VALUES
(1, 'Hồ Chí Minh', 'SGN', 1),
(2, 'Hà Nội', 'HAN', 2),
(3, 'Đà Nẵng', 'DN', 3);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `customer_user_id` int(11) NOT NULL,
  `customer_first_name` varchar(55) NOT NULL,
  `customer_last_name` varchar(16) NOT NULL,
  `customer_title` varchar(16) NOT NULL,
  `customer_transfer` varchar(55) NOT NULL,
  `customer_paypal` varchar(55) NOT NULL,
  `customer_credit_card` int(16) NOT NULL,
  `customer_credit_name` varchar(55) NOT NULL,
  `customer_credit_ccv` varchar(8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_user_id`, `customer_first_name`, `customer_last_name`, `customer_title`, `customer_transfer`, `customer_paypal`, `customer_credit_card`, `customer_credit_name`, `customer_credit_ccv`) VALUES
(1, 0, '', '', '', '', '', 0, '', ''),
(2, 0, '', '', '', '', '', 0, '', ''),
(3, 0, '', '', '', '', '', 0, '', ''),
(4, 0, '', '', '', '', '', 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `flight_booking`
--

CREATE TABLE `flight_booking` (
  `fb_id` int(11) NOT NULL,
  `fb_airline_id` int(11) NOT NULL,
  `fb_city_from_id` int(11) NOT NULL,
  `fb_city_to_id` int(11) NOT NULL,
  `fb_transit_id` int(11) NOT NULL,
  `fb_customer_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flight_booking`
--

INSERT INTO `flight_booking` (`fb_id`, `fb_airline_id`, `fb_city_from_id`, `fb_city_to_id`, `fb_transit_id`, `fb_customer_id`) VALUES
(1, 0, 0, 0, 0, 0),
(2, 0, 0, 0, 0, 0),
(3, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `flight_classes`
--

CREATE TABLE `flight_classes` (
  `fc_id` int(11) NOT NULL,
  `fc_name` varchar(55) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flight_classes`
--

INSERT INTO `flight_classes` (`fc_id`, `fc_name`) VALUES
(1, 'Economy'),
(2, 'Business'),
(3, 'Premium Economy');

-- --------------------------------------------------------

--
-- Table structure for table `flight_list`
--

CREATE TABLE `flight_list` (
  `fl_id` int(11) NOT NULL,
  `fl_code` varchar(15) NOT NULL,
  `fl_airline_id` int(11) NOT NULL,
  `fl_fc_id` int(11) NOT NULL,
  `fl_type` tinyint(11) NOT NULL,
  `fl_city_from_id` int(11) NOT NULL,
  `fl_city_to_id` int(11) NOT NULL,
  `fl_departure_day` datetime DEFAULT NULL,
  `fl_return_day` datetime DEFAULT NULL,
  `fl_total` int(11) NOT NULL,
  `fl_cost` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flight_list`
--

INSERT INTO `flight_list` (`fl_id`, `fl_code`, `fl_airline_id`, `fl_fc_id`, `fl_type`, `fl_city_from_id`, `fl_city_to_id`, `fl_departure_day`, `fl_return_day`, `fl_total`, `fl_cost`) VALUES
(1, 'VVCS/VCS', 1, 2, 2, 1, 2, '2019-03-01 09:00:00', '2019-03-04 12:00:00', 100, 1500000),
(2, 'VVCT/VCA', 2, 2, 1, 1, 3, '2019-03-06 15:00:00', '2019-03-07 15:00:00', 150, 5500000),
(3, 'VVTS/SGN', 3, 3, 3, 2, 3, '2019-03-07 19:00:00', '2019-03-08 15:00:00', 250, 8500000);

-- --------------------------------------------------------

--
-- Table structure for table `nations`
--

CREATE TABLE `nations` (
  `nation_id` int(11) NOT NULL,
  `nation_name` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `nations`
--

INSERT INTO `nations` (`nation_id`, `nation_name`) VALUES
(1, 'Việt Nam'),
(2, 'Hàn Quốc'),
(3, 'Nhật Bản');

-- --------------------------------------------------------

--
-- Table structure for table `transits`
--

CREATE TABLE `transits` (
  `transit_id` int(11) NOT NULL,
  `transit_city_id` int(11) NOT NULL,
  `transit_fl_id` int(11) NOT NULL,
  `transit_departure_date` datetime NOT NULL,
  `transit_landing_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transits`
--

INSERT INTO `transits` (`transit_id`, `transit_city_id`, `transit_fl_id`, `transit_departure_date`, `transit_landing_date`) VALUES
(1, 1, 1, '2019-03-08 02:05:00', '2019-03-07 00:05:00'),
(2, 2, 2, '2019-03-08 09:00:00', '2019-03-08 08:10:00'),
(3, 3, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_email` varchar(55) NOT NULL,
  `user_password` varchar(128) NOT NULL,
  `user_first_name` varchar(55) NOT NULL,
  `user_last_name` varchar(15) NOT NULL,
  `user_phone` varchar(15) NOT NULL,
  `user_last_access` datetime DEFAULT NULL,
  `user_attempt` int(11) DEFAULT NULL,
  `user_status` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_email`, `user_password`, `user_first_name`, `user_last_name`, `user_phone`, `user_last_access`, `user_attempt`, `user_status`) VALUES
(1, 'nhozstar0024@gmail.com', '$2y$10$0gE1bxXqFcgY1KQxD9/iC.4jXEIbR4ztKSphEI7l2jhohYTK6FlXe', 'Honga', 'Uts', '9094494122', '2019-03-07 03:58:37', 0, 1),
(2, 'asd@gmail.com', '$2y$10$/qqZvvP2Ng0ykKaT485S5OgS15BvxdP/pLznKUlS5tmoZdKnfOu6e', 'Hong', 'Ut', '909449412', '2019-03-06 08:37:16', 0, 1),
(3, 'asdasd@yahoo.com', '$2y$10$PPBw10K4KSxtH8uM93L8QOvl5A7tHOmjygYzztp25bns1tzMD2EiG', 'Hong', 'Ut', '909449412', NULL, NULL, NULL),
(4, 'hongut@gmail.com', '$2y$10$C3nm4r6RoI8WievfSs2H7eIoun5Wsb.aXqw6fOPXCnex9x5Lff9LK', 'Hong', 'Ut', '909449412', NULL, NULL, NULL),
(5, 'kimngan123@gmail.com', '$2y$10$ue6Wqs7l2xTe3uOHBhkffep7NZMLod74APjoYlrpr.QStxOBRE6Ha', 'Kim Ngan', 'Tran Thi', '0327098408', '2019-03-10 07:41:11', 0, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `airlines`
--
ALTER TABLE `airlines`
  ADD PRIMARY KEY (`airline_id`);

--
-- Indexes for table `airports`
--
ALTER TABLE `airports`
  ADD PRIMARY KEY (`airport_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`city_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `flight_booking`
--
ALTER TABLE `flight_booking`
  ADD PRIMARY KEY (`fb_id`);

--
-- Indexes for table `flight_classes`
--
ALTER TABLE `flight_classes`
  ADD PRIMARY KEY (`fc_id`);

--
-- Indexes for table `flight_list`
--
ALTER TABLE `flight_list`
  ADD PRIMARY KEY (`fl_id`);

--
-- Indexes for table `nations`
--
ALTER TABLE `nations`
  ADD PRIMARY KEY (`nation_id`);

--
-- Indexes for table `transits`
--
ALTER TABLE `transits`
  ADD PRIMARY KEY (`transit_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `airlines`
--
ALTER TABLE `airlines`
  MODIFY `airline_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `airports`
--
ALTER TABLE `airports`
  MODIFY `airport_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `flight_booking`
--
ALTER TABLE `flight_booking`
  MODIFY `fb_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `flight_classes`
--
ALTER TABLE `flight_classes`
  MODIFY `fc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `flight_list`
--
ALTER TABLE `flight_list`
  MODIFY `fl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `nations`
--
ALTER TABLE `nations`
  MODIFY `nation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transits`
--
ALTER TABLE `transits`
  MODIFY `transit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
