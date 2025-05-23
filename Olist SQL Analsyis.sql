-- SEGMENT 1: Basic Statistics
-- Overview of key entities in the database.

SELECT
    (SELECT COUNT(DISTINCT customer_id) FROM olist_customers_dataset) AS total_customers,
    (SELECT COUNT(DISTINCT seller_id) FROM olist_sellers_dataset) AS total_sellers,
    (SELECT COUNT(DISTINCT order_id) FROM olist_orders_dataset) AS total_orders;

-- Number of products, categories and unique product-seller combinations.
SELECT
    COUNT(DISTINCT p.product_id) AS total_products,
    COUNT(DISTINCT p.product_category_name) AS total_categories,
    COUNT(DISTINCT CONCAT(i.product_id, '-', i.seller_id)) AS unique_product_seller_combos
FROM olist_products_dataset p
JOIN olist_order_items_dataset i ON p.product_id = i.product_id;

-- Number of reviews and distinct review scores.
SELECT
    COUNT(DISTINCT review_id) AS total_reviews,
    COUNT(DISTINCT review_score) AS unique_scores
FROM olist_order_reviews_dataset;

SELECT
    review_score,
    COUNT(*) AS count_reviews
FROM olist_order_reviews_dataset
GROUP BY review_score
ORDER BY review_score;

-- Geographic distribution of customers and sellers.
SELECT
    COUNT(DISTINCT customer_city) AS unique_customer_cities,
    COUNT(DISTINCT customer_state) AS unique_customer_states
FROM olist_customers_dataset;

SELECT
    COUNT(DISTINCT seller_city) AS unique_seller_cities,
    COUNT(DISTINCT seller_state) AS unique_seller_states
FROM olist_sellers_dataset;


-- SEGMENT 2: Orders and Payments
-- Financial insights from order and payment data.

SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(CAST(price AS FLOAT)), 2) AS total_revenue,
    ROUND(SUM(CAST(freight_value AS FLOAT)), 2) AS total_freight,
    ROUND(SUM(CAST(price AS FLOAT) + CAST(freight_value AS FLOAT)), 2) AS grand_total,
    ROUND(AVG(CAST(price AS FLOAT) + CAST(freight_value AS FLOAT)), 2) AS avg_order_value
FROM olist_order_items_dataset;

-- Payment method usage and value distribution.
SELECT
    payment_type,
    COUNT(*) AS payment_count,
    ROUND(SUM(payment_value), 2) AS total_paid,
    ROUND(AVG(payment_value), 2) AS avg_payment
FROM olist_order_payments_dataset
GROUP BY payment_type
ORDER BY total_paid DESC;

-- Installment analysis per payment method.
SELECT
    payment_type,
    payment_installments,
    COUNT(*) AS count,
    ROUND(AVG(payment_value), 2) AS avg_value
FROM olist_order_payments_dataset
GROUP BY payment_type, payment_installments
ORDER BY payment_type, payment_installments;

-- Top 10 products by revenue.
SELECT
    i.product_id,
    p.product_category_name,
    COUNT(*) AS total_sold,
    ROUND(SUM(CAST(i.price AS FLOAT)), 2) AS total_revenue
FROM olist_order_items_dataset i
JOIN olist_products_dataset p ON i.product_id = p.product_id
GROUP BY i.product_id, p.product_category_name
ORDER BY total_revenue DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

-- Top 10 customers by spending.
SELECT
    o.customer_id,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(CAST(oi.price AS FLOAT)), 2) AS total_spent
FROM olist_orders_dataset o
JOIN olist_order_items_dataset oi ON o.order_id = oi.order_id
GROUP BY o.customer_id
ORDER BY total_spent DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;


-- SEGMENT 3: Customer Segmentation
-- Classification of customers and regional purchasing behavior.

SELECT
    o.customer_id,
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(oi.order_item_id) AS total_items,
    ROUND(SUM(CAST(oi.price AS FLOAT)), 2) AS total_spent,
    ROUND(AVG(CAST(oi.price AS FLOAT)), 2) AS avg_item_price
FROM olist_orders_dataset o
JOIN olist_order_items_dataset oi ON o.order_id = oi.order_id
GROUP BY o.customer_id
ORDER BY total_spent DESC
OFFSET 0 ROWS FETCH NEXT 15 ROWS ONLY;

-- Revenue distribution by customer state.
SELECT
    c.customer_state,
    COUNT(DISTINCT o.customer_id) AS unique_customers,
    ROUND(SUM(CAST(oi.price AS FLOAT)), 2) AS total_revenue,
    ROUND(AVG(CAST(oi.price AS FLOAT)), 2) AS avg_item_value
FROM olist_orders_dataset o
JOIN olist_order_items_dataset oi ON o.order_id = oi.order_id
JOIN olist_customers_dataset c ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY total_revenue DESC;

-- Segment classification based on total spending.
SELECT
    o.customer_id,
    ROUND(SUM(CAST(oi.price AS FLOAT)), 2) AS total_spent
