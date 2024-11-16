select
    orders_id,
    m.date_date,
    round(sum(revenue),2) as revenue,
    cast(sum(quantity) as int64) as quantity,
    round(sum(purchase_cost),2) as purchase_cost,
    round(sum(margin)) as margin
from {{ref("int_sales_margin")}} m
join {{ref("stg_raw__sales")}} s
using (orders_id)
group by orders_id, date_date
order by date_date
