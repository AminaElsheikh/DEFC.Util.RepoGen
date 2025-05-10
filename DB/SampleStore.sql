CREATE DATABASE SampleStore;
GO
USE SampleStore;
GO
-- Create Product Categories Table
CREATE TABLE ProductCategories (
    CategoryId INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(100) NOT NULL
);
GO
-- Create Products Table
CREATE TABLE Products (
    ProductId INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(150) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    CategoryId INT NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (CategoryId) REFERENCES ProductCategories(CategoryId)
);
GO
-- Create Customers Table
CREATE TABLE Customers (
    CustomerId INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(100),
    LastName NVARCHAR(100),
    Email NVARCHAR(150)
);
GO
-- Create Orders Table
CREATE TABLE Orders (
    OrderId INT PRIMARY KEY IDENTITY(1,1),
    OrderDate DATETIME DEFAULT GETDATE(),
    CustomerId INT NOT NULL,
    TotalAmount DECIMAL(12,2) NOT NULL,
    FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId)
);
GO 
-- Create Order Items Table
CREATE TABLE OrderItems (
    OrderItemId INT PRIMARY KEY IDENTITY(1,1),
    OrderId INT NOT NULL,
    ProductId INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (OrderId) REFERENCES Orders(OrderId),
    FOREIGN KEY (ProductId) REFERENCES Products(ProductId)
);
GO



-- Insert data
INSERT INTO ProductCategories (CategoryName)
VALUES ('Electronics'), ('Books'), ('Clothing');
GO
INSERT INTO Products (ProductName, Price, CategoryId)
VALUES 
('Smartphone', 699.99, 1),
('Novel', 19.99, 2),
('T-shirt', 14.99, 3);
GO
INSERT INTO Customers (FirstName, LastName, Email)
VALUES 
('Alice', 'Johnson', 'alice.johnson@example.com'),
('Bob', 'Smith', 'bob.smith@example.com');
GO
INSERT INTO Orders (CustomerId, TotalAmount)
VALUES 
(1, 150.00),  -- For Alice
(2, 230.00);  -- For Bob
GO

--SP
CREATE PROCEDURE sp_CreateProduct
    @ProductName NVARCHAR(150),
    @Price DECIMAL(10,2),
    @CategoryId INT
AS
BEGIN
    INSERT INTO Products (ProductName, Price, CategoryId)
    VALUES (@ProductName, @Price, @CategoryId);
    
    SELECT SCOPE_IDENTITY() AS NewProductId;
END
GO
CREATE PROCEDURE sp_GetAllProducts
AS
BEGIN
    SELECT 
        p.ProductId,
        p.ProductName,
        p.Price,
        p.CreatedAt,
        c.CategoryName
    FROM Products p
    JOIN ProductCategories c ON p.CategoryId = c.CategoryId;
END
GO
CREATE PROCEDURE sp_GetProductById
    @ProductId INT
AS
BEGIN
    SELECT 
        p.ProductId,
        p.ProductName,
        p.Price,
        p.CreatedAt,
        c.CategoryName
    FROM Products p
    JOIN ProductCategories c ON p.CategoryId = c.CategoryId
    WHERE p.ProductId = @ProductId;
END
GO
CREATE PROCEDURE sp_UpdateProduct
    @ProductId INT,
    @ProductName NVARCHAR(150),
    @Price DECIMAL(10,2),
    @CategoryId INT
AS
BEGIN
    UPDATE Products
    SET ProductName = @ProductName,
        Price = @Price,
        CategoryId = @CategoryId
    WHERE ProductId = @ProductId;
END
GO
CREATE PROCEDURE sp_DeleteProduct
    @ProductId INT
AS
BEGIN
    DELETE FROM Products
    WHERE ProductId = @ProductId;
END
GO
CREATE PROCEDURE sp_CreateCustomer
    @FirstName NVARCHAR(100),
    @LastName NVARCHAR(100),
    @Email NVARCHAR(150)
AS
BEGIN
    INSERT INTO Customers (FirstName, LastName, Email)
    VALUES (@FirstName, @LastName, @Email);
    
    SELECT SCOPE_IDENTITY() AS NewCustomerId;
END
GO
CREATE PROCEDURE sp_GetAllCustomers
AS
BEGIN
    SELECT * FROM Customers;
END
GO
CREATE PROCEDURE sp_GetCustomerById
    @CustomerId INT
AS
BEGIN
    SELECT * FROM Customers WHERE CustomerId = @CustomerId;
END
GO
CREATE PROCEDURE sp_UpdateCustomer
    @CustomerId INT,
    @FirstName NVARCHAR(100),
    @LastName NVARCHAR(100),
    @Email NVARCHAR(150)
AS
BEGIN
    UPDATE Customers
    SET FirstName = @FirstName,
        LastName = @LastName,
        Email = @Email
    WHERE CustomerId = @CustomerId;
END
GO
CREATE PROCEDURE sp_DeleteCustomer
    @CustomerId INT
AS
BEGIN
    DELETE FROM Customers WHERE CustomerId = @CustomerId;
END
GO
CREATE PROCEDURE sp_CreateOrder
    @CustomerId INT,
    @TotalAmount DECIMAL(12,2)
AS
BEGIN
    INSERT INTO Orders (CustomerId, TotalAmount)
    VALUES (@CustomerId, @TotalAmount);

    SELECT SCOPE_IDENTITY() AS NewOrderId;
END
GO
CREATE PROCEDURE sp_GetAllOrders
AS
BEGIN
    SELECT 
        o.OrderId,
        o.OrderDate,
        o.TotalAmount,
        c.FirstName + ' ' + c.LastName AS CustomerName
    FROM Orders o
    JOIN Customers c ON o.CustomerId = c.CustomerId;
END
GO
CREATE PROCEDURE sp_GetOrderById
    @OrderId INT
AS
BEGIN
    SELECT 
        o.OrderId,
        o.OrderDate,
        o.TotalAmount,
        c.FirstName + ' ' + c.LastName AS CustomerName
    FROM Orders o
    JOIN Customers c ON o.CustomerId = c.CustomerId
    WHERE o.OrderId = @OrderId;
END
GO
CREATE PROCEDURE sp_UpdateOrder
    @OrderId INT,
    @CustomerId INT,
    @TotalAmount DECIMAL(12,2)
AS
BEGIN
    UPDATE Orders
    SET CustomerId = @CustomerId,
        TotalAmount = @TotalAmount
    WHERE OrderId = @OrderId;
END
GO
CREATE PROCEDURE sp_DeleteOrder
    @OrderId INT
AS
BEGIN
    DELETE FROM Orders WHERE OrderId = @OrderId;
END
GO


