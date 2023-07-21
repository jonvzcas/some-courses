# MOTERES DE TABLAS

-- Especificar que mi tabla es InnoDB;
-- El ENGINE se pone cuando la versión del motor de base de datos en MySQL es menor o igual a 5.5
-- MyISAM era motor de almacenamiento prodeterminado

DROP DATABASE business_directory;

CREATE DATABASE business_directory;

USE business_directory;

CREATE TABLE departments (
	id_department INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	cod_dane_dep CHAR(2) UNIQUE,
	department VARCHAR(30) UNIQUE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;


CREATE TABLE departments (
	id_department INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	cod_dane_dep CHAR(2) UNIQUE,
	department VARCHAR(30) UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


