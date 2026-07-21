create materialized view payment_sum as 
select payment_method,sum(total_amount) as totalamount  from order_cleaned group by payment_method;


create materialized view top5_customers as
select
  c.customer_id,
  c.customer_name,
  sum(o.total_amount) as total_amount
from dev.rohit_silver.customer_cleaned c
join dev.rohit_silver.order_cleaned o
  on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
order by total_amount desc
limit 5;