-- 6. What was the maximum number of pizzas delivered in a single order?
-- One thing to know before jumping into the solution is that, there could be more than one order with same number of maximum orders, so we need to fetch all those records as well.

WITH T1 AS (
			SELECT 
				CO.order_id,
				COUNT(CO.order_id) AS total_orders
			FROM
				customer_orders CO join runner_orders RN on RN.order_id = CO.order_id   
			WHERE 
				cancellation IS NULL  	-- here we are taking only those orders that were delivered successfully
			GROUP BY 1
    )
SELECT order_id, total_orders FROM T1 WHERE total_orders=(SELECT MAX(total_orders) FROM T1);
