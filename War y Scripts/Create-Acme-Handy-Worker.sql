start transaction;

create database 'Acme-Handy-Worker';

use 'Acme-Handy-Worker';


create user 'acme-user'@'%' identified by password '*4F10007AADA9EE3DBB2CC36575DFC6F4FDE27577';
create user 'acme-manager'@'%' identified by password '*FDB8CD304EB2317D10C95D797A4BD7492560F55F';

grant select, insert, update, delete 
	on `Acme-Handy-Worker`.* to 'acme-user'@'%';
grant select, insert, update, delete, create, drop, references, index, alter, 
        create temporary tables, lock tables, create view, create routine,     
	alter routine, execute, trigger, show view
	 on `Acme-Handy-Worker`.* to 'acme-manager'@'%';


-- MySQL dump 10.13  Distrib 5.5.29, for Win64 (x86)
--
-- Host: localhost    Database: Acme-Handy-Worker
-- ------------------------------------------------------
-- Server version	5.5.29

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
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrator` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `suspicious` bit(1) DEFAULT NULL,
  `user_account` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_7ohwsa2usmvu0yxb44je2lge` (`user_account`),
  CONSTRAINT `FK_7ohwsa2usmvu0yxb44je2lge` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (10186,0,'C/Calle, 32','maxagar@gmail.com','Xavier','Mario','+34(456)123456789','https://cdn.pixabay.com/photo/2017/06/26/02/47/people-2442565_960_720.jpg','García','',10171),(10187,0,'C/System, 32','system@system.sys','System','System',NULL,NULL,'System','\0',10172),(10188,0,NULL,'maxagar@gmail.com',NULL,'Clara','+34(456)123456759',NULL,'Prats','\0',10173);
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `brand_name` varchar(255) DEFAULT NULL,
  `cvv_code` int(11) DEFAULT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `holder_name` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `customer_comments` varchar(255) DEFAULT NULL,
  `moment` datetime DEFAULT NULL,
  `price` double NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `worker_comments` varchar(255) DEFAULT NULL,
  `fixup_task` int(11) NOT NULL,
  `handy_worker` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_o7peoi9axqyx1v4j6ekwew3vy` (`handy_worker`,`fixup_task`),
  KEY `FK_1ua24aw2y3tdyak0q51rruifm` (`fixup_task`),
  CONSTRAINT `FK_ldpicm7in0u6b3qjcdo0v8n4c` FOREIGN KEY (`handy_worker`) REFERENCES `handy_worker` (`id`),
  CONSTRAINT `FK_1ua24aw2y3tdyak0q51rruifm` FOREIGN KEY (`fixup_task`) REFERENCES `fixup_task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
INSERT INTO `application` VALUES (10348,0,'VISA',452,'2020-10-28 23:59:59','Paco Pepe Pérez','4556042640541332',NULL,'2017-10-28 23:59:59',3.14,'ACCEPTED','I work hard',10309,10278),(10349,0,NULL,NULL,NULL,NULL,NULL,NULL,'2017-10-28 23:59:59',3.14,'REJECTED','I work hard',10311,10278),(10350,0,NULL,NULL,NULL,NULL,NULL,NULL,'2017-10-28 23:59:59',3.14,'PENDING','I work hard',10312,10278),(10351,0,'VISA',452,'2020-10-28 23:59:59','Paco Pepe Pérez','4556042640541332','OK','2018-10-31 00:00:00',12.34,'PENDING','I work very hard',10311,10279),(10352,0,'VISA',452,'2020-10-28 23:59:59','Paco Pepe Pérez','4556042640541332',NULL,'2017-10-12 00:00:00',10.43,'ACCEPTED',NULL,10312,10280),(10353,0,'VISA',452,'2020-10-28 23:59:59','Paco Pepe Pérez','4556042640541332','OK','2018-10-31 00:00:00',11.34,'ACCEPTED','I work very hard',10311,10281),(10354,0,'VISA',452,'2020-10-28 23:59:59','Paco Pepe Pérez','4556042640541332','OK','2018-10-31 00:00:00',1,'ACCEPTED','I work very hard',10313,10278);
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `name_english` varchar(255) DEFAULT NULL,
  `name_spanish` varchar(255) DEFAULT NULL,
  `parent_category` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_mn9i43url3e4y3plf84vt8rii` (`name_english`,`parent_category`),
  UNIQUE KEY `UK_sj071ot51x15fraphh7r4o2rf` (`name_spanish`,`parent_category`),
  KEY `FK_lhvwmxrdrjma5forcymeuolqn` (`parent_category`),
  CONSTRAINT `FK_lhvwmxrdrjma5forcymeuolqn` FOREIGN KEY (`parent_category`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (10189,0,'CATEGORY','CATEGORÍA',10189),(10190,0,'Carpentry','Carpintería',10189),(10191,0,'Cleaning','Limpieza',10189),(10192,0,'ConcreteWork','Trabajos con hormigón',10189),(10193,0,'Doors','Puertas',10190),(10194,0,'ElectricalWiring','Cableado Eléctrico',10189),(10195,0,'FanInstallation','Instalación de ventiladores',10194),(10196,0,'HomeSecuritySystems','Sistemas de seguridad para el hogar',10189),(10197,0,'InsulationInstallation','Instalación de aislamiento',10189),(10198,0,'LampRepairs','Reparación de lámparas',10194),(10199,0,'Moving','Mudanzas',10189),(10200,0,'Painting','Pintado',10189),(10201,0,'PestControl','Control de plagas',10191),(10202,0,'PlumbingRepairs','Reparación de tuberías',10189),(10203,0,'Roofing','Techado',10192),(10204,0,'ShelfInstallation','Instalación de estanterías',10190),(10205,0,'SolarPanels','Paneles Solares',10194),(10206,0,'SoundProofing','Amortiguación de sonido',10197),(10207,0,'SprinklerRepair','Reparación de aspersores',10194),(10208,0,'WindowRepair','Reparación de ventanas',10190),(10293,0,'CeilingRepair','Reparación de techos',10192),(10294,0,'FenceFixing','Reparación de vallas',10196);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaint`
--

