-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: ssvleague
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(125) NOT NULL,
  `role` int DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'haibq','$2b$10$.hC.SLzzUEIsPeClMVi2OeNfAiA1VOP/DLizBL6K7ZN9VNQ7c43/a',99,'2023-12-11 23:32:57'),(2,'hainh','$2b$10$Hig.D5ptQDJhkfKamZyuyOVTIc9pO.oT8rhTwWQuKvaNyU6hz8N2W',1,'2023-12-12 08:42:31'),(3,'toantn','$2b$10$FkOucjc5AL4ouGHdndQvdun5OGtjlyELe478N2fgq/uhQC1ONRb5e',NULL,'2023-12-12 08:44:55'),(4,'haihang','$2b$10$Hat.Xyu1qM44TCsYoX4Vt.N9BQHIhZgCO.mMB4SbApn/uc1wjG5vu',1,'2023-12-19 10:28:45');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Temporary view structure for view `favorite_club`
--

DROP TABLE IF EXISTS `favorite_club`;
/*!50001 DROP VIEW IF EXISTS `favorite_club`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `favorite_club` AS SELECT 
 1 AS `alias`,
 1 AS `name`,
 1 AS `match`,
 1 AS `win`,
 1 AS `rate`*/;
SET character_set_client = @saved_cs_client;

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
INSERT INTO `match` VALUES ('1S4UekkbS5u2TQk6Nf0JzVRmxyhbMAxtGCvfGw6mx0drh','7KTR9at8iK3VRPb45isBNhXmaqK4z8takLJM7vUnv9RDr','HKL1FUqhV1KeCydtixKCz4YNzJ1Ru1ArcrpQz3BDK7srL','ToanHH','ToanTN',0,0,'manchester-city','paris-saint-germain-fc','as-roma','bayern-munchen','liverpool','real-madrid',7,NULL,NULL,NULL,NULL,NULL,'2023-12-14 13:43:09'),('1Sgezjk8090hMsq8Fs8aRctURVdECnInDwTvuzZsKFcAV','hv0GGXgNFts3HfHYKdHPIGvbPC8ybH4fBVoP3pRiKsjxZ','hOGmSTio7MWxacO0SIOCFQLZL9phZJc5lxqtriLrVpi4q','TaiNM','ChinhHV',1,1,'bayern-munchen','paris-saint-germain-fc','manchester-city','real-madrid','liverpool','arsenal',7,0,0,0,0,NULL,'2023-12-11 09:11:37'),('34HlytCR01oYxPcvBWk81poIUN8qAisJUFFEcfxUn6758','GtpOWYiBWcze2UB2YS7JF5mh0wV0zFCkObCkSv6JfKuY9','3tgntbCdOQ5XrLebOB4bUgXkdIspgg4xBI02NrS7Vojzb','TaiNM','ToanHH',3,1,'real-madrid','paris-saint-germain-fc','manchester-city','atletico-madrid','liverpool','bayern-munchen',7,NULL,NULL,NULL,NULL,'TaiNM','2023-12-15 09:15:53'),('41ghy7PZWugUuehOLKjy4OBNgOIOw4itujjfgddjGvXlE','9bFbk9eFCAl2XWIQOpKs4huEBmeShpq4fci6OBkjwEcb3','d1qWEitJfdoglFP8AoOeZrfGSPUlklo2eVhXYa3mPEu1K','HaiNH','TienPV',3,1,'bayern-munchen','liverpool','paris-saint-germain-fc','arsenal','manchester-city','real-madrid',7,NULL,1,NULL,NULL,'HaiNH','2023-12-13 09:14:35'),('9CEx1pAiKBK8VuDHAekml8tdaskD2WjTcuY8n3s6WnQMX','l1LcdC5no1eBaUu4DBF7Igmp4lIbxI3PtpSnQfjQHhJgR','GvyQKTV880Vu936bVUSaHrOR2cMmeW0ouBby0pEv1JeWv','HaiNH','ChinhHV',3,3,'barcelona','bayern-munchen','manchester-city','arsenal','liverpool','paris-saint-germain-fc',7,NULL,NULL,NULL,NULL,NULL,'2023-12-07 09:25:44'),('A7a2QnAAzAGrL4sz8sJ8POS67O6IIbOKGYjejw3mDGLfk','oH879m72j5qUObapm3mEfla5mY4FAEeaSYoEuKtFCcFsB','RcyQskjqlpV3lblG1DdTTVf4Ju8xfpoUUlo5tX3xHbiJu','BinhDC','HaiBQ',3,0,'manchester-city','bayern-munchen','liverpool','paris-saint-germain-fc','arsenal','tottenham-hotspur',7,0,0,0,0,'BinhDC','2023-12-07 09:26:22'),('bWPGw0vYl5OTFpVECr7XupSFZxA3i0nAODGB0r36pxwKn','6gb1yMYmxmKvbQPJx1mBBiJWKD9a5q1wPHrpye4CeoIhl','LuxQpbUzmW25H9JayPsAw9Ffn86EPVgOqxElHlKQM5Hk8','BinhDC','HaiNH',1,1,'bayern-munchen','liverpool','arsenal','manchester-city','real-madrid','paris-saint-germain-fc',7,NULL,NULL,NULL,NULL,NULL,'2023-12-15 10:55:57'),('CMm4XmOjFzj6biGuf7WimxUnfmmBneCd6vVXf5q9qUWOu','zEdB8Cw5NmxJGxriuYogOhsSELqPL8rAvGH7sAdJS3PNX','DauTe58Xvmrer4pY36gCm5McSaC9UUGAVGpoI9n4kXoIR','ThanhBT','TaiNM',0,2,'paris-saint-germain-fc','real-madrid','bayern-munchen','manchester-city','chelsea','liverpool',7,NULL,NULL,NULL,NULL,'TaiNM','2023-12-13 09:13:18'),('hox9mbtIf9wOcQuLc3I1eUKqqrPZM2GcqXkjYdmdR0Yj7','fY53zPW0GK7Kxxmej7kmiBdbtscFTJg6ruAJPD3bo5mVO','upKU7Q8wmh9KvdotY21cpz0S0eHdgnVVtuEl1J6R8JrHR','ToanHH','ThanhBT',1,0,'real-madrid','bayern-munchen','ac-milan','manchester-city','juventus','paris-saint-germain-fc',7,1,1,0,0,'ToanHH','2023-12-04 13:21:35'),('kBM6aPG0Z4vCjjDwfVae4CoJSZEg4OkXCCqMulQrfDEj9','RSaK0Sh54lcOcvp88FdHq2vMmA6244tBV41E89D1vHMsK','cFPJGEzQsBxgVUEySz1rfjCLHQrYbyvbqe9A3GtNOY9vt','ThanhBT','HaiNH',0,5,'manchester-city','arsenal','bayern-munchen','real-madrid','paris-saint-germain-fc','liverpool',7,1,NULL,NULL,NULL,'HaiNH','2023-12-14 10:39:13'),('kfSW2FtrRPhiAnVodnhYRCKcTGWFgXXLryZfUI7rsrMqX','jyYv1WtRqqsqaCacdh5hzwnC2mYIVI6Xj4DL87KuL3V5H','HZqejCUpdDoasxznmegSmAOthgLPIWKVgG7CMX3Fhzaim','BinhDC','ToanHH',0,0,'bayern-munchen','real-madrid','liverpool','paris-saint-germain-fc','arsenal','manchester-city',7,NULL,NULL,NULL,NULL,NULL,'2023-12-11 14:02:17'),('kibUSN9CLZsAG2q0SmEaEtOj8XwiDZcq79i4tUQxCRVyb','MciJTsnXcTYcZfzXbqGgvGU5vfIrS9ds1up1YjiACE6ql','TN3YKuid7jwulVDLQ4aQxL0r7OCrHMSwZ3hk6Fs5rNYnZ','TaiNM','HaiBQ',0,1,'bayern-munchen','arsenal','liverpool','real-madrid','manchester-city','atletico-madrid',7,NULL,NULL,NULL,NULL,'HaiBQ','2023-12-20 10:58:14'),('LmCIPE2FRbq2lOWjFfiGoxr8VKNvESuFHVZLbhR4dtlEo','NpaMcHoccvzxCb0NEO04t7WpNbYcEYHtOjyGzwqdVC7Hc','miUA6dXqu3fP7ryBmWSn1xTyiYh09SYlGKBzLuSGK6I7D','BinhDC','TienPV',1,0,'paris-saint-germain-fc','arsenal','liverpool','bayern-munchen','manchester-city','tottenham-hotspur',7,NULL,NULL,NULL,NULL,'BinhDC','2023-12-06 09:24:59'),('Lz0jZGNRRiuHU3HB363Frilm8JxNQhjexTMChSY8J5N7W','nPAvcVBC2G2OIzIWZqThIqQYbTzNYwLuX9OQTnEAlMH0D','qRozSsEND3sbxmv2icruqKNgPpfG2LdgrJOypfztnLNDX','ToanTN','HaiNH',0,5,'juventus','arsenal','manchester-city','bayern-munchen','real-madrid','manchester-united',7,0,0,0,0,'HaiNH','2023-12-04 13:40:07'),('miKba5AJzagCFaGeV8cdyowNNPPDmv5RzWNXjqmshRibu','DqRywswJTIZ037vqCSAzaUHvzuRDBnZhOVGktLzkkQ7Qt','0yDV0YaoA0HJvlMXIFCvAGLIrqsVDYgtoIPdOAhoj3PI1','ToanTN','TienPV',0,3,'liverpool','paris-saint-germain-fc','arsenal','real-madrid','bayern-munchen','manchester-city',7,1,NULL,NULL,NULL,'TienPV','2023-12-12 12:58:16'),('mQJf8AQwDWPBQWiwc7S1KNOaEm8i6ZKgq5kHVYLokxRH8','NXUauJTKS1JY60vqKZ8NpgaQOxeXK4WvgU3NMuzmDUZY2','IcjV14Mjie2bZU2PwzdNjZhWbWBR2jjwKBOIyb5ElTOxT','TienPV','HaiBQ',1,0,'tottenham-hotspur','napoli','paris-saint-germain-fc','liverpool','arsenal','manchester-city',7,NULL,NULL,NULL,NULL,'TienPV','2023-12-18 13:18:57'),('NllMAOEArqCGYW7owYK9q2pM5GEjTDdOmGUqdoHTBNCTc','IPIfj8p70RwJrd2k1EO8edcjNUgmmldaSfK04F28HsnjU','gblQgSGVPSmWMSxzkVVPCavuFD0bmuYxEa3dkbzrX4DIz','BinhDC','TaiNM',1,1,'arsenal','atletico-madrid','liverpool','manchester-city','real-madrid','bayern-munchen',7,NULL,1,NULL,NULL,NULL,'2023-12-12 08:39:59'),('nQS8b2gXQKy8nOz9x1yJN4v3uSHosKMoThGOSDk1XmMAd','2xPRja3wY3Ef6IHzClq9vnXOoSK5x9rpq8Qag3Y3LlpIt','EUOKEpCxdKg4C7lreCWz6B5KnOujbrL95vXUDbuSm5JFe','ThanhBT','ChinhHV',1,3,'bayern-munchen','arsenal','liverpool','real-madrid','paris-saint-germain-fc','manchester-city',7,1,NULL,NULL,NULL,'ChinhHV','2023-12-20 08:29:13'),('NUDdMlaLdiJI8glEIx8VftLTSya3bLfiIL6DjsQXhbgC1','EATG6jRIvlKBAO5iJcIu0ETfCapDbxcBXNzWhrVpiiYxT','kj4WBgCAjVBpFTm2nsK7YGpaGogi7nWW9ODNywSqKN38a','HaiBQ','HaiNH',1,4,'liverpool','arsenal','bayern-munchen','manchester-city','barcelona','paris-saint-germain-fc',7,0,0,0,0,'HaiNH','2023-12-08 17:52:56'),('Nzb1MCBs5oz7EVzacrPmaZLgl37vOxDlVnQNYklqFtKoK','bzslTFzE3LrYol24JUU9a65x18W5RKsizoKXjVPYgdZ0f','1vak6x7JJ0IaW73qFoBC59qwiRt6BFUZONLpJdnAr2ihS','HaiBQ','ToanTN',4,0,'arsenal','manchester-united','paris-saint-germain-fc','manchester-city','al-nassr-saudi','bayern-munchen',7,NULL,NULL,NULL,NULL,'HaiBQ','2023-12-11 09:14:34'),('O0qtZLnrdu83ow2Tak23S44QMPrR81wdVPuY2zD49nIO4','DpF1jtflY4jNef9Toxa3n8kI7qoEQVPi1os2ijMYPu37F','Z7MIF1T3TYFiHIAj9Qd2JqfahnqEGFTzWWK863yKcmliq','TienPV','ThanhBT',3,0,'liverpool','arsenal','manchester-city','real-madrid','manchester-united','bayern-munchen',7,0,0,0,0,'TienPV','2023-12-05 12:25:30'),('o0T4OKf6D3Ay0E1sbuDtW4BsYLAvopXa0LdprxDZZvuat','HvjXlAw8OdRapQQRJiVtqqan3z8ZechddMBUOXMqxHUbE','AAzBGg1qmjBjLem082Oc4s3Q9AxgEiGnOoISYrIg2Czd9','TaiNM','TienPV',3,1,'atletico-madrid','napoli','manchester-city','bayern-munchen','liverpool','real-madrid',7,NULL,NULL,NULL,NULL,'TaiNM','2023-12-14 09:55:20'),('pd1lxNTT9lPVOI35TIe1X3ilDdBxnXBC7y7N7to0Wce1W','RIbBbK2UbMHZFE7a2XZ52VClMuV035fsK5oUZIdnpe1s4','flZngoJ05R2IAbokZgh0Mxj1Gd6vvqqqSJ71Q5JReQvAo','ChinhHV','HaiBQ',1,0,'manchester-city','napoli','paris-saint-germain-fc','real-madrid','liverpool','bayern-munchen',7,2,0,0,0,'ChinhHV','2023-12-05 12:24:10'),('pITIKyKd64uhSVCj1z9rbWz96wFuUZsSZRRBdkqUaVYMe','Fxt9ZBqtj4n3ayudnG1TXH0MuW66bxvnxxFpEgIHL91T3','U1FAdLza8lIp1298nOL7x4s6sDeVzyCEsH5VvKIXmL4Jf','ToanHH','HaiNH',0,7,'liverpool','barcelona','al-nassr-saudi','manchester-city','arsenal','real-madrid',7,NULL,NULL,NULL,NULL,'HaiNH','2023-12-06 09:21:22'),('qEqcGpByTzbhYpzbkcMikSl3trtC8BT2x58kWFZq0pn6C','Ij8UKf4cNRgXlFZXWMa0gkSgEBcObjVKZDiw3Ui841tvn','hmR5m0Z4HQoKR0zRiLrRfsZmbFiwlZCQuWxfcQOGdmmmJ','ChinhHV','TienPV',0,2,'real-madrid','tottenham-hotspur','paris-saint-germain-fc','manchester-city','bayern-munchen','liverpool',7,0,0,0,0,'TienPV','2023-12-19 12:48:57'),('qvI3cc48Oal5PpjZpDwSHFHy3mR5Z7CThu9DVykq598oA','NwFdvBwaEhJTjKkLylpbxw3mug0t7WShXWw1BN5CGWrEM','FqhvbqgOPHtyvjg0N2fJMmQ4vfuzRxw0EMgKEc23EVz6W','ThanhBT','HaiBQ',0,4,'paris-saint-germain-fc','liverpool','arsenal','real-madrid','manchester-city','bayern-munchen',7,1,NULL,NULL,NULL,'HaiBQ','2023-12-15 09:16:30'),('Rmt9aFPKmXgmuV4Q0qrZ3RYXot3lsw1tp1EFFAFXdyXYE','xnD2iPNgXVufES2Kfd6xJoqwg4Z0ncPUfF3ymeBwnsVVb','ZYOkE9xqoFcX96TVeYOQBLCJYIViZXBTcJodKsphBtFzR','TienPV','ToanHH',0,0,'manchester-city','real-madrid','al-nassr-saudi','arsenal','liverpool','paris-saint-germain-fc',7,NULL,NULL,NULL,NULL,NULL,'2023-12-08 08:43:21'),('rsB631eKNWR8Zgk7aippKhUTWGIoxloLRPI0HIlxLgYlx','SqT8XcDkXE2HfISatNxmQeNIBveZb00q9EtADVBhXDY8w','K7Wcoyg68JRxCWYx7LRurNQj4oZnccdIQjcPFs6rVOUz6','ChinhHV','ToanHH',1,1,'bayern-munchen','real-madrid','sevilla-fc','liverpool','manchester-city','paris-saint-germain-fc',7,0,0,0,0,NULL,'2023-12-19 10:30:02'),('rUO18vX9dqPsBl8IVKpK4SnBCWqTpiMO82V12sW0C2kBG','4vXkSgckSdBy70uGYvEmAriG0dMGaCOuYCK74f5RowTUw','5k7D9D6RW3XwMaleyEt4vUu3qWRzoqVvRqyGGKIBqaSe7','TaiNM','HaiNH',NULL,NULL,NULL,NULL,'manchester-city',NULL,NULL,NULL,-1,NULL,NULL,NULL,NULL,NULL,'2023-12-15 09:14:30'),('S0FKlM5OoGG3wrxcGRSazrkspOO1lGnagkn4ABEXRLyrb','epjTRUjqs5jL7OYdL3gh25JS1AroSJTWD9rqfOOQKXZ55','TwUS309jRrqbsMkuxmWev0kwHXbkaJgEMOxljneAE5kuQ','ToanTN','ThanhBT',0,0,'as-roma','manchester-city','internazionale-milano','tottenham-hotspur','ajax','newcastle-united',7,1,1,0,0,NULL,'2023-12-08 08:43:11'),('SrVSbaiRSl8a6nHPCQBFjbqVAsu0UGxoBeBGxnpwBua3U','2CE4Ezy8yL4ZFvICocOIWd4j4f9b29wOXjDQeOW5odCHA','glJSkjQPckusRQi27MsgMbzDVut0YdknMsW7q3Qwpwwzu','TaiNM','HaiNH',0,1,'real-madrid','arsenal','manchester-city','atletico-madrid','liverpool','bayern-munchen',7,0,0,0,0,'HaiNH','2023-12-21 08:39:43'),('t8m3oycIJCNYE0LeJBXeatJWSus88OvxYuJjoFx5M6O82','yCMVLd1jPhthadt1luzkF2CTHiA11dHVFJ6HLPhK1EAVB','78vvanTaphxRHl1paKoJ3UpW8pKckBGWocZvDP9VoCQtA','ToanHH','HaiBQ',0,6,'bayern-munchen','arsenal','liverpool','real-madrid','manchester-city','al-nassr-saudi',7,0,0,0,0,'HaiBQ','2023-12-08 09:26:55'),('VD6yLP5hR674IRPE5KT8NBZ6qazFr453DPlNb2S6qfvrs','pa0cjUb4OPCOSLK5CVv23dnzvfZ0Mf8GDT2YjmMrcIo6V','ZpNqMTS3DLTXomalk7qg6uTpyPZpWZSiSoQ5JZBlCRDEC','ThanhBT','BinhDC',0,1,'bayern-munchen','manchester-city','liverpool','paris-saint-germain-fc','arsenal','ac-milan',7,1,NULL,NULL,NULL,'BinhDC','2023-12-12 12:57:39'),('yCRI08RLZUaiM5taZjppjGZOnk3ywo26kRU09OTIoFBI2','KpMADLYxLocSqwODezxwXWptzIkHPTMnM9VeOMqUS1ak1','UkAnAYORSm5TFykgvzlk1owaLGXU5zwrf35y2CtRiVY77','BinhDC','ToanTN',2,0,'bayern-munchen','internazionale-milano','liverpool','manchester-city','real-madrid','arsenal',7,NULL,NULL,NULL,NULL,'BinhDC','2023-12-13 09:14:01'),('yOspOjSaGKK8f7FRSkNkKE8TpOCPrCcMkFHi7sQpZlJi9','esUQu0ePAS2sH2t5AxsKjR8dn67cHDOMVmVuDPVUqFVwL','nABEtC7mmcwrvYTixlfFkmDMrprYP0aOznQqTDdujRZr3','ChinhHV','ToanTN',1,0,'liverpool','real-madrid','al-nassr-saudi','inter_miami','tottenham-hotspur','manchester-city',7,NULL,NULL,NULL,NULL,'ChinhHV','2023-12-12 08:40:51'),('Z25WOFk2DUfdjhiu5IijUWDoH3bLmY8reRGSrrLTuQDUP','T8iAaknsWUj8Hn4GZRBSXpfejdULQtDc9brhpZy0IcjEZ','jetsN5OcRJ1FSkyLCGCpI1OsF7pX1foK2Sps4XB7EysA6','ChinhHV','BinhDC',0,2,'arsenal','paris-saint-germain-fc','manchester-city','liverpool','bayern-munchen','real-madrid',7,NULL,NULL,NULL,NULL,'BinhDC','2023-12-21 08:35:43'),('Z8PedmtxThB4lwOanDdbSEOXBi34wIoZP1uTsFBLToRgk','J4afLDenOP24Mk4HCMV3PfmM6QHxy0pA01TVRAGcCkbkC','xjg6vPa45DcaBow6stS5lkCRAfnC59YGHq5pOuLO8HiUt','TaiNM','ToanTN',1,0,'atletico-madrid','real-madrid','barcelona','paris-saint-germain-fc','internazionale-milano','manchester-city',7,NULL,NULL,NULL,NULL,'TaiNM','2023-12-22 09:23:44');
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
  `avatar` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES ('BinhDC','https://ssvsports.work/img/avatar/binhdc.png'),('ChinhHV','https://ssvsports.work/img/avatar/chinhhv.jpg'),('HaiBQ','https://ssvsports.work/img/avatar/haibq.jpg'),('HaiNH','https://ssvsports.work/img/avatar/hainh.png'),('TaiNM','https://ssvsports.work/img/avatar/tainm.png'),('ThanhBT','https://ssvsports.work/img/avatar/thanhbt.png'),('TienPV','https://ssvsports.work/img/avatar/tienpv.jpg'),('ToanHH','https://ssvsports.work/img/avatar/toanhh.png'),('ToanTN','https://ssvsports.work/img/avatar/toantn.png');
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `rank`
--

