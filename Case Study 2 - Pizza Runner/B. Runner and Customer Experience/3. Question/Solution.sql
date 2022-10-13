-- 3. Is there any relationship between the number of pizzas and how long the order takes to prepare?
-- Very much similar to the previous question, just to need to make few changes.

SELECT 
    CO.order_id,
    COUNT(CO.order_id) AS Number_of_pizzas,
    ROUND(AVG(TIME_TO_SEC((TIMEDIFF(pickup_time, order_time))) / 60),
            3) AS 'averag_time(min)'
FROM
    runner_orders RO
        JOIN
    customer_orders CO ON CO.order_id = RO.order_id
GROUP BY 1
ORDER BY 2 ASC;
