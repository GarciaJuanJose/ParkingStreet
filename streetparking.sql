-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 21-11-2019 a las 06:19:16
-- Versión del servidor: 5.7.26
-- Versión de PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `streetparking`
--

-- --------------------------------------------------------

DROP DATABASE IF EXISTS `streetparking`;
CREATE DATABASE IF NOT EXISTS `streetparking`;
USE `streetparking`;

--
-- Estructura de tabla para la tabla `aud_banco`
--

DROP TABLE IF EXISTS `aud_banco`;
CREATE TABLE IF NOT EXISTS `aud_banco` (
  `id_aud_banco` smallint(5) NOT NULL AUTO_INCREMENT,
  `id_banco` smallint(5) NOT NULL,
  `nom_de_banco_anterior` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `nom_de_banco_nuevo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `evento` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_y_hora` datetime NOT NULL,
  PRIMARY KEY (`id_aud_banco`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `aud_banco`
--

INSERT INTO `aud_banco` (`id_aud_banco`, `id_banco`, `nom_de_banco_anterior`, `nom_de_banco_nuevo`, `evento`, `fecha_y_hora`) VALUES
(1, 1, '', 'BBVA Francés', 'Tarjeta Creada', '2019-11-17 17:08:20'),
(2, 2, '', 'Bco. Provincia', 'Tarjeta Creada', '2019-11-17 17:08:20'),
(3, 3, '', 'Bco. HSBC', 'Tarjeta Creada', '2019-11-17 17:08:47'),
(4, 4, '', 'Bco. Galicia', 'Tarjeta Creada', '2019-11-17 17:08:47'),
(5, 5, '', 'Bco. Patagonia', 'Tarjeta Creada', '2019-11-17 17:08:59'),
(6, 6, '', 'Bco. Nación', 'Tarjeta Creada', '2019-11-17 17:08:59'),
(7, 7, '', 'Bco. Santander', 'Tarjeta Creada', '2019-11-17 17:09:15'),
(8, 8, '', 'Bco. Ciudad', 'Tarjeta Creada', '2019-11-17 17:09:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aud_calle`
--

DROP TABLE IF EXISTS `aud_calle`;
CREATE TABLE IF NOT EXISTS `aud_calle` (
  `id_aud_calle` smallint(5) NOT NULL AUTO_INCREMENT,
  `id_calle` smallint(5) NOT NULL,
  `calle_anterior` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `calle_nuevo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `evento` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_y_hora` datetime NOT NULL,
  PRIMARY KEY (`id_aud_calle`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `aud_calle`
--

INSERT INTO `aud_calle` (`id_aud_calle`, `id_calle`, `calle_anterior`, `calle_nuevo`, `evento`, `fecha_y_hora`) VALUES
(1, 1, '', '', 'Calle Creada', '2019-11-14 15:13:51'),
(2, 1, '', '', 'Calle Borrada', '2019-11-14 15:17:00'),
(3, 1, '', 'Nicaragua', 'Calle Creada', '2019-11-14 15:21:11'),
(4, 2, '', 'Pedro Noguera', 'Calle Creada', '2019-11-14 15:21:11'),
(5, 3, '', 'General Alvear', 'Calle Creada', '2019-11-14 15:21:11'),
(6, 4, '', 'Martin Irigoyen', 'Calle Creada', '2019-11-14 15:21:11'),
(7, 5, '', 'Carlos Pellegrini', 'Calle Creada', '2019-11-14 15:21:11'),
(8, 6, '', 'Attached', 'Calle Creada', '2019-11-14 15:21:11'),
(9, 7, '', 'General Alvear', 'Calle Creada', '2019-11-14 15:21:11'),
(10, 8, '', 'Lamar', 'Calle Creada', '2019-11-14 15:21:11'),
(11, 9, '', 'Mamasa', 'Calle Creada', '2019-11-14 15:21:11'),
(12, 10, '', '', 'Calle Creada', '2019-11-14 15:22:30'),
(13, 10, '', 'C', 'Calle Editada', '2019-11-16 15:44:58'),
(14, 10, 'C', '', 'Calle Editada', '2019-11-16 19:03:30'),
(15, 10, '', '', 'Calle Borrada', '2019-11-16 20:27:40'),
(16, 10, '', '', 'Calle Creada', '2019-11-16 21:37:35'),
(17, 10, '', '', 'Calle Borrada', '2019-11-16 22:00:36'),
(18, 10, '', '', 'Calle Creada', '2019-11-16 22:04:35'),
(19, 10, '', '', 'Calle Borrada', '2019-11-16 22:26:13'),
(20, 10, '', '', 'Calle Creada', '2019-11-18 19:28:36'),
(21, 2, 'Pedro Noguera', '', 'Calle Borrada', '2019-11-18 19:55:41'),
(22, 2, '', 'Pedro Noguera', 'Calle Creada', '2019-11-18 19:59:34'),
(23, 10, '', '', 'Calle Borrada', '2019-11-19 17:27:20'),
(24, 10, '', '', 'Calle Creada', '2019-11-19 17:28:49'),
(25, 10, '', '', 'Calle Borrada', '2019-11-19 17:29:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aud_color`
--

DROP TABLE IF EXISTS `aud_color`;
CREATE TABLE IF NOT EXISTS `aud_color` (
  `id_aud_color` smallint(5) NOT NULL AUTO_INCREMENT,
  `id_color` smallint(5) NOT NULL,
  `color_anterior` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `color_nuevo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `evento` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_y_hora` datetime NOT NULL,
  PRIMARY KEY (`id_aud_color`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `aud_color`
--

INSERT INTO `aud_color` (`id_aud_color`, `id_color`, `color_anterior`, `color_nuevo`, `evento`, `fecha_y_hora`) VALUES
(1, 1, '', 'Negro', 'Color Creado', '2019-11-14 16:56:04'),
(2, 2, '', 'Blanco', 'Color Creado', '2019-11-14 16:56:04'),
(3, 3, '', 'Rojo', 'Color Creado', '2019-11-14 16:56:15'),
(4, 4, '', 'Marrón', 'Color Creado', '2019-11-14 16:56:15'),
(5, 5, '', 'Amarillo', 'Color Creado', '2019-11-14 16:56:27'),
(6, 6, '', 'Grís', 'Color Creado', '2019-11-14 16:56:27'),
(7, 7, '', 'Rosa', 'Color Creado', '2019-11-14 16:56:45'),
(8, 8, '', 'Verde', 'Color Creado', '2019-11-14 16:56:45'),
(9, 9, '', 'Celeste', 'Color Creado', '2019-11-14 16:58:43'),
(10, 10, '', 'Naranja', 'Color Creado', '2019-11-14 16:59:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aud_estacionamiento`
--

DROP TABLE IF EXISTS `aud_estacionamiento`;
CREATE TABLE IF NOT EXISTS `aud_estacionamiento` (
  `id_aud_estacionamiento` smallint(5) NOT NULL AUTO_INCREMENT,
  `id_estacionamiento` smallint(5) NOT NULL,
  `FHI_anterior` datetime NOT NULL,
  `FHI_nuevo` datetime NOT NULL,
  `latitud_anterior` float NOT NULL,
  `latitud_nuevo` float NOT NULL,
  `longitud_anterior` float NOT NULL,
  `longitud_nuevo` float NOT NULL,
  `id_EstadoEstac_anterior` smallint(5) NOT NULL,
  `id_EstadoEstac_nuevo` smallint(5) NOT NULL,
  `id_usuario_anterior` smallint(5) NOT NULL,
  `id_usuario_nuevo` smallint(5) NOT NULL,
  `id_vehiculo_anterior` smallint(5) NOT NULL,
  `id_vehiculo_nuevo` smallint(5) NOT NULL,
  `id_zona_anterior` smallint(5) NOT NULL,
  `id_zona_nuevo` smallint(5) NOT NULL,
  `FHF_anterior` datetime NOT NULL,
  `FHF_nuevo` datetime NOT NULL,
  `evento` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_y_hora` datetime NOT NULL,
  PRIMARY KEY (`id_aud_estacionamiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aud_estac_estado`
--

DROP TABLE IF EXISTS `aud_estac_estado`;
CREATE TABLE IF NOT EXISTS `aud_estac_estado` (
  `id_aud_estac_estado` smallint(5) NOT NULL AUTO_INCREMENT,
  `id_EstadoEstac` smallint(5) NOT NULL,
  `EstadoEstac_anterior` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `EstadoEstac_nuevo` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `evento` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_y_hora` datetime NOT NULL,
  PRIMARY KEY (`id_aud_estac_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aud_marca`
--

DROP TABLE IF EXISTS `aud_marca`;
CREATE TABLE IF NOT EXISTS `aud_marca` (
  `id_aud_marca` smallint(5) NOT NULL AUTO_INCREMENT,
  `id_marca` smallint(5) NOT NULL,
  `marca_anterior` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `marca_nuevo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `evento` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_y_hora` datetime NOT NULL,
  PRIMARY KEY (`id_aud_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `aud_marca`
--

INSERT INTO `aud_marca` (`id_aud_marca`, `id_marca`, `marca_anterior`, `marca_nuevo`, `evento`, `fecha_y_hora`) VALUES
(1, 1, '', 'Alfa Romeo', 'Marca Creada', '2019-11-14 16:48:28'),
(2, 2, '', 'Audi', 'Marca Creada', '2019-11-14 16:48:28'),
(3, 3, '', 'BMW', 'Marca Creada', '2019-11-14 16:48:51'),
(4, 4, '', 'Bugatti', 'Marca Creada', '2019-11-14 16:48:51'),
(5, 5, '', 'Citroën', 'Marca Creada', '2019-11-14 16:49:25'),
(6, 6, '', 'Ferrari', 'Marca Creada', '2019-11-14 16:50:19'),
(7, 7, '', 'Fiat', 'Marca Creada', '2019-11-14 16:50:19'),
(8, 8, '', 'Ford', 'Marca Creada', '2019-11-14 16:50:31'),
(9, 9, '', 'Honda', 'Marca Creada', '2019-11-14 16:50:31'),
(10, 10, '', 'Hyundai', 'Marca Creada', '2019-11-14 16:51:05'),
(11, 11, '', 'KIA', 'Marca Creada', '2019-11-14 16:51:05'),
(12, 12, '', 'Lamborghini', 'Marca Creada', '2019-11-14 16:51:45'),
(13, 13, '', 'Mercedes Benz', 'Marca Creada', '2019-11-14 16:51:45'),
(14, 14, '', 'Nissan', 'Marca Creada', '2019-11-14 16:52:01'),
(15, 15, '', 'Peugeot', 'Marca Creada', '2019-11-14 16:52:01'),
(16, 16, '', 'Porsche', 'Marca Creada', '2019-11-14 16:52:20'),
(17, 17, '', 'Renault', 'Marca Creada', '2019-11-14 16:52:20'),
(18, 18, '', 'Subaru', 'Marca Creada', '2019-11-14 16:52:44'),
(19, 19, '', 'Suzuki', 'Marca Creada', '2019-11-14 16:52:44'),
(20, 20, '', 'Jeep', 'Marca Creada', '2019-11-14 16:53:24'),
(21, 21, '', 'Audi', 'Marca Creada', '2019-11-15 11:03:27'),
(22, 22, '', 'Renault', 'Marca Creada', '2019-11-15 11:03:27'),
(23, 23, '', 'Toyota', 'Marca Creada', '2019-11-15 11:03:53'),
(24, 24, '', 'Volkswagen', 'Marca Creada', '2019-11-15 11:03:53'),
(25, 25, '', 'Chevrolet', 'Marca Creada', '2019-11-15 11:04:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aud_modelo`
--

DROP TABLE IF EXISTS `aud_modelo`;
CREATE TABLE IF NOT EXISTS `aud_modelo` (
  `id_aud_modelo` smallint(5) NOT NULL AUTO_INCREMENT,
  `id_modelo` smallint(5) NOT NULL,
  `modelo_anterior` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `modelo_nuevo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `evento` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_y_hora` datetime NOT NULL,
  PRIMARY KEY (`id_aud_modelo`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `aud_modelo`
--

INSERT INTO `aud_modelo` (`id_aud_modelo`, `id_modelo`, `modelo_anterior`, `modelo_nuevo`, `evento`, `fecha_y_hora`) VALUES
(1, 1, '', 'MEGANE TRI 1.9L TD PACK', 'Modelo Creado', '2019-11-14 17:03:42'),
(2, 2, '', 'CORSA CLASSIC 4P SUPER 1.6 N', 'Modelo Creado', '2019-11-14 17:04:00'),
(3, 3, '', 'CORSA CLASSIC 4P BASE 1.6 N', 'Modelo Creado', '2019-11-14 17:04:00'),
(4, 4, '', 'KANGOO EXP GENERIQUE 1.9 D', 'Modelo Creado', '2019-11-14 17:04:17'),
(5, 5, '', 'RANGER DC 4X2 XL PLUS 3.0LD', 'Modelo Creado', '2019-11-14 17:04:17'),
(6, 6, '', '206 XS PREMIUM 1.6 3P', 'Modelo Creado', '2019-11-14 17:04:31'),
(7, 7, '', 'FIESTA 1.6L EDGE PLUS 4P', 'Modelo Creado', '2019-11-14 17:04:31'),
(8, 8, '', 'SPRINTER 413 CDI/CH 4025 CHASIS', 'Modelo Creado', '2019-11-14 17:04:46'),
(9, 9, '', 'GOL 1.6 3P', 'Modelo Creado', '2019-11-14 17:04:46'),
(10, 10, '', 'ECOSPORT 1.6 4X2 XLS MP3', 'Modelo Creado', '2019-11-14 17:05:00'),
(11, 11, '', '307 XS PREMIUM 2.0 5P 143CV', 'Modelo Creado', '2019-11-14 17:05:00'),
(12, 12, '', '307 XS 2.0 HDI 5P 90CV', 'Modelo Creado', '2019-11-14 17:05:16'),
(13, 13, '', 'DUCATO CARGO 2.8JTD', 'Modelo Creado', '2019-11-14 17:05:16'),
(14, 14, '', 'CORSA CLASSIC FULL 1.6 N 4P', 'Modelo Creado', '2019-11-14 17:05:49'),
(15, 15, '', 'KANGOO EXP CONFORT 1.9 AA', 'Modelo Creado', '2019-11-14 17:05:49'),
(16, 16, '', 'GOL 1.9 SD 3P', 'Modelo Creado', '2019-11-14 17:06:04'),
(17, 17, '', '206 X-LINE 1.4 5P', 'Modelo Creado', '2019-11-14 17:06:04'),
(18, 18, '', 'PALIO FIRE 1242 MPI 16V 5P', 'Modelo Creado', '2019-11-14 17:06:17'),
(19, 19, '', 'CLIO PACK PLUS 1.2', 'Modelo Creado', '2019-11-14 17:06:17'),
(20, 20, '', 'BERLINGO MULTISPACE 1.9D FULL', 'Modelo Creado', '2019-11-14 17:06:34'),
(21, 21, '', 'MEGANE TRIC 1.9 L DTI FAIRWAY', 'Modelo Creado', '2019-11-14 17:06:34'),
(22, 22, '', '206 PREMIUM HDI 5P', 'Modelo Creado', '2019-11-14 17:06:55'),
(23, 23, '', '206 XS PREMIUM HDI 3P', 'Modelo Creado', '2019-11-14 17:06:55'),
(24, 24, '', 'MEGANE TRI 1.9 L TD PACK PLUS', 'Modelo Creado', '2019-11-14 17:07:19'),
(25, 25, '', 'POLO CLASSIC 1.9L SD 30A 4P', 'Modelo Creado', '2019-11-14 17:07:19'),
(26, 26, '', 'CLIO TRIC CONFORT 1.6', 'Modelo Creado', '2019-11-14 17:07:33'),
(27, 27, '', 'C3 1.4HDI XTR', 'Modelo Creado', '2019-11-14 17:07:33'),
(28, 28, '', 'UNO FIRE 1242 MPI 8V 5P', 'Modelo Creado', '2019-11-14 17:07:53'),
(29, 29, '', 'HILUX 4X4 C/D SRV 3.0 TDI PICK-UP', 'Modelo Creado', '2019-11-14 17:07:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aud_precio`
--

DROP TABLE IF EXISTS `aud_precio`;
CREATE TABLE IF NOT EXISTS `aud_precio` (
  `id_aud_precio` smallint(5) NOT NULL AUTO_INCREMENT,
  `id_precio` smallint(5) NOT NULL,
  `PrecioFijo_anterior` decimal(8,2) NOT NULL,
  `PrecioFijo_nuevo` decimal(8,2) NOT NULL,
  `PrecioPorHora_anterior` decimal(8,2) NOT NULL,
  `PrecioPorHora_nuevo` decimal(8,2) NOT NULL,
  `PrecioExcedido_anterior` decimal(8,2) NOT NULL,
  `PrecioExcedido_nuevo` decimal(8,2) NOT NULL,
  `evento` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_y_hora` datetime NOT NULL,
  PRIMARY KEY (`id_aud_precio`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `aud_precio`
--

INSERT INTO `aud_precio` (`id_aud_precio`, `id_precio`, `PrecioFijo_anterior`, `PrecioFijo_nuevo`, `PrecioPorHora_anterior`, `PrecioPorHora_nuevo`, `PrecioExcedido_anterior`, `PrecioExcedido_nuevo`, `evento`, `fecha_y_hora`) VALUES
(1, 1, '0.00', '80.00', '0.00', '70.00', '0.00', '100.00', 'Precio Creado', '2019-11-14 18:10:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aud_rol`
--

DROP TABLE IF EXISTS `aud_rol`;
CREATE TABLE IF NOT EXISTS `aud_rol` (
  `id_aud_rol` smallint(5) NOT NULL AUTO_INCREMENT,
  `id_rol` smallint(5) NOT NULL,
  `rol_anterior` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `rol_nuevo` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `evento` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_y_hora` datetime NOT NULL,
  PRIMARY KEY (`id_aud_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `aud_rol`
--

INSERT INTO `aud_rol` (`id_aud_rol`, `id_rol`, `rol_anterior`, `rol_nuevo`, `evento`, `fecha_y_hora`) VALUES
(1, 1, '', 'Root', 'Rol Creado', '2019-11-14 15:15:52'),
(2, 2, '', 'Agente de calle', 'Rol Creado', '2019-11-14 15:15:52'),
(3, 3, '', 'Cliente', 'Rol Creado', '2019-11-14 15:15:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aud_sexo`
--

DROP TABLE IF EXISTS `aud_sexo`;
CREATE TABLE IF NOT EXISTS `aud_sexo` (
  `id_aud_sexo` smallint(5) NOT NULL AUTO_INCREMENT,
  `id_sexo` smallint(5) NOT NULL,
  `sexo_anterior` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sexo_nuevo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `evento` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_y_hora` datetime NOT NULL,
  PRIMARY KEY (`id_aud_sexo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `aud_sexo`
--

INSERT INTO `aud_sexo` (`id_aud_sexo`, `id_sexo`, `sexo_anterior`, `sexo_nuevo`, `evento`, `fecha_y_hora`) VALUES
(1, 1, '', 'Masculino', 'Sexo Creado', '2019-11-14 15:12:45'),
(2, 2, '', 'Femenino', 'Sexo Creado', '2019-11-14 15:12:45'),
(3, 3, '', 'No especificar', 'Sexo Creado', '2019-11-14 15:12:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aud_tarjetas`
--

DROP TABLE IF EXISTS `aud_tarjetas`;
CREATE TABLE IF NOT EXISTS `aud_tarjetas` (
  `id_aud_tarjetas` smallint(5) NOT NULL AUTO_INCREMENT,
  `id_TarjetaDeCredito` smallint(5) NOT NULL,
  `Num_Tarjeta_anterior` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `Num_Tarjeta_nuevo` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `FechaDeExpiracion_anterior` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `FechaDeExpiracion_nuevo` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `id_banco_anterior` smallint(5) NOT NULL,
  `id_banco_nuevo` smallint(5) NOT NULL,
  `NroConfirm_anterior` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `NroConfirm_nuevo` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `id_NombreDeTarjeta_anterior` smallint(5) NOT NULL,
  `id_NombreDeTarjeta_nuevo` smallint(5) NOT NULL,
  `id_usuario_anterior` smallint(5) NOT NULL,
  `id_usuario_nuevo` smallint(5) NOT NULL,
  `evento` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_y_hora` datetime NOT NULL,
  PRIMARY KEY (`id_aud_tarjetas`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `aud_tarjetas`
--

INSERT INTO `aud_tarjetas` (`id_aud_tarjetas`, `id_TarjetaDeCredito`, `Num_Tarjeta_anterior`, `Num_Tarjeta_nuevo`, `FechaDeExpiracion_anterior`, `FechaDeExpiracion_nuevo`, `id_banco_anterior`, `id_banco_nuevo`, `NroConfirm_anterior`, `NroConfirm_nuevo`, `id_NombreDeTarjeta_anterior`, `id_NombreDeTarjeta_nuevo`, `id_usuario_anterior`, `id_usuario_nuevo`, `evento`, `fecha_y_hora`) VALUES
(1, 1, '', '1234567891234567', '', '2024-05-21', 0, 2700, '', '123', 0, 1, 0, 1, 'Tarjeta Creada', '2019-11-15 16:24:35'),
(2, 1, '1234567891234567', '', '2024-05-21', '', 2700, 0, '123', '', 1, 0, 1, 0, 'Tarjeta Borrada', '2019-11-17 13:39:44'),
(3, 4, '', '1234567898765432', '', '2021-03-10', 0, 4, '', '435', 0, 2, 0, 1, 'Tarjeta Creada', '2019-11-18 18:19:19'),
(4, 4, '1234567898765432', '', '2021-03-10', '', 4, 0, '435', '', 2, 0, 1, 0, 'Tarjeta Borrada', '2019-11-18 18:46:00'),
(5, 5, '', '1234567898765432', '', '2019-11-30', 0, 7, '', '123', 0, 1, 0, 1, 'Tarjeta Creada', '2019-11-18 18:47:27'),
(6, 6, '', '1234567898765432', '', '2019-11-30', 0, 7, '', '123', 0, 1, 0, 1, 'Tarjeta Creada', '2019-11-18 18:48:19'),
(7, 7, '', '1234567898765432', '', '2019-11-30', 0, 7, '', '123', 0, 1, 0, 1, 'Tarjeta Creada', '2019-11-18 18:48:24'),
(8, 8, '', '1234567898765432', '', '2019-11-30', 0, 7, '', '123', 0, 1, 0, 1, 'Tarjeta Creada', '2019-11-18 18:48:25'),
(9, 6, '1234567898765432', '', '2019-11-30', '', 7, 0, '123', '', 1, 0, 1, 0, 'Tarjeta Borrada', '2019-11-18 18:48:55'),
(10, 7, '1234567898765432', '', '2019-11-30', '', 7, 0, '123', '', 1, 0, 1, 0, 'Tarjeta Borrada', '2019-11-18 18:48:55'),
(11, 8, '1234567898765432', '', '2019-11-30', '', 7, 0, '123', '', 1, 0, 1, 0, 'Tarjeta Borrada', '2019-11-18 18:48:55'),
(12, 51, '1234567898765432', '1234567898765432', '2019-11-30', '2019-11-30', 7, 7, '123', '123', 1, 1, 1, 1, 'Tarjeta Editada', '2019-11-18 18:49:06'),
(13, 1, '1234567898765432', '1234567898765432', '2019-11-30', '2019-11-30', 7, 7, '123', '123', 1, 1, 1, 1, 'Tarjeta Editada', '2019-11-18 18:49:10'),
(14, 2, '', '1234567898765432', '', '2019-11-30', 0, 7, '', '123', 0, 1, 0, 1, 'Tarjeta Creada', '2019-11-18 18:53:43'),
(15, 2, '1234567898765432', '', '2019-11-30', '', 7, 0, '123', '', 1, 0, 1, 0, 'Tarjeta Borrada', '2019-11-18 18:53:50'),
(16, 1, '1234567898765432', '', '2019-11-30', '', 7, 0, '123', '', 1, 0, 1, 0, 'Tarjeta Borrada', '2019-11-18 18:59:26'),
(17, 1, '', '1234567898765432', '', '2019-11-30', 0, 4, '', '123', 0, 2, 0, 1, 'Tarjeta Creada', '2019-11-19 17:30:29'),
(18, 2, '', '9876543212345678', '', '2019-11-19', 0, 3, '', '555', 0, 1, 0, 1, 'Tarjeta Creada', '2019-11-19 17:32:46'),
(19, 2, '9876543212345678', '', '2019-11-19', '', 3, 0, '555', '', 1, 0, 1, 0, 'Tarjeta Borrada', '2019-11-19 17:33:15'),
(20, 1, '1234567898765432', '', '2019-11-30', '', 4, 0, '123', '', 2, 0, 1, 0, 'Tarjeta Borrada', '2019-11-19 18:03:56'),
(21, 1, '', '1234567898765432', '', '2020-04-15', 0, 6, '', '123', 0, 2, 0, 1, 'Tarjeta Creada', '2019-11-20 15:31:14'),
(22, 2, '', '6546897832117147', '', '2019-11-28', 0, 8, '', '599', 0, 1, 0, 1, 'Tarjeta Creada', '2019-11-20 20:29:58'),
(23, 2, '6546897832117147', '', '2019-11-28', '', 8, 0, '599', '', 1, 0, 1, 0, 'Tarjeta Borrada', '2019-11-20 20:31:08'),
(24, 1, '1234567898765432', '', '2020-04-15', '', 6, 0, '123', '', 2, 0, 1, 0, 'Tarjeta Borrada', '2019-11-20 22:02:00'),
(25, 3, '', '1234567898765432', '', '2020-06-17', 0, 4, '', '123', 0, 2, 0, 1, 'Tarjeta Creada', '2019-11-20 22:04:42'),
(26, 1, '1234567898765432', '1234567898765432', '2020-06-17', '2020-06-17', 4, 4, '123', '123', 2, 2, 1, 1, 'Tarjeta Editada', '2019-11-20 22:05:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aud_tarjetas_nombres`
--

DROP TABLE IF EXISTS `aud_tarjetas_nombres`;
CREATE TABLE IF NOT EXISTS `aud_tarjetas_nombres` (
  `id_aud_tarjNomb` smallint(5) NOT NULL AUTO_INCREMENT,
  `id_NombreDeTarjeta` smallint(5) NOT NULL,
  `NombreDeTarjeta_anterior` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `NombreDeTarjeta_nuevo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `evento` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_y_hora` datetime NOT NULL,
  PRIMARY KEY (`id_aud_tarjNomb`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `aud_tarjetas_nombres`
--

INSERT INTO `aud_tarjetas_nombres` (`id_aud_tarjNomb`, `id_NombreDeTarjeta`, `NombreDeTarjeta_anterior`, `NombreDeTarjeta_nuevo`, `evento`, `fecha_y_hora`) VALUES
(1, 1, '', 'Visa', 'Nomb Tarjeta Creada', '2019-11-15 16:21:01'),
(2, 2, '', 'Mastercard', 'Nomb Tarjeta Creada', '2019-11-15 16:21:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aud_telefono`
--

DROP TABLE IF EXISTS `aud_telefono`;
CREATE TABLE IF NOT EXISTS `aud_telefono` (
  `id_aud_telefono` smallint(5) NOT NULL AUTO_INCREMENT,
  `id_telefono` smallint(5) NOT NULL,
  `telefono_anterior` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `telefono_nuevo` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `id_usuario_anterior` smallint(5) NOT NULL,
  `id_usuario_nuevo` smallint(5) NOT NULL,
  `evento` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_y_hora` datetime NOT NULL,
  PRIMARY KEY (`id_aud_telefono`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `aud_telefono`
--

INSERT INTO `aud_telefono` (`id_aud_telefono`, `id_telefono`, `telefono_anterior`, `telefono_nuevo`, `id_usuario_anterior`, `id_usuario_nuevo`, `evento`, `fecha_y_hora`) VALUES
(1, 1, '', '1164764335', 0, 1, 'Telefono Creado', '2019-11-14 15:22:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aud_tipo`
--

DROP TABLE IF EXISTS `aud_tipo`;
CREATE TABLE IF NOT EXISTS `aud_tipo` (
  `id_aud_tipo` smallint(5) NOT NULL AUTO_INCREMENT,
  `id_tipo` smallint(5) NOT NULL,
  `Tipo_anterior` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Tipo_nuevo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `evento` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_y_hora` datetime NOT NULL,
  PRIMARY KEY (`id_aud_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `aud_tipo`
--

INSERT INTO `aud_tipo` (`id_aud_tipo`, `id_tipo`, `Tipo_anterior`, `Tipo_nuevo`, `evento`, `fecha_y_hora`) VALUES
(1, 1, '', '1', 'Tipo Creado', '2019-11-14 16:54:03'),
(2, 2, '', '2', 'Tipo Creado', '2019-11-14 16:54:03'),
(3, 3, '', '3', 'Tipo Creado', '2019-11-14 16:54:23'),
(4, 4, '', '4', 'Tipo Creado', '2019-11-14 16:54:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aud_usuarios_estado`
--

DROP TABLE IF EXISTS `aud_usuarios_estado`;
CREATE TABLE IF NOT EXISTS `aud_usuarios_estado` (
  `id_aud_usuEstado` smallint(5) NOT NULL AUTO_INCREMENT,
  `id_EstadoDeLaCuenta` smallint(5) NOT NULL,
  `EstadoDeLaCuenta_anterior` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `EstadoDeLaCuenta_nuevo` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `evento` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_y_hora` datetime NOT NULL,
  PRIMARY KEY (`id_aud_usuEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `aud_usuarios_estado`
--

INSERT INTO `aud_usuarios_estado` (`id_aud_usuEstado`, `id_EstadoDeLaCuenta`, `EstadoDeLaCuenta_anterior`, `EstadoDeLaCuenta_nuevo`, `evento`, `fecha_y_hora`) VALUES
(1, 1, '', 'Activa', 'Estado Creado', '2019-11-14 14:54:28'),
(2, 2, '', 'Inactiva', 'Estado Creado', '2019-11-14 14:54:28'),
(3, 3, '', 'Inhabilitada', 'Estado Creado', '2019-11-14 14:54:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aud_usuarios_ubicacion`
--

DROP TABLE IF EXISTS `aud_usuarios_ubicacion`;
CREATE TABLE IF NOT EXISTS `aud_usuarios_ubicacion` (
  `id_aud_usuUbi` smallint(5) NOT NULL AUTO_INCREMENT,
  `id_UbiUsu` smallint(5) NOT NULL,
  `CodigoPostal_anterior` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `CodigoPosta_nuevo` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `Localidad_anterior` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Localidad_nuevo` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `evento` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_y_hora` datetime NOT NULL,
  PRIMARY KEY (`id_aud_usuUbi`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `aud_usuarios_ubicacion`
--

INSERT INTO `aud_usuarios_ubicacion` (`id_aud_usuUbi`, `id_UbiUsu`, `CodigoPostal_anterior`, `CodigoPosta_nuevo`, `Localidad_anterior`, `Localidad_nuevo`, `evento`, `fecha_y_hora`) VALUES
(1, 1, '', '', '', '', 'Ubicacion Creada', '2019-11-14 15:13:51'),
(2, 1, '', '', '', '', 'Ubicacion Borrada', '2019-11-14 15:16:51'),
(3, 1, '', 'B1716ADS', '', 'Libertad', 'Ubicacion Creada', '2019-11-14 15:20:06'),
(4, 2, '', 'B1718RGT', '', 'San Antonio de Padua', 'Ubicacion Creada', '2019-11-14 15:20:06'),
(5, 3, '', 'B1714KIO', '', 'Ituzaingo', 'Ubicacion Creada', '2019-11-14 15:20:06'),
(6, 4, '', 'B1712JHG', '', 'Castelar', 'Ubicacion Creada', '2019-11-14 15:20:06'),
(7, 5, '', 'B1708DWE', '', 'Moron', 'Ubicacion Creada', '2019-11-14 15:20:06'),
(8, 6, '', 'B1716ADD', '', 'Moreno', 'Ubicacion Creada', '2019-11-14 15:20:06'),
(9, 7, '', 'B1714KIO', '', 'Ituzaingo', 'Ubicacion Creada', '2019-11-14 15:20:06'),
(10, 8, '', 'B1918HFT', '', 'Patricio', 'Ubicacion Creada', '2019-11-14 15:20:06'),
(11, 9, '', 'B3245JHG', '', 'Liberpadua', 'Ubicacion Creada', '2019-11-14 15:20:06'),
(12, 10, '', '', '', '', 'Ubicacion Creada', '2019-11-14 15:22:30'),
(13, 10, '', 'A', '', '', 'Ubicacion Editada', '2019-11-16 15:44:08'),
(14, 10, 'A', 'A', '', 'B', 'Ubicacion Editada', '2019-11-16 15:44:11'),
(15, 10, 'A', '', 'B', 'B', 'Ubicacion Editada', '2019-11-16 19:03:19'),
(16, 10, '', '', 'B', '', 'Ubicacion Editada', '2019-11-16 19:03:23'),
(17, 10, '', '', '', '', 'Ubicacion Borrada', '2019-11-16 22:00:36'),
(18, 10, '', '', '', '', 'Ubicacion Creada', '2019-11-16 22:04:44'),
(19, 10, '', '', '', '', 'Ubicacion Borrada', '2019-11-16 22:26:13'),
(20, 10, '', '', '', '', 'Ubicacion Creada', '2019-11-18 19:28:28'),
(22, 2, 'B1718RGT', '', 'San Antonio de Padua', '', 'Ubicacion Borrada', '2019-11-18 19:55:41'),
(23, 2, '', 'B1718RGT', '', 'San Antonio de Padua', 'Ubicacion Creada', '2019-11-18 19:58:32'),
(25, 10, '', '', '', '', 'Ubicacion Borrada', '2019-11-18 20:01:39'),
(26, 10, '', '', '', '', 'Ubicacion Creada', '2019-11-18 20:01:45'),
(27, 10, '', '', '', '', 'Ubicacion Borrada', '2019-11-19 17:27:20'),
(28, 10, '', '', '', '', 'Ubicacion Creada', '2019-11-19 17:28:59'),
(29, 10, '', '', '', '', 'Ubicacion Borrada', '2019-11-19 17:29:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aud_vehiculos_estado`
--

DROP TABLE IF EXISTS `aud_vehiculos_estado`;
CREATE TABLE IF NOT EXISTS `aud_vehiculos_estado` (
  `id_aud_vehiculoEstado` smallint(5) NOT NULL AUTO_INCREMENT,
  `id_EstadoVehic` smallint(5) NOT NULL,
  `EstadoVehic_anterior` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `EstadoVehic_nuevo` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `evento` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_y_hora` datetime NOT NULL,
  PRIMARY KEY (`id_aud_vehiculoEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `aud_vehiculos_estado`
--

INSERT INTO `aud_vehiculos_estado` (`id_aud_vehiculoEstado`, `id_EstadoVehic`, `EstadoVehic_anterior`, `EstadoVehic_nuevo`, `evento`, `fecha_y_hora`) VALUES
(1, 1, '', 'Habilitado', 'Estado Vehhiculo Creado', '2019-11-14 17:00:22'),
(2, 2, '', 'No habilitado', 'Estado Vehhiculo Creado', '2019-11-14 17:00:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aud_zona`
--

DROP TABLE IF EXISTS `aud_zona`;
CREATE TABLE IF NOT EXISTS `aud_zona` (
  `id_aud_zona` smallint(5) NOT NULL AUTO_INCREMENT,
  `id_zona` smallint(5) NOT NULL,
  `calle_anterior` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `calle_nuevo` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `AlturaDesde_anterior` int(5) NOT NULL,
  `AlturaDesde_nuevo` int(5) NOT NULL,
  `AlturaHasta_anterior` int(5) NOT NULL,
  `AlturaHasta_nuevo` int(5) NOT NULL,
  `id_precio_anterior` smallint(5) NOT NULL,
  `id_precio_nuevo` smallint(5) NOT NULL,
  `fecha_anterior` datetime NOT NULL,
  `fecha_nuevo` datetime NOT NULL,
  `EspaciosDisponibles_Anterior` smallint(5) NOT NULL,
  `EspaciosDisponibles_Nuevo` smallint(5) NOT NULL,
  `evento` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_y_hora` datetime NOT NULL,
  PRIMARY KEY (`id_aud_zona`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `aud_zona`
--

INSERT INTO `aud_zona` (`id_aud_zona`, `id_zona`, `calle_anterior`, `calle_nuevo`, `AlturaDesde_anterior`, `AlturaDesde_nuevo`, `AlturaHasta_anterior`, `AlturaHasta_nuevo`, `id_precio_anterior`, `id_precio_nuevo`, `fecha_anterior`, `fecha_nuevo`, `EspaciosDisponibles_Anterior`, `EspaciosDisponibles_Nuevo`, `evento`, `fecha_y_hora`) VALUES
(1, 1, '', 'Libertador', 0, 300, 0, 400, 0, 1, '0000-00-00 00:00:00', '2019-11-30 00:00:00', 0, 12, 'Zona creada', '2019-11-14 18:11:39'),
(2, 2, '', 'Libertador', 0, 400, 0, 500, 0, 1, '0000-00-00 00:00:00', '2019-11-30 00:00:00', 0, 12, 'Zona creada', '2019-11-14 18:12:49'),
(3, 3, '', 'Libertador', 0, 500, 0, 600, 0, 1, '0000-00-00 00:00:00', '2019-11-30 00:00:00', 0, 12, 'Zona creada', '2019-11-14 18:13:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `backup_usuarios`
--

DROP TABLE IF EXISTS `backup_usuarios`;
CREATE TABLE IF NOT EXISTS `backup_usuarios` (
  `id_backUp` smallint(5) NOT NULL AUTO_INCREMENT,
  `id_usuario` smallint(5) NOT NULL,
  `cuit_anterior` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `cuit_nuevo` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `nombres_anterior` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `nombres_nuevo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `apellido_anterior` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `apellido_nuevo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fechNac_anterior` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `fechNac_nuevo` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `correo_anterior` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `correo_nuevo` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `contrasena_anterior` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `contrasena_nuevo` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `id_sexo_anterior` smallint(5) NOT NULL,
  `id_sexo_nuevo` smallint(5) NOT NULL,
  `id_ubiUsu_anterior` smallint(5) NOT NULL,
  `id_ubiUsu_nuevo` smallint(5) NOT NULL,
  `id_calle_anterior` smallint(5) NOT NULL,
  `id_calle_nuevo` smallint(5) NOT NULL,
  `altura_anterior` smallint(5) NOT NULL,
  `altura_nuevo` smallint(5) NOT NULL,
  `SaldoEnCuenta_anterior` decimal(8,2) NOT NULL,
  `SaldoEnCuenta_nuevo` decimal(8,2) NOT NULL,
  `id_EstadoDeLaCuenta_anterior` smallint(5) NOT NULL,
  `id_EstadoDeLaCuenta_nuevo` smallint(5) NOT NULL,
  `id_rol_anterior` smallint(5) NOT NULL,
  `id_rol_nuevo` smallint(5) NOT NULL,
  `evento` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_y_hora` datetime NOT NULL,
  PRIMARY KEY (`id_backUp`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `backup_usuarios`
--

INSERT INTO `backup_usuarios` (`id_backUp`, `id_usuario`, `cuit_anterior`, `cuit_nuevo`, `nombres_anterior`, `nombres_nuevo`, `apellido_anterior`, `apellido_nuevo`, `fechNac_anterior`, `fechNac_nuevo`, `correo_anterior`, `correo_nuevo`, `contrasena_anterior`, `contrasena_nuevo`, `id_sexo_anterior`, `id_sexo_nuevo`, `id_ubiUsu_anterior`, `id_ubiUsu_nuevo`, `id_calle_anterior`, `id_calle_nuevo`, `altura_anterior`, `altura_nuevo`, `SaldoEnCuenta_anterior`, `SaldoEnCuenta_nuevo`, `id_EstadoDeLaCuenta_anterior`, `id_EstadoDeLaCuenta_nuevo`, `id_rol_anterior`, `id_rol_nuevo`, `evento`, `fecha_y_hora`) VALUES
(14, 1, '20399648018', '20399648018', 'Eliseo Daniel', 'Eliseo Daniel', 'Paglino', 'Paglino', '1998-3-31', '1998-3-31', 'paglinodaniel@hotmail.com', 'paglinodaniel@hotmail.com', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', 1, 1, 2, 2, 2, 2, 435, 0, '0.00', '0.00', 1, 1, 3, 3, 'Usuario Editado', '2019-11-18 20:11:14'),
(15, 1, '20399648018', '20399648018', 'Eliseo Daniel', 'Eliseo Daniel', 'Paglino', 'Paglino', '1998-3-31', '1998-3-31', 'paglinodaniel@hotmail.com', 'paglinodaniel@hotmail.com', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', 1, 1, 2, 10, 2, 2, 0, 0, '0.00', '0.00', 1, 1, 3, 3, 'Usuario Editado', '2019-11-18 20:11:46'),
(16, 1, '20399648018', '20399648018', 'Eliseo Daniel', 'Eliseo Daniel', 'Paglino', 'Paglino', '1998-3-31', '1998-3-31', 'paglinodaniel@hotmail.com', 'paglinodaniel@hotmail.com', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', 1, 1, 10, 10, 2, 10, 0, 0, '0.00', '0.00', 1, 1, 3, 3, 'Usuario Editado', '2019-11-18 20:11:51'),
(17, 1, '20399648018', '20399648018', 'Eliseo Daniel', 'Eliseo Daniel', 'Paglino', 'Paglino', '1998-3-31', '1998-3-31', 'paglinodaniel@hotmail.com', 'paglinodaniel@hotmail.com', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', 1, 1, 10, 2, 10, 2, 0, 435, '0.00', '0.00', 1, 1, 3, 3, 'Usuario Editado', '2019-11-18 20:12:05'),
(18, 1, '20399648018', '20399648018', 'Eliseo Daniel', 'Eliseo Daniel', 'Paglino', 'Paglino', '1998-3-31', '1998-3-31', 'paglinodaniel@hotmail.com', 'paglinodaniel@hotmail.com', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', 1, 1, 2, 2, 2, 2, 435, 435, '0.00', '0.00', 1, 1, 3, 3, 'Usuario Editado', '2019-11-18 20:18:23'),
(19, 1, '20399648018', '20399648018', 'Eliseo Daniel', 'Eliseo Daniel', 'Paglino', 'Paglino', '1998-3-31', '1998-3-31', 'paglinodaniel@hotmail.com', 'paglinodaniel@hotmail.com', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', 1, 1, 2, 2, 2, 2, 435, 435, '0.00', '0.00', 1, 1, 3, 3, 'Usuario Editado', '2019-11-18 20:18:26'),
(20, 1, '20399648018', '20399648018', 'Eliseo Daniel', 'Eliseo Daniel', 'Paglino', 'Paglino', '1998-3-31', '1998-3-31', 'paglinodaniel@hotmail.com', 'paglinodaniel@hotmail.com', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', 1, 1, 2, 2, 2, 2, 435, 0, '0.00', '0.00', 1, 1, 3, 3, 'Usuario Editado', '2019-11-19 17:26:41'),
(21, 1, '20399648018', '20399648018', 'Eliseo Daniel', 'Eliseo Daniel', 'Paglino', 'Paglino', '1998-3-31', '1998-3-31', 'paglinodaniel@hotmail.com', 'paglinodaniel@hotmail.com', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', 1, 1, 2, 10, 2, 2, 0, 0, '0.00', '0.00', 1, 1, 3, 3, 'Usuario Editado', '2019-11-19 17:26:45'),
(22, 1, '20399648018', '20399648018', 'Eliseo Daniel', 'Eliseo Daniel', 'Paglino', 'Paglino', '1998-3-31', '1998-3-31', 'paglinodaniel@hotmail.com', 'paglinodaniel@hotmail.com', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', 1, 1, 10, 10, 2, 10, 0, 0, '0.00', '0.00', 1, 1, 3, 3, 'Usuario Editado', '2019-11-19 17:26:48'),
(23, 1, '20399648018', '20399648018', 'Eliseo Daniel', 'Eliseo Daniel', 'Paglino', 'Paglino', '1998-3-31', '1998-3-31', 'paglinodaniel@hotmail.com', 'paglinodaniel@hotmail.com', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', 1, 1, 10, 2, 10, 2, 0, 435, '0.00', '0.00', 1, 1, 3, 3, 'Usuario Editado', '2019-11-19 17:27:20'),
(24, 1, '20399648018', '20399648018', 'Eliseo Daniel', 'Eliseo Daniel', 'Paglino', 'Paglino', '1998-3-31', '1998-3-31', 'paglinodaniel@hotmail.com', 'paglinodaniel@hotmail.com', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', 1, 1, 2, 2, 2, 2, 435, 0, '0.00', '0.00', 1, 1, 3, 3, 'Usuario Editado', '2019-11-19 17:29:08'),
(25, 1, '20399648018', '20399648018', 'Eliseo Daniel', 'Eliseo Daniel', 'Paglino', 'Paglino', '1998-3-31', '1998-3-31', 'paglinodaniel@hotmail.com', 'paglinodaniel@hotmail.com', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', 1, 1, 2, 10, 2, 2, 0, 0, '0.00', '0.00', 1, 1, 3, 3, 'Usuario Editado', '2019-11-19 17:29:14'),
(26, 1, '20399648018', '20399648018', 'Eliseo Daniel', 'Eliseo Daniel', 'Paglino', 'Paglino', '1998-3-31', '1998-3-31', 'paglinodaniel@hotmail.com', 'paglinodaniel@hotmail.com', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', 1, 1, 10, 10, 2, 10, 0, 0, '0.00', '0.00', 1, 1, 3, 3, 'Usuario Editado', '2019-11-19 17:29:17'),
(27, 1, '20399648018', '20399648018', 'Eliseo Daniel', 'Eliseo Daniel', 'Paglino', 'Paglino', '1998-3-31', '1998-3-31', 'paglinodaniel@hotmail.com', 'paglinodaniel@hotmail.com', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', 1, 1, 10, 2, 10, 2, 0, 435, '0.00', '0.00', 1, 1, 3, 3, 'Usuario Editado', '2019-11-19 17:29:43'),
(28, 1, '20399648018', '20399648018', 'Eliseo Daniel', 'Eliseo Daniel', 'Paglino', 'Paglino', '1998-3-31', '1998-3-31', 'paglinodaniel@hotmail.com', 'paglinodaniel@hotmail.com', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', 1, 1, 2, 2, 2, 2, 435, 435, '0.00', '0.00', 1, 1, 3, 1, 'Usuario Editado', '2019-11-20 17:41:57'),
(29, 1, '20399648018', '20399648018', 'Eliseo Daniel', 'Eliseo Daniel', 'Paglino', 'Paglino', '1998-3-31', '1998-3-31', 'paglinodaniel@hotmail.com', 'paglinodaniel@hotmail.com', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', 1, 1, 2, 2, 2, 2, 435, 435, '0.00', '0.00', 1, 1, 1, 3, 'Usuario Editado', '2019-11-20 17:44:57'),
(30, 1, '20399648018', '20399648018', 'Eliseo Daniel', 'Eliseo Daniel', 'Paglino', 'Paglino', '1998-3-31', '1998-3-31', 'paglinodaniel@hotmail.com', 'paglinodaniel@hotmail.com', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', 1, 1, 2, 2, 2, 2, 435, 435, '0.00', '0.00', 1, 1, 3, 1, 'Usuario Editado', '2019-11-20 20:06:40'),
(31, 1, '20399648018', '20399648018', 'Eliseo Daniel', 'Eliseo Daniel', 'Paglino', 'Paglino', '1998-3-31', '1998-3-31', 'paglinodaniel@hotmail.com', 'paglinodaniel@hotmail.com', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', 1, 1, 2, 2, 2, 2, 435, 435, '0.00', '0.00', 1, 1, 1, 3, 'Usuario Editado', '2019-11-20 20:16:29'),
(32, 1, '20399648018', '20399648018', 'Eliseo Daniel', 'Eliseo Daniel', 'Paglino', 'Paglino', '1998-3-31', '1998-3-31', 'paglinodaniel@hotmail.com', 'paglinodaniel@hotmail.com', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', 1, 1, 2, 2, 2, 2, 435, 435, '0.00', '2000.00', 1, 1, 3, 3, 'Usuario Editado', '2019-11-21 01:39:58'),
(33, 1, '20399648018', '20399648018', 'Eliseo Daniel', 'Eliseo Daniel', 'Paglino', 'Paglino', '1998-3-31', '1998-3-31', 'paglinodaniel@hotmail.com', 'paglinodaniel@hotmail.com', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', 1, 1, 2, 2, 2, 2, 435, 435, '2000.00', '35.00', 1, 1, 3, 3, 'Usuario Editado', '2019-11-21 02:05:06'),
(34, 1, '20399648018', '20399648018', 'Eliseo Daniel', 'Eliseo Daniel', 'Paglino', 'Paglino', '1998-3-31', '1998-3-31', 'paglinodaniel@hotmail.com', 'paglinodaniel@hotmail.com', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', 1, 1, 2, 2, 2, 2, 435, 435, '35.00', '36.00', 1, 1, 3, 3, 'Usuario Editado', '2019-11-21 02:43:28'),
(35, 1, '20399648018', '20399648018', 'Eliseo Daniel', 'Eliseo Daniel', 'Paglino', 'Paglino', '1998-3-31', '1998-3-31', 'paglinodaniel@hotmail.com', 'paglinodaniel@hotmail.com', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', 1, 1, 2, 2, 2, 2, 435, 435, '36.00', '60.00', 1, 1, 3, 3, 'Usuario Editado', '2019-11-21 02:43:43'),
(36, 1, '20399648018', '20399648018', 'Eliseo Daniel', 'Eliseo Daniel', 'Paglino', 'Paglino', '1998-3-31', '1998-3-31', 'paglinodaniel@hotmail.com', 'paglinodaniel@hotmail.com', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', 1, 1, 2, 2, 2, 2, 435, 435, '60.00', '360.00', 1, 1, 3, 3, 'Usuario Editado', '2019-11-21 02:44:16'),
(37, 1, '20399648018', '20399648018', 'Eliseo Daniel', 'Eliseo Daniel', 'Paglino', 'Paglino', '1998-3-31', '1998-3-31', 'paglinodaniel@hotmail.com', 'paglinodaniel@hotmail.com', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', 1, 1, 2, 2, 2, 2, 435, 435, '360.00', '1360.00', 1, 1, 3, 3, 'Usuario Editado', '2019-11-21 02:44:29'),
(38, 1, '20399648018', '20399648018', 'Eliseo Daniel', 'Eliseo Daniel', 'Paglino', 'Paglino', '1998-3-31', '1998-3-31', 'paglinodaniel@hotmail.com', 'paglinodaniel@hotmail.com', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', 1, 1, 2, 2, 2, 2, 435, 435, '1360.00', '11359.00', 1, 1, 3, 3, 'Usuario Editado', '2019-11-21 02:44:55'),
(39, 1, '20399648018', '20399648018', 'Eliseo Daniel', 'Eliseo Daniel', 'Paglino', 'Paglino', '1998-3-31', '1998-3-31', 'paglinodaniel@hotmail.com', 'paglinodaniel@hotmail.com', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', 1, 1, 2, 2, 2, 2, 435, 435, '11359.00', '11360.00', 1, 1, 3, 3, 'Usuario Editado', '2019-11-21 02:45:16'),
(40, 1, '20399648018', '20399648018', 'Eliseo Daniel', 'Eliseo Daniel', 'Paglino', 'Paglino', '1998-3-31', '1998-3-31', 'paglinodaniel@hotmail.com', 'paglinodaniel@hotmail.com', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', 1, 1, 2, 2, 2, 2, 435, 435, '11360.00', '13360.00', 1, 1, 3, 3, 'Usuario Editado', '2019-11-21 02:46:18'),
(41, 1, '20399648018', '20399648018', 'Eliseo Daniel', 'Eliseo Daniel', 'Paglino', 'Paglino', '1998-3-31', '1998-3-31', 'paglinodaniel@hotmail.com', 'paglinodaniel@hotmail.com', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', 1, 1, 2, 2, 2, 2, 435, 435, '13360.00', '0.00', 1, 1, 3, 3, 'Usuario Editado', '2019-11-21 02:46:51'),
(42, 1, '20399648018', '20399648018', 'Eliseo Daniel', 'Eliseo Daniel', 'Paglino', 'Paglino', '1998-3-31', '1998-3-31', 'paglinodaniel@hotmail.com', 'paglinodaniel@hotmail.com', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', 1, 1, 2, 2, 2, 2, 435, 435, '0.00', '500.00', 1, 1, 3, 3, 'Usuario Editado', '2019-11-21 02:47:06'),
(43, 1, '20399648018', '20399648018', 'Eliseo Daniel', 'Eliseo Daniel', 'Paglino', 'Paglino', '1998-3-31', '1998-3-31', 'paglinodaniel@hotmail.com', 'paglinodaniel@hotmail.com', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', 1, 1, 2, 2, 2, 2, 435, 435, '500.00', '701.00', 1, 1, 3, 3, 'Usuario Editado', '2019-11-21 02:58:37'),
(44, 1, '20399648018', '20399648018', 'Eliseo Daniel', 'Eliseo Daniel', 'Paglino', 'Paglino', '1998-3-31', '1998-3-31', 'paglinodaniel@hotmail.com', 'paglinodaniel@hotmail.com', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', 1, 1, 2, 2, 2, 2, 435, 435, '701.00', '0.00', 1, 1, 3, 3, 'Usuario Editado', '2019-11-21 03:17:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `backup_vehiculo`
--

DROP TABLE IF EXISTS `backup_vehiculo`;
CREATE TABLE IF NOT EXISTS `backup_vehiculo` (
  `id_vh_backUp` smallint(5) NOT NULL AUTO_INCREMENT,
  `id_vehiculo` smallint(5) NOT NULL,
  `anio_anterior` mediumint(5) NOT NULL,
  `anio_nuevo` smallint(5) NOT NULL,
  `patente_anterior` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `patente_nuevo` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `id_marca_anterior` smallint(5) NOT NULL,
  `id_marca_nuevo` smallint(5) NOT NULL,
  `id_tipo_anterior` smallint(5) NOT NULL,
  `id_tipo_nuevo` smallint(5) NOT NULL,
  `id_modelo_anterior` smallint(5) NOT NULL,
  `id_modelo_nuevo` smallint(5) NOT NULL,
  `id_color_anterior` smallint(5) NOT NULL,
  `id_color_nuevo` smallint(5) NOT NULL,
  `id_usuario_anterior` smallint(5) NOT NULL,
  `id_usuario_nuevo` smallint(5) NOT NULL,
  `id_EstadoVehic_anterior` smallint(5) NOT NULL,
  `id_EstadoVehic_nuevo` smallint(5) NOT NULL,
  `evento` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_y_hora` datetime NOT NULL,
  PRIMARY KEY (`id_vh_backUp`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `backup_vehiculo`
--

INSERT INTO `backup_vehiculo` (`id_vh_backUp`, `id_vehiculo`, `anio_anterior`, `anio_nuevo`, `patente_anterior`, `patente_nuevo`, `id_marca_anterior`, `id_marca_nuevo`, `id_tipo_anterior`, `id_tipo_nuevo`, `id_modelo_anterior`, `id_modelo_nuevo`, `id_color_anterior`, `id_color_nuevo`, `id_usuario_anterior`, `id_usuario_nuevo`, `id_EstadoVehic_anterior`, `id_EstadoVehic_nuevo`, `evento`, `fecha_y_hora`) VALUES
(1, 5, 0, 2017, '', 'PB221LQ', 0, 6, 0, 1, 0, 17, 0, 2, 0, 1, 0, 1, 'Vehiculo Creado', '2019-11-14 17:31:43'),
(2, 6, 0, 2019, '', 'BN458SW', 0, 8, 0, 3, 0, 5, 0, 2, 0, 1, 0, 1, 'Vehiculo Creado', '2019-11-14 17:36:42'),
(3, 1, 2017, 2017, 'PB221LQ', 'PB221LQ', 6, 6, 1, 1, 17, 17, 2, 2, 1, 1, 1, 1, 'Vehiculo Editado', '2019-11-14 17:36:58'),
(4, 2, 2019, 2019, 'BN458SW', 'BN458SW', 8, 8, 3, 3, 5, 5, 2, 2, 1, 1, 1, 1, 'Vehiculo Editado', '2019-11-14 17:37:02'),
(5, 2, 2019, 0, 'BN458SW', '', 8, 0, 3, 0, 5, 0, 2, 0, 1, 0, 1, 0, 'Vehiculo Borrado', '2019-11-18 19:30:31'),
(6, 1, 2017, 0, 'PB221LQ', '', 6, 0, 1, 0, 17, 0, 2, 0, 1, 0, 1, 0, 'Vehiculo Borrado', '2019-11-18 19:30:33'),
(7, 2, 0, 2018, '', 'AB339HN', 0, 8, 0, 3, 0, 5, 0, 2, 0, 1, 0, 1, 'Vehiculo Creado', '2019-11-20 19:11:09'),
(8, 21, 2018, 2018, 'AB339HN', 'AB339HN', 8, 8, 3, 3, 5, 5, 2, 2, 1, 1, 1, 1, 'Vehiculo Editado', '2019-11-20 19:11:21'),
(9, 1, 2018, 2018, 'AB339HN', 'AB339HN', 8, 8, 3, 3, 5, 5, 2, 2, 1, 1, 1, 1, 'Vehiculo Editado', '2019-11-20 19:11:25'),
(10, 2, 0, 2019, '', 'OKI123', 0, 4, 0, 2, 0, 27, 0, 5, 0, 1, 0, 1, 'Vehiculo Creado', '2019-11-20 19:12:56'),
(11, 3, 0, 2019, '', 'OKI123', 0, 4, 0, 2, 0, 27, 0, 5, 0, 1, 0, 1, 'Vehiculo Creado', '2019-11-20 19:15:51'),
(12, 3, 2019, 0, 'OKI123', '', 4, 0, 2, 0, 27, 0, 5, 0, 1, 0, 1, 0, 'Vehiculo Borrado', '2019-11-20 19:16:26'),
(13, 2, 2019, 0, 'OKI123', '', 4, 0, 2, 0, 27, 0, 5, 0, 1, 0, 1, 0, 'Vehiculo Borrado', '2019-11-20 19:32:04'),
(14, 1, 2018, 0, 'AB339HN', '', 8, 0, 3, 0, 5, 0, 2, 0, 1, 0, 1, 0, 'Vehiculo Borrado', '2019-11-20 19:32:06'),
(15, 4, 0, 2008, '', 'ASD654', 0, 1, 0, 2, 0, 2, 0, 5, 0, 1, 0, 1, 'Vehiculo Creado', '2019-11-20 19:59:42'),
(16, 5, 0, 2008, '', 'ASD654', 0, 1, 0, 2, 0, 2, 0, 5, 0, 1, 0, 1, 'Vehiculo Creado', '2019-11-20 19:59:50'),
(17, 5, 2008, 0, 'ASD654', '', 1, 0, 2, 0, 2, 0, 5, 0, 1, 0, 1, 0, 'Vehiculo Borrado', '2019-11-20 20:00:07'),
(18, 1, 2008, 2008, 'ASD654', 'ASD654', 1, 1, 2, 2, 2, 2, 5, 5, 1, 1, 1, 1, 'Vehiculo Editado', '2019-11-20 20:00:10'),
(19, 2, 0, 2008, '', 'ASD654', 0, 1, 0, 2, 0, 2, 0, 5, 0, 1, 0, 1, 'Vehiculo Creado', '2019-11-20 20:02:42'),
(20, 2, 2008, 0, 'ASD654', '', 1, 0, 2, 0, 2, 0, 5, 0, 1, 0, 1, 0, 'Vehiculo Borrado', '2019-11-20 20:02:51'),
(21, 2, 0, 2017, '', 'BFG9876', 0, 5, 0, 3, 0, 12, 0, 4, 0, 1, 0, 1, 'Vehiculo Creado', '2019-11-20 20:39:43'),
(22, 3, 0, 2003, '', 'XCV5874', 0, 3, 0, 2, 0, 13, 0, 9, 0, 1, 0, 1, 'Vehiculo Creado', '2019-11-20 20:40:52'),
(23, 4, 0, 2018, '', 'CV654SD', 0, 3, 0, 2, 0, 4, 0, 1, 0, 1, 0, 1, 'Vehiculo Creado', '2019-11-20 20:41:34'),
(24, 5, 0, 2017, '', 'AS123CX', 0, 5, 0, 3, 0, 5, 0, 2, 0, 1, 0, 1, 'Vehiculo Creado', '2019-11-20 20:41:57'),
(25, 6, 0, 2019, '', 'AS123CX', 0, 9, 0, 3, 0, 11, 0, 1, 0, 1, 0, 1, 'Vehiculo Creado', '2019-11-20 20:46:14'),
(26, 6, 2019, 0, 'AS123CX', '', 9, 0, 3, 0, 11, 0, 1, 0, 1, 0, 1, 0, 'Vehiculo Borrado', '2019-11-20 20:46:21'),
(27, 7, 0, 2007, '', 'AB339HN', 0, 5, 0, 3, 0, 12, 0, 6, 0, 1, 0, 1, 'Vehiculo Creado', '2019-11-20 20:49:28'),
(28, 8, 0, 2007, '', 'ASD6666', 0, 2, 0, 3, 0, 12, 0, 5, 0, 1, 0, 1, 'Vehiculo Creado', '2019-11-20 20:50:54'),
(29, 8, 2007, 0, 'ASD6666', '', 2, 0, 3, 0, 12, 0, 5, 0, 1, 0, 1, 0, 'Vehiculo Borrado', '2019-11-20 20:51:07'),
(30, 7, 2007, 0, 'AB339HN', '', 5, 0, 3, 0, 12, 0, 6, 0, 1, 0, 1, 0, 'Vehiculo Borrado', '2019-11-20 20:51:09'),
(31, 5, 2017, 0, 'AS123CX', '', 5, 0, 3, 0, 5, 0, 2, 0, 1, 0, 1, 0, 'Vehiculo Borrado', '2019-11-20 20:51:11'),
(32, 4, 2018, 0, 'CV654SD', '', 3, 0, 2, 0, 4, 0, 1, 0, 1, 0, 1, 0, 'Vehiculo Borrado', '2019-11-20 20:51:12'),
(33, 3, 2003, 0, 'XCV5874', '', 3, 0, 2, 0, 13, 0, 9, 0, 1, 0, 1, 0, 'Vehiculo Borrado', '2019-11-20 20:51:14'),
(34, 2, 2017, 0, 'BFG9876', '', 5, 0, 3, 0, 12, 0, 4, 0, 1, 0, 1, 0, 'Vehiculo Borrado', '2019-11-20 20:51:15'),
(35, 1, 2008, 0, 'ASD654', '', 1, 0, 2, 0, 2, 0, 5, 0, 1, 0, 1, 0, 'Vehiculo Borrado', '2019-11-20 20:51:22'),
(36, 9, 0, 2019, '', 'BC440JM', 0, 8, 0, 3, 0, 5, 0, 2, 0, 1, 0, 1, 'Vehiculo Creado', '2019-11-20 20:58:33'),
(37, 9, 2019, 0, 'BC440JM', '', 8, 0, 3, 0, 5, 0, 2, 0, 1, 0, 1, 0, 'Vehiculo Borrado', '2019-11-20 22:04:55'),
(38, 1, 0, 2019, '', 'BC440JM', 0, 8, 0, 1, 0, 5, 0, 2, 0, 1, 0, 1, 'Vehiculo Creado', '2019-11-20 22:12:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banco`
--

DROP TABLE IF EXISTS `banco`;
CREATE TABLE IF NOT EXISTS `banco` (
  `id_banco` smallint(5) NOT NULL AUTO_INCREMENT,
  `NombreDeBanco` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_banco`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `banco`
--

INSERT INTO `banco` (`id_banco`, `NombreDeBanco`) VALUES
(1, 'BBVA Francés'),
(2, 'Bco. Provincia'),
(3, 'Bco. HSBC'),
(4, 'Bco. Galicia'),
(5, 'Bco. Patagonia'),
(6, 'Bco. Nación'),
(7, 'Bco. Santander'),
(8, 'Bco. Ciudad');

--
-- Disparadores `banco`
--
DROP TRIGGER IF EXISTS `banco_AftIns`;
DELIMITER $$
CREATE TRIGGER `banco_AftIns` AFTER INSERT ON `banco` FOR EACH ROW INSERT INTO aud_banco(id_aud_banco,id_banco,nom_de_banco_anterior,nom_de_banco_nuevo,evento,fecha_y_hora)
VALUES
(null,NEW.id_banco,'',NEW.NombreDeBanco,'Tarjeta Creada',NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `banco_BefDel`;
DELIMITER $$
CREATE TRIGGER `banco_BefDel` BEFORE DELETE ON `banco` FOR EACH ROW INSERT INTO aud_banco(id_aud_banco,id_banco,nom_de_banco_anterior,nom_de_banco_nuevo,evento,fecha_y_hora)
VALUES
(null,OLD.id_banco,OLD.NombreDeBanco,'','Tarjeta Borrada',NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `banco_BefUpd`;
DELIMITER $$
CREATE TRIGGER `banco_BefUpd` BEFORE UPDATE ON `banco` FOR EACH ROW INSERT INTO aud_banco(id_aud_banco,id_banco,nom_de_banco_anterior,nom_de_banco_nuevo,evento,fecha_y_hora)
VALUES
(null,NEW.id_banco,OLD.NombreDeBanco,NEW.NombreDeBanco,'Tarjeta Editada',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calle`
--

DROP TABLE IF EXISTS `calle`;
CREATE TABLE IF NOT EXISTS `calle` (
  `id_calle` smallint(5) NOT NULL AUTO_INCREMENT,
  `Calle` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_calle`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `calle`
--

INSERT INTO `calle` (`id_calle`, `Calle`) VALUES
(1, 'Nicaragua'),
(2, 'Pedro Noguera'),
(3, 'General Alvear'),
(4, 'Martin Irigoyen'),
(5, 'Carlos Pellegrini'),
(6, 'Attached'),
(7, 'General Alvear'),
(8, 'Lamar'),
(9, 'Mamasa');

--
-- Disparadores `calle`
--
DROP TRIGGER IF EXISTS `calle_AftIns`;
DELIMITER $$
CREATE TRIGGER `calle_AftIns` AFTER INSERT ON `calle` FOR EACH ROW INSERT INTO aud_calle(id_aud_calle,id_calle,calle_anterior,calle_nuevo,evento,fecha_y_hora)
VALUES
(null,NEW.id_calle,'',NEW.Calle,'Calle Creada',NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `calle_BefDel`;
DELIMITER $$
CREATE TRIGGER `calle_BefDel` BEFORE DELETE ON `calle` FOR EACH ROW INSERT INTO aud_calle(id_aud_calle,id_calle,calle_anterior,calle_nuevo,evento,fecha_y_hora)
VALUES
(null,OLD.id_calle,OLD.Calle,'','Calle Borrada',NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `calle_BefUpd`;
DELIMITER $$
CREATE TRIGGER `calle_BefUpd` BEFORE UPDATE ON `calle` FOR EACH ROW INSERT INTO aud_calle(id_aud_calle,id_calle,calle_anterior,calle_nuevo,evento,fecha_y_hora)
VALUES
(null,NEW.id_calle,OLD.Calle,NEW.Calle,'Calle Editada',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `color`
--

DROP TABLE IF EXISTS `color`;
CREATE TABLE IF NOT EXISTS `color` (
  `id_color` smallint(5) NOT NULL AUTO_INCREMENT,
  `Color` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_color`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `color`
--

INSERT INTO `color` (`id_color`, `Color`) VALUES
(1, 'Negro'),
(2, 'Blanco'),
(3, 'Rojo'),
(4, 'Marrón'),
(5, 'Amarillo'),
(6, 'Grís'),
(7, 'Rosa'),
(8, 'Verde'),
(9, 'Celeste'),
(10, 'Naranja');

--
-- Disparadores `color`
--
DROP TRIGGER IF EXISTS `color_AftIns`;
DELIMITER $$
CREATE TRIGGER `color_AftIns` AFTER INSERT ON `color` FOR EACH ROW INSERT INTO aud_color(id_aud_color,id_color,color_anterior,color_nuevo,evento,fecha_y_hora)
VALUES
(null,NEW.id_color,'',NEW.Color,'Color Creado',NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `color_BefDel`;
DELIMITER $$
CREATE TRIGGER `color_BefDel` BEFORE DELETE ON `color` FOR EACH ROW INSERT INTO aud_color(id_aud_color,id_color,color_anterior,color_nuevo,evento,fecha_y_hora)
VALUES
(null,OLD.id_color,OLD.Color,'','Color Borrado',NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `color_BefUpd`;
DELIMITER $$
CREATE TRIGGER `color_BefUpd` BEFORE UPDATE ON `color` FOR EACH ROW INSERT INTO aud_color(id_aud_color,id_color,color_anterior,color_nuevo,evento,fecha_y_hora)
VALUES
(null,NEW.id_color,OLD.Color,NEW.Color,'Color Editado',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `estacezonaprec`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `estacezonaprec`;
CREATE TABLE IF NOT EXISTS `estacezonaprec` (
`id_estacionamiento` smallint(5)
,`FechaHoraInicio` datetime
,`latitud` float
,`longitud` float
,`id_EstadoEstac` smallint(5)
,`EstadoEstac` varchar(30)
,`id_usuario` smallint(5)
,`id_vehiculo` smallint(5)
,`id_zona` smallint(5)
,`calle` varchar(80)
,`AlturaDesde` int(5)
,`AlturaHasta` int(5)
,`id_precio` smallint(5)
,`PrecioFijo` decimal(8,2)
,`PrecioPorHora` decimal(8,2)
,`PrecioExcedido` decimal(8,2)
,`Fecha` datetime
,`FechaHoraFin` datetime
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estacionamiento`
--

DROP TABLE IF EXISTS `estacionamiento`;
CREATE TABLE IF NOT EXISTS `estacionamiento` (
  `id_estacionamiento` smallint(5) NOT NULL AUTO_INCREMENT,
  `FechaHoraInicio` datetime NOT NULL,
  `latitud` float NOT NULL,
  `longitud` float NOT NULL,
  `id_EstadoEstac` smallint(5) NOT NULL,
  `id_usuario` smallint(5) NOT NULL,
  `id_vehiculo` smallint(5) NOT NULL,
  `id_zona` smallint(5) NOT NULL,
  `FechaHoraFin` datetime NOT NULL,
  PRIMARY KEY (`id_estacionamiento`),
  KEY `fk_vehiculo_estacionamiento` (`id_vehiculo`),
  KEY `fk_zona_estacionamiento` (`id_zona`),
  KEY `fk_usuario_estacionamiento` (`id_usuario`),
  KEY `fk_estado_estacionamiento` (`id_EstadoEstac`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Disparadores `estacionamiento`
--
DROP TRIGGER IF EXISTS `estacionamiento_AftIns`;
DELIMITER $$
CREATE TRIGGER `estacionamiento_AftIns` AFTER INSERT ON `estacionamiento` FOR EACH ROW INSERT INTO aud_estacionamiento(id_aud_estacionamiento,id_estacionamiento,FHI_anterior,FHI_nuevo,latitud_anterior,latitud_nuevo,longitud_anterior,longitud_nuevo,id_EstadoEstac_anterior,id_EstadoEstac_nuevo,id_usuario_anterior,id_usuario_nuevo,id_vehiculo_anterior,id_vehiculo_nuevo,id_zona_anterior,id_zona_nuevo,FHF_anterior,FHF_nuevo,evento,fecha_y_hora)
VALUES
(null,NEW.id_estacionamiento,'',NEW.FechaHoraInicio,0,NEW.latitud,0,NEW.longitud,0,NEW.id_EstadoEstac,0,NEW.id_usuario,0,NEW.id_vehiculo,0,NEW.id_zona,'',NEW.FechaHoraFin,'Estacionamiento Creado',NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `estacionamiento_BefDel`;
DELIMITER $$
CREATE TRIGGER `estacionamiento_BefDel` BEFORE DELETE ON `estacionamiento` FOR EACH ROW INSERT INTO aud_estacionamiento(id_aud_estacionamiento,id_estacionamiento,FHI_anterior,FHI_nuevo,latitud_anterior,latitud_nuevo,longitud_anterior,longitud_nuevo,id_EstadoEstac_anterior,id_EstadoEstac_nuevo,id_usuario_anterior,id_usuario_nuevo,id_vehiculo_anterior,id_vehiculo_nuevo,id_zona_anterior,id_zona_nuevo,FHF_anterior,FHF_nuevo,evento,fecha_y_hora)
VALUES
(null,OLD.id_estacionamiento,OLD.FechaHoraInicio,'',OLD.latitud,0,OLD.longitud,0,OLD.id_EstadoEstac,0,OLD.id_usuario,0,OLD.id_vehiculo,0,OLD.id_zona,0,OLD.FechaHoraFin,'','Estacionamiento Borrado',NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `estacionamiento_BefUpd`;
DELIMITER $$
CREATE TRIGGER `estacionamiento_BefUpd` BEFORE UPDATE ON `estacionamiento` FOR EACH ROW INSERT INTO aud_estacionamiento(id_aud_estacionamiento,id_estacionamiento,FHI_anterior,FHI_nuevo,latitud_anterior,latitud_nuevo,longitud_anterior,longitud_nuevo,id_EstadoEstac_anterior,id_EstadoEstac_nuevo,id_usuario_anterior,id_usuario_nuevo,id_vehiculo_anterior,id_vehiculo_nuevo,id_zona_anterior,id_zona_nuevo,FHF_anterior,FHF_nuevo,evento,fecha_y_hora)
VALUES
(null,NEW.id_estacionamiento,OLD.FechaHoraInicio,NEW.FechaHoraInicio,OLD.latitud,NEW.latitud,OLD.longitud,NEW.latitud,OLD.id_EstadoEstac,NEW.id_EstadoEstac,OLD.id_usuario,NEW.id_usuario,OLD.id_vehiculo,NEW.id_vehiculo,OLD.id_zona,NEW.id_zona,OLD.FechaHoraFin,NEW.FechaHoraFin,'Estacionamiento Editado',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estac_estado`
--

DROP TABLE IF EXISTS `estac_estado`;
CREATE TABLE IF NOT EXISTS `estac_estado` (
  `id_EstadoEstac` smallint(5) NOT NULL AUTO_INCREMENT,
  `EstadoEstac` varchar(30) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id_EstadoEstac`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Disparadores `estac_estado`
--
DROP TRIGGER IF EXISTS `estac_estado_AftIns`;
DELIMITER $$
CREATE TRIGGER `estac_estado_AftIns` AFTER INSERT ON `estac_estado` FOR EACH ROW INSERT INTO aud_estac_estado(id_aud_estac_estado,id_EstadoEstac,EstadoEstac_anterior,EstadoEstac_nuevo,evento,fecha_y_hora)
VALUES
(null,NEW.id_EstadoEstac,'',NEW.EstadoEstac,'EstadoEstac Creado',NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `estac_estado_BefDel`;
DELIMITER $$
CREATE TRIGGER `estac_estado_BefDel` BEFORE DELETE ON `estac_estado` FOR EACH ROW INSERT INTO aud_estac_estado(id_aud_estac_estado,id_EstadoEstac,EstadoEstac_anterior,EstadoEstac_nuevo,evento,fecha_y_hora)
VALUES
(null,OLD.id_EstadoEstac,OLD.EstadoEstac,'','EstadoEstac Borrado',NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `estac_estado_BefUpd`;
DELIMITER $$
CREATE TRIGGER `estac_estado_BefUpd` BEFORE UPDATE ON `estac_estado` FOR EACH ROW INSERT INTO aud_estac_estado(id_aud_estac_estado,id_EstadoEstac,EstadoEstac_anterior,EstadoEstac_nuevo,evento,fecha_y_hora)
VALUES
(null,NEW.id_EstadoEstac,OLD.EstadoEstac,NEW.EstadoEstac,'EstadoEstac Editado',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

DROP TABLE IF EXISTS `marca`;
CREATE TABLE IF NOT EXISTS `marca` (
  `id_marca` smallint(5) NOT NULL AUTO_INCREMENT,
  `Marca` varchar(100) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id_marca`, `Marca`) VALUES
(1, 'Alfa Romeo'),
(2, 'Audi'),
(3, 'BMW'),
(4, 'Bugatti'),
(5, 'Citroën'),
(6, 'Ferrari'),
(7, 'Fiat'),
(8, 'Ford'),
(9, 'Honda'),
(10, 'Hyundai'),
(11, 'KIA'),
(12, 'Lamborghini'),
(13, 'Mercedes Benz'),
(14, 'Nissan'),
(15, 'Peugeot'),
(16, 'Porsche'),
(17, 'Renault'),
(18, 'Subaru'),
(19, 'Suzuki'),
(20, 'Jeep'),
(21, 'Audi'),
(22, 'Renault'),
(23, 'Toyota'),
(24, 'Volkswagen'),
(25, 'Chevrolet');

--
-- Disparadores `marca`
--
DROP TRIGGER IF EXISTS `marca_AftIns`;
DELIMITER $$
CREATE TRIGGER `marca_AftIns` AFTER INSERT ON `marca` FOR EACH ROW INSERT INTO aud_marca(id_aud_marca,id_marca,marca_anterior,marca_nuevo,evento,fecha_y_hora)
VALUES
(null,NEW.id_marca,'',NEW.Marca,'Marca Creada',NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `marca_BefDel`;
DELIMITER $$
CREATE TRIGGER `marca_BefDel` BEFORE DELETE ON `marca` FOR EACH ROW INSERT INTO aud_marca(id_aud_marca,id_marca,marca_anterior,marca_nuevo,evento,fecha_y_hora)
VALUES
(null,OLD.id_marca,OLD.Marca,'','Marca Borrada',NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `marca_BefUpd`;
DELIMITER $$
CREATE TRIGGER `marca_BefUpd` BEFORE UPDATE ON `marca` FOR EACH ROW INSERT INTO aud_marca(id_aud_marca,id_marca,marca_anterior,marca_nuevo,evento,fecha_y_hora)
VALUES
(null,NEW.id_marca,OLD.Marca,NEW.Marca,'Marca Editada',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo`
--

DROP TABLE IF EXISTS `modelo`;
CREATE TABLE IF NOT EXISTS `modelo` (
  `id_modelo` smallint(5) NOT NULL AUTO_INCREMENT,
  `Modelo` varchar(100) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id_modelo`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `modelo`
--

INSERT INTO `modelo` (`id_modelo`, `Modelo`) VALUES
(1, 'MEGANE TRI 1.9L TD PACK'),
(2, 'CORSA CLASSIC 4P SUPER 1.6 N'),
(3, 'CORSA CLASSIC 4P BASE 1.6 N'),
(4, 'KANGOO EXP GENERIQUE 1.9 D'),
(5, 'RANGER DC 4X2 XL PLUS 3.0LD'),
(6, '206 XS PREMIUM 1.6 3P'),
(7, 'FIESTA 1.6L EDGE PLUS 4P'),
(8, 'SPRINTER 413 CDI/CH 4025 CHASIS'),
(9, 'GOL 1.6 3P'),
(10, 'ECOSPORT 1.6 4X2 XLS MP3'),
(11, '307 XS PREMIUM 2.0 5P 143CV'),
(12, '307 XS 2.0 HDI 5P 90CV'),
(13, 'DUCATO CARGO 2.8JTD'),
(14, 'CORSA CLASSIC FULL 1.6 N 4P'),
(15, 'KANGOO EXP CONFORT 1.9 AA'),
(16, 'GOL 1.9 SD 3P'),
(17, '206 X-LINE 1.4 5P'),
(18, 'PALIO FIRE 1242 MPI 16V 5P'),
(19, 'CLIO PACK PLUS 1.2'),
(20, 'BERLINGO MULTISPACE 1.9D FULL'),
(21, 'MEGANE TRIC 1.9 L DTI FAIRWAY'),
(22, '206 PREMIUM HDI 5P'),
(23, '206 XS PREMIUM HDI 3P'),
(24, 'MEGANE TRI 1.9 L TD PACK PLUS'),
(25, 'POLO CLASSIC 1.9L SD 30A 4P'),
(26, 'CLIO TRIC CONFORT 1.6'),
(27, 'C3 1.4HDI XTR'),
(28, 'UNO FIRE 1242 MPI 8V 5P'),
(29, 'HILUX 4X4 C/D SRV 3.0 TDI PICK-UP');

--
-- Disparadores `modelo`
--
DROP TRIGGER IF EXISTS `modelo_AftIns`;
DELIMITER $$
CREATE TRIGGER `modelo_AftIns` AFTER INSERT ON `modelo` FOR EACH ROW INSERT INTO aud_modelo(id_aud_modelo,id_modelo,modelo_anterior,modelo_nuevo,evento,fecha_y_hora)
VALUES
(null,NEW.id_modelo,'',NEW.Modelo,'Modelo Creado',NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `modelo_BefDel`;
DELIMITER $$
CREATE TRIGGER `modelo_BefDel` BEFORE DELETE ON `modelo` FOR EACH ROW INSERT INTO aud_modelo(id_aud_modelo,id_modelo,modelo_anterior,modelo_nuevo,evento,fecha_y_hora)
VALUES
(null,OLD.id_modelo,OLD.Modelo,'','Modelo Borrado',NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `modelo_BefUpd`;
DELIMITER $$
CREATE TRIGGER `modelo_BefUpd` BEFORE UPDATE ON `modelo` FOR EACH ROW INSERT INTO aud_modelo(id_aud_modelo,id_modelo,modelo_anterior,modelo_nuevo,evento,fecha_y_hora)
VALUES
(null,NEW.id_modelo,OLD.Modelo,NEW.Modelo,'Modelo Editado',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `precio`
--

DROP TABLE IF EXISTS `precio`;
CREATE TABLE IF NOT EXISTS `precio` (
  `id_precio` smallint(5) NOT NULL AUTO_INCREMENT,
  `PrecioFijo` decimal(8,2) NOT NULL,
  `PrecioPorHora` decimal(8,2) NOT NULL,
  `PrecioExcedido` decimal(8,2) NOT NULL,
  PRIMARY KEY (`id_precio`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `precio`
--

INSERT INTO `precio` (`id_precio`, `PrecioFijo`, `PrecioPorHora`, `PrecioExcedido`) VALUES
(1, '80.00', '70.00', '100.00');

--
-- Disparadores `precio`
--
DROP TRIGGER IF EXISTS `precio_AftIns`;
DELIMITER $$
CREATE TRIGGER `precio_AftIns` AFTER INSERT ON `precio` FOR EACH ROW INSERT INTO aud_precio(id_aud_precio,id_precio,PrecioFijo_anterior,PrecioFijo_nuevo,PrecioPorHora_anterior,PrecioPorHora_nuevo,PrecioExcedido_anterior,PrecioExcedido_nuevo,evento,fecha_y_hora)
VALUES
(null,NEW.id_precio,0,NEW.PrecioFijo,0,NEW.PrecioPorHora,0,NEW.PrecioExcedido,'Precio Creado',NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `precio_BefDel`;
DELIMITER $$
CREATE TRIGGER `precio_BefDel` BEFORE DELETE ON `precio` FOR EACH ROW INSERT INTO aud_precio(id_aud_precio,id_precio,PrecioFijo_anterior,PrecioFijo_nuevo,PrecioPorHora_anterior,PrecioPorHora_nuevo,PrecioExcedido_anterior,PrecioExcedido_nuevo,evento,fecha_y_hora)
VALUES
(null,OLD.id_precio,OLD.PrecioFijo,0,OLD.PrecioPorHora,0,OLD.PrecioExcedido,0,'Precio Borrado',NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `precio_BefUpd`;
DELIMITER $$
CREATE TRIGGER `precio_BefUpd` BEFORE UPDATE ON `precio` FOR EACH ROW INSERT INTO aud_precio(id_aud_precio,id_precio,PrecioFijo_anterior,PrecioFijo_nuevo,PrecioPorHora_anterior,PrecioPorHora_nuevo,PrecioExcedido_anterior,PrecioExcedido_nuevo,evento,fecha_y_hora)
VALUES
(null,NEW.id_precio,OLD.PrecioFijo,NEW.PrecioFijo,OLD.PrecioPorHora,NEW.PrecioPorHora,OLD.PrecioExcedido,NEW.PrecioExcedido,'Precio Editado',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

DROP TABLE IF EXISTS `rol`;
CREATE TABLE IF NOT EXISTS `rol` (
  `id_rol` smallint(5) NOT NULL AUTO_INCREMENT,
  `rol` varchar(30) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `rol`) VALUES
(1, 'Root'),
(2, 'Agente de calle'),
(3, 'Cliente');

--
-- Disparadores `rol`
--
DROP TRIGGER IF EXISTS `rol_AftIns`;
DELIMITER $$
CREATE TRIGGER `rol_AftIns` AFTER INSERT ON `rol` FOR EACH ROW INSERT INTO aud_rol(id_aud_rol,id_rol,rol_anterior,rol_nuevo,evento,fecha_y_hora)
VALUES
(null,NEW.id_rol,'',NEW.rol,'Rol Creado',NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `rol_BefDel`;
DELIMITER $$
CREATE TRIGGER `rol_BefDel` BEFORE DELETE ON `rol` FOR EACH ROW INSERT INTO aud_rol(id_aud_rol,id_rol,rol_anterior,rol_nuevo,evento,fecha_y_hora)
VALUES
(null,OLD.id_rol,OLD.rol,'','Rol Borrado',NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `rol_BefUpd`;
DELIMITER $$
CREATE TRIGGER `rol_BefUpd` BEFORE UPDATE ON `rol` FOR EACH ROW INSERT INTO aud_rol(id_aud_rol,id_rol,rol_anterior,rol_nuevo,evento,fecha_y_hora)
VALUES
(null,NEW.id_rol,OLD.rol,NEW.rol,'Rol Editado',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sexo`
--

DROP TABLE IF EXISTS `sexo`;
CREATE TABLE IF NOT EXISTS `sexo` (
  `id_Sexo` smallint(5) NOT NULL AUTO_INCREMENT,
  `Sexo` varchar(100) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id_Sexo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `sexo`
--

INSERT INTO `sexo` (`id_Sexo`, `Sexo`) VALUES
(1, 'Masculino'),
(2, 'Femenino'),
(3, 'No especificar');

--
-- Disparadores `sexo`
--
DROP TRIGGER IF EXISTS `sexo_AftIns`;
DELIMITER $$
CREATE TRIGGER `sexo_AftIns` AFTER INSERT ON `sexo` FOR EACH ROW INSERT INTO aud_sexo(id_aud_sexo,id_sexo,sexo_anterior,sexo_nuevo,evento,fecha_y_hora)
VALUES
(null,NEW.id_Sexo,'',NEW.Sexo,'Sexo Creado',NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `sexo_BefDel`;
DELIMITER $$
CREATE TRIGGER `sexo_BefDel` BEFORE DELETE ON `sexo` FOR EACH ROW INSERT INTO aud_sexo(id_aud_Sexo,id_sexo,sexo_anterior,sexo_nuevo,evento,fecha_y_hora)
VALUES
(null,OLD.id_Sexo,OLD.Sexo,'','Sexo Borrado',NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `sexo_BefUpd`;
DELIMITER $$
CREATE TRIGGER `sexo_BefUpd` BEFORE UPDATE ON `sexo` FOR EACH ROW INSERT INTO aud_sexo(id_aud_sexo,id_sexo,sexo_anterior,sexo_nuevo,evento,fecha_y_hora)
VALUES
(null,NEW.id_Sexo,OLD.Sexo,NEW.Sexo,'Sexo Editado',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjetas`
--

DROP TABLE IF EXISTS `tarjetas`;
CREATE TABLE IF NOT EXISTS `tarjetas` (
  `id_TarjetaDeCredito` smallint(5) NOT NULL AUTO_INCREMENT,
  `Num_Tarjeta` varchar(16) CHARACTER SET utf8 NOT NULL,
  `FechaDeExpiracion` varchar(10) CHARACTER SET utf8 NOT NULL,
  `id_banco` smallint(5) NOT NULL,
  `NroConfirm` varchar(3) CHARACTER SET utf8 NOT NULL,
  `id_NombreDeTarjeta` smallint(5) NOT NULL,
  `id_usuario` smallint(5) NOT NULL,
  PRIMARY KEY (`id_TarjetaDeCredito`),
  KEY `fk_usuarios_tarjetas` (`id_usuario`),
  KEY `fk_nombre_tarjetas` (`id_NombreDeTarjeta`),
  KEY `fk_banco_tarjetas` (`id_banco`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tarjetas`
--

INSERT INTO `tarjetas` (`id_TarjetaDeCredito`, `Num_Tarjeta`, `FechaDeExpiracion`, `id_banco`, `NroConfirm`, `id_NombreDeTarjeta`, `id_usuario`) VALUES
(1, '1234567898765432', '2020-06-17', 4, '123', 2, 1);

--
-- Disparadores `tarjetas`
--
DROP TRIGGER IF EXISTS `tarjetas_AftIns`;
DELIMITER $$
CREATE TRIGGER `tarjetas_AftIns` AFTER INSERT ON `tarjetas` FOR EACH ROW INSERT INTO aud_tarjetas(id_aud_tarjetas,id_TarjetaDeCredito,Num_Tarjeta_anterior,Num_Tarjeta_nuevo,FechaDeExpiracion_anterior,FechaDeExpiracion_nuevo,id_banco_anterior,id_banco_nuevo,NroConfirm_anterior,NroConfirm_nuevo,id_NombreDeTarjeta_anterior,id_NombreDeTarjeta_nuevo,id_usuario_anterior,id_usuario_nuevo,evento,fecha_y_hora)
VALUES
(null,NEW.id_TarjetaDeCredito,'',NEW.Num_Tarjeta,'',NEW.FechaDeExpiracion,0,NEW.id_banco,'',NEW.NroConfirm,0,NEW.id_NombreDeTarjeta,0,NEW.id_usuario,'Tarjeta Creada',NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `tarjetas_BefDel`;
DELIMITER $$
CREATE TRIGGER `tarjetas_BefDel` BEFORE DELETE ON `tarjetas` FOR EACH ROW INSERT INTO aud_tarjetas(id_aud_tarjetas,id_TarjetaDeCredito,Num_Tarjeta_anterior,Num_Tarjeta_nuevo,FechaDeExpiracion_anterior,FechaDeExpiracion_nuevo,id_banco_anterior,id_banco_nuevo,NroConfirm_anterior,NroConfirm_nuevo,id_NombreDeTarjeta_anterior,id_NombreDeTarjeta_nuevo,id_usuario_anterior,id_usuario_nuevo,evento,fecha_y_hora)
VALUES
(null,OLD.id_TarjetaDeCredito,OLD.Num_Tarjeta,'',OLD.FechaDeExpiracion,'',OLD.id_banco,0,OLD.NroConfirm,'',OLD.id_NombreDeTarjeta,0,OLD.id_usuario,0,'Tarjeta Borrada',NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `tarjetas_BefUpd`;
DELIMITER $$
CREATE TRIGGER `tarjetas_BefUpd` BEFORE UPDATE ON `tarjetas` FOR EACH ROW INSERT INTO aud_tarjetas(id_aud_tarjetas,id_TarjetaDeCredito,Num_Tarjeta_anterior,Num_Tarjeta_nuevo,FechaDeExpiracion_anterior,FechaDeExpiracion_nuevo,id_banco_anterior,id_banco_nuevo,NroConfirm_anterior,NroConfirm_nuevo,id_NombreDeTarjeta_anterior,id_NombreDeTarjeta_nuevo,id_usuario_anterior,id_usuario_nuevo,evento,fecha_y_hora)
VALUES
(null,NEW.id_TarjetaDeCredito,OLD.Num_Tarjeta,NEW.Num_Tarjeta,OLD.FechaDeExpiracion,NEW.FechaDeExpiracion,OLD.id_banco,NEW.id_banco,OLD.NroConfirm,NEW.NroConfirm,OLD.id_NombreDeTarjeta,NEW.id_NombreDeTarjeta,OLD.id_usuario,NEW.id_usuario,'Tarjeta Editada',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjetas_nombres`
--

DROP TABLE IF EXISTS `tarjetas_nombres`;
CREATE TABLE IF NOT EXISTS `tarjetas_nombres` (
  `id_NombreDeTarjeta` smallint(5) NOT NULL AUTO_INCREMENT,
  `NombreDeTarjeta` varchar(100) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id_NombreDeTarjeta`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tarjetas_nombres`
--

INSERT INTO `tarjetas_nombres` (`id_NombreDeTarjeta`, `NombreDeTarjeta`) VALUES
(1, 'Visa'),
(2, 'Mastercard');

--
-- Disparadores `tarjetas_nombres`
--
DROP TRIGGER IF EXISTS `tarjetas_nombres_AftIns`;
DELIMITER $$
CREATE TRIGGER `tarjetas_nombres_AftIns` AFTER INSERT ON `tarjetas_nombres` FOR EACH ROW INSERT INTO aud_tarjetas_nombres(id_aud_tarjNomb,id_NombreDeTarjeta,NombreDeTarjeta_anterior,NombreDeTarjeta_nuevo,evento,fecha_y_hora)
VALUES
(null,NEW.id_NombreDeTarjeta,'',NEW.NombreDeTarjeta,'Nomb Tarjeta Creada',NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `tarjetas_nombres_BefDel`;
DELIMITER $$
CREATE TRIGGER `tarjetas_nombres_BefDel` BEFORE DELETE ON `tarjetas_nombres` FOR EACH ROW INSERT INTO aud_tarjetas_nombres(id_aud_tarjNomb,id_NombreDeTarjeta,NombreDeTarjeta_anterior,NombreDeTarjeta_nuevo,evento,fecha_y_hora)
VALUES
(null,OLD.id_NombreDeTarjeta,OLD.NombreDeTarjeta,'','Nomb Tarjeta Borrado',NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `tarjetas_nombres_BefUpd`;
DELIMITER $$
CREATE TRIGGER `tarjetas_nombres_BefUpd` BEFORE UPDATE ON `tarjetas_nombres` FOR EACH ROW INSERT INTO aud_tarjetas_nombreso(id_aud_tarjNomb,id_NombreDeTarjeta,NombreDeTarjeta_anterior,NombreDeTarjeta_nuevo,evento,fecha_y_hora)
VALUES
(null,NEW.id_NombreDeTarjeta,OLD.NombreDeTarjeta,NEW.NombreDeTarjeta,'Nomb Tarjeta Editado',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `tarjetaview`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `tarjetaview`;
CREATE TABLE IF NOT EXISTS `tarjetaview` (
`id_TarjetaDeCredito` smallint(5)
,`Num_Tarjeta` varchar(16)
,`FechaDeExpiracion` varchar(10)
,`id_banco` smallint(5)
,`NombreDeBanco` varchar(100)
,`NroConfirm` varchar(3)
,`id_NombreDeTarjeta` smallint(5)
,`NombreDeTarjeta` varchar(100)
,`id_usuario` smallint(5)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono`
--

DROP TABLE IF EXISTS `telefono`;
CREATE TABLE IF NOT EXISTS `telefono` (
  `id_telefono` smallint(5) NOT NULL AUTO_INCREMENT,
  `telefono` varchar(11) CHARACTER SET utf8 NOT NULL,
  `id_usuario` smallint(5) NOT NULL,
  PRIMARY KEY (`id_telefono`),
  KEY `fk_usuarios_telefono` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `telefono`
--

INSERT INTO `telefono` (`id_telefono`, `telefono`, `id_usuario`) VALUES
(1, '1164764335', 1);

--
-- Disparadores `telefono`
--
DROP TRIGGER IF EXISTS `telefono_AftIns`;
DELIMITER $$
CREATE TRIGGER `telefono_AftIns` AFTER INSERT ON `telefono` FOR EACH ROW INSERT INTO aud_telefono(id_aud_telefono,id_telefono,telefono_anterior,telefono_nuevo,id_usuario_anterior,id_usuario_nuevo,evento,fecha_y_hora)
VALUES
(null,NEW.id_telefono,'',NEW.telefono,0,NEW.id_usuario,'Telefono Creado',NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `telefono_BefDel`;
DELIMITER $$
CREATE TRIGGER `telefono_BefDel` BEFORE DELETE ON `telefono` FOR EACH ROW INSERT INTO aud_telefono(id_aud_telefono,id_telefono,telefono_anterior,telefono_nuevo,id_usuario_anterior,id_usuario_nuevo,evento,fecha_y_hora)
VALUES
(null,OLD.id_telefono,OLD.telefono,'',OLD.id_usuario,0,'Telefono Borrado',NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `telefono_BefUpd`;
DELIMITER $$
CREATE TRIGGER `telefono_BefUpd` BEFORE UPDATE ON `telefono` FOR EACH ROW INSERT INTO aud_telefono(id_aud_telefono,id_telefono,telefono_anterior,telefono_nuevo,id_usuario_anterior,id_usuario_nuevo,evento,fecha_y_hora)
VALUES
(null,NEW.id_telefono,OLD.telefono,NEW.telefono,OLD.id_usuario,NEW.id_usuario,'Telefono Editado',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

DROP TABLE IF EXISTS `tipo`;
CREATE TABLE IF NOT EXISTS `tipo` (
  `id_tipo` smallint(5) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(100) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`id_tipo`, `Tipo`) VALUES
(1, 'Auto'),
(2, 'Moto'),
(3, 'Camioneta'),
(4, 'Camión');

--
-- Disparadores `tipo`
--
DROP TRIGGER IF EXISTS `tipo_AftIns`;
DELIMITER $$
CREATE TRIGGER `tipo_AftIns` AFTER INSERT ON `tipo` FOR EACH ROW INSERT INTO aud_tipo(id_aud_tipo,id_tipo,Tipo_anterior,Tipo_nuevo,evento,fecha_y_hora)
VALUES
(null,NEW.id_tipo,'',NEW.id_tipo,'Tipo Creado',NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `tipo_BefDel`;
DELIMITER $$
CREATE TRIGGER `tipo_BefDel` BEFORE DELETE ON `tipo` FOR EACH ROW INSERT INTO aud_tipo(id_aud_tipo,id_tipo,Tipo_anterior,Tipo_nuevo,evento,fecha_y_hora)
VALUES
(null,OLD.id_tipo,OLD.Tipo,'','Tipo Borrado',NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `tipo_BefUpd`;
DELIMITER $$
CREATE TRIGGER `tipo_BefUpd` BEFORE UPDATE ON `tipo` FOR EACH ROW INSERT INTO aud_tipo(id_aud_tipo,id_tipo,Tipo_anterior,Tipo_nuevo,evento,fecha_y_hora)
VALUES
(null,NEW.id_tipo,OLD.Tipo,NEW.Tipo,'Tipo Editado',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `ussxubcestrol`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `ussxubcestrol`;
CREATE TABLE IF NOT EXISTS `ussxubcestrol` (
`id_usuario` smallint(5)
,`CUIT` varchar(11)
,`nombres` varchar(100)
,`apellido` varchar(100)
,`FechaDeNacimiento` varchar(10)
,`correo` varchar(80)
,`id_sexo` smallint(5)
,`Sexo` varchar(100)
,`id_UbiUsu` smallint(5)
,`CodigoPostal` varchar(8)
,`Localidad` varchar(50)
,`id_calle` smallint(5)
,`Calle` varchar(80)
,`altura` smallint(5)
,`SaldoEnCuenta` decimal(8,2)
,`id_EstadoDeLaCuenta` smallint(5)
,`EstadoDeLaCuenta` varchar(30)
,`id_rol` smallint(5)
,`rol` varchar(30)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` smallint(5) NOT NULL AUTO_INCREMENT,
  `CUIT` varchar(11) CHARACTER SET utf8 NOT NULL,
  `nombres` varchar(100) CHARACTER SET utf8 NOT NULL,
  `apellido` varchar(100) CHARACTER SET utf8 NOT NULL,
  `FechaDeNacimiento` varchar(10) CHARACTER SET utf8 NOT NULL,
  `correo` varchar(80) CHARACTER SET utf8 NOT NULL,
  `contrasena` varchar(150) CHARACTER SET utf8 NOT NULL,
  `id_sexo` smallint(5) NOT NULL,
  `id_UbiUsu` smallint(5) NOT NULL,
  `id_calle` smallint(5) NOT NULL,
  `altura` smallint(5) NOT NULL,
  `SaldoEnCuenta` decimal(8,2) NOT NULL,
  `id_EstadoDeLaCuenta` smallint(5) NOT NULL,
  `id_rol` smallint(5) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `fk_sexo_usuarios` (`id_sexo`),
  KEY `fk_estado_usuarios` (`id_EstadoDeLaCuenta`),
  KEY `fk_calle_usuarios` (`id_calle`),
  KEY `fk_ubicacion_usuarios` (`id_UbiUsu`),
  KEY `fk_rol_usuarios` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `CUIT`, `nombres`, `apellido`, `FechaDeNacimiento`, `correo`, `contrasena`, `id_sexo`, `id_UbiUsu`, `id_calle`, `altura`, `SaldoEnCuenta`, `id_EstadoDeLaCuenta`, `id_rol`) VALUES
(1, '20399648018', 'Eliseo Daniel', 'Paglino', '1998-3-31', 'paglinodaniel@hotmail.com', '$2y$10$LlXZXS1JTb0rwIsbbD60OO5G86MP85hPS09oxECh1LBy4gGfoeKoy', 1, 2, 2, 435, '0.00', 1, 3);

--
-- Disparadores `usuarios`
--
DROP TRIGGER IF EXISTS `usuario_AftIns`;
DELIMITER $$
CREATE TRIGGER `usuario_AftIns` AFTER INSERT ON `usuarios` FOR EACH ROW INSERT INTO backup_usuarios(id_backUp,id_usuario,cuit_anterior,cuit_nuevo,nombres_anterior,nombres_nuevo,apellido_anterior,apellido_nuevo,fechNac_anterior,fechNac_nuevo,correo_anterior,correo_nuevo,contrasena_anterior,contrasena_nuevo,id_sexo_anterior,id_sexo_nuevo,id_ubiUsu_anterior,id_ubiUsu_nuevo,id_calle_anterior,id_calle_nuevo,altura_anterior,altura_nuevo,SaldoEnCuenta_anterior,SaldoEnCuenta_nuevo,id_EstadoDeLaCuenta_anterior,id_EstadoDeLaCuenta_nuevo,id_rol_anterior,id_rol_nuevo,evento,fecha_y_hora)
VALUES
(null,NEW.id_usuario,'',NEW.CUIT,'',NEW.nombres,'',NEW.apellido,'',NEW.FechaDeNacimiento,'',NEW.correo,'',NEW.contrasena,0,NEW.id_sexo,0,NEW.id_UbiUsu,0,NEW.id_calle,0,NEW.altura,0,NEW.SaldoEnCuenta,0,NEW.id_EstadoDeLaCuenta,0,NEW.id_rol,'Usuario Creado',NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `usuario_BefDel`;
DELIMITER $$
CREATE TRIGGER `usuario_BefDel` BEFORE DELETE ON `usuarios` FOR EACH ROW INSERT INTO backup_usuarios(id_backUp,id_usuario,cuit_anterior,cuit_nuevo,nombres_anterior,nombres_nuevo,apellido_anterior,apellido_nuevo,fechNac_anterior,fechNac_nuevo,correo_anterior,correo_nuevo,contrasena_anterior,contrasena_nuevo,id_sexo_anterior,id_sexo_nuevo,id_ubiUsu_anterior,id_ubiUsu_nuevo,id_calle_anterior,id_calle_nuevo,altura_anterior,altura_nuevo,SaldoEnCuenta_anterior,SaldoEnCuenta_nuevo,id_EstadoDeLaCuenta_anterior,id_EstadoDeLaCuenta_nuevo,id_rol_anterior,id_rol_nuevo,evento,fecha_y_hora)
VALUES
(null,OLD.id_usuario,OLD.CUIT,'',OLD.nombres,'',OLD.apellido,'',OLD.FechaDeNacimiento,'',OLD.correo,'',OLD.contrasena,'',OLD.id_sexo,0,OLD.id_UbiUsu,0,OLD.id_calle,0,OLD.altura,0,OLD.SaldoEnCuenta,0,OLD.id_EstadoDeLaCuenta,0,OLD.id_rol,0,'Usuario Borrado',NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `usuario_BefUpd`;
DELIMITER $$
CREATE TRIGGER `usuario_BefUpd` BEFORE UPDATE ON `usuarios` FOR EACH ROW INSERT INTO backup_usuarios(id_backUp,id_usuario,cuit_anterior,cuit_nuevo,nombres_anterior,nombres_nuevo,apellido_anterior,apellido_nuevo,fechNac_anterior,fechNac_nuevo,correo_anterior,correo_nuevo,contrasena_anterior,contrasena_nuevo,id_sexo_anterior,id_sexo_nuevo,id_ubiUsu_anterior,id_ubiUsu_nuevo,id_calle_anterior,id_calle_nuevo,altura_anterior,altura_nuevo,SaldoEnCuenta_anterior,SaldoEnCuenta_nuevo,id_EstadoDeLaCuenta_anterior,id_EstadoDeLaCuenta_nuevo,id_rol_anterior,id_rol_nuevo,evento,fecha_y_hora)
VALUES
(null,NEW.id_usuario,OLD.cuit,NEW.cuit,OLD.nombres,NEW.nombres,OLD.apellido,NEW.apellido,OLD.FechaDeNacimiento,NEW.FechaDeNacimiento,OLD.correo,NEW.correo,OLD.contrasena,NEW.contrasena,OLD.id_sexo,NEW.id_sexo,OLD.id_UbiUsu,NEW.id_UbiUsu,OLD.id_calle,NEW.id_calle,OLD.altura,NEW.altura,OLD.SaldoEnCuenta,NEW.SaldoEnCuenta,OLD.id_EstadoDeLaCuenta,NEW.id_EstadoDeLaCuenta,OLD.id_rol,NEW.id_rol,'Usuario Editado',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_estado`
--

DROP TABLE IF EXISTS `usuarios_estado`;
CREATE TABLE IF NOT EXISTS `usuarios_estado` (
  `id_EstadoDeLaCuenta` smallint(5) NOT NULL AUTO_INCREMENT,
  `EstadoDeLaCuenta` varchar(30) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id_EstadoDeLaCuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios_estado`
--

INSERT INTO `usuarios_estado` (`id_EstadoDeLaCuenta`, `EstadoDeLaCuenta`) VALUES
(1, 'Activa'),
(2, 'Inactiva'),
(3, 'Inhabilitada');

--
-- Disparadores `usuarios_estado`
--
DROP TRIGGER IF EXISTS `usuarios_estado_AftIns`;
DELIMITER $$
CREATE TRIGGER `usuarios_estado_AftIns` AFTER INSERT ON `usuarios_estado` FOR EACH ROW INSERT INTO aud_usuarios_estado(id_aud_usuEstado,id_EstadoDeLaCuenta,EstadoDeLaCuenta_anterior,EstadoDeLaCuenta_nuevo,evento,fecha_y_hora)
VALUES
(null,NEW.id_EstadoDeLaCuenta,'',NEW.EstadoDeLaCuenta,'Estado Creado',NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `usuarios_estado_BefDel`;
DELIMITER $$
CREATE TRIGGER `usuarios_estado_BefDel` BEFORE DELETE ON `usuarios_estado` FOR EACH ROW INSERT INTO aud_usuarios_estado(id_aud_usuEstado,id_EstadoDeLaCuenta,EstadoDeLaCuenta_anterior,EstadoDeLaCuenta_nuevo,evento,fecha_y_hora)
VALUES
(null,OLD.id_EstadoDeLaCuenta,OLD.EstadoDeLaCuenta,'','Estado Borrado',NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `usuarios_estado_BefUpd`;
DELIMITER $$
CREATE TRIGGER `usuarios_estado_BefUpd` BEFORE UPDATE ON `usuarios_estado` FOR EACH ROW INSERT INTO aud_usuarios_estado(id_aud_usuEstado,id_EstadoDeLaCuenta,EstadoDeLaCuenta_anterior,EstadoDeLaCuenta_nuevo,evento,fecha_y_hora)
VALUES
(null,NEW.id_EstadoDeLaCuenta,OLD.EstadoDeLaCuenta,NEW.EstadoDeLaCuenta,'Estado Editado',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_ubicacion`
--

DROP TABLE IF EXISTS `usuarios_ubicacion`;
CREATE TABLE IF NOT EXISTS `usuarios_ubicacion` (
  `id_UbiUsu` smallint(5) NOT NULL AUTO_INCREMENT,
  `CodigoPostal` varchar(8) CHARACTER SET utf8 NOT NULL,
  `Localidad` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id_UbiUsu`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios_ubicacion`
--

INSERT INTO `usuarios_ubicacion` (`id_UbiUsu`, `CodigoPostal`, `Localidad`) VALUES
(1, 'B1716ADS', 'Libertad'),
(2, 'B1718RGT', 'San Antonio de Padua'),
(3, 'B1714KIO', 'Ituzaingo'),
(4, 'B1712JHG', 'Castelar'),
(5, 'B1708DWE', 'Moron'),
(6, 'B1716ADD', 'Moreno'),
(7, 'B1714KIO', 'Ituzaingo'),
(8, 'B1918HFT', 'Patricio'),
(9, 'B3245JHG', 'Liberpadua');

--
-- Disparadores `usuarios_ubicacion`
--
DROP TRIGGER IF EXISTS `usuarios_ubicacion_AftIns`;
DELIMITER $$
CREATE TRIGGER `usuarios_ubicacion_AftIns` AFTER INSERT ON `usuarios_ubicacion` FOR EACH ROW INSERT INTO aud_usuarios_ubicacion(id_aud_usuUbi,id_UbiUsu,CodigoPostal_anterior,CodigoPosta_nuevo,Localidad_anterior,Localidad_nuevo,evento,fecha_y_hora)
VALUES
(null,NEW.id_UbiUsu,'',NEW.CodigoPostal,'',NEW.Localidad,'Ubicacion Creada',NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `usuarios_ubicacion_BefDel`;
DELIMITER $$
CREATE TRIGGER `usuarios_ubicacion_BefDel` BEFORE DELETE ON `usuarios_ubicacion` FOR EACH ROW INSERT INTO aud_usuarios_ubicacion(id_aud_usuUbi,id_UbiUsu,CodigoPostal_anterior,CodigoPosta_nuevo,Localidad_anterior,Localidad_nuevo,evento,fecha_y_hora)
VALUES
(null,OLD.id_UbiUsu,OLD.CodigoPostal,'',OLD.Localidad,'','Ubicacion Borrada',NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `usuarios_ubicacion_BefUpd`;
DELIMITER $$
CREATE TRIGGER `usuarios_ubicacion_BefUpd` BEFORE UPDATE ON `usuarios_ubicacion` FOR EACH ROW INSERT INTO aud_usuarios_ubicacion(id_aud_usuUbi,id_UbiUsu,CodigoPostal_anterior,CodigoPosta_nuevo,Localidad_anterior,Localidad_nuevo,evento,fecha_y_hora)
VALUES
(null,NEW.id_UbiUsu,OLD.CodigoPostal,NEW.CodigoPostal,OLD.Localidad,NEW.Localidad,'Ubicacion Editada',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vehiculomtmce`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `vehiculomtmce`;
CREATE TABLE IF NOT EXISTS `vehiculomtmce` (
`id_vehiculo` smallint(5)
,`anio` smallint(5)
,`patente` varchar(7)
,`id_marca` smallint(5)
,`Marca` varchar(100)
,`id_tipo` smallint(5)
,`Tipo` varchar(100)
,`id_modelo` smallint(5)
,`Modelo` varchar(100)
,`id_color` smallint(5)
,`Color` varchar(100)
,`id_usuario` smallint(5)
,`id_EstadoVehic` smallint(5)
,`EstadoVehic` varchar(30)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos`
--

DROP TABLE IF EXISTS `vehiculos`;
CREATE TABLE IF NOT EXISTS `vehiculos` (
  `id_vehiculo` smallint(5) NOT NULL AUTO_INCREMENT,
  `anio` smallint(5) NOT NULL,
  `patente` varchar(7) CHARACTER SET utf8 NOT NULL,
  `id_marca` smallint(5) NOT NULL,
  `id_tipo` smallint(5) NOT NULL,
  `id_modelo` smallint(5) NOT NULL,
  `id_color` smallint(5) NOT NULL,
  `id_usuario` smallint(5) NOT NULL,
  `id_EstadoVehic` smallint(5) NOT NULL,
  PRIMARY KEY (`id_vehiculo`),
  KEY `fk_marca_vehiculos` (`id_marca`),
  KEY `fk_tipo_vehiculos` (`id_tipo`),
  KEY `fk_modelo_vehiculos` (`id_modelo`),
  KEY `fk_color_vehiculos` (`id_color`),
  KEY `fk_usuarios_vehiculos` (`id_usuario`),
  KEY `fk_estado_vehiculos` (`id_EstadoVehic`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `vehiculos`
--

INSERT INTO `vehiculos` (`id_vehiculo`, `anio`, `patente`, `id_marca`, `id_tipo`, `id_modelo`, `id_color`, `id_usuario`, `id_EstadoVehic`) VALUES
(1, 2019, 'BC440JM', 8, 1, 5, 2, 1, 1);

--
-- Disparadores `vehiculos`
--
DROP TRIGGER IF EXISTS `vehiculo_AftIns`;
DELIMITER $$
CREATE TRIGGER `vehiculo_AftIns` AFTER INSERT ON `vehiculos` FOR EACH ROW INSERT INTO backup_vehiculo(id_vh_backUp,id_vehiculo,anio_anterior,anio_nuevo,patente_anterior,patente_nuevo,id_marca_anterior,id_marca_nuevo,id_tipo_anterior,id_tipo_nuevo,id_modelo_anterior,id_modelo_nuevo,id_color_anterior,id_color_nuevo,id_usuario_anterior,id_usuario_nuevo,id_EstadoVehic_anterior,	id_EstadoVehic_nuevo,evento,fecha_y_hora)
VALUES
(null,NEW.id_vehiculo,0,NEW.anio,'',NEW.patente,0,NEW.id_marca,0,NEW.id_tipo,0,NEW.id_modelo,0,NEW.id_color,0,NEW.id_usuario,0,NEW.id_EstadoVehic,'Vehiculo Creado',NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `vehiculo_BefDel`;
DELIMITER $$
CREATE TRIGGER `vehiculo_BefDel` BEFORE DELETE ON `vehiculos` FOR EACH ROW INSERT INTO backup_vehiculo(id_vh_backUp,id_vehiculo,anio_anterior,anio_nuevo,patente_anterior,patente_nuevo,id_marca_anterior,id_marca_nuevo,id_tipo_anterior,id_tipo_nuevo,id_modelo_anterior,id_modelo_nuevo,id_color_anterior,id_color_nuevo,id_usuario_anterior,id_usuario_nuevo,id_EstadoVehic_anterior,	id_EstadoVehic_nuevo,evento,fecha_y_hora)
VALUES
(null,OLD.id_vehiculo,OLD.anio,0,OLD.patente,'',OLD.id_marca,0,OLD.id_tipo,0,OLD.id_modelo,0,OLD.id_color,0,OLD.id_usuario,0,OLD.id_EstadoVehic,0,'Vehiculo Borrado',NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `vehiculo_BefUpd`;
DELIMITER $$
CREATE TRIGGER `vehiculo_BefUpd` BEFORE UPDATE ON `vehiculos` FOR EACH ROW INSERT INTO backup_vehiculo(id_vh_backUp,id_vehiculo,anio_anterior,anio_nuevo,patente_anterior,patente_nuevo,id_marca_anterior,id_marca_nuevo,id_tipo_anterior,id_tipo_nuevo,id_modelo_anterior,id_modelo_nuevo,id_color_anterior,id_color_nuevo,id_usuario_anterior,id_usuario_nuevo,id_EstadoVehic_anterior,	id_EstadoVehic_nuevo,evento,fecha_y_hora)
VALUES
(null,NEW.id_vehiculo,OLD.anio,NEW.anio,OLD.patente,NEW.patente,OLD.id_marca,NEW.id_marca,OLD.id_tipo,NEW.id_tipo,OLD.id_modelo,NEW.id_modelo,OLD.id_color,NEW.id_color,OLD.id_usuario,NEW.id_usuario,OLD.id_EstadoVehic,NEW.id_EstadoVehic,'Vehiculo Editado',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehic_estado`
--

DROP TABLE IF EXISTS `vehic_estado`;
CREATE TABLE IF NOT EXISTS `vehic_estado` (
  `id_EstadoVehic` smallint(5) NOT NULL AUTO_INCREMENT,
  `EstadoVehic` varchar(30) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id_EstadoVehic`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `vehic_estado`
--

INSERT INTO `vehic_estado` (`id_EstadoVehic`, `EstadoVehic`) VALUES
(1, 'Habilitado'),
(2, 'No habilitado');

--
-- Disparadores `vehic_estado`
--
DROP TRIGGER IF EXISTS `vehiculo_estado_AftIns`;
DELIMITER $$
CREATE TRIGGER `vehiculo_estado_AftIns` AFTER INSERT ON `vehic_estado` FOR EACH ROW INSERT INTO aud_vehiculos_estado(id_aud_vehiculoEstado,id_EstadoVehic,EstadoVehic_anterior,EstadoVehic_nuevo,evento,fecha_y_hora)
VALUES
(null,NEW.id_EstadoVehic,'',NEW.EstadoVehic,'Estado Vehhiculo Creado',NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `vehiculo_estado_BefDel`;
DELIMITER $$
CREATE TRIGGER `vehiculo_estado_BefDel` BEFORE DELETE ON `vehic_estado` FOR EACH ROW INSERT INTO aud_vehiculos_estado(id_aud_vehiculoEstado,id_EstadoVehic,EstadoVehic_anterior,EstadoVehic_nuevo,evento,fecha_y_hora)
VALUES
(null,OLD.id_EstadoVehic,OLD.EstadoVehic,'','Estado Vehhiculo Borrado',NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `vehiculo_estado_BefUpd`;
DELIMITER $$
CREATE TRIGGER `vehiculo_estado_BefUpd` BEFORE UPDATE ON `vehic_estado` FOR EACH ROW INSERT INTO aud_vehiculos_estado(id_aud_vehiculoEstado,id_EstadoVehic,EstadoVehic_anterior,EstadoVehic_nuevo,evento,fecha_y_hora)
VALUES
(null,NEW.id_EstadoVehic,OLD.EstadoVehic,NEW.EstadoVehic,'Estado Vehhiculo Editado',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zona`
--

DROP TABLE IF EXISTS `zona`;
CREATE TABLE IF NOT EXISTS `zona` (
  `id_zona` smallint(5) NOT NULL AUTO_INCREMENT,
  `calle` varchar(80) CHARACTER SET utf8 NOT NULL,
  `AlturaDesde` int(5) NOT NULL,
  `AlturaHasta` int(5) NOT NULL,
  `id_precio` smallint(5) NOT NULL,
  `EspaciosDisponibles` smallint(5) NOT NULL,
  `Fecha` datetime NOT NULL,
  PRIMARY KEY (`id_zona`),
  KEY `fk_precio_zona` (`id_precio`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `zona`
--

INSERT INTO `zona` (`id_zona`, `calle`, `AlturaDesde`, `AlturaHasta`, `id_precio`, `EspaciosDisponibles`, `Fecha`) VALUES
(1, 'Libertador', 300, 400, 1, 12, '2019-11-30 00:00:00'),
(2, 'Libertador', 400, 500, 1, 12, '2019-11-30 00:00:00'),
(3, 'Libertador', 500, 600, 1, 12, '2019-11-30 00:00:00');

--
-- Disparadores `zona`
--
DROP TRIGGER IF EXISTS `zona_AftIns`;
DELIMITER $$
CREATE TRIGGER `zona_AftIns` AFTER INSERT ON `zona` FOR EACH ROW INSERT INTO aud_zona(id_aud_zona,id_zona,calle_anterior,calle_nuevo,AlturaDesde_anterior,AlturaDesde_nuevo,AlturaHasta_anterior,AlturaHasta_nuevo,id_precio_anterior,id_precio_nuevo,fecha_anterior,fecha_nuevo,EspaciosDisponibles_Anterior,EspaciosDisponibles_Nuevo,evento,fecha_y_hora)
VALUES
(null,NEW.id_zona,'',NEW.calle,0,NEW.AlturaDesde,0,NEW.AlturaHasta,0,NEW.id_precio,'',NEW.Fecha,0,NEW.EspaciosDisponibles,'Zona creada',NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `zona_BefDel`;
DELIMITER $$
CREATE TRIGGER `zona_BefDel` BEFORE DELETE ON `zona` FOR EACH ROW INSERT INTO aud_zona(id_aud_zona,id_zona,calle_anterior,calle_nuevo,AlturaDesde_anterior,AlturaDesde_nuevo,AlturaHasta_anterior,AlturaHasta_nuevo,id_precio_anterior,id_precio_nuevo,fecha_anterior,fecha_nuevo,EspaciosDisponibles_Anterior,EspaciosDisponibles_Nuevo,evento,fecha_y_hora)
VALUES
(null,OLD.id_zona,OLD.calle,'',OLD.AlturaDesde,0,OLD.AlturaHasta,0,OLD.id_precio,0,OLD.Fecha,'',OLD.EspaciosDisponibles,0,'Zona Borrada',NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `zona_BefUpd`;
DELIMITER $$
CREATE TRIGGER `zona_BefUpd` BEFORE UPDATE ON `zona` FOR EACH ROW INSERT INTO aud_zona(id_aud_zona,id_zona,calle_anterior,calle_nuevo,AlturaDesde_anterior,AlturaDesde_nuevo,AlturaHasta_anterior,AlturaHasta_nuevo,id_precio_anterior,id_precio_nuevo,fecha_anterior,fecha_nuevo,EspaciosDisponibles_Anterior,EspaciosDisponibles_Nuevo,evento,fecha_y_hora)
VALUES
(null,NEW.id_zona,OLD.calle,NEW.calle,OLD.AlturaDesde,NEW.AlturaDesde,OLD.AlturaHasta,NEW.AlturaHasta,OLD.id_precio,NEW.id_precio,OLD.Fecha,NEW.Fecha,OLD.EspaciosDisponibles,NEW.EspaciosDisponibles,'Zona editada',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura para la vista `estacezonaprec`
--
DROP TABLE IF EXISTS `estacezonaprec`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `estacezonaprec`  AS  select `e`.`id_estacionamiento` AS `id_estacionamiento`,`e`.`FechaHoraInicio` AS `FechaHoraInicio`,`e`.`latitud` AS `latitud`,`e`.`longitud` AS `longitud`,`e`.`id_EstadoEstac` AS `id_EstadoEstac`,`es`.`EstadoEstac` AS `EstadoEstac`,`e`.`id_usuario` AS `id_usuario`,`e`.`id_vehiculo` AS `id_vehiculo`,`e`.`id_zona` AS `id_zona`,`z`.`calle` AS `calle`,`z`.`AlturaDesde` AS `AlturaDesde`,`z`.`AlturaHasta` AS `AlturaHasta`,`z`.`id_precio` AS `id_precio`,`pr`.`PrecioFijo` AS `PrecioFijo`,`pr`.`PrecioPorHora` AS `PrecioPorHora`,`pr`.`PrecioExcedido` AS `PrecioExcedido`,`z`.`Fecha` AS `Fecha`,`e`.`FechaHoraFin` AS `FechaHoraFin` from (((`estacionamiento` `e` join `estac_estado` `es` on((`e`.`id_EstadoEstac` = `es`.`id_EstadoEstac`))) join `zona` `z` on((`e`.`id_zona` = `z`.`id_zona`))) join `precio` `pr` on((`z`.`id_precio` = `pr`.`id_precio`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `tarjetaview`
--
DROP TABLE IF EXISTS `tarjetaview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tarjetaview`  AS  select `t`.`id_TarjetaDeCredito` AS `id_TarjetaDeCredito`,`t`.`Num_Tarjeta` AS `Num_Tarjeta`,`t`.`FechaDeExpiracion` AS `FechaDeExpiracion`,`t`.`id_banco` AS `id_banco`,`ba`.`NombreDeBanco` AS `NombreDeBanco`,`t`.`NroConfirm` AS `NroConfirm`,`t`.`id_NombreDeTarjeta` AS `id_NombreDeTarjeta`,`tn`.`NombreDeTarjeta` AS `NombreDeTarjeta`,`t`.`id_usuario` AS `id_usuario` from ((`tarjetas` `t` join `tarjetas_nombres` `tn` on((`t`.`id_NombreDeTarjeta` = `tn`.`id_NombreDeTarjeta`))) join `banco` `ba` on((`t`.`id_banco` = `ba`.`id_banco`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `ussxubcestrol`
--
DROP TABLE IF EXISTS `ussxubcestrol`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ussxubcestrol`  AS  select `us`.`id_usuario` AS `id_usuario`,`us`.`CUIT` AS `CUIT`,`us`.`nombres` AS `nombres`,`us`.`apellido` AS `apellido`,`us`.`FechaDeNacimiento` AS `FechaDeNacimiento`,`us`.`correo` AS `correo`,`us`.`id_sexo` AS `id_sexo`,`sx`.`Sexo` AS `Sexo`,`us`.`id_UbiUsu` AS `id_UbiUsu`,`ub`.`CodigoPostal` AS `CodigoPostal`,`ub`.`Localidad` AS `Localidad`,`us`.`id_calle` AS `id_calle`,`ca`.`Calle` AS `Calle`,`us`.`altura` AS `altura`,`us`.`SaldoEnCuenta` AS `SaldoEnCuenta`,`us`.`id_EstadoDeLaCuenta` AS `id_EstadoDeLaCuenta`,`es`.`EstadoDeLaCuenta` AS `EstadoDeLaCuenta`,`us`.`id_rol` AS `id_rol`,`ro`.`rol` AS `rol` from (((((`usuarios` `us` join `sexo` `sx` on((`us`.`id_sexo` = `sx`.`id_Sexo`))) join `usuarios_ubicacion` `ub` on((`us`.`id_UbiUsu` = `ub`.`id_UbiUsu`))) join `calle` `ca` on((`us`.`id_calle` = `ca`.`id_calle`))) join `usuarios_estado` `es` on((`us`.`id_EstadoDeLaCuenta` = `es`.`id_EstadoDeLaCuenta`))) join `rol` `ro` on((`us`.`id_rol` = `ro`.`id_rol`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vehiculomtmce`
--
DROP TABLE IF EXISTS `vehiculomtmce`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vehiculomtmce`  AS  select `vh`.`id_vehiculo` AS `id_vehiculo`,`vh`.`anio` AS `anio`,`vh`.`patente` AS `patente`,`vh`.`id_marca` AS `id_marca`,`ma`.`Marca` AS `Marca`,`vh`.`id_tipo` AS `id_tipo`,`ti`.`Tipo` AS `Tipo`,`vh`.`id_modelo` AS `id_modelo`,`mo`.`Modelo` AS `Modelo`,`vh`.`id_color` AS `id_color`,`co`.`Color` AS `Color`,`vh`.`id_usuario` AS `id_usuario`,`vh`.`id_EstadoVehic` AS `id_EstadoVehic`,`es`.`EstadoVehic` AS `EstadoVehic` from (((((`vehiculos` `vh` join `marca` `ma` on((`vh`.`id_marca` = `ma`.`id_marca`))) join `tipo` `ti` on((`vh`.`id_tipo` = `ti`.`id_tipo`))) join `modelo` `mo` on((`vh`.`id_modelo` = `mo`.`id_modelo`))) join `color` `co` on((`vh`.`id_color` = `co`.`id_color`))) join `vehic_estado` `es` on((`vh`.`id_EstadoVehic` = `es`.`id_EstadoVehic`))) ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estacionamiento`
--
ALTER TABLE `estacionamiento`
  ADD CONSTRAINT `fk_estado_estacionamiento` FOREIGN KEY (`id_EstadoEstac`) REFERENCES `estac_estado` (`id_EstadoEstac`),
  ADD CONSTRAINT `fk_usuario_estacionamiento` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `fk_vehiculo_estacionamiento` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculos` (`id_vehiculo`),
  ADD CONSTRAINT `fk_zona_estacionamiento` FOREIGN KEY (`id_zona`) REFERENCES `zona` (`id_zona`);

--
-- Filtros para la tabla `tarjetas`
--
ALTER TABLE `tarjetas`
  ADD CONSTRAINT `fk_banco_tarjetas` FOREIGN KEY (`id_banco`) REFERENCES `banco` (`id_banco`),
  ADD CONSTRAINT `fk_nombre_tarjetas` FOREIGN KEY (`id_NombreDeTarjeta`) REFERENCES `tarjetas_nombres` (`id_NombreDeTarjeta`),
  ADD CONSTRAINT `fk_usuarios_tarjetas` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD CONSTRAINT `fk_usuarios_telefono` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_calle_usuarios` FOREIGN KEY (`id_calle`) REFERENCES `calle` (`id_calle`),
  ADD CONSTRAINT `fk_estado_usuarios` FOREIGN KEY (`id_EstadoDeLaCuenta`) REFERENCES `usuarios_estado` (`id_EstadoDeLaCuenta`),
  ADD CONSTRAINT `fk_rol_usuarios` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`),
  ADD CONSTRAINT `fk_sexo_usuarios` FOREIGN KEY (`id_sexo`) REFERENCES `sexo` (`id_Sexo`),
  ADD CONSTRAINT `fk_ubicacion_usuarios` FOREIGN KEY (`id_UbiUsu`) REFERENCES `usuarios_ubicacion` (`id_UbiUsu`);

--
-- Filtros para la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD CONSTRAINT `fk_color_vehiculos` FOREIGN KEY (`id_color`) REFERENCES `color` (`id_color`),
  ADD CONSTRAINT `fk_estado_vehiculos` FOREIGN KEY (`id_EstadoVehic`) REFERENCES `vehic_estado` (`id_EstadoVehic`),
  ADD CONSTRAINT `fk_marca_vehiculos` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id_marca`),
  ADD CONSTRAINT `fk_modelo_vehiculos` FOREIGN KEY (`id_modelo`) REFERENCES `modelo` (`id_modelo`),
  ADD CONSTRAINT `fk_tipo_vehiculos` FOREIGN KEY (`id_tipo`) REFERENCES `tipo` (`id_tipo`),
  ADD CONSTRAINT `fk_usuarios_vehiculos` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `zona`
--
ALTER TABLE `zona`
  ADD CONSTRAINT `fk_precio_zona` FOREIGN KEY (`id_precio`) REFERENCES `precio` (`id_precio`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
