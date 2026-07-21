create streaming table dev.naval_silver.order_cleaned
( CONSTRAINT valid_customer_id EXPECT (customer_id IS NOT NULL) ON VIOLATION DROP ROW)
as
select * except (_rescued_data, file_name, file_path, ingestion_date) from stream(dev.naval_bronze.orders);


create streaming table dev.naval_silver.customers_cleaned
( CONSTRAINT valid_customer_email EXPECT (email IS NOT NULL),
CONSTRAINT valid_customer_email_format EXPECT (email RLIKE '^[a-zA-Z0-9._%+\\-]+@[a-zA-Z0-9.\\-]+\\.[a-zA-Z]{2,}'))
as
select * except (_rescued_data, file_name, file_path, ingestion_date) from stream(dev.naval_bronze.customer)

