
-- Task 1
-- Find the average commision of a saleman from Paris


select avg(commission) 
from salesman 
where city='Paris';

-- Task 2
-- Find out if there are cities with only one salesman and list them | No nulls
-- Clue: Having

Select City, COUNT(salesman_id) as No_Sales_Person 
from salesman
Where city is not Null
Group by city
Having COUNT(salesman_id) = 1;

-- Task 3.1
-- Determine the maximum commission in each city | No nulls

select city,max(commission) 
from salesman
where city is not null
group by city;

 
-- Task 3.2
--- and list the salesmen who earn this commission
-- Clue: Join | Sub-query

select * from salesman; 
select * from orders


SELECT name,commission, city
FROM salesman A
WHERE commission = (
    SELECT MAX(B.commission)
    FROM salesman B
    WHERE A.city = B.city
)
ORDER BY commission DESC;

-- SELF-JOIN : JOIN WITH THE SAME TABLE
SELECT O.NAME , O.CITY , O.COMMISSION
FROM salesman O
WHERE 
Select * from orders;
 
-- Task 4 - Sub-Query
-- Write a query to display all the orders from the orders table issued by the salesman 'Paul Adam'.
 

 
Select * 
from orders
where salesman_id = (Select salesman_id
from salesman
where name = 'Paul Adam')
 
 
-- Task 5
-- Write a query to display all the orders which values are greater than the average order value for 10th October 2012
 
-- Task 5.1
-- Find the average order value for 10th October 2012
 


SELECT * FROM ORDERS 
SELECT AVG(purch_amt)
	FROM ORDERS
	WHERE ord_date = '2012-10-10'


select * from salesman; 
select * from orders

--TASK-7
--WRITE A QUERY TO FIND ALL ORDERS ATTRIBUTED TO A SALESMAN IN NEW YORK

SELECT * FROM ORDERS
WHERE SALESMAN_ID IN (SELECT SALESMAN_ID FROM SALESMAN
WHERE CITY LIKE 'PARIS');

-- Task 8 
-- Write a query to find the name and id of all salesmen who had more than one customer

SELECT * FROM SALESMAN;
SELECT * FROM ORDERS;
SELECT * FROM CUSTOMER;

SELECT * FROM SALESMAN WHERE SALESMAN_ID IN (SELECT SALESMAN_ID
FROM CUSTOMER 
GROUP BY SALESMAN_ID
HAVING COUNT(CUSTOMER_ID)>1)
;

--ALL AND ANY

SELECT * 
FROM orders 
where purch_amt > All(
			SELECT purch_amt
			FROM orders
			where customer_id = 3005)
 
SELECT purch_amt
FROM orders
where customer_id = 3005

SELECT * FROM ORDERS;
SELECT * FROM CUSTOMER;


SELECT MAX(PURCH_AMT)
		FROM ORDERS 
		WHERE CUSTOMER_ID = 3005;

SELECT *
FROM ORDERS 
WHERE PURCH_AMT > (SELECT MAX(PURCH_AMT)
		FROM ORDERS 
		WHERE CUSTOMER_ID = 3005);



-- Top 3 Purc_Amt
-- Clue: Read Docs


SELECT *
FROM ORDERS
ORDER BY PURCH_AMT DESC
OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY;

SELECT *,FORMAT( ORD_DATE, 'D', 'en-gb' )  
FROM ORDERS ORDER BY PURCH_AMT DESC;

SELECT *,FORMAT( ORD_DATE, 'dd MMM yyyy' )  
FROM ORDERS ORDER BY PURCH_AMT DESC;

-- Modify the satement - Asking the new user - Top n orders

DECLARE @n INT = 5;
SELECT *,FORMAT( ORD_DATE, 'dd MMM yyyy' )  
FROM ORDERS ORDER BY PURCH_AMT DESC
OFFSET 0 ROWS  
FETCH NEXT @n ROWS ONLY;

CREATE DATABASE SETOPERATIONS;
USE SETOPERATIONS;

USE HEXAWARE;



