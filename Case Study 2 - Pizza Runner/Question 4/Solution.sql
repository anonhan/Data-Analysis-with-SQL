SELECT 
    PN.pizza_name, COUNT(CO.pizza_id) AS Total_orders
FROM
    runner_orders RO
        JOIN
    customer_orders CO ON CO.order_id = RO.order_id
        JOIN
    pizza_names PN ON PN.pizza_id = CO.pizza_id
WHERE
    RO.cancellation IS NULL
GROUP BY 1;
