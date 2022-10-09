-- 2. How many unique customer orders were made?
-- Now, in this question we have to answer the number of unique orders that were made by the customers.

SELECT 
    COUNT(DISTINCT (order_id)) AS Total_orders
FROM
    customer_orders;
