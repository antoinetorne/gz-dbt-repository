select
    format_date('%Y-%m', date_date) as date_month,
    round(sum(ads_margin),1) as ads_margin,
    round(sum(average_basket),1) as average_basket,
    round(sum(operational_margin),1) as operational_margin,
    round(sum(ads_cost),1) as ads_cost,
    round(sum(ads_impressions),1) as ads_impressions,
    round(sum(ads_clicks),1) as ads_clicks,
    round(sum(daily_qty),1) as qty,
    round(sum(daily_revenue),1) as revenue,
    round(sum(daily_purchase_cost),1) as purchase_cost,
    round(sum(daily_margin),1) as margin,
    round(sum(daily_shipping_fees),1) as shipping_fees,
    round(sum(daily_log_costs),1) as log_costs,
from {{ ref("finance_campaigns_day") }}
group by 1
order by 1 desc
