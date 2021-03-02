-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-03-2021 a las 23:45:59
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `crudnodejsmysql`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `vacanteAddOrEdit` (IN `_id` INT, IN `_nombre` VARCHAR(40), IN `_empresa` VARCHAR(50), IN `_contacto` VARCHAR(15), IN `_direccion` VARCHAR(200), IN `_email` VARCHAR(100), IN `_salario` VARCHAR(100), IN `_requisitos` VARCHAR(300))  BEGIN
	IF _id = 0 THEN
		INSERT INTO vacante(nombre,empresa,contacto,direccion,email,salario,requisitos)
        VALUES (_nombre,_empresa,_contacto,_direccion,_email,_salario,_requisitos);
        SET _id = LAST_INSERT_ID();
    ELSE
    	UPDATE vacante
        SET
        nombre = _nombre,
        empresa = _empresa,
        contacto = _contacto,
        direccion = _direccion,
        email = _email,
        salario = _salario,
        requisitos = _requisitos
        WHERE id = _id;
    END IF;  
    SELECT _id AS 'id';
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacante`
--

CREATE TABLE `vacante` (
  `id` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `empresa` varchar(50) NOT NULL,
  `contacto` varchar(15) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `salario` varchar(100) NOT NULL,
  `requisitos` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `vacante`
--

INSERT INTO `vacante` (`id`, `nombre`, `empresa`, `contacto`, `direccion`, `email`, `salario`, `requisitos`) VALUES
(7, 'Peter', 'Panaderia', 'Mesa que mas ap', 'Mesa que mas aplauda que mas aplauda le traigo la...', 'mesa@me.net', '500', 'mesa que aplauda'),
(8, 'Pedro', 'Chineria', 'sfvsgvadfd', 'donde el chinero', 'chinex', 'xchina', 'tener chinas');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `vacante`
--
ALTER TABLE `vacante`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `vacante`
--
ALTER TABLE `vacante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
