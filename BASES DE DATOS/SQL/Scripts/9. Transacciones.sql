# TRANSACCIONES
DROP TABLE companies;
DROP TABLE activities;
SHOW INDEX FROM companies;

SELECT * FROM activities LIMIT 3,3;

DESCRIBE activities;

START TRANSACTION;

	UPDATE activities SET cod_activity = '0122' WHERE cod_activity = '0112';
	DELETE FROM activities;
	INSERT INTO activities VALUES (10,'0615', 'support technology');

ROLLBACK;
COMMIT;

# FUNCIONES DE ENCRYPTACION

SELECT MD5('m1 pA$$w0rd');

SELECT SHA1('m1 pA$$w0rd');

SELECT SHA2('m1 pA$$w0rd', 256);

SELECT AES_ENCRYPT('m1 pA$$w0rd', 'llave_secreta');

SELECT AES_DECRYPT(nombre_campo, 'llave_secreta');

CREATE TABLE cuentas_de_email(
  email VARCHAR(30) PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  pwd BLOB
);

INSERT INTO cuentas_de_email VALUES 
	('jcastillo@tar-get.co','Jonathan', AES_ENCRYPT('pAssword1', 'pina')),
	('climactano@tar-get.co','Climaco', AES_ENCRYPT('pAssword1', 'mango')),
	('lgrajales@tar-get.co','Lucy', AES_ENCRYPT('pAssword1', 'ciruela')),
	('operez@tar-get.co','Oscar', AES_ENCRYPT('pAssword1', 'granadina')),
	('bgomez@tar-get.co','Blanca', AES_ENCRYPT('pAssword1', 'banano'));

SELECT * FROM cuentas_de_email; 

SELECT CAST(AES_DECRYPT(pwd, 'ciruela') AS CHAR) AS tdc, name FROM cuentas_de_email;









