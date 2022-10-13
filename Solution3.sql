CREATE TABLE Employee
(
    Emp_Id     NUMBER(10) NOT NULL PRIMARY KEY,
    Name       CHAR(40),
    Department CHAR(60),
    Grade      NUMBER(10),
    Salary     NUMBER(100),
    Gender     CHAR(1)
);

CREATE TABLE Student
(
    Student_Id                NUMBER(10) NOT NULL,
    Class_Teacher_Employee_Id NUMBER(10) NOT NULL,
    Subject1                  CHAR(1),
    Subject2                  CHAR(1),
    Subject3                  CHAR(1),
    PRIMARY KEY (Student_Id),
    FOREIGN KEY (Class_Teacher_Employee_Id) REFERENCES Employee (Emp_Id)
);


INSERT INTO Employee
VALUES (1, 'Robert', 'Computer Science', 100, 100000, 'M');
INSERT INTO Employee
VALUES (2, 'Ram', 'Information Technology', 101, 134000, 'M');
INSERT INTO Employee
VALUES (3, 'Alex', 'Computer Science', 200, 123456, 'M');
INSERT INTO Employee
VALUES (4, 'Radha', 'Information Technology', 201, 23456, 'F');
INSERT INTO Employee
VALUES (5, 'Santhi', 'Civil', 300, 234567, 'F');
INSERT INTO Employee
VALUES (6, 'Madhavi', 'BioTech', 301, 234567, 'F');

INSERT INTO Student
VALUES (1, 1, 'P', 'P', 'F');
INSERT INTO Student
VALUES (2, 1, 'P', 'F', 'P');
INSERT INTO Student
VALUES (3, 2, 'P', 'P', 'P');
INSERT INTO Student
VALUES (4, 3, 'F', 'F', 'F');
INSERT INTO Student
VALUES (5, 4, 'P', 'P', 'P');
INSERT INTO Student
VALUES (6, 5, 'P', 'P', 'F');
INSERT INTO Student
VALUES (7, 4, 'P', 'P', 'P');
INSERT INTO Student
VALUES (8, 5, 'P', 'P', 'P');
INSERT INTO Student
VALUES (9, 4, 'P', 'P', 'P');
INSERT INTO Student
VALUES (10, 3, 'F', 'F', 'F');

/*Write a query to fetch Employee name whose grade greater than 200.*/

SELECT E.Name
FROM Employee E
WHERE E.Grade > 200;

/*Write a query to fetch the department name where only male staff available.*/

SELECT E.department
FROM Employee E
GROUP BY E.Department
HAVING COUNT(CASE WHEN E.Gender = 'F' THEN 1 END) = 0;

/*Write a query to fetch the second highest salaried employer.*/

SELECT *
FROM Employee
group by Salary
order by Salary desc limit 1,1;

/*Write a query to fetch the employ details who did not assigned with any students.*/

SELECT *
FROM Employee E
WHERE NOT EXISTS(SELECT * FROM Student S WHERE S.Class_Teacher_Employee_Id = E.Emp_Id);

/*Write a query to fetch the student who passed in all three subjects.*/

SELECT * FROM Student S
WHERE (
                  S.Subject1 = 'P' AND
                  S.Subject2 = 'P' AND
                  S.Subject3 = 'P'
          );

/*Write a query to fetch the top employee details where all of his students passed in the subjects.*/

SELECT E.Emp_Id, E.Name, E.Department, E.Grade, E.Salary, E.Gender
FROM Employee E
         left JOIN Student S
where E.EMP_Id = S.Class_Teacher_Employee_Id
group by Emp_Id
having Count(Case when Subject1 = 'F' or Subject2 = 'F' or Subject3 = 'F' then 1 End) = 0
order by grade desc limit 1;