DROP TABLE IF EXISTS `rank`;
/*!50001 DROP VIEW IF EXISTS `rank`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `rank` AS SELECT 
 1 AS `player`,
 1 AS `avatar`,
 1 AS `goal_win`,
 1 AS `goal_lose`,
 1 AS `win`,
 1 AS `lose`,
 1 AS `draw`,
 1 AS `yellow_card`,
 1 AS `red_card`,
 1 AS `matched`,
 1 AS `difference`,
 1 AS `point`,
 1 AS `nearest`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `top_attack_club`
--

DROP TABLE IF EXISTS `top_attack_club`;
/*!50001 DROP VIEW IF EXISTS `top_attack_club`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `top_attack_club` AS SELECT 
 1 AS `club`,
 1 AS `goal`,
 1 AS `alias`,
 1 AS `match`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `top_bad_play`
--

DROP TABLE IF EXISTS `top_bad_play`;
/*!50001 DROP VIEW IF EXISTS `top_bad_play`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `top_bad_play` AS SELECT 
 1 AS `player`,
 1 AS `avatar`,
 1 AS `yellow_card`,
 1 AS `red_card`,
 1 AS `fair_play_point`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `top_conceded_club`
--

DROP TABLE IF EXISTS `top_conceded_club`;
/*!50001 DROP VIEW IF EXISTS `top_conceded_club`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `top_conceded_club` AS SELECT 
 1 AS `club`,
 1 AS `goal`,
 1 AS `alias`,
 1 AS `match`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `top_defended`
--

DROP TABLE IF EXISTS `top_defended`;
/*!50001 DROP VIEW IF EXISTS `top_defended`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `top_defended` AS SELECT 
 1 AS `player`,
 1 AS `goal`,
 1 AS `avatar`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `top_goal`
--

DROP TABLE IF EXISTS `top_goal`;
/*!50001 DROP VIEW IF EXISTS `top_goal`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `top_goal` AS SELECT 
 1 AS `player`,
 1 AS `goal`,
 1 AS `avatar`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'ssvleague'
--

--
-- Final view structure for view `favorite_club`
--

/*!50001 DROP VIEW IF EXISTS `favorite_club`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `favorite_club` AS select `club`.`alias` AS `alias`,`club`.`name` AS `name`,sum(`dt`.`match`) AS `match`,sum(`dt`.`win`) AS `win`,concat(round(((sum(`dt`.`win`) * 100) / sum(`dt`.`match`)),0),'%') AS `rate` from ((select `b`.`home_club` AS `name`,count(`b`.`home_club`) AS `match`,(select count(`a`.`key`) from `match` `a` where ((`a`.`home_player` = `a`.`winner`) and (`a`.`home_club` = `b`.`home_club`) and (`a`.`ban_pick_state` = 7))) AS `win` from `match` `b` where (`b`.`ban_pick_state` = 7) group by `b`.`home_club` union all select `b`.`away_club` AS `name`,count(`b`.`away_club`) AS `match`,(select count(`a`.`key`) from `match` `a` where ((`a`.`away_player` = `a`.`winner`) and (`a`.`away_club` = `b`.`away_club`) and (`a`.`ban_pick_state` = 7))) AS `win` from `match` `b` where (`b`.`ban_pick_state` = 7) group by `b`.`away_club`) `dt` join `club` on((`dt`.`name` = `club`.`name`))) group by `club`.`name`,`club`.`alias` order by `match` desc limit 5 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `rank`
--

/*!50001 DROP VIEW IF EXISTS `rank`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `rank` AS select `data`.`player` AS `player`,`data`.`avatar` AS `avatar`,`data`.`goal_win` AS `goal_win`,`data`.`goal_lose` AS `goal_lose`,`data`.`win` AS `win`,`data`.`lose` AS `lose`,`data`.`draw` AS `draw`,`data`.`yellow_card` AS `yellow_card`,`data`.`red_card` AS `red_card`,((`data`.`win` + `data`.`lose`) + `data`.`draw`) AS `matched`,(`data`.`goal_win` - `data`.`goal_lose`) AS `difference`,((`data`.`win` * 3) + `data`.`draw`) AS `point`,(select group_concat(`nearest`.`result` separator ',') from (select if((`m`.`winner` is null),1,if((`m`.`winner` = `data`.`player`),2,3)) AS `result` from `match` `m` where (((`m`.`home_player` = `data`.`player`) or (`m`.`away_player` = `data`.`player`)) and (`m`.`ban_pick_state` = 7)) order by `m`.`date` desc limit 5) `nearest`) AS `nearest` from (select `data`.`name` AS `player`,`data`.`avatar` AS `avatar`,sum(`data`.`goal`) AS `goal_win`,sum(`data`.`conceded`) AS `goal_lose`,sum(`data`.`win`) AS `win`,sum(`data`.`lose`) AS `lose`,sum(`data`.`draw`) AS `draw`,sum(`data`.`yellow_card`) AS `yellow_card`,sum(`data`.`red_card`) AS `red_card` from (select `p`.`name` AS `name`,`p`.`avatar` AS `avatar`,sum(if((`m`.`home_goal` > `m`.`away_goal`),1,0)) AS `win`,sum(if((`m`.`home_goal` = `m`.`away_goal`),1,0)) AS `draw`,sum(if((`m`.`home_goal` < `m`.`away_goal`),1,0)) AS `lose`,sum(ifnull(`m`.`home_goal`,0)) AS `goal`,sum(ifnull(`m`.`away_goal`,0)) AS `conceded`,sum(ifnull(`m`.`home_yellow_card`,0)) AS `yellow_card`,sum(ifnull(`m`.`home_red_card`,0)) AS `red_card` from (`player` `p` left join `match` `m` on(((`m`.`home_player` = `p`.`name`) and (`m`.`ban_pick_state` = 7)))) group by `p`.`name`,`p`.`avatar` union all select `p`.`name` AS `name`,`p`.`avatar` AS `avatar`,sum(if((`m`.`away_goal` > `m`.`home_goal`),1,0)) AS `win`,sum(if((`m`.`away_goal` = `m`.`home_goal`),1,0)) AS `draw`,sum(if((`m`.`away_goal` < `m`.`home_goal`),1,0)) AS `lose`,sum(ifnull(`m`.`away_goal`,0)) AS `goal`,sum(ifnull(`m`.`home_goal`,0)) AS `conceded`,sum(ifnull(`m`.`away_yellow_card`,0)) AS `yellow_card`,sum(ifnull(`m`.`away_red_card`,0)) AS `red_card` from (`player` `p` left join `match` `m` on(((`m`.`away_player` = `p`.`name`) and (`m`.`ban_pick_state` = 7)))) group by `p`.`name`,`p`.`avatar`) `data` group by `data`.`name`,`data`.`avatar`) `data` order by ((`data`.`win` * 3) + `data`.`draw`) desc,(`data`.`goal_win` - `data`.`goal_lose`) desc,(`data`.`yellow_card` + (`data`.`red_card` * 3)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top_attack_club`
--

/*!50001 DROP VIEW IF EXISTS `top_attack_club`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `top_attack_club` AS select `score`.`club` AS `club`,sum(`score`.`goal`) AS `goal`,`club`.`alias` AS `alias`,sum(`score`.`match`) AS `match` from ((select `match`.`home_club` AS `club`,sum(`match`.`home_goal`) AS `goal`,count(`match`.`home_club`) AS `match` from `match` where (`match`.`ban_pick_state` = 7) group by `match`.`home_club` union all select `match`.`away_club` AS `club`,sum(`match`.`away_goal`) AS `goal`,count(`match`.`away_club`) AS `match` from `match` where (`match`.`ban_pick_state` = 7) group by `match`.`away_club`) `score` join `club` on((`score`.`club` = `club`.`name`))) group by `score`.`club` order by `goal` desc limit 5 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top_bad_play`
--

/*!50001 DROP VIEW IF EXISTS `top_bad_play`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `top_bad_play` AS select `card`.`player` AS `player`,`player`.`avatar` AS `avatar`,sum(`card`.`yellow_card`) AS `yellow_card`,sum(`card`.`red_card`) AS `red_card`,((sum(`card`.`red_card`) * 3) + sum(`card`.`yellow_card`)) AS `fair_play_point` from ((select `match`.`home_player` AS `player`,sum(ifnull(`match`.`home_yellow_card`,0)) AS `yellow_card`,sum(ifnull(`match`.`home_red_card`,0)) AS `red_card` from `match` where (`match`.`ban_pick_state` = 7) group by `match`.`home_player` union all select `match`.`away_player` AS `player`,sum(ifnull(`match`.`away_yellow_card`,0)) AS `yellow_card`,sum(ifnull(`match`.`away_red_card`,0)) AS `red_card` from `match` where (`match`.`ban_pick_state` = 7) group by `match`.`away_player`) `card` join `player` on((`player`.`name` = `card`.`player`))) group by `card`.`player` order by `fair_play_point` desc limit 5 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top_conceded_club`
--

/*!50001 DROP VIEW IF EXISTS `top_conceded_club`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `top_conceded_club` AS select `score`.`club` AS `club`,sum(`score`.`goal`) AS `goal`,`club`.`alias` AS `alias`,sum(`score`.`match`) AS `match` from ((select `match`.`home_club` AS `club`,sum(`match`.`away_goal`) AS `goal`,count(`match`.`home_club`) AS `match` from `match` where (`match`.`ban_pick_state` = 7) group by `match`.`home_club` union all select `match`.`away_club` AS `club`,sum(`match`.`home_goal`) AS `goal`,count(`match`.`away_club`) AS `match` from `match` where (`match`.`ban_pick_state` = 7) group by `match`.`away_club`) `score` join `club` on((`score`.`club` = `club`.`name`))) group by `score`.`club` order by `goal` desc limit 5 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top_defended`
--

/*!50001 DROP VIEW IF EXISTS `top_defended`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `top_defended` AS select `score`.`player` AS `player`,sum(`score`.`goal`) AS `goal`,`player`.`avatar` AS `avatar` from ((select `match`.`home_player` AS `player`,sum(`match`.`away_goal`) AS `goal` from `match` where (`match`.`ban_pick_state` = 7) group by `match`.`home_player` union all select `match`.`away_player` AS `player`,sum(`match`.`home_goal`) AS `goal` from `match` where (`match`.`ban_pick_state` = 7) group by `match`.`away_player`) `score` join `player` on((`player`.`name` = `score`.`player`))) group by `score`.`player` order by `goal` limit 5 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top_goal`
--

/*!50001 DROP VIEW IF EXISTS `top_goal`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `top_goal` AS select `score`.`player` AS `player`,sum(`score`.`goal`) AS `goal`,`player`.`avatar` AS `avatar` from ((select `match`.`home_player` AS `player`,sum(`match`.`home_goal`) AS `goal` from `match` where (`match`.`ban_pick_state` = 7) group by `match`.`home_player` union all select `match`.`away_player` AS `player`,sum(`match`.`away_goal`) AS `goal` from `match` where (`match`.`ban_pick_state` = 7) group by `match`.`away_player`) `score` join `player` on((`player`.`name` = `score`.`player`))) group by `score`.`player` order by `goal` desc limit 5 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-25  9:52:11
