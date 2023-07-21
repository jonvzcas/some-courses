-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 20-07-2023 a las 20:05:56
-- Versión del servidor: 8.0.33-0ubuntu0.22.04.2
-- Versión de PHP: 8.1.2-1ubuntu2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `curso_sql`
--
CREATE DATABASE IF NOT EXISTS `curso_sql` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `curso_sql`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad_clientes`
--

CREATE TABLE `actividad_clientes` (
  `ac_id` int UNSIGNED NOT NULL,
  `cliente` int UNSIGNED DEFAULT NULL,
  `fecha` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `actividad_clientes`
--

INSERT INTO `actividad_clientes` (`ac_id`, `cliente`, `fecha`) VALUES
(1, 2, '2023-07-20 18:33:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `cliente_id` int UNSIGNED NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `correo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`cliente_id`, `nombre`, `correo`) VALUES
(1, 'jonvzcas', 'vzcastillo@aol.com'),
(2, 'climaco', 'climactano@yahoo.com');

--
-- Disparadores `clientes`
--
DELIMITER $$
CREATE TRIGGER `tg_actividad_clientes` AFTER INSERT ON `clientes` FOR EACH ROW BEGIN
	 ## De esta forma se estaria almacenando el disparador
	 INSERT INTO actividad_clientes VALUES (0, NEW.cliente_id, NOW());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `pedido_id` int UNSIGNED NOT NULL,
  `producto_id` int UNSIGNED NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`pedido_id`, `producto_id`, `fecha`, `total`) VALUES
(15, 1, '2023-02-10 10:00:00', '22500.00'),
(16, 1, '2023-02-15 10:00:00', '22500.00'),
(17, 1, '2023-02-20 10:00:00', '22500.00'),
(18, 1, '2023-02-28 10:00:00', '22500.00'),
(19, 5, '2023-03-15 10:00:00', '6999.99'),
(20, 5, '2023-03-15 10:00:00', '6999.99'),
(21, 6, '2023-04-02 10:00:00', '37999.99');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `producto_id` int UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `precio` decimal(7,2) DEFAULT NULL,
  `cantidad` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`producto_id`, `nombre`, `descripcion`, `precio`, `cantidad`) VALUES
(1, 'Rema Papel tam carta', 'unidad', '22500.00', 100),
(2, 'Rema Papel tam oficio', 'unidad', '27000.00', 100),
(3, 'A-Z tam carta', 'unidad', '7500.00', 10),
(4, 'A-Z tam oficio', 'unidad', '8000.00', 10),
(5, 'Boligrafo', 'Kilometrico Caja x 10 ', '6999.99', 100),
(6, 'Marcador', 'Sharpie p/fina caja x 12', '37999.99', 50),
(7, 'Cinta transparente', '40 mt x 100 yds', '2500.00', 36);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `servicio_id` int UNSIGNED NOT NULL,
  `cliente` int UNSIGNED DEFAULT NULL,
  `tarjeta` int UNSIGNED DEFAULT NULL,
  `suscripcion` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`servicio_id`, `cliente`, `tarjeta`, `suscripcion`) VALUES
