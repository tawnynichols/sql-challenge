SELECT * FROM departments
SELECT * FROM dept_emp
SELECT * FROM dept_manager
SELECT * FROM employees
SELECT * FROM salaries
SELECT * FROM titles

--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
LEFT JOIN salaries s ON e.emp_no = s.emp_no


--List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE Date_Part('year', hire_date) = 1986


--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name 
FROM dept_manager dm
LEFT JOIN departments d on dm.dept_no = d.dept_no
LEFT JOIN employees e on dm.emp_no = e.emp_no

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name 
FROM dept_emp de
JOIN departments d on de.dept_no = d.dept_no
JOIN employees e on de.emp_no = e.emp_no
ORDER BY d.dept_name, e.emp_no

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name like 'B%'

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name 
FROM dept_emp de
JOIN departments d on de.dept_no = d.dept_no
JOIN employees e on de.emp_no = e.emp_no
WHERE d.dept_name = 'Sales'
ORDER BY d.dept_name, e.emp_no

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name 
FROM dept_emp de
JOIN departments d on de.dept_no = d.dept_no
JOIN employees e on de.emp_no = e.emp_no
WHERE d.dept_name in ('Sales','Development')
ORDER BY d.dept_name, e.emp_no

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, count(*)
FROM employees
GROUP BY last_name
ORDER BY 2 DESC



