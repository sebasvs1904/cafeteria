-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-12-2020 a las 00:54:43
-- Versión del servidor: 10.4.16-MariaDB
-- Versión de PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cafeteria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actualiza`
--

CREATE TABLE `actualiza` (
  `administradoridadmin` int(10) NOT NULL,
  `inventarioidproductos` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `idadmin` int(10) NOT NULL,
  `email` varchar(25) NOT NULL,
  `password1` varchar(200) NOT NULL,
  `nombrea` varchar(25) NOT NULL,
  `apelliidoP` varchar(25) NOT NULL,
  `apellidoM` varchar(25) NOT NULL,
  `rfc` varchar(13) NOT NULL,
  `tarjeta` varchar(18) NOT NULL,
  `turno` varchar(1) DEFAULT NULL,
  `ntelefono` varchar(10) NOT NULL,
  `salario` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idcliente` int(10) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellidoP` varchar(25) NOT NULL,
  `apellidoM` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `firmaelectronica` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `iddireccion` int(10) NOT NULL,
  `cp` varchar(5) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `colonia` int(10) NOT NULL,
  `calle` varchar(50) NOT NULL,
  `numcasa` varchar(5) DEFAULT NULL,
  `idcliente` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ofertas`
--

CREATE TABLE `ofertas` (
  `idoferta` int(10) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `Precio` double NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `idproductos` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `fecha` date NOT NULL,
  `Folio` varchar(7) NOT NULL,
  `canexistencia` varchar(1) NOT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `inventarioidproductos` int(10) NOT NULL,
  `clienteidcliente` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idproductos` int(10) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `cantidad` int(10) NOT NULL,
  `precio` int(10) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `ingredientes` varchar(255) NOT NULL,
  `imagen` longblob NOT NULL,
  `fechaatualizacion` date NOT NULL,
  `fechacaducacion` int(10) NOT NULL,
  `idproveedor` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `idproveedor` int(10) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellidoP` varchar(25) NOT NULL,
  `apellidoM` varchar(25) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `email` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjeta`
--

CREATE TABLE `tarjeta` (
  `idtarjeta` int(10) NOT NULL,
  `numtarjeta` int(10) NOT NULL,
  `CVV` int(10) NOT NULL,
  `idcliente` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actualiza`
--
ALTER TABLE `actualiza`
  ADD PRIMARY KEY (`administradoridadmin`,`inventarioidproductos`),
  ADD KEY `FKactualiza232366` (`inventarioidproductos`);

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`idadmin`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idcliente`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`iddireccion`),
  ADD KEY `FKdireccion66768` (`idcliente`);

--
-- Indices de la tabla `ofertas`
--
ALTER TABLE `ofertas`
  ADD PRIMARY KEY (`idoferta`),
  ADD KEY `FKofertas527015` (`idproductos`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`inventarioidproductos`,`clienteidcliente`),
  ADD KEY `FKpedidos309395` (`clienteidcliente`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idproductos`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`idproveedor`);

--
-- Indices de la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD PRIMARY KEY (`idtarjeta`),
  ADD KEY `FKtarjeta975725` (`idcliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `idadmin` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idcliente` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `iddireccion` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ofertas`
--
ALTER TABLE `ofertas`
  MODIFY `idoferta` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `idproveedor` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  MODIFY `idtarjeta` int(10) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actualiza`
--
ALTER TABLE `actualiza`
  ADD CONSTRAINT `FKactualiza232366` FOREIGN KEY (`inventarioidproductos`) REFERENCES `productos` (`idproductos`),
  ADD CONSTRAINT `FKactualiza547324` FOREIGN KEY (`administradoridadmin`) REFERENCES `administrador` (`idadmin`);

--
-- Filtros para la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD CONSTRAINT `FKdireccion66768` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`);

--
-- Filtros para la tabla `ofertas`
--
ALTER TABLE `ofertas`
  ADD CONSTRAINT `FKofertas527015` FOREIGN KEY (`idproductos`) REFERENCES `productos` (`idproductos`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `FKpedidos309395` FOREIGN KEY (`clienteidcliente`) REFERENCES `cliente` (`idcliente`),
  ADD CONSTRAINT `FKpedidos314186` FOREIGN KEY (`inventarioidproductos`) REFERENCES `productos` (`idproductos`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `FKproductos824728` FOREIGN KEY (`idproductos`) REFERENCES `proveedor` (`idproveedor`);

--
-- Filtros para la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD CONSTRAINT `FKtarjeta975725` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
