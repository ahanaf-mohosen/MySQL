USE classicmodels;
SELECT c.customerName
FROM customers c
LEFT JOIN orders o ON c.customerNumber = o.customerNumber
WHERE o.orderNumber IS NULL
ORDER BY c.customerName ASC;
/*
Name: Sakibul Hasan Chowdhury
ID: 0242220005341041
Section: A1 (39)
*/