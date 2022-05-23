-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: teswoordle
-- ------------------------------------------------------
-- Server version	8.0.29

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

create database teswoordle;

use teswoordle;
--
-- Table structure for table `Jugador`
--

DROP TABLE IF EXISTS `Jugador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Jugador` (
  `id` int NOT NULL AUTO_INCREMENT,
  `jugador` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Jugador`
--

LOCK TABLES `Jugador` WRITE;
/*!40000 ALTER TABLE `Jugador` DISABLE KEYS */;
INSERT INTO `Jugador` VALUES (1,'jugador1');
/*!40000 ALTER TABLE `Jugador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Jugador_Palabras`
--

DROP TABLE IF EXISTS `Jugador_Palabras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Jugador_Palabras` (
  `id_jugador` int DEFAULT NULL,
  `id_palabra` int DEFAULT NULL,
  `Datetime_insert` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `intento` int DEFAULT NULL,
  `palabra_enviada` varchar(5) DEFAULT NULL,
  `resuelta` int DEFAULT '0',
  KEY `Jugador_Palabras_FK` (`id_jugador`),
  KEY `Jugador_Palabras_FK_1` (`id_palabra`),
  CONSTRAINT `Jugador_Palabras_FK` FOREIGN KEY (`id_jugador`) REFERENCES `Jugador` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Jugador_Palabras_FK_1` FOREIGN KEY (`id_palabra`) REFERENCES `palabras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Jugador_Palabras`
--

LOCK TABLES `Jugador_Palabras` WRITE;
/*!40000 ALTER TABLE `Jugador_Palabras` DISABLE KEYS */;
INSERT INTO `Jugador_Palabras` VALUES (NULL,8,'2022-05-23 04:19:01',0,NULL,0),(NULL,3,'2022-05-23 04:40:33',0,NULL,0),(NULL,3,'2022-05-23 04:45:31',0,NULL,0),(1,6,'2022-05-23 04:48:42',0,NULL,0),(1,3,'2022-05-23 05:41:48',0,NULL,0),(1,3,'2022-05-23 05:44:15',1,'apaaa',0),(1,3,'2022-05-23 05:44:37',1,'apaaa',0),(1,3,'2022-05-23 05:45:49',1,'apaaa',0),(1,3,'2022-05-23 05:46:15',1,'apaaa',0),(1,3,'2022-05-23 05:49:32',2,'apaaa',0),(1,3,'2022-05-23 05:50:05',2,'bese',0),(1,3,'2022-05-23 05:53:46',3,'bese',0),(1,3,'2022-05-23 05:55:13',4,'bese',0),(1,3,'2022-05-23 05:55:25',4,'bese',0),(1,3,'2022-05-23 05:58:54',5,'wwsws',0),(1,3,'2022-05-23 06:01:08',6,'swwww',0),(1,8,'2022-05-23 06:21:44',0,NULL,0),(1,8,'2022-05-23 06:25:07',1,'opwww',0),(1,3,'2022-05-23 06:35:26',0,NULL,0),(1,3,'2022-05-23 06:35:36',1,'opwww',0),(1,3,'2022-05-23 06:38:12',1,'opwww',0),(1,3,'2022-05-23 06:38:29',1,'beqqq',0),(1,3,'2022-05-23 06:38:41',1,'beoqq',0),(1,3,'2022-05-23 06:39:40',1,'beoqq',0);
/*!40000 ALTER TABLE `Jugador_Palabras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `palabras`
--

DROP TABLE IF EXISTS `palabras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `palabras` (
  `id` int NOT NULL AUTO_INCREMENT,
  `palabra` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `palabras`
--

LOCK TABLES `palabras` WRITE;
/*!40000 ALTER TABLE `palabras` DISABLE KEYS */;
INSERT INTO `palabras` VALUES (1,'besen'),(2,'beses'),(3,'besos'),(4,'ardan'),(5,'ardas'),(6,'ardes'),(7,'apoda'),(8,'apodo');
/*!40000 ALTER TABLE `palabras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'teswoordle'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-23  1:49:55
