CREATE Table olist_customers(
    customer_id TEXT PRIMARY KEY,
    customer_unique_id TEXT,
    customer_zip_code_prefix TEXT ,
    customer_city TEXT,
    customer_state VARCHAR(2)
);

CREATE TABLE olist_geolocation(
    geolocation_zip_code_prefix TEXT,
    geolocation_lat DECIMAL,
    geolocation_lng DECIMAL,
    geolocation_city TEXT,
    geolocation_state VARCHAR(2)

);

CREATE TABLE olist_sellers(
    seller_id TEXT PRIMARY KEY,
    seller_zip_code_prefix TEXT,
    seller_city TEXT,
    seller_state VARCHAR(2)

);
CREATE TABLE olist_products (
    product_id TEXT PRIMARY KEY,
    product_category_name TEXT,
    product_name_lenght INT,
    product_description_lenght INT,
    product_photos_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT

);

CREATE TABLE olist_orders (
    order_id TEXT PRIMARY KEY,
    customer_id TEXT REFERENCES olist_customers(customer_id),
    order_status TEXT,
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP
);

CREATE TABLE olist_order_items(
    order_id TEXT REFERENCES olist_orders(order_id),
    order_item_id INT,
    product_id TEXT REFERENCES olist_products(product_id),
    seller_id TEXT REFERENCES olist_sellers(seller_id),
    shipping_limit_date TIMESTAMP,
    price DECIMAL,
    freight_value DECIMAL,
    PRIMARY KEY (order_id,order_item_id)


);

CREATE TABLE olist_order_payments(
    order_id TEXT REFERENCES olist_orders(order_id),
    payment_sequential INT,
    payment_type TEXT,
    payment_installments INT,
    payment_value DECIMAL,
    PRIMARY KEY (order_id, payment_sequential)

);

CREATE TABLE olist_order_reviews(
    review_id TEXT ,
    order_id TEXT REFERENCES olist_orders(order_id),
    review_score INT,
    review_comment_title TEXT,
    review_comment_message TEXT,
    review_creation_date TIMESTAMP,
    review_answer_timestamp TIMESTAMP,
    PRIMARY KEY (review_id,order_id)
);

