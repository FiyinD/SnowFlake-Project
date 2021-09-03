with source_region as (

    select * from {{ source('public', 'region') }}

),

region as (

    select
        r_regionkey as key,
        r_name as name

    from source_region

)

select * from region