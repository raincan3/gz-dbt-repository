select
    extract(month from date(date)) as datemonth,
    round(sum(ads_margin), 2) as ads_margin,
    round(sum(average_basket), 2) as average_basket,
    round(sum(operational_margin), 2) as operational_margin,
    round(sum(ads_cost), 2) as ads_cost,
    round(sum(ads_impression), 2) as ads_impression,
    round(sum(ads_click), 2) as ads_click,
    round(sum(total_quantity_sold), 2) as total_quantity_sold,
    round(sum(revenue), 2) as revenue,
    round(sum(total_purchase_cost), 2) as total_purchase_cost,
    round(sum(total_shipping_fees), 2) as total_shipping_fees,
    round(sum(total_log_costs), 2) as total_log_costs
from {{ref("finance_campaigns_day")}}
group by datemonth
order by datemonth desc
