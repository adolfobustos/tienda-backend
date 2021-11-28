-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-11-2021 a las 00:08:04
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `php_database`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `user`, `password`, `rol`) VALUES
(1, 'usuario111', '$2y$10$pHyo3vzRgnS7szwpthNspOjq0t2fP5UvVSjBo6TXLrF95u4zKnIXG', 1),
(2, 'usuario222', '$2y$10$tJlTlchuhy54zgFqE1o.veEn0wFKu5hse4IBLmq0x7PoeVX2xK.ZO', 1),
(3, 'usuario333', '$2y$10$3xumTPMbMOb1BoskuTV7o.qHXZCxPVTAbYxoJdQmOigL7DRy1Lluq', 1),
(4, 'agustin', '$2y$10$HU3QXpqYv/zlVytoA.orF.lr3ufr768HVUmAlX3Y1UeeksQmL2iuG', 1),
(5, 'manuel', '$2y$10$aGAOTId4F1ccke8eT8D6Fu8JvkmV0iTmzUSxHDKWxGIE.BXB6eHEa', 1),
(6, 'catalina', '$2y$10$uhgXl/u565hOfudMeBrPUu0K8mUBGbMdDS8EuNpVllBJY4xD6V2IW', 1),
(7, 'sofia', '$2y$10$KvEw/mygwChKYpf5k.9mdOHQj10FY3WtV7j4.EpAt8YRu5939IKsG', 1),
(8, 'adolfo', '$2y$10$j70Tk0RZ.QsgefV3FRBRnOCRe9D2ssoVgMchOBz0theO6vUFQsxpa', 1),
(9, 'fernando', '$2y$10$7B40Z5i5Q9f9vr807eBKoe3Ps6miKD8x61hbA3HCsSKdI689gwkI.', 1),
(10, 'rocio', '$2y$10$4Hmsy4dADhf65sOwKi5EzOaFV6ul9HXOF9WBCvMWLD/t6abyPWAuG', 1),
(13, 'rene', '$2y$10$CqdSdbaxUqcqGPWBwPpWF.8ctSiaBSZSMQWgbQJ6eQ3rMrnjMnJVm', 0),
(15, 'adolfo20', '$2y$10$nVw.kdvoXnR9QN2bZ9oRiepeasrA52je6AB5KkXIqWt9V5pLrGcMq', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
