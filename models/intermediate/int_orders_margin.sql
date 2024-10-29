SELECT
orders_id,
date_date,
ROUND(SUM(revenue),2) AS total_revenue, 
ROUND(SUM(quantity),2) AS total_quantities,
ROUND(SUM(purchase_cost),2) AS total_cost,
ROUND(SUM(margin),2) AS total_margin,
FROM {{ ref('int_sales_margin') }}
GROUP BY orders_id, date_date