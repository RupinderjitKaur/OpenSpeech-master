-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 16, 2019 at 02:29 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `search_engine`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `pswd` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `name`, `email`, `pswd`) VALUES
(1, 'Rupinderjit Kaur', 'rupinder@gmail.com', '1234'),
(2, 'Simranjit Kaur', 'simran@gmail.com', 'abcd');

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `app_id` int(11) NOT NULL,
  `app_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `applications`
--

INSERT INTO `applications` (`app_id`, `app_name`) VALUES
(1, 'google'),
(2, 'weather'),
(3, 'youtube');

-- --------------------------------------------------------

--
-- Table structure for table `application_icons`
--

CREATE TABLE `application_icons` (
  `app_id` int(11) NOT NULL,
  `pic_path` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `application_icons`
--

INSERT INTO `application_icons` (`app_id`, `pic_path`) VALUES
(1, 'E:\\OpenSpeech-master\\google_icon.png'),
(2, 'E:\\OpenSpeech-master\\weather_icon.png'),
(3, 'E:\\OpenSpeech-master\\you_icon.png');

-- --------------------------------------------------------

--
-- Table structure for table `application_parameters`
--

CREATE TABLE `application_parameters` (
  `app_id` int(11) NOT NULL,
  `module` text NOT NULL,
  `function` text NOT NULL,
  `class` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `application_parameters`
--

INSERT INTO `application_parameters` (`app_id`, `module`, `function`, `class`) VALUES
(1, 'openbrowser', 'opengoogle', NULL),
(2, 'openapp', 'openweather', 'search_city.SearchPanel'),
(3, 'openbrowser', 'openyoutube', 'youtube_search_panel.YPanel');

-- --------------------------------------------------------

--
-- Table structure for table `unknown_apps`
--

CREATE TABLE `unknown_apps` (
  `SrNo` int(11) NOT NULL,
  `searched_by` int(11) NOT NULL,
  `app_searched` text NOT NULL,
  `searched_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `pswd` text NOT NULL,
  `d_city` text NOT NULL,
  `phone` varchar(15) NOT NULL,
  `allowed_status` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `pswd`, `d_city`, `phone`, `allowed_status`) VALUES
