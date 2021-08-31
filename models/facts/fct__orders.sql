with orders as (

    select
        key,
        customer_key,
        order_status,
        total_price,
        order_date,
        priority,
        clerk,
        shippriority

    from {{ ref('stg__orders') }}
)

select * from orders