-- 4. What was the average distance travelled for each customer?
-- To compute this we first need to clean the distance column.

-- Let's replace the km with blank in all the cells. For this we can use replace() function available in SQL.
UPDATE runner_orders SET distance = replace(distance,"km","");
UPDATE runner_orders SET distance = NULL WHERE distance LIKE "%null%";

-- Let's see the changes now
select * from runner_orders;

-- The column is clean now, we are good to go now!
SELECT 
    CO.customer_id,
    ROUND(AVG(RO.distance), 3) AS Average_distance_per_customer
FROM
    customer_orders CO
        JOIN
    runner_orders RO ON RO.order_id = CO.order_id
GROUP BY 1
ORDER BY 2 DESC;

-- Average highest distance is travelled for the customer with id 105, whereas lowest for the customer with 104 customer id.