(1, 'Rupinderjit Kaur', 'rupinder@gmail.com', '1234', 'Jalandhar', '7508800498', b'1'),
(2, 'Simranjit Kaur', 'simran@gmail.com', 'abcd', 'Mohali', '8427534640', b'1'),
(3, 'Gurnoor Singh', 'gurnoor@gmail.com', 'qwerty', 'Jalandhar', '9876177588', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `weather_history`
--

CREATE TABLE `weather_history` (
  `srno` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `city` text NOT NULL,
  `searched_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `weather_history`
--

INSERT INTO `weather_history` (`srno`, `u_id`, `city`, `searched_at`) VALUES
(1, 1, 'jalandhar', '2019-08-16 11:09:13'),
(2, 1, 'jalandhar', '2019-08-16 11:10:38'),
(3, 1, 'Jalandhar', '2019-08-16 11:15:37'),
(4, 1, 'Jalandhar', '2019-08-16 11:17:57'),
(5, 1, 'Jalandhar', '2019-08-16 11:19:46'),
(6, 1, 'Jalandhar', '2019-08-16 11:20:35'),
(7, 1, 'Jalandhar', '2019-08-16 11:21:47'),
(8, 1, 'Jalandhar', '2019-08-16 11:23:28'),
(9, 1, 'Jalandhar', '2019-08-16 11:24:32'),
(10, 1, 'Jalandhar', '2019-08-16 11:25:22'),
(11, 1, 'Jalandhar', '2019-08-16 11:34:25'),
(12, 1, 'Jalandhar', '2019-08-16 11:37:58'),
(13, 1, 'Jalandhar', '2019-08-16 11:40:07'),
(14, 1, 'Jalandhar', '2019-08-16 11:41:09'),
(15, 1, 'Jalandhar', '2019-08-16 11:42:05'),
(16, 1, 'Jalandhar', '2019-08-16 11:45:16'),
(17, 1, 'Jalandhar', '2019-08-16 11:46:39'),
(18, 1, 'Jalandhar', '2019-08-16 11:49:50'),
(19, 1, 'Jalandhar', '2019-08-16 11:50:50'),
(20, 1, 'Jalandhar', '2019-08-16 11:51:40'),
(21, 1, 'Jalandhar', '2019-08-16 11:52:29'),
(22, 1, 'Jalandhar', '2019-08-16 11:53:18'),
(23, 1, 'Jalandhar', '2019-08-16 11:55:27'),
(24, 1, 'Jalandhar', '2019-08-16 11:55:51'),
(25, 1, 'Jalandhar', '2019-08-16 11:56:58'),
(26, 1, 'Jalandhar', '2019-08-16 11:59:24'),
(27, 1, 'Jalandhar', '2019-08-16 12:07:31'),
(28, 1, 'Jalandhar', '2019-08-16 12:08:18'),
(29, 1, 'Jalandhar', '2019-08-16 12:08:48'),
(30, 1, 'Jalandhar', '2019-08-16 12:09:12'),
(31, 1, 'Jalandhar', '2019-08-16 12:09:52'),
(32, 1, 'Jalandhar', '2019-08-16 12:10:02');

-- --------------------------------------------------------

--
-- Table structure for table `weather_themes`
--

CREATE TABLE `weather_themes` (
  `srno` int(11) NOT NULL,
  `weather` text NOT NULL,
  `background` text NOT NULL,
  `canvas1` text NOT NULL,
  `canvas2` text NOT NULL,
  `canvas3` text NOT NULL,
  `canvas4` text NOT NULL,
  `canvas5` text NOT NULL,
  `canvas6` text NOT NULL,
  `canvas7` text NOT NULL,
  `font` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `weather_themes`
--

INSERT INTO `weather_themes` (`srno`, `weather`, `background`, `canvas1`, `canvas2`, `canvas3`, `canvas4`, `canvas5`, `canvas6`, `canvas7`, `font`) VALUES
(1, 'default', 'E:\\OpenSpeech-master\\white.png', 'E:\\OpenSpeech-master\\white.png', 'E:\\OpenSpeech-master\\white.png', 'E:\\OpenSpeech-master\\white.png', 'E:\\OpenSpeech-master\\white.png', 'E:\\OpenSpeech-master\\white.png', 'E:\\OpenSpeech-master\\white.png', 'E:\\OpenSpeech-master\\white.png', 'black');

-- --------------------------------------------------------

--
-- Table structure for table `youtube_history`
--

CREATE TABLE `youtube_history` (
  `srno` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `video_id` text NOT NULL,
  `title` text NOT NULL,
  `img_url` text NOT NULL,
  `published_at` text NOT NULL,
  `searched_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `youtube_history`
--

INSERT INTO `youtube_history` (`srno`, `u_id`, `video_id`, `title`, `img_url`, `published_at`, `searched_at`) VALUES
(1, 1, 'vpzitzyMRwc', 'Saaho: Enni Soni Song | Prabhas, Shraddha Kapoor | Guru Randhawa, Tulsi Kumar', 'https://i.ytimg.com/vi/vpzitzyMRwc/default.jpg', '2019-08-02T08:31:35.000Z', '2019-08-15 22:09:14'),
(2, 1, 'yyUodifWNxU', 'Jugraafiya - Super 30 | Hrithik Roshan Mrunal Thakur|Udit Narayan Shreya Ghoshal|Ajay Atul|Amitabh B', 'https://i.ytimg.com/vi/yyUodifWNxU/default.jpg', '2019-06-15T09:07:54.000Z', '2019-08-15 22:12:53'),
(3, 1, 'QpvEWVVnICE', 'Super 30 | Official Trailer | Hrithik Roshan | Vikas Bahl | July 12', 'https://i.ytimg.com/vi/QpvEWVVnICE/default.jpg', '2019-06-04T07:56:58.000Z', '2019-08-15 22:13:11'),
(4, 1, 'iFoqGyWhMws', 'NCT 127 ??? 127 &#39;Highway to Heaven (English Ver.)&#39; MV', 'https://i.ytimg.com/vi/iFoqGyWhMws/default.jpg', '2019-07-22T15:00:06.000Z', '2019-08-15 22:13:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`app_id`);

--
-- Indexes for table `application_icons`
--
ALTER TABLE `application_icons`
  ADD PRIMARY KEY (`app_id`);

--
-- Indexes for table `application_parameters`
--
ALTER TABLE `application_parameters`
  ADD PRIMARY KEY (`app_id`);

--
-- Indexes for table `unknown_apps`
--
ALTER TABLE `unknown_apps`
  ADD PRIMARY KEY (`SrNo`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `weather_history`
--
ALTER TABLE `weather_history`
  ADD PRIMARY KEY (`srno`);

--
-- Indexes for table `weather_themes`
--
ALTER TABLE `weather_themes`
  ADD PRIMARY KEY (`srno`);

--
-- Indexes for table `youtube_history`
--
ALTER TABLE `youtube_history`
  ADD PRIMARY KEY (`srno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `app_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `application_icons`
--
ALTER TABLE `application_icons`
  MODIFY `app_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `application_parameters`
--
ALTER TABLE `application_parameters`
  MODIFY `app_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `unknown_apps`
--
ALTER TABLE `unknown_apps`
  MODIFY `SrNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `weather_history`
--
ALTER TABLE `weather_history`
  MODIFY `srno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `weather_themes`
--
ALTER TABLE `weather_themes`
  MODIFY `srno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `youtube_history`
--
ALTER TABLE `youtube_history`
  MODIFY `srno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `application_icons`
--
ALTER TABLE `application_icons`
  ADD CONSTRAINT `application_icons_ibfk_1` FOREIGN KEY (`app_id`) REFERENCES `applications` (`app_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `application_parameters`
--
ALTER TABLE `application_parameters`
  ADD CONSTRAINT `application_parameters_ibfk_1` FOREIGN KEY (`app_id`) REFERENCES `applications` (`app_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
