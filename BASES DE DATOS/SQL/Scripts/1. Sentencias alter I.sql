DROP TABLE usuarios;

CREATE TABLE usuarios(
	usuario_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL,
	apellidos VARCHAR(30) NOT NULL,
	correo VARCHAR(50) UNIQUE,
	edad INT DEFAULT 0,
	ciudad VARCHAR(30) DEFAULT 'Buenaventura'
);

INSERT INTO usuarios (nombre,apellidos,correo,edad,ciudad) VALUES 
("Climaco","Castle","climac@gmail.com",70,"Buenaventura"),
("Lucy","Del Rosario","lrosario@gmail.com",62,"Buenaventura"),
("Rodrigo","Gómez","rgomez@gmail.com", 54,"Buenaventura"),
("Oscar","Pérez","edgemaster@gmail.com",14,"Buenaventura"),
("Camila","Pérez","cperez@gmail.com",19,"Buenaventura"),
("Thalia","Asprilla","jasprilla@gmail.com",27,"Quilichao"),
("Jonathan","Castillo","jctillo@gmail.com",39,"Quilichao"),
("Carmen","Mena","cmena@gmail.com", 67,"Buenaventura"),
("Efren","Berty","fish2000@gmail.com",66,"Buenaventura"),
("Claudia","Cano","ccano@gmail.com", 20,"Buenaventura"),
("Lasie","Cabezas","mascota00@gmail.com",8,"Buenaventura"),
("Romeo","Santos","mascota01@gmail.com",1,"Buenaventura");

CREATE TABLE usuarios(
	usuario_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL,
	apellidos VARCHAR(30) NOT NULL,
	correo VARCHAR(50) UNIQUE,
	edad INT DEFAULT 0,
	ciudad VARCHAR(30),
	INDEX idx_usuarios (apellidos,ciudad)
);




SELECT * FROM usuarios WHERE ciudad = 'Quilichao';

CREATE TABLE usuarios(
	usuario_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL,
	apellidos VARCHAR(30) NOT NULL,
	correo VARCHAR(50) UNIQUE,
	edad INT DEFAULT 0,
	ciudad VARCHAR(30),
	FULLTEXT fi_usuarios (nombre,apellidos,ciudad)
);

SELECT * FROM usuarios WHERE MATCH (nombre,apellidos,ciudad) AGAINST ('QUILICHAO' IN BOOLEAN MODE);

CREATE TABLE usuarios(
	usuario_id INT UNSIGNED,
	nombre VARCHAR(30) NOT NULL,
	apellidos VARCHAR(30) NOT NULL,
	correo VARCHAR(50),
	edad INT DEFAULT 0,
	ciudad VARCHAR(30) DEFAULT 'Buenaventura'
);

ALTER TABLE usuarios ADD CONSTRAINT pk_usuario_id PRIMARY KEY(usuario_id);

ALTER TABLE usuarios MODIFY COLUMN usuario_id INT AUTO_INCREMENT;

ALTER TABLE usuarios ADD CONSTRAINT uq_correo UNIQUE(correo);

ALTER TABLE usuarios ADD INDEX i_nombre_apellido(nombre,apellidos);

ALTER TABLE usuarios ADD FULLTEXT INDEX fi_busqueda(nombre,apellidos,ciudad);

ALTER TABLE usuarios DROP INDEX fi_busqueda;

SELECT * FROM usuarios WHERE MATCH(nombre,apellidos,ciudad) AGAINST('asprilla' IN BOOLEAN MODE);

SELECT * FROM usuarios WHERE MATCH(nombre,apellidos,ciudad) AGAINST('asprilla' IN BOOLEAN MODE);

SELECT * FROM usuarios;

SHOW INDEX FROM usuarios;





