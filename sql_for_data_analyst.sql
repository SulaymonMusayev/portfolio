CREATE TABLE orders (
    order_id VARCHAR(20),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(20),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    region VARCHAR(50),
    product_id VARCHAR(25),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(200),
    sales DECIMAL(10,2),
    quantity INT,
    profit DECIMAL(10,4),
    returns INT,
    payment_method VARCHAR(50)
);

INSERT INTO orders
(order_id, order_date, ship_date, ship_mode, customer_id, customer_name, segment, country, city, state, region, product_id, category, sub_category, product_name, sales, quantity, profit, returns, payment_method)
VALUES
('ORD001', '2024-01-10', '2024-01-15', 'Standard', 'C001', 'Ali', 'Consumer', 'Uzbekistan', 'Tashkent', 'Tashkent', 'Central', 'P001', 'Technology', 'Phone', 'Smartphone X', 1200.50, 2, 200.00, 0, 'Card'),
('ORD002', '2024-01-12', '2024-01-17', 'Express', 'C002', 'Vali', 'Corporate', 'Kazakhstan', 'Almaty', 'Almaty', 'East', 'P002', 'Furniture', 'Chair', 'Office Chair', 800.00, 5, 150.00, 0, 'Cash'),
('ORD003', '2024-01-15', '2024-01-20', 'Standard', 'C003', 'Hasan', 'Home Office', 'Uzbekistan', 'Samarkand', 'Samarkand', 'Central', 'P003', 'Office Supplies', 'Paper', 'Printer Paper', 150.00, 10, 20.00, 0, 'Card'),
('ORD004', '2024-01-18', '2024-01-22', 'Express', 'C001', 'Ali', 'Consumer', 'Uzbekistan', 'Tashkent', 'Tashkent', 'Central', 'P004', 'Technology', 'Laptop', 'Laptop Pro', 2500.00, 1, 400.00, 0, 'Bank Transfer'),
('ORD005', '2024-01-20', '2024-01-25', 'Standard', 'C002', 'Vali', 'Corporate', 'Kazakhstan', 'Almaty', 'Almaty', 'East', 'P005', 'Furniture', 'Desk', 'Office Desk', 1800.00, 2, 300.00, 0, 'Card');


--1
SELECT customer_name, sales FROM orders


--2
SELECT customer_name, order_date FROM orders


--3
SELECT customer_name, sales, product_name FROM orders


--4
SELECT customer_name, sales, city FROM orders


--5
SELECT customer_name, sales FROM orders
WHERE sales>1000;


--6
SELECT customer_name, sales, city FROM orders
WHERE sales>1000 and city='Tashkent';


--7
SELECT customer_name, sales, product_name FROM orders
WHERE sales>1000 OR quantity>3;


--8
SELECT customer_name, sales, city, quantity FROM orders
WHERE sales>500 and city='Almaty' and quantity>2;


--9
SELECT customer_name, sales FROM orders
ORDER BY sales DESC;


--10
SELECT customer_name, sales, city FROM orders
ORDER BY city ASC, sales DESC;


--11
SELECT customer_name, sales, quantity FROM orders
WHERE sales>500
ORDER BY quantity DESC, sales ASC;


--12
SELECT customer_name, SUM(sales) AS total_sales, COUNT(*) AS number_of_orders FROM orders
GROUP BY customer_name
HAVING SUM(sales)>500
ORDER BY total_sales DESC, number_of_orders DESC;

-
-
-
-
-

--1
SELECT customer_name, product_name, sales, city FROM orders

--2
SELECT order_id, order_date, ship_date, sales FROM orders

--3
SELECT customer_name client, sales order_amount, profit order_profit FROM orders

--4
SELECT DISTINCT city FROM orders

--5
SELECT DISTINCT city, segment FROM orders

--6
SELECT order_id, sales FROM orders
WHERE sales>500;

--7
SELECT customer_name, sales, order_date FROM orders
WHERE city='Tashkent';

--8
SELECT customer_name, sales, city FROM orders
WHERE city='Almaty' and sales>700;

--9
SELECT customer_name, sales, profit FROM orders
WHERE sales>1000 or profit>200;

--10
SELECT customer_name, sales FROM orders
WHERE sales BETWEEN 300 and 800;

--11
SELECT customer_name, city, sales FROM orders
WHERE city='Tashkent'or city='Almaty' or city='Bishkek';

--12
SELECT customer_name, sales FROM orders
ORDER BY sales DESC;

--13
SELECT customer_name, sales FROM orders
WHERE sales>500
ORDER BY sales DESC;

--14
SELECT customer_name, city, sales FROM orders
ORDER BY city ASC, sales DESC;

--15
SELECT customer_name, segment, sales, city FROM orders
WHERE sales>500 and segment='Consumer'
ORDER BY sales DESC;

--16
SELECT COUNT(*) AS cnt FROM orders;

--17
SELECT SUM(sales) AS total_sales FROM orders

--18
SELECT AVG(sales) AS average FROM orders

--19
SELECT city, SUM(sales) AS sales FROM orders
GROUP BY city;

--20
SELECT city, COUNT(*) FROM orders
GROUP BY city;

--21
SELECT city, SUM(sales) AS total_sales FROM orders
WHERE sales >500
GROUP BY city;

--22
SELECT segment, AVG(sales) AS avg_sales FROM orders
GROUP BY segment

--23
SELECT city, MAX(sales) AS max_sales FROM orders
GROUP BY city;

--24
SELECT city, MIN(sales) AS min_sales FROM orders
GROUP BY city;

--25
SELECT city, SUM(sales) AS sum_sales FROM orders
GROUP BY city
ORDER BY sum_sales DESC;

--26
SELECT city, SUM(sales) AS sum_sales FROM orders
GROUP BY city
HAVING SUM(sales)>1000;

--27
SELECT city, COUNT(*) AS cnt_orders FROM orders
GROUP BY city
HAVING COUNT(*)>5;

--28
SELECT segment, SUM(sales) AS sum_sales FROM orders
WHERE segment='Consumer'
GROUP BY segment
HAVING SUM(sales)>800;

--29
SELECT city,SUM(sales) AS sum_sales, COUNT(*) AS cnt, AVG(sales) FROM orders
GROUP BY city;

--30
SELECT city, SUM(sales) AS sum_sales FROM orders
GROUP BY city
HAVING SUM(sales)>1000
ORDER BY sum_sales DESC;

--31
SELECT customer_name, SUM(sales) AS total_sales FROM orders
GROUP BY customer_name;

--32
SELECT customer_name, SUM(quantity) total_orders FROM orders
GROUP BY customer_name;

--33
SELECT customer_name, SUM(sales) AS total_sales FROM orders
GROUP BY customer_name
HAVING SUM(sales)>500;

--34
SELECT customer_name, SUM(sales) AS total_sales FROM orders
GROUP BY customer_name
ORDER BY total_sales DESC;

--35
SELECT city, segment, SUM(sales) AS total_sales FROM orders
GROUP BY city, segment;

--36
SELECT city, payment_method, SUM(sales) AS total_sales FROM orders
GROUP BY city, payment_method;

--37
SELECT city, SUM(sales) AS total_sales FROM orders
GROUP BY city;

--38
SELECT city, SUM(profit) AS total_profit FROM orders
GROUP BY city
HAVING SUM(profit)>0;

--39
SELECT city, SUM(profit) FROM orders
GROUP BY city
HAVING SUM(profit)<0;

--40
SELECT customer_name, sales,
CASE 
 WHEN sales<500 THEN 'Low'
 WHEN sales<1000 THEN 'Medium'
 ELSE 'High'
END AS sales_category FROM orders;







