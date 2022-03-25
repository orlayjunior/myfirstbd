-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 25-03-2022 a las 21:00:48
-- Versión del servidor: 8.0.17
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `curamigosbd`
--

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `amigos`
--

INSERT INTO `amigos` (`id`, `fecha_solicitud`, `id_emisor_fk`, `id_receptor_fk`, `fecha_aceptacion`, `estado`) VALUES
(1, '2022-03-08', 1, 2, '2022-03-15', 'aceptado'),
(2, '2020-03-01', 3, 2, '2021-05-16', 'rechazado'),
(3, '2021-06-07', 4, 1, '2022-04-09', 'aceptado'),
(4, '2020-05-19', 4, 2, '2020-05-25', 'aceptado'),
(5, '2020-09-22', 5, 1, '2020-10-12', 'aceptado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`id`, `nombre`, `apellidos`, `correo`) VALUES
(1, 'carlos', 'salas', 'carlossalas@hotmail.com'),
(2, 'andres', 'muñoz', 'andresjesus@hotmail.com'),
(3, 'julio', 'beltran', 'juliob@hotmail.com'),
(4, 'jose', 'ayus', 'joseayus@hotmail.com'),
(5, 'sebastian', 'padilla', 'sebastianp@hotmail.com');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
