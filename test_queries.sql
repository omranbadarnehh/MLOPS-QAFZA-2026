SELECT
    order_id,
    order_status,
    order_estimated_delivery_date,
    order_delivered_customer_date,
    (order_delivered_customer_date > order_estimated_delivery_date) AS was_late
FROM
    olist_orders
WHERE
    order_status = 'delivered'
    AND order_delivered_customer_date IS NOT NULL
LIMIT 20;


SELECT
    ord.order_id,
    ord.order_status,
    p.product_category_name,
    oi.price,
    oi.freight_value
FROM
    olist_orders AS ord
INNER JOIN olist_order_items AS oi
    ON ord.order_id = oi.order_id
INNER JOIN olist_products AS p
    ON oi.product_id = p.product_id
LIMIT 20;


SELECT
    o.customer_id,
    customer_city,
    order_purchase_timestamp
FROM
    olist_customers AS o
INNER JOIN olist_orders AS ord
    ON o.customer_id = ord.customer_id
WHERE
    order_status = 'delivered';