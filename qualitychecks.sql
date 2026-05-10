USE RetailMigrationDB;
GO
SELECT 
    Email, 
    COUNT(*) AS DuplicateCount
FROM Customers
GROUP BY Email
HAVING COUNT(*) > 1;

SELECT 
    o.OrderID,
    o.CustomerID
FROM Orders o
LEFT JOIN Customers c
    ON o.CustomerID = c.CustomerID
WHERE c.CustomerID IS NULL;

SELECT 
    od.OrderDetailID,
    od.ProductID
FROM OrderDetails od
LEFT JOIN Products p
    ON od.ProductID = p.ProductID
WHERE p.ProductID IS NULL;