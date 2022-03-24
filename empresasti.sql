-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-03-2022 a las 18:49:07
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
-- Base de datos: `empresasti`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `id_chef` int(11) DEFAULT NULL,
  `id_receta` int(11) DEFAULT NULL,
  `comentario_opcional` varchar(50) DEFAULT NULL,
  `id_plato` int(11) DEFAULT NULL,
  `comentario_personal` varchar(50) DEFAULT NULL,
  `id_menus` int(11) DEFAULT NULL,
  `comentarioA` varchar(50) DEFAULT NULL,
  `comentarioB` varchar(50) DEFAULT NULL,
  `comentarioC` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id`, `id_chef`, `id_receta`, `comentario_opcional`, `id_plato`, `comentario_personal`, `id_menus`, `comentarioA`, `comentarioB`, `comentarioC`) VALUES
(1, 1, 1, 'null', 1, 'increible', 1, 'verano', 'festivo', 'ligero'),
(2, 2, 2, 'null', 2, 'espero_que_les_guste', 2, 'primavera', 'otoño', 'invierno');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `comentarios_v1`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `comentarios_v1` (
`id_chef` int(11)
,`id_receta` int(11)
,`comentario_opcional` varchar(50)
,`id_plato` int(11)
,`comentario_personal` varchar(50)
,`id_menus` int(11)
,`comentarioA` varchar(50)
,`comentarioB` varchar(50)
,`comentarioC` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `comentarios_v2`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `comentarios_v2` (
`id_chef` int(11)
,`id_receta` int(11)
,`comentario_opcional` varchar(50)
,`id_plato` int(11)
,`comentario_personal` varchar(50)
,`id_menus` int(11)
,`comentarioA` varchar(50)
,`comentarioB` varchar(50)
,`comentarioC` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentacion`
--

