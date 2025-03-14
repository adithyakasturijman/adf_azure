
  
    

        create or replace transient table mini_project.staging.products
         as
        (WITH RAW_FORM AS (
    SELECT
    DISTINCT * 
    FROM mini_project.raw.ONLINE_FOOD_DELIVERY_PRODUCTS
    WHERE PRODUCT_ID IS NOT NULL AND PRODUCT_FAMILY IS NOT NULL AND PRODUCT_SUB_FAMILY IS NOT NULL
    ORDER BY PRODUCT_ID
)
SELECT
*
FROM
RAW_FORM
        );
      
  