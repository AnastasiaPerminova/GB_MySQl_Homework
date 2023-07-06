-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней, часов, минут и секунд.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

CREATE DATABASE IF NOT EXISTS homework6;
USE homework6;

DROP FUNCTION IF EXISTS get_time;

DELIMITER $$
CREATE FUNCTION get_time
(
seconds INT
)
RETURNS VARCHAR(100)
DETERMINISTIC

BEGIN

	DECLARE seconds_1 INT;
	DECLARE minutes INT;
	DECLARE hours INT;
	DECLARE days INT;
    DECLARE result INT;
    
    SET seconds_1 = seconds % 60;
    SET result = seconds DIV 60;
    SET minutes = result % 60;
    SET result = result DIV 60;
    SET hours = result % 24;
    SET days = result DIV 24;
		
	RETURN CONCAT(days, " days ", hours, " hours " ,minutes, " minutes ", seconds_1, " seconds ");

END; $$

SELECT get_time(366);
SELECT get_time(2140575);


-- Выведите только четные числа от 1 до 10 (Через цикл).
-- Пример: 2,4,6,8,10
DROP PROCEDURE IF EXISTS print_even10;
DELIMITER //
CREATE PROCEDURE print_even10()
BEGIN
	DECLARE n INT;
    DECLARE result VARCHAR(45) DEFAULT "";
    SET n = 2;

	REPEAT
		SET result = CONCAT(result, n, "," );
        SET n = n + 2;
		UNTIL n > 10
	END REPEAT;
    SELECT result;
END //


CALL print_even10();

