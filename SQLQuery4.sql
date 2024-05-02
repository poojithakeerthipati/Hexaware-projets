CREATE TABLE Products (
    ProductID INT,
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    InStock CHAR(3)
);
 
INSERT INTO Products (ProductID, ProductName, Category, InStock) VALUES
(1, 'Laptop', 'Electronics', 'Yes'),
(2, 'Smartphone', 'Electronics', 'No'),
(3, 'Coffee Maker', 'Appliances', 'Yes'),
(4, 'Blender', 'Appliances', 'Yes'),
(5, 'T-shirt', 'Apparel', 'No');

CREATE TABLE Orders (
    OrderID INT,
    ProductID INT,
    CustomerName VARCHAR(50),
    Quantity INT
);
 
INSERT INTO Orders (OrderID, ProductID, CustomerName, Quantity) VALUES
(100, 1, 'Alice', 1),
(101, 3, 'Bob', 2),
(102, 2, 'Charlie', 1),
(103, 4, 'Dana', 1),
(104, 3, 'Alice', 1);

-- TASK-1
-- LIST ALL DISTINCT PRODUCTS THAT ARE EITHER IN STOCK OR HAVE BEEN ORDERED
-- CLUE : SUB-QUERY

SELECT PRODUCTNAME FROM PRODUCTS WHERE InStock = 'YES'
UNION
SELECT PRODUCTNAME FROM PRODUCTS WHERE ProductID IN(SELECT ProductID FROM ORDERS);


SELECT * FROM ORDERS;

-- TASK-2
-- IDENTIFY THE PRODUCTS THAT ARE BOTH IN STOCK AND HAVE BEEN ORDERED

SELECT PRODUCTNAME FROM PRODUCTS WHERE InStock = 'YES'
INTERSECT
SELECT PRODUCTNAME FROM PRODUCTS WHERE ProductID IN(SELECT ProductID FROM ORDERS);

--TASK-3
--FIND THE PRODUCTS THAT ARE IN STOCK BUT HAVE NEVER BEEN ORDERED

SELECT PRODUCTNAME FROM PRODUCTS WHERE InStock = 'YES'
EXCEPT
SELECT PRODUCTNAME FROM PRODUCTS WHERE ProductID IN(SELECT ProductID FROM ORDERS);

CREATE DATABASE GROUPSETS;