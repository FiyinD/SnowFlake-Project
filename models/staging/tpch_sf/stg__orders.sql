with source_orders as (

    select * from {{ source('public', 'orders') }}

),

orders as (

    select
        o_orderkey as key,
        o_custkey as customer_key,
        o_orderstatus as order_status,
        o_totalprice as total_price,
        o_orderdate as order_date,
        o_orderpriority as priority,
        o_clerk as clerk,
        o_shippriority as shippriority

    from source_orders

)

select * from orders