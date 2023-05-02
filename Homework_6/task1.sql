USE lesson3;
-- 1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DROP FUNCTION IF EXISTS get_time;
DELIMITER //
CREATE FUNCTION get_time(seconds INT)
RETURNS VARCHAR(45)
DETERMINISTIC 
BEGIN
	DECLARE resalt VARCHAR(45);
    DECLARE days INT default 0;
    DECLARE hours INT default 0;
    DECLARE minutes INT default 0;
    WHILE seconds >= 60 DO
		IF seconds >= 86400 THEN
			SET days = floor(seconds / 86400) ;
			SET seconds = seconds Mod 86400;
		ELSEIF  seconds >= 3600 THEN 
			SET hours = floor(seconds / 3600) ;
			SET seconds = seconds Mod 3600;
		ELSEIF  seconds >= 60 THEN 
			SET minutes = floor(seconds / 60) ;
			SET seconds = seconds Mod 60;
		END IF;
	END WHILE;
    SET resalt = CONCAT(days," days ", hours," hours ", minutes," minutes ", seconds, " seconds "); 
RETURN resalt;
END //
SELECT get_time(123456) AS "time";

