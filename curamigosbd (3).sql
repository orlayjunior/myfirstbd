-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-04-2022 a las 23:21:04
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `curamigosbd`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `amigos` (IN `Id` INT)  BEGIN
SELECT * FROM personas WHERE nombre=orlay;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amigos`
--

CREATE TABLE `amigos` (
  `id` int(11) NOT NULL,
  `fecha_solicitud` date DEFAULT NULL,
  `id_emisor_fk` int(11) DEFAULT NULL,
  `id_receptor_fk` int(11) DEFAULT NULL,
  `fecha_aceptacion` date DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `amigos`
--

INSERT INTO `amigos` (`id`, `fecha_solicitud`, `id_emisor_fk`, `id_receptor_fk`, `fecha_aceptacion`, `estado`) VALUES
(1, '2022-05-20', 1, 2, '2022-05-26', 'aceptado'),
(2, '2021-04-28', 2, 3, '2021-06-13', 'rechazado'),
(3, '2022-08-20', 2, 4, '2022-09-16', 'rechazado'),
(4, '2021-11-20', 4, 1, '2022-12-26', 'aceptado'),
(5, '2021-02-20', 4, 3, '2021-03-26', 'aceptado'),
(6, '2022-05-10', 1, 3, '2022-06-17', 'rechazado'),
(7, '2022-08-20', 5, 2, '2022-09-03', 'aceptado'),
(8, '2022-04-28', 5, 1, '2022-05-02', 'rechazado'),
(9, '2022-02-12', 3, 2, '2022-02-19', 'aceptado'),
(10, '2022-05-12', 3, 5, '2022-05-20', 'aceptado'),
(11, '2017-03-21', 4, 5, '2017-12-08', 'rechazado'),
(12, '2019-04-20', 6, 4, '2019-04-26', 'aceptado'),
(13, '2015-04-10', 6, 7, '2015-04-12', 'aceptado'),
(14, '2019-07-03', 1, 6, '2019-08-14', 'rechazado'),
(15, '2018-05-16', 2, 6, '2018-08-23', 'aceptado'),
(16, '2020-04-10', 7, 2, '2020-06-15', 'aceptado'),
(17, '2020-04-14', 7, 4, '2020-10-15', 'rechazado'),
(18, '2019-05-20', 1, 7, '2019-09-13', 'aceptado');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `amigos_nomb1`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `amigos_nomb1` (
`id` int(11)
,`nombre` varchar(50)
,`id_emisor_fk` int(11)
,`id_receptor_fk` int(11)
,`estado` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `curamigos_v1`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `curamigos_v1` (
`id_emisor_fk` int(11)
,`id_receptor_fk` int(11)
,`estado` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `curamigos_v2`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `curamigos_v2` (
`id_emisor_fk` int(11)
,`id_receptor_fk` int(11)
,`fecha_solicitud` date
,`fecha_aceptacion` date
,`estado` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`id`, `nombre`, `apellidos`, `correo`) VALUES
(1, 'carlos', 'salas', 'carlossalas@hotmail.com'),
(2, 'karen', 'mendoza', 'karenmendoza@hotmail.com'),
(3, 'luisa', 'beltran', 'luisasofia@hotmail.com'),
(4, 'jose', 'ayus', 'joseayus@hotmail.com'),
(5, 'alex', 'diaz', 'alex10@hotmail.com'),
(6, 'orlay', 'marchena', 'orlayjunior18@hotmail.com'),
(7, 'abraham', 'gomez', 'abrahamgomez10@gmail.com');

-- --------------------------------------------------------

--
-- Estructura para la vista `amigos_nomb1`
--
DROP TABLE IF EXISTS `amigos_nomb1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `amigos_nomb1`  AS SELECT `personas`.`id` AS `id`, `personas`.`nombre` AS `nombre`, `amigos`.`id_emisor_fk` AS `id_emisor_fk`, `amigos`.`id_receptor_fk` AS `id_receptor_fk`, `amigos`.`estado` AS `estado` FROM (`personas` join `amigos`) WHERE `personas`.`id` = 1 AND `amigos`.`id_emisor_fk` = 1 AND `amigos`.`estado` = 'aceptado' ;

-- --------------------------------------------------------

--
-- Estructura para la vista `curamigos_v1`
--
DROP TABLE IF EXISTS `curamigos_v1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `curamigos_v1`  AS SELECT `amigos`.`id_emisor_fk` AS `id_emisor_fk`, `amigos`.`id_receptor_fk` AS `id_receptor_fk`, `amigos`.`estado` AS `estado` FROM `amigos` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `curamigos_v2`
--
DROP TABLE IF EXISTS `curamigos_v2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `curamigos_v2`  AS SELECT `amigos`.`id_emisor_fk` AS `id_emisor_fk`, `amigos`.`id_receptor_fk` AS `id_receptor_fk`, `amigos`.`fecha_solicitud` AS `fecha_solicitud`, `amigos`.`fecha_aceptacion` AS `fecha_aceptacion`, `amigos`.`estado` AS `estado` FROM `amigos` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `amigos`
--
ALTER TABLE `amigos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `relacion` (`id_emisor_fk`),
  ADD KEY `relacion2` (`id_receptor_fk`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `amigos`
--
ALTER TABLE `amigos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `amigos`
--
ALTER TABLE `amigos`
  ADD CONSTRAINT `relacion` FOREIGN KEY (`id_emisor_fk`) REFERENCES `personas` (`id`),
  ADD CONSTRAINT `relacion2` FOREIGN KEY (`id_receptor_fk`) REFERENCES `personas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
