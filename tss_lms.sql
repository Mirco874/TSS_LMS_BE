-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-11-2022 a las 02:34:15
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tss_lms`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivo`
--

CREATE TABLE `archivo` (
  `id` int(11) NOT NULL,
  `enlace` varchar(255) DEFAULT NULL,
  `id_capitulo` int(11) NOT NULL,
  `contenido` text DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `nombre_archivo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `archivo`
--

INSERT INTO `archivo` (`id`, `enlace`, `id_capitulo`, `contenido`, `tipo`, `nombre_archivo`) VALUES
(1, 'inserte enlace del pdf para el tema 1', 1, NULL, 1, 'Introducción a la simulación de sistemas.pdf'),
(2, 'inserte enlace del pdf para el tema 2', 2, NULL, 1, 'Generación de números rectangulares.pfd'),
(3, 'inserte enlace del pdf para el tema 3', 3, NULL, 1, 'Pruebas estadísticas para los números pseudoaletorios.pdf'),
(4, 'inserte enlace del pdf para el tema 4', 4, NULL, 1, 'Generación de variables aleatorias no uniformes.pdf'),
(5, 'inserte enlace del pdf para el tema 5', 5, NULL, 1, 'Aplicaciones de simulacion.pdf'),
(6, 'inserte enlace del pdf para el tema 6', 6, NULL, 1, 'Análisis de los resultados de simulación.pdf'),
(9, 'insertar pdf de ejemplos de aplicaciones de simulación', 1, '', 1, 'Ejemplos de aplicaciones de simulacion.pdf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capitulo`
--

CREATE TABLE `capitulo` (
  `id` int(11) NOT NULL,
  `titulo_capitulo` varchar(200) NOT NULL,
  `titulo_material` varchar(200) DEFAULT NULL,
  `descripcion_material` varchar(255) DEFAULT NULL,
  `estado_foro` tinyint(1) NOT NULL DEFAULT 1,
  `titulo_foro` varchar(150) DEFAULT NULL,
  `descripcion_foro` varchar(200) DEFAULT NULL,
  `id_clase` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `capitulo`
--

INSERT INTO `capitulo` (`id`, `titulo_capitulo`, `titulo_material`, `descripcion_material`, `estado_foro`, `titulo_foro`, `descripcion_foro`, `id_clase`) VALUES
(1, 'Tema 1. Introducción ', 'introduccion a la simulacion d', 'se adjunta el material de introduccion a la  simulacion de sistemas', 0, 'Foro del tema 1', 'foro de retroalimentacion del tema \"introduccion a la simulacion de sistemas\"', 1),
(2, 'Tema 2. Gereración de números rectangulares', 'Generacion de numeros rectangulares', 'se adjunta el material de generacion de variables aleatorias', 0, 'Foro del tema 2', 'foro de retroalimentacion del tema \"introduccion a la simulacion de sistemas\"', 1),
(3, 'Tema 3. Pruebas estadísticas para números pseudoaleatorios', 'Pruebas estadísticas para números pseudoaleatorios', 'Se adjunta el material del capítulo pruebas estadísticas para números pseudoaleatorios', 0, 'Foro del tema 3', 'Espacio para retroalimentar los conceptos de pruebas de aleatoriedad en los generadores de números rectangulares', 1),
(4, 'Tema 4. Generación de variables aleatorias no-uniformes.', 'Generación de variables aleatorias no-uniformes.', 'Se adjunta el material del capítulo generación de variables aleatorias no-uniformes.', 0, 'Foro del tema 4', 'Espacio para retroalimentar los conceptos de :', 1),
(5, 'Tema 5. Aplicaciones de simulación.', 'Aplicaciones de simulación', 'Se adjunta el material del tema aplicaciones de simulación.', 0, 'Foro del tema 5', 'Espacio de retroalimentación de los conceptos estudiados y analizados en el tema 5.', 1),
(6, 'Tema 6. Análisis de los resultados de simulación.', 'Análisis de los resultados de simulación.', 'Se adjunta el material del tema análisis de los resultados de simulación.', 0, 'Foro del tema 6', 'Espacio de retroalimentación de los conceptos estudiados y analizados en el tema 6.', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clase`
--

CREATE TABLE `clase` (
  `id` int(11) NOT NULL,
  `nombre_clase` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clase`
--

INSERT INTO `clase` (`id`, `nombre_clase`) VALUES
(1, 'simulacion de sistemas(1-2022)'),
(2, 'simulación de sistemas (2-2021)'),
(3, 'clase_prueba1 '),
(4, 'nuanadasda'),
(5, 'val1'),
(6, 'clase_prueb3'),
(7, 'clase_prueb3'),
(8, 'clase_prueb3s'),
(9, 'clase_prueb3s'),
(10, 'dasdasdasd'),
(11, 'ddddd'),
(12, 'sdsdsdsds'),
(13, 'asdasdasdasdasdas'),
(14, 'asdasdasdasdasdas'),
(15, 'nueva clase'),
(16, 'prueba nueva clase');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensaje`
--

CREATE TABLE `mensaje` (
  `id` int(11) NOT NULL,
  `contenido` varchar(200) NOT NULL,
  `id_capitulo` int(11) NOT NULL,
  `autor` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `mensaje`
--

INSERT INTO `mensaje` (`id`, `contenido`, `id_capitulo`, `autor`) VALUES
(1, 'ejemplo de mensaje', 1, 'juan perez perez');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `practica`
--

CREATE TABLE `practica` (
  `id` int(11) NOT NULL,
  `id_capitulo` int(11) NOT NULL,
  `contenido` text DEFAULT NULL,
  `titulo_practica` varchar(150) DEFAULT NULL,
  `descripcion_practica` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `practica`
--

INSERT INTO `practica` (`id`, `id_capitulo`, `contenido`, `titulo_practica`, `descripcion_practica`) VALUES
(1, 2, '\nclass Ejercicio1{\n    public static void main(String[] args){\n        System.out.println(generarValor(5,7,8));\n    }\n    \n    public static double generarValor(int semilla,int cmultiplicativa,int modulo){\n        int i,numero;\n        double nume', 'Ejercicio1', ''),
(2, 5, 'class Ejercicio2{\r\n        public static void main(String[] args){\r\n        System.out.println(generarValorSimulado(1,2,3));\r\n    }\r\n    \r\n    public static double generarValorSimulado(double pesimista,double probable,double optimista){\r\n        double a=', 'Ejercicio2', NULL),
(3, 5, 'Ejercicio3', 'class PracticaInversiones{\\npublic static void main(String[] args){\\nSystem.out.println(3);}}', NULL),
(4, 5, 'class PracticaColas{\\npublic static void main(String[] args){\\nSystem.out.println(3);}}', 'PracticaColas', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id` int(11) NOT NULL,
  `nombre_rol` varchar(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `nombre_rol`) VALUES
(1, 'administrador'),
(2, 'estudiante'),
(3, 'docente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre_completo` varchar(255) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre_completo`, `id_rol`, `email`, `password`) VALUES
(1, 'Felipe Perez Perez', 1, 'admin@gmail.com', 'contrasena'),
(2, 'Ernesto Valle Valle', 3, 'docente1@gmail.com', 'contrasena'),
(3, 'Juana Coca Coca', 2, 'estudiante1@gmai.com', 'contrasena'),
(11, 'Nuevo Estudiante', 2, 'est2@gmail.com', '$2a$10$aL93lm9YIxBYvYuChXuiEOaWIyALZJEHEH.D8sFKo8WmAj6xeGlvC'),
(12, 'Nuevo Docente', 3, 'doc33@gmail.com', '$2a$10$UTQM5NX59fQnnPadRUskjO1AcfBC8zNmw.pj2JGC0vAeBwfRylkmG');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_clase`
--

CREATE TABLE `usuario_clase` (
  `id` int(11) NOT NULL,
  `id_clase` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario_clase`
--

INSERT INTO `usuario_clase` (`id`, `id_clase`, `id_usuario`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(9, 16, 12),
(10, 16, 11);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `archivo`
--
ALTER TABLE `archivo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_material` (`id_capitulo`);

--
-- Indices de la tabla `capitulo`
--
ALTER TABLE `capitulo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Capitulo_Clase` (`id_clase`);

--
-- Indices de la tabla `clase`
--
ALTER TABLE `clase`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mensaje`
--
ALTER TABLE `mensaje`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_foro` (`id_capitulo`);

--
-- Indices de la tabla `practica`
--
ALTER TABLE `practica`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_capitulo` (`id_capitulo`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_rol` (`id_rol`);

--
-- Indices de la tabla `usuario_clase`
--
ALTER TABLE `usuario_clase`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_clase` (`id_clase`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `archivo`
--
ALTER TABLE `archivo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `capitulo`
--
ALTER TABLE `capitulo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `clase`
--
ALTER TABLE `clase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `mensaje`
--
ALTER TABLE `mensaje`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `practica`
--
ALTER TABLE `practica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `usuario_clase`
--
ALTER TABLE `usuario_clase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `archivo`
--
ALTER TABLE `archivo`
  ADD CONSTRAINT `archivo_ibfk_1` FOREIGN KEY (`id_capitulo`) REFERENCES `capitulo` (`id`);

--
-- Filtros para la tabla `capitulo`
--
ALTER TABLE `capitulo`
  ADD CONSTRAINT `FK_Capitulo_Clase` FOREIGN KEY (`id_clase`) REFERENCES `clase` (`id`);

--
-- Filtros para la tabla `mensaje`
--
ALTER TABLE `mensaje`
  ADD CONSTRAINT `mensaje_ibfk_1` FOREIGN KEY (`id_capitulo`) REFERENCES `capitulo` (`id`);

--
-- Filtros para la tabla `practica`
--
ALTER TABLE `practica`
  ADD CONSTRAINT `practica_ibfk_1` FOREIGN KEY (`id_capitulo`) REFERENCES `capitulo` (`id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id`);

--
-- Filtros para la tabla `usuario_clase`
--
ALTER TABLE `usuario_clase`
  ADD CONSTRAINT `usuario_clase_ibfk_1` FOREIGN KEY (`id_clase`) REFERENCES `clase` (`id`),
  ADD CONSTRAINT `usuario_clase_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