INTO #CustomerSpending
FROM olist_orders_dataset o
JOIN olist_order_items_dataset oi ON o.order_id = oi.order_id
GROUP BY o.customer_id;

SELECT *,
    NTILE(5) OVER (ORDER BY total_spent DESC) AS segment_group
INTO #CustomerSegments
FROM #CustomerSpending;

SELECT
    customer_id,
    total_spent,
    CASE 
        WHEN segment_group = 1 THEN 'VIP'
        WHEN segment_group IN (2,3,4) THEN 'Medium'
        ELSE 'Low'
    END AS customer_segment
FROM #CustomerSegments
ORDER BY total_spent DESC;

-- Heatmap: Product categories by customer state.
SELECT
    c.customer_state,
    p.product_category_name,
    COUNT(*) AS total_items_sold,
    ROUND(SUM(CAST(oi.price AS FLOAT)), 2) AS total_revenue
FROM olist_orders_dataset o
JOIN olist_order_items_dataset oi ON o.order_id = oi.order_id
JOIN olist_customers_dataset c ON o.customer_id = c.customer_id
JOIN olist_products_dataset p ON oi.product_id = p.product_id
GROUP BY c.customer_state, p.product_category_name
ORDER BY c.customer_state, total_items_sold DESC;


-- SEGMENT 4: Top Products and Sellers
-- Identifying top performers by revenue and customer base.

-- Top 10 sellers by revenue.
SELECT
    seller_id,
    COUNT(*) AS total_items_sold,
    ROUND(SUM(CAST(price AS FLOAT)), 2) AS total_revenue,
    ROUND(SUM(CAST(freight_value AS FLOAT)), 2) AS total_freight
FROM olist_order_items_dataset
GROUP BY seller_id
ORDER BY total_revenue DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

-- Most frequently sold product categories.
SELECT
    p.product_category_name,
    COUNT(*) AS total_items_sold,
    ROUND(SUM(CAST(i.price AS FLOAT)), 2) AS total_revenue
FROM olist_order_items_dataset i
JOIN olist_products_dataset p ON i.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY total_items_sold DESC;

-- Sellers with the largest unique customer base.
SELECT
    i.seller_id,
    COUNT(DISTINCT o.customer_id) AS unique_customers,
    COUNT(*) AS total_items_sold
FROM olist_order_items_dataset i
JOIN olist_orders_dataset o ON i.order_id = o.order_id
GROUP BY i.seller_id
ORDER BY unique_customers DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

-- Sellers with average review score.
SELECT
    i.seller_id,
    ROUND(AVG(CAST(r.review_score AS FLOAT)), 2) AS avg_review_score,
    COUNT(*) AS review_count
FROM olist_order_reviews_dataset r
JOIN olist_order_items_dataset i ON r.order_id = i.order_id
GROUP BY i.seller_id
HAVING COUNT(*) >= 10
ORDER BY avg_review_score DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;


-- SEGMENT 5: Delays and Delivery Issues
-- Investigating delays and their business impact.

-- Orders that were delivered late.
SELECT
    order_id,
    DATEDIFF(DAY, order_estimated_delivery_date, order_delivered_customer_date) AS delay_days
FROM olist_orders_dataset
WHERE order_delivered_customer_date IS NOT NULL
  AND order_estimated_delivery_date IS NOT NULL
  AND order_delivered_customer_date > order_estimated_delivery_date
ORDER BY delay_days DESC;

-- Average delay across all late orders.
SELECT
    ROUND(AVG(DATEDIFF(DAY, order_estimated_delivery_date, order_delivered_customer_date)), 2) AS avg_delay_days
FROM olist_orders_dataset
WHERE order_delivered_customer_date > order_estimated_delivery_date;

-- Review scores vs delay length.
SELECT
    r.review_score,
    COUNT(*) AS total_reviews,
    ROUND(AVG(DATEDIFF(DAY, o.order_estimated_delivery_date, o.order_delivered_customer_date)), 2) AS avg_delay
FROM olist_order_reviews_dataset r
JOIN olist_orders_dataset o ON r.order_id = o.order_id
WHERE o.order_delivered_customer_date > o.order_estimated_delivery_date
GROUP BY r.review_score
ORDER BY r.review_score;

-- Sellers with the most delayed orders.
SELECT
    i.seller_id,
    COUNT(*) AS delayed_orders
FROM olist_order_items_dataset i
JOIN olist_orders_dataset o ON i.order_id = o.order_id
WHERE o.order_delivered_customer_date > o.order_estimated_delivery_date
GROUP BY i.seller_id
ORDER BY delayed_orders DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

-- Orders with low review score and delivery delay.
SELECT
    r.order_id,
    r.review_score,
    DATEDIFF(DAY, o.order_estimated_delivery_date, o.order_delivered_customer_date) AS delay_days
FROM olist_order_reviews_dataset r
JOIN olist_orders_dataset o ON r.order_id = o.order_id
WHERE r.review_score <= 2
  AND o.order_delivered_customer_date > o.order_estimated_delivery_date
ORDER BY delay_days DESC;
