with orders as {{ ref('fct__orders') }},

summarized_orders as (
    select 
        customer_key,
        sum(total_price) as total_sales
    from 
        orders
    group by 
        total_sales
),

customers as {{ ref('stg__customers') }},

refined_customers as (
    select 
        customers.key,
        name,
        account_bal,
        coalesce(orders.total_sales, 0) as total_sales,
        market_segment,
        address,
        customers.nation_key,
        customer.phone
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
),

select * from refined_customers