CREATE DATABASE RetailMigrationDB;
GO
USE RetailMigrationDB;
GO
USE RetailMigrationDB;
GO

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50),
    Province VARCHAR(50),
    Email VARCHAR(100)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    UnitPrice DECIMAL(10,2)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    OrderStatus VARCHAR(30),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
SELECT name 
FROM sys.tables;
USE RetailMigrationDB;
GO

INSERT INTO Customers VALUES
(1, 'Aman Singh', 'Brampton', 'Ontario', 'aman@example.com'),
(2, 'Sara Khan', 'Mississauga', 'Ontario', 'sara@example.com'),
(3, 'John Smith', 'Calgary', 'Alberta', 'john@example.com'),
(4, 'Maria Lopez', 'Toronto', 'Ontario', 'maria@example.com'),
(5, 'David Chen', 'Vancouver', 'British Columbia', 'david@example.com');

INSERT INTO Products VALUES
(101, 'Laptop', 'Electronics', 1200.00),
(102, 'Monitor', 'Electronics', 300.00),
(103, 'Office Chair', 'Furniture', 250.00),
(104, 'Desk', 'Furniture', 450.00),
(105, 'Keyboard', 'Electronics', 80.00);

INSERT INTO Orders VALUES
(1001, 1, '2026-01-10', 'Completed'),
(1002, 2, '2026-01-12', 'Completed'),
(1003, 3, '2026-01-15', 'Pending'),
(1004, 4, '2026-01-20', 'Completed'),
(1005, 5, '2026-01-22', 'Cancelled');

INSERT INTO OrderDetails VALUES
(1, 1001, 101, 1, 1200.00),
(2, 1001, 105, 2, 80.00),
(3, 1002, 102, 1, 300.00),
(4, 1003, 103, 2, 250.00),
(5, 1004, 104, 1, 450.00),
(6, 1004, 105, 1, 80.00),
(7, 1005, 102, 1, 300.00);

SELECT 
    SUM(Quantity * UnitPrice) AS TotalSales
FROM OrderDetails;