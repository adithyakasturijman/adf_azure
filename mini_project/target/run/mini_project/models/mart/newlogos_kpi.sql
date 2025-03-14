
  
    

        create or replace transient table mini_project.mart.newlogos_kpi
         as
        (WITH FIRST_PURCHASE AS (
    SELECT 
        CUSTOMER_ID,
        MIN(PAYMENT_MONTH) AS FIRST_PURCHASE
    FROM
    mini_project.intermediate_joins.outer_join
    GROUP BY CUSTOMER_ID
)
SELECT
    YEAR(FIRST_PURCHASE) AS FISCAL_YEAR,
    COUNT(CUSTOMER_ID) AS NEW_CUSTOMERS
FROM FIRST_PURCHASE
GROUP BY FISCAL_YEAR
        );
      
  