select
date_date,
round(sum(ads_cost),2) as ads_cost,
round(sum(impression),2) as ads_impressions,
round(sum(click),2) as ads_clicks,

from {{ ref('int_campaigns') }}

group by 1
order by 1 DESC
