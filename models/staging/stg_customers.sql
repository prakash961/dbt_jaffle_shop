{{config(materialized='view')}}
with cte as(
    select * from {{ref('raw_customers')}}
),
renamed as (
select id as customerID,
       first_name,last_name
       from cte
)
select * from renamed