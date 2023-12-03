CREATE DATABASE  IF NOT EXISTS `ssvleague` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ssvleague`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: ssvleague
-- ------------------------------------------------------
-- Server version	8.0.35

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
  `winner` varchar(45) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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

-- Dump completed on 2023-12-03 22:48:43
