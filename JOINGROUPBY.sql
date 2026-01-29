--1  Har bir maxsulotdan nechtadan va qanchadan buyurtma qilingan.
SELECT ProductName, SUM(Quantity) AS total_quantity, SUM(Quantity*Price) AS total_price FROM Products AS p
INNER JOIN OrderDetails AS o ON p.ProductId=o.ProductId
GROUP BY ProductName;

--2 Har bir maxsulot kategoriyasining o’rtacha narxi
SELECT CategoryName, AVG(Price) AS avg_price FROM Categories AS c
INNER JOIN Products AS p ON c.CategoryId=p.CategoryId
GROUP BY CategoryName;

--3 Har bir maxsulot kategoriyasidan nechtadan va  qanchadan buyurtma berilgan
SELECT CategoryName, SUM(Quantity) AS total_quantity, SUM(Quantity*Price) AS total_price FROM Categories AS c
INNER JOIN Products AS p ON c.CategoryId=p.CategoryId
INNER JOIN OrderDetails AS o ON p.ProductId=o.ProductId
GROUP BY CategoryName;

--4 Har bir davlatdan necha dollarlik buyurtma berilgan
SELECT Country, SUM(Price) AS total_price FROM Customers AS 
INNER JOIN Products AS p ON 



--5 Har bir mijoz necha dollarlik buyurtma qilgan
SELECT c.CustomerName, SUM(o.Quantity * p.Price) AS total_sum FROM Customers AS c
INNER JOIN Orders AS ord ON c.CustomerId = ord.CustomerId
INNER JOIN OrderDetails AS o ON ord.OrderId = o.OrderId
INNER JOIN Products AS p ON o.ProductId = p.ProductId
GROUP BY c.CustomerName;

--6  500$ dan  ko’p miqdordagi buyurtmanlarning qiymatlaribilan chiqarib bering
SELECT ProductName, SUM(p.Price*o.Quantity) AS total_sum FROM Products AS p
INNER JOIN OrderDetails AS o ON p.ProductId=o.ProductId
GROUP BY ProductName
HAVING SUM(p.Price*o.Quantity)>500;

--7  Har bir davlatdan nechtadan maxsulot yetkazib beriladi 
SELECT Country, SUM(ord.Quantity) AS total_quantity FROM Customers AS c
INNER JOIN Orders AS o ON c.CustomerId=o.CustomerId
INNER JOIN OrderDetails AS ord ON o.OrderId=ord.OrderId
GROUP BY Country;

--8  Har bir maxsulot yetkazib beruvchi nechtadan maxsulot yetkazib beradi;
SELECT SupplierName, SUM(Quantity) AS total_shipment FROM Suppliers AS s
INNER JOIN Products AS p ON p.SupplierId=s.SupplierId
INNER JOIN OrderDetails AS ord ON ord.ProductId=p.ProductId
GROUP BY SupplierName;

--8
SELECT s.SupplierName, COUNT(p.ProductID) AS total_products FROM Suppliers AS s
INNER JOIN Products AS p ON p.SupplierId = s.SupplierId
GROUP BY s.SupplierName;





