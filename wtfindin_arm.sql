-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2016 at 07:48 PM
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
  `courseCategory` varchar(3000) NOT NULL,
  `fees` varchar(100) NOT NULL,
  `courseDuration` varchar(300) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`courseId`, `courseName`, `courseCategory`, `fees`, `courseDuration`) VALUES
(1, 'Banking', 'Banking Examination', '6000', '3'),
(2, 'UPSC', 'UPSC Examination', '12000', '6'),
(3, 'Tuition', 'Tuition Classes', '500', '1');

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

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE IF NOT EXISTS `subject` (
`subjectId` int(11) NOT NULL,
  `subjectName` varchar(3000) NOT NULL,
  `courseId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;

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
(90, '2016-12-01 18:48:16', 2, '127.0.0.1');

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
-- Indexes for table `module`
--
ALTER TABLE `module`
 ADD PRIMARY KEY (`modulegroupcode`), ADD UNIQUE KEY `modulecode` (`modulecode`);

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
MODIFY `courseId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `exam`
--
ALTER TABLE `exam`
MODIFY `examId` int(11) NOT NULL AUTO_INCREMENT;
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
MODIFY `userLoginId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=91;
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
