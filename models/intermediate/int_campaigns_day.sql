select
    date_date,
    round(sum(ads_cost), 2) as ads_cost,
    round(sum(impression), 0) as ads_impression,
    round(sum(click), 0) as ads_click
from {{ref("int_campaigns")}}
group by date_date
order by date_date desc
