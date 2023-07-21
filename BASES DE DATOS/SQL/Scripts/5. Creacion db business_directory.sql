CREATE DATABASE business_directory;

USE business_directory;

CREATE TABLE departments (
	id_department INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	cod_dane_dep CHAR(2),
	department VARCHAR(30)
);

ALTER TABLE departments MODIFY cod_dane_dep CHAR(2) UNIQUE;
ALTER TABLE departments MODIFY department VARCHAR(30) UNIQUE;
DESCRIBE departments;


CREATE TABLE cities (
	id_city INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	cod_dane_mun CHAR(3),
	city VARCHAR(30) UNIQUE,
	id_department INT UNSIGNED
);

# Creando relación entre la tabla departments y la tabla cities

ALTER TABLE cities ADD CONSTRAINT fk_cities_departments FOREIGN KEY (id_department) REFERENCES departments(id_department);

SHOW INDEX FROM cities;

CREATE TABLE sectors (
	id_sector INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	cod_sector CHAR(2) UNIQUE,
	sector VARCHAR(30) UNIQUE
);

CREATE TABLE activities (
	id_activity INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	cod_activity CHAR(4) UNIQUE,
	activity VARCHAR(50) UNIQUE,
	id_sector INT UNSIGNED 
);

# Creando relación entre la tabla sector y la tabla activities

ALTER TABLE activities ADD CONSTRAINT fk_activities_sectors FOREIGN KEY (id_sector) REFERENCES sectors(id_sector);

SHOW INDEX FROM activities;

CREATE TABLE legal_form (
	id_legal_form INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	legal_form CHAR(7) UNIQUE 
);


CREATE TABLE companies (
	id_company INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(40),
	id_legal_form INT UNSIGNED,
	id_activity INT UNSIGNED,
	company_value INT,
	date_start DATE,
	id_city INT UNSIGNED,
	address VARCHAR(40),
	phone VARCHAR(10),
	contact VARCHAR(30)
);

# Creando relaciones entre la tabla companies y las tablas (legal_form, activities, city)

ALTER TABLE companies ADD CONSTRAINT fk_companies_legal_form FOREIGN KEY (id_legal_form) REFERENCES legal_form(id_legal_form);


ALTER TABLE companies ADD CONSTRAINT fk_companies_activities FOREIGN KEY (id_activity) REFERENCES activities(id_activity);

-- Eliminando el CONSTRAINT fk_companies_id_activity

ALTER TABLE companies DROP CONSTRAINT fk_companies_id_activity;

ALTER TABLE companies ADD CONSTRAINT fk_companies_cities FOREIGN KEY (id_city) REFERENCES cities(id_city); 

SHOW INDEX FROM companies;

RENAME TABLE business_directory.citys TO business_directory.cities;

# ---------------------------- INSERTIONS --------------------------------------

INSERT INTO departments (cod_dane_dep, department) VALUES 
	('76', 'Valle del Cauca'),
	('11', 'Bogota'),
	('05', 'Antioquia');

SELECT * FROM departments;

INSERT INTO cities (cod_dane_mun, city, id_department) VALUES 
	('001','Cali',1),
	('001','Bogota D.C.',2),
	('001','Medellin',3),
	('109','Buenaventura',1),
	('147','Cartago',1),
	('030','Amaga',3);


INSERT INTO sectors (cod_sector, sector) VALUES 
	('01','Agricultural'),
	('47','Business and services'),
	('41','Construction');


INSERT INTO activities (cod_activity, activity, id_sector) VALUES 
	('471','retail trade in non-specialized stores',2),
	('0112','rice cultivation',1),
	('0114','tabaco cultivation',1),
	('411','building construction',3),
	('4775','retail trade of second-hand items',2),
	('0123','coffe growing',1),
	('478','retail trade in mobile sales points',2),
	('4111','construction of residencials buildings',3),
	('4112','construction of non-residential buildings',3);

INSERT INTO legal_form (legal_form) VALUES 
	('S.A.'),
	('Ltda.'),
	('SAS'),
	('natural');

ALTER TABLE companies ADD COLUMN email VARCHAR(30) UNIQUE AFTER phone;

