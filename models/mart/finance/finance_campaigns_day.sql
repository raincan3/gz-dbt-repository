select
    date_date as date,
    round((operational_margin - ads_cost), 2) as ads_margin,
    average_basket,
    operational_margin,
    ads_cost,
    ads_impression,
    ads_click,
    total_quantity_sold,
    revenue,
    total_purchase_cost,
    total_shipping_fees,
    total_log_costs
from {{ ref("finance_days") }}
join {{ ref("int_campaigns_day") }} using (date_date)
order by date_date desc
