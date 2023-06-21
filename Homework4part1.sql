CREATE DATABASE IF NOT EXISTS Homework4;

USE Homework4;

CREATE TABLE `shops` (
	`id` INT,
    `shopname` VARCHAR (100),
    PRIMARY KEY (id)
);
CREATE TABLE `cats` (
	`name` VARCHAR (100),
    `id` INT,
    PRIMARY KEY (id),
    shops_id INT,
    CONSTRAINT fk_cats_shops_id FOREIGN KEY (shops_id)
        REFERENCES `shops` (id)
);

INSERT INTO `shops`
VALUES 
		(1, "Четыре лапы"),
        (2, "Мистер Зоо"),
        (3, "МурзиЛЛа"),
        (4, "Кошки и собаки");

INSERT INTO `cats`
VALUES 
		("Murzik",1,1),
        ("Nemo",2,2),
        ("Vicont",3,1),
        ("Zuza",4,3);
-- 1. Вывести всех котиков по магазинам по id (условие соединения shops.id = cats.shops_id)

SELECT
	c.id,
	c.`name`,
	s.shopname 

FROM cats c
JOIN shops s
ON c.shops_id = s.id;

-- 2. Вывести магазин, в котором продается кот “Мурзик” (попробуйте выполнить 2 способами)

SELECT
	c.id,
	c.`name`,
	s.shopname 

FROM cats c
JOIN shops s
ON c.shops_id = s.id
WHERE c.`name` = "Murzik";

SELECT
	murzik_cat.id,
	murzik_cat.`name`,
	s.shopname 

FROM (SELECT id, `name`, shops_id FROM cats
WHERE  `name` = "Murzik") murzik_cat 
JOIN shops s
ON murzik_cat.shops_id = s.id;

-- 3. Вывести магазины, в которых НЕ продаются коты “Мурзик” и “Zuza”

SELECT
	s.id,
    s.shopname 
	
FROM shops s
JOIN cats c
ON c.shops_id = s.id
WHERE c.`name` != "Murzik" AND  c.`name` != "Zuza"
ORDER BY s.id;



