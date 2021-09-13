select
    retail_price,
    available_qty,
    supply_cost,
    inventory
from
    {{ ref('dim__parts') }}
where
    retail_price < 0 or available_qty < 0 or supply_cost < 0 or inventory < 0    