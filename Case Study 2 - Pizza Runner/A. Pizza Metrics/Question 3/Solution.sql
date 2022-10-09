-- 3. How many successful orders were delivered by each runner?
-- If the cancellation column in runner_orders table does contains any information regarding the cancellation, then it means that particular order was cancelled.
-- We can also use duration(but it's qquite simple you can try it out), but let's see how to get the results using the cancellation column
SELECT * FROM runner_orders;

-- We need to clean the cacncellation column before using it.
-- Replace everything with NULL except the column that contain some infromation regarding the cancellation of the order.
UPDATE runner_orders SET cancellation=NULL WHERE cancellation NOT LIKE "%cancel%";

-- Let's find out the solution now
SELECT 
    runner_id, COUNT(*) AS successful_orders
FROM
    runner_orders
WHERE
    cancellation IS NULL
GROUP BY runner_id;
