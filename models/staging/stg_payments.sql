{{config(materialized='view')}}
with cte as(
    select * from {{ref('raw_payments')}}
),
renamed as (
select id as paymentID,order_id as orderID,payment_method,amount,{{discounting('amount')}} end as discounted_price from cte
)
select * from renamed