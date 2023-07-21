# RESTRICCIONES (CASOS PRACTICOS)

# SET NULL

DROP TABLE companies;

DROP TABLE activities;

# Creando la tabla secundaria
CREATE TABLE activities (
	id_activity INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	cod_activity CHAR(4) UNIQUE,
	activity VARCHAR(50) UNIQUE
);

# Insertando registros en la tabla secundaria
INSERT INTO activities (cod_activity, activity) VALUES 
	('471','retail trade in non-specialized stores'),
	('0112','rice cultivation'),
	('0114','tabaco cultivation'),
	('411','building construction'),
	('4775','retail trade of second-hand items'),
	('0123','coffe growing'),
	('478','retail trade in mobile sales points'),
	('4111','construction of residencials buildings'),
	('4112','construction of non-residential buildings');
	
# Creando la tabla principal estableciendo el SET NULL por defecto
CREATE TABLE companies (
	id_company INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(40) UNIQUE,
	id_activity INT UNSIGNED,
	FOREIGN KEY (id_activity) REFERENCES activities(id_activity)
	ON DELETE SET NULL ON UPDATE CASCADE
);

# Insertando registros en la tabla primaria
INSERT INTO companies (name,id_activity) VALUES 
	('TAR-get',4),
	('XYZ',5),
	('Almacen Pacifico',7),
	('Constructora Asprilla',9),
	('Comercializadora ABC',6),
	('Bennet Company',4),
	('Bytes Colombia',1),
	('Cafe Horizonte',3),
	('Salud Tabaco',2),
	('Constructora ABC',8),
	('Arroz del Valle',3),
	('Design Soft',1);

SELECT id_company, name, a.cod_activity, a.activity 
	FROM companies 
	INNER JOIN activities a 
	ON companies.id_activity = a.id_activity;

DELETE FROM activities WHERE id_activity = 3;

SELECT * FROM companies;
