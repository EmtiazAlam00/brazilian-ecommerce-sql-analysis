# Brazilian E-Commerce Data Analysis (SQL)

SQL practice on the [Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce), using PostgreSQL.

## Files

- `DDL.sql`: table definitions for the 8 Olist tables (customers, sellers, products, orders, order_items, geolocation, order_payments, order_reviews)
- `DML.sql`: data changes
- `DQL.sql`: analysis queries, from basic aggregations up to joins, CTEs and window functions

## Setup

1. Download the dataset from Kaggle and unzip the CSVs into `Dataset/`.
2. Create the database: `createdb olist_ecommerce`
3. Run `DDL.sql`, then import each CSV into its table (with `\copy` in psql or the pgAdmin import tool).