DROP TABLE IF EXISTS `complaint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complaint` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `ticker` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `moment` datetime DEFAULT NULL,
  `fixuptask` int(11) NOT NULL,
  `referee` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_jlpo668tu0b8mmsjsg8g13inu` (`ticker`),
  KEY `FK_1ds1iq211odgb8vgktj4vgd5g` (`fixuptask`),
  KEY `FK_n7kqs8a7c2q1jwjcc44oticll` (`referee`),
  CONSTRAINT `FK_n7kqs8a7c2q1jwjcc44oticll` FOREIGN KEY (`referee`) REFERENCES `referee` (`id`),
  CONSTRAINT `FK_1ds1iq211odgb8vgktj4vgd5g` FOREIGN KEY (`fixuptask`) REFERENCES `fixup_task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaint`
--

LOCK TABLES `complaint` WRITE;
/*!40000 ALTER TABLE `complaint` DISABLE KEYS */;
INSERT INTO `complaint` VALUES (10355,0,'181103-RTIB32','This fix is a fake','2018-11-03 23:59:59',10311,10213),(10356,0,'181103-43ION6','This fix is a fake','2018-11-03 23:59:59',10311,NULL),(10357,0,'126532-EFEFG2','This fix is a fake 2','2018-11-03 23:59:59',10312,NULL),(10358,0,'126532-EFERG2','This fix is a fakest','2018-11-03 23:59:59',10309,NULL),(10359,0,'128632-EFEFG2','This fix is a feik 2','2018-11-03 23:59:59',10314,NULL);
/*!40000 ALTER TABLE `complaint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaint_attachments`
--

DROP TABLE IF EXISTS `complaint_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complaint_attachments` (
  `complaint` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  KEY `FK_f4g1vv33vade4pm8t0qim14os` (`complaint`),
  CONSTRAINT `FK_f4g1vv33vade4pm8t0qim14os` FOREIGN KEY (`complaint`) REFERENCES `complaint` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaint_attachments`
--

