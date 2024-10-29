SELECT 
    ordop.date_date,
    count(ordop.orders_id) as nb_transactions,
    ROUND(sum(ordop.revenue),2) as daily_revenue,
    ROUND(sum(ordop.revenue)/count(ordop.orders_id),2) as average_basket,
    ROUND(sum(ordop.margin),2) as daily_margin, 
--operational_margin,
    ROUND(sum(ordop.purchase_cost),2) as daily_purchase_cost,
    ROUND(sum(ordop.shipping_fee),2) AS daily_shipping_fees, 
    ROUND(sum(ordop.log_cost),2) AS daily_log_costs,
    ROUND(sum(ordop.qty),2) as daily_qty,
from {{ ref('int_orders_operational') }} as ordop
group by date_date
    
    
    
    