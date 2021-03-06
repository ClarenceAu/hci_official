-- MySQL dump 10.13  Distrib 5.1.61, for debian-linux-gnu (i486)
--
-- Host: localhost    Database: official
-- ------------------------------------------------------
-- Server version	5.1.61-0ubuntu0.10.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meeting_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `state` int(11) NOT NULL COMMENT '出席状态',
  `reason` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `is_attend` int(11) DEFAULT NULL COMMENT '是否参加',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`meeting_id`,`member_id`),
  KEY `Ref_07` (`member_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='考勤';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (1,2,1,0,NULL,NULL),(2,2,2,0,NULL,NULL);
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin NOT NULL,
  `detail` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='部门';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'鍚庡彴鐮斿彂閮�','',0),(2,'鐢ㄦ埛浣撻獙閮�','',0),(3,'绯荤粺娴嬭瘯閮�','',0),(4,'鎵嬫満鐮斿彂閮�','',0);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department_member`
--

DROP TABLE IF EXISTS `department_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT '表示成员或负责人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`department_id`,`member_id`),
  KEY `Ref_03` (`member_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='部门成员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department_member`
--

LOCK TABLES `department_member` WRITE;
/*!40000 ALTER TABLE `department_member` DISABLE KEYS */;
INSERT INTO `department_member` VALUES (1,1,1,1),(2,1,2,1);
/*!40000 ALTER TABLE `department_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `suffix` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_public` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting`
--

DROP TABLE IF EXISTS `meeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `state` int(11) DEFAULT NULL COMMENT '是否删除',
  `title` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='会议';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting`
--

LOCK TABLES `meeting` WRITE;
/*!40000 ALTER TABLE `meeting` DISABLE KEYS */;
INSERT INTO `meeting` VALUES (2,'2011-10-04',0,'7鏈�3鍙蜂綑涓嬫埧璐�');
/*!40000 ALTER TABLE `meeting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '学号，登陆账号',
  `name` varchar(8) COLLATE utf8_bin NOT NULL,
  `password` varchar(32) COLLATE utf8_bin NOT NULL,
  `state` int(11) DEFAULT NULL COMMENT '表示在职，退出',
  `role` int(11) DEFAULT NULL COMMENT '角色',
  `type` int(11) NOT NULL COMMENT '表示老师，学生，毕业',
  `is_public` tinyint(4) NOT NULL COMMENT '是否对外公开',
  `extend_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_id` (`student_id`),
  KEY `Ref_22` (`extend_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='成员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'200930560319','娆ф尟鑱�','e10adc3949ba59abbe56e057f20f883e',1,0,3,0,1),(2,'200930560314','鏋楁涓�','e10adc3949ba59abbe56e057f20f883e',1,0,3,0,2);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_extend`
--

DROP TABLE IF EXISTS `member_extend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_extend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sex` tinyint(4) NOT NULL,
  `familyaddress` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `nativeplace` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `folk` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `card_id` varchar(18) COLLATE utf8_bin DEFAULT NULL,
  `homepage` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `email` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `mobile` varchar(13) COLLATE utf8_bin DEFAULT NULL,
  `mobileshort` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `academy` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `major` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='成员详细资料';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_extend`
--

LOCK TABLES `member_extend` WRITE;
/*!40000 ALTER TABLE `member_extend` DISABLE KEYS */;
INSERT INTO `member_extend` VALUES (1,0,NULL,NULL,NULL,NULL,'','1990-03-28','ozhencong@gmail.com','15820243964','673964',2009,'淇℃伅瀛﹂櫌','淇℃伅绠＄悊涓庝俊鎭郴缁�'),(2,0,NULL,NULL,NULL,NULL,'','1990-03-28','ozhencong@gmail.com','8615820243964','673964',2009,'淇℃伅瀛﹂櫌','淇℃伅绠＄悊涓庝俊鎭郴缁�');
/*!40000 ALTER TABLE `member_extend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_message`
--

DROP TABLE IF EXISTS `member_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `state` int(11) NOT NULL COMMENT '表示读否',
  `read_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reply` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '信息回复',
  `type` int(11) DEFAULT NULL COMMENT '信息类型',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`member_id`,`message_id`),
  KEY `Ref_15` (`message_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='成员消息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_message`
--

LOCK TABLES `member_message` WRITE;
/*!40000 ALTER TABLE `member_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL COMMENT '信息类型',
  `content` text COLLATE utf8_bin,
  `date` date NOT NULL,
  `member_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Ref_16` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='消息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `detail` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `state_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `state` int(11) DEFAULT NULL COMMENT '表示正在进行，结题',
  `is_public` tinyint(4) NOT NULL COMMENT '是否对外公开',
  `department_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Ref_23` (`department_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='项目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'HCI Website','','2012-04-17',NULL,1,0,1);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_member`
--

DROP TABLE IF EXISTS `project_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `job` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '职责',
  `type` int(11) NOT NULL COMMENT '表示成员或组长',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`project_id`,`member_id`),
  KEY `Ref_01` (`member_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='项目成员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_member`
--

LOCK TABLES `project_member` WRITE;
/*!40000 ALTER TABLE `project_member` DISABLE KEYS */;
INSERT INTO `project_member` VALUES (1,1,1,'',1);
/*!40000 ALTER TABLE `project_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `meeting_id` int(11) NOT NULL,
  `comment` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '汇报记录',
  `is_report` int(11) DEFAULT NULL COMMENT '是否参与汇报',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`project_id`,`meeting_id`),
  KEY `Ref_10` (`meeting_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='项目汇报';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES (2,1,2,NULL,NULL);
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_file`
--

DROP TABLE IF EXISTS `report_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key` (`report_id`,`file_id`),
  KEY `Ref_18` (`file_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='汇报文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_file`
--

LOCK TABLES `report_file` WRITE;
/*!40000 ALTER TABLE `report_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_member`
--

DROP TABLE IF EXISTS `report_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `report_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`member_id`,`report_id`),
  KEY `Ref_26` (`report_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_member`
--

LOCK TABLES `report_member` WRITE;
/*!40000 ALTER TABLE `report_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_member` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-04-22  8:23:03
