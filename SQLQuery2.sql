CREATE TABLE [student] (
  [student_ID] VARCHAR,
  [studentName] VARCHAR,
  PRIMARY KEY ([student_ID])
);

CREATE TABLE [professor] (
  [professor_ID] VARCHAR,
  [professorName] VARCHAR,
  [Department] VARCHAR,
  PRIMARY KEY ([professor_ID])
);


CREATE TABLE [course] (
  [course_ID] VARCHAR,
  [courseName] VARCHAR,
  [professor_ID] VARCHAR,
  PRIMARY KEY ([course_ID]),
  Foreign Key ([professor_id]) references Professor([professor_id])
);

CREATE TABLE [Enrollment] (
  [enroll_id] VARCHAR,
  [student_id] VARCHAR,
  [course_id] VARCHAR,
  PRIMARY KEY ([enroll_id]),
  Foreign Key ([course_id]) references course([course_id]),
  Foreign Key ([student_id]) references student([student_id])
);

INSERT INTO Professor (professor_id, professorname, department)
VALUES ('P001', 'Dr. Brown', 'Mathematics'),
       ('P002', 'Dr. Smith', 'Physics');
 
 
Select * from Professor;
 
INSERT INTO Student (student_id, studentname)
VALUES ('S001', 'Alice'),
       ('S002', 'Bob'),
       ('S003', 'Charlie');
 
Select * from Professor;
 
Select * from Course;
 
INSERT INTO Course (course_id, course_name, professor_id)
VALUES ('C001', 'Math 101', 'P001'),
       ('C002', 'Physics 101', 'P002');
 
 
INSERT INTO Enrollment (enroll_id, course_id, student_id)
VALUES ('E001', 'C001', 'S001'),
       ('E002', 'C002', 'S002'),
       ('E003', 'C002', 'S001'),
       ('E004', 'C001', 'S003');
 
Select * from Enrollment;

DROP TABLE [professor]

