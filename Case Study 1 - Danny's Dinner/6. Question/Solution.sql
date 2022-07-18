-- 6. Which item was purchased first by the customer after they became a member?

-- First thing to keep in mind is that membership date should be greater than or equal to the date of purchase.
-- Secondly, we only want to select those customer who are in the list of customers.
-- Finally, we use row_number() function to rank each subgroup in ascending order of purchase date (to assign the rank 1 to the first date of purchase) 

WITH member_first_purchase AS (
		SELECT 	sales.customer_id, 
				order_date, 
				product_id,
				ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date ASC) AS ranks
		FROM
			sales,
			members
		WHERE
			order_date >= join_date
				AND sales.customer_id = members.customer_id
		ORDER BY order_date ASC
        ) 
		SELECT	customer_id,
				order_date,
                product_id
        FROM 	member_first_purchase 
        WHERE 	ranks=1;
        
