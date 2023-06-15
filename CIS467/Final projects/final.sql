USE final_project;

-- How many customers ordered in 2009?
SELECT COUNT(InvoiceId) as Total_number
FROM invoice
WHERE YEAR(STR_TO_DATE(InvoiceDate,"%Y-%m-%d")) = 2009;

-- Show the totals of invoices per year
SELECT SUM(Total) as Total_per_year, YEAR(STR_TO_DATE(InvoiceDate,"%Y-%m-%d")) as Year
FROM invoice
GROUP BY YEAR(STR_TO_DATE(InvoiceDate,"%Y-%m-%d"));

-- Find the top 3 billing cities that have the largest total of invoices.
SELECT BillingCity, SUM(Total) AS Total
FROM invoice
GROUP BY BillingCity
ORDER BY SUM(Total) DESC
LIMIT 3;

-- Find the customer who ordered least frequently with first name, last name and email address.
SELECT FirstName, LastName, Email, COUNT(i.InvoiceId) as frequency
FROM invoice i JOIN customer c
ON i.CustomerId = c.CustomerId
GROUP BY i.CustomerId
ORDER BY COUNT(i.CustomerId);