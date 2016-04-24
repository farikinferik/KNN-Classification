DELIMITER $$

CREATE TRIGGER `knn_classification`.`coba` BEFORE DELETE 
    ON `knn_classification`.`<Table Name>`
    FOR EACH ROW 
    BEGIN
	DECLARE done INTEGER DEFAULT FALSE;
	DECLARE juml INTEGER;
	DECLARE id INTEGER;
	DECLARE cur CURSOR FOR SELECT COUNT(term_freq.id_doc), term_freq.id_term 
	FROM term_freq 
	LEFT JOIN all_terms 
	ON term_freq.id_term = all_terms.id_term 
	WHERE term_freq.id_term 
	IN (SELECT id_term FROM term_freq WHERE id_doc = OLD.id_doc) GROUP BY term_freq.id_term;
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	OPEN cur;
	read_loop: LOOP 
		FETCH cur INTO juml, id;
		IF juml = 1 THEN
			DELETE FROM all_terms 
			WHERE id_term = id;
		END IF;
	END LOOP;
	CLOSE cur;	
    END$$

DELIMITER ;