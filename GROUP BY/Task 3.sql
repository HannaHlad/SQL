--Calculate the common count of created orders and the rate of canceled orders.
SELECT   user_id,
         Count(order_id) filter (WHERE action = 'create_order') AS orders_count,
         round((count(order_id) filter (WHERE action = 'cancel_order'))/((count(order_id) filter (WHERE action = 'create_order'))::decimal), 2) AS cancel_rate
FROM     user_actions
GROUP BY user_id
HAVING   count(order_id) filter ( WHERE action = 'create_order') > 3
AND      round((count(order_id) filter ( WHERE action = 'cancel_order'))/((count(order_id) filter ( WHERE action = 'create_order'))::decimal), 2) >= 0.5
ORDER BY user_id