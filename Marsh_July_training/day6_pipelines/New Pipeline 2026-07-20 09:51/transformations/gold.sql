create materialized view dev.naval_gold.payment_sum as 
select payment_method,sum(total_amount) as totalamount  from dev.naval_silver.order_cleaned group by payment_method;


create materialized view dev.naval_gold.top5_customers as
select
  c.customer_id,
  c.customer_name,
  sum(o.total_amount) as total_amount
from dev.naval_silver.customers_cleaned c
join dev.naval_silver.order_cleaned o
  on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
order by total_amount desc
limit 5;