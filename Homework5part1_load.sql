CREATE DATABASE IF NOT EXISTS homework5;

USE homework5;

DROP TABLE IF EXISTS cars_load;
CREATE TABLE cars_load
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);


LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/test_db_csv.txt" 
INTO TABLE cars_load
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;
SELECT *
FROM cars;

-- 1. Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов

CREATE OR REPLACE VIEW cheap_cars
AS SELECT 
	id,
	`name`,
	cost
FROM cars
WHERE cost <= 25000;

SELECT * FROM cheap_cars;

-- 2.	Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) 

ALTER VIEW cheap_cars AS 
 SELECT 
	id,
	`name`,
	cost
FROM cars
WHERE cost <= 30000;

SELECT * FROM cheap_cars;

-- 3. Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”

CREATE OR REPLACE VIEW skoda_audi
AS SELECT 
	id,
	`name`,
	cost
FROM cars
WHERE `name` = "Audi" OR `name` = "Skoda" ;

SELECT * FROM skoda_audi;