use coding_EXAM;

--2. Create tables for Companies, Jobs, Applicants and Applications. 
--3. Define appropriate primary keys, foreign keys, and constraints. 
CREATE TABLE [COMPANIES]
(
	[COMPANY_ID] INT PRIMARY KEY NOT NULL,
	[COMPANY_NAME] VARCHAR(500),
	[LOCATION] VARCHAR(500)
);

CREATE TABLE [JOBS]
(
	[JOB_ID] INT PRIMARY KEY NOT NULL,
	[COMPANY_ID] INT NOT NULL,
	[JOB_TITLE] VARCHAR(500),
	[JOB_DESCRIPTION] TEXT,
	[JOB_LOCATION] VARCHAR(500),
	[SALARY] DECIMAL,
	[JOB_TYPE] VARCHAR(500),
	[POSTED_DATE] DATETIME
		FOREIGN KEY ([COMPANY_ID]) REFERENCES COMPANIES([COMPANY_ID])
);

CREATE TABLE [APPLICANTS]
(
	[APPLICANT_ID] INT PRIMARY KEY NOT NULL,
	[FIRST_NAME] VARCHAR(500),
	[LAST_NAME] VARCHAR(500),
	[EMAIL] VARCHAR(500),
	[PHONE] VARCHAR(500),
	[RESUME] TEXT,
	[CITY] VARCHAR(500),
	[STATE] VARCHAR(500)
);

CREATE TABLE [APPLICATIONS]
(
	[APPLICATION_ID] INT PRIMARY KEY NOT NULL,
	[JOB_ID] INT NOT NULL,
	[APPLICANT_ID] INT NOT NULL,
	[APPLICATION_DATE] DATETIME,
	[COVER_LETTER] TEXT,
	FOREIGN KEY ([JOB_ID]) REFERENCES JOBS([JOB_ID]),
	FOREIGN KEY ([APPLICANT_ID]) REFERENCES APPLICANTS([APPLICANT_ID])
);


--4. Ensure the script handles potential errors, such as if the database or tables already exist.

INSERT INTO Companies
	(COMPANY_ID,COMPANY_NAME, Location)
VALUES
	(1, 'Tech Innovations', 'San Francisco'),
	(2, 'Data Driven Inc', 'New York'),
	(3, 'GreenTech Solutions', 'Austin'),
	(4, 'CodeCrafters', 'Boston'),
	(5, 'HexaWare Technologies', 'Chennai');


INSERT INTO Jobs
	(Company_ID, JOB_ID,Job_Title, JOB_DESCRIPTION, JOB_LOCATION, Salary, JOB_TYPE, POSTED_DATE)
VALUES
	(1, 1, 'Frontend Developer', 'Develop user-facing features', 'San Francisco', 75000, 'Full-time', '2023-01-10'),
	(2, 2, 'Data Analyst', 'Interpret data models', 'New York', 68000, 'Full-time', '2023-02-20'),
	(3, 3, 'Environmental Engineer', 'Develop environmental solutions', 'Austin', 85000, 'Full-time', '2023-03-15'),
	(1, 4, 'Backend Developer', 'Handle server-side logic', 'Remote', 77000, 'Full-time', '2023-04-05'),
	(4, 5, 'Software Engineer', 'Develop and test software systems', 'Boston', 90000, 'Full-time', '2023-01-18'),
	(5, 6, 'HR Coordinator', 'Manage hiring processes', 'Chennai', 45000, 'Contract', '2023-04-25'),
	(2, 7, 'Senior Data Analyst', 'Lead data strategies', 'New York', 95000, 'Full-time', '2023-01-22');


INSERT INTO Applicants
	(APPLICANT_ID,FIRST_NAME, LAST_NAME, Email, Phone, Resume,CITY,STATE)
