select 
    total_sales
from
    {{ ref('dim__customers') }}
where
    total_sales < 0