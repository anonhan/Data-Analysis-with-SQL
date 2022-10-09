-- 7. For each customer, how many delivered pizzas had at least 1 change and how many had no changes?

-- As there are some null values in both these columns let's deal it with first.
-- Here we will try to use Regular Expression.
UPDATE customer_orders SET exclusions = NULL WHERE exclusions LIKE "%null%" OR exclusions LIKE "";
UPDATE customer_orders SET extras = NULL WHERE extras LIKE "%null%" OR extras LIKE "";

-- Let's see the changes now.
select * from customer_orders;

-- Let's answer the question now. We use the simple logic here, if the exlusions and extras is NULL then it means the changes were not made otherwise we can say that the changes were made
-- during booking of the order. 
SELECT 
    customer_id,
    SUM(CASE
        WHEN exclusions IS NULL AND extras IS NULL THEN 1
        ELSE 0
    END) AS No_changes_made,
    SUM(CASE
        WHEN
            exclusions IS NOT NULL
                OR extras IS NOT NULL
        THEN
            1
        ELSE 0
    END) AS Changes_made
FROM
    customer_orders
GROUP BY 1;
-- If we try to match with table we could see that the results are correct.
