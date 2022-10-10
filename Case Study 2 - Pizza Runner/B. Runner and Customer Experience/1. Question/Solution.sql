-- How many runners signed up for each 1 week period? (i.e. week starts 2021-01-01)

-- On 2021-01-01 it was Friday, and as per the question, the week should begin from Friday. So, by using the INTERVAL 
-- operator, we will shift the week 3 days back from the default week start day to Firday, and will perform the group by operation over it.

SELECT Week(registration_date) AS week_number,
       Count(runner_id)        AS signed_up_runners
FROM   runners
GROUP  BY Week(Date(registration_date - INTERVAL 3 day)); 
