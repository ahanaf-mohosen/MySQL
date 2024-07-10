SELECT p.productName, SUM(od.quantityOrdered) AS totalQuantityOrdered
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
GROUP BY p.productName;
/*
Name: Sakibul Hasan Chowdhury
ID: 0242220005341041
Section: A1 (39)
*/
