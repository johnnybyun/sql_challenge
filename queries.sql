

--QUERIES BEGIN HERE--
--1. List employees by 'employee number', 'last name', 'first name', 'gender', 'salary'
--We verify that there are no duplicate employees in 'salaries' table so we can join
SELECT emp_no, COUNT(emp_no) as "count"
FROM salaries
GROUP BY emp_no
ORDER BY "count" DESC;

--Left join salaries table to employees table and list employees.
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees e
LEFT JOIN salaries s
ON (e.emp_no = s.emp_no);

--2.  List employees who were hired in 1986.
SELECT emp_no, last_name, first_name, hire_date
FROM employees
WHERE hire_date between '1986-01-01' and '1986-12-31';

--3. List the manager of each department with the following information:
--      department number, department name, the manager's employee number,
--      last name, first name, and start and end employment dates.
SELECT dm.dept_no, de.dept_name, e.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
FROM employees as e
    LEFT JOIN dept_manager AS dm
    ON (e.emp_no = dm.emp_no)
        LEFT JOIN departments AS de
            ON (dm.dept_no = de.dept_no)
WHERE dm.to_date between '9999-01-01' and '9999-01-01';

-- 4. List the department of each employee with the following information:
--    employee number, last name, first name, and department name.
CREATE VIEW emp_by_dept AS
SELECT e.emp_no, e.last_name, e.first_name, de.dept_name
FROM employees as e
    LEFT JOIN dept_emp AS demp
    ON (e.emp_no = demp.emp_no)
        LEFT JOIN departments AS de
            ON (demp.dept_no = de.dept_no)
WHERE demp.to_date between '9999-01-01' and '9999-01-01'
ORDER BY e.emp_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT emp_no, last_name, first_name
FROM employees
WHERE last_name LIKE 'B%'
AND first_name = 'Hercules';

-- 6. List all employees in the Sales department, including their employee number,
-- last name, first name, and department name.
SELECT * FROM emp_by_dept
WHERE dept_name = 'Sales';

-- 7. List all employees in the Sales and Dvelopment departments,
-- including their employee number, last name, first name, and department name.
SELECT * FROM emp_by_dept
WHERE dept_name = 'Sales'
OR dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e.,
--    how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "last name count"
FROM employees
GROUP BY last_name
ORDER BY "last name count" DESC;


