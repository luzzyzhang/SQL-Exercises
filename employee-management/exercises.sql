--2. Select the last name of all employees, without duplicates.

SELECT DISTINCT LastName FROM Employees;

--4. Select all the data of employees whose last name is "Smith" or "Doe".

/* With OR */
SELECT * FROM Employees
  WHERE LastName = 'Smith' OR LastName = 'Doe';

/* With IN */
SELECT * FROM Employees
  WHERE LastName IN ('Smith' , 'Doe');


--7. Select all the data of employees whose last name begins with an "S".
SELECT * FROM Employees
  WHERE LastName LIKE 'S%';

--9. Select the number of employees in each department (you only need to show the department code and the number of employees).

SELECT Department, COUNT(*)
  FROM Employees
  GROUP BY Department;

--10. Select all the data of employees, including each employee's department's data.
/*Approach One*/
SELECT SSN, E.Name AS Name_E, LastName, D.Name AS Name_D, Department, Code, Budget
 FROM Employees E INNER JOIN Departments D
 ON E.Department = D.Code;
/*Another*/
select * from Employees inner join Departments on Employees.Department = Departments.Code;
