-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-09-2023 a las 23:38:11
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
-- Base de datos: `ejercisio02`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dept2`
--

CREATE TABLE `dept2` (
  `id_Deptn2` int(2) NOT NULL,
  `dNombre` varchar(14) DEFAULT NULL,
  `Loc` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `dept2`
--

INSERT INTO `dept2` (`id_Deptn2`, `dNombre`, `Loc`) VALUES
(1, 'Icu', 'Sur'),
(2, 'Cardi', 'Norte'),
(3, 'Pulmi', 'Noreste'),
(4, 'Bezac', 'Centro'),
(5, 'Skinc', 'Sureste');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctor`
--

CREATE TABLE `doctor` (
  `id_Doctor` int(3) NOT NULL,
  `Hospital_id_Hospital` int(3) NOT NULL,
  `Apellido` varchar(13) DEFAULT NULL,
  `Especialidad` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `doctor`
--

INSERT INTO `doctor` (`id_Doctor`, `Hospital_id_Hospital`, `Apellido`, `Especialidad`) VALUES
(13, 3, 'Meza', 'Cardiologo'),
(69, 4, 'Munoz', 'Cirujia'),
(111, 2, 'Fuentes', 'Cabeza'),
(134, 4, 'Laza', 'Piel'),
(321, 4, 'Camargo', 'Pediatra');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id_empleado` int(4) NOT NULL,
  `dept2_id_Deptn2` int(2) NOT NULL,
  `apellido` varchar(10) DEFAULT NULL,
  `oficio` varchar(10) DEFAULT NULL,
  `dire` int(4) UNSIGNED DEFAULT NULL,
  `fecha_Alta` date DEFAULT NULL,
  `salario` int(10) DEFAULT NULL,
  `comision` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_empleado`, `dept2_id_Deptn2`, `apellido`, `oficio`, `dire`, `fecha_Alta`, `salario`, `comision`) VALUES
(1, 1, 'Montes', 'ENFERMERA', 4221, '2022-10-26', 2500000, 35),
(2, 2, 'Calle', 'CAMILLERO', 3254, '2023-02-22', 2100000, 12),
(3, 3, 'Hoyos', 'ENFERMERO', 9087, '2020-11-15', 1500000, 28),
(4, 4, 'Oyola', 'CAMILLERO', 0, '2021-03-13', 3500000, 9),
(5, 5, 'Cielo', 'BARRENDERO', 0, '2022-04-30', 1200000, 23);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enfermo`
--

CREATE TABLE `enfermo` (
  `inscripcion` int(4) NOT NULL,
  `apellido` varchar(10) DEFAULT NULL,
  `direccion` int(5) DEFAULT NULL,
  `fechaNac` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `enfermo`
--

INSERT INTO `enfermo` (`inscripcion`, `apellido`, `direccion`, `fechaNac`) VALUES
(1, 'Luz', 46723, '2004-06-09'),
(2, 'Carrion', 20412, '2002-08-01'),
(3, 'Velez', 98725, '2012-11-02'),
(4, 'Lopez', 0, '2018-09-15'),
(5, 'Villa', 76820, '2002-05-12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hospital`
--

