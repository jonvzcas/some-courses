DELIMITER //

CREATE PROCEDURE sp_obtener_suscripciones()
	
	BEGIN
		SELECT * FROM suscripciones;	
	END //
	
DELIMITER ;


CALL sp_obtener_suscripciones(); 

SHOW PROCEDURE STATUS WHERE db = 'curso_sql';

DROP PROCEDURE sp_obtener_suscripciones; 

SELECT * FROM suscripciones s;
SELECT * FROM clientes;
SELECT * FROM tarjetas;
SELECT * FROM servicios;
SELECT * FROM actividad_clientes;

## Verificamos los parámetros del Store Procedure
## @rest es la variable de respuesta del sp
CALL sp_asignar_servicio(3,'climaco','climactano@yahoo.com','0123456789012356', @res);
SELECT @res;


