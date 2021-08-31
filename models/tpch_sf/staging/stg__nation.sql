with source_nation as (

    select * from {{ source('tpch_sf001', 'nation') }}

),

nation as (

    select
        n_nationkey as key,
        n_name as name,
        n_regionkey as region_key

    from source_nation

)

select * from nation