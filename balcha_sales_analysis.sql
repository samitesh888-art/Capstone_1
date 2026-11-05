-- Capstone 1: Sales Territory Analysis
-- Territory: New Jersey, in-store sales
-- Region: Northeast
-- Analyst: Samuel Balcha

USE sample_sales;

-- 1. Total revenue and date range

-- 2. Revenue by year and month

-- 3. New Jersey revenue compared with Northeast revenue

-- 4. Monthly transactions and average transaction amount by category

-- 5. Store performance ranking

-- 6. Recommendation for next quarter


-- Learning Note: Inspect column names and data types.
DESCRIBE Store_Sales;

-- Learning Note: Preview 10 rows without changing any data.
SELECT *
FROM Store_Sales
LIMIT 10;


-- Learning Note: Identify the states and managers in your region.
SELECT Region, State, SalesManager
FROM Management
WHERE Region = 'Northeast';

-- Question 1: New Jersey’s total in-store revenue and the earliest and latest recorded sale dates.

--  Find out which stores belong to New Jersey

SELECT StoreId, StoreLocation, State
FROM Store_Locations
WHERE State = 'New Jersey';

-- Match each sale to its store

SELECT sales.Transaction_Date,
       sales.Store_ID,
       stores.State,
       sales.Sale_Amount
FROM Store_Sales AS sales
JOIN Store_Locations AS stores
    ON sales.Store_ID = stores.StoreId
WHERE stores.State = 'New Jersey'
LIMIT 10;

-- Turn the New Jersey sales into one summary

SELECT
    SUM(sales.Sale_Amount) AS total_revenue,
    MIN(sales.Transaction_Date) AS start_date,
    MAX(sales.Transaction_Date) AS end_date
FROM Store_Sales AS sales
JOIN Store_Locations AS stores
    ON sales.Store_ID = stores.StoreId
WHERE stores.State = 'New Jersey';
-- Total revenue = 5175405.87
-- 

-- Question 2: New Jersey in-store revenue by year and month

SELECT
    YEAR(sales.Transaction_Date) AS sales_year,
    MONTH(sales.Transaction_Date) AS sales_month,
    SUM(sales.Sale_Amount) AS monthly_revenue
FROM Store_Sales AS sales
JOIN Store_Locations AS stores
    ON sales.Store_ID = stores.StoreId
WHERE stores.State = 'New Jersey'
GROUP BY sales_year, sales_month
ORDER BY sales_year, sales_month;










