

-- 1. Retrieve all the records from the Sales table.
SELECT * FROM Sales;

-- 2. Calculate the total sales revenue for each product category for the year 2023. Display the category and total revenue in descending order.
SELECT Category, SUM(Quantity * UnitPrice) AS TotalRevenue
FROM Sales
WHERE YEAR(OrderDate) = 2023
GROUP BY Category
ORDER BY TotalRevenue DESC;

-- 3. Find the top 3 best-selling products by the total quantity sold in the year 2023.
SELECT ProductName, SUM(Quantity) AS TotalQuantity
FROM Sales
WHERE YEAR(OrderDate) = 2023
GROUP BY ProductName
ORDER BY TotalQuantity DESC
LIMIT 3;

-- 4. Calculate the average unit price for each product category and display the result along with the category name.
SELECT Category, AVG(UnitPrice) AS AvgUnitPrice
FROM Sales
GROUP BY Category;

-- 5. Determine the month with the highest total sales revenue in 2023 and display the month and total revenue.
SELECT DATE_FORMAT(OrderDate, '%Y-%m') AS Month, SUM(Quantity * UnitPrice) AS TotalRevenue
FROM Sales
WHERE YEAR(OrderDate) = 2023
GROUP BY Month
ORDER BY TotalRevenue DESC
LIMIT 1;

--6. Find the total number of products sold in each month of 2023. Display the month and the total quantity sold.
SELECT DATE_FORMAT(OrderDate, '%Y-%m') AS Month, SUM(Quantity) AS TotalQuantity
FROM Sales
WHERE YEAR(OrderDate) = 2023
GROUP BY Month;

-- 7. Calculate the total sales revenue for each product in 2023 and display the product name and total revenue in descending order.
SELECT ProductName, SUM(Quantity * UnitPrice) AS TotalRevenue
FROM Sales
WHERE YEAR(OrderDate) = 2023
GROUP BY ProductName
ORDER BY TotalRevenue DESC;

-- 8. Identify the date of the first sale in 2023 and the date of the latest sale in 2023.
SELECT MIN(OrderDate) AS FirstSaleDate, MAX(OrderDate) AS LatestSaleDate
FROM Sales
WHERE YEAR(OrderDate) = 2023;
