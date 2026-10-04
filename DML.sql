-- Data load for the Olist tables.
-- I imported these with the pgAdmin Import/Export tool (CSV, header on). The \copy
-- commands below do the same thing from psql. Run from the project folder:
--   psql -d olist_ecommerce -f DML.sql
-- Parent tables load first so the foreign keys in DDL.sql are satisfied.

\copy customers FROM 'Dataset/olist_customers_dataset.csv' WITH (FORMAT csv, HEADER true);
\copy sellers FROM 'Dataset/olist_sellers_dataset.csv' WITH (FORMAT csv, HEADER true);
\copy products FROM 'Dataset/olist_products_dataset.csv' WITH (FORMAT csv, HEADER true);
\copy orders FROM 'Dataset/olist_orders_dataset.csv' WITH (FORMAT csv, HEADER true);
\copy order_items FROM 'Dataset/olist_order_items_dataset.csv' WITH (FORMAT csv, HEADER true);
\copy geolocation FROM 'Dataset/olist_geolocation_dataset.csv' WITH (FORMAT csv, HEADER true);
\copy order_payments FROM 'Dataset/olist_order_payments_dataset.csv' WITH (FORMAT csv, HEADER true);
\copy order_reviews FROM 'Dataset/olist_order_reviews_dataset.csv' WITH (FORMAT csv, HEADER true);
