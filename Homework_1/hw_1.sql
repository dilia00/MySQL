# 1.Создайте таблицу с мобильными телефонами, используя графический интерфейс. 
# Заполните БД данными. Добавьте скриншот на платформу в качестве ответа на ДЗ
DROP TABLE  IF  EXISTS phone;
CREATE DATABASE IF NOT EXISTS homework1;
USE homework1;

CREATE TABLE IF NOT EXISTS phone
(
	Id INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(45),  
    Manufacturer VARCHAR(45),
    ProductCount INT,
    Price INT
);

INSERT phone (ProductName,Manufacturer,ProductCount,Price)
VALUES 
	("iPhone X","Apple", 3, 76000), 
	("iPhone 8","Apple", 2, 51000), 
    ("Galaxy S9","Samsung", 2, 56000), 
    ("Galaxy S8","Samsung", 1, 41000), 
    ("P20 Pro","Huawei", 5, 36000);
    
SELECT *
FROM phone;

# 2.Выведите название, производителя и цену для товаров, количество которых превышает 2
SELECT ProductName, Manufacturer, Price
FROM phone
WHERE ProductCount > 2;

# 3.Выведите весь ассортимент товаров марки “Samsung”
SELECT ProductName, Manufacturer, Price
FROM phone
WHERE Manufacturer = "Samsung";

# 4.Выведите информацию о телефонах, где суммарный чек больше 100 000 и меньше 145 000
SELECT ProductName, Manufacturer, Price
FROM phone
WHERE ProductCount * Price BETWEEN 100000 AND 145000;

# 4.*** С помощью регулярных выражений найти (можно использовать операторы “LIKE”, “RLIKE” для 4.3 ):
	# 4.1.Товары, в которых есть упоминание "Iphone"
SELECT ProductName, Manufacturer, Price
FROM phone
WHERE ProductName LIKE "iPhone _";

	# 4.2."Galaxy"
SELECT ProductName, Manufacturer, Price
FROM phone
WHERE ProductName LIKE "Galaxy %";

	# 4.3.Товары, в которых есть ЦИФРЫ
SELECT ProductName, Manufacturer, Price
FROM phone
WHERE ProductName RLIKE "[0-9]";

	# 4.4.Товары, в которых есть ЦИФРА "8"
SELECT ProductName, Manufacturer, Price
FROM phone
WHERE ProductName RLIKE "[8]";