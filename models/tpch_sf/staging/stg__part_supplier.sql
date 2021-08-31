with source_part_supplier as (

    select * from {{ source('tpch_sf001', 'partsupp') }}

),

part_supplier as (

    select
        ps_partkey as part_key,
        ps_suppkey as key,
        ps_availqty as available_qty,
        ps_supplycost as supply_cost

    from source_part_supplier

)

select * from part_supplier