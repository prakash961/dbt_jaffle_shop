{{config(materialized='view')}}
with cte as(
    select * from {{ref('raw_orders')}}
),
renamed as (
select id as orderID,
       user_id as customerID,order_date,status
       from cte
)
select * from renamed