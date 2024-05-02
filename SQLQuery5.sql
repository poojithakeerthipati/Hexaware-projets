CREATE TABLE EmployeeSales (
    EmployeeID INT,
    Region VARCHAR(50),
    Category VARCHAR(50),
    Quarter VARCHAR(10),
    SalesAmount DECIMAL(10,2)
);
 
INSERT INTO EmployeeSales (EmployeeID, Region, Category, Quarter, SalesAmount)
VALUES
    (101, 'North', 'Electronics', 'Q1', 1200.00),
    (101, 'North', 'Electronics', 'Q2', 1500.00),
    (102, 'North', 'Clothing', 'Q1', 800.00),
    (102, 'North', 'Clothing', 'Q2', 950.00),
    (103, 'South', 'Electronics', 'Q1', 1000.00),
    (103, 'South', 'Clothing', 'Q1', 1200.00),
    (104, 'East', 'Electronics', 'Q2', 1150.00),
    (104, 'East', 'Clothing', 'Q2', 500.00),
    (105, 'West', 'Electronics', 'Q1', 1900.00),
    (105, 'West', 'Clothing', 'Q1', 1100.00),
    (105, 'West', 'Electronics', 'Q2', 2100.00),
    (105, 'West', 'Clothing', 'Q2', 1300.00);

SELECT * FROM EmployeeSales;

--- compound sort
SELECT * 
FROM EmployeeSales 
ORDER BY Region,SalesAmount DESC;

SELECT * 
FROM EmployeeSales 
ORDER BY Category,SalesAmount DESC;


-- year to date sale - 1st day of financial year to today
-- today (How much sales?)

SELECT REGION,CATEGORY,SUM(SALESAMOUNT) AS YEAR_TO_DATE 
FROM EmployeeSales
GROUP BY REGION,Category
ORDER BY REGION,Category DESC ;

SELECT REGION,Quarter,SUM(SALESAMOUNT) 
FROM EmployeeSales
GROUP BY REGION,Quarter;


-- GROUPING SETS
-- -R-C , R-Q , R,Q


SELECT * FROM EmployeeSales;

SELECT REGION, CATEGORY , [QUARTER] ,SUM(SALESAMOUNT) 
FROM EmployeeSales
GROUP BY GROUPING SETS(
	(REGION , CATEGORY),
	(REGION , [QUARTER]),Region,Category
)
ORDER BY GROUPING(REGION),GROUPING(CATEGORY) , GROUPING([QUARTER]);