INSERT INTO companies (name,id_legal_form,id_activity,company_value,date_start,id_city,address,phone,email,contact) VALUES 
	('TAR-get',4,7,100000000,'2000-03-30',1,'CL 13B # 2 - 77','4568545','contact@tar-get.com','Oilda'),
	('XYZ',4,4,80000000,'2002-05-17',6,'CR 15B # 9 - 78','9873254','contact@xyz.com','Okari'),
	('Almacen Pacifico',3,5,130000000,'2008-07-14',2,'AV 30 # 3 - 79','3543254','contact@almacenpacifico.com','Shi Yin'),
	('Constructora Asprilla',1,9,1500000000,'2005-05-19',3,'CL 6 # 40 - 80','5458765','contact@const-asprilla.com','Shu Yan'),
	('Comercializadora ABC',2,1,300000000,'2021-08-09',4,'CR 27C # 3 - 81','5458784','contact@comABC.com','Sol Amy'),
	('Bennet Company',4,7,90000000,'2019-01-18',5,'AV 10 # 4 - 82','8799336','contact@bennetcompany.com','Eliú'),
	('Bytes Colombia',1,7,90000000,'2019-06-19',6,'CL 66A # 4 - 44','8632134','contact@bytescolombia.com','Juny'),
	('Cafe Horizonte',3,6,250000000,'2021-03-05',1,'CR 47 # 9 - 84','2134545','contact@cafehorizonte.com','Ryan'),
	('Salud Tabaco',2,3,250000000,'2023-04-24',2,'AV 23D # 4 - 50','5646455','contact@saludtabaco.com','Ale José'),
	('Constructora ABC',1,8,1000000000,'2017-09-08',3,'CL 47B # 15 - 20','8769341','contact@constructoraABC.com','Alí Said'),
	('Arroz del Valle',3,2,1200000000,'2018-07-25',4,'CR 454 # 8 - 90','3917812','contact@arrozdelvalle.com','Dan José'),
	('Design Soft',1,7,150000000,'2016-10-15',5,'AV 14B # 4 - 77','7889715','contact@designsoft.com','UsNavy');

SELECT name, company_value, id_city  FROM companies;

DESCRIBE legal_form;

ALTER TABLE legal_form MODIFY legal_form VARCHAR(30);

SHOW INDEX FROM companies;

SELECT * FROM cities;

INSERT INTO legal_form (legal_form) VALUES ('Sociedad cooperativa');

SELECT * FROM companies 
INNER JOIN legal_form ON companies.id_legal_form = legal_form.id_legal_form;

SELECT * FROM companies, legal_form  
WHERE companies.id_legal_form = legal_form.id_legal_form;

SELECT * FROM companies; 

INNER JOIN legal_form ON companies.id_legal_form > legal_form.id_legal_form;

SELECT * FROM legal_form;

SELECT * FROM sectors;

SELECT cities.city,companies.name, companies.company_value FROM cities JOIN companies ON cities.id_city = companies.id_city AND companies.company_value < 130000000;

SELECT cities.city,companies.name, companies.company_value FROM cities JOIN companies ON cities.id_city = companies.id_city AND companies.company_value = 130000000; 

SELECT * FROM activities NATURAL JOIN sectors;

INSERT INTO activities (cod_activity, activity, id_sector) VALUES 
	('0321','maritime aquaculture',04);

SELECT * FROM activities;

SELECT * FROM sectors;

INSERT INTO sectors (cod_sector, sector) VALUES ('03','fish');

SELECT * FROM sectors LEFT JOIN activities ON sectors.id_sector = activities.id_sector; 

SELECT * FROM sectors LEFT JOIN activities ON sectors.id_sector = activities.id_sector;

SELECT * FROM sectors LEFT OUTER JOIN activities ON sectors.id_sector = activities.id_sector  WHERE activities.id_sector IS NULL;

SELECT * FROM activities RIGHT OUTER JOIN sectors ON activities.id_sector = sectors.id_sector;  

SELECT * FROM activities RIGHT OUTER JOIN sectors ON activities.id_sector = sectors.id_sector WHERE activities.id_sector IS NULL;  

INSERT INTO activities  (cod_activity,activity) VALUES ('0321','maritime aquaculture');

SELECT * FROM sectors;

SELECT * FROM activities;


INSERT INTO sectors (cod_sector,sector) VALUES (NULL,NULL);

DELETE FROM sectors WHERE id_sector = 5;

SELECT * FROM sectors FULL OUTER JOIN activities ON sectors.id_sector = activities.id_sector;  

# SIMULACIÓN DE UN FULL OUTER JOIN EN MySQL

SELECT * 
FROM sectors 
LEFT JOIN activities ON sectors.id_sector = activities.id_sector 
UNION 
SELECT * FROM sectors 
RIGHT JOIN activities ON sectors.id_sector = activities.id_sector
WHERE sectors.id_sector IS NULL;


# SIMULACIÓN DE UN FULL JOIN excluyendo la intersección EN MySQL
SELECT * 
FROM sectors 
LEFT JOIN activities ON sectors.id_sector = activities.id_sector 
WHERE activities.id_sector IS NULL
UNION 
SELECT * FROM sectors 
RIGHT JOIN activities ON sectors.id_sector = activities.id_sector
WHERE sectors.id_sector IS NULL;

# CROSS JOIN

SELECT * FROM sectors CROSS JOIN activities;

SELECT companies.name, a.activity, c.city FROM companies 
INNER JOIN activities a ON companies.id_activity = a.id_activity
INNER JOIN cities c ON companies.id_city = c.id_city;

# CREANDO UNA VISTA

CREATE VIEW ejemplo_vista AS SELECT companies.name, a.activity, c.city FROM companies 
INNER JOIN activities a ON companies.id_activity = a.id_activity
INNER JOIN cities c ON companies.id_city = c.id_city;

SELECT * FROM ejemplo_vista;

DESCRIBE ejemplo_vista;

SHOW FULL TABLES IN business_directory WHERE TABLE_TYPE LIKE 'VIEW';








