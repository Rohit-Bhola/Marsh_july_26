-- Objects in Pipeline
-- Streaming table, Materialized view, and Temp View

-- Orders ingestion 
create streaming table orders as 
select *,_metadata.file_name, _metadata.file_path, current_timestamp as ingestion_date 
from stream (read_files('/Volumes/dev/naval/raw/etl/orders',format=>"json"));

-- customers ingestion
create streaming table customer as 
select *,_metadata.file_name, _metadata.file_path, current_timestamp as ingestion_date 
from stream (read_files('/Volumes/dev/naval/raw/etl/customers/',format=>"json"));


-- payment ingestion
create streaming table payments as 
select *,_metadata.file_name, _metadata.file_path, current_timestamp as ingestion_date 
from stream read_files('/Volumes/dev/naval/raw/etl/payments/',format=>"csv",
schema=> "transaction_id int, customer_id int, transaction_date timestamp, order_id int, type string");

