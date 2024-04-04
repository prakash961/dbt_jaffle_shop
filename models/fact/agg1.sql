with customers as 
(
    select * from {{ref('stg_customers')}}
),

orders as (
    select  * from {{ref('stg_orders')}}
),

payments as(
    select * from {{ref('stg_payments')}}
)

select c.customerID,p.payment_method,sum(p.discounted_price) as total  from 
customers c join orders o on c.customerID=o.customerID
join payments p on o.orderID=p.orderID
where o.status='completed'
group by c.customerID,p.payment_method
order by c.customerID
