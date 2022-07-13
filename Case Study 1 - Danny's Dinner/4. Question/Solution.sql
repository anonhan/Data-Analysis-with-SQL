-- -- 4. What is the most purchased item on the menu and how many times was it purchased by all customers?

WITH Max_orders AS(
		SELECT   s.product_id, 
			 COUNT(s.product_id) AS Total_orders
		FROM     sales s
		GROUP BY s.product_id
		)
SELECT 
    M.product_name, 
    MAX(T.total_orders) AS Orders
FROM
    Max_orders T
        JOIN
    menu M ON M.product_id = T.product_id
GROUP BY M.product_name
ORDER BY T.total_orders DESC
LIMIT 1;
