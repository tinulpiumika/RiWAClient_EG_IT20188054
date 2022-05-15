-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: electrogrid
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `power_consumption`
--

DROP TABLE IF EXISTS `power_consumption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `power_consumption` (
  `recordID` varchar(30) NOT NULL,
  `Electricity_AccountNo` varchar(12) NOT NULL,
  `CurrentReading` int NOT NULL,
  `NoOfUnits` int NOT NULL,
  `date` date NOT NULL,
  `monthYear` varchar(45) NOT NULL,
  `type` varchar(15) NOT NULL,
  `ReaderID` varchar(45) NOT NULL,
  `userID` int NOT NULL,
  PRIMARY KEY (`recordID`),
  KEY `foriegn_Key_userID` (`userID`),
  CONSTRAINT `foriegn_Key_userID` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`),
  CONSTRAINT `check_user_type_constraint` CHECK (((`type` = _utf8mb4'commercial') or (`type` = _utf8mb4'residential')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `power_consumption`
--

LOCK TABLES `power_consumption` WRITE;
/*!40000 ALTER TABLE `power_consumption` DISABLE KEYS */;
INSERT INTO `power_consumption` VALUES ('PC19898666202205','19898666',10,0,'2022-05-29','202205','residential','1',1),('PC26432000202206','26432000',60,60,'2022-06-01','202206','residential','666',2),('PC26432000202207','26432000',1000,940,'2022-07-30','202207','residential','1',2),('PC30000777202208','30000777',1000,1000,'2022-08-25','202208','residential','1',3),('PC70000888202205','70000888',600,600,'2022-05-29','202205','commercial','34',7);
/*!40000 ALTER TABLE `power_consumption` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-15 19:43:06
