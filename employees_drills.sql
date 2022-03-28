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
SELECT CONCAT(firstSalary, ' - ', secondSalary)
FROM (SELECT MAX(CASE WHEN emp_no = 10001 THEN salary END) AS firstSalary,
             MAX(CASE WHEN emp_no = 10002 THEN salary END) AS secondSalary
      FROM salaries) AS test;
SELECT first_name, last_name
FROM employees
WHERE emp_no IN (SELECT emp_no
                 FROM dept_manager
                 WHERE to_date = '9999-01-01'
                   AND dept_no IN (SELECT dept_no
                                   FROM departments
                                   WHERE dept_name = 'Sales'));
SELECT *
FROM employees
WHERE emp_no IN (SELECT emp_no
                 FROM dept_emp
                 WHERE dept_no IN (SELECT dept_no
                                   FROM departments
                                   WHERE dept_name = 'Customer Service'))
  AND emp_no IN (SELECT emp_no
                 FROM titles
                 WHERE title = 'Senior Engineer');
SELECT first_name, last_name
FROM employees
WHERE emp_no IN (SELECT emp_no
                 FROM dept_emp
                 WHERE to_date = '9999-01-01'
                   AND dept_no IN (SELECT dept_no
                                   FROM departments
                                   WHERE dept_name = 'Sales'));
SELECT first_name, last_name
FROM employees
WHERE emp_no IN (SELECT *
                 FROM (SELECT emp_no
                       FROM salaries
                       ORDER BY salary DESC
                       LIMIT 1) AS test);
SELECT birth_date, COUNT(birth_date) AS birthdayCount
FROM employees
GROUP BY birth_date
ORDER BY birthdayCount DESC
LIMIT 1;
SELECT birth_date, COUNT(birth_date) AS birthdayCount
FROM employees
GROUP BY birth_date
ORDER BY birthdayCount ASC
LIMIT 1;
SELECT dept_name, ROUND(AVG(salary), 2) AS salaryAvg
FROM departments
         JOIN dept_manager dm on departments.dept_no = dm.dept_no
         JOIN salaries s on dm.emp_no = s.emp_no
GROUP BY dept_name;
SELECT dept_name, COUNT(emp_no)
FROM departments
         JOIN dept_emp de on departments.dept_no = de.dept_no
WHERE to_date = '9999-01-01'
GROUP BY dept_name;
SELECT dept_name, ROUND(AVG(salary), 2) AS salaryAvg
FROM departments
         JOIN dept_emp de on departments.dept_no = de.dept_no
         JOIN salaries s on de.emp_no = s.emp_no
GROUP BY dept_name;
SELECT ROUND(AVG(salary), 2) AS salaryAvg
FROM salaries
WHERE from_date BETWEEN CAST('1980-01-01' AS DATE) AND CAST('1989-12-31' AS DATE)
  AND to_date BETWEEN CAST('1980-01-01' AS DATE) AND CAST('1989-12-31' AS DATE);
SELECT dept_name, ROUND(AVG(salary), 2) AS salaryAvg
FROM departments
         JOIN dept_emp de on departments.dept_no = de.dept_no
         JOIN salaries s on de.emp_no = s.emp_no
WHERE s.from_date BETWEEN CAST('1980-01-01' AS DATE) AND CAST('1989-12-31' AS DATE)
  AND s.to_date BETWEEN CAST('1980-01-01' AS DATE) AND CAST('1989-12-31' AS DATE)
GROUP BY dept_name;
SELECT AVG(titleCounts)
FROM (SELECT emp_no, COUNT(title) AS titleCounts
      FROM titles
      GROUP BY emp_no) AS test;
SELECT AVG(raiseCounts)
FROM (SELECT emp_no, COUNT(salary) AS raiseCounts
      FROM salaries
      GROUP BY emp_no) AS test;
SELECT title, MAX(salary) AS salaryMax
FROM salaries
         JOIN titles t on salaries.emp_no = t.emp_no
GROUP BY title
ORDER BY salaryMax DESC;
SELECT gender, title, MAX(salary) AS salaryMax
FROM salaries
         JOIN employees e on salaries.emp_no = e.emp_no
         JOIN titles t on e.emp_no = t.emp_no
GROUP BY gender, title
ORDER BY salaryMax DESC;
SELECT DATEDIFF(NOW(), birth_date) AS age
FROM employees
JOIN dept_emp de on employees.emp_no = de.emp_no
WHERE de.to_date = '9999-01-01'
ORDER BY age ASC
LIMIT 2
OFFSET 120061;
SELECT AVG(age) AS ageAvg
FROM (SELECT t.emp_no, DATEDIFF(NOW(), birth_date) AS age
      FROM employees
               JOIN titles t on employees.emp_no = t.emp_no
      WHERE t.to_date = '9999-01-01') AS test;
SELECT SUM(salary)
FROM salaries
WHERE emp_no IN (SELECT emp_no
                 FROM employees
                 WHERE DATEDIFF(NOW(), birth_date) > 23246.4134);
SELECT SUM(salary)
FROM salaries
WHERE emp_no IN (SELECT emp_no
                 FROM employees
                 WHERE DATEDIFF(NOW(), birth_date) < 23246.4134);
SELECT dept_name, MAX(DATEDIFF(NOW(), birth_date))
FROM departments d
JOIN dept_emp de on d.dept_no = de.dept_no
JOIN employees e on de.emp_no = e.emp_no
WHERE de.to_date = '9999-01-01'
GROUP BY dept_name;
SELECT first_name, last_name, salary
FROM employees e
         JOIN salaries s on e.emp_no = s.emp_no
WHERE e.emp_no IN (SELECT emp_no
                 FROM dept_manager)
ORDER BY salary ASC;