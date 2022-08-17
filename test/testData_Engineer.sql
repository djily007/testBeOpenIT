-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: social_networks_db
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `idAccount` int NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `pssword` varchar(45) DEFAULT NULL,
  `idUserA` int DEFAULT NULL,
  PRIMARY KEY (`idAccount`),
  KEY `idUser_idx2` (`idUserA`),
  CONSTRAINT `idUserA` FOREIGN KEY (`idUserA`) REFERENCES `user` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discussion`
--

DROP TABLE IF EXISTS `discussion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discussion` (
  `idDiscussion` int NOT NULL,
  `dateDiscussion` date DEFAULT NULL,
  `idUserD` int DEFAULT NULL,
  PRIMARY KEY (`idDiscussion`),
  KEY `idUserD_idx` (`idUserD`),
  CONSTRAINT `idUserD` FOREIGN KEY (`idUserD`) REFERENCES `user` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `groupe`
--

DROP TABLE IF EXISTS `groupe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groupe` (
  `idGroupe` int NOT NULL,
  `nameGroup` varchar(45) DEFAULT NULL,
  `dateGroup` date DEFAULT NULL,
  `idUserG` int DEFAULT NULL,
  `idMessageG` int DEFAULT NULL,
  PRIMARY KEY (`idGroupe`),
  KEY `idMessageG_idx` (`idMessageG`),
  KEY `idUserG_idx` (`idUserG`) /*!80000 INVISIBLE */,
  CONSTRAINT `idMessageG` FOREIGN KEY (`idMessageG`) REFERENCES `message` (`idMessage`),
  CONSTRAINT `idUserG` FOREIGN KEY (`idUserG`) REFERENCES `user` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `idMessage` int NOT NULL,
  `titleMessage` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `dateMessage` date DEFAULT NULL,
  `idUser` int DEFAULT NULL,
  `idDiscussion` int DEFAULT NULL,
  `idGroup` int DEFAULT NULL,
  PRIMARY KEY (`idMessage`),
  KEY `idUser_idx` (`idUser`),
  KEY `idDiscussion_idx` (`idDiscussion`),
  CONSTRAINT `idDiscussion` FOREIGN KEY (`idDiscussion`) REFERENCES `discussion` (`idDiscussion`),
  CONSTRAINT `idUser` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `idUser` int NOT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `phoneNumber` varchar(45) DEFAULT NULL,
  `datebirth` date DEFAULT NULL,
  `idAccount` int DEFAULT NULL,
  PRIMARY KEY (`idUser`),
  KEY `idAccount_idx` (`idAccount`),
  CONSTRAINT `idAccount` FOREIGN KEY (`idAccount`) REFERENCES `account` (`idAccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-17 14:58:25
