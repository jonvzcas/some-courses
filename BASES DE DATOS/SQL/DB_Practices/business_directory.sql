-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 05-07-2023 a las 09:11:55
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `activities`
--

CREATE TABLE `activities` (
  `id_activity` int UNSIGNED NOT NULL,
  `cod_activity` char(4) DEFAULT NULL,
  `activity` varchar(50) DEFAULT NULL,
  `id_sector` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `activities`
--

INSERT INTO `activities` (`id_activity`, `cod_activity`, `activity`, `id_sector`) VALUES
(1, '471', 'retail trade in non-specialized stores', 2),
(2, '0112', 'rice cultivation', 1),
(3, '0114', 'tabaco cultivation', 1),
(4, '411', 'building construction', 3),
(5, '4775', 'retail trade of second-hand items', 2),
(6, '0123', 'coffe growing', 1),
(7, '478', 'retail trade in mobile sales points', 2),
(8, '4111', 'construction of residencials buildings', 3),
(9, '4112', 'construction of non-residential buildings', 3),
(12, '0321', 'maritime aquaculture', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cities`
--

CREATE TABLE `cities` (
  `id_city` int UNSIGNED NOT NULL,
  `cod_dane_mun` char(3) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `id_department` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `cities`
--

INSERT INTO `cities` (`id_city`, `cod_dane_mun`, `city`, `id_department`) VALUES
(8, '001', 'Cali', 1),
(9, '001', 'Bogota D.C.', 2),
(10, '001', 'Medellin', 3),
(11, '109', 'Buenaventura', 1),
(12, '147', 'Cartago', 1),
(13, '030', 'Amaga', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `companies`
--

CREATE TABLE `companies` (
  `id_company` int UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `id_legal_form` int UNSIGNED DEFAULT NULL,
  `id_activity` int UNSIGNED DEFAULT NULL,
  `company_value` int DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `id_city` int UNSIGNED DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `contact` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `companies`
--

INSERT INTO `companies` (`id_company`, `name`, `id_legal_form`, `id_activity`, `company_value`, `date_start`, `id_city`, `address`, `phone`, `email`, `contact`) VALUES
(61, 'TAR-get', 4, 7, 100000000, '2000-03-30', 11, 'CL 13B # 2 - 77', '4568545', 'contact@tar-get.com', 'Oilda'),
(62, 'XYZ', 4, 4, 80000000, '2002-05-17', 8, 'CR 15B # 9 - 78', '9873254', 'contact@xyz.com', 'Okari'),
(63, 'Almacen Pacifico', 3, 5, 130000000, '2008-07-14', 8, 'AV 30 # 3 - 79', '3543254', 'contact@almacenpacifico.com', 'Shi Yin'),
(64, 'Constructora Asprilla', 1, 9, 1500000000, '2005-05-19', 11, 'CL 6 # 40 - 80', '5458765', 'contact@const-asprilla.com', 'Shu Yan'),
(65, 'Comercializadora ABC', 2, 1, 300000000, '2021-08-09', 9, 'CR 27C # 3 - 81', '5458784', 'contact@comABC.com', 'Sol Amy'),
(66, 'Bennet Company', 4, 7, 90000000, '2019-01-18', 9, 'AV 10 # 4 - 82', '8799336', 'contact@bennetcompany.com', 'Eliú'),
(67, 'Bytes Colombia', 1, 7, 90000000, '2019-06-19', 11, 'CL 66A # 4 - 44', '8632134', 'contact@bytescolombia.com', 'Juny'),
(68, 'Cafe Horizonte', 3, 6, 250000000, '2021-03-05', 10, 'CR 47 # 9 - 84', '2134545', 'contact@cafehorizonte.com', 'Ryan'),
(69, 'Salud Tabaco', 2, 3, 250000000, '2023-04-24', 10, 'AV 23D # 4 - 50', '5646455', 'contact@saludtabaco.com', 'Ale José'),
(70, 'Constructora ABC', 1, 8, 1000000000, '2017-09-08', 12, 'CL 47B # 15 - 20', '8769341', 'contact@constructoraABC.com', 'Alí Said'),
(71, 'Arroz del Valle', 3, 2, 1200000000, '2018-07-25', 13, 'CR 454 # 8 - 90', '3917812', 'contact@arrozdelvalle.com', 'Dan José'),
(72, 'Design Soft', 1, 7, 150000000, '2016-10-15', 12, 'AV 14B # 4 - 77', '7889715', 'contact@designsoft.com', 'UsNavy');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departments`
--

CREATE TABLE `departments` (
  `id_department` int UNSIGNED NOT NULL,
  `cod_dane_dep` char(2) DEFAULT NULL,
  `department` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `departments`
--

INSERT INTO `departments` (`id_department`, `cod_dane_dep`, `department`) VALUES
(1, '76', 'Valle del Cauca'),
(2, '11', 'Bogota'),
(3, '05', 'Antioquia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `legal_form`
--

CREATE TABLE `legal_form` (
  `id_legal_form` int UNSIGNED NOT NULL,
  `legal_form` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `legal_form`
--

INSERT INTO `legal_form` (`id_legal_form`, `legal_form`) VALUES
(2, 'Ltda.'),
(4, 'natural'),
(1, 'S.A.'),
(3, 'SAS'),
(5, 'Sin ánimo de lucro'),
(6, 'Sociedad colectiva'),
(7, 'Sociedad comanditaria'),
(9, 'Sociedad cooperativa'),
(8, 'Sociedad de bienes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sectors`
--

CREATE TABLE `sectors` (
  `id_sector` int UNSIGNED NOT NULL,
  `cod_sector` char(2) DEFAULT NULL,
  `sector` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `sectors`
--

INSERT INTO `sectors` (`id_sector`, `cod_sector`, `sector`) VALUES
(1, '01', 'Agricultural'),
(2, '47', 'Business and services'),
(3, '41', 'Construction'),
(4, '03', 'fish'),
(6, NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id_activity`),
  ADD UNIQUE KEY `cod_activity` (`cod_activity`),
  ADD UNIQUE KEY `activity` (`activity`),
  ADD KEY `fk_activities_sectors` (`id_sector`);

--
-- Indices de la tabla `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id_city`),
  ADD UNIQUE KEY `city` (`city`),
  ADD KEY `fk_cities_departments` (`id_department`);

--
-- Indices de la tabla `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id_company`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_companies_legal_form` (`id_legal_form`),
  ADD KEY `fk_companies_activities` (`id_activity`),
  ADD KEY `fk_companies_cities` (`id_city`);

--
-- Indices de la tabla `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id_department`),
  ADD UNIQUE KEY `cod_dane_dep` (`cod_dane_dep`),
  ADD UNIQUE KEY `department` (`department`);

--
-- Indices de la tabla `legal_form`
--
ALTER TABLE `legal_form`
  ADD PRIMARY KEY (`id_legal_form`),
  ADD UNIQUE KEY `legal_form` (`legal_form`);

--
-- Indices de la tabla `sectors`
--
ALTER TABLE `sectors`
  ADD PRIMARY KEY (`id_sector`),
  ADD UNIQUE KEY `cod_sector` (`cod_sector`),
  ADD UNIQUE KEY `sector` (`sector`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `activities`
--
ALTER TABLE `activities`
  MODIFY `id_activity` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `cities`
--
ALTER TABLE `cities`
  MODIFY `id_city` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `companies`
--
ALTER TABLE `companies`
  MODIFY `id_company` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de la tabla `departments`
--
ALTER TABLE `departments`
  MODIFY `id_department` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `legal_form`
--
ALTER TABLE `legal_form`
  MODIFY `id_legal_form` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `sectors`
--
ALTER TABLE `sectors`
  MODIFY `id_sector` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `activities`
--
ALTER TABLE `activities`
  ADD CONSTRAINT `fk_activities_sectors` FOREIGN KEY (`id_sector`) REFERENCES `sectors` (`id_sector`);

--
-- Filtros para la tabla `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `fk_cities_departments` FOREIGN KEY (`id_department`) REFERENCES `departments` (`id_department`);

--
-- Filtros para la tabla `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `fk_companies_activities` FOREIGN KEY (`id_activity`) REFERENCES `activities` (`id_activity`),
  ADD CONSTRAINT `fk_companies_cities` FOREIGN KEY (`id_city`) REFERENCES `cities` (`id_city`),
  ADD CONSTRAINT `fk_companies_legal_form` FOREIGN KEY (`id_legal_form`) REFERENCES `legal_form` (`id_legal_form`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
