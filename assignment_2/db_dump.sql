CREATE TABLE Sales (
    OrderID INT PRIMARY KEY,
    ProductName VARCHAR(255),
    Category VARCHAR(50),
    OrderDate DATE,
    Quantity INT,
    UnitPrice DECIMAL(10, 2)
);

INSERT INTO Sales (OrderID, ProductName, Category, OrderDate, Quantity, UnitPrice)
VALUES
    (1, 'Widget A', 'Electronics', '2023-01-10', 5, 19.99),
    (2, 'Widget B', 'Electronics', '2023-01-15', 3, 29.99),
    (3, 'Gadget X', 'Electronics', '2023-01-18', 2, 49.99),
    (4, 'Gadget Y', 'Electronics', '2023-02-05', 4, 39.99),
    (5, 'Widget C', 'Electronics', '2023-02-12', 7, 24.99),
    (6, 'Widget A', 'Electronics', '2023-03-03', 6, 19.99),
    (7, 'Widget B', 'Electronics', '2023-03-10', 2, 29.99),
    (8, 'Gadget X', 'Electronics', '2023-03-18', 3, 49.99),
    (9, 'Gadget Y', 'Electronics', '2023-04-02', 8, 39.99),
    (10, 'Widget C', 'Electronics', '2023-04-10', 4, 24.99);
