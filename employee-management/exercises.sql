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


--11. Select the name and last name of each employee, along with the name and budget of the employee's department.

/* Without labels */
SELECT Employees.Name, LastName, Departments.Name AS DepartmentsName, Budget
  FROM Employees INNER JOIN Departments
  ON Employees.Department = Departments.Code;

/* With labels */
SELECT E.Name, LastName, D.Name AS DepartmentsName, Budget
  FROM Employees E INNER JOIN Departments D
  ON E.Department = D.Code;


--12. Select the name and last name of employees working for departments with a budget greater than $60,000.

/* Without subquery */
SELECT Employees.Name, LastName
  FROM Employees INNER JOIN Departments
  ON Employees.Department = Departments.Code
    AND Departments.Budget > 60000;

    /* With subquery */
    SELECT Name, LastName FROM Employees
      WHERE Department IN
      (SELECT Code FROM Departments WHERE Budget > 60000);

--13. Select the departments with a budget larger than the average budget of all the departments.

SELECT *
  FROM Departments
  WHERE Budget >
  (
    SELECT AVG(Budget)
    FROM Departments
  );


--14. Select the names of departments with more than two employees.

/* With subquery */
SELECT Name FROM Departments
  WHERE Code IN
  (
    SELECT Department
      FROM Employees
      GROUP BY Department
      HAVING COUNT(*) > 2
  );

/* With UNION. This assumes that no two departments have
   the same name */
SELECT Departments.Name
  FROM Employees INNER JOIN Departments
  ON Department = Code
  GROUP BY Departments.Name
  HAVING COUNT(*) > 2;

--15. Select the name and last name of employees working for departments with second lowest budget.

/* With subquery */
SELECT e.Name, e.LastName
FROM Employees e 
WHERE e.Department = (
       SELECT sub.Code 
       FROM (SELECT * FROM Departments d ORDER BY d.budget LIMIT 2) sub 
       ORDER BY budget DESC LIMIT 1);
/* With subquery */
SELECT Name, LastName 
FROM Employees 
WHERE Department IN (
  SELECT Code 
  FROM Departments 
  WHERE Budget = (
    SELECT TOP 1 Budget 
    FROM Departments 
    WHERE Budget IN (
      SELECT DISTINCT TOP 2 Budget 
      FROM Departments 
     ORDER BY Budget ASC
    ) 
    ORDER BY Budget DESC
  )
);
