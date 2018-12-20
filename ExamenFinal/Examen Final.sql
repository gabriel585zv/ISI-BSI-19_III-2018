-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: examenfinal
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.37-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `estudiantes`
--

DROP TABLE IF EXISTS `estudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `estudiantes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Cedula` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Apellidos` varchar(100) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Telefono` char(8) DEFAULT NULL,
  `Genero` char(1) DEFAULT NULL,
  `TallaCamisa` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`ID`,`Cedula`),
  UNIQUE KEY `Cedula` (`Cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiantes`
--

LOCK TABLES `estudiantes` WRITE;
/*!40000 ALTER TABLE `estudiantes` DISABLE KEYS */;
INSERT INTO `estudiantes` VALUES (1,207120484,'oioi','ioio','no','909','M','XS'),(2,234343532,'estudiante','Zuniga','none@none.com','3333','M',''),(3,8990,'oioi','ioio','no','909','M','XS'),(8,8,'uiui','iui','jkjk','98989','M','XS'),(9,0,'','','','','M','XS');
/*!40000 ALTER TABLE `estudiantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluaciones`
--

DROP TABLE IF EXISTS `evaluaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `evaluaciones` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT NULL,
  `Proyecto` int(11) DEFAULT NULL,
  `CalificacionRubro1` tinyint(4) DEFAULT NULL,
  `CalificacionRubro2` tinyint(4) DEFAULT NULL,
  `CalificacionRubro3` tinyint(4) DEFAULT NULL,
  `CalificacionRubro4` tinyint(4) DEFAULT NULL,
  `CalificacionRubro5` tinyint(4) DEFAULT NULL,
  `CalificacionRubro6` tinyint(4) DEFAULT NULL,
  `CalificacionRubro7` tinyint(4) DEFAULT NULL,
  `CalificacionRubro8` tinyint(4) DEFAULT NULL,
  `CalificacionRubro9` tinyint(4) DEFAULT NULL,
  `CalificacionRubro10` tinyint(4) DEFAULT NULL,
  `Total` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `evaluaciones_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `proyectos` (`idProyecto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluaciones`
--

LOCK TABLES `evaluaciones` WRITE;
/*!40000 ALTER TABLE `evaluaciones` DISABLE KEYS */;
INSERT INTO `evaluaciones` VALUES (1,'0000-00-00 00:00:00',1,2,5,6,8,9,6,4,6,5,9,45),(2,'0000-00-00 00:00:00',1,4,5,6,8,9,6,4,6,5,9,12),(3,'0000-00-00 00:00:00',1,1,1,1,1,1,1,1,1,1,1,12);
/*!40000 ALTER TABLE `evaluaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juez`
--

DROP TABLE IF EXISTS `juez`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `juez` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Cedula` int(11) DEFAULT NULL,
  `Nombre` varchar(25) DEFAULT NULL,
  `Apellidos` varchar(25) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Telefono` int(11) DEFAULT NULL,
  `Genero` char(1) DEFAULT NULL,
  `Username` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Cedula` (`Cedula`),
  KEY `fk_username` (`Username`),
  CONSTRAINT `fk_username` FOREIGN KEY (`Username`) REFERENCES `users` (`Username`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juez`
--

LOCK TABLES `juez` WRITE;
/*!40000 ALTER TABLE `juez` DISABLE KEYS */;
INSERT INTO `juez` VALUES (1,207142,'asdsd','dfdsaf','sdfdf',4545,'s','juez1'),(2,207120484,'Gabriel','Zuniga ','none@none.com',85907652,'M','juez2'),(4,21212,'adssd','sdsd','@',866566,'M','juez3'),(14,233,'testo','testp','none',7878,'m','test564'),(15,909,'oioi','oioi','none@none.com',99909,'M','oioioiopoipo'),(24,9,'Gabriel','Zuniga','vasquez1805@gmail.com',7878,'M','gabo89'),(25,989,'klk','kjj','jk',0,'M','jkkjkjk'),(26,999,'jkjkj','jkjk','jkjk',999,'M','oioioi'),(27,0,'','','',0,'M','');
/*!40000 ALTER TABLE `juez` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyectos`
--

DROP TABLE IF EXISTS `proyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `proyectos` (
  `idProyecto` int(11) NOT NULL AUTO_INCREMENT,
  `Codigo` char(5) DEFAULT NULL,
  `Nombre` varchar(200) DEFAULT NULL,
  `Descripcion` varchar(3000) DEFAULT NULL,
  `Centroeducativo` varchar(200) DEFAULT NULL,
  `Provincia` char(1) DEFAULT NULL,
  `Canton` char(3) DEFAULT NULL,
  `Distrito` varchar(5) DEFAULT NULL,
  `Docentetutor` varchar(200) DEFAULT NULL,
  `Calificaciondocumento` double DEFAULT NULL,
  `Calificacionjuzg` double DEFAULT NULL,
  `Calificaciontotal` double DEFAULT NULL,
  `Estudiante1` int(11) DEFAULT NULL,
  `Estudiante2` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProyecto`),
  KEY `fk_estudiante1` (`Estudiante1`),
  KEY `fk_estudiante2` (`Estudiante2`),
  CONSTRAINT `fk_estudiante1` FOREIGN KEY (`Estudiante1`) REFERENCES `estudiantes` (`ID`),
  CONSTRAINT `fk_estudiante2` FOREIGN KEY (`Estudiante2`) REFERENCES `estudiantes` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectos`
--

LOCK TABLES `proyectos` WRITE;
/*!40000 ALTER TABLE `proyectos` DISABLE KEYS */;
INSERT INTO `proyectos` VALUES (1,'ABC','Gabriel','algo','Heredia','H','Flo','San J','Marcos',5,9,45,1,1),(2,'COD-1','Proyecto1','Descripcion','Heredia','H','Flo','Distr','Docente',1,1,1,1,1),(3,'COD-1','Proyecto1','Descripcion','Heredia','H','Flo','Distr','Docente',1,1,1,1,1),(4,'jh','hjasd','<p>Descripcion con editor</p>','asd','1','5','1','ad',4,4,4,1,1),(5,'COD-5','Proyecto1','Descripcion','Heredia','H','Flo','Distr','Docente',1,1,1,1,1),(8,'as','sd','Descripcion','ad','5','1','1','asd',4,4,4,1,1);
/*!40000 ALTER TABLE `proyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `roles` (
  `idrol` int(11) NOT NULL,
  `rolDesc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin'),(2,'Juez');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `Username` varchar(25) NOT NULL,
  `idrol` int(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Username`),
  KEY `fk_rol` (`idrol`),
  CONSTRAINT `fk_rol` FOREIGN KEY (`idrol`) REFERENCES `roles` (`idrol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('',2,'7865c704a8c2721a36ea35bfc585236de2140bb2'),('$Username ',2,'$password'),('gabo',1,'9a8ed596716a71f95e1ee9a330741be18e4ddd0f'),('gabo89',2,'b904'),('gabriel.test2',2,'Qwerty2018.'),('gabriel.test33',2,'Qwerty2018.'),('gabriel.test388',2,'Qwerty2018.'),('jkkjkjk',2,'b67b'),('juez1',2,''),('juez10',2,'test'),('juez11',2,'test'),('juez2',2,NULL),('juez3',2,NULL),('juez5',2,'test'),('juez6',2,'test'),('juez7',2,'test'),('juez8',2,'test'),('oioioi',2,'a6979dc879a84b82499ca8719c46bf4f7ff03b70'),('oioioiopoipo',2,''),('test453',2,'test'),('test564',2,'test123');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'examenfinal'
--
/*!50003 DROP PROCEDURE IF EXISTS `InsertJuez1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertJuez1`(username varchar(25),role int,password varchar(255),
ID int,cedula int,Nombre varchar(25),Apellidos varchar (25),Email varchar(45),Telefono int,
Genero char(1)
)
BEGIN
INSERT INTO users(
Username, idrol, password) 
VALUES(username,role,password) 
ON DUPLICATE KEY UPDATE  Username= VALUES(username);

INSERT INTO juez(ID,
cedula, Nombre, Apellidos,Email,Telefono,Genero,Username) 
VALUES(ID,cedula,Nombre,Apellidos,Email,Telefono,Genero,username) 
ON DUPLICATE KEY UPDATE  cedula=cedula,Nombre=Nombre,Apellidos=Apellidos,
Email=Email,Telefono=Telefono,Genero=Genero;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `newestudiante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `newestudiante`(ID int,Cedula int, Nombre varchar(100),
Apellidos varchar(100),Email VARCHAR (255),Telefono Char (8),Genero CHAR (1),
TallaCamisa VARCHAR (3)
)
BEGIN


INSERT INTO estudiantes(
ID, Cedula, Nombre,Apellidos,Email,Telefono,Genero,TallaCamisa) 
VALUES(ID,Cedula,Nombre,Apellidos,Email,Telefono,Genero,TallaCamisa) 
ON DUPLICATE KEY UPDATE  Cedula=Cedula,Nombre=Nombre,Apellidos=Apellidos,
Email =Email,Telefono =Telefono,Genero=Genero,TallaCamisa =TallaCamisa;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `newproyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `newproyecto`(idProyecto int, Codigo CHAR(5),
Nombre Varchar (200),Descripcion varchar(3000),CentroEducativo Varchar (200) ,
Provincia CHAR (1),Canton Char (3),Distrito varchar(5),Docentetutor varchar (200),
Calificaciondocumento double,Calificacionjuzg double,
Calificaciontotal double,Estudiante1 int ,Estudiante2 int)
BEGIN
INSERT INTO proyectos(
idProyecto, Codigo, Nombre,Descripcion,CentroEducativo,Provincia,
Canton,Distrito,Docentetutor,Calificaciondocumento,Calificacionjuzg,
Calificaciontotal,Estudiante1,Estudiante2) 
VALUES(idProyecto,Codigo,Nombre,Descripcion,CentroEducativo,Provincia,
Canton,Distrito,Docentetutor,Calificaciondocumento,Calificacionjuzg,
Calificaciontotal,Estudiante1,Estudiante2

) 
ON DUPLICATE KEY UPDATE  Codigo=Codigo,Nombre=Nombre,
Descripcion=Descripcion,CentroEducativo=CentroEducativo,Provincia=Provincia,
Canton =Canton,Distrito=Distrito,Docentetutor=Docentetutor,Calificaciondocumento=Calificaciondocumento,
Calificacionjuzg=Calificacionjuzg,Calificaciontotal=Calificaciontotal,
Estudiante1=Estudiante1,Estudiante2=Estudiante2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_evaluacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_evaluacion`( fecha datetime, Proyecto int,CalificacionRubro1 tinyint(4),
CalificacionRubro2 tinyint(4),CalificacionRubro3 tinyint(4),CalificacionRubro4 tinyint(4),CalificacionRubro5 tinyint(4),CalificacionRubro6 tinyint(4),
CalificacionRubro7 tinyint(4),CalificacionRubro8 tinyint(4),CalificacionRubro9 tinyint(4),CalificacionRubro10 tinyint(4) ,Total tinyint(4))
BEGIN

INSERT INTO evaluaciones( fecha,Proyecto,CalificacionRubro1,
CalificacionRubro2,CalificacionRubro3,CalificacionRubro4,CalificacionRubro5,
CalificacionRubro6,CalificacionRubro7,CalificacionRubro8,CalificacionRubro9,
CalificacionRubro10,Total 
) 
VALUES( fecha,Proyecto,CalificacionRubro1,
CalificacionRubro2,CalificacionRubro3,CalificacionRubro4,CalificacionRubro5,
CalificacionRubro6,CalificacionRubro7,CalificacionRubro8,CalificacionRubro9,
CalificacionRubro10,Total ) 
ON DUPLICATE KEY UPDATE  Proyecto= Proyecto,
CalificacionRubro1=CalificacionRubro1,CalificacionRubro2=CalificacionRubro2,CalificacionRubro3=CalificacionRubro3,
CalificacionRubro4=CalificacionRubro4,CalificacionRubro5=CalificacionRubro5,CalificacionRubro6=CalificacionRubro6,
CalificacionRubro7=CalificacionRubro7,CalificacionRubro8=CalificacionRubro8,CalificacionRubro9=CalificacionRubro9,
CalificacionRubro10=CalificacionRubro10,Total=Total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-17  0:57:53
