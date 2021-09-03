with source_customers as (

    select * from {{ source('public', 'customer') }}

),

customers as (

    select
        c_custkey as key,
        c_name as name,
        c_address as address,
        c_nationkey as nation_key,
        c_phone as phone,
        c_acctbal as account_bal,
        c_mktsegment as market_segment

    from source_customers

)

select * from customers