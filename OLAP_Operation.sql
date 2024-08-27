-- OLAP Operation
CREATE DATABASE sales_data;
use sales_data;

CREATE TABLE sales_sample (
    Product_Id INT,
    Region VARCHAR(50),
    Date DATE,
    Sales_Amount NUMERIC
);
INSERT INTO sales_sample (Product_Id, Region, Date, Sales_Amount) VALUES
(1, 'East', '2024-01-01', 100),
(2, 'West', '2024-01-02', 200),
(3, 'North', '2024-01-03', 150),
(4, 'South', '2024-01-04', 120),
(1, 'East', '2024-02-01', 300),
(2, 'West', '2024-02-02', 250),
(3, 'North', '2024-02-03', 220),
(4, 'South', '2024-02-04', 180),
(1, 'East', '2024-03-01', 500),
(2, 'West', '2024-03-02', 400);

SELECT Region, Product_Id, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY Region, Product_Id
ORDER BY Region;

SELECT 
    COALESCE(Region, 'All Regions') AS Region,
    COALESCE(CAST(Product_Id AS CHAR), 'Total') AS Product,
    SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY Region, Product_Id WITH ROLLUP
ORDER BY Region, Product;



-- For a specific region:
SELECT *
FROM sales_sample
WHERE Region = 'East';


-- For a specific date range:
SELECT *
FROM sales_sample
WHERE Date BETWEEN '2024-01-01' AND '2024-02-01';

SELECT *
FROM sales_sample
WHERE Region IN ('East', 'West') AND Product_Id IN (1, 2) AND Date BETWEEN '2024-04-01' AND '2024-05-01';



