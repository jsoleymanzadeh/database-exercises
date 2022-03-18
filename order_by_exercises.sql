USE employees;
SELECT *
FROM employees
WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya')
  AND gender = 'M'
ORDER BY last_name DESC, first_name DESC;
SELECT *
FROM employees
WHERE last_name LIKE 'E%'
   OR last_name LIKE '%E';
SELECT *
FROM employees
WHERE last_name LIKE 'E%'
  AND last_name LIKE '%E';
SELECT *
FROM employees
WHERE last_name LIKE '%q%'
  AND last_name NOT LIKE '%qu%';
SELECT *
FROM employees
WHERE last_name LIKE '%e%'
ORDER BY emp_no DESC;