-- List the employee number, last name, first name, sex, and salary of each employee
CREATE VIEW employee_salary AS
SELECT "EMPLOYEES".emp_no, "EMPLOYEES".last_name, "EMPLOYEES".first_name, "EMPLOYEES".sex, "SALARIES".salary
FROM "EMPLOYEES"
RIGHT JOIN "SALARIES" ON
"EMPLOYEES".emp_no = "SALARIES".emp_no;

SELECT * FROM employee_salary;

-- List the first name, last name, and hire date for the employees who were hired in 1986
CREATE VIEW employees_1986 AS
SELECT first_name, last_name, hire_date
FROM "EMPLOYEES"
WHERE hire_date >= '1986-1-1' AND hire_date < '1987-1-1';

SELECT * FROM employees_1986;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
CREATE VIEW department_managers AS
SELECT "DEPARTMENTS".dept_no, "DEPARTMENTS".dept_name, "DEPT_MANAGER".emp_no, "EMPLOYEES".last_name, "EMPLOYEES".first_name
FROM "DEPARTMENTS"
JOIN "DEPT_MANAGER"
ON "DEPARTMENTS".dept_no = "DEPT_MANAGER".dept_no
JOIN "EMPLOYEES"
ON "DEPT_MANAGER".emp_no = "EMPLOYEES".emp_no;

SELECT * FROM department_managers;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
CREATE VIEW employee_departments AS
SELECT "DEPARTMENTS".dept_no, "DEPT_EMP".emp_no, "EMPLOYEES".last_name, "EMPLOYEES".first_name,  "DEPARTMENTS".dept_name
FROM "DEPARTMENTS"
JOIN "DEPT_EMP"
ON "DEPARTMENTS".dept_no = "DEPT_EMP".dept_no
JOIN "EMPLOYEES"
ON "DEPT_EMP".emp_no = "EMPLOYEES".emp_no;

SELECT * FROM employee_departments;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
CREATE VIEW hercules_b AS
SELECT first_name, last_name, sex
FROM "EMPLOYEES"
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

SELECT * FROM hercules_b;

-- List each employee in the Sales department, including their employee number, last name, and first name.
CREATE VIEW sales_employees AS
SELECT "DEPARTMENTS".dept_name, "EMPLOYEES".emp_no, "EMPLOYEES".last_name, "EMPLOYEES".first_name
FROM "DEPT_EMP"
JOIN "EMPLOYEES"
ON "DEPT_EMP".emp_no = "EMPLOYEES".emp_no
JOIN "DEPARTMENTS"
ON "DEPT_EMP".dept_no = "DEPARTMENTS".dept_no
WHERE "DEPARTMENTS".dept_name = 'Sales';

SELECT * FROM sales_employees;

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
CREATE VIEW sales_development_employees AS
SELECT "EMPLOYEES".emp_no, "EMPLOYEES".last_name, "EMPLOYEES".first_name, "DEPARTMENTS".dept_name
FROM "DEPT_EMP"
JOIN "EMPLOYEES"
ON "DEPT_EMP".emp_no = "EMPLOYEES".emp_no
JOIN "DEPARTMENTS"
ON "DEPT_EMP".dept_no = "DEPARTMENTS".dept_no
WHERE "DEPARTMENTS".dept_name = 'Sales' 
OR "DEPARTMENTS".dept_name = 'Development';

SELECT * FROM sales_development_employees;

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
CREATE VIEW last_name_count AS
SELECT last_name,
COUNT(last_name) AS frequency_count
FROM "EMPLOYEES"
GROUP BY last_name
ORDER BY frequency_count DESC;

SELECT * FROM last_name_count;
