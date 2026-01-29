CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    segment VARCHAR(20)
);

INSERT INTO customers VALUES
(1, 'Ali', 'Tashkent', 'Consumer'),
(2, 'Vali', 'Almaty', 'Corporate'),
(3, 'John', 'Bishkek', 'Consumer'),
(4, 'Anna', 'Tashkent', 'Home Office');


CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    sales DECIMAL(10,2),
    profit DECIMAL(10,2)
);

INSERT INTO orders VALUES
(101, 1, '2024-01-10', 500, 120),
(102, 1, '2024-01-15', 800, 200),
(103, 2, '2024-01-12', 400, -50),
(104, 3, '2024-01-18', 1000, 300),
(105, 5, '2024-01-20', 600, 100); 


CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_method VARCHAR(20)
);

INSERT INTO payments VALUES
(1, 101, 'Card'),
(2, 102, 'Cash'),
(3, 104, 'Card');


CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    sub_category VARCHAR(50)
);

INSERT INTO products VALUES
(1001, 'Laptop Lenovo', 'Technology', 'Computers'),
(1002, 'Office Chair', 'Furniture', 'Chairs'),
(1003, 'Printer HP', 'Technology', 'Printers'),
(1004, 'Notebook', 'Office Supplies', 'Paper');



--1
SELECT o.order_id, c.customer_name, c.city, o.sales FROM orders AS o
INNER JOIN customers AS c
 ON o.customer_id=c.customer_id;

--2
SELECT o.order_id, o.sales, p.payment_method FROM orders AS o
INNER JOIN payments AS p
	ON o.order_id = p.order_id;

--3
SELECT o.order_id, c.customer_name, c.city, o.sales, p.payment_method FROM orders o
INNER JOIN customers c ON c.customer_id=o.customer_id
INNER JOIN payments p ON p.order_id=o.order_id;

--
--
--

--1
SELECT o.order_id, c.customer_name, c.city, o.sales, p.payment_method FROM orders o
INNER JOIN customers c ON o.customer_id=c.customer_id
INNER JOIN payments p ON o.order_id=p.order_id;


--2
SELECT o.order_id, c.customer_name, c.segment, o.sales, p.payment_method FROM orders o
INNER JOIN customers c ON o.customer_id=c.customer_id
INNER JOIN payments p ON o.order_id=p.order_id;

--Aralash jadvalli savollar

--1
SELECT o.order_id, u.full_name, u.country, o.total_amount, p.payment_type FROM orders o
INNER JOIN users u ON o.user_id=u.user_id
INNER JOIN payments p ON o.order_id=p.order_id;

--2
SELECT s.student_name, s.level, c.course_name, c.price FROM students s
INNER JOIN enrollments e ON s.student_id=e.student_id
INNER JOIN courses c ON e.course_id=c.course_id;

--3
SELECT e.employee_name, d.department_name, s.salary FROM employees e
INNER JOIN departments d ON e.department_id=d.department_id
INNER JOIN salaries s ON e.employee_id=s.employee_id;

--4
SELECT l.lead_name, l.source, c.contact_date, d.deal_amount FROM leads l
LEFT JOIN contacts c ON l.lead_id=c.lead_id
LEFT JOIN deals d ON l.lead_id=d.lead_id;

--5
SELECT sh.shipment_id, sh.shipment_date, c.carrier_name, d.status FROM shipments sh
LEFT JOIN carriers c ON sh.carrier_id=c.carrier_id
LEFT JOIN delivery_status d ON sh.shipment_id=d.shipment_id;

--6
SELECT c.client_name, a.account_id, a.balance, t.amount FROM accounts a
LEFT JOIN clients c ON a.client_id=c.client_id
LEFT JOIN transactions t ON a.account_id=t.account_id













