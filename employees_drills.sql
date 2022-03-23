USE employees;
SELECT gender, COUNT(gender) AS genderCount
FROM employees
GROUP BY gender
ORDER BY genderCount DESC;
SELECT title, ROUND(AVG(salary), 2) AS salaryAvg
FROM salaries
         JOIN employees e on e.emp_no = salaries.emp_no
         JOIN titles t on e.emp_no = t.emp_no
GROUP BY title
ORDER BY salaryAvg DESC;
SELECT first_name, last_name, COUNT(dept_name) AS deptCount
FROM employees
         JOIN dept_emp de on employees.emp_no = de.emp_no
         JOIN departments d on d.dept_no = de.dept_no
GROUP BY de.emp_no
HAVING deptCount > 1
ORDER BY deptCount ASC;
SELECT first_name, last_name, salary
FROM employees
         JOIN salaries s on employees.emp_no = s.emp_no
ORDER BY salary DESC
LIMIT 1;
SELECT first_name, last_name, MAX(salary) AS salaryMax
FROM employees
         JOIN salaries s on employees.emp_no = s.emp_no
GROUP BY employees.emp_no
ORDER BY salaryMax DESC
LIMIT 1 OFFSET 1;
SELECT MONTHNAME(hire_date) AS hiredMonth, COUNT(MONTHNAME(hire_date)) hiredMonthCount
FROM employees
GROUP BY hiredMonth
ORDER BY hiredMonthCount DESC
LIMIT 1;
SELECT dept_name, MIN(DATEDIFF(hire_date, birth_date) / 365) AS age
FROM employees
         JOIN dept_emp de on employees.emp_no = de.emp_no
         JOIN departments d on d.dept_no = de.dept_no
GROUP BY dept_name;
SELECT first_name, last_name, dept_name
FROM employees
         JOIN dept_emp de on employees.emp_no = de.emp_no
         JOIN departments d on de.dept_no = d.dept_no
WHERE first_name NOT LIKE '%a%'
  AND first_name NOT LIKE '%e%'
  AND first_name NOT LIKE '%i%'
  AND first_name NOT LIKE '%o%'
  AND first_name NOT LIKE '%u%';