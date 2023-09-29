-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-09-2023 a las 23:37:09
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
-- Base de datos: `punto1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `rut_cliente` int(10) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Comuna` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`rut_cliente`, `Nombre`, `Comuna`) VALUES
(1234, 'Pepe', 'Los condes'),
(3232, 'Ruben', 'Providencia'),
(3242, 'David', 'Buenavista'),
(5678, 'Andrea', 'PuebloNuevo'),
(6969, 'Juancho', 'Patio Bonito'),
(8868, 'Carlos', 'Puntaverde');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deptos`
--

CREATE TABLE `deptos` (
  `numdep` int(10) UNSIGNED NOT NULL,
  `Ciudad` varchar(40) DEFAULT NULL,
  `Nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `deptos`
--

INSERT INTO `deptos` (`numdep`, `Ciudad`, `Nombre`) VALUES
(1, 'Cordoba', 'Monteria'),
(2, 'Antioquia', 'Las Condes'),
(3, 'Atlantico', 'NEW YORK'),
(4, 'Bolivar', 'Providencia'),
(5, 'Cundinamarca', 'Bogota');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `rut_empleado` int(10) UNSIGNED NOT NULL,
  `DEPTOS_numdep` int(10) UNSIGNED NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Cargo` varchar(50) DEFAULT NULL,
  `Rut_jefe` int(10) UNSIGNED DEFAULT NULL,
  `Comision` int(10) UNSIGNED DEFAULT NULL,
  `Sueldo` int(15) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`rut_empleado`, `DEPTOS_numdep`, `Nombre`, `Cargo`, `Rut_jefe`, `Comision`, `Sueldo`) VALUES
(1133, 3, 'ALIRIO', 'Manager', 1133, 45, 2000000),
(1222, 2, 'WARD', 'Vendedor', 3545, 5, 300000),
(1238, 3, 'TURNER', 'Vendedor', 1133, 10, 200000),
(1253, 1, 'ALIRIO', 'Manager', 3545, 35, 1250000),
(1333, 1, 'MARTIN', 'Vendedor', 2132, 10, 500000),
(1444, 1, 'ALLEN', 'Vendedor', 2132, 20, 800000),
(1555, 2, 'SCOTT', 'Vendedor', 3545, 15, 600000),
(2132, 1, 'VIKTOR', 'Manager', 2132, 35, 1220000),
(2164, 3, 'SAM', 'Vendedor', 1133, 22, 500000),
(2310, 4, 'MAT', 'Manager', 2310, 37, 2300000),
(2333, 4, 'AUSIT', 'Vendedor', 2310, 15, 222220),
(7656, 4, 'KEVIN', 'Vendedor', 2310, 11, 333330);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grados`
--

CREATE TABLE `grados` (
  `Grado` int(10) UNSIGNED NOT NULL,
  `Sueldoinf` int(10) UNSIGNED DEFAULT NULL,
  `Sueldosup` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `grados`
--

INSERT INTO `grados` (`Grado`, `Sueldoinf`, `Sueldosup`) VALUES
(1, 500000, 600000),
(2, 200000, 300000),
(3, 300000, 400000),
(4, 200000, 250000),
(5, 1250000, 1350000),
(6, 500000, 580000),
(7, 800000, 899000),
(8, 600000, 690000),
(9, 1220000, 1320000),
(10, 500000, 595000),
(11, 2300000, 2400000),
(12, 222220, 256220);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `Cod_PRODUCTOS` int(10) UNSIGNED NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Precio` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`Cod_PRODUCTOS`, `Nombre`, `Precio`) VALUES
(12185, 'Dvds', 24000),
(12322, 'Proyectores', 30000),
(12433, 'Televisores', 30000),
(12989, 'Mesas', 30000),
(22225, 'Graficas', 15000),
(54321, 'Mouses', 22000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `numventa` int(10) NOT NULL,
  `Monto` int(10) DEFAULT NULL,
  `Fecha` date NOT NULL,
  `RutVende` int(10) NOT NULL,
  `rut_cliente` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`numventa`, `Monto`, `Fecha`, `RutVende`, `rut_cliente`) VALUES
(2, 37000, '2023-09-28', 1222, 1234),
(11, 45000, '2023-09-29', 1222, 3232),
(12, 120000, '2023-08-16', 1238, 3242),
(23, 30000, '2023-07-12', 1238, 5678),
(24, 90000, '2023-05-23', 1333, 6969),
(29, 54000, '2023-07-04', 1333, 8868),
(32, 39000, '2023-09-20', 1444, 3242),
(51, 52000, '2023-09-08', 1444, 3232),
(53, 45000, '2023-06-01', 1555, 1234),
(64, 84000, '2023-09-20', 1555, 5678),
(66, 112000, '2023-01-25', 2164, 1234),
(76, 75000, '2023-09-16', 2333, 8868),
(79, 22000, '2023-11-25', 7656, 8868),
(89, 37000, '2023-05-24', 2164, 6969);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas_detalle`
--

CREATE TABLE `ventas_detalle` (
  `Cod_PRODUCTOS` int(10) UNSIGNED NOT NULL,
  `VENTAS_numventa` int(10) NOT NULL,
  `cantidad` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ventas_detalle`
--

INSERT INTO `ventas_detalle` (`Cod_PRODUCTOS`, `VENTAS_numventa`, `cantidad`) VALUES
(54321, 2, 3),
(12322, 11, 2),
(12989, 12, 4),
(54321, 23, 1),
(12989, 24, 3),
(12185, 29, 3),
(12322, 32, 2),
(54321, 51, 4),
(22225, 53, 3),
(12185, 64, 2),
(54321, 66, 1),
(22225, 76, 2),
(54321, 79, 2),
(54321, 89, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`rut_cliente`);

--
-- Indices de la tabla `deptos`
--
ALTER TABLE `deptos`
  ADD PRIMARY KEY (`numdep`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`rut_empleado`),
  ADD KEY `EMPLEADOS_FKIndex2` (`DEPTOS_numdep`),
  ADD KEY `IFK_Rel_05` (`DEPTOS_numdep`);

--
-- Indices de la tabla `grados`
--
ALTER TABLE `grados`
  ADD PRIMARY KEY (`Grado`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`Cod_PRODUCTOS`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`numventa`),
  ADD KEY `VENTAS_FKIndex1` (`rut_cliente`),
  ADD KEY `IFK_Rel_06` (`rut_cliente`);

--
-- Indices de la tabla `ventas_detalle`
--
ALTER TABLE `ventas_detalle`
  ADD KEY `VENTAS_DETALLE_FKIndex1` (`VENTAS_numventa`),
  ADD KEY `VENTAS_DETALLE_FKIndex2` (`Cod_PRODUCTOS`),
  ADD KEY `IFK_Rel_02` (`VENTAS_numventa`),
  ADD KEY `IFK_Rel_03` (`Cod_PRODUCTOS`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`DEPTOS_numdep`) REFERENCES `deptos` (`numdep`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`rut_cliente`) REFERENCES `clientes` (`rut_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ventas_detalle`
--
ALTER TABLE `ventas_detalle`
  ADD CONSTRAINT `ventas_detalle_ibfk_1` FOREIGN KEY (`VENTAS_numventa`) REFERENCES `ventas` (`numventa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ventas_detalle_ibfk_2` FOREIGN KEY (`Cod_PRODUCTOS`) REFERENCES `productos` (`Cod_PRODUCTOS`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
