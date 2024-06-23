--Calculate the total orders. 
--Calculate orders with five or more items and find a percentage of orders with five or more items in the total number of orders.
SELECT Count(order_id) AS orders,
       Count(product_ids) filter (WHERE (
              array_length(product_ids, 1)) >= 5) AS large_orders,
       round((count(product_ids) filter (WHERE (
              array_length(product_ids, 1)) >= 5)) / (count(order_id)::decimal), 2) AS large_orders_share
FROM   orders