

select
    o.date_date,
    count(distinct orders_id) as nb_transactions,
    round(sum(revenue), 2) as revenue,
    round(avg(revenue), 2) as average_basket,
    round(sum(operational_margin), 2) as operational_margin,
    round(sum(purchase_cost), 2) as total_purchase_cost,
    round(sum(s.shipping_fee), 2) as total_shipping_fees,
    round(sum(s.logcost), 2) as total_log_costs,
    cast(sum(quantity) as int64) as total_quantity_sold
from {{ref("int_orders_operational")}} o
join {{ref("int_orders_margin")}} m
using (orders_id)
join {{ref("stg_raw__ship")}} s
using (orders_id)
group by o.date_date
order by o.date_date desc
