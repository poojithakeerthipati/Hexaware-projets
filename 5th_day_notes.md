## TASK-1

### Find the average commision of a saleman from Paris

```sql
select avg(commission) 
from salesman 
where city='Paris';
```

## Task 2
### Find out if there are cities with only one salesman and list them | No nulls
- Clue: Having

```sql
Select City, COUNT(salesman_id) as No_Sales_Person 
from salesman
Where city is not Null
Group by city
Having COUNT(salesman_id) = 1;
```


## Task 3.1
### Determine the maximum commission in each city | No nulls

```sql
select city,max(commission) 
from salesman
where city is not null
group by city;
```
 

## Task 3.2
### and list the salesmen who earn this commission
- Clue: Join | Sub-query

```sql
SELECT name,commission, city
FROM salesman A
WHERE commission = (
    SELECT MAX(B.commission)
    FROM salesman B
    WHERE A.city = B.city
);

```

## Task 4 - Sub-Query
### Write a query to display all the orders from the orders table issued by the salesman 'Paul Adam'.
 

```sql
Select * 
from orders
where salesman_id = (Select salesman_id
from salesman
where name = 'Paul Adam')
 ```
 
## Task 5
### Write a query to display all the orders which values are greater than the average order value for 10th October 2012
 
## Task 5.1
### Find the average order value for 10th October 2012
 

```sql
SELECT * FROM ORDERS 
SELECT AVG(purch_amt)
	FROM ORDERS
	WHERE ord_date = '2012-10-10'

select * from salesman; 
select * from orders
```

## TASK-7
### WRITE A QUERY TO FIND ALL ORDERS ATTRIBUTED TO A SALESMAN IN NEW YORK

```sql
SELECT * FROM ORDERS
WHERE SALESMAN_ID IN (SELECT SALESMAN_ID FROM SALESMAN
WHERE CITY LIKE 'PARIS');
```


## Task 8 
### Write a query to find the name and id of all salesmen who had more than one customer
```sql
SELECT * FROM SALESMAN;
SELECT * FROM ORDERS;
SELECT * FROM CUSTOMER;

SELECT * FROM SALESMAN WHERE SALESMAN_ID IN (SELECT SALESMAN_ID
FROM CUSTOMER 
GROUP BY SALESMAN_ID
HAVING COUNT(CUSTOMER_ID)>1)
;
```
## TASK-9

### --WRITE A QUERY TO DISPLAY ONLY THOSE CUSTOMERS 
### --WHOSE GRADE ARE IN FACT HIGHER THAN EVERY CUSTOMER IN NEW YORK
### --ALL & ANY

```sql
SELECT CUST_NAME 
FROM CUSTOMER
WHERE GRADE > ALL(SELECT GRADE 
FROM CUSTOMER
WHERE CITY = 'NEW YORK');
```

## TASK-10

### -- Write a query to find all orders with an amount smaller than any amount for a customer in London.

```sql
SELECT * 
FROM ORDERS
WHERE PURCH_AMT < ANY(SELECT PURCH_AMT 
			FROM ORDERS
			WHERE CUSTOMER_ID IN (SELECT CUSTOMER_ID 
						FROM CUSTOMER
						WHERE CITY LIKE 'LONDON'));
```