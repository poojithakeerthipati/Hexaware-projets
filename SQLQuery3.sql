CREATE TABLE [Professor] (
  [professor_id] Varchar(255),
  [professor_name] Varchar(255),
  [department] Varchar(255),
  PRIMARY KEY ([professor_id])
);
 
 
CREATE TABLE [Student] (
  [student_id] Varchar(255),
  [student_name] Varchar(255),
  PRIMARY KEY ([student_id])
);
 
CREATE TABLE [Course] (
  [course_id] Varchar(255),
  [course_name] Varchar(255),
  [professor_id] Varchar(255),
  PRIMARY KEY ([course_id]),
  Foreign Key ([professor_id]) References Professor([professor_id])
);
 
 
CREATE TABLE [Enrollment] (
  [enroll_id] Varchar(255) ,
  [course_id] Varchar(255),
  [student_id] Varchar(255) ,
  PRIMARY KEY ([enroll_id]),
  Foreign Key ([course_id]) References Course([course_id]),
  Foreign Key ([student_id]) References Student([student_id])
);
 
 
INSERT INTO Professor (professor_id, professor_name, department)
VALUES ('P001', 'Dr. Brown', 'Mathematics'),
       ('P002', 'Dr. Smith', 'Physics');
 
 
Select * from Professor;
 
INSERT INTO Student (student_id, student_name)
VALUES ('S001', 'Alice'),
       ('S002', 'Bob'),
       ('S003', 'Charlie');
 

 

 
INSERT INTO Course (course_id, course_name, professor_id)
VALUES ('C001', 'Math 101', 'P001'),
       ('C002', 'Physics 101', 'P002');
 
 
INSERT INTO Enrollment (enroll_id, course_id, student_id)
VALUES ('E001', 'C001', 'S001'),
       ('E002', 'C002', 'S002'),
       ('E003', 'C002', 'S001'),
       ('E004', 'C001', 'S003');
 
Select * from Enrollment;
Select * from Course;
Select * from Professor;

SELECT CONCAT('HELLO,', ' ', 'MATHESH') AS Msg;


SELECT UPPER('Sabesh') as Name1;
Select lower('CooL') as Name2;


Select ltrim('    Tonika   ') as Name3;
select rtrim('    Tonika   ') as Name4;

select left('sneha M',2) as Name;

CREATE TABLE EmployeeData (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary INT,
    StartDate DATE
);

INSERT INTO EmployeeData (EmployeeID, FirstName, LastName, Salary, StartDate) VALUES
(1, 'John', 'Doe', 70000, '2020-05-01'),
(2, 'Jane', 'Smith', 85000, '2018-08-15'),
(3, 'Emily', 'Jones', 94000, '2019-12-30'),
(4, 'Chris', 'Brown', 62000, '2021-03-22');

SELECT * FROM EMPLOYEEDATA;

-- Task 1

-- Sort the employees by the length of their first names in descending order.
 
 SELECT *
FROM EmployeeData
ORDER BY LEN(FIRSTNAME) DESC;

-- Task 2

-- Get the Initials JD, JS, EJ, CB


SELECT CONCAT(LEFT(FIRSTNAME,1),LEFT(LASTNAME,1)) AS INITIALS
FROM EmployeeData;



SELECT UPPER(LEFT(LASTNAME,3)) 
FROM EmployeeData;
	--OR
SELECT UPPER(SUBSTRING(LASTNAME,1,3))
FROM EmployeeData;


SELECT GETDATE();

SELECT DAY(GETDATE());
SELECT MONTH(GETDATE());
SELECT YEAR(GETDATE());

SELECT DATEADD(YEAR,1,GETDATE());

SELECT DATEDIFF(DAY,'2024-04-01','2024-04-05')

-- Task 4
-- Write a query to calculate 
--the tenure of each employee in complete years as of today.

SELECT DATEDIFF(YEAR,STARTDATE,GETDATE()) AS DIFF
FROM EmployeeData;

select floor(9.6);
SELECT CEILING(9.5);


SELECT * FROM EMPLOYEEDATA;


-- Task 4
-- Write a query to calculate the tenure of each employee in complete years as of today.
SELECT *,DATEDIFF(YEAR,StartDate,GETDATE()) AS TENURE FROM EmployeeData;


-- Task 5 - Calculate Annual Salary Increase

-- Assume a yearly salary increase of 3% for each employee. 

-- Write a query to calculate their new salary rounded to the nearest whole number.

SELECT * , FLOOR(0.03*SALARY+SALARY) AS NEW_SALARY
FROM EmployeeData;

SELECT * FROM EmployeeData
ORDER BY EmployeeID 
OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY;