 {{ config(materialized="table") }}


select
    ordop.date_date,
    count(ordop.orders_id) as nb_transactions,
    round(sum(ordop.revenue), 2) as daily_revenue,
    round(sum(ordop.revenue) / count(ordop.orders_id), 2) as average_basket,
    round(sum(ordop.margin), 2) as daily_margin,
    -- operational_margin,
    round(sum(ordop.purchase_cost), 2) as daily_purchase_cost,
    round(sum(ordop.shipping_fee), 2) as daily_shipping_fees,
    round(sum(ordop.log_cost), 2) as daily_log_costs,
    round(sum(ordop.qty), 2) as daily_qty,
from {{ ref("int_orders_operational") }} as ordop
group by date_date
