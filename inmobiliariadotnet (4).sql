-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-06-2024 a las 00:55:37
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inmobiliariadotnet`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoriacontrato`
--

CREATE TABLE `auditoriacontrato` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_contrato` int(11) NOT NULL,
  `fechaInicio` datetime DEFAULT NULL,
  `fechacancelacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auditoriacontrato`
--

INSERT INTO `auditoriacontrato` (`id`, `id_usuario`, `id_contrato`, `fechaInicio`, `fechacancelacion`) VALUES
(7, 5, 23, '2024-04-25 14:42:25', NULL),
(8, 9, 24, '2024-04-25 17:57:12', NULL),
(9, 9, 25, '2024-04-25 18:00:17', NULL),
(10, 5, 24, NULL, '2024-04-25 18:09:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoriapagos`
--

CREATE TABLE `auditoriapagos` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_contrato` int(11) NOT NULL,
  `numero_pago` int(11) NOT NULL,
  `fechaPago` datetime DEFAULT NULL,
  `fechaCancelacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auditoriapagos`
--

INSERT INTO `auditoriapagos` (`id`, `id_usuario`, `id_contrato`, `numero_pago`, `fechaPago`, `fechaCancelacion`) VALUES
(12, 5, 23, 1, '2024-04-25 14:42:29', NULL),
(13, 5, 23, 2, '2024-04-25 16:05:44', NULL),
(14, 5, 23, 3, '2024-04-25 16:05:50', NULL),
(15, 5, 23, 2, NULL, '2024-04-25 16:06:02'),
(16, 5, 23, 2, '2024-04-25 16:06:06', NULL),
(17, 5, 23, 2, NULL, '2024-04-25 16:06:12'),
(18, 9, 24, 1, '2024-04-25 17:57:49', NULL),
(19, 9, 25, 1, '2024-04-25 18:00:35', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contratos`
--

