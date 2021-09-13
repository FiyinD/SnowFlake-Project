with orders as (select * from {{ ref('fct__orders') }}),

summarized_orders as (
    select 
        customer_key,
        sum(total_price) as total_sales
    from 
        orders
    group by 
        customer_key
),

customers as (select * from {{ ref('stg__customers') }}),

refined_customers as (
    select 
        customers.key,
        name,
        account_bal,
        coalesce(summarized_orders.total_sales, 0) as total_sales,
        market_segment,
        address,
        customers.nation_key,
        customers.phone
    from
        customers
    left join
        summarized_orders
    on 
        customers.key = summarized_orders.customer_key
    order by
        total_sales,
        account_bal
    desc
)

select * from refined_customers