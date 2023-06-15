USE expense;

-- show the total number of trips of each employees and find the employee who travels most
SELECT first_name, last_name, dept_name, COUNT(t.employee) AS total_number_trips,
SUM(gross_amount + tax) AS total_expenses
FROM employees e JOIN dept_codes d
ON e.dept = d.dept_id JOIN trips t
ON e.ssn = t.employee JOIN expenses ex
ON t.trip_id = ex.trip_id AND t.employee = ex.employee
GROUP BY e.ssn
ORDER BY total_number_trips DESC
LIMIT 25;

-- find which department has the most employees
SELECT dept_name, COUNT(ssn) AS total_employees
FROM employees e JOIN dept_codes d
ON e.dept = d.dept_id 
GROUP BY dept_name
ORDER BY total_employees DESC;

-- show the total expenses of each trip
SELECT e.trip_id, SUM(gross_amount + tax) AS total_expense
FROM expenses e JOIN trips t
ON e.trip_id = t.trip_id AND e.employee = t.employee
GROUP BY e.trip_id
ORDER BY total_expense
LIMIT 25;

-- display employees name and who travels in 2017
SELECT first_name, last_name
FROM employees e JOIN trips t
ON e.ssn = t.employee
WHERE YEAR(STR_TO_DATE(start_date,"%m/%d/%Y")) = 2017
GROUP BY ssn
LIMIT 25;

-- display employees who do not have reimbursement
SELECT DISTINCT(first_name), last_name
FROM employees e JOIN reimbursements r
ON e.ssn = r.employee
WHERE ssn IN (SELECT employee
FROM reimbursements r 
GROUP BY employee
HAVING SUM(reimbursement_amount) = 0);

-- display employees who do not have reimbursement
SELECT first_name, last_name, SUM(reimbursement_amount) AS total_reimbursement_amount
FROM employees e JOIN reimbursements r
ON e.ssn = r.employee
GROUP BY employee
HAVING SUM(reimbursement_amount) = 0;