USE RetailMigrationDB;
GO

CREATE PROCEDURE GetSalesSummary
AS
BEGIN
    SELECT 
        c.Province,
        p.Category,
        COUNT(DISTINCT o.OrderID) AS TotalOrders,
        SUM(od.Quantity) AS TotalQuantity,
        SUM(od.Quantity * od.UnitPrice) AS TotalSales
    FROM Orders o
    INNER JOIN Customers c
        ON o.CustomerID = c.CustomerID
    INNER JOIN OrderDetails od
        ON o.OrderID = od.OrderID
    INNER JOIN Products p
        ON od.ProductID = p.ProductID
    WHERE o.OrderStatus = 'Completed'
    GROUP BY c.Province, p.Category
    ORDER BY TotalSales DESC;
END;
GO

EXEC GetSalesSummary;