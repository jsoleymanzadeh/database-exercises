USE employees;
SELECT dept_name AS 'DEPARTMENT NAME', CONCAT(first_name, ' ', last_name) AS 'DEPARTMENT MANAGER'
FROM employees AS e
         JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
         JOIN departments AS d ON dm.dept_no = d.dept_no
WHERE dm.to_date = '9999-01-01';
SELECT dept_name AS 'DEPARTMENT NAME', CONCAT(first_name, ' ', last_name) AS 'DEPARTMENT MANAGER'
FROM employees AS e
         JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
         JOIN departments AS d ON dm.dept_no = d.dept_no
WHERE dm.to_date = '9999-01-01'
  AND gender = 'F';
SELECT title, COUNT(title) AS 'Total'
FROM titles AS t
         JOIN dept_emp AS de ON t.emp_no = de.emp_no
         JOIN departments AS d ON de.dept_no = d.dept_no
WHERE t.to_date = '9999-01-01'
  AND d.dept_name = 'Customer Service'
GROUP BY title;
SELECT dept_name                          AS 'Department Name',
       CONCAT(first_name, ' ', last_name) AS 'Department Manager',
       salary                             AS 'Salary'
FROM employees e
         JOIN salaries s on e.emp_no = s.emp_no
         JOIN dept_manager dm on e.emp_no = dm.emp_no
         JOIN departments d on dm.dept_no = d.dept_no
WHERE dm.to_date = '9999-01-01'
  AND s.to_date = '9999-01-01'
ORDER BY dept_name;
SELECT CONCAT(e1.first_name, ' ', e1.last_name) AS Employee,
       dept_name                                AS Department,
       CONCAT(e2.first_name, ' ', e2.last_name) AS Manager
FROM employees e1
         JOIN dept_emp de on e1.emp_no = de.emp_no
         JOIN departments d on de.dept_no = d.dept_no
         JOIN dept_manager dm on d.dept_no = dm.dept_no
         JOIN employees e2 on e2.emp_no = dm.emp_no
WHERE dm.to_date = '9999-01-01'
  AND de.to_date = '9999-01-01'

ORDER BY Department, Employee;