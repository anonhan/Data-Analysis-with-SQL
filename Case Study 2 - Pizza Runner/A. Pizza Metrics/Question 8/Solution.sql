-- 8. How many pizzas were delivered that had both exclusions and extras?

SELECT 
    pizza_id,
    SUM(CASE
        WHEN
            exclusions IS NOT NULL
                AND extras IS NOT NULL
        THEN
            1
        ELSE 0
    END) AS Changes_made
FROM
    customer_orders
GROUP BY 1;
