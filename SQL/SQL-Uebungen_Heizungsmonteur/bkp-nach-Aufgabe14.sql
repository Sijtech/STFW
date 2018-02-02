-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: Heizungsmonteur
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.16.04.1

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
-- Table structure for table `Abteilung`
--

DROP TABLE IF EXISTS `Abteilung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Abteilung` (
  `A_Nr` char(2) NOT NULL,
  `Abteilung` varchar(16) NOT NULL,
  PRIMARY KEY (`A_Nr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Abteilung`
--

LOCK TABLES `Abteilung` WRITE;
/*!40000 ALTER TABLE `Abteilung` DISABLE KEYS */;
INSERT INTO `Abteilung` VALUES ('A1','Heizung'),('A2','Sanitaer'),('A3','Büro');
/*!40000 ALTER TABLE `Abteilung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fahrten`
--

DROP TABLE IF EXISTS `Fahrten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Fahrten` (
  `Fahrten_Nr` int(11) NOT NULL,
  `Fahrzeuge_Nr` char(2) NOT NULL,
  `M_NR` char(2) NOT NULL,
  `Fahrten_Datum` date NOT NULL,
  `KM_Start` int(11) NOT NULL,
  `KM_Ende` int(11) NOT NULL,
  PRIMARY KEY (`Fahrten_Nr`),
  KEY `M_NR_idx` (`M_NR`),
  KEY `Fahrzeuge_Nr_idx` (`Fahrzeuge_Nr`),
  CONSTRAINT `Fahrzeuge_Nr` FOREIGN KEY (`Fahrzeuge_Nr`) REFERENCES `Fahrzeuge` (`Fahrzeuge_Nr`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `M_NR` FOREIGN KEY (`M_NR`) REFERENCES `Monteur` (`M_NR`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fahrten`
--

LOCK TABLES `Fahrten` WRITE;
/*!40000 ALTER TABLE `Fahrten` DISABLE KEYS */;
INSERT INTO `Fahrten` VALUES (1,'F1','M1','2017-08-21',34098,35001),(2,'F1','M2','2017-11-21',34098,85001),(3,'F2','M2','2017-09-21',34098,55001),(4,'F1','M1','2017-06-21',44098,45001),(5,'F3','M3','2017-12-21',54098,55001);
/*!40000 ALTER TABLE `Fahrten` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fahrzeuge`
--

DROP TABLE IF EXISTS `Fahrzeuge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Fahrzeuge` (
  `Fahrzeuge_Nr` char(2) NOT NULL COMMENT '		',
  `Marke` varchar(12) NOT NULL,
  `Modell` varchar(12) NOT NULL,
  `letzte_Wartung` date NOT NULL,
  `letzter_unterhalt` date NOT NULL,
  `Fahrzeug_Schild` varchar(8) NOT NULL,
  `Sitzplätze` int(11) DEFAULT NULL,
  PRIMARY KEY (`Fahrzeuge_Nr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fahrzeuge`
--

LOCK TABLES `Fahrzeuge` WRITE;
/*!40000 ALTER TABLE `Fahrzeuge` DISABLE KEYS */;
INSERT INTO `Fahrzeuge` VALUES ('F1','Opel','Astra','2017-08-21','2017-04-26','ZH112100',5),('F2','BMW','M1','2016-12-21','2014-04-26','ZH187333',2),('F3','Ford','Fiesta','2017-10-13','2017-03-17','TG214956',4);
/*!40000 ALTER TABLE `Fahrzeuge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Funktion`
--

DROP TABLE IF EXISTS `Funktion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Funktion` (
  `F_Nr` char(2) NOT NULL,
  `Funktion` varchar(16) NOT NULL,
  `Stundensatz` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`F_Nr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Funktion`
--

LOCK TABLES `Funktion` WRITE;
/*!40000 ALTER TABLE `Funktion` DISABLE KEYS */;
INSERT INTO `Funktion` VALUES ('F1','Monteur-B',55),('F2','Monteur-A',45),('F3','KV',50);
/*!40000 ALTER TABLE `Funktion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Kunde`
--

DROP TABLE IF EXISTS `Kunde`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Kunde` (
  `K_Nr` char(2) NOT NULL,
  `K_Name` varchar(16) NOT NULL,
  PRIMARY KEY (`K_Nr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Kunde`
--

LOCK TABLES `Kunde` WRITE;
/*!40000 ALTER TABLE `Kunde` DISABLE KEYS */;
INSERT INTO `Kunde` VALUES ('K1','Osiris AG'),('K2','STFW'),('K3','Ariel GmbH');
/*!40000 ALTER TABLE `Kunde` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Monteur`
--

DROP TABLE IF EXISTS `Monteur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Monteur` (
  `M_NR` char(2) NOT NULL,
  `M_Name` varchar(16) NOT NULL,
  `F_Nr` char(2) NOT NULL,
  `A_Nr` char(2) NOT NULL,
  `Salär` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`M_NR`),
  KEY `F_Nr` (`F_Nr`),
  KEY `A_Nr` (`A_Nr`),
  CONSTRAINT `Monteur_ibfk_1` FOREIGN KEY (`F_Nr`) REFERENCES `Funktion` (`F_Nr`) ON DELETE NO ACTION,
  CONSTRAINT `Monteur_ibfk_2` FOREIGN KEY (`A_Nr`) REFERENCES `Abteilung` (`A_Nr`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Monteur`
--

LOCK TABLES `Monteur` WRITE;
/*!40000 ALTER TABLE `Monteur` DISABLE KEYS */;
INSERT INTO `Monteur` VALUES ('M1','Roth','F2','A3',5500),('M2','Gelb','F1','A2',5500),('M3','Braun','F1','A1',5500),('M4','Weiss','F2','A2',5500);
/*!40000 ALTER TABLE `Monteur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rapport`
--

DROP TABLE IF EXISTS `Rapport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rapport` (
  `M_Nr` char(2) NOT NULL,
  `K_Nr` char(2) NOT NULL,
  `Datum` date NOT NULL,
  `Zeit` int(11) NOT NULL,
  PRIMARY KEY (`M_Nr`,`K_Nr`,`Datum`),
  KEY `K_Nr` (`K_Nr`),
  CONSTRAINT `Rapport_ibfk_1` FOREIGN KEY (`K_Nr`) REFERENCES `Kunde` (`K_Nr`) ON DELETE NO ACTION,
  CONSTRAINT `Rapport_ibfk_2` FOREIGN KEY (`M_Nr`) REFERENCES `Monteur` (`M_NR`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rapport`
--

LOCK TABLES `Rapport` WRITE;
/*!40000 ALTER TABLE `Rapport` DISABLE KEYS */;
INSERT INTO `Rapport` VALUES ('M1','K1','2010-08-21',4),('M1','K3','2010-08-21',4),('M2','K2','2010-08-21',8),('M3','K1','2010-08-20',8),('M3','K1','2010-08-21',3),('M3','K2','2010-08-21',2),('M4','K1','2010-08-22',2);
/*!40000 ALTER TABLE `Rapport` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-02 16:26:08