CREATE TABLE `documentacion` (
  `id` int(11) NOT NULL,
  `fuente1` varchar(50) DEFAULT NULL,
  `fuente2` varchar(50) DEFAULT NULL,
  `fuente3` varchar(50) DEFAULT NULL,
  `fuente4` varchar(50) DEFAULT NULL,
  `fuente5` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `documentacion`
--

INSERT INTO `documentacion` (`id`, `fuente1`, `fuente2`, `fuente3`, `fuente4`, `fuente5`) VALUES
(1, 'libros', 'prensa', 'T_V', 'familia', 'periodico'),
(2, 'escuela', 'universidad', 'null', 'null', 'null');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `id_plato` int(11) DEFAULT NULL,
  `eleccionA` varchar(50) DEFAULT NULL,
  `eleccionB` varchar(50) DEFAULT NULL,
  `eleccionC` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `menus`
--

INSERT INTO `menus` (`id`, `id_plato`, `eleccionA`, `eleccionB`, `eleccionC`) VALUES
(1, 1, 'primero', 'segundo', 'postre'),
(2, 2, 'seleccionA', 'null', 'null');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plato`
--

CREATE TABLE `plato` (
  `id` int(11) NOT NULL,
  `id_rec` int(11) DEFAULT NULL,
  `tip_platoA` varchar(50) DEFAULT NULL,
  `unidad_cantidadesA` mediumtext DEFAULT NULL,
  `tip_platoB` varchar(50) DEFAULT NULL,
  `unidad_cantidadesB` mediumtext DEFAULT NULL,
  `tip_platoC` varchar(50) DEFAULT NULL,
  `unidad_cantidadesC` mediumtext DEFAULT NULL,
  `precioA` bigint(20) DEFAULT NULL,
  `precioB` bigint(20) DEFAULT NULL,
  `precioC` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `plato`
--

INSERT INTO `plato` (`id`, `id_rec`, `tip_platoA`, `unidad_cantidadesA`, `tip_platoB`, `unidad_cantidadesB`, `tip_platoC`, `unidad_cantidadesC`, `precioA`, `precioB`, `precioC`) VALUES
(1, 1, 'carne_a', '1/2tasa_tequila,3libras_carne,dientes_ajo,1cuchara_sal,1cuchara_pimienta', 'pollo_m', '8piezas_pollo_hueso,3libras_pechuga,3piernas_muslo,1/2aceite_oliva', 'sancocho_c', '1kg_costilla_ternera,3platanos_verdes,1kg_yuca,1kg_papas_peladas,3marzocas_maiz,2cebollas_peladas,4tallos_cepollas_peladas,2tallos_cebollas_peladas,2manojos_cilantro_cimarron,2tomates_verdes,2cubitos_caldo,sal', 8000, 10000, 12000),
(2, 2, 'chicharron_c', '1/2pulgadas_pieza,1/4cucharada_bicarbonato,1/2cucharada_sal,2tazas_agua,3libras_tocino_cerdo_carnudos,', 'null', 'null', 'null', 'null', 7000, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas`
--

CREATE TABLE `recetas` (
  `id` int(11) NOT NULL,
  `id_u` int(11) DEFAULT NULL,
  `list_ingredientes` longtext DEFAULT NULL,
  `tiempo_prev_ejecucion` varchar(50) DEFAULT NULL,
  `utensilios_cocina` longtext DEFAULT NULL,
  `tiempo_total_receta` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `recetas`
--

INSERT INTO `recetas` (`id`, `id_u`, `list_ingredientes`, `tiempo_prev_ejecucion`, `utensilios_cocina`, `tiempo_total_receta`) VALUES
(1, 1, '2libra_carne,sal,pimienta,tequila,cebolla,dientes_ajo_triturados,caballa,tomate_rama,pimiento_verde,patata,cebolla_vino_blanco,limon,aceite_oliva,pollo,pechuga,,muslo,costilla_ternera,platanos_verdes,yuca,mazorcas_maiz,tomates_cebollas_peladas,cilantro,', '20minutos', 'plato,cuchillo_cocina,trinche,asador,carbon,sarten,ollas_grandes', 'null'),
(2, 2, 'libras_tocino_cerdo_carnudos,polvo_hornear,bicarbonato_soda,sal,tazas_agua', '10min', 'tabla_cortar,cacerola_mediana', '2horas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion`
--

CREATE TABLE `ubicacion` (
  `id` int(11) NOT NULL,
  `id_doc` int(11) DEFAULT NULL,
  `ubi_nomA` varchar(50) DEFAULT NULL,
  `ubi_nomB` varchar(50) DEFAULT NULL,
  `ubi_nomC` varchar(50) DEFAULT NULL,
  `ubi_nomD` varchar(50) DEFAULT NULL,
  `ubi_nomE` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ubicacion`
--

INSERT INTO `ubicacion` (`id`, `id_doc`, `ubi_nomA`, `ubi_nomB`, `ubi_nomC`, `ubi_nomD`, `ubi_nomE`) VALUES
(1, 1, 'sede_paisa', 'biblioteca', 'universidad', 'centro_comercial', 'academia_F_C'),
(2, 2, 'escuela_nst', 'uni_libre', 'null', 'null', 'null');

-- --------------------------------------------------------

--
-- Estructura para la vista `comentarios_v1`
--
DROP TABLE IF EXISTS `comentarios_v1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `comentarios_v1`  AS SELECT `comentarios`.`id_chef` AS `id_chef`, `comentarios`.`id_receta` AS `id_receta`, `comentarios`.`comentario_opcional` AS `comentario_opcional`, `comentarios`.`id_plato` AS `id_plato`, `comentarios`.`comentario_personal` AS `comentario_personal`, `comentarios`.`id_menus` AS `id_menus`, `comentarios`.`comentarioA` AS `comentarioA`, `comentarios`.`comentarioB` AS `comentarioB`, `comentarios`.`comentarioC` AS `comentarioC` FROM `comentarios` WHERE `comentarios`.`id` = 1 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `comentarios_v2`
--
DROP TABLE IF EXISTS `comentarios_v2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `comentarios_v2`  AS SELECT `comentarios`.`id_chef` AS `id_chef`, `comentarios`.`id_receta` AS `id_receta`, `comentarios`.`comentario_opcional` AS `comentario_opcional`, `comentarios`.`id_plato` AS `id_plato`, `comentarios`.`comentario_personal` AS `comentario_personal`, `comentarios`.`id_menus` AS `id_menus`, `comentarios`.`comentarioA` AS `comentarioA`, `comentarios`.`comentarioB` AS `comentarioB`, `comentarios`.`comentarioC` AS `comentarioC` FROM `comentarios` WHERE `comentarios`.`id` = 2 ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `relacion10` (`id_chef`);

--
-- Indices de la tabla `documentacion`
--
ALTER TABLE `documentacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `relacion4` (`id_plato`);

--
-- Indices de la tabla `plato`
--
ALTER TABLE `plato`
  ADD PRIMARY KEY (`id`),
  ADD KEY `relacion3` (`id_rec`);

--
-- Indices de la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `relacion2` (`id_u`);

--
-- Indices de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `relacion` (`id_doc`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `relacion10` FOREIGN KEY (`id_chef`) REFERENCES `documentacion` (`id`);

--
-- Filtros para la tabla `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `relacion4` FOREIGN KEY (`id_plato`) REFERENCES `plato` (`id`);

--
-- Filtros para la tabla `plato`
--
ALTER TABLE `plato`
  ADD CONSTRAINT `relacion3` FOREIGN KEY (`id_rec`) REFERENCES `recetas` (`id`);

--
-- Filtros para la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD CONSTRAINT `relacion2` FOREIGN KEY (`id_u`) REFERENCES `ubicacion` (`id`);

--
-- Filtros para la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD CONSTRAINT `relacion` FOREIGN KEY (`id_doc`) REFERENCES `documentacion` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
