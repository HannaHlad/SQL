--Calculate the average count of orders from total users.
SELECT Round(Avg(orders_count), 2) AS orders_avg
FROM   (SELECT DISTINCT user_id,
                        Count(order_id) AS orders_count
        FROM   user_actions
        WHERE  action = 'create_order'
        GROUP  BY user_id) AS table1 