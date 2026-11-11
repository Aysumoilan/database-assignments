-- ===== ASSIGNMENT 1 =====
SELECT * FROM Customers;
SELECT FirstName, LastName, Country FROM Customers;

SELECT CustomerID, FirstName, LastName, Country
FROM Customers
WHERE Country = 'Germany';

SELECT FirstName, LastName, Country, Score
FROM Customers
WHERE Score >= 300 AND Country IN ('Germany', 'France');

SELECT ProductID, Product, Category, Price
FROM Products
ORDER BY Price DESC;

SELECT Product, Price
FROM Products
WHERE Price BETWEEN 50 AND 300;

SELECT Product, Category
FROM Products
WHERE Product LIKE '%Phone%';

SELECT DISTINCT Category
FROM Products
ORDER BY Category;

SELECT o.OrderID, c.FirstName, c.LastName
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID;

SELECT OrderStatus, COUNT(*) AS OrderCount, SUM(Sales) AS TotalSales
FROM Orders
GROUP BY OrderStatus
ORDER BY TotalSales DESC;

INSERT INTO Products VALUES (999, 'Test Product', 'Test', 10);
UPDATE Products SET Price = 20 WHERE ProductID = 999;
SELECT * FROM Products WHERE ProductID = 999;
DELETE FROM Products WHERE ProductID = 999;


SELECT FirstName, LastName, Country, Score
FROM Customers
WHERE Score > 500
ORDER BY Score DESC;

SELECT FirstName, LastName, Country, Score
FROM Customers
WHERE Country IN ('Germany', 'France', 'USA') AND Score >= 300;

SELECT c.FirstName || ' ' || c.LastName AS Customer,
       o.OrderID, o.OrderDate, o.Sales
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID;

SELECT c.CustomerID, c.FirstName, c.LastName, c.Country
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;

SELECT c.FirstName || ' ' || c.LastName AS Customer,
       SUM(o.Sales) AS TotalSales
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY TotalSales DESC;

SELECT c.FirstName || ' ' || c.LastName AS Customer,
       SUM(o.Sales) AS TotalSales
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
HAVING SUM(o.Sales) > 1000;

SELECT c.FirstName || ' ' || c.LastName AS Customer,
       c.Country,
       SUM(o.Sales) AS TotalSales
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName, c.Country
ORDER BY TotalSales DESC
LIMIT 5;

INSERT INTO Orders VALUES (105, 104, 4, 13, '2026-10-20', NULL, 'Pending', 'Paris, Rue 7', 'Paris, Rue 7', 3, 36, '2026-10-20 12:00:00');
INSERT INTO Orders VALUES (110, 101, 1, 11, '2026-10-25', NULL, 'Pending', 'Old Address', 'Baku, Nizami 10', 1, 55, '2026-10-25 13:00:00');
INSERT INTO Orders VALUES (999, 104, 2, 12, '2026-10-30', NULL, 'Pending', 'Test', 'Test', 1, 12, '2026-10-30 10:00:00');

-- ===== ASSIGNMENT 2 =====

SELECT OrderID, CustomerID, OrderDate, ShipDate, OrderStatus
FROM Orders
WHERE OrderDate BETWEEN '2026-10-01' AND '2026-10-31';

SELECT * FROM Orders
WHERE OrderStatus = 'Pending'
ORDER BY OrderDate ASC;

SELECT o.OrderID, c.FirstName || ' ' || c.LastName AS Customer,
       o.OrderDate, o.ShipDate
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE julianday(o.ShipDate) - julianday(o.OrderDate) > 7;

SELECT DISTINCT c.FirstName, c.LastName, c.Country
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE julianday(o.ShipDate) - julianday(o.OrderDate) > 7;

SELECT * FROM Orders WHERE OrderID = 105;
UPDATE Orders
SET OrderStatus = 'Shipped', ShipDate = '2026-11-05'
WHERE OrderID = 105;

SELECT * FROM Orders WHERE OrderID = 110;
UPDATE Orders
SET ShipAddress = '45 Main Street, Baku'
WHERE OrderID = 110;

SELECT * FROM Orders WHERE OrderID = 999;
DELETE FROM Orders WHERE OrderID = 999;

SELECT OrderStatus, COUNT(*) AS OrderCount
FROM Orders
GROUP BY OrderStatus;

SELECT c.FirstName || ' ' || c.LastName AS Customer,
       o.OrderDate, o.OrderStatus
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE o.ShipDate IS NULL;

-- ===== ASSIGNMENT 3 =====

SELECT Product, Category, Price
FROM Products
WHERE Price BETWEEN 50 AND 300
ORDER BY Price ASC;

SELECT * FROM Products
WHERE Category = 'Electronics' AND Price > 500;

SELECT p.Product, p.Category, o.Quantity, o.Sales
FROM Products p
INNER JOIN Orders o ON p.ProductID = o.ProductID;

SELECT p.Product, SUM(o.Quantity) AS TotalQuantity
FROM Products p
INNER JOIN Orders o ON p.ProductID = o.ProductID
GROUP BY p.ProductID, p.Product
ORDER BY TotalQuantity DESC
LIMIT 5;

SELECT p.ProductID, p.Product, p.Category
FROM Products p
LEFT JOIN Orders o ON p.ProductID = o.ProductID
WHERE o.OrderID IS NULL;

SELECT e.FirstName || ' ' || e.LastName AS Employee,
       e.Department,
       SUM(o.Sales) AS TotalSales
FROM Employees e
INNER JOIN Orders o ON e.EmployeeID = o.SalesPersonID
GROUP BY e.EmployeeID, e.FirstName, e.LastName, e.Department;

SELECT e.FirstName || ' ' || e.LastName AS Employee,
       SUM(o.Sales) AS TotalSales
FROM Employees e
INNER JOIN Orders o ON e.EmployeeID = o.SalesPersonID
GROUP BY e.EmployeeID, e.FirstName, e.LastName
HAVING SUM(o.Sales) > 5000
ORDER BY TotalSales DESC;

INSERT INTO Products (ProductID, Product, Category, Price)
VALUES (501, 'Wireless Keyboard', 'Electronics', 75);

UPDATE Products SET Price = 90 WHERE ProductID = 501;

ALTER TABLE Products ADD COLUMN StockQuantity INTEGER;

SELECT FirstName, LastName FROM Customers
UNION
SELECT FirstName, LastName FROM Employees;

SELECT p.Category,
       SUM(o.Quantity) AS TotalQuantity,
       SUM(o.Sales) AS TotalSales
FROM Products p
INNER JOIN Orders o ON p.ProductID = o.ProductID
GROUP BY p.Category
HAVING SUM(o.Sales) > 2000
ORDER BY TotalSales DESC;

