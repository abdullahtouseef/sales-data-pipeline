{{ config(materialized='table') }}

SELECT
    order_id,
    city,
    product,
    CAST(price AS DOUBLE) AS price,
    CAST(quantity AS INT) AS quantity,
    CAST(price AS DOUBLE) * CAST(quantity AS INT) AS total_sales,
    CAST(order_date AS DATE) AS order_date
FROM axure_final_ws.default.sales_raw
WHERE order_id IS NOT NULL
  AND price > 0
  AND quantity > 0