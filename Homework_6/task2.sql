USE lesson3;
-- 2. Выведите только четные числа от 1 до 10.
-- Пример: 2,4,6,8,10
DROP PROCEDURE IF EXISTS even_numbers;
DELIMITER //
CREATE PROCEDURE even_numbers
(
	IN inp_number INT -- N
)
BEGIN
	DECLARE n INT default 0; 
    DECLARE result VARCHAR(45) DEFAULT "";
    REPEAT
		SET n = n + 2; 
		SET result = CONCAT(result, n, ",");     
        UNTIL n >= 10 
	END REPEAT;
    SELECT result; -- Печать строчки с результатом 
END //

CALL even_numbers(10);