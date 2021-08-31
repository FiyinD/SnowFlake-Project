with parts as (
    select 
        key,
        name,
        manufacturer,
        brand,
        type,
        size,
        container,
        retail_price
    from    
        {{ ref('stg__part') }}
),

part_suppliers as (
    select 
        part_key,
        key,
        available_qty,
        supply_cost
    from   
        {{ ref('stg__part_supplier') }}
    
),

final_parts as (
    select
        parts.key,
        parts.name,
        parts.manufacturer,
        parts.brand,
        parts.type,
        parts.size,
        parts.container,
        parts.retail_price,
        part_suppliers.available_qty as available_qty,
        part_suppliers.supply_cost as supply_cost,
        available_qty * supply_cost as inventory

    from
        parts
    join
        part_suppliers
    on
        parts.key = part_suppliers.part_key
)

select * from final_parts
