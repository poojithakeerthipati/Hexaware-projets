# EXCERCISE - 9

## Queries with expressions

### List all movies and their combined sales in millions of dollars

sql
SELECT DISTINCT TITLE , (DOMESTIC_SALES+INTERNATIONAL_SALES)/1000000 AS COMBINED_SALES 
FROM MOVIES 
INNER JOIN BOXOFFICE ON MOVIES.ID = BOXOFFICE.MOVIE_ID ;


### List all movies and their ratings in percent

sql
SELECT DISTINCT TITLE , (RATING*10) AS RAT 
FROM MOVIES 
INNER JOIN BOXOFFICE ON MOVIES.ID = BOXOFFICE.MOVIE_ID ;


### List all movies that were released on even number years

sql
SELECT DISTINCT TITLE
FROM MOVIES 
INNER JOIN BOXOFFICE ON MOVIES.ID = BOXOFFICE.MOVIE_ID 
WHERE YEAR %2==0;


# EXCERCISE - 10

## Queries with aggregates (Pt. 1)

### Find the longest time that an employee has been at the studio

sql
SELECT ROLE,MAX(YEARS_EMPLOYED) AS TIME FROM employees;


### For each role, find the average number of years employed by employees in that role

sql
SELECT *,AVG(YEARS_EMPLOYED) FROM employees GROUP BY ROLE;


### Find the total number of employee years worked in each building

sql
SELECT *,sum(YEARS_EMPLOYED) FROM employees GROUP BY BUILDING;


# EXCERCISE - 11

## Queries with aggregates (Pt. 2)

### Find the number of Artists in the studio (without a HAVING clause)

sql
SELECT COUNT(ROLE) FROM employees WHERE ROLE LIKE "ARTIST";


### Find the number of Employees of each role in the studio

sql
SELECT *,COUNT(NAME) FROM employees group by role;


### Find the total number of years employed by all Engineers

sql
SELECT SUM(YEARS_EMPLOYED) FROM EMPLOYEES GROUP BY ROLE HAVING ROLE LIKE "ENGINEER";


# EXCERCISE - 12

## Order of execution of a Query

### Find the number of movies each director has directed

sql
SELECT DIRECTOR,COUNT(TITLE) FROM movies GROUP BY DIRECTOR;


### Find the total domestic and international sales that can be attributed to each director

sql
SELECT DIRECTOR,SUM(DOMESTIC_SALES+INTERNATIONAL_SALES) FROM movies 
LEFT JOIN BOXOFFICE 
ON ID = MOVIE_ID 
GROUP BY DIRECTOR;


# EXCERCISE - 13

## Inserting rows

### Add the studio's new production, Toy Story 4 to the list of movies (you can use any director)

sql
INSERT INTO MOVIES (ID , TITLE , DIRECTOR , YEAR , LENGTH_MINUTES) 
VALUES(15 , "Toy Story 4" , "John Lasseter" , 2024 , 120)


### Toy Story 4 has been released to critical acclaim! It had a rating of 8.7, and made 340 million domestically and 270 million internationally. Add the record to the BoxOffice table.

sql
INSERT INTO BOXOFFICE(MOVIE_ID , RATING,DOMESTIC_SALES,INTERNATIONAL_SALES) 
VALUES (15,8.7,340000000,270000000)


# EXCERCISE - 14

## Updating rows

### The director for A Bug's Life is incorrect, it was actually directed by John Lasseter

sql
UPDATE MOVIES 
SET DIRECTOR = "John Lasseter"
WHERE ID=2


### The year that Toy Story 2 was released is incorrect, it was actually released in 1999

sql
UPDATE MOVIES 
SET YEAR = 1999
WHERE TITLE LIKE "TOY STORY 2"


### Both the title and director for Toy Story 8 is incorrect! The title should be "Toy Story 3" and it was directed by Lee Unkrich

sql
UPDATE MOVIES 
SET TITLE = "Toy Story 3",director = "Lee Unkrich"
WHERE TITLE = "Toy Story 8"


# EXCERCISE - 15

## Deleting rows

### This database is getting too big, lets remove all movies that were released before 2005.

sql
DELETE FROM MOVIES
WHERE YEAR<2005;


### Andrew Stanton has also left the studio, so please remove all movies directed by him.

sql
DELETE FROM MOVIES WHERE DIRECTOR="Andrew Stanton";


# EXCERCISE - 16

## Creating tables

### Create a new table named Database with the following columns:
- Name A string (text) describing the name of the database
- Version A number (floating point) of the latest version of this database
- Download_count An integer count of the number of times this database was downloaded

- This table has no constraints.

sql
CREATE TABLE Database (
        Name TEXT,
        Version FLOAT,
        Download_count INTEGER
);


# EXCERCISE - 17

## Altering tables

### Add a column named Aspect_ratio with a FLOAT data type to store the aspect-ratio each movie was released in.

sql
ALTER TABLE MOVIES
ADD COLUMN Aspect_ratio FLOAT


### Add another column named Language with a TEXT data type to store the language that the movie was released in. Ensure that the default for this language is English.

sql
ALTER TABLE MOVIES
ADD COLUMN Language TEXT 
DEFAULT English;


# EXCERCISE - 18

## Dropping tables

### We've sadly reached the end of our lessons, lets clean up by removing the Movies table

sql 
DROP TABLE MOVIES;


### And drop the BoxOffice table as well

sql
DROP TABLE BOXOFFICE;