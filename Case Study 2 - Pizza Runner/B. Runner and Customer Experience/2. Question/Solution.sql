
-- 2. What was the average time in minutes it took for each runner to arrive at the Pizza Runner HQ to pickup the order?

-- In this question we need to get the average pickup time, and for that first we need to get the time taken for each order
-- by each runner after placing the order. So, it could be extracted by subtracting the order_time from the pickup_time 
-- and as we need to get time, therefore we will use timediff() which returns the difference between to dates. After that we will use 
-- time_to_sec() to convert the time into seconds and dividing it by 60 will return the time in minutes and in the end we can use
-- AVG() function over it. 

SELECT RO.runner_id,
       Avg(Time_to_sec(Timediff(RO.pickup_time, CO.order_time)) / 60)
FROM   customer_orders CO
       JOIN runner_orders RO
         ON CO.order_id = RO.order_id
GROUP  BY RO.runner_id; 
