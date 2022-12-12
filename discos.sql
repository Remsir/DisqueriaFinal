-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-11-2022 a las 14:45:54
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `api_disco`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `discos`
--

CREATE TABLE `discos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `autos` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `genero` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `discos`
--

INSERT INTO `discos` (`id`, `nombre`, `autos`, `genero`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'The Sick, The Dying... And The Dead!', 'Megadeth', 'Heavy Metal', NULL, NULL, NULL),
(2, 'V', 'Havok', 'Thrash', '2022-11-13 16:47:53', '2022-11-14 21:25:28', '2022-11-14 21:25:28'),
(3, 'V', 'Havok', 'Thrash', '2022-11-13 17:17:30', '2022-11-13 17:30:59', '2022-11-13 17:30:59'),
(4, 'V', 'Havok', 'Thrash', '2022-11-13 17:19:39', '2022-11-13 17:19:39', NULL),
(5, 'So far So Good ...So What', 'Megadeth', 'Speed Metal', '2022-11-14 03:01:28', '2022-11-14 03:01:28', NULL),
(6, 'The Scythe', 'Elvenking', 'Folk Metal', '2022-11-14 20:57:10', '2022-11-14 20:57:10', NULL),
(7, 'a', 'a', 'a', '2022-11-14 21:26:04', '2022-11-14 21:26:07', '2022-11-14 21:26:07'),
(8, 'Cruces', 'BBS Paranoicos', 'Punk Rock', '2022-11-14 21:46:24', '2022-11-14 21:51:15', NULL),
(9, 'Get A Grip', 'AeroSmith', 'Rock', '2022-11-14 22:00:19', '2022-11-14 22:01:45', '2022-11-14 22:01:45'),
(10, 'a', 'a', 'a', '2022-11-14 22:03:23', '2022-11-14 22:05:14', '2022-11-14 22:05:14'),
(11, 'a', 'a', 'a', '2022-11-14 22:05:19', '2022-11-14 22:05:23', '2022-11-14 22:05:23'),
(12, 'Get A Grip', 'Aerosmith', 'Rock', '2022-11-14 22:06:36', '2022-11-14 22:06:51', NULL),
(13, 'La posada de los muertos', 'Mago de Oz', 'Folk Metal', '2022-11-15 12:47:43', '2022-11-15 13:33:49', NULL),
(14, 'b', 'b', 'b', '2022-11-15 12:47:50', '2022-11-15 13:43:58', '2022-11-15 13:43:58');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `discos`
--
ALTER TABLE `discos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `discos`
--
ALTER TABLE `discos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
