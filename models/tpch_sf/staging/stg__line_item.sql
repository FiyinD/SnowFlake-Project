with source_lineitem as (

    select * from {{ source('tpch_sf001', 'lineitem') }}

),

lineitem as (

    select
        l_orderkey as order_key,
        l_partkey as part_key,
        l_suppkey as supplier_key,
        l_linenumber as number,
        l_quantity as quantity,
        l_extendedprice extended_price,
        l_discount as discount,
        l_tax as tax,
        l_returnflag as return_flag,
        l_linestatus as line_status,
        l_shipdate as ship_date,
        l_commitdate as commit_date,
        l_receiptdate as receipt_date,
        l_shipinstruct as ship_instruct,
        l_shipmode as ship_mode

    from source_lineitem

)

select * from lineitem