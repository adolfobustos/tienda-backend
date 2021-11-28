-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-11-2021 a las 00:07:35
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

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
