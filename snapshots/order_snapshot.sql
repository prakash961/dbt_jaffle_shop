{%snapshot order_snapshot%}

{{config(
    target_database='postgres',
    target_schema='snapshots',
    unique_key='orderID',
    strategy='timestamp',
    updated_at='order_date'
    )
}}

select * from {{ref('stg_orders')}}

{%endsnapshot%}