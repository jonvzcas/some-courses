CREATE TABLE usuarios(
	usuario_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL,
	apellidos VARCHAR(30) NOT NULL,
	correo VARCHAR(50) UNIQUE,
	edad INT DEFAULT 0
);


INSERT INTO usuarios (nombre,apellidos,correo,edad) VALUES 
("Climaco","Castle","climac@gmail.com", 70),
("Lucy","Del Rosario","lrosario@gmail.com", 62),
("Rodrigo","Gómez","rgomez@gmail.com", 54),
("Oscar","Pérez","edgemaster@gmail.com", 14),
("Camila","Pérez","cperez@gmail.com", 19),
("Thalia","Asprilla","jasprilla@gmail.com",27),
("Carmen","Mena","cmena@gmail.com", 67),
("Efren","Berty","fish2000@gmail.com", 66),
("Claudia","Cano","ccano@gmail.com", 20),
("Lasie","Cabezas","mascota00@gmail.com", 8),
("Romeo","Santos","mascota01@gmail.com", 1);

INSERT INTO usuarios (nombre,apellidos,correo) VALUES 
("Jonathan","Castle","jcstillo@gmail.com");

SELECT * FROM usuarios;

CREATE TABLE productos (
  producto_id INT UNSIGNED AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  descripcion VARCHAR(50),
  precio DECIMAL(7,2),
  cantidad INT UNSIGNED,
  PRIMARY KEY (producto_id)
);


INSERT INTO productos (nombre, descripcion, precio, cantidad) VALUES 
("Rema Papel tam carta","unidad",22500,100),
("Rema Papel tam oficio","unidad",27000,100),
("A-Z tam carta","unidad",7500,10),
("A-Z tam oficio","unidad",8000,10),
("Boligrafo","Kilometrico Caja x 10 ",6999.99,100),
("Marcador","Sharpie p/fina caja x 12",37999.99,50),
("Cinta transparente","40 mt x 100 yds",2500,36);

# Operaciones aritméticas
SELECT 6 + 5 AS calculo;
SELECT 6 - 5 AS calculo;
SELECT 6 * 5 AS calculo;
SELECT 6 / 5 AS calculo;

# Funciones Matemáticas
SELECT MOD(10,3);

SELECT CEILING (7.1);

SELECT FLOOR (7.1);

SELECT ROUND(7.5);

SELECT POW(2,3);

SELECT SQRT(81);

# Columnas calculadas

SELECT precio * cantidad AS subtotal FROM productos WHERE producto_id = 3;

SELECT nombre, descripcion, precio, cantidad, (precio*cantidad) AS subtotal FROM productos; 

# Funciones de agrupamiento
SELECT MAX(precio) FROM productos;
SELECT MIN(precio) FROM productos;
SELECT AVG(precio) FROM productos;
SELECT SUM(cantidad) AS existencias FROM productos;
SELECT COUNT(*) AS productos_total FROM productos;

SELECT SUM(cantidad*precio) AS total FROM productos;

SELECT * FROM productos;

CREATE TABLE pedidos (
	pedido_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	producto_id INT UNSIGNED NOT NULL,
	fecha DATETIME,
	total DECIMAL(10,2)
);

ALTER TABLE pedidos ADD CONSTRAINT fk_pedidos_productos FOREIGN KEY (producto_id) REFERENCES productos(producto_id);

DROP TABLE pedidos;

SELECT * FROM pedidos;

INSERT INTO pedidos (producto_id,fecha,total) VALUES 
(1,"2023-02-10 10:00:00",22500),
(1,"2023-02-15 10:00:00",22500),
(1,"2023-02-20 10:00:00",22500),
(1,"2023-02-28 10:00:00",22500),
(5,"2023-03-15 10:00:00",6999.99),
(5,"2023-03-15 10:00:00",6999.99),
(6,"2023-04-2 10:00:00",37999.99)
;

SELECT producto_id, SUM(total) AS monto_total FROM pedidos GROUP BY producto_id;

SELECT producto_id, SUM(total) AS monto_total FROM pedidos GROUP BY producto_id HAVING monto_total < 30000;

USE curso_sql;

SHOW TABLES;


SELECT DISTINCT apellidos FROM usuarios;

SELECT nombre FROM usuarios ORDER BY nombre;

SELECT nombre, apellidos FROM usuarios WHERE apellidos = 'Pérez' ORDER BY nombre DESC;

SELECT * FROM usuarios;

SELECT * FROM pedidos WHERE total BETWEEN 5000 AND 23000;

SELECT * FROM usuarios WHERE correo REGEXP '[0-9]';

SELECT UCASE(nombre), UCASE(apellidos) FROM usuarios;

SELECT REVERSE(nombre) FROM usuarios;

SELECT REPLACE(nombre, 'a', '4') FROM usuarios;

SELECT ('    Viernes    ');
SELECT TRIM('    Viernes    ');

SELECT CONCAT(nombre,' ',apellidos) FROM usuarios;

SELECT CONCAT_WS(' ',nombre,apellidos,correo) FROM usuarios;

SHOW INDEX FROM usuarios;


















