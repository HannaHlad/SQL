--Calculate the average size of the order on weekends and weekdays.
SELECT CASE
         WHEN To_char(creation_time, 'Dy') IN ( 'Sat', 'Sun' ) THEN 'weekend'
         ELSE 'weekdays'
       END                                         AS week_part,
       Round(Avg(Array_length(product_ids, 1)), 2) AS avg_order_size
FROM   orders
GROUP  BY week_part
ORDER  BY avg_order_size 