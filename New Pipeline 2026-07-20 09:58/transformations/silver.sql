create streaming table dev.rohit_silver.order_cleaned
( CONSTRAINT valid_customer_id EXPECT (customer_id IS NOT NULL) ON VIOLATION DROP ROW)
as
select * from stream(dev.rohit_silver.orders);


create streaming table dev.rohit_silver.customer_cleaned
( CONSTRAINT valid_customer_email EXPECT (email IS NOT NULL))
as
select * from stream(dev.rohit_silver.customer);


create streaming table dev.rohit_silver.payments_cleaned
( CONSTRAINT valid_transaction_id EXPECT (transaction_id IS NOT NULL) ON VIOLATION DROP ROW)
as
select * from stream(dev.rohit_silver.payments);