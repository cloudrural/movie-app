-- MySQL dump 10.13  Distrib 5.5.60, for Win64 (AMD64)
--
-- Host: localhost    Database: moviedb
-- ------------------------------------------------------
-- Server version	5.5.60-log

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `email` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('manmodesanket@gmail.com','Sanket','sanket123'),('neeraj@gmail.com','Neeraj','neeraj123'),('rajat@gmail.com','Rajat','rajma'),('vv@gmail.com','Vasundhara Ghate','abcxyz');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_list`
--

DROP TABLE IF EXISTS `movie_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_list` (
  `movie_name` varchar(30) NOT NULL DEFAULT '',
  `th_name` varchar(30) NOT NULL DEFAULT '',
  `location` varchar(30) NOT NULL DEFAULT '',
  `release_date` date DEFAULT NULL,
  `genre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`movie_name`,`th_name`,`location`),
  KEY `th_name` (`th_name`,`location`),
  CONSTRAINT `movie_list_ibfk_1` FOREIGN KEY (`th_name`, `location`) REFERENCES `theatre_list` (`th_name`, `location`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_list`
--

LOCK TABLES `movie_list` WRITE;
/*!40000 ALTER TABLE `movie_list` DISABLE KEYS */;
INSERT INTO `movie_list` VALUES ('Batti Gul Meter Chalu','Cinepolis','Aundh','2018-09-21','Social'),('Batti Gul Meter Chalu','Esquare','University Road','2018-09-21','Social'),('Batti Gul Meter Chalu','PVR','Kothrud','2018-09-21','Social'),('Johnny English 3','INOX','Bund Garden','2018-09-28','Comedy'),('Johnny English 3','PVR','Kothrud','2018-09-28','Comedy'),('Johnny English 3','PVR','SB Road','2018-09-28','Comedy'),('Manmarziyaan','CityPride','Kothrud','2018-09-14','Romance'),('Manmarziyaan','PVR','Kothrud','2018-09-14','Romance'),('Manmarziyaan','PVR','SB Road','2018-09-14','Romance'),('Manto','CityPride','Kothrud','2018-09-21','Biography'),('Manto','Esquare','University Road','2018-09-21','Biography'),('Sui Dhaga','CinePolis','Aundh','2018-09-28','Drama'),('Sui Dhaga','Esquare','University Road','2018-09-28','Drama'),('Sui Dhaga','INOX','Bund Garden','2018-09-28','Drama'),('The Nun','Esquare','University Road','2018-09-07','Horror'),('The Nun','INOX','Bund Garden','2018-09-07','Horror'),('The Nun','PVR','Kothrud','2018-09-07','Horror');
/*!40000 ALTER TABLE `movie_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shows`
--

DROP TABLE IF EXISTS `shows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shows` (
  `sh_date` date NOT NULL DEFAULT '0000-00-00',
  `sh_time` time NOT NULL DEFAULT '00:00:00',
  `movie_name` varchar(30) NOT NULL DEFAULT '',
  `th_name` varchar(30) NOT NULL DEFAULT '',
  `location` varchar(30) NOT NULL DEFAULT '',
  `screen_no` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sh_date`,`sh_time`,`movie_name`,`th_name`,`location`,`screen_no`),
  KEY `movie_name` (`movie_name`),
  KEY `th_name` (`th_name`,`location`),
  CONSTRAINT `shows_ibfk_1` FOREIGN KEY (`movie_name`) REFERENCES `movie_list` (`movie_name`),
  CONSTRAINT `shows_ibfk_2` FOREIGN KEY (`th_name`, `location`) REFERENCES `theatre_list` (`th_name`, `location`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shows`
--

LOCK TABLES `shows` WRITE;
/*!40000 ALTER TABLE `shows` DISABLE KEYS */;
INSERT INTO `shows` VALUES ('2018-10-05','08:30:00','Johnny English 3','PVR','SB Road',1),('2018-10-05','08:40:00','Johnny English 3','INOX','Bund Garden',1),('2018-10-05','10:00:00','Johnny English 3','PVR','Kothrud',1),('2018-10-05','14:00:00','Johnny English 3','PVR','Kothrud',2),('2018-10-05','14:40:00','Johnny English 3','INOX','Bund Garden',3),('2018-10-05','18:40:00','Johnny English 3','INOX','Bund Garden',2),('2018-10-05','18:40:00','Johnny English 3','PVR','SB Road',1),('2018-10-05','21:40:00','Johnny English 3','PVR','Kothrud',1),('2018-10-05','21:40:00','Johnny English 3','PVR','SB Road',2),('2018-10-06','08:15:00','Johnny English 3','INOX','Bund Garden',1),('2018-10-06','08:30:00','Johnny English 3','PVR','SB Road',1),('2018-10-06','10:00:00','Johnny English 3','PVR','Kothrud',1),('2018-10-06','14:00:00','Johnny English 3','PVR','Kothrud',2),('2018-10-06','14:40:00','Johnny English 3','INOX','Bund Garden',3),('2018-10-06','18:40:00','Johnny English 3','INOX','Bund Garden',2),('2018-10-06','18:40:00','Johnny English 3','PVR','SB Road',1),('2018-10-06','21:40:00','Johnny English 3','PVR','SB Road',2),('2018-10-06','22:00:00','Johnny English 3','PVR','Kothrud',1),('2018-10-07','08:15:00','Johnny English 3','INOX','Bund Garden',1),('2018-10-07','10:00:00','Johnny English 3','PVR','Kothrud',1),('2018-10-07','18:40:00','Johnny English 3','INOX','Bund Garden',2),('2018-10-07','18:40:00','Johnny English 3','PVR','SB Road',1),('2018-10-07','22:00:00','Johnny English 3','PVR','Kothrud',1),('2018-10-08','08:15:00','Johnny English 3','INOX','Bund Garden',1),('2018-10-08','18:40:00','Johnny English 3','PVR','SB Road',1),('2018-10-08','22:00:00','Johnny English 3','PVR','Kothrud',1),('2018-10-09','08:15:00','Johnny English 3','INOX','Bund Garden',1),('2018-10-09','18:40:00','Johnny English 3','PVR','SB Road',1),('2018-10-09','22:00:00','Johnny English 3','PVR','Kothrud',1),('2018-10-10','18:40:00','Johnny English 3','INOX','Bund Garden',2),('2018-10-10','18:40:00','Johnny English 3','PVR','SB Road',1),('2018-10-10','22:00:00','Johnny English 3','PVR','Kothrud',1),('2018-10-05','09:00:00','Manto','Esquare','University Road',2),('2018-10-05','12:00:00','Manto','CityPride','Kothrud',1),('2018-10-06','12:00:00','Manto','CityPride','Kothrud',1),('2018-10-06','18:00:00','Manto','Esquare','University Road',2),('2018-10-05','09:00:00','Sui Dhaga','CinePolis','Aundh',1),('2018-10-05','09:00:00','Sui Dhaga','CityPride','Kothrud',1),('2018-10-05','09:00:00','Sui Dhaga','Esquare','University Road',1),('2018-10-05','10:00:00','Sui Dhaga','Esquare','University Road',3),('2018-10-05','11:15:00','Sui Dhaga','INOX','Bund Garden',1),('2018-10-05','12:00:00','Sui Dhaga','CinePolis','Aundh',3),('2018-10-05','15:00:00','Sui Dhaga','Esquare','University Road',2),('2018-10-05','18:00:00','Sui Dhaga','Esquare','University Road',2),('2018-10-05','18:30:00','Sui Dhaga','INOX','Bund Garden',2),('2018-10-05','21:00:00','Sui Dhaga','CinePolis','Aundh',2),('2018-10-05','21:00:00','Sui Dhaga','INOX','Bund Garden',3),('2018-10-05','22:00:00','Sui Dhaga','CinePolis','Aundh',3),('2018-10-05','22:15:00','Sui Dhaga','INOX','Bund Garden',1),('2018-10-06','08:00:00','Sui Dhaga','CinePolis','Aundh',2),('2018-10-06','08:15:00','Sui Dhaga','INOX','Bund Garden',1),('2018-10-06','09:00:00','Sui Dhaga','CinePolis','Aundh',1),('2018-10-06','09:00:00','Sui Dhaga','CityPride','Kothrud',1),('2018-10-06','09:00:00','Sui Dhaga','Esquare','University Road',1),('2018-10-06','10:45:00','Sui Dhaga','INOX','Bund Garden',2),('2018-10-06','12:00:00','Sui Dhaga','CinePolis','Aundh',3),('2018-10-06','12:45:00','Sui Dhaga','INOX','Bund Garden',3),('2018-10-06','14:00:00','Sui Dhaga','Esquare','University Road',3),('2018-10-06','15:00:00','Sui Dhaga','Esquare','University Road',2),('2018-10-06','18:00:00','Sui Dhaga','CinePolis','Aundh',1),('2018-10-07','09:00:00','Sui Dhaga','CinePolis','Aundh',1),('2018-10-07','09:00:00','Sui Dhaga','Esquare','University Road',1),('2018-10-07','10:20:00','Sui Dhaga','CinePolis','Aundh',2),('2018-10-07','12:00:00','Sui Dhaga','INOX','Bund Garden',3),('2018-10-07','18:00:00','Sui Dhaga','Esquare','University Road',1),('2018-10-07','18:00:00','Sui Dhaga','INOX','Bund Garden',3),('2018-10-07','18:50:00','Sui Dhaga','CinePolis','Aundh',3),('2018-10-07','21:00:00','Sui Dhaga','Esquare','University Road',2),('2018-10-08','08:30:00','Sui Dhaga','CinePolis','Aundh',1),('2018-10-08','09:00:00','Sui Dhaga','Esquare','University Road',2),('2018-10-08','12:40:00','Sui Dhaga','CinePolis','Aundh',2),('2018-10-08','18:00:00','Sui Dhaga','CinePolis','Aundh',3),('2018-10-08','18:00:00','Sui Dhaga','Esquare','University Road',1),('2018-10-08','18:00:00','Sui Dhaga','INOX','Bund Garden',2),('2018-10-09','08:00:00','Sui Dhaga','CinePolis','Aundh',1),('2018-10-09','09:00:00','Sui Dhaga','Esquare','University Road',2),('2018-10-09','11:15:00','Sui Dhaga','CinePolis','Aundh',2),('2018-10-05','08:15:00','The Nun','INOX','Bund Garden',1),('2018-10-05','08:30:00','The Nun','Esquare','University Road',1),('2018-10-05','10:15:00','The Nun','PVR','Kothrud',1),('2018-10-05','10:40:00','The Nun','Esquare','University Road',2),('2018-10-05','12:10:00','The Nun','INOX','Bund Garden',2),('2018-10-05','18:00:00','The Nun','Esquare','University Road',3),('2018-10-05','18:00:00','The Nun','PVR','Kothrud',1),('2018-10-05','21:10:00','The Nun','INOX','Bund Garden',3),('2018-10-05','22:40:00','The Nun','PVR','Kothrud',2),('2018-10-06','08:30:00','The Nun','Esquare','University Road',1),('2018-10-06','10:10:00','The Nun','INOX','Bund Garden',1),('2018-10-06','12:15:00','The Nun','INOX','Bund Garden',2),('2018-10-06','12:30:00','The Nun','Esquare','University Road',2),('2018-10-06','18:00:00','The Nun','Esquare','University Road',3);
/*!40000 ALTER TABLE `shows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theatre_list`
--

DROP TABLE IF EXISTS `theatre_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `theatre_list` (
  `th_name` varchar(30) NOT NULL DEFAULT '',
  `location` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`th_name`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theatre_list`
--

LOCK TABLES `theatre_list` WRITE;
/*!40000 ALTER TABLE `theatre_list` DISABLE KEYS */;
INSERT INTO `theatre_list` VALUES ('Cinepolis','Aundh'),('CityPride','Kothrud'),('Esquare','University Road'),('INOX','Bund Garden'),('PVR','Kothrud'),('PVR','SB Road');
/*!40000 ALTER TABLE `theatre_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickets` (
  `th_name` varchar(30) NOT NULL DEFAULT '',
  `location` varchar(30) NOT NULL DEFAULT '',
  `sh_date` date NOT NULL DEFAULT '0000-00-00',
  `sh_time` time NOT NULL DEFAULT '00:00:00',
  `screen_no` int(11) NOT NULL DEFAULT '0',
  `seat_no` int(11) NOT NULL DEFAULT '0',
  `price` int(11) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`th_name`,`location`,`sh_date`,`sh_time`,`screen_no`,`seat_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES ('CinePolis','Aundh','2018-10-05','09:00:00',1,44,150,'manmodesanket@gmail.com'),('CinePolis','Aundh','2018-10-05','09:00:00',1,45,150,'manmodesanket@gmail.com'),('CinePolis','Aundh','2018-10-05','12:00:00',1,26,180,'manmodesanket@gmail.com'),('CinePolis','Aundh','2018-10-06','18:00:00',1,24,180,'manmodesanket@gmail.com'),('CinePolis','Aundh','2018-10-06','18:00:00',1,25,180,'manmodesanket@gmail.com'),('CinePolis','Aundh','2018-10-07','15:00:00',1,51,NULL,NULL),('CityPride','Kothrud','2018-10-05','12:00:00',1,26,180,'manmodesanket@gmail.com'),('Esquare','University Road','2018-09-07','09:00:00',1,1,NULL,NULL),('Esquare','University Road','2018-09-07','09:00:00',1,3,200,'manmodesanket@gmail.com'),('Esquare','University Road','2018-09-07','09:00:00',1,4,200,'manmodesanket@gmail.com'),('Esquare','University Road','2018-09-07','09:00:00',1,5,200,'manmodesanket@gmail.com'),('Esquare','University Road','2018-09-07','09:00:00',1,24,NULL,NULL),('Esquare','University Road','2018-09-07','09:00:00',1,25,NULL,NULL),('Esquare','University Road','2018-09-07','09:00:00',1,26,NULL,NULL),('Esquare','University Road','2018-09-07','09:00:00',1,33,NULL,NULL),('Esquare','University Road','2018-09-07','09:00:00',1,34,NULL,NULL),('Esquare','University Road','2018-09-07','09:00:00',1,35,NULL,NULL),('Esquare','University Road','2018-10-05','09:00:00',1,26,180,'manmodesanket@gmail.com'),('Esquare','University Road','2018-10-05','10:00:00',3,15,200,'manmodesanket@gmail.com'),('Esquare','University Road','2018-10-05','10:00:00',3,16,200,'manmodesanket@gmail.com'),('INOX','Bund Garden','2018-10-07','12:00:00',3,13,200,'manmodesanket@gmail.com'),('INOX','Bund Garden','2018-10-07','12:00:00',3,14,400,'manmodesanket@gmail.com'),('th_name','th_loc','2018-10-10','16:00:00',1,44,NULL,NULL);
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-16 13:33:08
