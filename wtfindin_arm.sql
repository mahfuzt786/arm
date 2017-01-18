-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2017 at 01:00 PM
-- Server version: 5.5.34
-- PHP Version: 5.4.22

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
  `attendenceId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `courseId` int(11) NOT NULL,
  `isAttended` enum('Y','N') NOT NULL DEFAULT 'N',
  `classDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`attendenceId`),
  KEY `userId` (`userId`),
  KEY `courseId` (`courseId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `blab8_ban`
--

CREATE TABLE IF NOT EXISTS `blab8_ban` (
  `ban_id` int(11) NOT NULL,
  `ban_name` varchar(64) NOT NULL,
  `ban_ip` varchar(50) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `ban_reason` varchar(255) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `blab8_iplog`
--

CREATE TABLE IF NOT EXISTS `blab8_iplog` (
  `usr_id` int(11) NOT NULL,
  `usr_name` varchar(255) NOT NULL,
  `ipaddr` varchar(50) NOT NULL,
  `timestamp` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `blab8_iplog`
--

INSERT INTO `blab8_iplog` (`usr_id`, `usr_name`, `ipaddr`, `timestamp`) VALUES
(2, 'test2', '::1', 1484733560),
(3, 'test3', '::1', 1484733948);

-- --------------------------------------------------------

--
-- Table structure for table `blab8_lines`
--

CREATE TABLE IF NOT EXISTS `blab8_lines` (
  `line_id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(11) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `line_txt` text NOT NULL,
  PRIMARY KEY (`line_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `blab8_lines`
--

INSERT INTO `blab8_lines` (`line_id`, `from_id`, `from_name`, `timestamp`, `line_txt`) VALUES
(1, 2, 'test2', 1484733574, 'hello'),
(2, 2, 'test2', 1484733581, 'hi..'),
(3, 2, 'test2', 1484733630, '<img src="ui/smilies/innocent.png"  alt=":innocent:" />'),
(4, 3, 'test3', 1484733968, 'hi test 2'),
(5, 2, 'test2', 1484733980, 'hello 3..'),
(6, 2, '', 1484733988, '<span style="font-size:150%;font-weight:bold"> ds (test2)</span>'),
(7, 3, 'test3', 1484734001, 'ds'),
(8, 2, 'test2', 1484734077, '<img onclick="play_p(''2'')" class="paint_thumb" src="paintings/2.png" alt="" />');

-- --------------------------------------------------------

--
-- Table structure for table `blab8_online`
--

CREATE TABLE IF NOT EXISTS `blab8_online` (
  `usr_id` int(11) NOT NULL,
  `usr_name` varchar(64) NOT NULL,
  `usr_ip` varchar(50) NOT NULL,
  `rtime` int(11) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `blab8_paintings`
--

CREATE TABLE IF NOT EXISTS `blab8_paintings` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_srx` text NOT NULL,
  `p_sry` text NOT NULL,
  `p_src` text NOT NULL,
  `p_bgc` char(6) NOT NULL,
  `p_views` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `usr_id` int(11) NOT NULL,
  `usr_name` varchar(255) NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `blab8_paintings`
--

INSERT INTO `blab8_paintings` (`p_id`, `p_srx`, `p_sry`, `p_src`, `p_bgc`, `p_views`, `timestamp`, `usr_id`, `usr_name`) VALUES
(1, '113 104 102 99 96 93 90 87 84 81 78 77 75 75 71 71 70 70 70 70 70 70 70 70 72 74 76 79 81 85 88 91 94 96 100 102 104 108 111 115 118 123 129 133 138 143 149 156 162 172 177 185 191 194 198 203 205 207 210 212 214 216 217 217 218 218 218 218 218 218 217 216 215 214 211 210 208 206 205 203 202 198 196 193 191 189 186 183 181 179 176 173 170 168 166 163 161 158 155 152 150 148 146 144 142 139 136 134 131 128 126 122 120 119 117 113 111 108 103 100 97 93 91 87 83 81 79 76 74 74 72 70 70 69 67 67 66 65 65 64 64 64 64 64 64 65 65 0 0 0 0', '51 49 49 49 49 49 49 49 49 49 50 51 52 53 58 60 63 68 73 78 82 88 93 99 106 113 121 126 131 136 141 148 151 156 159 161 163 165 169 172 174 178 180 181 182 184 185 185 185 185 185 185 183 182 179 175 170 166 161 154 147 139 133 125 120 113 106 100 93 89 83 79 74 70 66 63 61 59 55 52 50 47 44 42 39 37 35 34 33 32 30 29 28 26 25 25 25 24 23 23 22 22 22 22 22 22 22 22 22 22 22 22 23 24 24 25 28 28 30 33 34 36 38 39 41 42 44 45 46 47 48 48 50 51 52 54 55 56 57 58 60 61 63 65 67 68 71 0 0 0 0', 'z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4 z4', '', 0, 1484734043, 2, 'test2');

-- --------------------------------------------------------

--
-- Table structure for table `blab8_settings`
--

CREATE TABLE IF NOT EXISTS `blab8_settings` (
  `set_id` varchar(16) NOT NULL,
  `set_value` text NOT NULL,
  `set_fast` smallint(6) NOT NULL,
  PRIMARY KEY (`set_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `blab8_settings`
--

INSERT INTO `blab8_settings` (`set_id`, `set_value`, `set_fast`) VALUES
('acp_timezone', '0', 0),
('default_timeform', '0', 0),
('default_language', '5', 0),
('default_effects', '2', 0),
('default_sound1', '4', 0),
('default_sound2', '6', 0),
('default_sound3', '9', 0),
('default_sound4', '7', 0),
('title', 'BlaB!', 0),
('guests', '1', 0),
('register', '1', 0),
('activation', '0', 0),
('url', 'http://localhost/arm/blab83/', 0),
('default_mail', 'noreply@localhost', 0),
('ajax_delay', '500', 0),
('ajax_update', '6', 0),
('post_length', '128', 0),
('post_interv', '2000', 0),
('admin_lang', '0', 0),
('wrong_acp', '0', 0),
('acp_key', '9241c3bea7eb3b0f891276e14c560abb', 0),
('admin_css', '1', 0),
('notebook', '...c', 1),
('meta_desc', '', 0),
('meta_keyw', '', 0),
('del_gbuddies', '1', 0),
('mssg_history', '17520', 0),
('optimize_tbl', '1', 0),
('acp_attempts', '180', 0),
('acp_lhours', '2', 0),
('show_topic', '1', 0),
('logo', '<img src="ui/images/logo.png" style="float:right;margin-right:5px" alt="" />', 0),
('cookie_salt', '38a416af4fecb415', 0),
('iplog_on', '1', 0),
('legal_msg', '', 0),
('80u', '1', 1),
('80d', '1', 1),
('int_version', '', 1),
('faq_page', '<div style="margin:10px">\r\n\r\n<div style="font-weight:bold">\r\n<span style="font-weight:normal">00.</span> \r\n<span class="link_color" onclick="help_all(0);return show_help(''s0'')">Quick start</span></div>\r\n<div id="s0" style="display:block;margin:8px;text-align:justify">Welcome to our chat! Here you can find some information that will help you become familiar with the features that our chat offers. \r\nPlease keep in mind that depending on the settings set by the administrator of this chat the information below might not be 100% accurate.</div>\r\n\r\n<div style="font-weight:bold">\r\n<span style="font-weight:normal">01.</span> \r\n<span class="link_color" onclick="help_all(0);return show_help(''s1'')">Settings</span></div>\r\n<div id="s1" style="display:none;margin:8px;text-align:justify">You can easily alter the settings of the chat - click on SETTINGS at the top of the chat window.\r\nSelect your preferred language, timezone, time format, sound alerts etc.</div>\r\n\r\n<div style="font-weight:bold">\r\n<span style="font-weight:normal">02.</span> \r\n<span class="link_color" onclick="help_all(0);return show_help(''s2'')">Profile</span></div>\r\n<div id="s2" style="display:none;margin:8px;text-align:justify">\r\nWhen you need to set a new password, retype it carefully and also make sure that you enter a correct old password. \r\nIf you are a guest user the old password is automatically set for you.\r\nIf you are a guest user and you want to save your profile, you have to enter a valid email address.</div>\r\n\r\n\r\n<div style="font-weight:bold">\r\n<span style="font-weight:normal">03.</span> \r\n<span class="link_color" onclick="help_all(0);return show_help(''s3'')">Scrolling up and down</span></div>\r\n<div id="s3" style="display:none;margin:8px;text-align:justify">Drag-to-scroll or scroll up and down with the arrow keys of your keyboard. Double click in the chat area gives you the option to select, another double click would let you drag-to-scroll again.</div>\r\n\r\n\r\n<br />\r\n<span class="link_color" onclick="help_all(1);return false">Show all</span>\r\n<b>&middot;</b>\r\n<span class="link_color" onclick="help_all(0);return false">Hide all</span>\r\n</div>', 1),
('style_template', '\r\ntd,p,div,input,select,textarea{font-size:[15];font-family:[3];text-align:left}\r\ninput,select,textarea{color:#[13];background-color:#[14];padding:2px;border-width:0px;box-sizing:border-box}\r\n.bgcolor_overal{color:#[1];background-color:#[2]}\r\n.bgcolor_panel_bars{color:#[9];background-color:#[10]}\r\n.bgcolor_panel_content{color:#[11];background-color:#[12]}\r\n.bgcolor_top_bar{color:#[5];background-color:#[6]}\r\n.bgcolor_bottom_bar{color:#[7];background-color:#[8]}\r\n.title1{font-size:[17];font-weight:bold;text-transform:uppercase}\r\n.title2{font-size:[18];font-weight:bold;text-transform:uppercase}\r\n.text_small{font-size:[16]}\r\n.panels_extra{[19]}\r\n.boxes_extra{[20]}\r\n.topbar_extra{[21]}\r\n.bottombar_extra{[22]}\r\n.textbox_extra{[23]}\r\n.body_extra{[24]}\r\n.link_color{color:#[4];cursor:pointer}\r\n.oo{font-weight:bold;line-height:13px;white-space:nowrap;color:#[4];margin-left:8px}\r\n', 1),
('style_delivery', '\r\ntd,p,div,input,select,textarea{font-size:9pt;font-family:verdana,helvetica,sans-serif;text-align:left}\r\ninput,select,textarea{color:#fff;background-color:#444;padding:2px;border-width:0px;box-sizing:border-box}\r\n.bgcolor_overal{color:#fff;background-color:#333}\r\n.bgcolor_panel_bars{color:#fff;background-color:#111}\r\n.bgcolor_panel_content{color:#fff;background-color:#222}\r\n.bgcolor_top_bar{color:#fff;background-color:#222}\r\n.bgcolor_bottom_bar{color:#fff;background-color:#222}\r\n.title1{font-size:12pt;font-weight:bold;text-transform:uppercase}\r\n.title2{font-size:8pt;font-weight:bold;text-transform:uppercase}\r\n.text_small{font-size:8pt}\r\n.panels_extra{border-radius:10px;box-shadow:2px 2px 2px #111}\r\n.boxes_extra{border:0px solid #fff;border-radius:5px;box-shadow:2px 2px 2px #111}\r\n.topbar_extra{border-bottom:1px solid #111;box-shadow:0px 2px 2px #111}\r\n.bottombar_extra{border-top:1px solid #111;box-shadow:0px -2px 2px #111}\r\n.textbox_extra{border:1px solid #fff;box-shadow:2px 2px 2px #111}\r\n.body_extra{background-image:none}\r\n.link_color{color:#FEC400;cursor:pointer}\r\n.oo{font-weight:bold;line-height:13px;white-space:nowrap;color:#FEC400;margin-left:8px}\r\n', 0),
('slot_1d', 'd|FFFFFF|333333|verdana, sans-serif|FEC400|FFFFFF|222222|FFFFFF|222222|FFFFFF|111111|FFFFFF|222222|000000|FFFFFF|9pt|8pt|12pt|8pt|border-radius:10px;box-shadow:2px 2px 2px #111111|border:0px solid #fff;border-radius:5px;box-shadow:2px 2px 2px #111111|border-bottom:1px solid #111111;box-shadow:0px 2px 2px #111111|border-top:1px solid #111111;box-shadow:0px -2px 2px #111111|border:1px solid #fff;box-shadow:2px 2px 2px #111111|', 1),
('slot_2d', 'd|FFFFFF|395871|verdana, sans-serif|FEB712|FFFFFF|29435A|FFFFFF|29435A|FFFFFF|29435A|FFFFFF|4B6B87|000000|7E9DB6|9pt|8pt|12pt|8pt|border-radius:10px;box-shadow:2px 2px 2px #1C2E3D|border:0px solid #fff;border-radius:5px;box-shadow:2px 2px 2px #1C2E3D|border-bottom:1px solid #1C2E3D;box-shadow:0px 2px 2px #1C2E3D|border-top:1px solid #1C2E3D;box-shadow:0px -2px 2px #1C2E3D|border:1px solid #fff;box-shadow:2px 2px 2px #1C2E3D|', 1),
('slot_3d', 'd|000000|C4D3DB|verdana, sans-serif|BC0017|FFFFFF|3E606F|FFFFFF|3E606F|FFFFFF|193441|FFFFFF|3E606F|000000|FFFFFF|9pt|8pt|12pt|8pt||border:1px solid #fff|border-bottom:3px solid #193441|border-top:2px solid #193441|border:1px solid #193441|', 1),
('slot_4d', 'd|000000|EAE2D2|tahoma, geneva, sans-serif|AA0000|000000|EAE2D2|000000|DED1B9|FFFFFF|AF9B71|000000|CDBC99|000000|FFFFFF|10pt|8pt|13pt|9pt|border-radius:5pt|border:1px solid #fff|background-image:url(ui/images/bg_beige.png);background-repeat:repeat-x;|border-top:1px solid #fff|border:1px solid #BFAD89|background-image:url(ui/images/bg_beige.png);background-repeat:repeat-x;', 1),
('slot_5d', 'd|000000|C6D3D3|arial, helvetica, sans-serif|273B3B|000000|C6D3D3|FFFFFF|5D7676|FFFFFF|507676|000000|AABFBF|000000|FFFFFF|10pt|9pt|14pt|10pt|border-radius:5pt|border:1px solid #6F8989|background-image:url(ui/images/bg_green.png);background-repeat:repeat-x;|border-top:1px solid #334646|border:1px solid #334646|background-image:url(ui/images/bg_green.png);background-repeat:repeat-x;', 1),
('slot_6d', 'd|000000|FFFFFF|verdana, sans-serif|105289|000000|FFFFFF|FFFFFF|A1BAD0|FFFFFF|A1BAD0|000000|CADCEB|000000|FFFFFF|9pt|8pt|12pt|9pt|border-radius:5pt;box-shadow:2px 2px 2px #39424A|border-radius:5pt;border:2px solid #105289|background-image:url(ui/images/bg_blue.png);background-repeat:repeat-x;|border-top:1px solid #105289;box-shadow:2px -2px 2px #39424A|border:1px solid #EEEEEE;box-shadow:2px 2px 2px #39424A|background-image:url(ui/images/bg_blue.png);background-repeat:repeat-x;', 1),
('slot_7d', 'd|000000|EEEEEE|arial, sans-serif|5D0000|FFFFFF|A11A1A|FFFFFF|A11A1A|FFFFFF|A11A1A|333333|DDDDDD|000000|EEEEEE|9pt|8pt|12pt|8pt|box-shadow:2px 2px 2px #333333|box-shadow:2px 2px 2px #333333|box-shadow:0px 2px 2px #5D0000|box-shadow:0px -2px 2px #5D0000|border:1px solid #fff;box-shadow:2px 2px 2px #333333|', 1),
('slot_8d', 'd|FFFFFF|823E26|verdana, sans-serif|FFF01C|FFFFFF|5E2D1B|FFFFFF|5E2D1B|FFFFFF|5E2D1B|FFFFFF|733721|000000|FFFFFF|9pt|8pt|12pt|9pt|border-radius:5pt;box-shadow:2px 2px 2px #31170D|border-radius:5pt;box-shadow:2px 2px 2px #31170D|box-shadow:2px 2px 2px #31170D;opacity:0.6;|box-shadow:2px -2px 2px #31170D;opacity:0.6;|border:1px solid #823E26;box-shadow:2px 2px 2px #31170D|background-image:url(ui/images/bg_circles.png);background-repeat:no-repeat', 1),
('slot_9d', 'd|000000|EEEEEE|arial, sans-serif|29435A|333333|CCCCCC|333333|CCCCCC|333333|BBBBBB|333333|DDDDDD|000000|EEEEEE|9pt|8pt|12pt|8pt|box-shadow:2px 2px 2px #666666|box-shadow:2px 2px 2px #666666|box-shadow:0px 2px 2px #666666|box-shadow:0px -2px 2px #666666|border:1px solid #fff;box-shadow:2px 2px 2px #666666|', 1);

-- --------------------------------------------------------

--
-- Table structure for table `blab8_style`
--

CREATE TABLE IF NOT EXISTS `blab8_style` (
  `sid` smallint(6) NOT NULL,
  `value` text NOT NULL,
  `desktop` smallint(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `blab8_style`
--

INSERT INTO `blab8_style` (`sid`, `value`, `desktop`) VALUES
(1, 'fff', 1),
(2, '333', 1),
(3, 'verdana, sans-serif', 1),
(4, 'FEC400', 1),
(5, 'fff', 1),
(6, '222', 1),
(7, 'fff', 1),
(8, '222', 1),
(9, 'fff', 1),
(10, '111', 1),
(11, 'fff', 1),
(12, '222', 1),
(13, 'fff', 1),
(14, '444', 1),
(15, '9pt', 1),
(16, '8pt', 1),
(17, '12pt', 1),
(18, '9pt', 1),
(19, 'border-radius:10px;box-shadow:2px 2px 2px #111', 1),
(20, 'border:0px solid #fff;border-radius:5px;box-shadow:2px 2px 2px #111', 1),
(21, 'border-bottom:1px solid #111;box-shadow:0px 2px 2px #111', 1),
(22, 'border-top:1px solid #111;box-shadow:0px -2px 2px #111', 1),
(23, 'border:1px solid #fff;box-shadow:2px 2px 2px #111', 1),
(24, 'background-image:none', 1);

-- --------------------------------------------------------

--
-- Table structure for table `blab8_users`
--

CREATE TABLE IF NOT EXISTS `blab8_users` (
  `usr_id` int(11) NOT NULL AUTO_INCREMENT,
  `usr_name` varchar(64) NOT NULL,
  `usr_pass` char(32) NOT NULL,
  `usr_mail` varchar(64) NOT NULL,
  `usr_join_date` int(11) NOT NULL,
  `usr_status` varchar(8) NOT NULL,
  PRIMARY KEY (`usr_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `blab8_users`
--

INSERT INTO `blab8_users` (`usr_id`, `usr_name`, `usr_pass`, `usr_mail`, `usr_join_date`, `usr_status`) VALUES
(1, 'test', '7889b43c28b046d2abcfb9df9b2a7bd9', 'test@localhost', 1484733421, '0'),
(2, 'test2', '215d7cb24c36dcf9a5644b6957845557', 'test2@localhost.in', 1484733545, '0'),
(3, 'test3', 'e904dea7d578122577fbe3345ed4d425', 'test3@local.in', 1484733923, '0');

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE IF NOT EXISTS `class` (
  `classId` int(11) NOT NULL AUTO_INCREMENT,
  `className` varchar(3000) NOT NULL,
  `subjectId` int(11) NOT NULL,
  `teacherName` varchar(1000) NOT NULL,
  `classTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `classDays` varchar(1000) NOT NULL,
  `classDesc` varchar(30000) NOT NULL,
  `classWeeklyDays` varchar(1000) NOT NULL,
  `classType` enum('alternate','regular') NOT NULL DEFAULT 'alternate',
  PRIMARY KEY (`classId`),
  KEY `subjectId` (`subjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `courseId` int(11) NOT NULL AUTO_INCREMENT,
  `courseName` varchar(300) NOT NULL,
  `courseCategory` enum('t','c') NOT NULL,
  `fees` varchar(100) NOT NULL,
  `courseDuration` varchar(300) NOT NULL,
  PRIMARY KEY (`courseId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=67 ;

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
  `examId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `courseId` int(11) NOT NULL,
  `subjectId` int(11) NOT NULL,
  `marksObtain` decimal(11,0) NOT NULL,
  `marksTotal` decimal(11,0) NOT NULL,
  `examType` enum('daily','week','month') NOT NULL DEFAULT 'week',
  `examDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `examDay` varchar(100) NOT NULL,
  `isActive` enum('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`examId`),
  KEY `userId` (`userId`),
  KEY `courseId` (`courseId`),
  KEY `subjectId` (`subjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE IF NOT EXISTS `fees` (
  `feeId` int(10) NOT NULL AUTO_INCREMENT,
  `subjectId` int(10) NOT NULL,
  `fee` int(10) NOT NULL,
  PRIMARY KEY (`feeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `menuid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(100) NOT NULL,
  `menu_icon` varchar(50) NOT NULL,
  `url` varchar(50) NOT NULL,
  `menu_div` varchar(30) NOT NULL,
  `display` enum('y','n') NOT NULL,
  PRIMARY KEY (`menuid`),
  UNIQUE KEY `menuid` (`menuid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

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
  `view` enum('1','0') NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`,`menuid`)
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
  `progressId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `courseId` int(11) NOT NULL,
  `remark` varchar(30000) NOT NULL,
  `isReportSent` enum('Y','N') NOT NULL DEFAULT 'N',
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`progressId`),
  KEY `userId` (`userId`),
  KEY `courseId` (`courseId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `reminders`
--

CREATE TABLE IF NOT EXISTS `reminders` (
  `reminderId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `courseId` int(11) NOT NULL,
  `remSubject` varchar(1000) NOT NULL,
  `remDesc` varchar(30000) NOT NULL,
  `remType` enum('fees','attendence','result') DEFAULT NULL,
  `remDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`reminderId`),
  KEY `userId` (`userId`),
  KEY `courseId` (`courseId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `roleid` int(3) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(50) NOT NULL,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

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
  `subjectId` int(11) NOT NULL AUTO_INCREMENT,
  `courseId` int(11) NOT NULL,
  PRIMARY KEY (`subjectId`),
  KEY `courseId` (`courseId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `subjectmaster`
--

CREATE TABLE IF NOT EXISTS `subjectmaster` (
  `subjectId` int(10) NOT NULL AUTO_INCREMENT,
  `subjectName` varchar(50) NOT NULL,
  PRIMARY KEY (`subjectId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

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
  `userId` int(11) NOT NULL AUTO_INCREMENT,
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
  `roleid` int(3) NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

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
  `userCourseId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `courseId` int(11) NOT NULL,
  PRIMARY KEY (`userCourseId`),
  KEY `userId` (`userId`),
  KEY `courseId` (`courseId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `userlogin`
--

CREATE TABLE IF NOT EXISTS `userlogin` (
  `userLoginId` int(11) NOT NULL AUTO_INCREMENT,
  `loginDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userId` int(11) NOT NULL,
  `remoteAddr` varchar(300) NOT NULL,
  PRIMARY KEY (`userLoginId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=395 ;

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
(392, '2016-12-27 05:28:58', 1, '127.0.0.1'),
(393, '2017-01-18 09:22:43', 1, '::1'),
(394, '2017-01-18 09:23:14', 1, '::1');

-- --------------------------------------------------------

--
-- Table structure for table `usermembership`
--

CREATE TABLE IF NOT EXISTS `usermembership` (
  `userMemId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `memType` enum('admin','clerk','student') NOT NULL DEFAULT 'student',
  `accessLevel` int(11) NOT NULL,
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userMemId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

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
  `sugId` int(11) NOT NULL AUTO_INCREMENT,
  `msgType` enum('contactUs','landing') NOT NULL DEFAULT 'contactUs',
  `userId` int(11) NOT NULL,
  `suggestion` varchar(30000) NOT NULL,
  `ourResponse` varchar(30000) NOT NULL,
  `isResponded` enum('Y','N') NOT NULL DEFAULT 'N',
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sugId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `usertemplate`
--

CREATE TABLE IF NOT EXISTS `usertemplate` (
  `templId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `templName` varchar(300) NOT NULL,
  `templDesc` varchar(30000) NOT NULL,
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`templId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
