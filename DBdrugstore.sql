CREATE DATABASE  IF NOT EXISTS `drugstore` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `drugstore`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: drugstore
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.19-MariaDB

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
-- Table structure for table `drug`
--

DROP TABLE IF EXISTS `drug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drug` (
  `DrugName` varchar(45) DEFAULT NULL,
  `DrugPrice` double DEFAULT NULL,
  `DrugId` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`DrugId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drug`
--

LOCK TABLES `drug` WRITE;
/*!40000 ALTER TABLE `drug` DISABLE KEYS */;
INSERT INTO `drug` (`DrugName`, `DrugPrice`, `DrugId`) VALUES ('vancomycin',5000,1),('ceftobiprole',10000,2),('climdamycin',6000,3),('dalbavancin',7000,4),('estaminofen',1300,5),('aminofen',1200,6),('bb',1200,7),('bb',1200,8),('bb',1200,9);
/*!40000 ALTER TABLE `drug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drug_recipe`
--

DROP TABLE IF EXISTS `drug_recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drug_recipe` (
  `DrugId` int(11) DEFAULT NULL,
  `RecipeId` int(11) DEFAULT NULL,
  `NumberofDrug` int(11) DEFAULT NULL,
  KEY `fk_drug_has_recipe_recipe1_idx` (`RecipeId`),
  KEY `fk_drug_has_recipe_drug1_idx` (`DrugId`),
  CONSTRAINT `fk_drug_has_recipe_drug1` FOREIGN KEY (`DrugId`) REFERENCES `drug` (`DrugId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_drug_has_recipe_recipe1` FOREIGN KEY (`RecipeId`) REFERENCES `recipe` (`RecipeId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drug_recipe`
--

LOCK TABLES `drug_recipe` WRITE;
/*!40000 ALTER TABLE `drug_recipe` DISABLE KEYS */;
INSERT INTO `drug_recipe` (`DrugId`, `RecipeId`, `NumberofDrug`) VALUES (1,1,3),(2,1,1),(2,2,1),(5,3,4),(3,4,2);
/*!40000 ALTER TABLE `drug_recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `FisrtName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `UserName` varchar(45) NOT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `Post` int(11) DEFAULT NULL,
  PRIMARY KEY (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` (`FisrtName`, `LastName`, `UserName`, `Password`, `Post`) VALUES ('hossein','sokhanvar','e_sokhanvar','esokhanvar',3),('ali','kargar','manager','dsmanager',1),('benyamin','takhtayi','salesperson','dssalesperson',2);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance`
--

DROP TABLE IF EXISTS `insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insurance` (
  `InsuranceKind` varchar(45) DEFAULT NULL,
  `InsuranceId` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`InsuranceId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance`
--

LOCK TABLES `insurance` WRITE;
/*!40000 ALTER TABLE `insurance` DISABLE KEYS */;
INSERT INTO `insurance` (`InsuranceKind`, `InsuranceId`) VALUES ('ateye',1),('ayandesazan',2),('iran',3);
/*!40000 ALTER TABLE `insurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance_drug`
--

DROP TABLE IF EXISTS `insurance_drug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insurance_drug` (
  `Percentageofinsurancesupport` double DEFAULT NULL,
  `InsuranceId` int(11) DEFAULT NULL,
  `DrugId` int(11) DEFAULT NULL,
  KEY `insuranceid_idx` (`InsuranceId`),
  KEY `drugid_idx` (`DrugId`),
  CONSTRAINT `drugid` FOREIGN KEY (`DrugId`) REFERENCES `drug` (`DrugId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `insuranceid` FOREIGN KEY (`InsuranceId`) REFERENCES `insurance` (`InsuranceId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance_drug`
--

LOCK TABLES `insurance_drug` WRITE;
/*!40000 ALTER TABLE `insurance_drug` DISABLE KEYS */;
INSERT INTO `insurance_drug` (`Percentageofinsurancesupport`, `InsuranceId`, `DrugId`) VALUES (25.3,1,2),(23.6,1,3),(11.1,1,1),(12.34,1,4),(66,2,1),(32.6,2,2),(22,2,5),(55.1,3,5),(33,3,2),(25.3,1,2),(23.6,1,3),(11.1,1,1),(12.34,1,4),(66,2,1),(32.6,2,2),(22,2,5),(55.1,3,5),(33,3,2);
/*!40000 ALTER TABLE `insurance_drug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe`
--

DROP TABLE IF EXISTS `recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe` (
  `ReferDate` varchar(45) DEFAULT NULL,
  `SickName` varchar(45) DEFAULT NULL,
  `RecipeId` int(11) NOT NULL AUTO_INCREMENT,
  `SickId` int(11) DEFAULT NULL,
  PRIMARY KEY (`RecipeId`),
  KEY `sickid_idx` (`SickId`),
  CONSTRAINT `sickid` FOREIGN KEY (`SickId`) REFERENCES `sick` (`SickId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe`
--

LOCK TABLES `recipe` WRITE;
/*!40000 ALTER TABLE `recipe` DISABLE KEYS */;
INSERT INTO `recipe` (`ReferDate`, `SickName`, `RecipeId`, `SickId`) VALUES ('1397/01/23','maryam',1,2),('1397/02/5','seynab',2,4),('1397/01/16','ahmad',3,6),('1396/12/25','pari',4,5);
/*!40000 ALTER TABLE `recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sick`
--

DROP TABLE IF EXISTS `sick`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sick` (
  `SickName` varchar(45) DEFAULT NULL,
  `SickLastName` varchar(45) DEFAULT NULL,
  `SickId` int(11) NOT NULL AUTO_INCREMENT,
  `InsuranceCode` int(11) DEFAULT NULL,
  PRIMARY KEY (`SickId`),
  KEY `InsuranceCode_idx` (`InsuranceCode`),
  CONSTRAINT `InsuranceCode` FOREIGN KEY (`InsuranceCode`) REFERENCES `insurance` (`InsuranceId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sick`
--

LOCK TABLES `sick` WRITE;
/*!40000 ALTER TABLE `sick` DISABLE KEYS */;
INSERT INTO `sick` (`SickName`, `SickLastName`, `SickId`, `InsuranceCode`) VALUES ('ali','alavi',1,1),('maryam','samadi',2,1),('taghi','taghavi',3,2),('zeynab','mahdavi',4,2),('pari','badavi',5,3),('ahmad','jafari',6,3);
/*!40000 ALTER TABLE `sick` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-27 20:51:31
