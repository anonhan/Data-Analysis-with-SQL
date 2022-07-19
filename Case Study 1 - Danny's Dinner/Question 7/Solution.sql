-- 7. Which item was purchased just before the customer became a member?

-- The same logic of the previous problem can be applied here, we just need to change the where clause to < and the row_number() should be ordered in descending order,
-- because we want to show the last order just before the member

WITH member_last_purchase AS (
		SELECT 	sales.customer_id, 
				    order_date, 
            product_id,
            ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date DESC) AS ranks
		FROM
            sales,
            members
		WHERE
			      order_date < join_date
			      	AND sales.customer_id = members.customer_id
		ORDER BY order_date ASC
        ) 
        
		SELECT	customer_id,
				    order_date,
            product_id
            FROM 	member_last_purchase 
    WHERE 	ranks=1;