CREATE TABLE `contratos` (
  `id` int(11) NOT NULL,
  `inquilinoId` int(11) DEFAULT NULL,
  `inmuebleId` int(11) DEFAULT NULL,
  `fechaInicio` datetime DEFAULT NULL,
  `fechaFin` datetime DEFAULT NULL,
  `fechaFinAnticipada` datetime DEFAULT NULL,
  `precioXmes` decimal(10,0) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `contratos`
--

INSERT INTO `contratos` (`id`, `inquilinoId`, `inmuebleId`, `fechaInicio`, `fechaFin`, `fechaFinAnticipada`, `precioXmes`, `estado`) VALUES
(23, 32, 1, '2024-04-25 00:00:00', '2024-12-25 00:00:00', '0001-01-01 00:00:00', 1, 1),
(24, 32, 3, '2024-04-25 00:00:00', '2024-10-25 00:00:00', '2024-04-25 18:09:10', 2, 0),
(25, 32, 3, '2024-11-25 00:00:00', '2025-02-25 00:00:00', '0001-01-01 00:00:00', 5, 1),
(26, 32, 10, '2024-05-13 11:08:18', '2025-02-17 11:08:18', '0001-01-01 00:00:00', 25000, 1),
(27, 11, 41, '2024-05-20 13:20:48', '2024-12-24 13:20:48', '2024-05-16 13:22:06', 55000, 1),
(28, 11, 12, '2024-05-20 16:29:02', '2024-05-20 16:29:02', '2024-05-20 16:29:02', 25000, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inmuebles`
--

CREATE TABLE `inmuebles` (
  `id` int(11) NOT NULL,
  `propietarioId` int(11) DEFAULT NULL,
  `inmuebleTipoId` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `cantidadAmbientes` int(11) DEFAULT NULL,
  `uso` varchar(255) DEFAULT NULL,
  `precioBase` decimal(10,0) DEFAULT NULL,
  `disponible` tinyint(1) DEFAULT 1,
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `inmuebles`
--

INSERT INTO `inmuebles` (`id`, `propietarioId`, `inmuebleTipoId`, `direccion`, `cantidadAmbientes`, `uso`, `precioBase`, `disponible`, `imagen`) VALUES
(1, 1, '4', 'direccion1', 1, 'Residencial', 200500, 1, NULL),
(2, 2, '2', 'direccionzzz2', 2, 'Residencial', 222222, 1, NULL),
(3, 3, '2', 'direccion3', 3, 'Comercial', 200500, 1, NULL),
(4, 4, '1', 'direccion4', 1, 'Comercial', 200500, 1, NULL),
(5, 5, '4', 'direccion1', 1, 'Residencial', 200500, 1, NULL),
(6, 6, '3', 'direccion2', 2, 'Residencial', 1, 0, NULL),
(7, 7, '2', 'direccion3', 3, 'Comercial', 200500, 1, NULL),
(8, 8, '1', 'direccion4', 1, 'Comercial', 200500, 1, NULL),
(9, 1, '2', 'juana', 1, 'Residencial', 10, 1, NULL),
(10, 50, 'Casa', 'casa bkanca', 2, 'Comercial', 5000, 1, 'uploads\\1dedbd08-9455-4868-8e48-89dc76253285.jpg'),
(12, 50, 'Departamento', 'Pucara', 10, 'Residencial', 70000, 0, '/Uploads\\42ee8341-85dc-4a58-85fa-287435d7ef7d.jpg'),
(15, 50, 'Departamento', 'Pucaraos', 10, 'Residencial', 80000, 1, 'uploads\\8f03e138-a41b-4e6d-9890-dc23168fff5c.jpg'),
(41, 50, 'Casa', 'direccion', 5, 'Residencial', 2, 1, 'uploads\\9dff3082-1d80-4339-949a-49ca65880546.jpg'),
(42, 50, 'Casa', 'cazorla', 6, 'Residencial', 50, 1, 'uploads\\42ee8341-85dc-4a58-85fa-287435d7ef7d.jpg'),
(43, 50, 'Casa', 'cristiab', 5, 'Residencial', 5000, 1, 'uploads\\d62b1615-0b04-45a8-ac8d-b39e9aa84e2d.jpg'),
(44, 50, 'Casa', 'avenida lafinur 360', 1, 'Residencial', 350000, 1, 'uploads\\1744b01d-6529-426c-b2b3-d9b3dcd95efa.jpg'),
(45, 50, 'Casa', 'santo ortiz 534', 5, 'Residencial', 450000, 1, 'uploads\\4d8feff7-03a5-475b-8bae-c12af6169d23.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inmuebletipos`
--

CREATE TABLE `inmuebletipos` (
  `id` int(11) NOT NULL,
  `tipo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `inmuebletipos`
--

INSERT INTO `inmuebletipos` (`id`, `tipo`) VALUES
(1, 'Local'),
(2, 'Depósito'),
(3, 'Casa'),
(4, 'Departamento');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inquilinos`
--

CREATE TABLE `inquilinos` (
  `id` int(11) NOT NULL,
  `dni` varchar(10) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(55) DEFAULT NULL,
  `telefono` varchar(12) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `domicilio` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `inquilinos`
--

INSERT INTO `inquilinos` (`id`, `dni`, `nombre`, `apellido`, `telefono`, `email`, `domicilio`) VALUES
(11, '21100', 'Ru', 'Villalobos', '02664', 'crinoo@hotmail.com', 'domicilio23@hotmail.com'),
(32, '3423249832', 'Juan Suarez', 'melenudoso', '099832324233', '34@hotmail.com', 'lñsadfñlaskdlasdsad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `numeroPago` int(11) NOT NULL,
  `contratoId` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `fechaPago` datetime DEFAULT NULL,
  `importe` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`numeroPago`, `contratoId`, `fecha`, `fechaPago`, `importe`) VALUES
(1, 23, '2024-04-25 00:00:00', '2024-04-25 18:00:35', 1),
(1, 24, '2024-04-25 00:00:00', '2024-04-25 18:00:35', 2),
(1, 25, '2024-11-25 00:00:00', '2024-04-25 18:00:35', 5),
(1, 28, '2024-05-20 19:49:02', '2024-05-29 19:49:02', 25000),
(2, 23, '2024-05-25 00:00:00', NULL, 1),
(2, 24, '2024-05-25 00:00:00', NULL, 2),
(2, 25, '2024-12-25 00:00:00', NULL, 5),
(2, 28, '2024-05-23 19:49:02', '2024-07-24 19:49:02', 25000),
(3, 23, '2024-06-25 00:00:00', '2024-04-25 16:05:50', 1),
(3, 24, '2024-10-25 00:00:00', '2024-04-25 18:09:10', 6),
(4, 23, '2024-07-25 00:00:00', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietarios`
--

CREATE TABLE `propietarios` (
  `id` int(11) NOT NULL,
  `dni` varchar(10) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(55) DEFAULT NULL,
  `telefono` varchar(12) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `domicilio` varchar(255) DEFAULT NULL,
  `Clave` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `propietarios`
--

INSERT INTO `propietarios` (`id`, `dni`, `nombre`, `apellido`, `telefono`, `email`, `domicilio`, `Clave`) VALUES
(1, 'dni1', 'nombre1', 'apellido1', 'telefono1', 'email@gmail.com1', 'domicilio1', 'B1i+YL7S7zFRLyoit6h7qDAkM+WItPrMjqkR+B5YXm4='),
(2, 'dni2', 'nombre2', 'apellido2', 'telefono2', 'email@gmail.com2', 'domicilio2', 'B1i+YL7S7zFRLyoit6h7qDAkM+WItPrMjqkR+B5YXm4='),
(3, 'dni3', 'nombre3', 'apellido3', 'telefono3', 'email@gmail.com3', 'domicilio3', 'B1i+YL7S7zFRLyoit6h7qDAkM+WItPrMjqkR+B5YXm4='),
(4, 'dni4', 'nombre4', 'apellido4', 'telefono4', 'email@gmail.com4', 'domicilio4', 'B1i+YL7S7zFRLyoit6h7qDAkM+WItPrMjqkR+B5YXm4='),
(5, 'dni5', 'nombre5', 'apellido5', 'telefono5', 'email@gmail.com5', 'domicilio5', 'B1i+YL7S7zFRLyoit6h7qDAkM+WItPrMjqkR+B5YXm4='),
(6, 'dni6', 'nombre6', 'apellido6', 'telefono6', 'email@gmail.com6', 'domicilio6', 'B1i+YL7S7zFRLyoit6h7qDAkM+WItPrMjqkR+B5YXm4='),
(7, 'dni7', 'nombre7', 'apellido7', 'telefono7', 'email@gmail.com7', 'domicilio7', 'B1i+YL7S7zFRLyoit6h7qDAkM+WItPrMjqkR+B5YXm4='),
(8, 'dni8', 'nombre8', 'apellido8', 'telefono8', 'email@gmail.com8', 'domicilio8', 'B1i+YL7S7zFRLyoit6h7qDAkM+WItPrMjqkR+B5YXm4='),
(9, 'dni9', 'nombre9', 'apellido9', 'telefono9', 'email@gmail.com9', 'domicilio9', 'B1i+YL7S7zFRLyoit6h7qDAkM+WItPrMjqkR+B5YXm4='),
(10, 'dni10', 'nombre10', 'apellido10', 'telefono10', 'email@gmail.com10', 'domicilio10', 'B1i+YL7S7zFRLyoit6h7qDAkM+WItPrMjqkR+B5YXm4='),
(19, '890234342', 'papelon', 'lcoo', '983243247823', 'kjaskdjasdasd@mil.com', 'lujan', 'B1i+YL7S7zFRLyoit6h7qDAkM+WItPrMjqkR+B5YXm4='),
(50, '34428733', 'Ruben Cristian', 'Carriel', '11111111111', 'rv98478@gmail.com', 'avenida del fundador 360', 'WEwi+c1mI2Yqghnf37WJ2sLy9k27lkF7Lcj9MxgVSok=');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id` int(11) NOT NULL,
  `rol` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `rol`) VALUES
(1, 'Propietario'),
(2, 'Inquilino'),
(3, 'Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(55) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `avatarFile` varchar(255) DEFAULT NULL,
  `rol` int(11) DEFAULT NULL,
  `domicilio` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `email`, `pass`, `avatar`, `avatarFile`, `rol`, `domicilio`) VALUES
(1, 'julia', 'gutierrez', 'mar9ina@gmail.com', 'KDa9xkd7uC5ppAF9LVVP4wOEmmDb96jKjB8L2mDPlgA=', '/Uploads\\avatar_1.jpg', NULL, 2, NULL),
(2, 'kk', 'kk', 'kk@gmail.com', 'KDa9xkd7uC5ppAF9LVVP4wOEmmDb96jKjB8L2mDPlgA=', '/Uploads\\avatar_2.jpg', NULL, 1, NULL),
(3, 'lautaro', 'ferr', 'lauti@gmail.com', 'KDa9xkd7uC5ppAF9LVVP4wOEmmDb96jKjB8L2mDPlgA=', '/Uploads\\avatar_3.jpg', NULL, 1, NULL),
(4, 'toreto', 'juju', 'tori@gmail.com', 'KDa9xkd7uC5ppAF9LVVP4wOEmmDb96jKjB8L2mDPlgA=', '/Uploads\\avatar_4.jpg', NULL, 2, NULL),
(5, 'Ruben', 'Villalobos', 'cristian_villalobos2004@hotmail.com', 'kD4n+zg/2Ih2Ky5BfHihWzqVclHZH59m1o0lY+W5izg=', NULL, NULL, 1, NULL),
(6, 'facu', 'vidia', 'facu@hot.com', 'ixT8q7B3t1NbFvxeYIsgaKq/D4CTL7+g79pI0bzaVgM=', NULL, NULL, 1, NULL),
(7, 'patito', 'patito', 'patito@hotmail.com', '3N9vNDz1CcL5AJEsxirL0nCEjFdRqvDr3rPocoxdTGE=', NULL, NULL, 1, NULL),
(8, 'azucar', 'yerba', 'yer@hotmail.com', 'OHYYuj4Ls3Kmf3wySmrrvLhvRFyQ+PoMEgolEQDHMKo=', NULL, NULL, 2, NULL),
(9, 'mariano', 'luzza', 'luzza@hotmail.com', 'B1i+YL7S7zFRLyoit6h7qDAkM+WItPrMjqkR+B5YXm4=', NULL, NULL, 2, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auditoriacontrato`
--
ALTER TABLE `auditoriacontrato`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_usuario_id` (`id_usuario`),
  ADD KEY `fk_contrato_id` (`id_contrato`);

--
-- Indices de la tabla `auditoriapagos`
--
ALTER TABLE `auditoriapagos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kf_usuario_Id` (`id_usuario`),
  ADD KEY `kf_numero_Pago` (`numero_pago`),
  ADD KEY `kf_contrato_id` (`id_contrato`);

--
-- Indices de la tabla `contratos`
--
ALTER TABLE `contratos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inquilinoId` (`inquilinoId`),
  ADD KEY `inmuebleId` (`inmuebleId`);

--
-- Indices de la tabla `inmuebles`
--
ALTER TABLE `inmuebles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `propietarioId` (`propietarioId`),
  ADD KEY `inmuebleTipoId` (`inmuebleTipoId`);

--
-- Indices de la tabla `inmuebletipos`
--
ALTER TABLE `inmuebletipos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inquilinos`
--
ALTER TABLE `inquilinos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dni` (`dni`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`numeroPago`,`contratoId`),
  ADD KEY `contratoId` (`contratoId`);

--
-- Indices de la tabla `propietarios`
--
ALTER TABLE `propietarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dni` (`dni`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auditoriacontrato`
--
ALTER TABLE `auditoriacontrato`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `auditoriapagos`
--
ALTER TABLE `auditoriapagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `contratos`
--
ALTER TABLE `contratos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `inmuebles`
--
ALTER TABLE `inmuebles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `inmuebletipos`
--
ALTER TABLE `inmuebletipos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `inquilinos`
--
ALTER TABLE `inquilinos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `propietarios`
--
ALTER TABLE `propietarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auditoriacontrato`
--
ALTER TABLE `auditoriacontrato`
  ADD CONSTRAINT `fk_contrato_id` FOREIGN KEY (`id_contrato`) REFERENCES `contratos` (`id`),
  ADD CONSTRAINT `fk_usuario_id` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `auditoriapagos`
--
ALTER TABLE `auditoriapagos`
  ADD CONSTRAINT `kf_contrato_id` FOREIGN KEY (`id_contrato`) REFERENCES `contratos` (`id`),
  ADD CONSTRAINT `kf_numero_Pago` FOREIGN KEY (`numero_pago`) REFERENCES `pagos` (`numeroPago`),
  ADD CONSTRAINT `kf_usuario_Id` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `contratos`
--
ALTER TABLE `contratos`
  ADD CONSTRAINT `contratos_ibfk_1` FOREIGN KEY (`inquilinoId`) REFERENCES `inquilinos` (`id`),
  ADD CONSTRAINT `contratos_ibfk_2` FOREIGN KEY (`inmuebleId`) REFERENCES `inmuebles` (`id`);

--
-- Filtros para la tabla `inmuebles`
--
ALTER TABLE `inmuebles`
  ADD CONSTRAINT `inmuebles_ibfk_1` FOREIGN KEY (`propietarioId`) REFERENCES `propietarios` (`id`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`contratoId`) REFERENCES `contratos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
