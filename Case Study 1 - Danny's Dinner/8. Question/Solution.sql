-- 8. What is the total items and amount spent for each member before they became a member?

WITH amount_spent_b4_membership AS (
		SELECT 	sales.customer_id,
				product_id,
                COUNT(product_id) AS Total_Orders
		FROM
			sales,
			members
		WHERE
			order_date < join_date
				AND sales.customer_id = members.customer_id
		GROUP BY sales.customer_id, product_id
		ORDER BY order_date ASC
        ) 
        SELECT	customer_id,
				SUM(Total_Orders * Price) 
        FROM	amount_spent_b4_membership A, menu M
        WHERE	A.product_id = M.product_id
        GROUP BY customer_id;
