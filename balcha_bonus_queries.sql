USE sample_sales;

USE sample_sales;

-- Bonus Question 1: Create a list of all transactions that took place on January 15, 2024, 
-- sorted by sale amount fromhighest to lowest

SELECT
    id AS sale_id,
    Transaction_Date,
    Store_ID,
    Prod_Num,
    Sale_Amount
FROM Store_Sales
WHERE Transaction_Date = '2024-01-15'
ORDER BY Sale_Amount DESC, id;


-- Bonus Question 2: List in-store transactions greater than $500.
SELECT
    Transaction_Date,
    Store_ID,
    Prod_Num,
    Sale_Amount
FROM Store_Sales
WHERE Sale_Amount > 500;


-- Bonus Question 3: Find products with the prefix 105250 and show their category.
SELECT
    products.ProdNum AS product_number,
    categories.Category AS product_category
FROM Products AS products
JOIN Inventory_Categories AS categories
    ON products.Categoryid = categories.Categoryid
WHERE products.ProdNum LIKE '105250%';



-- Bonus Question 4: Total revenue and average amount for in-store sales
SELECT
    SUM(Sale_Amount) AS total_revenue,
    ROUND(AVG(Sale_Amount), 2) AS average_transaction_amount
FROM Store_Sales;



-- Bonus Question 5: Count in-store sales records by product category.
SELECT
    categories.Category AS product_category,
    COUNT(*) AS transaction_count
FROM Store_Sales AS sales
JOIN Products AS products
    ON sales.Prod_Num = products.ProdNum
JOIN Inventory_Categories AS categories
    ON products.Categoryid = categories.Categoryid
GROUP BY categories.Categoryid, categories.Category
ORDER BY transaction_count DESC, product_category;


-- Bonus 6: Find the highest- and lowest-revenue stores.
SELECT
    stores.StoreId AS store_id,
    stores.StoreLocation AS store_city,
    stores.State,
    SUM(sales.Sale_Amount) AS total_revenue
FROM Store_Sales AS sales
JOIN Store_Locations AS stores
    ON sales.Store_ID = stores.StoreId
GROUP BY stores.StoreId, stores.StoreLocation, stores.State
ORDER BY total_revenue DESC, store_id;


-- Bonus 7: Rank product categories by total revenue.
SELECT
    categories.Category AS product_category,
    SUM(sales.Sale_Amount) AS total_revenue
FROM Store_Sales AS sales
JOIN Products AS products
    ON sales.Prod_Num = products.ProdNum
JOIN Inventory_Categories AS categories
    ON products.Categoryid = categories.Categoryid
GROUP BY categories.Categoryid, categories.Category
ORDER BY total_revenue DESC, product_category;



-- Bonus 8: Find stores whose combined sales exceed $50,000.
SELECT
    Store_ID AS store_id,
    SUM(Sale_Amount) AS total_revenue
FROM Store_Sales
GROUP BY Store_ID
HAVING SUM(Sale_Amount) > 50000
ORDER BY total_revenue DESC, store_id;


-- Bonus 9: List sales records in either of the two categories.
SELECT
    sales.id AS sale_id,
    sales.Transaction_Date,
    sales.Store_ID,
    sales.Prod_Num,
    sales.Sale_Amount,
    categories.Category AS product_category
FROM Store_Sales AS sales
JOIN Products AS products
    ON sales.Prod_Num = products.ProdNum
JOIN Inventory_Categories AS categories
    ON products.Categoryid = categories.Categoryid
WHERE categories.Category IN ('Textbooks', 'Technology & Accessories')
ORDER BY sales.id;


-- Bonus 10: List textbook sales from $100 through $200.
SELECT
    sales.id AS sale_id,
    sales.Transaction_Date,
    sales.Store_ID,
    sales.Prod_Num,
    sales.Sale_Amount,
    categories.Category AS product_category
FROM Store_Sales AS sales
JOIN Products AS products
    ON sales.Prod_Num = products.ProdNum
JOIN Inventory_Categories AS categories
    ON products.Categoryid = categories.Categoryid
WHERE categories.Category = 'Textbooks'
  AND sales.Sale_Amount BETWEEN 100 AND 200
ORDER BY sales.Sale_Amount, sales.id;


-- Bonus 11: Show total revenue and location for each listed store.
SELECT
    stores.StoreId AS store_id,
    stores.StoreLocation AS store_city,
    stores.State,
    COALESCE(SUM(sales.Sale_Amount), 0) AS total_revenue
FROM Store_Locations AS stores
LEFT JOIN Store_Sales AS sales
    ON stores.StoreId = sales.Store_ID
GROUP BY stores.StoreId, stores.StoreLocation, stores.State
ORDER BY stores.State, store_city, store_id;



-- Bonus 12: Attach store location and state sales manager to each sale.
SELECT
    sales.Transaction_Date,
    sales.Sale_Amount,
    stores.StoreLocation AS store_city,
    stores.State,
    management.SalesManager AS sales_manager