VALUES
	(1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', 'Experienced web developer with 5 years of experience.', 'TIRUPATI', '[ANDHARA PRADESH]'),
	(2, 'Jane', 'Smith', 'jane.smith@example.com', '234-567-8901', 'Data enthusiast with 3 years of experience in data analysis.', 'HYDERABAD', 'TELANGANA'),
	(3, 'Alice', 'Johnson', 'alice.johnson@example.com', '345-678-9012', 'Environmental engineer with 4 years of field experience.', 'CHENNAI', '[TAMIL NADU]'),
	(4, 'Bob', 'Brown', 'bob.brown@example.com', '456-789-0123', 'Seasoned software engineer with 8 years of experience.', 'BANGLORE', 'KARNATAKA');


INSERT INTO Applications
	(APPLICATION_ID,JOB_ID, APPLICANT_ID, APPLICATION_DATE, COVER_LETTER)
VALUES
	(1, 1, 1, '2023-04-01', 'I am excited to apply for the Frontend Developer position.'),
	(2, 2, 2, '2023-04-02', 'I am interested in the Data Analyst position.'),
	(3, 3, 3, '2023-04-03', 'I am eager to bring my expertise to your team as an Environmental Engineer.'),
	(4, 4, 4, '2023-04-04', 'I am applying for the Backend Developer role to leverage my skills.'),
	(5, 5, 1, '2023-04-05', 'I am also interested in the Software Engineer position at CodeCrafters.');


SELECT *
FROM COMPANIES;
SELECT *
FROM JOBS;
SELECT *
FROM APPLICANTS;
SELECT *
FROM APPLICATIONS;

--5.Write an SQL query to count the number of applications received for each job
--listing in the "Jobs" table. Display the job title and the corresponding 
--application count. Ensure that it lists all 
--jobs, even if they have no applications. 



SELECT J.JOB_TITLE, COUNT(APPLICATION_ID) AS COUNT_OF_APPLICATIONS
FROM JOBS J LEFT JOIN APPLICATIONS A ON J.JOB_ID = A.JOB_ID
GROUP BY J.JOB_TITLE;


--6. Develop an SQL query that retrieves job listings from the "Jobs" table within a specified salary 
--range. Allow parameters for the minimum and maximum salary values. Display the job title, 
--company name, location, and salary for each matching job. 


DECLARE @MIN_SALARY DECIMAL = 50000;
DECLARE @MAX_SALARY DECIMAL = 85000;

SELECT J.JOB_TITLE, C.COMPANY_NAME, J.JOB_LOCATION, J.SALARY
FROM JOBS J
	INNER JOIN COMPANIES C ON C.COMPANY_ID = J.COMPANY_ID
WHERE SALARY BETWEEN @MIN_SALARY AND @MAX_SALARY;

--7. Write an SQL query that retrieves the job application history for a specific applicant. Allow a 
--parameter for the ApplicantID, and return a result set with the job titles, company names, and 
--application dates for all the jobs the applicant has applied to. 


DECLARE @APPLICANT_ID_NO INT = 2;

SELECT J.JOB_TITLE, C.COMPANY_NAME, A.APPLICATION_DATE
FROM JOBS J INNER JOIN COMPANIES C ON C.COMPANY_ID = J.COMPANY_ID
	INNER JOIN APPLICATIONS A ON A.JOB_ID = J.JOB_ID
WHERE A.APPLICANT_ID=@APPLICANT_ID_NO;

--8. Create an SQL query that calculates and displays the average salary offered by all companies for 
--job listings in the "Jobs" table. Ensure that the query filters out jobs with a salary of zero. 

SELECT AVG(SALARY) AS AVERAGE_SALARY
FROM JOBS
WHERE SALARY >0;

SELECT COMPANY_ID, AVG(SALARY) AS AVG_SAL
FROM JOBS
WHERE SALARY>0
GROUP BY COMPANY_ID;

--9. Write an SQL query to identify the company that has posted the most job listings. Display the 
--company name along with the count of job listings they have posted. Handle ties if multiple 
--companies have the same maximum count. 

SELECT COMPANY_NAME, COUNT(COMPANY_ID)
FROM JOBS
GROUP BY COMPANY_ID
OFFSET 0 ROWS
FETCH NEXT 2 ROWS ONLY;

UPDATE APPLICANTS
SET STATE = 'TAMILNADU'
WHERE APPLICANT_ID = 3;

--10. Find the applicants who have applied for positions in companies located in 'CityX' and have at least 3 years of experience.

SELECT *
FROM APPLICANTS
WHERE CITY='SAN FRANCISCO' AND EXPERIENCE >=3;

--11. Retrieve a list of distinct job titles with salaries between $60,000 and $80,000.
SELECT DISTINCT JOB_TITLE
FROM JOBS
WHERE SALARY BETWEEN 60000 AND 80000;

--12. Find the jobs that have not received any applications. 
SELECT J.JOB_TITLE
FROM JOBS J
	LEFT JOIN APPLICATIONS A ON
J.JOB_ID = A.JOB_ID
WHERE A.APPLICANT_ID IS NULL;

--13. Retrieve a list of job applicants along with the companies they have applied to and the positions 
--they have applied for. 

SELECT FIRST_NAME+' ' +LAST_NAME AS APPLICANT, (SELECT COMPANY_NAME
	FROM COMPANIES
	WHERE COMPANY_ID = (SELECT COMPANY_ID
	FROM Jobs
	WHERE JOB_ID = B.JOB_ID)) AS NAME_OF_COMPANY, (SELECT JOB_TITLE
	FROM Jobs
	WHERE JOB_ID = B.JOB_ID) AS JOB_ROLE
FROM Applicants A INNER JOIN Applications B ON A.APPLICANT_ID = B.APPLICATION_ID;


--14. Retrieve a list of companies along with the count of jobs they have posted, even if they have not received any applications. 

SELECT COMPANY_NAME, COUNT(J.JOB_TITLE) AS COUNT
FROM JOBS J
	INNER JOIN COMPANIES C ON J.COMPANY_ID = C.COMPANY_ID
GROUP BY COMPANY_NAME;

--15. List all applicants along with the companies and positions they have applied for, including those who have not applied. 

SELECT FIRST_NAME+' ' +LAST_NAME AS APPLICANT, (SELECT COMPANY_NAME
	FROM COMPANIES
	WHERE COMPANY_ID = (SELECT COMPANY_ID
	FROM Jobs
	WHERE JOB_ID = B.JOB_ID)) AS NAME_OF_COMPANY, (SELECT JOB_TITLE
	FROM Jobs
	WHERE JOB_ID = B.JOB_ID) AS JOB_ROLE
FROM Applicants A INNER JOIN Applications B ON A.APPLICANT_ID = B.APPLICATION_ID;

--16. Find companies that have posted jobs with a salary higher than the average salary of all jobs.
SELECT C.COMPANY_NAME
FROM COMPANIES C
	INNER JOIN JOBS J ON J.COMPANY_ID = C.COMPANY_ID
WHERE J.SALARY > (SELECT AVG(SALARY)
FROM JOBS);

--17. Display a list of applicants with their names and a concatenated string of their city and state.

SELECT FIRST_NAME+' '+LAST_NAME , CONCAT(CITY, '--->' ,STATE)
FROM APPLICANTS
;

--18. Retrieve a list of jobs with titles containing either 'Developer' or 'Engineer'. 
SELECT JOB_TITLE
FROM JOBS
WHERE JOB_TITLE LIKE '%DEVELOPER%' OR JOB_TITLE LIKE '%ENGINEER%'
ORDER BY JOB_TITLE;

--19. Retrieve a list of applicants and the jobs they have applied for, including those who have not applied and jobs without applicants. 
SELECT FIRST_NAME+' ' +LAST_NAME AS APPLICANT, (SELECT JOB_TITLE
	FROM Jobs
	WHERE JOB_ID = B.JOB_ID) AS JOB_ROLE
FROM Applicants A INNER JOIN Applications B ON A.APPLICANT_ID = B.APPLICATION_ID;

--20. List all combinations of applicants and companies where the company is in a specific city and the 
--applicant has more than 2 years of experience. For example: city=Chennai 
SELECT A.APPLICANT_ID, C.COMPANY_NAME
FROM APPLICANTS A

