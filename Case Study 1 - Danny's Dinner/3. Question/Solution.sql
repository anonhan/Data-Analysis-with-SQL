-- 3. What was the first item from the menu purchased by each customer?

SELECT 
    s.customer_id,
    MIN(s.order_date) AS "Order Date",
    s.product_id AS 'First ordered product'
FROM
    sales s
GROUP BY s.customer_id;