FROM Store_Sales AS sales
LEFT JOIN Store_Locations AS stores
    ON sales.Store_ID = stores.StoreId
LEFT JOIN Management AS management
    ON stores.State = management.State
ORDER BY sales.id;


-- Bonus 13: Rank regions by total in-store revenue.
SELECT
    regions.Region,
    SUM(sales.Sale_Amount) AS total_revenue
FROM Store_Sales AS sales
JOIN Store_Locations AS stores
    ON sales.Store_ID = stores.StoreId
JOIN (
    SELECT DISTINCT State, Region
    FROM Management
) AS regions
    ON stores.State = regions.State
GROUP BY regions.Region
ORDER BY total_revenue DESC, regions.Region;





-- Bonus 14: Compare in-store revenue and shipper terms by state.
SELECT
    shippers.ShiptoState AS state,
    shippers.PreferredShipper AS preferred_shipper,
    shippers.VolumeDiscount AS volume_discount,
    SUM(sales.Sale_Amount) AS total_revenue
FROM Store_Sales AS sales
JOIN Store_Locations AS stores
    ON sales.Store_ID = stores.StoreId
JOIN Shipper_List AS shippers
    ON stores.State = shippers.ShiptoState
GROUP BY
    shippers.ShiptoState,
    shippers.PreferredShipper,
    shippers.VolumeDiscount
ORDER BY total_revenue DESC, state;



-- Bonus 15: Find states with in-store sales and no shipper listing.
SELECT DISTINCT
    stores.State
FROM Store_Sales AS sales
JOIN Store_Locations AS stores
    ON sales.Store_ID = stores.StoreId
LEFT JOIN Shipper_List AS shippers
    ON stores.State = shippers.ShiptoState
WHERE shippers.ShiptoState IS NULL
ORDER BY stores.State;



-- Bonus 16: Calculate total in-store revenue by regional director.
SELECT
    directors.RegionalDirector AS regional_director,
    SUM(sales.Sale_Amount) AS total_revenue
FROM Store_Sales AS sales
JOIN Store_Locations AS stores
    ON sales.Store_ID = stores.StoreId
JOIN (
    SELECT DISTINCT State, RegionalDirector
    FROM Management
) AS directors
    ON stores.State = directors.State
GROUP BY directors.RegionalDirector
ORDER BY total_revenue DESC, regional_director;



-- Bonus 17: List sales from stores located in Texas.
SELECT
    sales.id AS sale_id,
    sales.Transaction_Date,
    sales.Store_ID,
    sales.Prod_Num,
    sales.Sale_Amount
FROM Store_Sales AS sales
WHERE sales.Store_ID IN (
    SELECT stores.StoreId
    FROM Store_Locations AS stores
    WHERE stores.State = 'Texas'
)
ORDER BY sales.id;




-- Bonus 18: Compare each store's total with the average store total.
SELECT
    stores.StoreId AS store_id,
    stores.StoreLocation AS store_city,
    stores.State,
    SUM(sales.Sale_Amount) AS total_revenue
FROM Store_Sales AS sales
JOIN Store_Locations AS stores
    ON sales.Store_ID = stores.StoreId
GROUP BY stores.StoreId, stores.StoreLocation, stores.State
HAVING SUM(sales.Sale_Amount) > (
    SELECT AVG(store_totals.total_revenue)
    FROM (
        SELECT
            Store_ID,
            SUM(Sale_Amount) AS total_revenue
        FROM Store_Sales
        GROUP BY Store_ID
    ) AS store_totals
)
ORDER BY total_revenue DESC, store_id;


-- Bonus 19: Select the five highest-revenue stores, then add their locations.
SELECT
    top_stores.store_id,
    stores.StoreLocation AS store_city,
    stores.State,
    top_stores.total_revenue
FROM (
    SELECT
        Store_ID AS store_id,
        SUM(Sale_Amount) AS total_revenue
    FROM Store_Sales
    GROUP BY Store_ID
    ORDER BY total_revenue DESC, store_id
    LIMIT 5
) AS top_stores
JOIN Store_Locations AS stores
    ON top_stores.store_id = stores.StoreId
ORDER BY top_stores.total_revenue DESC, top_stores.store_id;



-- Bonus 20: List sales from stores in states assigned to the Northeast.
SELECT
    sales.id AS sale_id,
    sales.Transaction_Date,
    sales.Store_ID,
    sales.Prod_Num,
    sales.Sale_Amount
FROM Store_Sales AS sales
WHERE sales.Store_ID IN (
    SELECT stores.StoreId
    FROM Store_Locations AS stores
    WHERE stores.State IN (
        SELECT management.State
        FROM Management AS management
        WHERE management.Region = 'Northeast'
    )
)
ORDER BY sales.id;
























