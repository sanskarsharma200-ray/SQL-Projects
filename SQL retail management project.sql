CREATE DATABASE IF NOT EXISTS SQL_basics;
USE SQL_basics;
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS product;
CREATE TABLE IF NOT EXISTS product (
    product_code INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10,2),
    stock INT,
    category VARCHAR(50)
);
CREATE TABLE IF NOT EXISTS customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    customer_location VARCHAR(50),
    customer_phone VARCHAR(15)
);
CREATE TABLE IF NOT EXISTS sales (
    sale_date DATE,
    order_number VARCHAR(10) PRIMARY KEY,
    product_code INT,
    product_name VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2)
);
INSERT INTO product VALUES
(1, 'tulip', 198, 5, 'perfume'),
(2, 'cornoto', 50, 21, 'icecream'),
(3, 'Pen', 10, 52, 'Stationary'),
(4, 'Lays', 10, 20, 'snacks'),
(5, 'mayanoise', 90, 10, 'dip'),
(6, 'jam', 105, 10, 'spread'),
(7, 'shampoo', 5, 90, 'hair product'),
(8, 'axe', 210, 4, 'perfume'),
(9, 'park avenue', 901, 2, 'perfume'),
(10, 'wattagirl', 201, 3, 'perfume'),
(11, 'pencil', 4, 10, 'Stationary'),
(12, 'sharpener', 5, 90, 'Stationary'),
(13, 'sketch pen', 30, 10, 'Stationary'),
(14, 'tape', 15, 30, 'Stationary'),
(15, 'paint', 60, 12, 'Stationary'),
(16, 'chocolate', 25, 50, 'snacks'),
(17, 'biscuits', 60, 26, 'snacks'),
(18, 'mango', 100, 21, 'fruits'),
(19, 'apple', 120, 9, 'fruits'),
(20, 'kiwi', 140, 4, 'fruits'),
(21, 'carrot', 35, 12, 'vegetable'),
(22, 'onion', 22, 38, 'vegetable'),
(23, 'tomato', 21, 15, 'vegetable'),
(24, 'serum', 90, 4, 'hair product'),
(25, 'conditioner', 200, 5, 'hair product'),
(26, 'oil bottle', 40, 2, 'kitchen utensil');
INSERT INTO customer VALUES
(1111, 'Nisha', 'Kerala', '8392320'),
(1212, 'Oliver', 'Kerala', '4353891'),
(1216, 'Nila', 'Delhi', '3323242'),
(1246, 'Vignesh', 'Chennai', '1111212'),
(1313, 'Shiny', 'Maharashtra', '5454543'),
(1910, 'Mohan', 'Mumbai', '9023941'),
(2123, 'Biyush', 'Bombay', '1253358'),
(3452, 'Alexander', 'West Bengal', '1212134'),
(3921, 'Mukesh', 'Manipur', '4232321'),
(5334, 'Christy', 'Pakistan', '2311111'),
(9021, 'Rithika', 'Kashmir', '1121344'),
(9212, 'Jessica', 'Bangalore', '1233435'),
(9875, 'Stephen', 'Chennai', '1212133');
INSERT INTO sales VALUES
('2016-07-24', 'HM06', 11, 'pencil', 3, 30),
('2016-10-19', 'HM09', 17, 'biscuits', 10, 600),
('2016-10-30', 'HM10', 2, 'cornoto', 10, 500),
('2018-04-12', 'HM03', 20, 'kiwi', 3, 420),
('2018-05-02', 'HM05', 20, 'kiwi', 2, 280),
('2018-09-20', 'HM08', 16, 'chocolate', 2, 50),
('2019-01-11', 'HM07', 19, 'apple', 5, 600),
('2019-03-15', 'HM01', 5, 'mayanoise', 4, 360),
('2021-02-10', 'HM04', 25, 'conditioner', 5, 1000),
('2021-02-12', 'HM02', 3, 'Pen', 2, 20);
ALTER TABLE sales ADD COLUMN S_no INT, ADD COLUMN categories VARCHAR(50);
ALTER TABLE product MODIFY stock VARCHAR(20);
DROP TABLE IF EXISTS customer_details;
RENAME TABLE customer TO customer_details;
ALTER TABLE sales DROP COLUMN S_no, DROP COLUMN categories;
SELECT order_number AS order_id, sale_date AS order_date, price, quantity FROM sales;
SELECT * FROM product WHERE category = 'Stationary';
SELECT DISTINCT category FROM product;
SELECT * FROM sales WHERE quantity > 2 AND price < 500;
SELECT customer_name FROM customer_details WHERE customer_name LIKE '%a';
SELECT * FROM product ORDER BY price DESC;
SELECT category, product_code
FROM product
WHERE category IN (
    SELECT category FROM product GROUP BY category HAVING COUNT(category) >= 2
);
SELECT sales.order_number, customer_details.customer_name
FROM sales, customer_details;
