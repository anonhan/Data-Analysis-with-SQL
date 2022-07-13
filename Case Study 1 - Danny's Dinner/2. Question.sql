-- 2. How many days has each customer visited the restaurant?

SELECT 
    S.customer_id, COUNT(S.order_date) AS 'Total Visits'
FROM
    sales S
GROUP BY S.customer_id;
