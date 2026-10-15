{{ config(materialized='table') }}

SELECT
    city,
    product,
    COUNT(*) AS total_orders,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(total_sales), 2) AS total_revenue
FROM {{ ref('my_first_dbt_model') }}
GROUP BY city, product