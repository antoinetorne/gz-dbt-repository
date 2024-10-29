select
    omargin.orders_id,
    omargin.date_date,
    round(sum(omargin.total_margin+oship.shipping_fee-oship.logcost-oship.ship_cost),2) as operational_margin,
    round(sum(omargin.total_revenue),2) AS revenue
    round(sum(omargin.total_cost),2) AS purchase_cost
    round(sum(omargin.total_quantities),2) AS qty,
    round(sum(omargin.total_margin),2) AS margin,
    round(sum(oship.shipping_fee),2) AS shipping_fee,
    round(sum(oship.logcost),2) AS log_cost,
    round(sum(oship.ship_cost),2) AS ship_cost,
from {{ ref('int_orders_margin') }} as omargin
inner join {{ ref("stg_raw__ship") }} as oship 
    using (orders_id)
group by orders_id, date_date
