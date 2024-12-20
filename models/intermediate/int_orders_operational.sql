select
    orders_id,
    m.date_date,
    round(
        SUM(margin) + SUM(shipping_fee) - SUM(logcost) - SUM(ship_cost), 
        2
    ) as operational_margin,
    round(sum(shipping_fee), 2) as shipping_fee,
    round(sum(logcost), 2) as logcost,
    round(sum(ship_cost), 2) as ship_cost
from {{ref("int_orders_margin")}} m
join {{ref("stg_raw__ship")}} s
using (orders_id)
group by orders_id, m.date_date
order by m.date_date
