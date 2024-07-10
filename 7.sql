SELECT c.customerName,
       MAX(o.orderDate) AS mostRecentOrderDate
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
GROUP BY c.customerName
ORDER BY mostRecentOrderDate DESC;
/*
Name: Sakibul Hasan Chowdhury
ID: 0242220005341041
Section: A1 (39)
*/