with fd as (select * from {{ ref("finance_days") }})

select

    fd.date_date,
    round(fd.operational_margin - cd.ads_cost, 2) as ads_margin,
    fd.average_basket,
    fd.operational_margin,
    cd.ads_cost,
    cd.ads_impressions,
    cd.ads_clicks,
    fd.daily_qty,
    fd.daily_revenue,
    fd.daily_purchase_cost,
    fd.daily_margin,
    fd.daily_shipping_fees,
    fd.daily_log_costs,

from fd
inner join {{ ref("int_campaigns_day") }} as cd using (date_date)
order by 1 desc
