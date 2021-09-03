with source_supplier as (

    select * from {{ source('public', 'supplier') }}

),

supplier as (

    select
        s_suppkey as key,
        s_name as name,
        s_address as address, 
        s_nationkey as nation_key,
        s_phone as phone,
        s_acctbal as account_bal

    from source_supplier

)

select * from supplier