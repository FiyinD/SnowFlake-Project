with source_part as (

    select * from {{ source('public', 'part') }}

),

part as (

    select
        p_partkey as key,
        p_name as name,
        p_mfgr as manufacturer,
        p_brand as brand,
        p_type as type,
        p_size as size,
        p_container as container,
        p_retailprice as retail_price

    from source_part

)

select * from part