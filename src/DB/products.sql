-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-11-2021 a las 00:07:54
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

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
