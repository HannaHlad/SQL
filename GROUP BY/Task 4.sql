--Calculate the common count of created orders.
--Calculate the common count of canceled orders.
--Calculate the common count of delivered orders.
--Percentage of not canceled orders in common count of orders. 

SELECT   Date_part('isodow', time)::integer                                                                                                                                                                  AS weekday_number,
         to_char(time,'Dy')                                                                                                                                                                      AS weekday,
         count(order_id) filter (WHERE action = 'create_order')                                                                                                                                              AS created_orders,
         count(order_id) filter (WHERE action = 'cancel_order')                                                                                                                                              AS canceled_orders,
         (count(order_id) filter (WHERE action = 'create_order') - count(order_id) filter (WHERE action = 'cancel_order'))                                                                                   AS actual_orders,
         round((((count(order_id) filter (WHERE action = 'create_order')) - (count(order_id) filter (WHERE action = 'cancel_order'))) / count(order_id) filter (WHERE action = 'create_order')::decimal), 3) AS success_rate
FROM     user_actions
WHERE    time BETWEEN '2022-08-23' AND      '2022-09-07'
GROUP BY date_part('isodow', time)::integer,
         to_char(            time,'Dy')
ORDER BY weekday_number