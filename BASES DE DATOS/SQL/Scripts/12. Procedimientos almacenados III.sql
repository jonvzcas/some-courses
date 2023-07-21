DELIMITER //

## PARAMETROS DE ENTRADA Y SALIDA DEL STORE PROCEDURE
CREATE PROCEDURE sp_asignar_servicio(
	## Las carácteristicas de las variables deben coicidir con los de tabla
	IN i_suscripcion INT UNSIGNED,
	IN i_nombre VARCHAR(30),
	IN i_correo VARCHAR(50),
	IN i_tarjeta VARCHAR(16),
	OUT o_respuesta VARCHAR(50)
)
	## LOGICA DE NEGOCIO
	BEGIN
		## DECLARACION DE VARIABLES
		
		DECLARE existe_correo INT DEFAULT 0;
		DECLARE cliente_id INT DEFAULT 0;
		DECLARE tarjeta_id INT DEFAULT 0;
		
		START TRANSACTION;
		
			SELECT COUNT(*) INTO existe_correo
				FROM clientes 
				WHERE correo = i_correo;
			
			IF existe_correo <> 0 THEN
				SELECT 'Tu correo ya ha sido registrado' INTO  o_respuesta;
			ELSE 
				INSERT INTO clientes VALUES (0, i_nombre, i_correo); 
				SELECT LAST_INSERT_ID() INTO cliente_id;
			
			
				INSERT INTO tarjetas 
					VALUES (0, cliente_id, AES_ENCRYPT(i_tarjeta, cliente_id));
				SELECT LAST_INSERT_ID() INTO tarjeta_id;
				
				INSERT INTO servicios 
					VALUES (0, cliente_id, tarjeta_id, i_suscripcion);
			
				SELECT 'Servicio almacenado con éxito' INTO o_respuesta;
			END IF;
		COMMIT;
	END //
	
DELIMITER ;
