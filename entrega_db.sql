-- Entrega individual DB - Diego Gongora
DROP DATABASE IF EXISTS entrega_diego_gongora;
CREATE DATABASE entrega_diego_gongora;
USE entrega_diego_gongora;

-- Creación de tablas

-- Tabla usuarios
DROP TABLE IF EXISTS `entrega_diego_gongora`.`usuarios`;
CREATE TABLE IF NOT EXISTS `entrega_diego_gongora`.`usuarios` (
  `idUsuarios` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUsuarios`),
  UNIQUE KEY `usuarios_email` (`email`)  
)ENGINE = InnoDB;

-- Tabla categorias
DROP TABLE IF EXISTS `entrega_diego_gongora`.`categorias`;
CREATE TABLE IF NOT EXISTS `entrega_diego_gongora`.`categorias` (
	`idCategorias` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `nombre_categoria` VARCHAR(45) NOT NULL,    
    PRIMARY KEY(`idCategorias`)
)ENGINE = InnoDB;

-- Tabla notas
DROP TABLE IF EXISTS `entrega_diego_gongora`.`notas`;
CREATE TABLE IF NOT EXISTS `entrega_diego_gongora`.`notas` (
	`idNotas` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `titulo` VARCHAR(100) NOT NULL,
    `fecha_creacion` DATETIME NULL DEFAULT NULL,
    `ultima_modificacion` DATETIME NULL DEFAULT NULL,
    `descripcion` TEXT NOT NULL,
    `eliminar_nota` TINYINT(1) NOT NULL DEFAULT '0',
    `idUsuario` INT UNSIGNED DEFAULT NULL,
    `idCategoria` INT UNSIGNED DEFAULT NULL,
    PRIMARY KEY (`idNotas`),
	  KEY `notas_usuarios_id_foreign` (`idUsuario`),
	  CONSTRAINT `notas_usuarios_id_foreign` 
      FOREIGN KEY (`idUsuario`) 
      REFERENCES `usuarios` (`idUsuarios`),
      
      KEY `notas_categorias_id_foreign` (`idCategoria`),
	  CONSTRAINT `notas_categorias_id_foreign` 
      FOREIGN KEY (`idCategoria`) 
      REFERENCES `categorias` (`idCategorias`)     
)ENGINE = InnoDB;


-- Insertando datos
INSERT INTO `entrega_diego_gongora`.`usuarios`
VALUES
(1, 'Diego', 'diego1@gmail.com'),
(2, 'Usuario2', 'usu2@hotmail.com'),
(3, 'Usuario3', 'usu3@yahoo.com'),
(4, 'Usuario4', 'usu4@outlook.com'),
(5, 'Usuario5', 'usu5@gmx.com'),
(6, 'Usuario6', 'usu6@hushmail.com'),
(7, 'Usuario7', 'usu7@fastmail.com'),
(8, 'Usuario8', 'usu8@startmail.com'),
(9, 'Usuario9', 'usu9@protonmail.com'),
(10, 'Usuario10', 'usu10@posteo.com');

INSERT INTO `entrega_diego_gongora`.`categorias`
VALUES
(1, 'Música'),
(2, 'Deportes'),
(3, 'Artes'),
(4, 'Programación'),
(5, 'Inteligencia artificial'),
(6, 'Big Data'),
(7, 'Internet de las cosas'),
(8, 'Arquitectura de computadoras'),
(9, 'Modelado de datos'),
(10, 'Sistemas distribuidos');

INSERT INTO `entrega_diego_gongora`.`notas` (`idNotas`, `titulo`, `fecha_creacion`, `ultima_modificacion`, `descripcion`, `idUsuario`, `idCategoria`)
VALUES
(1, 'Titulo1', '2021-08-10 00:00:00', '2021-08-11 00:00:00', 'Descripcion nota 1', 1, NULL),
(2, 'Titulo2', '2021-08-12 00:00:00', '2021-08-13 00:00:00', 'Descripcion nota 2', 2, 9),
(3, 'Titulo3', '2021-08-14 00:00:00', '2021-08-15 00:00:00', 'Descripcion nota 3', 3, 8),
(4, 'Titulo4', '2021-08-16 00:00:00', '2021-08-17 00:00:00', 'Descripcion nota 4', 4, 7),
(5, 'Titulo5', '2021-08-18 00:00:00', '2021-08-19 00:00:00', 'Descripcion nota 5', 5, 6),
(6, 'Titulo6', '2021-08-20 00:00:00', '2021-08-21 00:00:00', 'Descripcion nota 6', 6, 5),
(7, 'Titulo7', '2021-08-22 00:00:00', '2021-08-23 00:00:00', 'Descripcion nota 7', 7, 4),
(8, 'Titulo8', '2021-08-24 00:00:00', '2021-08-25 00:00:00', 'Descripcion nota 8', 8, 3),
(9, 'Titulo9', '2021-08-26 00:00:00', '2021-08-27 00:00:00', 'Descripcion nota 9', 9, 2),
(10, 'Titulo10', '2021-08-28 00:00:00', '2021-08-29 00:00:00', 'Descripcion nota 10', NULL, 1);
