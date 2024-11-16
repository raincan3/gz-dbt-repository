select 
    products_id,
    orders_id,
    date_date,
    round(purchase_price * quantity, 2) as purchase_cost,
    round(revenue - (purchase_price * quantity), 2) as margin
from {{ref("stg_raw__sales")}} 
join {{ref("stg_raw__product")}}
using (products_id)
