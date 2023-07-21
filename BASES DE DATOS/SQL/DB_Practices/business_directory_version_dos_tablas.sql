-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 20-07-2023 a las 20:02:12
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
-- Base de datos: `business_directory`
--
CREATE DATABASE IF NOT EXISTS `business_directory` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `business_directory`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `activities`
--

CREATE TABLE `activities` (
  `id_activity` int UNSIGNED NOT NULL,
  `cod_activity` char(4) DEFAULT NULL,
  `activity` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `activities`
--

INSERT INTO `activities` (`id_activity`, `cod_activity`, `activity`) VALUES
(1, '471', 'retail trade in non-specialized stores'),
(2, '0112', 'rice cultivation'),
(3, '0114', 'tabaco cultivation'),
(4, '411', 'building construction'),
(5, '4775', 'retail trade of second-hand items'),
(6, '0123', 'coffe growing'),
(7, '478', 'retail trade in mobile sales points'),
(8, '4111', 'construction of residencials buildings'),
(9, '4112', 'construction of non-residential buildings');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `companies`
--

CREATE TABLE `companies` (
  `id_company` int UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `id_activity` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `companies`
--

INSERT INTO `companies` (`id_company`, `name`, `id_activity`) VALUES
(1, 'TAR-get', 4),
(2, 'XYZ', 5),
(3, 'Almacen Pacifico', 7),
(4, 'Constructora Asprilla', 9),
(5, 'Comercializadora ABC', 6),
(6, 'Bennet Company', 4),
(7, 'Bytes Colombia', 1),
(8, 'Cafe Horizonte', 3),
(9, 'Salud Tabaco', 2),
(10, 'Constructora ABC', 8),
(11, 'Arroz del Valle', 3),
(12, 'Design Soft', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas_de_email`
--

CREATE TABLE `cuentas_de_email` (
  `email` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `pwd` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `cuentas_de_email`
--

INSERT INTO `cuentas_de_email` (`email`, `name`, `pwd`) VALUES
('bgomez@tar-get.co', 'Blanca', 0xfc9e2e381228271db4742fcd45c8ffa2),
('climactano@tar-get.co', 'Climaco', 0xeb57c1c3046a60216e9c5701f593e42b),
('jcastillo@tar-get.co', 'Jonathan', 0x745ba923a5e7f2d1a6f7b86b5d83c6dd),
('lgrajales@tar-get.co', 'Lucy', 0x90f4eadefb8662e89321fd4e96427dce),
('operez@tar-get.co', 'Oscar', 0xcda0dd7291de1ce301d6ebf5e13a659e);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id_activity`),
  ADD UNIQUE KEY `cod_activity` (`cod_activity`),
  ADD UNIQUE KEY `activity` (`activity`);

--
-- Indices de la tabla `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id_company`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `id_activity` (`id_activity`);

--
-- Indices de la tabla `cuentas_de_email`
--
ALTER TABLE `cuentas_de_email`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `activities`
--
ALTER TABLE `activities`
  MODIFY `id_activity` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `companies`
--
ALTER TABLE `companies`
  MODIFY `id_company` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `companies_ibfk_1` FOREIGN KEY (`id_activity`) REFERENCES `activities` (`id_activity`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
