--Use WITH. 
--Calculate the average count of orders from total users.
WITH table1
     AS (SELECT DISTINCT user_id,
                         Count(order_id) AS orders_count
         FROM   user_actions
         WHERE  action = 'create_order'
         GROUP  BY user_id)
SELECT Round(Avg(orders_count), 2) AS orders_avg
FROM   table1 