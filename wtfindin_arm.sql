-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2016 at 04:31 AM
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
  `profession` varchar(300) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `firstName`, `lastName`, `email`, `phone`, `loginId`, `password`, `gender`, `address`, `city`, `state`, `zip`, `country`, `isActive`, `issueDate`, `qualification`, `profession`) VALUES
(1, 'Rajiv', 'Saikia', 'rajivsaikia22@gmail.com', '9085632517', 'admin@admin.com', 'admin', 'male', 'Natun Nirmali Gaon, Jyoti Path', 'Dibrugarh', 'Assam', '786003', 'India', 'Y', '2016-11-22 06:26:27', 'MCA', 'Software Developer');

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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

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
(39, '2016-11-24 03:25:06', 1, '127.0.0.1');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usermembership`
--

INSERT INTO `usermembership` (`userMemId`, `userId`, `memType`, `accessLevel`, `createDate`) VALUES
(1, 1, 'admin', 1, '2016-11-23 18:11:07');

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
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
MODIFY `subjectId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `usercourse`
--
ALTER TABLE `usercourse`
MODIFY `userCourseId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `userlogin`
--
ALTER TABLE `userlogin`
MODIFY `userLoginId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `usermembership`
--
ALTER TABLE `usermembership`
MODIFY `userMemId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
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
