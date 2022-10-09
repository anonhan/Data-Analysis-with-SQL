-- 1. How many pizzas were ordered?


-- To answer this, first we need to understand that a customer can order multiple pizzas in a single order, as the requirement is to count the total number of 
-- pizzas that were ordered, so we have to include all the orders with the same order id.
SELECT 
    COUNT(order_id) AS Total_orders
FROM
    customer_orders;