LOCK TABLES `complaint_attachments` WRITE;
/*!40000 ALTER TABLE `complaint_attachments` DISABLE KEYS */;
INSERT INTO `complaint_attachments` VALUES (10355,'https://trello-attachments.s3.amazonaws.com/5bdc2fda6f3ec4653ca5ca0e/5bdc38d6221aa411081293c9/0fd144293b39a447a86f3586caa178ac/Acme_Handy_Worker.pdf'),(10355,'https://github.com/DP1819/D03/tree/master/src/main');
/*!40000 ALTER TABLE `complaint_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curriculum`
--

DROP TABLE IF EXISTS `curriculum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curriculum` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `ticker` varchar(255) DEFAULT NULL,
  `handy_worker` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_brf0xbdpl3ahb3onlbfvfswcq` (`handy_worker`),
  UNIQUE KEY `UK_3ai7h3tynp97g8r0g93r84m8w` (`ticker`),
  CONSTRAINT `FK_brf0xbdpl3ahb3onlbfvfswcq` FOREIGN KEY (`handy_worker`) REFERENCES `handy_worker` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curriculum`
--

LOCK TABLES `curriculum` WRITE;
/*!40000 ALTER TABLE `curriculum` DISABLE KEYS */;
INSERT INTO `curriculum` VALUES (10286,0,'181101-AC34DF',10278),(10288,0,'180321-ALONSO',10279),(10290,0,'170730-F24RAN',10280),(10292,0,'101010-F24RAE',10281);
/*!40000 ALTER TABLE `curriculum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `suspicious` bit(1) DEFAULT NULL,
  `user_account` int(11) NOT NULL,
  `score` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_mbvdes9ypo1yu76so76owiyqx` (`user_account`),
  CONSTRAINT `FK_mbvdes9ypo1yu76so76owiyqx` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (10209,0,'C/ sal y arena','uncorreonormal@hotmail.com','HackerMan','Alfonso','+34(456)123456718','https://cdn.pixabay.com/user/2015/01/20/20-56-42-330_250x250.jpg','Alarcon','\0',10174,0.75),(10210,0,'C/ esperanza de rafael','uncorreomaslargo@hotmail.com','HackerBoy','Pablo','+34(456)123456717','https://cdn.pixabay.com/user/2015/01/20/20-56-42-330_250x250.jpg','Pino','\0',10175,0.75),(10211,0,'C/ Perdida de la mano de Dios','juandelaaceitunaynooliva@hotmail.com','','Juan','+34(456)123456716','https://cdn.pixabay.com/user/2015/01/20/20-56-42-330_250x250.jpg','De la Aceituna','\0',10176,0.81),(10212,0,'C/ pasada la estacion del ave','tomaslena@hotmail.com','TomasLena','Elena','+34(456)123456715','https://cdn.pixabay.com/user/2015/01/20/20-56-42-330_250x250.jpg','Molina','\0',10177,0.65);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `education_record`
--

DROP TABLE IF EXISTS `education_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `education_record` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `diploma_title` varchar(255) DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `institution` varchar(255) DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `curriculum` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_h0wf5vr7xcybl2dck9xgmir4d` (`curriculum`),
  CONSTRAINT `FK_h0wf5vr7xcybl2dck9xgmir4d` FOREIGN KEY (`curriculum`) REFERENCES `curriculum` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education_record`
--

LOCK TABLES `education_record` WRITE;
/*!40000 ALTER TABLE `education_record` DISABLE KEYS */;
INSERT INTO `education_record` VALUES (10337,0,'https://www.lifewire.com/thmb/-h08oONgxcBRcaYOTiMuJd8ogVU=/768x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-469187056-57cdf0a45f9b5829f4457c9a.jpg','Un cinco pelao he sacao.','Bachillerato','2012-05-29 15:00:00','Academia Preuniversitaria','2010-02-06 09:30:00',10286),(10338,0,'https://www.lifewire.com/thmb/-h08oONgxcBRcaYOTiMuJd8ogVU=/768x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-469187056-57cdf0a45f9b5829f4457c9a.jpg','He peloteado que da gusto.','Bachillerato','2012-05-29 15:02:00','Academia militar','2010-02-22 09:30:00',10286),(10339,0,'https://www.lifewire.com/thmb/-h08oONgxcBRcaYOTiMuJd8ogVU=/768x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-469187056-57cdf0a45f9b5829f4457c9a.jpg','Cuidado con los curas','ESO','2016-05-29 15:02:00','Academia eclesiastica Satanas por aqui no vengas mas','2014-12-12 19:30:00',10288),(10340,0,'https://www.lifewire.com/thmb/-h08oONgxcBRcaYOTiMuJd8ogVU=/768x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-469187056-57cdf0a45f9b5829f4457c9a.jpg','Cuidado con los fanaticos de satanas','ESO','2016-05-29 15:02:00','Academia Satanica Satanas por aqui no ven mas','2013-12-15 09:30:00',10290);
/*!40000 ALTER TABLE `education_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endorsement`
--

DROP TABLE IF EXISTS `endorsement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endorsement` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `moment` datetime DEFAULT NULL,
  `receiver` int(11) NOT NULL,
  `sender` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_5gx7hgegvhw4ngr2pprdv2u98` (`receiver`),
  UNIQUE KEY `UK_2sereo8ytvb15tr8gpq2e3jf4` (`sender`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endorsement`
--

LOCK TABLES `endorsement` WRITE;
/*!40000 ALTER TABLE `endorsement` DISABLE KEYS */;
INSERT INTO `endorsement` VALUES (10299,0,'Estoy muy contenta y todo parece muy bueno excelente fantastico y hermonso ,','2017-02-12 12:00:00',10278,10209),(10300,0,'NO estoy muy contenta not not not  this is bad bad malo malisimo','2016-02-12 12:00:00',10210,10279),(10301,0,'nada que añadir por aqui','2016-01-22 22:00:00',10280,10211),(10302,0,'estoy muy descontento y lo pongo aqui','2017-12-22 22:10:00',10281,10212);
/*!40000 ALTER TABLE `endorsement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endorser_record`
--

DROP TABLE IF EXISTS `endorser_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endorser_record` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `linkedin_profile` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `curriculum` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_y7b9ucmqjmuaj6uvqv8mfoak` (`curriculum`),
  CONSTRAINT `FK_y7b9ucmqjmuaj6uvqv8mfoak` FOREIGN KEY (`curriculum`) REFERENCES `curriculum` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endorser_record`
--

LOCK TABLES `endorser_record` WRITE;
/*!40000 ALTER TABLE `endorser_record` DISABLE KEYS */;
INSERT INTO `endorser_record` VALUES (10341,0,'lipasam@gmail.es','Lipasam','http://www.linkedin.com/in/lipasam','+34(456)123456713','https://cdn.pixabay.com/user/2015/01/20/20-56-42-330_250x250.jpg',10286),(10342,0,'Emasesa@gmail.es','Emasesa','http://www.linkedin.com/in/emasesa','+34(456)123456712','https://cdn.pixabay.com/user/2015/01/20/20-56-42-330_250x250.jpg',10286),(10343,0,'vips@gmail.es','Vips','http://www.linkedin.com/in/emasesa','+34(456)123456711','https://cdn.pixabay.com/user/2015/01/20/20-56-42-330_250x250.jpg',10288),(10344,0,'disneyfantasy@gmail.es','Disney','http://www.linkedin.com/in/disney','+34(456)1234567','https://cdn.pixabay.com/user/2015/01/20/20-56-42-330_250x250.jpg',10290);
/*!40000 ALTER TABLE `endorser_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finder`
--

DROP TABLE IF EXISTS `finder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finder` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `end` datetime DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `max_price` double DEFAULT NULL,
  `min_price` double DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `handy_worker` int(11) NOT NULL,
  `warranty` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_qi9ryx37gartbf5qa8ipv8lhr` (`handy_worker`),
  KEY `FK_n9t1ayk0x7h5vrsfuhygo043j` (`category`),
  KEY `FK_fsgvely8c4othsty26jul4qfl` (`warranty`),
  CONSTRAINT `FK_fsgvely8c4othsty26jul4qfl` FOREIGN KEY (`warranty`) REFERENCES `warranty` (`id`),
  CONSTRAINT `FK_n9t1ayk0x7h5vrsfuhygo043j` FOREIGN KEY (`category`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_qi9ryx37gartbf5qa8ipv8lhr` FOREIGN KEY (`handy_worker`) REFERENCES `handy_worker` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finder`
--

LOCK TABLES `finder` WRITE;
/*!40000 ALTER TABLE `finder` DISABLE KEYS */;
INSERT INTO `finder` VALUES (10295,0,NULL,'cocina',1200,2200,NULL,NULL,10278,NULL),(10296,0,'2019-06-25 21:00:00','salon',NULL,NULL,'2019-05-01 12:00:00',NULL,10279,NULL),(10297,0,NULL,'azulejo',200,800,NULL,NULL,10280,NULL),(10298,0,NULL,NULL,200,2000,NULL,NULL,10281,NULL);
/*!40000 ALTER TABLE `finder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fixup_task`
--

DROP TABLE IF EXISTS `fixup_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fixup_task` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `ticker` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `maximum_price` double NOT NULL,
  `moment` datetime DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `category` int(11) NOT NULL,
  `customer` int(11) NOT NULL,
  `warranty` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_7khjnjwiqwjev14u36c52kxmj` (`ticker`),
  KEY `FK_bl9rkgoi0puairt2gptggd794` (`category`),
  KEY `FK_glc5u42xn3a1j2urc873j3wni` (`customer`),
  KEY `FK_f0mkjews6tr2epiqwbckgnj4a` (`warranty`),
  CONSTRAINT `FK_f0mkjews6tr2epiqwbckgnj4a` FOREIGN KEY (`warranty`) REFERENCES `warranty` (`id`),
  CONSTRAINT `FK_bl9rkgoi0puairt2gptggd794` FOREIGN KEY (`category`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_glc5u42xn3a1j2urc873j3wni` FOREIGN KEY (`customer`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fixup_task`
--

LOCK TABLES `fixup_task` WRITE;
/*!40000 ALTER TABLE `fixup_task` DISABLE KEYS */;
INSERT INTO `fixup_task` VALUES (10309,0,'181103-RTIB01','C/ Mani Manitas N3','Hay que arreglar la pata de la silla 4','2017-02-18 09:30:00',15,'2017-02-16 09:30:00','2017-02-17 09:30:00',10190,10209,10220),(10310,0,'181103-RTIB56','C/ Mani Manitas N3','Hay que arreglar la pata de la silla 5','2019-02-18 09:30:00',132424.12,'2017-02-16 09:30:00','2018-02-17 09:30:00',10190,10209,10220),(10311,0,'181103-RTIB02','C/ Croquetas de Jamón N3','Bombilla rota','2017-10-18 09:30:00',14,'2017-10-11 09:30:00','2017-10-12 09:30:00',10191,10210,10221),(10312,0,'181103-RTIB03','C/ Toy Story N2','Hay que coserle el brazo a Woody','2017-06-18 09:30:00',50,'2017-06-11 09:30:00','2017-06-12 09:30:00',10190,10211,10222),(10313,0,'181103-RTIBA3','C/ Toy Story N2','Tejer cosas','2017-06-18 09:30:00',50,'2017-06-11 09:30:00','2017-06-12 09:30:00',10190,10212,10222),(10314,0,'181103-RTEAS3','C/ Toy Story N2','Tarea para queries','2017-06-18 09:30:00',50,'2017-06-11 09:30:00','2017-06-12 09:30:00',10190,10209,10222);
/*!40000 ALTER TABLE `fixup_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder`
--

DROP TABLE IF EXISTS `folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folder` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `system` bit(1) NOT NULL,
  `actor` int(11) NOT NULL,
  `parent_folder` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_6sgnw44ttvqtncrp5oabg8w9n` (`parent_folder`),
  CONSTRAINT `FK_6sgnw44ttvqtncrp5oabg8w9n` FOREIGN KEY (`parent_folder`) REFERENCES `folder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder`
--

LOCK TABLES `folder` WRITE;
/*!40000 ALTER TABLE `folder` DISABLE KEYS */;
INSERT INTO `folder` VALUES (10226,0,'inBox','',10187,10226),(10227,0,'outBox','',10187,10227),(10228,0,'trashBox','',10187,10228),(10229,0,'spamBox','',10187,10229),(10230,0,'inBox','',10209,10230),(10231,0,'outBox','',10209,10231),(10232,0,'trashBox','',10209,10232),(10233,0,'spamBox','',10209,10233),(10234,0,'testbox','\0',10209,10234),(10235,0,'inBox','',10210,10235),(10236,0,'outBox','',10210,10236),(10237,0,'trashBox','',10210,10237),(10238,0,'spamBox','',10210,10238),(10239,0,'inBox','',10211,10239),(10240,0,'outBox','',10211,10240),(10241,0,'trashBox','',10211,10241),(10242,0,'spamBox','',10211,10242),(10243,0,'inBox','',10212,10243),(10244,0,'outBox','',10212,10244),(10245,0,'trashBox','',10212,10245),(10246,0,'spamBox','',10212,10246),(10247,0,'inBox','',10213,10247),(10248,0,'outBox','',10213,10248),(10249,0,'trashBox','',10213,10249),(10250,0,'spamBox','',10213,10250),(10251,0,'inBox','',10214,10251),(10252,0,'outBox','',10214,10252),(10253,0,'trashBox','',10214,10253),(10254,0,'spamBox','',10214,10254),(10255,0,'inBox','',10215,10255),(10256,0,'outBox','',10215,10256),(10257,0,'trashBox','',10215,10257),(10258,0,'spamBox','',10215,10258),(10259,0,'inBox','',10216,10259),(10260,0,'outBox','',10216,10260),(10261,0,'trashBox','',10216,10261),(10262,0,'spamBox','',10216,10262),(10263,0,'inBox','',10186,10263),(10264,0,'outBox','',10186,10264),(10265,0,'trashBox','',10186,10265),(10266,0,'spamBox','',10186,10266),(10267,0,'inBox','',10188,10267),(10268,0,'outBox','',10188,10268),(10269,0,'trashBox','',10188,10269),(10270,0,'spamBox','',10188,10270),(10315,0,'inBox','',10278,10315),(10316,0,'outBox','',10278,10316),(10317,0,'trashBox','',10278,10317),(10318,0,'spamBox','',10278,10318),(10319,0,'inBox','',10279,10319),(10320,0,'outBox','',10279,10320),(10321,0,'trashBox','',10279,10321),(10322,0,'spamBox','',10279,10322),(10323,0,'inBox','',10280,10323),(10324,0,'outBox','',10280,10324),(10325,0,'trashBox','',10280,10325),(10326,0,'spamBox','',10280,10326),(10327,0,'inBox','',10281,10327),(10328,0,'outBox','',10281,10328),(10329,0,'trashBox','',10281,10329),(10330,0,'spamBox','',10281,10330);
/*!40000 ALTER TABLE `folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `handy_worker`
--

DROP TABLE IF EXISTS `handy_worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `handy_worker` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `suspicious` bit(1) DEFAULT NULL,
  `user_account` int(11) NOT NULL,
  `score` double NOT NULL,
  `make` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_jpa4nvxb706tgsd90160obc6r` (`user_account`),
  CONSTRAINT `FK_jpa4nvxb706tgsd90160obc6r` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `handy_worker`
--

LOCK TABLES `handy_worker` WRITE;
/*!40000 ALTER TABLE `handy_worker` DISABLE KEYS */;
INSERT INTO `handy_worker` VALUES (10278,0,'C/ Polo Norte','elgrinch@hotmail.com','Grinch','Antonio','+34(456)123456754','https://www.cinetecamadrid.com/sites/default/files/activity/image/imagen_EL_GRINCH00_0.jpg','Papp','\0',10179,0.95,'Antonio Grinch Papp'),(10279,0,'C/ Rataland','pokeluisito@hotmail.com','Pokemaniako','Luis','+34(456)123456753','https://cdn.memegenerator.es/imagenes/memes/full/16/43/16433834.jpg','Zumarraga','\0',10180,0.85,'Luis Pokemaniako Zumarraga'),(10280,0,'C/ Lovaina','camunon@hotmail.com','Rmano','Javi','+34(456)123456752','https://misanimales.com/wp-content/uploads/2018/05/curiosidades-del-perezoso.jpg','Camunia','\0',10181,0.75,'Javi Rmano Camunia'),(10281,0,'C/ Reja','tobi@hotmail.com','Elpen','Tobias','+34(456)123456751','https://www.peluchetes.com/contenido/uploads/2015/08/peluche-perro-salchicha.jpg','Feliz','\0',10182,0.66,'Tobias Elpen Feliz');
/*!40000 ALTER TABLE `handy_worker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequences`
--

DROP TABLE IF EXISTS `hibernate_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequences` (
  `sequence_name` varchar(255) DEFAULT NULL,
  `sequence_next_hi_value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequences`
--

LOCK TABLES `hibernate_sequences` WRITE;
/*!40000 ALTER TABLE `hibernate_sequences` DISABLE KEYS */;
INSERT INTO `hibernate_sequences` VALUES ('domain_entity',1);
/*!40000 ALTER TABLE `hibernate_sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `body` varchar(255) DEFAULT NULL,
  `moment` datetime DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `folder` int(11) DEFAULT NULL,
  `receiver` int(11) NOT NULL,
  `sender` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_1c4esr6oh9r3yrpx7asdluc5g` (`folder`),
  CONSTRAINT `FK_1c4esr6oh9r3yrpx7asdluc5g` FOREIGN KEY (`folder`) REFERENCES `folder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (10282,0,'Cuerpo del mensaje 1','2017-07-12 12:00:00','NEUTRAL','Asunto1',10230,10209,10278),(10283,0,'Cuerpo del mensaje 2','2017-07-13 12:00:00','HIGH','Asunto2',10236,10279,10210),(10284,0,'Cuerpo del mensaje 3','2017-07-14 12:00:00','LOW','Asunto3',10240,10280,10211),(10334,0,'Cuerpo del mensaje 1','2017-07-12 12:00:00','NEUTRAL','Asunto1',10316,10209,10278),(10335,0,'Cuerpo del mensaje 2','2017-07-13 12:00:00','HIGH','Asunto2',10319,10279,10210),(10336,0,'Cuerpo del mensaje 3','2017-07-14 12:00:00','LOW','Asunto3',10323,10280,10211);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_tags`
--

DROP TABLE IF EXISTS `message_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_tags` (
  `message` int(11) NOT NULL,
  `tags` varchar(255) DEFAULT NULL,
  KEY `FK_suckduhsrrtot7go5ejeev57w` (`message`),
  CONSTRAINT `FK_suckduhsrrtot7go5ejeev57w` FOREIGN KEY (`message`) REFERENCES `message` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_tags`
--

LOCK TABLES `message_tags` WRITE;
/*!40000 ALTER TABLE `message_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miscellaneous_record`
--

DROP TABLE IF EXISTS `miscellaneous_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miscellaneous_record` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `curriculum` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_3mq29bbajg41upi4mc7k16hns` (`curriculum`),
  CONSTRAINT `FK_3mq29bbajg41upi4mc7k16hns` FOREIGN KEY (`curriculum`) REFERENCES `curriculum` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miscellaneous_record`
--

LOCK TABLES `miscellaneous_record` WRITE;
/*!40000 ALTER TABLE `miscellaneous_record` DISABLE KEYS */;
INSERT INTO `miscellaneous_record` VALUES (10346,0,'http://www.genrecords.org/mofiles/exms.html','Muy interesante','Benhill County GaArchives Historical Records',10286),(10347,0,'http://www.genrecords.org/mofiles/exms.html','Poco interesante','Death Certificate of John Doe 1930',10286);
/*!40000 ALTER TABLE `miscellaneous_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `note`
--

DROP TABLE IF EXISTS `note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `note` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `moment` datetime DEFAULT NULL,
  `report` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_jk2abb4f3s4qx304y1uwq59pi` (`report`),
  CONSTRAINT `FK_jk2abb4f3s4qx304y1uwq59pi` FOREIGN KEY (`report`) REFERENCES `report` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note`
--

LOCK TABLES `note` WRITE;
/*!40000 ALTER TABLE `note` DISABLE KEYS */;
INSERT INTO `note` VALUES (10371,0,'2017-06-25 21:00:00',10360),(10372,0,'2017-06-22 21:00:00',10361),(10373,0,'2017-06-21 21:00:00',10361);
/*!40000 ALTER TABLE `note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `note_comments`
--

DROP TABLE IF EXISTS `note_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `note_comments` (
  `note` int(11) NOT NULL,
  `comments` varchar(255) DEFAULT NULL,
  KEY `FK_16n3b9i6naufk2skyw8kjqkgh` (`note`),
  CONSTRAINT `FK_16n3b9i6naufk2skyw8kjqkgh` FOREIGN KEY (`note`) REFERENCES `note` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note_comments`
--

LOCK TABLES `note_comments` WRITE;
/*!40000 ALTER TABLE `note_comments` DISABLE KEYS */;
INSERT INTO `note_comments` VALUES (10371,'Es un comentario de la nota 1'),(10372,'Es un comentario de la nota 2'),(10373,'Es un comentario de la nota 3');
/*!40000 ALTER TABLE `note_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_record`
--

DROP TABLE IF EXISTS `personal_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_record` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `linkedin_profile` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `curriculum` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_t1kgutt5uk0bkqt5r8dvrihmy` (`curriculum`),
  CONSTRAINT `FK_t1kgutt5uk0bkqt5r8dvrihmy` FOREIGN KEY (`curriculum`) REFERENCES `curriculum` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_record`
--

LOCK TABLES `personal_record` WRITE;
/*!40000 ALTER TABLE `personal_record` DISABLE KEYS */;
INSERT INTO `personal_record` VALUES (10285,0,'elgrinch@hotmail.com','Antonio Grinch Papp','https://www.linkedin.com/company/grinch.spielverderber','+34(456)123456722','https://www.cinetecamadrid.com/sites/default/files/activity/image/imagen_EL_GRINCH00_0.jpg',10286),(10287,0,'pokeluisito@hotmail.com','Luis Pokemaniako Zumarraga','https://www.linkedin.com/company/grinch.spielverderber','+34(456)123456721','https://cdn.memegenerator.es/imagenes/memes/full/16/43/16433834.jpg',10288),(10289,0,'camunon@hotmail.com','Javi Rmano Camunia','https://www.linkedin.com/company/grinch.spielverderber','+34(456)123456720','https://misanimales.com/wp-content/uploads/2018/05/curiosidades-del-perezoso.jpg',10290),(10291,0,'tobi@hotmail.com','Tobias Elpen Feliz','https://www.linkedin.com','+34(456)123456719','https://www.peluchetes.com/contenido/uploads/2015/08/peluche-perro-salchicha.jpg',10292);
/*!40000 ALTER TABLE `personal_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phase`
--

DROP TABLE IF EXISTS `phase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phase` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `work_plan` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ougqjt2xaq34tsthlv44x79u1` (`work_plan`),
  CONSTRAINT `FK_ougqjt2xaq34tsthlv44x79u1` FOREIGN KEY (`work_plan`) REFERENCES `work_plan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phase`
--

LOCK TABLES `phase` WRITE;
/*!40000 ALTER TABLE `phase` DISABLE KEYS */;
INSERT INTO `phase` VALUES (10363,0,'Coger el telefono antes de hacer nada','2017-02-18 09:30:00','2017-02-17 09:30:00','phase1',10362),(10364,0,'Coger el telefono antes de hacer nada','2017-02-18 09:30:00','2017-02-17 09:30:00','phase4',10362),(10366,0,'Coger el telefono antes de hacer nada','2017-02-18 09:30:00','2017-02-16 09:30:00','phase2',10365),(10368,0,'Coger el telefono antes de hacer nada','2017-02-18 09:30:00','2017-02-15 09:30:00','phase3',10367),(10370,0,'Coger el telefono antes de hacer algo','2017-02-18 09:30:00','2017-02-15 09:30:00','phase5',10369);
/*!40000 ALTER TABLE `phase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professional_record`
--

DROP TABLE IF EXISTS `professional_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professional_record` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `curriculum` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_662j8w9utcg58ouatw9vaicie` (`curriculum`),
  CONSTRAINT `FK_662j8w9utcg58ouatw9vaicie` FOREIGN KEY (`curriculum`) REFERENCES `curriculum` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professional_record`
--

LOCK TABLES `professional_record` WRITE;
/*!40000 ALTER TABLE `professional_record` DISABLE KEYS */;
INSERT INTO `professional_record` VALUES (10345,0,'https://www.lifewire.com/thmb/-h08oONgxcBRcaYOTiMuJd8ogVU=/768x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-469187056-57cdf0a45f9b5829f4457c9a.jpg','Trabajo tela de bien','NASA','2012-05-29 15:00:00','Jefe','2010-02-06 09:30:00',10286);
/*!40000 ALTER TABLE `professional_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referee`
--

DROP TABLE IF EXISTS `referee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `referee` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `suspicious` bit(1) DEFAULT NULL,
  `user_account` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_303c1oipw0t6mbnnpvtfv70w5` (`user_account`),
  CONSTRAINT `FK_303c1oipw0t6mbnnpvtfv70w5` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referee`
--

LOCK TABLES `referee` WRITE;
/*!40000 ALTER TABLE `referee` DISABLE KEYS */;
INSERT INTO `referee` VALUES (10213,0,'C/ se señor','uncorreonormal@hotmail.com','HackerMan2','Felipe','+34(456)123456714','https://cdn.pixabay.com/user/2015/01/20/20-56-42-330_250x250.jpg','Trinidad','\0',10178);
/*!40000 ALTER TABLE `referee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `draft` bit(1) NOT NULL,
  `moment` datetime DEFAULT NULL,
  `complaint` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_48rqaecflpcs8unotw4drrtfw` (`complaint`),
  CONSTRAINT `FK_48rqaecflpcs8unotw4drrtfw` FOREIGN KEY (`complaint`) REFERENCES `complaint` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES (10360,0,'Descripcion 1','','2012-05-29 15:00:00',10355),(10361,0,'Descripcion 2','','2012-05-29 15:00:00',10356);
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_attachments`
--

DROP TABLE IF EXISTS `report_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_attachments` (
  `report` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  KEY `FK_8pqwcub4o2xip8o8ohqk3bu05` (`report`),
  CONSTRAINT `FK_8pqwcub4o2xip8o8ohqk3bu05` FOREIGN KEY (`report`) REFERENCES `report` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_attachments`
--

LOCK TABLES `report_attachments` WRITE;
/*!40000 ALTER TABLE `report_attachments` DISABLE KEYS */;
INSERT INTO `report_attachments` VALUES (10360,'https://www.lifewire.com/thmb/-h08oONgxcBRcaYOTiMuJd8ogVU=/768x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-469187056-57cdf0a45f9b5829f4457c9a.jpg'),(10361,'https://www.lifewire.com/thmb/-h08oONgxcBRcaYOTiMuJd8ogVU=/768x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-469187056-57cdf0a45f9b5829f4457c9a.jpg');
/*!40000 ALTER TABLE `report_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `number_order` int(11) NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `tutorial` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_6tcpk427cxiaiglbxvybc9fjh` (`tutorial`),
  CONSTRAINT `FK_6tcpk427cxiaiglbxvybc9fjh` FOREIGN KEY (`tutorial`) REFERENCES `tutorial` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (10304,0,0,'Text 1','Benhill County GaArchives Historical Records',10303),(10306,0,3,'Text 2','Benhill County GArchives Historical Records',10305),(10308,0,3,'Text 3','Example section 3',10307);
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section_pictures`
--

DROP TABLE IF EXISTS `section_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section_pictures` (
  `section` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  KEY `FK_fpgvw49vb6tytfbfcghj3o8sv` (`section`),
  CONSTRAINT `FK_fpgvw49vb6tytfbfcghj3o8sv` FOREIGN KEY (`section`) REFERENCES `section` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section_pictures`
--

LOCK TABLES `section_pictures` WRITE;
/*!40000 ALTER TABLE `section_pictures` DISABLE KEYS */;
INSERT INTO `section_pictures` VALUES (10304,'http://www.genrecords.org/mofiles/exms.html'),(10306,'http://www.genrecords.org/mofiles/exms.html'),(10308,'http://www.genrecords.org/mofiles/exms.html');
/*!40000 ALTER TABLE `section_pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `finder_cache_hours` int(11) NOT NULL,
  `max_cache_results` int(11) NOT NULL,
  `system_name` varchar(255) DEFAULT NULL,
  `vat` int(11) NOT NULL,
  `welcome_message_english` varchar(255) DEFAULT NULL,
  `welcome_message_spanish` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (10271,0,'https://tinyurl.com/acme-handy-worker-logo','+34',1,10,'Acme Handy Worker',21,'Welcome to Acme Handy Worker! Price, quality, and trust in a single place','¡Bienvenidos a Acme Handy Worker! Precio, calidad y confianza en el mismo sitio');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings_credit_card_makes`
--

DROP TABLE IF EXISTS `settings_credit_card_makes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings_credit_card_makes` (
  `settings` int(11) NOT NULL,
  `credit_card_makes` varchar(255) DEFAULT NULL,
  KEY `FK_n8dhv6h0w99ak0b1jdux2jus5` (`settings`),
  CONSTRAINT `FK_n8dhv6h0w99ak0b1jdux2jus5` FOREIGN KEY (`settings`) REFERENCES `settings` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings_credit_card_makes`
--

LOCK TABLES `settings_credit_card_makes` WRITE;
/*!40000 ALTER TABLE `settings_credit_card_makes` DISABLE KEYS */;
INSERT INTO `settings_credit_card_makes` VALUES (10271,'VISA'),(10271,'MASTER'),(10271,'DINNERS'),(10271,'AMEX');
/*!40000 ALTER TABLE `settings_credit_card_makes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings_negative_words`
--

DROP TABLE IF EXISTS `settings_negative_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings_negative_words` (
  `settings` int(11) NOT NULL,
  `negative_words` varchar(255) DEFAULT NULL,
  KEY `FK_6880p8eld4yoc8k18b1s1rv4j` (`settings`),
  CONSTRAINT `FK_6880p8eld4yoc8k18b1s1rv4j` FOREIGN KEY (`settings`) REFERENCES `settings` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings_negative_words`
--

LOCK TABLES `settings_negative_words` WRITE;
/*!40000 ALTER TABLE `settings_negative_words` DISABLE KEYS */;
INSERT INTO `settings_negative_words` VALUES (10271,'not'),(10271,'bad'),(10271,'horrible'),(10271,'average'),(10271,'disaster'),(10271,'no'),(10271,'malo'),(10271,'mala'),(10271,'horrible'),(10271,'mediocre'),(10271,'desastre');
/*!40000 ALTER TABLE `settings_negative_words` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings_positive_words`
--

DROP TABLE IF EXISTS `settings_positive_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings_positive_words` (
  `settings` int(11) NOT NULL,
  `positive_words` varchar(255) DEFAULT NULL,
  KEY `FK_1sodb7sxivjhq0ubxo9h3iy1s` (`settings`),
  CONSTRAINT `FK_1sodb7sxivjhq0ubxo9h3iy1s` FOREIGN KEY (`settings`) REFERENCES `settings` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings_positive_words`
--

LOCK TABLES `settings_positive_words` WRITE;
/*!40000 ALTER TABLE `settings_positive_words` DISABLE KEYS */;
INSERT INTO `settings_positive_words` VALUES (10271,'good'),(10271,'fantastic'),(10271,'excellent'),(10271,'great'),(10271,'amazing'),(10271,'terrific'),(10271,'beautiful'),(10271,'bueno'),(10271,'fantástico'),(10271,'buena'),(10271,'fantástica'),(10271,'excelente'),(10271,'gran'),(10271,'increíble'),(10271,'terrorífico'),(10271,'hermoso'),(10271,'terrorífica'),(10271,'hermosa');
/*!40000 ALTER TABLE `settings_positive_words` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings_spam_words`
--

DROP TABLE IF EXISTS `settings_spam_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings_spam_words` (
  `settings` int(11) NOT NULL,
  `spam_words` varchar(255) DEFAULT NULL,
  KEY `FK_8jmx08nq82f8i8hkf4rv6lnyq` (`settings`),
  CONSTRAINT `FK_8jmx08nq82f8i8hkf4rv6lnyq` FOREIGN KEY (`settings`) REFERENCES `settings` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings_spam_words`
--

LOCK TABLES `settings_spam_words` WRITE;
/*!40000 ALTER TABLE `settings_spam_words` DISABLE KEYS */;
INSERT INTO `settings_spam_words` VALUES (10271,'sex'),(10271,'viagra'),(10271,'cialis'),(10271,'one million'),(10271,'you\'ve been selected'),(10271,'Nigeria'),(10271,'sexo'),(10271,'un millón'),(10271,'ha sido seleccionado');
/*!40000 ALTER TABLE `settings_spam_words` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_profile`
--

DROP TABLE IF EXISTS `social_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_profile` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `network_name` varchar(255) DEFAULT NULL,
  `nick` varchar(255) DEFAULT NULL,
  `profile` varchar(255) DEFAULT NULL,
  `actor` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_profile`
--

LOCK TABLES `social_profile` WRITE;
/*!40000 ALTER TABLE `social_profile` DISABLE KEYS */;
INSERT INTO `social_profile` VALUES (10272,0,'Twitter','Manolete4','https://profile.es/',10186),(10273,0,'Twitter','Manolete5','https://profile.es/',10186),(10274,0,'Twitter','Alfonso','https://profile.es/',10209),(10275,0,'Facebook','AlfonsoFB','https://profile.es/',10209),(10276,0,'Tinder','Alfonsito_guapete','https://profile.es/',10209),(10277,0,'Tumblr','Alfonsitx','https://profile.es/',10209),(10331,0,'Twitter','Manolete','https://profile.es/',10278),(10332,0,'Twitter','Manolete2','https://profile.es/',10279),(10333,0,'Twitter','Manolete3','https://profile.es/',10280);
/*!40000 ALTER TABLE `social_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsor`
--

DROP TABLE IF EXISTS `sponsor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sponsor` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `suspicious` bit(1) DEFAULT NULL,
  `user_account` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_du2w5ldt8rvlvxvtr7vyxk7g3` (`user_account`),
  CONSTRAINT `FK_du2w5ldt8rvlvxvtr7vyxk7g3` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsor`
--

LOCK TABLES `sponsor` WRITE;
/*!40000 ALTER TABLE `sponsor` DISABLE KEYS */;
INSERT INTO `sponsor` VALUES (10214,0,'C/ Vietnam','nachete@hotmail.com','Militar','Nacho','+34(456)123456757','https://static.boredpanda.com/blog/wp-content/uploads/2014/10/funny-military-soldiers-photos-33__605.jpg','Barba','\0',10183),(10215,0,'C/ Achoooooo','yisusmurciano@gmail.com','Murcia','Jesus','+34(456)123456756','https://cdn.memegenerator.es/imagenes/memes/full/24/87/24874063.jpg','Gomez','\0',10184),(10216,0,'C/ Duero','ramire@gmail.com','JovenJavier','Javier','+34(456)123456755','http://blogs.elespectador.com/wp-content/uploads/2015/09/Peter_Pan2.jpg','Ramirez','\0',10185);
/*!40000 ALTER TABLE `sponsor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsorship`
--

DROP TABLE IF EXISTS `sponsorship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sponsorship` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `brand_name` varchar(255) DEFAULT NULL,
  `cvv_code` int(11) DEFAULT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `holder_name` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `page` varchar(255) DEFAULT NULL,
  `sponsor` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_huglhkud0ihqdljyou4eshra6` (`sponsor`),
  CONSTRAINT `FK_huglhkud0ihqdljyou4eshra6` FOREIGN KEY (`sponsor`) REFERENCES `sponsor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsorship`
--

LOCK TABLES `sponsorship` WRITE;
/*!40000 ALTER TABLE `sponsorship` DISABLE KEYS */;
INSERT INTO `sponsorship` VALUES (10217,0,'http://www.banner.com','VISA',323,'2020-11-28 23:59:59','Juanito Doe','4929611293211664','http://www.page.com',10214),(10218,0,'http://www.banner2.com','VISA',456,'2020-11-12 23:59:59','Lule Molina','4929611293211664','http://www.page2.com',10215),(10219,0,'http://www.banner3.com','VISA',574,'2020-11-13 23:59:59','Javier Ramirez','4929611293211664','http://www.page3.com',10216);
/*!40000 ALTER TABLE `sponsorship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutorial`
--

DROP TABLE IF EXISTS `tutorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutorial` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `moment` datetime DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `handy_worker` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_h3kf333e47c4tsjbt69k121gv` (`handy_worker`),
  CONSTRAINT `FK_h3kf333e47c4tsjbt69k121gv` FOREIGN KEY (`handy_worker`) REFERENCES `handy_worker` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutorial`
--

LOCK TABLES `tutorial` WRITE;
/*!40000 ALTER TABLE `tutorial` DISABLE KEYS */;
INSERT INTO `tutorial` VALUES (10303,0,'2009-02-09 00:00:00','Como se entrenan los dragones','Como entrenar a tu dragon',10278),(10305,0,'2009-12-09 00:00:00','Como se entrenan los dragones 2','Como entrenar a tu dragon 2',10279),(10307,0,'2011-02-09 00:00:00','Como se entrenan los dragones 3','Como entrenar a tu dragon 3',10280);
/*!40000 ALTER TABLE `tutorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutorial_pictures`
--

DROP TABLE IF EXISTS `tutorial_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutorial_pictures` (
  `tutorial` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  KEY `FK_qs2evqr8v3v51g320t0khv4ef` (`tutorial`),
  CONSTRAINT `FK_qs2evqr8v3v51g320t0khv4ef` FOREIGN KEY (`tutorial`) REFERENCES `tutorial` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutorial_pictures`
--

LOCK TABLES `tutorial_pictures` WRITE;
/*!40000 ALTER TABLE `tutorial_pictures` DISABLE KEYS */;
INSERT INTO `tutorial_pictures` VALUES (10303,'https://cdn.pixabay.com/user/2015/01/20/20-56-42-330_250x250.jpg'),(10303,'https://cdn.pixabay.com/user/2015/01/20/20-56-42-330_250x250.jpg'),(10305,'https://cdn.pixabay.com/user/2015/01/20/20-56-42-330_250x250.jpg'),(10305,'https://cdn.pixabay.com/user/2015/01/20/20-56-42-330_250x250.jpg'),(10307,'https://cdn.pixabay.com/user/2015/01/20/20-56-42-330_250x250.jpg'),(10307,'https://cdn.pixabay.com/user/2015/01/20/20-56-42-330_250x250.jpg');
/*!40000 ALTER TABLE `tutorial_pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutorial_sponsorships`
--

DROP TABLE IF EXISTS `tutorial_sponsorships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutorial_sponsorships` (
  `tutorial` int(11) NOT NULL,
  `sponsorships` int(11) NOT NULL,
  KEY `FK_ro1nou3bvjujnw7jrkgq2phy2` (`sponsorships`),
  KEY `FK_ja6vbw0v14lwf4fq40r7eluyq` (`tutorial`),
  CONSTRAINT `FK_ja6vbw0v14lwf4fq40r7eluyq` FOREIGN KEY (`tutorial`) REFERENCES `tutorial` (`id`),
  CONSTRAINT `FK_ro1nou3bvjujnw7jrkgq2phy2` FOREIGN KEY (`sponsorships`) REFERENCES `sponsorship` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutorial_sponsorships`
--

LOCK TABLES `tutorial_sponsorships` WRITE;
/*!40000 ALTER TABLE `tutorial_sponsorships` DISABLE KEYS */;
/*!40000 ALTER TABLE `tutorial_sponsorships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_account`
--

DROP TABLE IF EXISTS `user_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_account` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `banned` bit(1) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_castjbvpeeus0r8lbpehiu0e4` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account`
--

LOCK TABLES `user_account` WRITE;
/*!40000 ALTER TABLE `user_account` DISABLE KEYS */;
INSERT INTO `user_account` VALUES (10171,0,'\0','e00cf25ad42683b3df678c61f42c6bda','admin1'),(10172,0,'\0','system','system'),(10173,0,'\0','c84258e9c39059a89ab77d846ddab909','admin2'),(10174,0,'\0','ffbc4675f864e0e9aab8bdf7a0437010','customer1'),(10175,0,'\0','5ce4d191fd14ac85a1469fb8c29b7a7b','customer2'),(10176,0,'\0','033f7f6121501ae98285ad77f216d5e7','customer3'),(10177,0,'\0','55feb130be438e686ad6a80d12dd8f44','customer4'),(10178,0,'\0','092d469d0a71c8002e32f808b861f9a4','referee1'),(10179,0,'\0','78da4cd657c85d3cf54ae4497ed223f2','handyWorker1'),(10180,0,'\0','118ad5acc8ff3ea8006c280b310cd492','handyWorker2'),(10181,0,'\0','c210fdd660ad5034b88ad8bb9c135c26','handyWorker3'),(10182,0,'\0','e14d43d31080bd377e4984615da9f3aa','handyWorker4'),(10183,0,'\0','42c63ad66d4dc07ed17753772bef96d6','sponsor1'),(10184,0,'\0','3dc67f80a03324e01b1640f45d107485','sponsor2'),(10185,0,'\0','857a54956061fdc1b88d7722cafe6519','sponsor3');
/*!40000 ALTER TABLE `user_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_account_authorities`
--

DROP TABLE IF EXISTS `user_account_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_account_authorities` (
  `user_account` int(11) NOT NULL,
  `authority` varchar(255) DEFAULT NULL,
  KEY `FK_pao8cwh93fpccb0bx6ilq6gsl` (`user_account`),
  CONSTRAINT `FK_pao8cwh93fpccb0bx6ilq6gsl` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account_authorities`
--

LOCK TABLES `user_account_authorities` WRITE;
/*!40000 ALTER TABLE `user_account_authorities` DISABLE KEYS */;
INSERT INTO `user_account_authorities` VALUES (10171,'ADMIN'),(10172,'ADMIN'),(10173,'ADMIN'),(10174,'CUSTOMER'),(10175,'CUSTOMER'),(10176,'CUSTOMER'),(10177,'CUSTOMER'),(10178,'REFEREE'),(10179,'HANDYWORKER'),(10180,'HANDYWORKER'),(10181,'HANDYWORKER'),(10182,'HANDYWORKER'),(10183,'SPONSOR'),(10184,'SPONSOR'),(10185,'SPONSOR');
/*!40000 ALTER TABLE `user_account_authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warranty`
--

DROP TABLE IF EXISTS `warranty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warranty` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `draft` bit(1) DEFAULT NULL,
  `laws` varchar(255) DEFAULT NULL,
  `terms` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warranty`
--

LOCK TABLES `warranty` WRITE;
/*!40000 ALTER TABLE `warranty` DISABLE KEYS */;
INSERT INTO `warranty` VALUES (10220,0,'','Leyes,muchas leyes','Terminos, muchos terminos','El titulo de Warranty'),(10221,0,'\0','Leyes,muchas leyes 2','Terminos, muchos terminos 2','El titulo de Warranty 2'),(10222,0,'\0','Leyes,muchas leyes 3','Terminos, muchos terminos 3','El titulo de Warranty 3'),(10223,0,'','Leyes,muchas leyes 4','Terminos, muchos terminos 4','El titulo de Warranty 4'),(10224,0,'\0','Las hicieron en el 78','Algo de España y los españoles','La Constitución Española'),(10225,0,'','La del mejor adaptado','Los seres evolucionan','La selección natural');
/*!40000 ALTER TABLE `warranty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_plan`
--

DROP TABLE IF EXISTS `work_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_plan` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `fixup_task` int(11) NOT NULL,
  `handy_worker` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_cxi02n4qolkegxhl9h7vlck0u` (`fixup_task`),
  KEY `FK_7bvwv5nwykviyg5s0yfwfh9qf` (`handy_worker`),
  CONSTRAINT `FK_7bvwv5nwykviyg5s0yfwfh9qf` FOREIGN KEY (`handy_worker`) REFERENCES `handy_worker` (`id`),
  CONSTRAINT `FK_cxi02n4qolkegxhl9h7vlck0u` FOREIGN KEY (`fixup_task`) REFERENCES `fixup_task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_plan`
--

LOCK TABLES `work_plan` WRITE;
/*!40000 ALTER TABLE `work_plan` DISABLE KEYS */;
INSERT INTO `work_plan` VALUES (10362,0,10309,10278),(10365,0,10311,10279),(10367,0,10312,10280),(10369,0,10313,10281);
/*!40000 ALTER TABLE `work_plan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-15 17:28:37

commit;
