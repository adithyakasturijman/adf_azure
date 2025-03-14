
  
    

        create or replace transient table mini_project.staging.customers
         as
        (WITH RAW_FORM AS (
    SELECT
    DISTINCT * 
    FROM mini_project.raw.ONLINE_FOOD_DELIVERY_CUSTOMERS
    WHERE customer_id IS NOT NULL AND company IS NOT NULL AND customer_name IS NOT NULL
    ORDER BY customer_id
)
SELECT
CAST(CUSTOMER_ID AS INT) AS CUSTOMER_ID,
CUSTOMER_NAME,
COMPANY
FROM RAW_FORM
        );
      
  