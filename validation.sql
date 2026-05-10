USE RetailMigrationDB;
GO

SELECT 
    'Customers' AS TableName, COUNT(*) AS "RowCount" 
FROM Customers

UNION ALL

SELECT 
    'Products', 
    COUNT(*) 
FROM Products

UNION ALL

SELECT 
    'Orders', 
    COUNT(*) 
FROM Orders

UNION ALL

SELECT 
    'OrderDetails', 
    COUNT(*) 
FROM OrderDetails;

SELECT 
    SUM(Quantity * UnitPrice) AS TotalSales
FROM OrderDetails;