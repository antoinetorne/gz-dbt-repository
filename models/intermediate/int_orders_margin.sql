select
    orders_id,
    date_date,
    round(sum(revenue), 2) as total_revenue,
    round(sum(quantity), 2) as total_quantities,
    round(sum(purchase_cost), 2) as total_cost,
    round(sum(margin), 2) as total_margin,
from {{ ref("int_sales_margin") }}
group by orders_id, date_date
