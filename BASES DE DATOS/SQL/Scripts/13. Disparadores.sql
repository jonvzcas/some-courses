/*
 * DELIMITER //
 * 
 * CREATE TRIGGER nombre_disparador
 * 	[BEFORE | AFTER]
 * 	[INSERT | UPDATE | DELETE]
 *  ON nombre_tabla
 * 	FOR EACH NOW
 * BEGIN
 * END //
 * 
 * DELIMITER ;
 */

DELIMITER //
  
 CREATE TRIGGER tg_actividad_clientes
 	AFTER INSERT
 	ON clientes
 	FOR EACH ROW
 	
 BEGIN
	 ## De esta forma se estaria almacenando el disparador
	 INSERT INTO actividad_clientes VALUES (0, NEW.cliente_id, NOW());
END //
  
DELIMITER ;

/*
 * De donde se obtiene el id del cliente?
 * A través del objeto NEW obtiene el valor que se inserto y que origino la ejecución del disparador
 * NOW permite obtener la fecha y la hora actual
 * */

SHOW TRIGGERS FROM curso_sql; 
DROP TRIGGER tg_actividad_clientes;

