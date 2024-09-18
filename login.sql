-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-09-2024 a las 00:49:14
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `login`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

CREATE TABLE `registro` (
  `usuario` int(11) NOT NULL,
  `gmail` varchar(250) NOT NULL,
  `contraseña` varchar(250) NOT NULL,
  `edad` tinyint(2) NOT NULL,
  `telefono` decimal(20,0) NOT NULL,
  `fnacimiento` date NOT NULL,
  `genero` varchar(250) NOT NULL,
  `direccion` varchar(250) NOT NULL,
  `pais` varchar(250) NOT NULL,
  `cuidad` varchar(250) NOT NULL,
  `region` varchar(250) NOT NULL,
  `cdpostal` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `registro`
--

INSERT INTO `registro` (`usuario`, `gmail`, `contraseña`, `edad`, `telefono`, `fnacimiento`, `genero`, `direccion`, `pais`, `cuidad`, `region`, `cdpostal`) VALUES
(1, 'luizmartinez@gmail.com', '$2y$10$EmVMFa4Q/c1irqYiN7wIZ.Vzk9GlICf7Y9BkCFQox7ZTaz/b5Btmm', 28, 1155552222, '1999-08-18', 'on', 'directorio', 'Estados Unidos', 'luizana', 'dela', '2222'),
(2, 'roit@gmail.com', '$2y$10$zIroARgFghA0zUc/soO0VeDvKSvDnf9JY8hURhR6VERZLTblaNWfi', 28, 1155552222, '1999-08-18', 'on', 'directorio', 'Reino Unido', 'wuacanda', 'pari', '2255'),
(3, 'andes.00marta@gmail.com', '$2y$10$FxDXpzaZBdwKqtcBv2xZR.wgA2FiVDruoz2Ey6yJQYq6SutVZAw0O', 33, 1122998854, '2024-09-05', 'on', 'avenida inventada', 'Rusia', 'nuevo pariz', 'ander', '1234'),
(4, 'andes.00marta@gmail.com', '$2y$10$L3ooUlL8dgYgFZX5ipmV9.b8k5IQOrMGEtPlvM8IjpQ.PbuAOlXkG', 33, 1122998854, '2024-09-05', 'on', 'avenida inventada', 'Rusia', 'nuevo pariz', 'ander', '1234'),
(5, 'domingo@gmail.com', '$2y$10$I0UicNPxWR0xeipbQpGyKejZzwELwIlVMlaUtQ5u5hlT3aj.1KZu6', 19, 1122778564, '2024-09-11', 'on', 'directorio', 'Uruguay', 'wuacanda', 'dela', '2547'),
(6, 'roit@gmail.com.ar', '$2y$10$aw1ti4/cNY4mF.EfltBPs.BWL7DutYsAjRfiBCnLHlVQ.DU8..OTG', 44, 11444545, '2024-10-12', 'on', 'avenida inventada', 'México', 'nuevo pariz', 'pari', '2012'),
(7, 'pez@gmail', '$2y$10$DZlRGOX9fU1xtG7ZeDvmGeoHaeAQVmYirjUnvqxXPpd/SU0vJt/.G', 45, 1133265498, '2024-09-01', 'on', 'kaut', 'Canadá', 'paracter', 'reuniom', '2356'),
(8, 'roit@gmail.com', '$2y$10$u16za2lrpKVg6WNphdOkNOPazzPgcL8eUWZLBubkwmkLxbQE7apwa', 32, 1111111111, '2024-09-14', 'on', 'kaut', 'Japón', 'luizana', 'ander', '4545');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesion`
--

CREATE TABLE `sesion` (
  `gmail` int(11) NOT NULL,
  `contraseña` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `registro`
--
ALTER TABLE `registro`
  ADD PRIMARY KEY (`usuario`),
  ADD KEY `gmail` (`gmail`);

--
-- Indices de la tabla `sesion`
--
ALTER TABLE `sesion`
  ADD PRIMARY KEY (`gmail`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `registro`
--
ALTER TABLE `registro`
  MODIFY `usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `sesion`
--
ALTER TABLE `sesion`
  MODIFY `gmail` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `sesion`
--
ALTER TABLE `sesion`
  ADD CONSTRAINT `sesion_ibfk_1` FOREIGN KEY (`gmail`) REFERENCES `registro` (`usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