CREATE TABLE `hospital` (
  `id_Hospital` int(3) NOT NULL,
  `Nombre` varchar(20) DEFAULT NULL,
  `Direccion` varchar(20) DEFAULT NULL,
  `Telefono` varchar(8) DEFAULT NULL,
  `Num_Cama` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `hospital`
--

INSERT INTO `hospital` (`id_Hospital`, `Nombre`, `Direccion`, `Telefono`, `Num_Cama`) VALUES
(1, 'Cuellar', '8730 Calle Larga', '52-237-6', 1),
(2, 'Marfl', '50 Parque Sueno', '42-548-7', 2),
(3, 'Waston', '92845 Calle b', '12-228-6', 3),
(4, 'Poldi', '6 Avenida Seis', '26-323-7', 4),
(5, 'Perjo', '42749 Parque Sur', '53-131-0', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ocupacion`
--

CREATE TABLE `ocupacion` (
  `Enfermo_inscripcion` int(4) NOT NULL,
  `Sala_id_sala` int(3) NOT NULL,
  `Hospital_id_Hospital` int(3) NOT NULL,
  `cama` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `ocupacion`
--

INSERT INTO `ocupacion` (`Enfermo_inscripcion`, `Sala_id_sala`, `Hospital_id_Hospital`, `cama`) VALUES
(3, 3, 3, 134),
(2, 2, 4, 421),
(4, 2, 3, 432),
(3, 4, 5, 422),
(2, 3, 5, 543);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plantilla`
--

CREATE TABLE `plantilla` (
  `Empleado_id_empleado` int(4) NOT NULL,
  `Sala_id_sala` int(3) NOT NULL,
  `Hospital_id_Hospital` int(3) NOT NULL,
  `Apellido` varchar(15) DEFAULT NULL,
  `funcion` varchar(20) DEFAULT NULL,
  `turno` varchar(20) DEFAULT NULL,
  `salario` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `plantilla`
--

INSERT INTO `plantilla` (`Empleado_id_empleado`, `Sala_id_sala`, `Hospital_id_Hospital`, `Apellido`, `funcion`, `turno`, `salario`) VALUES
(1, 1, 1, 'Cicedo', 'Anestesia', 'Dia', 2500000),
(2, 2, 2, 'Perez', 'Preparar', 'Tarde', 1500000),
(3, 3, 3, 'Pepo', 'Vacuna', 'Dia', 4000000),
(4, 4, 4, 'Orso', 'Utencilios', 'Noche', 3000000),
(5, 5, 5, 'Bill', 'Asistente', 'Tarde', 2000000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sala`
--

CREATE TABLE `sala` (
  `id_sala` int(3) NOT NULL,
  `Hospital_id_Hospital` int(3) NOT NULL,
  `Nombre` varchar(20) DEFAULT NULL,
  `Num_cama` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `sala`
--

INSERT INTO `sala` (`id_sala`, `Hospital_id_Hospital`, `Nombre`, `Num_cama`) VALUES
(1, 1, 'Terapia', 1),
(2, 2, 'Trauma', 2),
(3, 3, 'Anestesias', 3),
(4, 4, 'Cirujias', 4),
(5, 5, 'Lavados', 5);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `dept2`
--
ALTER TABLE `dept2`
  ADD PRIMARY KEY (`id_Deptn2`);

--
-- Indices de la tabla `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`id_Doctor`),
  ADD KEY `Doctor_FKIndex1` (`Hospital_id_Hospital`),
  ADD KEY `IFK_Rel_08` (`Hospital_id_Hospital`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_empleado`),
  ADD KEY `Empleado_FKIndex1` (`dept2_id_Deptn2`),
  ADD KEY `IFK_Rel_09` (`dept2_id_Deptn2`);

--
-- Indices de la tabla `enfermo`
--
ALTER TABLE `enfermo`
  ADD PRIMARY KEY (`inscripcion`);

--
-- Indices de la tabla `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`id_Hospital`);

--
-- Indices de la tabla `ocupacion`
--
ALTER TABLE `ocupacion`
  ADD KEY `Ocupacion_FKIndex1` (`Hospital_id_Hospital`),
  ADD KEY `Ocupacion_FKIndex2` (`Sala_id_sala`),
  ADD KEY `Ocupacion_FKIndex3` (`Enfermo_inscripcion`),
  ADD KEY `IFK_Rel_06` (`Hospital_id_Hospital`),
  ADD KEY `IFK_Rel_07` (`Sala_id_sala`),
  ADD KEY `IFK_Rel_10` (`Enfermo_inscripcion`);

--
-- Indices de la tabla `plantilla`
--
ALTER TABLE `plantilla`
  ADD KEY `Plantilla_FKIndex1` (`Hospital_id_Hospital`),
  ADD KEY `Plantilla_FKIndex2` (`Sala_id_sala`),
  ADD KEY `Plantilla_FKIndex3` (`Empleado_id_empleado`),
  ADD KEY `IFK_Rel_01` (`Hospital_id_Hospital`),
  ADD KEY `IFK_Rel_02` (`Sala_id_sala`),
  ADD KEY `IFK_Rel_04` (`Empleado_id_empleado`);

--
-- Indices de la tabla `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`id_sala`),
  ADD KEY `Sala_FKIndex1` (`Hospital_id_Hospital`),
  ADD KEY `IFK_Rel_05` (`Hospital_id_Hospital`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `dept2`
--
ALTER TABLE `dept2`
  MODIFY `id_Deptn2` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `doctor`
--
ALTER TABLE `doctor`
  MODIFY `id_Doctor` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=322;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id_empleado` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `enfermo`
--
ALTER TABLE `enfermo`
  MODIFY `inscripcion` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `hospital`
--
ALTER TABLE `hospital`
  MODIFY `id_Hospital` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `sala`
--
ALTER TABLE `sala`
  MODIFY `id_sala` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`Hospital_id_Hospital`) REFERENCES `hospital` (`id_Hospital`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`dept2_id_Deptn2`) REFERENCES `dept2` (`id_Deptn2`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ocupacion`
--
ALTER TABLE `ocupacion`
  ADD CONSTRAINT `ocupacion_ibfk_1` FOREIGN KEY (`Hospital_id_Hospital`) REFERENCES `hospital` (`id_Hospital`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ocupacion_ibfk_2` FOREIGN KEY (`Sala_id_sala`) REFERENCES `sala` (`id_sala`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ocupacion_ibfk_3` FOREIGN KEY (`Enfermo_inscripcion`) REFERENCES `enfermo` (`inscripcion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `plantilla`
--
ALTER TABLE `plantilla`
  ADD CONSTRAINT `plantilla_ibfk_1` FOREIGN KEY (`Hospital_id_Hospital`) REFERENCES `hospital` (`id_Hospital`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `plantilla_ibfk_2` FOREIGN KEY (`Sala_id_sala`) REFERENCES `sala` (`id_sala`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `plantilla_ibfk_3` FOREIGN KEY (`Empleado_id_empleado`) REFERENCES `empleado` (`id_empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sala`
--
ALTER TABLE `sala`
  ADD CONSTRAINT `sala_ibfk_1` FOREIGN KEY (`Hospital_id_Hospital`) REFERENCES `hospital` (`id_Hospital`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
