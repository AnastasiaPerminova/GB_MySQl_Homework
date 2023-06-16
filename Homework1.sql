CREATE DATABASE IF NOT EXISTS Homework1;

USE Homework1;

DROP TABLE IF EXISTS phones; 

CREATE TABLE phones
(
	Id INT PRIMARY KEY AUTO_INCREMENT, 
	ProductName VARCHAR(45),
    Manufacturer VARCHAR(45),
    ProductCount INT,
    Price  INT
);

INSERT phones (ProductName, Manufacturer, ProductCount, Price ) 
VALUES 
	("iPhone X", "Apple", 3, 76000),
    ("iPhone 8", "Apple", 2, 51000),
    ("Galaxy S9", "Samsung", 2, 56000),
    ("Galaxy S8", "Samsung", 1, 41000),
    ("P20 Pro", "Huawei", 5, 36000);
	

SELECT * FROM phones;

SELECT ProductName, Manufacturer, Price
FROM phones
WHERE ProductCount = 2;

SELECT ProductName
FROM phones
WHERE Manufacturer = "Samsung";

SELECT ProductName, Manufacturer, ProductCount, Price
FROM phones
WHERE  Price * ProductCount  BETWEEN 100000 AND 145000; 

SELECT ProductName, Manufacturer, Price
FROM phones
WHERE ProductName LIKE "iPhone%";

SELECT ProductName, Manufacturer, Price
FROM phones
WHERE ProductName LIKE "Galaxy%";

SELECT ProductName, Manufacturer, Price
FROM phones
WHERE ProductName RLIKE "[0-9]";

SELECT ProductName, Manufacturer, Price
FROM phones
WHERE ProductName RLIKE "[8]";




