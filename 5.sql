USE classicmodels;
SELECT c.customerNumber,c.customerName,SUM(p.amount) AS totalAmountPaid
FROM customers c
JOIN payments p ON c.customerNumber = p.customerNumber
GROUP BY c.customerNumber, c.customerName
ORDER BY c.customerNumber ASC;
/*
Name: Sakibul Hasan Chowdhury
ID: 0242220005341041
Section: A1 (39)
*/