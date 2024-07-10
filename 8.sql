SELECT e.firstName,e.lastName,SUM(p.amount) AS totalSalesVolume
FROM employees e
JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN payments p ON c.customerNumber = p.customerNumber
GROUP BY e.employeeNumber, e.firstName, e.lastName
ORDER BY totalSalesVolume DESC;
/*
Name: Sakibul Hasan Chowdhury
ID: 0242220005341041
Section: A1 (39)
*/