CREATE TABLE Employees (
    EmployeeID INT,
    Name VARCHAR(50),
    Salary DECIMAL(10,2),
    DepartmentID INT
);
 
CREATE TABLE Departments (
    DepartmentID INT,
    DepartmentName VARCHAR(50),
    MinSalary DECIMAL(10,2)
);
 
INSERT INTO Employees VALUES (1, 'John Doe', 50000, 101), (2, 'Jane Smith', 40000, 102);
INSERT INTO Departments VALUES (101, 'HR', 45000), (102, 'Marketing', 35000);
 
Select * from Employees
 
Select * from Departments
 
 
Select Name, Salary, DepartmentName,  MinSalary
From Employees
Inner Join Departments 
on Salary > MinSalary;



 CREATE DATABASE PROJECTS;
 USE PROJECTS;

 CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50)
);
 
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    employee_id INT,
    start_date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
 
 
INSERT INTO employees (employee_id, name, department) VALUES
(1, 'Alice', 'Engineering'),
(2, 'Bob', 'Engineering'),
(3, 'Charlie', 'HR'),
(4, 'David', 'Marketing');
 
INSERT INTO projects (project_id, project_name, employee_id, start_date) VALUES
(101, 'Alpha', 1, '2021-01-10'),
(102, 'Beta', 2, '2021-03-15'),
(103, 'Gamma', 1, '2021-02-20');

SELECT * FROM Employees;
SELECT * FROM projects;

-- LETS FIND EMPLOYEES FROM THE ENGINEERING DEPARTMENT WHO ARE WORKING ON ANY PROJECT

SELECT * FROM Employees O
WHERE Department = 'ENGINEERING' AND EXISTS(
	SELECT * FROM PROJECTS I
	WHERE O.EmployeeID = I.employee_id)