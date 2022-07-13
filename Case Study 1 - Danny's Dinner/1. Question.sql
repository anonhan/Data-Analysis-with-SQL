-- What is the total amount each customer spent at the restaurant?

WITH amt_spent AS
			(SELECT S.customer_id, 
				S.product_id, 
				SUM(CASE WHEN s.product_id IS NOT NULL THEN 1 ELSE 0 END) as Total_Orders   
			FROM 	sales S
           		GROUP B S.customer_id, S.product_id
            )
SELECT 		A.customer_id,
	 	SUM(A.Total_Orders * price) 'Total Amount Spent' 
FROM		amt_spent AS A JOIN menu M ON M.product_id = A.product_id 
GROUP BY	A.customer_id;
