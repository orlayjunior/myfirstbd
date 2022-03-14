-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-03-2022 a las 20:06:27
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
-- Base de datos: `clasebdtrabajo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `id` int(11) NOT NULL,
  `id_docente` int(11) DEFAULT NULL,
  `n_docente` varchar(50) DEFAULT NULL,
  `nom_asignatura` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`id`, `id_docente`, `n_docente`, `nom_asignatura`) VALUES
(1123, 1, 'william', 'desarrollo_bd'),
(2582, 2, 'walter', 'quimica_general'),
(3183, 3, 'alexander', 'algebra_lineal'),
(4182, 4, 'braulio', 'biologia'),
(5492, 5, 'karen', 'psicologia_general'),
(6194, 6, 'daniel', 'contabilidad_financiera'),
(7640, 7, 'luis', 'fundamentos_economia'),
(8126, 8, 'sandra', 'fundamentos_quimica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`id`, `nombre`, `apellido`, `edad`) VALUES
(0, 'andres', 'arjona', 20),
(1, 'camilo', 'vargas', 24),
(2, 'juan', 'arteta', 18),
(3, 'keiner', 'ojeda', 16),
(4, 'carlos', 'solano', 21),
(5, 'jose', 'estrada', 38),
(6, 'david', 'stren', 40),
(7, 'jesus', 'alvares', 29);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facultad`
--

CREATE TABLE `facultad` (
  `id` int(11) NOT NULL,
  `n_facultad` varchar(50) DEFAULT NULL,
  `universidad` varchar(50) DEFAULT NULL,
  `fecha_i` date DEFAULT NULL,
  `id_r` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `facultad`
--

INSERT INTO `facultad` (`id`, `n_facultad`, `universidad`, `fecha_i`, `id_r`) VALUES
(1, 'ing_informatica', 'uni_reformada', '2022-02-15', 0),
(2, 'ing_industrial', 'uni_libre', '2022-03-14', 1),
(3, 'ing_mecanica', 'uni_norte', '2022-02-11', 2),
(4, 'ing_ambiental', 'uni_simon', '2022-03-02', 3),
(5, 'psicologia', 'uni_atlantico', '2022-02-20', 4),
(6, 'administracion_empresas', 'uni_autonoma', '2022-02-04', 5),
(7, 'contaduria', 'uni_metropolitana', '2021-01-28', 6),
(8, 'ing_biomedica', 'uni_costa', '2020-02-20', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matricula`
--

CREATE TABLE `matricula` (
  `id` int(11) NOT NULL,
  `num_matricula` int(11) DEFAULT NULL,
  `id_estudiante` int(11) DEFAULT NULL,
  `fecha_matricula` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `matricula`
--

INSERT INTO `matricula` (`id`, `num_matricula`, `id_estudiante`, `fecha_matricula`) VALUES
(1, 32211, 0, '2022-03-13'),
(2, 12441, 1, '2022-02-14'),
(3, 25993, 2, '2022-03-02'),
(4, 16532, 3, '2022-02-07'),
(5, 18042, 4, '2022-02-04'),
(6, 13560, 5, '2022-02-24'),
(7, 86389, 6, '2020-02-12'),
(8, 82353, 7, '2021-03-09');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `relacion4` (`id_docente`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `facultad`
--
ALTER TABLE `facultad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `relacion2` (`id_r`);

--
-- Indices de la tabla `matricula`
--
ALTER TABLE `matricula`
  ADD PRIMARY KEY (`id`),
  ADD KEY `relacion` (`id_estudiante`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD CONSTRAINT `relacion4` FOREIGN KEY (`id_docente`) REFERENCES `facultad` (`id`);

--
-- Filtros para la tabla `facultad`
--
ALTER TABLE `facultad`
  ADD CONSTRAINT `relacion2` FOREIGN KEY (`id_r`) REFERENCES `estudiantes` (`id`);

--
-- Filtros para la tabla `matricula`
--
ALTER TABLE `matricula`
  ADD CONSTRAINT `relacion` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiantes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
