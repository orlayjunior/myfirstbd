-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-03-2022 a las 00:37:02
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
-- Base de datos: `curamigos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud`
--

CREATE TABLE `solicitud` (
  `id` int(11) NOT NULL,
  `id_usu_soli` int(11) DEFAULT NULL,
  `fecha_envi` date DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  `momento` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `solicitud`
--

INSERT INTO `solicitud` (`id`, `id_usu_soli`, `fecha_envi`, `estado`, `momento`) VALUES
(1, 2, '2022-03-15', 'a', 'a'),
(2, 1, '2022-03-18', 'a', 'r'),
(3, 3, '2022-03-25', 'a', 'a');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `apellido`, `edad`) VALUES
(1, 'orlay', 'marchena', 20),
(2, 'luisa', 'maria', 18),
(3, '[abraham]', 'gomez', 19);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usu_solicitud`
--

CREATE TABLE `usu_solicitud` (
  `id` int(11) NOT NULL,
  `id_remitente` int(11) DEFAULT NULL,
  `id_reseptor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usu_solicitud`
--

INSERT INTO `usu_solicitud` (`id`, `id_remitente`, `id_reseptor`) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `solicitud`
--
ALTER TABLE `solicitud`
  ADD PRIMARY KEY (`id`),
  ADD KEY `relacion_3` (`id_usu_soli`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usu_solicitud`
--
ALTER TABLE `usu_solicitud`
  ADD PRIMARY KEY (`id`),
  ADD KEY `relacion` (`id_remitente`),
  ADD KEY `relacion_2` (`id_reseptor`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `solicitud`
--
ALTER TABLE `solicitud`
  ADD CONSTRAINT `relacion_3` FOREIGN KEY (`id_usu_soli`) REFERENCES `usu_solicitud` (`id`);

--
-- Filtros para la tabla `usu_solicitud`
--
ALTER TABLE `usu_solicitud`
  ADD CONSTRAINT `relacion` FOREIGN KEY (`id_remitente`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `relacion_2` FOREIGN KEY (`id_reseptor`) REFERENCES `usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
