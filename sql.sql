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
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `club`
--

DROP TABLE IF EXISTS club;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE club (
  `name` varchar(45) NOT NULL,
  alias varchar(45) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `club`
--

INSERT INTO club VALUES ('ac-milan','AC Milan');
INSERT INTO club VALUES ('ajax','Ajax');
INSERT INTO club VALUES ('al-nassr-saudi','AL Nassr');
INSERT INTO club VALUES ('arsenal','Arsenal');
INSERT INTO club VALUES ('as-roma','AS Roma');
INSERT INTO club VALUES ('atletico-madrid','Aletico Madrid');
INSERT INTO club VALUES ('barcelona','Barcelona');
INSERT INTO club VALUES ('bayer-leverkusen','Bayer Leverkusen');
INSERT INTO club VALUES ('bayern-munchen','Bayern Munchen');
INSERT INTO club VALUES ('borussia-dortmund','Dortmund');
INSERT INTO club VALUES ('chelsea','Chelsea');
INSERT INTO club VALUES ('inter_miami','Inter Miami');
INSERT INTO club VALUES ('internazionale-milano','Inter Milan');
INSERT INTO club VALUES ('juventus','Juventus');
INSERT INTO club VALUES ('liverpool','Liverpool');
INSERT INTO club VALUES ('manchester-city','Manchester City');
INSERT INTO club VALUES ('manchester-united','Manchester United');
INSERT INTO club VALUES ('napoli','Napoli');
INSERT INTO club VALUES ('newcastle-united','Newcastle');
INSERT INTO club VALUES ('paris-saint-germain-fc','PSG');
INSERT INTO club VALUES ('real-madrid','Real Madrid');
INSERT INTO club VALUES ('redbull-salzburg','Leipzig');
INSERT INTO club VALUES ('sevilla-fc','Sevilla');
INSERT INTO club VALUES ('tottenham-hotspur','Tottenham');

--
-- Temporary view structure for view `favorite_club`
--

DROP TABLE IF EXISTS favorite_club;
/*!50001 DROP VIEW IF EXISTS favorite_club*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `favorite_club` AS SELECT 
 1 AS alias,
 1 AS name,
 1 AS match,
 1 AS win,
 1 AS rate*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `match`
--

DROP TABLE IF EXISTS match;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `match` (
  `key` varchar(45) NOT NULL,
  home_player varchar(45) NOT NULL,
  away_player varchar(45) NOT NULL,
  home_goal int DEFAULT NULL,
  away_goal int DEFAULT NULL,
  home_club varchar(45) DEFAULT NULL,
  away_club varchar(45) DEFAULT NULL,
  home_banned_1 varchar(45) DEFAULT NULL,
  away_banned_1 varchar(45) DEFAULT NULL,
  home_banned_2 varchar(45) DEFAULT NULL,
  away_banned_2 varchar(45) DEFAULT NULL,
  ban_pick_state int DEFAULT '0',
  home_yellow_card int DEFAULT NULL,
  away_yellow_card int DEFAULT NULL,
  home_red_card int DEFAULT NULL,
  away_red_card int DEFAULT NULL,
  winner varchar(45) DEFAULT NULL,
  home_key varchar(45) NOT NULL,
  away_key varchar(45) NOT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match`
--

INSERT INTO match VALUES ('9CEx1pAiKBK8VuDHAekml8tdaskD2WjTcuY8n3s6WnQMX','HaiNH','ChinhHV',3,3,'barcelona','bayern-munchen','manchester-city','arsenal','liverpool','paris-saint-germain-fc',7,NULL,NULL,NULL,NULL,NULL,'l1LcdC5no1eBaUu4DBF7Igmp4lIbxI3PtpSnQfjQHhJgR','GvyQKTV880Vu936bVUSaHrOR2cMmeW0ouBby0pEv1JeWv','2023-12-07 09:25:44');
INSERT INTO match VALUES ('A7a2QnAAzAGrL4sz8sJ8POS67O6IIbOKGYjejw3mDGLfk','BinhDC','HaiBQ',3,0,'manchester-city','bayern-munchen','liverpool','paris-saint-germain-fc','arsenal','tottenham-hotspur',7,0,0,0,0,'BinhDC','oH879m72j5qUObapm3mEfla5mY4FAEeaSYoEuKtFCcFsB','RcyQskjqlpV3lblG1DdTTVf4Ju8xfpoUUlo5tX3xHbiJu','2023-12-07 09:26:22');
INSERT INTO match VALUES ('hox9mbtIf9wOcQuLc3I1eUKqqrPZM2GcqXkjYdmdR0Yj7','ToanHH','ThanhBT',1,0,'real-madrid','bayern-munchen','ac-milan','manchester-city','juventus','paris-saint-germain-fc',7,1,1,0,0,'ToanHH','fY53zPW0GK7Kxxmej7kmiBdbtscFTJg6ruAJPD3bo5mVO','upKU7Q8wmh9KvdotY21cpz0S0eHdgnVVtuEl1J6R8JrHR','2023-12-04 13:21:35');
INSERT INTO match VALUES ('LmCIPE2FRbq2lOWjFfiGoxr8VKNvESuFHVZLbhR4dtlEo','BinhDC','TienPV',1,0,'paris-saint-germain-fc','arsenal','liverpool','bayern-munchen','manchester-city','tottenham-hotspur',7,NULL,NULL,NULL,NULL,'BinhDC','NpaMcHoccvzxCb0NEO04t7WpNbYcEYHtOjyGzwqdVC7Hc','miUA6dXqu3fP7ryBmWSn1xTyiYh09SYlGKBzLuSGK6I7D','2023-12-06 09:24:59');
INSERT INTO match VALUES ('Lz0jZGNRRiuHU3HB363Frilm8JxNQhjexTMChSY8J5N7W','ToanTN','HaiNH',0,5,'juventus','arsenal','manchester-city','bayern-munchen','real-madrid','manchester-united',7,0,0,0,0,'HaiNH','nPAvcVBC2G2OIzIWZqThIqQYbTzNYwLuX9OQTnEAlMH0D','qRozSsEND3sbxmv2icruqKNgPpfG2LdgrJOypfztnLNDX','2023-12-04 13:40:07');
INSERT INTO match VALUES ('NUDdMlaLdiJI8glEIx8VftLTSya3bLfiIL6DjsQXhbgC1','HaiBQ','HaiNH',1,4,'liverpool','arsenal','bayern-munchen','manchester-city','barcelona','paris-saint-germain-fc',7,0,0,0,0,'HaiNH','EATG6jRIvlKBAO5iJcIu0ETfCapDbxcBXNzWhrVpiiYxT','kj4WBgCAjVBpFTm2nsK7YGpaGogi7nWW9ODNywSqKN38a','2023-12-08 17:52:56');
INSERT INTO match VALUES ('O0qtZLnrdu83ow2Tak23S44QMPrR81wdVPuY2zD49nIO4','TienPV','ThanhBT',3,0,'liverpool','arsenal','manchester-city','real-madrid','manchester-united','bayern-munchen',7,0,0,0,0,'TienPV','DpF1jtflY4jNef9Toxa3n8kI7qoEQVPi1os2ijMYPu37F','Z7MIF1T3TYFiHIAj9Qd2JqfahnqEGFTzWWK863yKcmliq','2023-12-05 12:25:30');
INSERT INTO match VALUES ('pd1lxNTT9lPVOI35TIe1X3ilDdBxnXBC7y7N7to0Wce1W','ChinhHV','HaiBQ',1,0,'manchester-city','napoli','paris-saint-germain-fc','real-madrid','liverpool','bayern-munchen',7,2,0,0,0,'ChinhHV','RIbBbK2UbMHZFE7a2XZ52VClMuV035fsK5oUZIdnpe1s4','flZngoJ05R2IAbokZgh0Mxj1Gd6vvqqqSJ71Q5JReQvAo','2023-12-05 12:24:10');
INSERT INTO match VALUES ('pITIKyKd64uhSVCj1z9rbWz96wFuUZsSZRRBdkqUaVYMe','ToanHH','HaiNH',0,7,'liverpool','barcelona','al-nassr-saudi','manchester-city','arsenal','real-madrid',7,NULL,NULL,NULL,NULL,'HaiNH','Fxt9ZBqtj4n3ayudnG1TXH0MuW66bxvnxxFpEgIHL91T3','U1FAdLza8lIp1298nOL7x4s6sDeVzyCEsH5VvKIXmL4Jf','2023-12-06 09:21:22');
INSERT INTO match VALUES ('Rmt9aFPKmXgmuV4Q0qrZ3RYXot3lsw1tp1EFFAFXdyXYE','TienPV','ToanHH',0,0,'manchester-city','real-madrid','al-nassr-saudi','arsenal','liverpool','paris-saint-germain-fc',7,NULL,NULL,NULL,NULL,NULL,'xnD2iPNgXVufES2Kfd6xJoqwg4Z0ncPUfF3ymeBwnsVVb','ZYOkE9xqoFcX96TVeYOQBLCJYIViZXBTcJodKsphBtFzR','2023-12-08 08:43:21');
INSERT INTO match VALUES ('S0FKlM5OoGG3wrxcGRSazrkspOO1lGnagkn4ABEXRLyrb','ToanTN','ThanhBT',0,0,'as-roma','manchester-city','internazionale-milano','tottenham-hotspur','ajax','newcastle-united',7,1,1,0,0,NULL,'epjTRUjqs5jL7OYdL3gh25JS1AroSJTWD9rqfOOQKXZ55','TwUS309jRrqbsMkuxmWev0kwHXbkaJgEMOxljneAE5kuQ','2023-12-08 08:43:11');
INSERT INTO match VALUES ('t8m3oycIJCNYE0LeJBXeatJWSus88OvxYuJjoFx5M6O82','ToanHH','HaiBQ',0,6,'bayern-munchen','arsenal','liverpool','real-madrid','manchester-city','al-nassr-saudi',7,0,0,0,0,'HaiBQ','yCMVLd1jPhthadt1luzkF2CTHiA11dHVFJ6HLPhK1EAVB','78vvanTaphxRHl1paKoJ3UpW8pKckBGWocZvDP9VoCQtA','2023-12-08 09:26:55');

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS player;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE player (
  `name` varchar(45) NOT NULL,
  avatar varchar(225) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

INSERT INTO player VALUES ('BinhDC','https://ssvsports.work/img/avatar/binhdc.png');
INSERT INTO player VALUES ('ChinhHV','https://ssvsports.work/img/avatar/chinhhv.jpg');
INSERT INTO player VALUES ('HaiBQ','https://ssvsports.work/img/avatar/haibq.jpg');
INSERT INTO player VALUES ('HaiNH','https://ssvsports.work/img/avatar/hainh.png');
INSERT INTO player VALUES ('TaiNM','https://ssvsports.work/img/avatar/tainm.png');
INSERT INTO player VALUES ('ThanhBT','https://ssvsports.work/img/avatar/thanhbt.png');
INSERT INTO player VALUES ('TienPV','https://ssvsports.work/img/avatar/tienpv.jpg');
INSERT INTO player VALUES ('ToanHH','https://ssvsports.work/img/avatar/toanhh.png');
INSERT INTO player VALUES ('ToanTN','https://ssvsports.work/img/avatar/toantn.png');

--
-- Temporary view structure for view `top_bad_play`
--

DROP TABLE IF EXISTS top_bad_play;
/*!50001 DROP VIEW IF EXISTS top_bad_play*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `top_bad_play` AS SELECT 
 1 AS player,
 1 AS avatar,
 1 AS yellow_card,
 1 AS red_card,
 1 AS fair_play_point*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `top_defended`
--

DROP TABLE IF EXISTS top_defended;
/*!50001 DROP VIEW IF EXISTS top_defended*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `top_defended` AS SELECT 
 1 AS player,
 1 AS goal,
 1 AS avatar*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `top_goal`
--

DROP TABLE IF EXISTS top_goal;
/*!50001 DROP VIEW IF EXISTS top_goal*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `top_goal` AS SELECT 
 1 AS player,
 1 AS goal,
 1 AS avatar*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `favorite_club`
--

/*!50001 DROP VIEW IF EXISTS favorite_club*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=root@localhost SQL SECURITY DEFINER */
/*!50001 VIEW favorite_club AS select club.alias AS alias,club.`name` AS `name`,sum(dt.`match`) AS `match`,sum(dt.win) AS win,concat(round(((sum(dt.win) * 100) / sum(dt.`match`)),0),'%') AS rate from ((select b.home_club AS `name`,count(b.home_club) AS `match`,(select count(a.`key`) from `match` a where ((a.home_player = a.winner) and (a.home_club = b.home_club))) AS win from `match` b group by b.home_club union all select b.away_club AS `name`,count(b.away_club) AS `match`,(select count(a.`key`) from `match` a where ((a.away_player = a.winner) and (a.away_club = b.away_club))) AS win from `match` b group by b.away_club) dt join club on((dt.`name` = club.`name`))) group by club.`name`,club.alias order by `match` desc limit 5 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top_bad_play`
--

/*!50001 DROP VIEW IF EXISTS top_bad_play*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=root@localhost SQL SECURITY DEFINER */
/*!50001 VIEW top_bad_play AS select card.player AS player,player.avatar AS avatar,sum(card.yellow_card) AS yellow_card,sum(card.red_card) AS red_card,((card.red_card * 3) + card.yellow_card) AS fair_play_point from ((select `match`.home_player AS player,sum(`match`.home_yellow_card) AS yellow_card,sum(`match`.home_red_card) AS red_card from `match` group by `match`.home_player union all select `match`.away_player AS player,sum(`match`.away_yellow_card) AS yellow_card,sum(`match`.away_red_card) AS red_card from `match` group by `match`.away_player) card join player on((player.`name` = card.player))) group by card.player order by fair_play_point desc limit 5 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top_defended`
--

/*!50001 DROP VIEW IF EXISTS top_defended*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=root@localhost SQL SECURITY DEFINER */
/*!50001 VIEW top_defended AS select score.player AS player,sum(score.goal) AS goal,player.avatar AS avatar from ((select `match`.home_player AS player,sum(`match`.away_goal) AS goal from `match` group by `match`.home_player union all select `match`.away_player AS player,sum(`match`.home_goal) AS goal from `match` group by `match`.away_player) score join player on((player.`name` = score.player))) group by score.player order by goal limit 5 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top_goal`
--

/*!50001 DROP VIEW IF EXISTS top_goal*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=root@localhost SQL SECURITY DEFINER */
/*!50001 VIEW top_goal AS select score.player AS player,sum(score.goal) AS goal,player.avatar AS avatar from ((select `match`.home_player AS player,sum(`match`.home_goal) AS goal from `match` group by `match`.home_player union all select `match`.away_player AS player,sum(`match`.away_goal) AS goal from `match` group by `match`.away_player) score join player on((player.`name` = score.player))) group by score.player order by goal desc limit 5 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
