-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-09-2023 a las 23:39:44
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ejercisio04`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `department`
--

CREATE TABLE `department` (
  `dnumber` int(11) NOT NULL COMMENT 'TRIAL',
  `dname` longtext NOT NULL COMMENT 'TRIAL',
  `mgrstardate` date NOT NULL COMMENT 'TRIAL',
  `mgrssn` double NOT NULL COMMENT 'TRIAL',
  `trial340` char(1) DEFAULT NULL COMMENT 'TRIAL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='TRIAL';

--
-- Volcado de datos para la tabla `department`
--

INSERT INTO `department` (`dnumber`, `dname`, `mgrstardate`, `mgrssn`, `trial340`) VALUES
(1, 'Headquarters', '1981-06-19', 888665555, 'T'),
(4, 'Marketing', '1995-01-01', 987654321, 'T'),
(5, 'Finance', '1988-05-22', 333444555, 'T');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employee`
--

CREATE TABLE `employee` (
  `position_posnumber` int(11) NOT NULL COMMENT 'TRIAL',
  `department_dnumber` int(11) NOT NULL COMMENT 'TRIAL',
  `ssn` longtext NOT NULL COMMENT 'TRIAL',
  `superssn` longtext DEFAULT NULL COMMENT 'TRIAL',
  `fname` longtext NOT NULL COMMENT 'TRIAL',
  `lname` longtext NOT NULL COMMENT 'TRIAL',
  `bdate` date NOT NULL COMMENT 'TRIAL',
  `address` longtext NOT NULL COMMENT 'TRIAL',
  `sex` longtext NOT NULL COMMENT 'TRIAL',
  `salary` int(11) NOT NULL COMMENT 'TRIAL',
  `trial340` char(1) DEFAULT NULL COMMENT 'TRIAL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='TRIAL';

--
-- Volcado de datos para la tabla `employee`
--

INSERT INTO `employee` (`position_posnumber`, `department_dnumber`, `ssn`, `superssn`, `fname`, `lname`, `bdate`, `address`, `sex`, `salary`, `trial340`) VALUES
(1, 1, '888665555', '(null)', 'James', 'Borg', '2037-11-10', '450 Stone, Houston, TX', 'M', 55000, 'T'),
(2, 1, '987654321', '888665555', 'Jennifer', 'Wallace', '2041-06-20', '291 Berry, Bellaire, TX', 'F', 43000, 'T'),
(3, 1, '333445555', '888665555', 'Frankling', 'Wong', '2055-12-08', '638 Voss, Houston, TX', 'M', 40000, 'T'),
(4, 5, '123456789', '333445555', 'John', 'Smith', '2065-01-09', '731 Fondren, Houston, TX', 'M', 30000, 'T'),
(5, 5, '453453453', '333445555', 'Joyce', 'English', '1972-07-31', '5631 Rice, Houston, TX', 'F', 25000, 'T'),
(6, 5, '999887777', '123456789', 'Alicia', 'Zelaya', '2068-07-19', '3321 Castle, Sprinx, TX', 'F', 25000, 'T'),
(7, 5, '666554444', '123456789', 'Ramesh', 'Narayan', '2062-09-15', '975 Fire, Humble, TX', 'M', 38000, 'T'),
(8, 5, '987987987', '987654321', 'Ahmda', 'Jabbar', '2069-03-29', '980 Dallas, Houston, TX', 'M', 41000, 'T');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `position`
--

CREATE TABLE `position` (
  `posnumber` int(11) NOT NULL COMMENT 'TRIAL',
  `posname` longtext NOT NULL COMMENT 'TRIAL',
  `trial343` char(1) DEFAULT NULL COMMENT 'TRIAL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='TRIAL';

--
-- Volcado de datos para la tabla `position`
--

INSERT INTO `position` (`posnumber`, `posname`, `trial343`) VALUES
(1, 'President - CEO', 'T'),
(2, 'Vice President of Finance - CFO', 'T'),
(3, 'Vice President of Finance - CFO', 'T'),
(4, 'Treasurer', 'T'),
(5, 'Controller', 'T'),
(6, 'Cash Manager', 'T'),
(7, 'Credit', 'T'),
(8, 'Tax Manager', 'T'),
(9, 'CostAccounting Manager', 'T');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dnumber`);

--
-- Indices de la tabla `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`position_posnumber`,`department_dnumber`,`ssn`(255)),
  ADD KEY `position_has_department_fkindex1` (`position_posnumber`),
  ADD KEY `position_has_department_fkindex2` (`department_dnumber`),
  ADD KEY `ifk_rel_01` (`position_posnumber`),
  ADD KEY `ifk_rel_02` (`department_dnumber`);

--
-- Indices de la tabla `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`posnumber`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_department_dnumber_fkey` FOREIGN KEY (`department_dnumber`) REFERENCES `department` (`dnumber`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `employee_position_posnumber_fkey` FOREIGN KEY (`position_posnumber`) REFERENCES `position` (`posnumber`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
