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
-- ANSWER
-- total_revenue, start_date, end_date
-- 5175405.87,	2022-01-01,	2025-12-31

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
-- ANSWER
-- sales_year, sales_month, monthly_revenue
2022	1	70597.51
2022	2	63225.69
2022	3	64779.71
2022	4	78465.40
2022	5	73037.02
2022	6	66868.55
2022	7	72096.47
2022	8	73904.91
2022	9	77869.16
2022	10	83610.78
2022	11	70526.89
2022	12	84464.75
2023	1	115439.64
2023	2	91815.52
2023	3	101529.42
2023	4	94095.22
2023	5	93011.83
2023	6	88203.90
2023	7	98822.98
2023	8	107203.90
2023	9	95680.79
2023	10	108715.83
2023	11	106648.71
2023	12	111495.71
2024	1	99272.17
2024	2	96699.78
2024	3	95231.21
2024	4	91875.84
2024	5	89476.87
2024	6	97550.01
2024	7	107203.90
2024	8	98470.41
2024	9	105926.21
2024	10	110232.92
2024	11	107911.50
2024	12	115439.64
2025	1	148558.26
2025	2	131102.08
2025	3	138083.24
2025	4	138626.24
2025	5	133865.16
2025	6	144521.48
2025	7	149097.10
2025	8	151923.99
2025	9	163449.78
2025	10	250830.46
2025	11	146953.33
2025	12	170994.00;


-- 

-- Question 3: Compare New Jersey in-store revenue with the Northeast total

SELECT SUM(sales.Sale_Amount) AS northeast_revenue
FROM Store_Sales AS sales
JOIN Store_Locations AS stores
    ON sales.Store_ID = stores.StoreId
WHERE stores.State IN ('Maryland', 'Massachusetts', 'Maine', 'New Jersey');








