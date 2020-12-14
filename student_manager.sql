-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: localhost    Database: student_manager
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `score`
--

DROP TABLE IF EXISTS `score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
CREATE TABLE `score` (
  `id` varchar(50) NOT NULL,
  `dat` varchar(50) DEFAULT '',
  `android` varchar(50) DEFAULT '',
  `jsp` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
INSERT INTO `score` VALUES ('20162430634','90','59','90'),('20162430635','59','84','90'),('20162430636','93','97','90'),('20162430637','70','90','90'),('20162430638','90','50','50'),('20162430639','90','90','92'),('20162430640','90','90','90'),('20162430641','40','90','90'),('20162430642','90','90','90'),('20162430643','90','90','90'),('20162430644','85','94','90'),('20162430645','75','67','76'),('20162430646','89','78','87');
/*!40000 ALTER TABLE `score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
CREATE TABLE `student` (
  `id` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `sex` varchar(50) NOT NULL,
  `school_date` varchar(50) NOT NULL,
  `major` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('20162430634','0','周华强','男','2016-9','计算机科学与技术',NULL),('20162430635','0','王俊凯','男','2016-9','计算机科学与技术',NULL),('20162430636','0','张宇苍','男','2016-9','软件工程',NULL),('20162430637','0','三松','男','2016-9','计算机科学与技术',NULL),('20162430638','0','王贺龙','男','2016-9','软件工程',NULL),('20162430639','0','张勃','男','2016-9','计算机科学与技术',NULL),('20162430640','0','张红展','男','2016-9','软件工程',NULL),('20162430641','0','赵旺奇','女','2016-9','软件工程',NULL),('20162430642','0','王配','男','2016-9','计算机科学与技术',NULL),('20162430643','0','大伟','男','2016-9','软件工程',NULL),('20162430644','0','谢强','男','2016-09','软件工程',NULL),('20162430645','0','韦清兵','男','2016-09','软件工程卓越班',NULL),('20162430646','0','崔仓豪','男','2018-12','计算机科学与技术',NULL);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
CREATE TABLE `teacher` (
  `id` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT '',
  `sex` varchar(50) DEFAULT '',
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES ('zzu','zzu','zzu','男',NULL);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-13 20:19:31
