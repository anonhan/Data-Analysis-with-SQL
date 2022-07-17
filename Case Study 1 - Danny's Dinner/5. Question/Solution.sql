-- Step 1: First select that how many times each item has been bought by each customer using group by
-- Step 2: assigning rank to each subgroup in desc order by Total Orders (freq)

WITH Popular_items AS (
		SELECT	P.customer_id,
				P.product_id,
                P.freq,
                ROW_NUMBER() OVER (PARTITION BY customer_id ORDER By freq DESC) AS ranks
        FROM	Products_Bought P
        )
		SELECT 	customer_id,
				product_iD,
				freq AS Total_Orders
		FROM 	Popular_items
		WHERE	ranks = 1;
