-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 27, 2016 at 06:32 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `wtfindin_arm`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendence`
--

CREATE TABLE IF NOT EXISTS `attendence` (
`attendenceId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `courseId` int(11) NOT NULL,
  `isAttended` enum('Y','N') NOT NULL DEFAULT 'N',
  `classDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE IF NOT EXISTS `class` (
`classId` int(11) NOT NULL,
  `className` varchar(3000) NOT NULL,
  `subjectId` int(11) NOT NULL,
  `teacherName` varchar(1000) NOT NULL,
  `classTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `classDays` varchar(1000) NOT NULL,
  `classDesc` varchar(30000) NOT NULL,
  `classWeeklyDays` varchar(1000) NOT NULL,
  `classType` enum('alternate','regular') NOT NULL DEFAULT 'alternate'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE IF NOT EXISTS `course` (
`courseId` int(11) NOT NULL,
  `courseName` varchar(300) NOT NULL,
  `courseCategory` enum('t','c') NOT NULL,
  `fees` varchar(100) NOT NULL,
  `courseDuration` varchar(300) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`courseId`, `courseName`, `courseCategory`, `fees`, `courseDuration`) VALUES
(1, 'Banking', 'c', '6000', '3'),
(2, 'UPSC', 'c', '12000', '6'),
(3, 'Tuition', 't', '500', '1'),
(4, 'ssc', 'c', '6000', '3'),
(5, 'tuition class x', 't', '$$$', '1'),
(6, 'tuition class xi', 't', '$$$', '1'),
(7, 'tuition class xii', 't', '$$$', '1'),
(8, 'tuition class vi', 't', '$$$', '1'),
(9, 'tuition class vii', 't', '$$$', '1'),
(10, 'tuition class viii', 't', '$$$', '1'),
(11, 'tuition class v', 't', '$$$', '1'),
(12, 'Engineering', 'c', '10000', '12'),
(13, 'Medical', 'c', '10000', '12'),
(14, 'tuition class III', 't', '-', '1'),
(15, 'tuition class II', 't', '-', '1'),
(16, 'tuition class 2', 't', '-', '1'),
(17, 'tuition class 3', 't', '-', '1'),
(18, 'zxc', 't', '-', '1'),
(19, 'nmjk', 't', '-', '1'),
(20, 'uiop', 't', '-', '1'),
(21, 'qwerr', 't', '-', '1'),
(22, 'zxcvb', 't', '-', '1'),
(23, 'df', 't', '-', '1'),
(24, 'qwe', 't', '-', '1'),
(25, 'a', 't', '-', '1'),
(26, 'jsx', 't', '-', '1'),
(27, 'vb', 't', '-', '1'),
(28, 'bnm', 't', '-', '1'),
(29, 'erty', 't', '-', '1'),
(30, 'ffss', 't', '-', '1'),
(31, 'ertyuui', 't', '-', '1'),
(32, 'qwererr', 't', '-', '1'),
(33, 'klop', 't', '-', '1'),
(34, 'q', 't', '-', '1'),
(35, 'w', 't', '-', '1'),
(36, 'f', 't', '-', '1'),
(37, 'b', 't', '-', '1'),
(38, 'yu', 't', '-', '1'),
(39, 'm', 't', '-', '1'),
(40, 'qwerty', 't', '-', '1'),
(41, 'ddddddd', 't', '-', '1'),
(42, 'mm', 't', '-', '1'),
(43, 'agl', 'c', '4000', '3'),
(44, 'dfdf', 't', '-', '1'),
(45, 'dfdfdsfdsfdsf', 't', '-', '1'),
(46, 'yyuuipp[p[', 't', '-', '1'),
(47, '121323434', 't', '-', '1'),
(48, 'dfsdfd', 't', '-', '1'),
(49, 'qwqewrerer', 't', '-', '1'),
(50, 'cfdsdfsdf', 'c', '123454', '12'),
(51, '232312312', 't', '-', '1'),
(52, 'dsfdfsfdsfdsffsdfsd', 'c', '123567', '12'),
(53, 'dfsdfdsfdsf', 't', '-', '1'),
(54, 'dsfdf', 't', '-', '1'),
(55, 'sdfdsfdsf', 't', '-', '1'),
(56, 'erwertetewrtert', 't', '-', '1'),
(57, 'sfsdfsf', 't', '-', '1'),
(58, 'aswqsazxzcdsedsdcxc', 't', '-', '1'),
(59, 'ertuiughjj', 't', '-', '1'),
(60, 'dsdsad', 't', '-', '1'),
(61, 'fdsfdf', 't', '-', '1'),
(62, 'dfsdf', 't', '-', '1'),
(63, 'sfdsfdfsdfdsfsd', 't', '-', '1'),
(64, 'gorusur', 'c', '1000', '12'),
(65, 'windings', 't', '-', '1'),
(66, 'ssce', 'c', '4500', '4');

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE IF NOT EXISTS `exam` (
`examId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `courseId` int(11) NOT NULL,
  `subjectId` int(11) NOT NULL,
  `marksObtain` decimal(11,0) NOT NULL,
  `marksTotal` decimal(11,0) NOT NULL,
  `examType` enum('daily','week','month') NOT NULL DEFAULT 'week',
  `examDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `examDay` varchar(100) NOT NULL,
  `isActive` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE IF NOT EXISTS `fees` (
`feeId` int(10) NOT NULL,
  `subjectId` int(10) NOT NULL,
  `fee` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
`menuid` bigint(20) unsigned NOT NULL,
  `menu_name` varchar(100) NOT NULL,
  `menu_icon` varchar(50) NOT NULL,
  `url` varchar(50) NOT NULL,
  `menu_div` varchar(30) NOT NULL,
  `display` enum('y','n') NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`menuid`, `menu_name`, `menu_icon`, `url`, `menu_div`, `display`) VALUES
(1, 'COURSE', 'fa-graduation-cap', 'course.php', 'menuCourse', 'y'),
(2, 'SUBJECT', 'fa-book', 'subject.php', 'menuSubject', 'y'),
(3, 'USER', 'fa-user', 'user.php', 'menuUser', 'y'),
(4, 'MESSAGE', 'fa-envelope', 'message.php', 'menuMessage', 'y'),
(5, 'COURSE ADD', 'fa-graduation-cap', 'course-add.php', 'menuCourseAdd', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `menurights`
--

CREATE TABLE IF NOT EXISTS `menurights` (
  `userid` int(11) NOT NULL,
  `menuid` int(11) NOT NULL,
  `madd` enum('1','0') NOT NULL DEFAULT '0',
  `medit` enum('1','0') NOT NULL DEFAULT '0',
  `mdelete` enum('1','0') NOT NULL DEFAULT '0',
  `view` enum('1','0') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menurights`
--

INSERT INTO `menurights` (`userid`, `menuid`, `madd`, `medit`, `mdelete`, `view`) VALUES
(1, 1, '1', '1', '1', '1'),
(1, 2, '0', '1', '0', '1'),
(1, 3, '0', '0', '0', '0'),
(1, 4, '0', '0', '0', '0'),
(1, 5, '1', '0', '0', '0'),
(2, 1, '0', '0', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE IF NOT EXISTS `module` (
  `modulegroupcode` varchar(25) NOT NULL,
  `modulegroupname` varchar(50) NOT NULL,
  `modulecode` varchar(25) NOT NULL,
  `modulename` varchar(50) NOT NULL,
  `modulegrouporder` int(3) NOT NULL,
  `moduleorder` int(3) NOT NULL,
  `modulepagename` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`modulegroupcode`, `modulegroupname`, `modulecode`, `modulename`, `modulegrouporder`, `moduleorder`, `modulepagename`) VALUES
('MASTER', 'Master', 'COURSE', 'Course', 2, 1, 'course.php'),
('MASTER', 'Master', 'SUBJECT', 'Subject', 2, 2, 'subject.php');

-- --------------------------------------------------------

--
-- Table structure for table `progress`
--

CREATE TABLE IF NOT EXISTS `progress` (
`progressId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `courseId` int(11) NOT NULL,
  `remark` varchar(30000) NOT NULL,
  `isReportSent` enum('Y','N') NOT NULL DEFAULT 'N',
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reminders`
--

CREATE TABLE IF NOT EXISTS `reminders` (
`reminderId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `courseId` int(11) NOT NULL,
  `remSubject` varchar(1000) NOT NULL,
  `remDesc` varchar(30000) NOT NULL,
  `remType` enum('fees','attendence','result') DEFAULT NULL,
  `remDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
`roleid` int(3) NOT NULL,
  `rolename` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`roleid`, `rolename`) VALUES
(1, 'Super Administrator'),
(2, 'Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `rolerights`
--

CREATE TABLE IF NOT EXISTS `rolerights` (
  `rr_roleid` int(3) NOT NULL,
  `rr_modulecode` varchar(50) NOT NULL,
  `rr_create` enum('yes','no') NOT NULL,
  `rr_edit` enum('yes','no') NOT NULL,
  `rr_delete` enum('yes','no') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rolerights`
--

INSERT INTO `rolerights` (`rr_roleid`, `rr_modulecode`, `rr_create`, `rr_edit`, `rr_delete`) VALUES
(1, 'COURSE', 'yes', 'yes', 'yes'),
(1, 'SUBJECT', 'yes', 'yes', 'yes'),
(2, 'COURSE', 'yes', 'no', 'no'),
(2, 'SUBJECT', 'no', 'yes', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE IF NOT EXISTS `subject` (
`subjectId` int(11) NOT NULL,
  `courseId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subjectmaster`
--

CREATE TABLE IF NOT EXISTS `subjectmaster` (
`subjectId` int(10) NOT NULL,
  `subjectName` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subjectmaster`
--

INSERT INTO `subjectmaster` (`subjectId`, `subjectName`) VALUES
(1, 'English'),
(2, 'Mathematics'),
(7, 'Biology'),
(8, 'Reasoaning');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`userId` int(11) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `phone` varchar(300) NOT NULL,
  `loginId` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `address` varchar(300) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `zip` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `isActive` enum('Y','N') NOT NULL DEFAULT 'Y',
  `issueDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `qualification` varchar(300) NOT NULL,
  `profession` varchar(300) NOT NULL,
  `pic` varchar(100) DEFAULT NULL,
  `roleid` int(3) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `firstName`, `lastName`, `email`, `phone`, `loginId`, `password`, `gender`, `address`, `city`, `state`, `zip`, `country`, `isActive`, `issueDate`, `qualification`, `profession`, `pic`, `roleid`) VALUES
(1, 'Rajiv', 'Saikia', 'rajivsaikia22@gmail.com', '9085632517', 'admin@admin.com', 'admin', 'male', 'Natun Nirmali Gaon, Jyoti Path', 'Dibrugarh', 'Assam', '786003', 'India', 'Y', '2016-11-22 06:26:27', 'MCA', 'Software Developer', 'rajiv.JPG', 1),
(2, 'Achinta', 'Bhattacharjee', 'achin@achin.com', '9999999999', 'achin@achin.com', 'achin', 'male', 'Biswanath Chariali', 'Biswanath Chariali', 'Assam', '7111111', 'India', 'Y', '2016-11-30 15:19:16', 'MCA', 'Teacher', 'achinta.jpg', 2);

-- --------------------------------------------------------

--
-- Table structure for table `usercourse`
--

CREATE TABLE IF NOT EXISTS `usercourse` (
`userCourseId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `courseId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userlogin`
--

CREATE TABLE IF NOT EXISTS `userlogin` (
`userLoginId` int(11) NOT NULL,
  `loginDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userId` int(11) NOT NULL,
  `remoteAddr` varchar(300) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=393 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlogin`
--

INSERT INTO `userlogin` (`userLoginId`, `loginDate`, `userId`, `remoteAddr`) VALUES
(1, '2016-11-22 07:19:13', 1, '127.0.0.1'),
(2, '2016-11-22 07:19:39', 1, '127.0.0.1'),
(3, '2016-11-22 07:19:50', 1, '127.0.0.1'),
(4, '2016-11-22 07:30:17', 1, '127.0.0.1'),
(5, '2016-11-22 13:26:18', 1, '127.0.0.1'),
(6, '2016-11-22 13:46:27', 1, '127.0.0.1'),
(7, '2016-11-22 13:48:48', 1, '127.0.0.1'),
(8, '2016-11-22 14:07:39', 1, '127.0.0.1'),
(9, '2016-11-22 14:14:40', 1, '127.0.0.1'),
(10, '2016-11-22 14:14:58', 1, '127.0.0.1'),
(11, '2016-11-22 14:47:45', 1, '127.0.0.1'),
(12, '2016-11-22 15:29:41', 1, '127.0.0.1'),
(13, '2016-11-23 07:14:17', 1, '127.0.0.1'),
(14, '2016-11-23 07:23:07', 1, '127.0.0.1'),
(15, '2016-11-23 16:19:43', 1, '127.0.0.1'),
(16, '2016-11-23 16:22:49', 1, '127.0.0.1'),
(17, '2016-11-23 16:30:26', 1, '127.0.0.1'),
(18, '2016-11-23 16:33:51', 1, '127.0.0.1'),
(19, '2016-11-23 16:51:25', 1, '127.0.0.1'),
(20, '2016-11-23 16:51:32', 1, '127.0.0.1'),
(21, '2016-11-23 17:05:41', 1, '127.0.0.1'),
(22, '2016-11-23 17:15:17', 1, '127.0.0.1'),
(23, '2016-11-23 17:18:10', 1, '127.0.0.1'),
(24, '2016-11-23 17:22:05', 1, '127.0.0.1'),
(25, '2016-11-23 17:25:13', 1, '127.0.0.1'),
(26, '2016-11-23 17:45:07', 1, '127.0.0.1'),
(27, '2016-11-23 17:59:08', 1, '127.0.0.1'),
(28, '2016-11-23 18:00:00', 1, '127.0.0.1'),
(29, '2016-11-23 18:14:41', 1, '127.0.0.1'),
(30, '2016-11-23 18:20:47', 1, '127.0.0.1'),
(31, '2016-11-23 18:28:46', 1, '127.0.0.1'),
(32, '2016-11-23 18:44:17', 1, '127.0.0.1'),
(33, '2016-11-23 18:52:01', 1, '127.0.0.1'),
(34, '2016-11-23 19:03:09', 1, '127.0.0.1'),
(35, '2016-11-23 19:18:38', 1, '127.0.0.1'),
(36, '2016-11-23 19:30:12', 1, '127.0.0.1'),
(37, '2016-11-23 19:49:07', 1, '127.0.0.1'),
(38, '2016-11-23 20:20:18', 1, '127.0.0.1'),
(39, '2016-11-24 03:25:06', 1, '127.0.0.1'),
(40, '2016-11-29 03:18:48', 1, '127.0.0.1'),
(41, '2016-11-29 04:25:58', 1, '127.0.0.1'),
(42, '2016-11-29 13:54:46', 1, '127.0.0.1'),
(43, '2016-11-29 14:29:11', 1, '127.0.0.1'),
(44, '2016-11-29 14:35:49', 1, '127.0.0.1'),
(45, '2016-11-29 14:37:28', 1, '127.0.0.1'),
(46, '2016-11-29 14:38:39', 1, '127.0.0.1'),
(47, '2016-11-29 14:40:29', 1, '127.0.0.1'),
(48, '2016-11-29 14:41:51', 1, '127.0.0.1'),
(49, '2016-11-29 14:42:59', 1, '127.0.0.1'),
(50, '2016-11-29 14:44:41', 1, '127.0.0.1'),
(51, '2016-11-29 14:44:52', 1, '127.0.0.1'),
(52, '2016-11-29 15:12:24', 1, '127.0.0.1'),
(53, '2016-11-29 15:31:46', 1, '127.0.0.1'),
(54, '2016-11-29 15:53:12', 1, '127.0.0.1'),
(55, '2016-11-29 16:24:46', 1, '127.0.0.1'),
(56, '2016-11-29 17:16:35', 1, '127.0.0.1'),
(57, '2016-11-29 17:47:45', 1, '127.0.0.1'),
(58, '2016-11-29 17:59:48', 1, '127.0.0.1'),
(59, '2016-11-29 18:07:59', 1, '127.0.0.1'),
(60, '2016-11-30 15:11:18', 1, '127.0.0.1'),
(61, '2016-11-30 15:11:18', 1, '127.0.0.1'),
(62, '2016-11-30 15:21:13', 2, '127.0.0.1'),
(63, '2016-11-30 15:37:31', 1, '127.0.0.1'),
(64, '2016-11-30 15:52:09', 2, '127.0.0.1'),
(65, '2016-11-30 16:16:27', 1, '127.0.0.1'),
(66, '2016-11-30 17:18:10', 1, '127.0.0.1'),
(67, '2016-11-30 17:24:45', 1, '127.0.0.1'),
(68, '2016-12-01 13:48:33', 1, '127.0.0.1'),
(69, '2016-12-01 14:15:09', 1, '127.0.0.1'),
(70, '2016-12-01 14:27:30', 1, '127.0.0.1'),
(71, '2016-12-01 14:32:58', 1, '127.0.0.1'),
(72, '2016-12-01 14:57:48', 1, '127.0.0.1'),
(73, '2016-12-01 15:03:50', 1, '127.0.0.1'),
(74, '2016-12-01 15:50:11', 1, '127.0.0.1'),
(75, '2016-12-01 16:47:01', 1, '127.0.0.1'),
(76, '2016-12-01 17:18:44', 1, '127.0.0.1'),
(77, '2016-12-01 17:28:34', 1, '127.0.0.1'),
(78, '2016-12-01 17:35:22', 2, '127.0.0.1'),
(79, '2016-12-01 17:35:47', 1, '127.0.0.1'),
(80, '2016-12-01 17:36:38', 1, '127.0.0.1'),
(81, '2016-12-01 17:36:52', 2, '127.0.0.1'),
(82, '2016-12-01 17:41:50', 1, '127.0.0.1'),
(83, '2016-12-01 17:42:35', 2, '127.0.0.1'),
(84, '2016-12-01 17:44:37', 1, '127.0.0.1'),
(85, '2016-12-01 17:46:09', 2, '127.0.0.1'),
(86, '2016-12-01 17:48:26', 1, '127.0.0.1'),
(87, '2016-12-01 17:54:31', 1, '127.0.0.1'),
(88, '2016-12-01 18:01:46', 1, '127.0.0.1'),
(89, '2016-12-01 18:47:57', 1, '127.0.0.1'),
(90, '2016-12-01 18:48:16', 2, '127.0.0.1'),
(91, '2016-12-01 18:52:03', 1, '127.0.0.1'),
(92, '2016-12-01 19:09:50', 1, '127.0.0.1'),
(93, '2016-12-01 19:10:16', 2, '127.0.0.1'),
(94, '2016-12-01 19:11:47', 1, '127.0.0.1'),
(95, '2016-12-01 19:28:44', 2, '127.0.0.1'),
(96, '2016-12-02 06:14:07', 1, '127.0.0.1'),
(97, '2016-12-02 06:28:13', 1, '127.0.0.1'),
(98, '2016-12-02 06:29:18', 2, '127.0.0.1'),
(99, '2016-12-02 14:19:24', 1, '127.0.0.1'),
(100, '2016-12-02 14:44:01', 1, '127.0.0.1'),
(101, '2016-12-02 15:09:08', 1, '127.0.0.1'),
(102, '2016-12-02 16:50:37', 1, '127.0.0.1'),
(103, '2016-12-02 17:05:46', 1, '127.0.0.1'),
(104, '2016-12-02 18:07:02', 1, '127.0.0.1'),
(105, '2016-12-02 18:15:41', 1, '127.0.0.1'),
(106, '2016-12-02 18:21:30', 1, '127.0.0.1'),
(107, '2016-12-02 18:27:29', 1, '127.0.0.1'),
(108, '2016-12-02 18:28:38', 1, '127.0.0.1'),
(109, '2016-12-02 18:30:57', 1, '127.0.0.1'),
(110, '2016-12-02 18:37:33', 1, '127.0.0.1'),
(111, '2016-12-02 18:41:47', 1, '127.0.0.1'),
(112, '2016-12-03 06:09:22', 1, '127.0.0.1'),
(113, '2016-12-03 06:15:38', 1, '127.0.0.1'),
(114, '2016-12-03 06:25:13', 1, '127.0.0.1'),
(115, '2016-12-03 06:30:18', 1, '127.0.0.1'),
(116, '2016-12-03 06:30:48', 1, '127.0.0.1'),
(117, '2016-12-03 06:44:52', 1, '127.0.0.1'),
(118, '2016-12-03 14:14:43', 1, '127.0.0.1'),
(119, '2016-12-03 16:21:13', 1, '127.0.0.1'),
(120, '2016-12-03 16:33:46', 1, '127.0.0.1'),
(121, '2016-12-03 16:34:04', 2, '127.0.0.1'),
(122, '2016-12-03 16:44:43', 1, '127.0.0.1'),
(123, '2016-12-03 16:48:54', 1, '127.0.0.1'),
(124, '2016-12-03 16:49:27', 1, '127.0.0.1'),
(125, '2016-12-03 17:20:05', 1, '127.0.0.1'),
(126, '2016-12-03 17:22:31', 1, '127.0.0.1'),
(127, '2016-12-03 17:31:58', 1, '127.0.0.1'),
(128, '2016-12-03 17:50:47', 1, '127.0.0.1'),
(129, '2016-12-03 18:18:31', 1, '127.0.0.1'),
(130, '2016-12-03 18:19:13', 1, '127.0.0.1'),
(131, '2016-12-08 15:16:32', 1, '127.0.0.1'),
(132, '2016-12-08 16:35:17', 1, '127.0.0.1'),
(133, '2016-12-13 15:46:08', 1, '127.0.0.1'),
(134, '2016-12-13 15:50:21', 1, '127.0.0.1'),
(135, '2016-12-13 15:50:25', 1, '127.0.0.1'),
(136, '2016-12-13 15:54:11', 1, '127.0.0.1'),
(137, '2016-12-13 15:54:31', 1, '127.0.0.1'),
(138, '2016-12-13 15:55:07', 2, '127.0.0.1'),
(139, '2016-12-13 15:55:48', 1, '127.0.0.1'),
(140, '2016-12-13 15:55:51', 1, '127.0.0.1'),
(141, '2016-12-13 15:58:03', 1, '127.0.0.1'),
(142, '2016-12-13 15:59:33', 1, '127.0.0.1'),
(143, '2016-12-13 15:59:49', 1, '127.0.0.1'),
(144, '2016-12-13 16:02:28', 1, '127.0.0.1'),
(145, '2016-12-13 16:02:30', 1, '127.0.0.1'),
(146, '2016-12-13 16:02:59', 1, '127.0.0.1'),
(147, '2016-12-13 16:03:25', 1, '127.0.0.1'),
(148, '2016-12-13 16:03:44', 1, '127.0.0.1'),
(149, '2016-12-13 16:06:24', 1, '127.0.0.1'),
(150, '2016-12-13 16:06:29', 1, '127.0.0.1'),
(151, '2016-12-13 16:06:48', 1, '127.0.0.1'),
(152, '2016-12-13 16:09:30', 1, '127.0.0.1'),
(153, '2016-12-13 16:17:14', 1, '127.0.0.1'),
(154, '2016-12-13 16:29:39', 1, '127.0.0.1'),
(155, '2016-12-13 16:35:44', 1, '127.0.0.1'),
(156, '2016-12-13 16:37:58', 2, '127.0.0.1'),
(157, '2016-12-13 16:39:04', 1, '127.0.0.1'),
(158, '2016-12-13 16:39:22', 2, '127.0.0.1'),
(159, '2016-12-13 16:51:22', 1, '127.0.0.1'),
(160, '2016-12-13 17:06:22', 1, '127.0.0.1'),
(161, '2016-12-13 17:45:33', 1, '127.0.0.1'),
(162, '2016-12-13 18:36:46', 1, '127.0.0.1'),
(163, '2016-12-14 03:57:58', 1, '127.0.0.1'),
(164, '2016-12-14 04:23:00', 1, '127.0.0.1'),
(165, '2016-12-14 05:49:53', 1, '127.0.0.1'),
(166, '2016-12-14 05:56:25', 1, '127.0.0.1'),
(167, '2016-12-14 06:08:59', 1, '127.0.0.1'),
(168, '2016-12-14 06:10:12', 1, '127.0.0.1'),
(169, '2016-12-14 06:28:40', 1, '127.0.0.1'),
(170, '2016-12-14 06:51:10', 1, '127.0.0.1'),
(171, '2016-12-14 06:58:32', 1, '127.0.0.1'),
(172, '2016-12-14 07:18:13', 1, '127.0.0.1'),
(173, '2016-12-14 07:45:20', 1, '127.0.0.1'),
(174, '2016-12-14 07:50:35', 1, '127.0.0.1'),
(175, '2016-12-14 08:03:55', 1, '127.0.0.1'),
(176, '2016-12-14 08:10:27', 1, '127.0.0.1'),
(177, '2016-12-14 08:44:25', 1, '127.0.0.1'),
(178, '2016-12-14 09:02:47', 1, '127.0.0.1'),
(179, '2016-12-14 09:19:16', 1, '127.0.0.1'),
(180, '2016-12-14 09:36:22', 1, '127.0.0.1'),
(181, '2016-12-14 10:10:16', 1, '127.0.0.1'),
(182, '2016-12-14 10:17:29', 1, '127.0.0.1'),
(183, '2016-12-14 10:40:42', 1, '127.0.0.1'),
(184, '2016-12-14 14:46:08', 1, '127.0.0.1'),
(185, '2016-12-14 15:08:51', 1, '127.0.0.1'),
(186, '2016-12-14 15:17:26', 1, '127.0.0.1'),
(187, '2016-12-14 15:17:44', 2, '127.0.0.1'),
(188, '2016-12-14 15:40:52', 1, '127.0.0.1'),
(189, '2016-12-14 15:49:19', 1, '127.0.0.1'),
(190, '2016-12-14 16:27:44', 1, '127.0.0.1'),
(191, '2016-12-14 17:02:02', 1, '127.0.0.1'),
(192, '2016-12-14 17:02:29', 1, '127.0.0.1'),
(193, '2016-12-14 17:03:26', 1, '127.0.0.1'),
(194, '2016-12-14 17:04:06', 1, '127.0.0.1'),
(195, '2016-12-14 17:05:48', 1, '127.0.0.1'),
(196, '2016-12-14 17:09:35', 1, '127.0.0.1'),
(197, '2016-12-14 17:16:03', 1, '127.0.0.1'),
(198, '2016-12-14 17:18:55', 1, '127.0.0.1'),
(199, '2016-12-14 17:21:03', 1, '127.0.0.1'),
(200, '2016-12-14 18:30:47', 1, '127.0.0.1'),
(201, '2016-12-15 05:40:53', 1, '127.0.0.1'),
(202, '2016-12-15 07:29:51', 1, '127.0.0.1'),
(203, '2016-12-15 07:40:45', 1, '127.0.0.1'),
(204, '2016-12-15 08:29:14', 1, '127.0.0.1'),
(205, '2016-12-15 09:01:03', 1, '127.0.0.1'),
(206, '2016-12-15 09:22:43', 1, '127.0.0.1'),
(207, '2016-12-15 09:33:49', 1, '127.0.0.1'),
(208, '2016-12-16 17:18:38', 1, '127.0.0.1'),
(209, '2016-12-16 17:19:12', 1, '127.0.0.1'),
(210, '2016-12-16 17:41:46', 1, '127.0.0.1'),
(211, '2016-12-16 17:50:54', 1, '127.0.0.1'),
(212, '2016-12-16 18:01:48', 1, '127.0.0.1'),
(213, '2016-12-16 18:03:38', 1, '127.0.0.1'),
(214, '2016-12-16 18:07:57', 1, '127.0.0.1'),
(215, '2016-12-16 18:10:44', 1, '127.0.0.1'),
(216, '2016-12-16 18:10:45', 1, '127.0.0.1'),
(217, '2016-12-16 18:10:46', 1, '127.0.0.1'),
(218, '2016-12-16 18:18:33', 1, '127.0.0.1'),
(219, '2016-12-16 18:18:36', 1, '127.0.0.1'),
(220, '2016-12-17 08:54:42', 1, '127.0.0.1'),
(221, '2016-12-17 09:03:56', 1, '127.0.0.1'),
(222, '2016-12-17 09:11:35', 1, '127.0.0.1'),
(223, '2016-12-17 09:15:03', 1, '127.0.0.1'),
(224, '2016-12-17 09:20:33', 1, '127.0.0.1'),
(225, '2016-12-17 09:23:33', 1, '127.0.0.1'),
(226, '2016-12-17 09:53:02', 1, '127.0.0.1'),
(227, '2016-12-17 10:44:49', 1, '127.0.0.1'),
(228, '2016-12-17 10:53:30', 1, '127.0.0.1'),
(229, '2016-12-19 05:25:52', 1, '127.0.0.1'),
(230, '2016-12-19 05:50:41', 1, '127.0.0.1'),
(231, '2016-12-19 06:12:02', 1, '127.0.0.1'),
(232, '2016-12-19 06:14:19', 1, '127.0.0.1'),
(233, '2016-12-19 06:17:07', 1, '127.0.0.1'),
(234, '2016-12-19 06:23:30', 1, '127.0.0.1'),
(235, '2016-12-19 06:45:07', 1, '127.0.0.1'),
(236, '2016-12-19 07:07:17', 1, '127.0.0.1'),
(237, '2016-12-19 13:39:05', 1, '127.0.0.1'),
(238, '2016-12-19 14:15:46', 1, '127.0.0.1'),
(239, '2016-12-19 14:29:23', 1, '127.0.0.1'),
(240, '2016-12-19 14:51:59', 1, '127.0.0.1'),
(241, '2016-12-19 14:59:25', 1, '127.0.0.1'),
(242, '2016-12-19 15:13:59', 1, '127.0.0.1'),
(243, '2016-12-19 15:21:07', 1, '127.0.0.1'),
(244, '2016-12-19 15:34:50', 1, '127.0.0.1'),
(245, '2016-12-19 15:53:23', 1, '127.0.0.1'),
(246, '2016-12-19 15:59:42', 1, '127.0.0.1'),
(247, '2016-12-19 16:12:47', 1, '127.0.0.1'),
(248, '2016-12-19 16:32:12', 1, '127.0.0.1'),
(249, '2016-12-19 16:37:53', 1, '127.0.0.1'),
(250, '2016-12-19 17:07:29', 1, '127.0.0.1'),
(251, '2016-12-19 17:33:53', 1, '127.0.0.1'),
(252, '2016-12-19 17:52:25', 1, '127.0.0.1'),
(253, '2016-12-19 18:29:05', 1, '127.0.0.1'),
(254, '2016-12-19 18:31:53', 1, '127.0.0.1'),
(255, '2016-12-20 06:06:18', 1, '127.0.0.1'),
(256, '2016-12-20 11:40:44', 1, '127.0.0.1'),
(257, '2016-12-20 11:49:15', 1, '127.0.0.1'),
(258, '2016-12-20 12:12:27', 1, '127.0.0.1'),
(259, '2016-12-20 12:25:47', 1, '127.0.0.1'),
(260, '2016-12-20 12:54:14', 1, '127.0.0.1'),
(261, '2016-12-20 13:03:08', 1, '127.0.0.1'),
(262, '2016-12-20 13:24:28', 1, '127.0.0.1'),
(263, '2016-12-20 13:39:00', 1, '127.0.0.1'),
(264, '2016-12-20 14:20:00', 1, '127.0.0.1'),
(265, '2016-12-20 14:42:04', 1, '127.0.0.1'),
(266, '2016-12-20 14:52:00', 1, '127.0.0.1'),
(267, '2016-12-20 15:16:18', 1, '127.0.0.1'),
(268, '2016-12-20 15:16:18', 1, '127.0.0.1'),
(269, '2016-12-20 15:16:21', 1, '127.0.0.1'),
(270, '2016-12-20 15:25:12', 1, '127.0.0.1'),
(271, '2016-12-20 15:53:13', 1, '127.0.0.1'),
(272, '2016-12-23 14:15:48', 1, '127.0.0.1'),
(273, '2016-12-23 14:16:29', 2, '127.0.0.1'),
(274, '2016-12-25 15:07:35', 1, '127.0.0.1'),
(275, '2016-12-25 15:19:22', 1, '127.0.0.1'),
(276, '2016-12-25 17:22:08', 1, '127.0.0.1'),
(277, '2016-12-25 18:18:07', 1, '127.0.0.1'),
(278, '2016-12-25 18:18:10', 1, '127.0.0.1'),
(279, '2016-12-26 04:49:34', 1, '127.0.0.1'),
(280, '2016-12-26 06:27:39', 1, '127.0.0.1'),
(281, '2016-12-26 06:27:44', 1, '127.0.0.1'),
(282, '2016-12-26 06:53:02', 1, '127.0.0.1'),
(283, '2016-12-26 07:06:00', 1, '127.0.0.1'),
(284, '2016-12-26 07:06:20', 2, '127.0.0.1'),
(285, '2016-12-26 07:06:45', 1, '127.0.0.1'),
(286, '2016-12-26 07:14:07', 1, '127.0.0.1'),
(287, '2016-12-26 07:14:37', 2, '127.0.0.1'),
(288, '2016-12-26 07:26:28', 1, '127.0.0.1'),
(289, '2016-12-26 07:26:49', 2, '127.0.0.1'),
(290, '2016-12-26 07:29:48', 1, '127.0.0.1'),
(291, '2016-12-26 07:38:59', 1, '127.0.0.1'),
(292, '2016-12-26 07:51:36', 2, '127.0.0.1'),
(293, '2016-12-26 11:18:01', 1, '127.0.0.1'),
(294, '2016-12-26 11:18:27', 2, '127.0.0.1'),
(295, '2016-12-26 11:23:59', 2, '127.0.0.1'),
(296, '2016-12-26 12:49:57', 1, '127.0.0.1'),
(297, '2016-12-26 12:50:18', 2, '127.0.0.1'),
(298, '2016-12-26 12:50:40', 1, '127.0.0.1'),
(299, '2016-12-26 13:03:30', 1, '127.0.0.1'),
(300, '2016-12-26 13:04:01', 2, '127.0.0.1'),
(301, '2016-12-26 13:06:31', 1, '127.0.0.1'),
(302, '2016-12-26 13:06:54', 2, '127.0.0.1'),
(303, '2016-12-26 13:13:57', 2, '127.0.0.1'),
(304, '2016-12-26 13:17:36', 1, '127.0.0.1'),
(305, '2016-12-26 13:26:20', 1, '127.0.0.1'),
(306, '2016-12-26 13:26:37', 2, '127.0.0.1'),
(307, '2016-12-26 13:30:30', 1, '127.0.0.1'),
(308, '2016-12-26 13:32:43', 1, '127.0.0.1'),
(309, '2016-12-26 13:43:24', 1, '127.0.0.1'),
(310, '2016-12-26 13:59:53', 1, '127.0.0.1'),
(311, '2016-12-26 14:18:58', 1, '127.0.0.1'),
(312, '2016-12-26 14:28:28', 1, '127.0.0.1'),
(313, '2016-12-26 14:32:25', 2, '127.0.0.1'),
(314, '2016-12-26 14:35:57', 1, '127.0.0.1'),
(315, '2016-12-26 14:36:04', 1, '127.0.0.1'),
(316, '2016-12-26 14:37:14', 1, '127.0.0.1'),
(317, '2016-12-26 14:37:32', 2, '127.0.0.1'),
(318, '2016-12-26 14:59:33', 1, '127.0.0.1'),
(319, '2016-12-26 15:03:55', 1, '127.0.0.1'),
(320, '2016-12-26 15:06:14', 2, '127.0.0.1'),
(321, '2016-12-26 15:07:59', 1, '127.0.0.1'),
(322, '2016-12-26 15:08:05', 1, '127.0.0.1'),
(323, '2016-12-26 15:08:45', 1, '127.0.0.1'),
(324, '2016-12-26 15:08:49', 1, '127.0.0.1'),
(325, '2016-12-26 15:09:31', 2, '127.0.0.1'),
(326, '2016-12-26 15:10:05', 1, '127.0.0.1'),
(327, '2016-12-26 15:10:17', 1, '127.0.0.1'),
(328, '2016-12-26 15:11:40', 1, '127.0.0.1'),
(329, '2016-12-26 15:11:46', 1, '127.0.0.1'),
(330, '2016-12-26 15:12:48', 1, '127.0.0.1'),
(331, '2016-12-26 15:13:24', 1, '127.0.0.1'),
(332, '2016-12-26 15:13:29', 1, '127.0.0.1'),
(333, '2016-12-26 15:21:59', 1, '127.0.0.1'),
(334, '2016-12-26 15:22:04', 1, '127.0.0.1'),
(335, '2016-12-26 15:25:51', 1, '127.0.0.1'),
(336, '2016-12-26 15:26:13', 2, '127.0.0.1'),
(337, '2016-12-26 15:42:44', 1, '127.0.0.1'),
(338, '2016-12-26 15:56:51', 1, '127.0.0.1'),
(339, '2016-12-26 16:43:15', 1, '127.0.0.1'),
(340, '2016-12-26 17:43:53', 1, '127.0.0.1'),
(341, '2016-12-26 18:03:48', 1, '127.0.0.1'),
(342, '2016-12-26 18:09:17', 1, '127.0.0.1'),
(343, '2016-12-26 18:22:47', 2, '127.0.0.1'),
(344, '2016-12-26 18:26:21', 1, '127.0.0.1'),
(345, '2016-12-26 18:27:30', 2, '127.0.0.1'),
(346, '2016-12-26 18:27:45', 2, '127.0.0.1'),
(347, '2016-12-26 18:28:06', 1, '127.0.0.1'),
(348, '2016-12-26 18:28:22', 2, '127.0.0.1'),
(349, '2016-12-26 18:28:31', 1, '127.0.0.1'),
(350, '2016-12-26 18:29:40', 1, '127.0.0.1'),
(351, '2016-12-26 18:29:53', 2, '127.0.0.1'),
(352, '2016-12-26 18:31:29', 1, '127.0.0.1'),
(353, '2016-12-26 18:31:35', 1, '127.0.0.1'),
(354, '2016-12-26 18:32:35', 1, '127.0.0.1'),
(355, '2016-12-26 18:32:40', 1, '127.0.0.1'),
(356, '2016-12-26 18:33:52', 1, '127.0.0.1'),
(357, '2016-12-26 18:34:52', 1, '127.0.0.1'),
(358, '2016-12-26 18:35:04', 1, '127.0.0.1'),
(359, '2016-12-26 18:35:22', 2, '127.0.0.1'),
(360, '2016-12-26 18:36:41', 2, '127.0.0.1'),
(361, '2016-12-26 18:37:12', 2, '127.0.0.1'),
(362, '2016-12-26 18:37:25', 2, '127.0.0.1'),
(363, '2016-12-26 18:37:45', 2, '127.0.0.1'),
(364, '2016-12-26 18:39:52', 1, '127.0.0.1'),
(365, '2016-12-26 18:40:05', 2, '127.0.0.1'),
(366, '2016-12-26 18:41:50', 2, '127.0.0.1'),
(367, '2016-12-26 18:42:08', 1, '127.0.0.1'),
(368, '2016-12-26 18:42:56', 2, '127.0.0.1'),
(369, '2016-12-26 18:43:45', 2, '127.0.0.1'),
(370, '2016-12-26 18:49:53', 1, '127.0.0.1'),
(371, '2016-12-26 18:58:37', 2, '127.0.0.1'),
(372, '2016-12-26 18:59:52', 1, '127.0.0.1'),
(373, '2016-12-26 19:00:27', 2, '127.0.0.1'),
(374, '2016-12-26 19:01:45', 2, '127.0.0.1'),
(375, '2016-12-26 19:03:15', 2, '127.0.0.1'),
(376, '2016-12-26 19:03:42', 2, '127.0.0.1'),
(377, '2016-12-26 19:04:07', 2, '127.0.0.1'),
(378, '2016-12-26 19:04:19', 1, '127.0.0.1'),
(379, '2016-12-26 19:04:25', 1, '127.0.0.1'),
(380, '2016-12-26 19:05:30', 1, '127.0.0.1'),
(381, '2016-12-26 19:05:37', 1, '127.0.0.1'),
(382, '2016-12-26 19:09:06', 1, '127.0.0.1'),
(383, '2016-12-27 04:58:25', 1, '127.0.0.1'),
(384, '2016-12-27 04:58:34', 1, '127.0.0.1'),
(385, '2016-12-27 04:58:54', 2, '127.0.0.1'),
(386, '2016-12-27 05:12:50', 1, '127.0.0.1'),
(387, '2016-12-27 05:13:45', 1, '127.0.0.1'),
(388, '2016-12-27 05:18:52', 2, '127.0.0.1'),
(389, '2016-12-27 05:19:19', 2, '127.0.0.1'),
(390, '2016-12-27 05:21:13', 2, '127.0.0.1'),
(391, '2016-12-27 05:27:31', 2, '127.0.0.1'),
(392, '2016-12-27 05:28:58', 1, '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `usermembership`
--

CREATE TABLE IF NOT EXISTS `usermembership` (
`userMemId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `memType` enum('admin','clerk','student') NOT NULL DEFAULT 'student',
  `accessLevel` int(11) NOT NULL,
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usermembership`
--

INSERT INTO `usermembership` (`userMemId`, `userId`, `memType`, `accessLevel`, `createDate`) VALUES
(1, 1, 'admin', 1, '2016-11-23 18:11:07'),
(2, 2, 'clerk', 2, '2016-11-30 15:20:22');

-- --------------------------------------------------------

--
-- Table structure for table `usersuggestion`
--

CREATE TABLE IF NOT EXISTS `usersuggestion` (
`sugId` int(11) NOT NULL,
  `msgType` enum('contactUs','landing') NOT NULL DEFAULT 'contactUs',
  `userId` int(11) NOT NULL,
  `suggestion` varchar(30000) NOT NULL,
  `ourResponse` varchar(30000) NOT NULL,
  `isResponded` enum('Y','N') NOT NULL DEFAULT 'N',
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usertemplate`
--

CREATE TABLE IF NOT EXISTS `usertemplate` (
`templId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `templName` varchar(300) NOT NULL,
  `templDesc` varchar(30000) NOT NULL,
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendence`
--
ALTER TABLE `attendence`
 ADD PRIMARY KEY (`attendenceId`), ADD KEY `userId` (`userId`), ADD KEY `courseId` (`courseId`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
 ADD PRIMARY KEY (`classId`), ADD KEY `subjectId` (`subjectId`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
 ADD PRIMARY KEY (`courseId`);

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
 ADD PRIMARY KEY (`examId`), ADD KEY `userId` (`userId`), ADD KEY `courseId` (`courseId`), ADD KEY `subjectId` (`subjectId`);

--
-- Indexes for table `fees`
--
ALTER TABLE `fees`
 ADD PRIMARY KEY (`feeId`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
 ADD PRIMARY KEY (`menuid`), ADD UNIQUE KEY `menuid` (`menuid`);

--
-- Indexes for table `menurights`
--
ALTER TABLE `menurights`
 ADD PRIMARY KEY (`userid`,`menuid`);

--
-- Indexes for table `progress`
--
ALTER TABLE `progress`
 ADD PRIMARY KEY (`progressId`), ADD KEY `userId` (`userId`), ADD KEY `courseId` (`courseId`);

--
-- Indexes for table `reminders`
--
ALTER TABLE `reminders`
 ADD PRIMARY KEY (`reminderId`), ADD KEY `userId` (`userId`), ADD KEY `courseId` (`courseId`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
 ADD PRIMARY KEY (`roleid`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
 ADD PRIMARY KEY (`subjectId`), ADD KEY `courseId` (`courseId`);

--
-- Indexes for table `subjectmaster`
--
ALTER TABLE `subjectmaster`
 ADD PRIMARY KEY (`subjectId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `usercourse`
--
ALTER TABLE `usercourse`
 ADD PRIMARY KEY (`userCourseId`), ADD KEY `userId` (`userId`), ADD KEY `courseId` (`courseId`);

--
-- Indexes for table `userlogin`
--
ALTER TABLE `userlogin`
 ADD PRIMARY KEY (`userLoginId`), ADD KEY `userId` (`userId`);

--
-- Indexes for table `usermembership`
--
ALTER TABLE `usermembership`
 ADD PRIMARY KEY (`userMemId`), ADD KEY `userId` (`userId`);

--
-- Indexes for table `usersuggestion`
--
ALTER TABLE `usersuggestion`
 ADD PRIMARY KEY (`sugId`), ADD KEY `userId` (`userId`);

--
-- Indexes for table `usertemplate`
--
ALTER TABLE `usertemplate`
 ADD PRIMARY KEY (`templId`), ADD KEY `userId` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendence`
--
ALTER TABLE `attendence`
MODIFY `attendenceId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
MODIFY `classId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
MODIFY `courseId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=67;
--
-- AUTO_INCREMENT for table `exam`
--
ALTER TABLE `exam`
MODIFY `examId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fees`
--
ALTER TABLE `fees`
MODIFY `feeId` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
MODIFY `menuid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `progress`
--
ALTER TABLE `progress`
MODIFY `progressId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `reminders`
--
ALTER TABLE `reminders`
MODIFY `reminderId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
MODIFY `roleid` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
MODIFY `subjectId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `subjectmaster`
--
ALTER TABLE `subjectmaster`
MODIFY `subjectId` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `usercourse`
--
ALTER TABLE `usercourse`
MODIFY `userCourseId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `userlogin`
--
ALTER TABLE `userlogin`
MODIFY `userLoginId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=393;
--
-- AUTO_INCREMENT for table `usermembership`
--
ALTER TABLE `usermembership`
MODIFY `userMemId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `usersuggestion`
--
ALTER TABLE `usersuggestion`
MODIFY `sugId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `usertemplate`
--
ALTER TABLE `usertemplate`
MODIFY `templId` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendence`
--
ALTER TABLE `attendence`
ADD CONSTRAINT `attendence_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `idx_courseId` FOREIGN KEY (`courseId`) REFERENCES `course` (`courseId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `class`
--
ALTER TABLE `class`
ADD CONSTRAINT `idx_subId` FOREIGN KEY (`subjectId`) REFERENCES `subject` (`subjectId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `exam`
--
ALTER TABLE `exam`
ADD CONSTRAINT `exam_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `exam_ibfk_2` FOREIGN KEY (`courseId`) REFERENCES `course` (`courseId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `exam_ibfk_3` FOREIGN KEY (`subjectId`) REFERENCES `subject` (`subjectId`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `progress`
--
ALTER TABLE `progress`
ADD CONSTRAINT `progress_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `progress_ibfk_2` FOREIGN KEY (`courseId`) REFERENCES `course` (`courseId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `reminders`
--
ALTER TABLE `reminders`
ADD CONSTRAINT `reminders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `reminders_ibfk_2` FOREIGN KEY (`courseId`) REFERENCES `course` (`courseId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `subject`
--
ALTER TABLE `subject`
ADD CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`courseId`) REFERENCES `course` (`courseId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `usercourse`
--
ALTER TABLE `usercourse`
ADD CONSTRAINT `usercourse_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `usercourse_ibfk_2` FOREIGN KEY (`courseId`) REFERENCES `course` (`courseId`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `userlogin`
--
ALTER TABLE `userlogin`
ADD CONSTRAINT `userlogin_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `usermembership`
--
ALTER TABLE `usermembership`
ADD CONSTRAINT `usermembership_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usersuggestion`
--
ALTER TABLE `usersuggestion`
ADD CONSTRAINT `usersuggestion_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `usertemplate`
--
ALTER TABLE `usertemplate`
ADD CONSTRAINT `idx_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
