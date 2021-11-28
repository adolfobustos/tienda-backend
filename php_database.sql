-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-11-2021 a las 00:07:23
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
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre`, `descripcion`) VALUES
(1, 'Jugos Listos', 'Con jugos ricos en vitaminas y minerales podrás empezar el día de una manera nutritiva y deliciosa.'),
(2, 'Cereales', 'Nos aportan principalmente energía por su aporte de hidratos de carbono.'),
(3, 'Mermeladas', 'Es importante que se la proporcionemos con un desayuno equilibrado e ideal.'),
(4, 'Gelatinas', 'Ideal para hidratarnos y activar el metabolismo, evitando que lleguemos a la comida con demasiado apetito.'),
(5, 'Azúcar', 'Con un consumo consciente de lo que comes, no solo cuidas tu salud, sino la de tu familia.'),
(6, 'Alfajores', 'Un permitido que te llenará de energía para realizar toda tu jornada.'),
(7, 'Bombones', 'En pequeñas cantidades, el chocolate puede ser tu aliado a la hora de obtener esa energía extra que necesitas en tus días más ocupados.'),
(8, 'Galletitas Dulces', 'Una persona que necesita 1800 kcal/día debería ingerir por la mañana alimentos que le aporten en total unas 400 kcal.'),
(9, 'Snacks', 'La energía de nuestro cuerpo funciona gracias a la glucosa, pero el organismo no tiene la capacidad de almacenarla.'),
(10, 'Tostadas', 'Un buen desayuno debería cubrir el 20-25% de las necesidades energéticas diarias.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

CREATE TABLE `comentario` (
  `id_comentario` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `descripcion` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `valoracion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `comentario`
--

INSERT INTO `comentario` (`id_comentario`, `id_user`, `id_producto`, `descripcion`, `fecha`, `valoracion`) VALUES
(2, 10, 5, 'me gusto', '2021-11-19 23:24:05', 0),
(3, 8, 5, 'jajajajajja', '2021-11-19 23:24:33', 0),
(4, 10, 3, 'Me encanto mucho 2', '2021-01-30 17:50:01', 0),
(5, 10, 3, 'Me encanto mucho 2', '2021-01-30 17:50:01', 0),
(6, 10, 3, 'Me encanto mucho 2', '2021-01-30 17:50:01', 0),
(7, 10, 3, 'Me encanto mucho 2', '2021-01-30 17:50:01', 0),
(8, 10, 3, 'Me encanto mucho 2', '2021-01-30 17:50:01', 0),
(9, 10, 3, 'Me encanto mucho 2', '2021-01-30 17:50:01', 0),
(10, 10, 3, 'Me encanto mucho 2', '2021-01-30 17:50:01', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `nombre` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `id_categoria` int(25) NOT NULL,
  `precio` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `nombre`, `id_categoria`, `precio`, `img`) VALUES
(1, 'Jugo Arcor Naranja x 200ml', 1, '$39', 'images/products/Jugo Arcor Naranja.png'),
(2, 'Estrellas Frutales x 150gr', 2, '$139', 'images/products/Estrellas Frutales x 150gr.png'),
(3, 'Mermelada Arcor Light Durazno x 390gr', 3, '$180', 'images/products/Mermelada Arcor Light Durazno x 390gr.png'),
(4, 'Gelatina Godet Frutilla x 30gr', 4, '$240', 'images/products/Gelatina Godet Frutilla x 30gr.png'),
(5, 'Azúcar Mascabo Arcor x 500gr', 5, '$771', 'images/products/Azúcar Mascabo Arcor x 500gr.png'),
(6, 'Alfajor Bon o Bon x 40gr', 6, '$162', 'images/products/Alfajor Bon o Bon x 40gr.png'),
(7, 'Alfajor Aguila Minitorta Coco x 73 gr', 6, '$246', 'images/products/Alfajor Aguila Minitorta Coco x 73 gr.png'),
(8, 'Caja Bon o Bon Leche x 15gr 18 un', 7, '$452', 'images/products/Caja Bon o Bon Leche x 15gr 18 un.png'),
(9, 'Arcor Surtido Chocolates Kiosco en Casa x 246gr 1 Caja', 7, '$551', 'images/products/Arcor Surtido Chocolates Kiosco en Casa x 246gr 1 Caja.png'),
(10, 'Alfajor Bon o Bon x 40gr', 6, '$162', 'images/products/Alfajor Bon o Bon x 40gr.png'),
(11, 'Porteñitas x 139gr', 8, '$83', 'images/products/Porteñitas x 139gr.png'),
(12, 'Chocolinas x 170gr', 8, '$99', 'images/products/Chocolinas x 170gr.png'),
(14, 'Saladix Papas sabor Barbacoa x 18 gr', 9, '$55', 'images/products/Papas Fritas Saladix x 18gr.png'),
(15, 'Ser crema y cebolla 40gr', 9, '$97', 'images/products/Snack Ser Crema y Cebolla 40Gr.png'),
(16, 'Rex horneados bolsa x 75gr', 9, '$75', 'images/products/Snacks horneados Rex Bolsa 75gr.png'),
(17, 'Criollitas clásicas x 195 gr', 10, '$121', 'images/products/Tostadas Clásica Criollitas 195gr.png'),
(18, 'Criollitas dulces x 195 gr', 10, '$125', 'images/products/Tostadas Dulce Criollitas 195gr.png');

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
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`id_comentario`),
  ADD KEY `FK_id_producto` (`id_producto`),
  ADD KEY `FK_id_user` (`id_user`) USING BTREE;

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `comentario`
--
ALTER TABLE `comentario`
  MODIFY `id_comentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `comentario_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comentario_ibfk_3` FOREIGN KEY (`id_producto`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
