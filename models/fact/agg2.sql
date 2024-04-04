with customers as (

    select * from {{ ref('stg_customers') }}

),

orders as (

    select * from {{ ref('stg_orders') }}

),

payments as (

    select * from {{ ref('stg_payments') }}

),

customer_orders as (

        select
        orders.customerID,

        min(orders.order_date) as first_order,
        max(orders.order_date) as most_recent_order,
        count(orders.orderID) as number_of_orders
    from orders

    group by customerID

),

customer_payments as (

    select
        orders.customerID,
        sum(payments.amount) as total_amount

    from payments

    left join orders on
         payments.orderID = orders.orderID

    group by orders.customerID

),

final as (

    select
        customers.customerID,
        customers.first_name,
        customers.last_name,
        customer_orders.first_order,
        customer_orders.most_recent_order,
        customer_orders.number_of_orders,
        customer_payments.total_amount as customer_lifetime_value

    from customers

    left join customer_orders
        on customers.customerID = customer_orders.customerID

    left join customer_payments
        on  customers.customerID = customer_payments.customerID

)

select * from final