(1, 1, 1, 3),
(2, 2, 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suscripciones`
--

CREATE TABLE `suscripciones` (
  `suscripcion_id` int UNSIGNED NOT NULL,
  `suscripcion` varchar(30) NOT NULL,
  `costo` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `suscripciones`
--

INSERT INTO `suscripciones` (`suscripcion_id`, `suscripcion`, `costo`) VALUES
(1, 'Bronce', '199.99'),
(2, 'Plata', '299.99'),
(3, 'Oro', '399.99');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjetas`
--

CREATE TABLE `tarjetas` (
  `tarjeta_id` int UNSIGNED NOT NULL,
  `cliente` int UNSIGNED DEFAULT NULL,
  `tarjeta` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tarjetas`
--

INSERT INTO `tarjetas` (`tarjeta_id`, `cliente`, `tarjeta`) VALUES
(1, 1, 0xef825008417718ef4c9a07c0bd99b220ed4f45ad3d6bee46ffbc256ca34670c0),
(2, 2, 0x2dc16d5b1beeea6e8d53bf7efb7582231c4c1f77b19db07372f32da0c562d06f);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario_id` int UNSIGNED NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `edad` int DEFAULT '0',
  `ciudad` varchar(30) DEFAULT 'Buenaventura'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario_id`, `nombre`, `apellidos`, `correo`, `edad`, `ciudad`) VALUES
(1, 'Climaco', 'Castle', 'climac@gmail.com', 70, 'Buenaventura'),
(2, 'Lucy', 'Del Rosario', 'lrosario@gmail.com', 62, 'Buenaventura'),
(3, 'Rodrigo', 'Gómez', 'rgomez@gmail.com', 54, 'Buenaventura'),
(4, 'Oscar', 'Pérez', 'edgemaster@gmail.com', 14, 'Buenaventura'),
(5, 'Camila', 'Pérez', 'cperez@gmail.com', 19, 'Buenaventura'),
(6, 'Thalia', 'Asprilla', 'jasprilla@gmail.com', 27, 'Quilichao'),
(7, 'Jonathan', 'Castillo', 'jctillo@gmail.com', 39, 'Quilichao'),
(8, 'Carmen', 'Mena', 'cmena@gmail.com', 67, 'Buenaventura'),
(9, 'Efren', 'Berty', 'fish2000@gmail.com', 66, 'Buenaventura'),
(10, 'Claudia', 'Cano', 'ccano@gmail.com', 20, 'Buenaventura'),
(11, 'Lasie', 'Cabezas', 'mascota00@gmail.com', 8, 'Buenaventura'),
(12, 'Romeo', 'Santos', 'mascota01@gmail.com', 1, 'Buenaventura');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividad_clientes`
--
ALTER TABLE `actividad_clientes`
  ADD PRIMARY KEY (`ac_id`),
  ADD KEY `cliente` (`cliente`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cliente_id`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`pedido_id`),
  ADD KEY `fk_pedidos_productos` (`producto_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`producto_id`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`servicio_id`),
  ADD KEY `cliente` (`cliente`),
  ADD KEY `tarjeta` (`tarjeta`),
  ADD KEY `suscripcion` (`suscripcion`);

--
-- Indices de la tabla `suscripciones`
--
ALTER TABLE `suscripciones`
  ADD PRIMARY KEY (`suscripcion_id`);

--
-- Indices de la tabla `tarjetas`
--
ALTER TABLE `tarjetas`
  ADD PRIMARY KEY (`tarjeta_id`),
  ADD KEY `cliente` (`cliente`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario_id`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividad_clientes`
--
ALTER TABLE `actividad_clientes`
  MODIFY `ac_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `cliente_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `pedido_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `producto_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `servicio_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `suscripciones`
--
ALTER TABLE `suscripciones`
  MODIFY `suscripcion_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tarjetas`
--
ALTER TABLE `tarjetas`
  MODIFY `tarjeta_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usuario_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actividad_clientes`
--
ALTER TABLE `actividad_clientes`
  ADD CONSTRAINT `actividad_clientes_ibfk_1` FOREIGN KEY (`cliente`) REFERENCES `clientes` (`cliente_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_pedidos_productos` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`);

--
-- Filtros para la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD CONSTRAINT `servicios_ibfk_1` FOREIGN KEY (`cliente`) REFERENCES `clientes` (`cliente_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `servicios_ibfk_2` FOREIGN KEY (`tarjeta`) REFERENCES `tarjetas` (`tarjeta_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `servicios_ibfk_3` FOREIGN KEY (`suscripcion`) REFERENCES `suscripciones` (`suscripcion_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `tarjetas`
--
ALTER TABLE `tarjetas`
  ADD CONSTRAINT `tarjetas_ibfk_1` FOREIGN KEY (`cliente`) REFERENCES `clientes` (`cliente_id`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
