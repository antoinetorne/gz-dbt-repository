select
    ordop.date_date,
    count(ordop.orders_id) as nb_transactions,
    round(sum(ordop.revenue), 1) as daily_revenue,
    round(sum(ordop.revenue) / count(ordop.orders_id), 1) as average_basket,
    round(sum(ordop.margin), 1) as daily_margin,
    round(sum((ordop.revenue+ordop.shipping_fee)-ordop.purchase_cost-ordop.log_cost-ordop.ship_cost),1) as operational_margin,
    round(sum(ordop.purchase_cost), 1) as daily_purchase_cost,
    round(sum(ordop.shipping_fee), 1) as daily_shipping_fees,
    round(sum(ordop.log_cost), 1) as daily_log_costs,
    round(sum(ordop.qty), 1) as daily_qty,
    round(sum(ordop.ship_cost),1) as daily_ship_cost,
from {{ ref("int_orders_operational") }} as ordop
group by 1
order by 1 desc
