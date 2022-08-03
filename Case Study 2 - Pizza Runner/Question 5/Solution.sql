-- 5. How many Vegetarian and Meatlovers were ordered by each customer?

SELECT 
    CO.customer_id,
    PN.Pizza_name,
    COUNT(CO.pizza_id) AS Total_orders
FROM
    customer_orders CO
        JOIN
    Pizza_names PN ON PN.pizza_id = CO.pizza_id
GROUP BY 1 , 2
ORDER BY 1;
