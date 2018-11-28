-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2018 at 08:01 AM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbtarea`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Geteditorials` ()  NO SQL
Select editorial.CodigoEd , editorial.NombreEd
from editorial$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetLibros` ()  READS SQL DATA
Select  libros.ID, libros.Nombre, libros.Autor, libros.Precio, editorial.NombreEd
from libros
join editorial on editorial.CodigoEd = libros.Editorial$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `increaseby10` (IN `Id_Edit` INT)  NO SQL
Update libros
set libros.Precio =  libros.Precio + libros.Precio*0.10
where libros.Editorial =Id_Edit$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Increasebyany` (IN `ID_edit` INT, IN `aumento` INT)  NO SQL
Update libros
set libros.Precio =  libros.Precio + libros.Precio*(aumento/100)
where libros.Editorial = ID_edit$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `editorial`
--

CREATE TABLE `editorial` (
  `CodigoEd` int(11) NOT NULL,
  `NombreEd` varchar(20) NOT NULL,
  `Descript` varchar(20) NOT NULL,
  `Fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `editorial`
--

INSERT INTO `editorial` (`CodigoEd`, `NombreEd`, `Descript`, `Fecha`) VALUES
(1, 'Santillana', 'Editorial Santillana', '2018-11-20'),
(2, 'Uned', 'Editorial Uned', '2018-11-12');

-- --------------------------------------------------------

--
-- Table structure for table `libros`
--

CREATE TABLE `libros` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `Autor` varchar(20) NOT NULL,
  `Editorial` int(25) NOT NULL,
  `Precio` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `libros`
--

INSERT INTO `libros` (`ID`, `Nombre`, `Autor`, `Editorial`, `Precio`) VALUES
(1, 'Libro1', 'Pedro Castro', 1, '2768167'),
(2, 'Libro2', 'Carlos Rodriguez', 2, '495224');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID`, `Email`, `password`) VALUES
(1, 'vasquez1805@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b'),
(2, 'jantonio.brenescarranza@gmail.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `editorial`
--
ALTER TABLE `editorial`
  ADD PRIMARY KEY (`CodigoEd`);

--
-- Indexes for table `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_editorial` (`Editorial`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `libros`
--
ALTER TABLE `libros`
  ADD CONSTRAINT `FK_editorial` FOREIGN KEY (`Editorial`) REFERENCES `editorial` (`CodigoEd`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
