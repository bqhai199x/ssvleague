CREATE DATABASE  IF NOT EXISTS `ssvleague` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ssvleague`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: ssvleague
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `club`
--

DROP TABLE IF EXISTS `club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `club` (
  `name` varchar(45) NOT NULL,
  `alias` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `club`
--

LOCK TABLES `club` WRITE;
/*!40000 ALTER TABLE `club` DISABLE KEYS */;
INSERT INTO `club` VALUES ('ac-milan','AC Milan'),('ajax','Ajax'),('al-nassr-saudi','AL Nassr'),('arsenal','Arsenal'),('as-roma','AS Roma'),('atletico-madrid','Aletico Madrid'),('barcelona','Barcelona'),('bayer-leverkusen','Bayer Leverkusen'),('bayern-munchen','Bayern Munchen'),('borussia-dortmund','Dortmund'),('chelsea','Chelsea'),('inter_miami','Inter Miami'),('internazionale-milano','Inter Milan'),('juventus','Juventus'),('liverpool','Liverpool'),('manchester-city','Manchester City'),('manchester-united','Manchester United'),('napoli','Napoli'),('newcastle-united','Newcastle'),('paris-saint-germain-fc','PSG'),('real-madrid','Real Madrid'),('redbull-salzburg','Leipzig'),('sevilla-fc','Sevilla'),('tottenham-hotspur','Tottenham');
/*!40000 ALTER TABLE `club` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match`
--

DROP TABLE IF EXISTS `match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `match` (
  `key` varchar(45) NOT NULL,
  `home_key` varchar(45) NOT NULL,
  `away_key` varchar(45) NOT NULL,
  `home_player` varchar(45) NOT NULL,
  `away_player` varchar(45) NOT NULL,
  `home_goal` int DEFAULT NULL,
  `away_goal` int DEFAULT NULL,
  `home_club` varchar(45) DEFAULT NULL,
  `away_club` varchar(45) DEFAULT NULL,
  `home_banned_1` varchar(45) DEFAULT NULL,
  `away_banned_1` varchar(45) DEFAULT NULL,
  `home_banned_2` varchar(45) DEFAULT NULL,
  `away_banned_2` varchar(45) DEFAULT NULL,
  `ban_pick_state` int DEFAULT '0',
  `home_yellow_card` int DEFAULT NULL,
  `away_yellow_card` int DEFAULT NULL,
  `home_red_card` int DEFAULT NULL,
  `away_red_card` int DEFAULT NULL,
  `winner` varchar(45) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match`
--

LOCK TABLES `match` WRITE;
/*!40000 ALTER TABLE `match` DISABLE KEYS */;
INSERT INTO `match` VALUES ('9CEx1pAiKBK8VuDHAekml8tdaskD2WjTcuY8n3s6WnQMX','l1LcdC5no1eBaUu4DBF7Igmp4lIbxI3PtpSnQfjQHhJgR','GvyQKTV880Vu936bVUSaHrOR2cMmeW0ouBby0pEv1JeWv','HaiNH','ChinhHV',NULL,NULL,'barcelona','bayern-munchen','manchester-city','arsenal','liverpool','paris-saint-germain-fc',6,NULL,NULL,NULL,NULL,NULL,'2023-12-07 09:25:44'),('A7a2QnAAzAGrL4sz8sJ8POS67O6IIbOKGYjejw3mDGLfk','oH879m72j5qUObapm3mEfla5mY4FAEeaSYoEuKtFCcFsB','RcyQskjqlpV3lblG1DdTTVf4Ju8xfpoUUlo5tX3xHbiJu','BinhDC','HaiBQ',NULL,NULL,'manchester-city','bayern-munchen','liverpool','paris-saint-germain-fc','arsenal','tottenham-hotspur',6,NULL,NULL,NULL,NULL,NULL,'2023-12-07 09:26:22'),('hox9mbtIf9wOcQuLc3I1eUKqqrPZM2GcqXkjYdmdR0Yj7','fY53zPW0GK7Kxxmej7kmiBdbtscFTJg6ruAJPD3bo5mVO','upKU7Q8wmh9KvdotY21cpz0S0eHdgnVVtuEl1J6R8JrHR','ToanHH','ThanhBT',1,0,'real-madrid','bayern-munchen','ac-milan','manchester-city','juventus','paris-saint-germain-fc',7,1,1,0,0,'ToanHH','2023-12-04 13:21:35'),('LmCIPE2FRbq2lOWjFfiGoxr8VKNvESuFHVZLbhR4dtlEo','NpaMcHoccvzxCb0NEO04t7WpNbYcEYHtOjyGzwqdVC7Hc','miUA6dXqu3fP7ryBmWSn1xTyiYh09SYlGKBzLuSGK6I7D','BinhDC','TienPV',1,0,'paris-saint-germain-fc','arsenal','liverpool','bayern-munchen','manchester-city','tottenham-hotspur',7,NULL,NULL,NULL,NULL,'BinhDC','2023-12-06 09:24:59'),('Lz0jZGNRRiuHU3HB363Frilm8JxNQhjexTMChSY8J5N7W','nPAvcVBC2G2OIzIWZqThIqQYbTzNYwLuX9OQTnEAlMH0D','qRozSsEND3sbxmv2icruqKNgPpfG2LdgrJOypfztnLNDX','ToanTN','HaiNH',0,5,'juventus','arsenal','manchester-city','bayern-munchen','real-madrid','manchester-united',7,0,0,0,0,'HaiNH','2023-12-04 13:40:07'),('O0qtZLnrdu83ow2Tak23S44QMPrR81wdVPuY2zD49nIO4','DpF1jtflY4jNef9Toxa3n8kI7qoEQVPi1os2ijMYPu37F','Z7MIF1T3TYFiHIAj9Qd2JqfahnqEGFTzWWK863yKcmliq','TienPV','ThanhBT',3,0,'liverpool','arsenal','manchester-city','real-madrid','manchester-united','bayern-munchen',7,0,0,0,0,'TienPV','2023-12-05 12:25:30'),('pd1lxNTT9lPVOI35TIe1X3ilDdBxnXBC7y7N7to0Wce1W','RIbBbK2UbMHZFE7a2XZ52VClMuV035fsK5oUZIdnpe1s4','flZngoJ05R2IAbokZgh0Mxj1Gd6vvqqqSJ71Q5JReQvAo','ChinhHV','HaiBQ',1,0,'manchester-city','napoli','paris-saint-germain-fc','real-madrid','liverpool','bayern-munchen',7,2,0,0,0,'ChinhHV','2023-12-05 12:24:10'),('pITIKyKd64uhSVCj1z9rbWz96wFuUZsSZRRBdkqUaVYMe','Fxt9ZBqtj4n3ayudnG1TXH0MuW66bxvnxxFpEgIHL91T3','U1FAdLza8lIp1298nOL7x4s6sDeVzyCEsH5VvKIXmL4Jf','ToanHH','HaiNH',0,7,'liverpool','barcelona','al-nassr-saudi','manchester-city','arsenal','real-madrid',7,NULL,NULL,NULL,NULL,'HaiNH','2023-12-06 09:21:22');
/*!40000 ALTER TABLE `match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player` (
  `name` varchar(45) NOT NULL,
  `alias` varchar(225) DEFAULT NULL,
  `avatar` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES ('BinhDC',NULL,'https://ssvsports.work/img/avatar/binhdc.png'),('ChinhHV',NULL,'https://ssvsports.work/img/avatar/chinhhv.jpg'),('HaiBQ',NULL,'https://ssvsports.work/img/avatar/haibq.jpg'),('HaiNH',NULL,'https://ssvsports.work/img/avatar/hainh.png'),('TaiNM',NULL,'https://ssvsports.work/img/avatar/tainm.png'),('ThanhBT',NULL,'https://ssvsports.work/img/avatar/thanhbt.png'),('TienPV',NULL,'https://ssvsports.work/img/avatar/tienpv.jpg'),('ToanHH',NULL,'https://ssvsports.work/img/avatar/toanhh.png'),('ToanTN',NULL,'https://ssvsports.work/img/avatar/toantn.png');
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-07 11:35:31
