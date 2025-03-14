
  
    

        create or replace transient table mini_project.mart.kpi1_ltm
         as
        (WITH BASE AS (
    SELECT
    CUSTOMER_ID,
    CUSTOMER_NAME,
    COMPANY,
    PRODUCT_ID,
    PRODUCT_FAMILY,
    PRODUCT_SUB_FAMILY,
    PAYMENT_MONTH,
    DATEADD(year,-1,PAYMENT_MONTH) AS PREVIOUS_MONTH,
    REVENUE_TYPE,
    TOTAL_REVENUE,
    QUANTITY,
    COMPANIES
    FROM 
    mini_project.intermediate_joins.outer_join
),CTE AS(
    SELECT
    BASE.CUSTOMER_ID,
    BASE.CUSTOMER_NAME,
    BASE.COMPANY,
    BASE.PRODUCT_ID,
    BASE.PRODUCT_FAMILY,
    BASE.PRODUCT_SUB_FAMILY,
    BASE.PAYMENT_MONTH,
    BASE.PREVIOUS_MONTH,
    BASE.REVENUE_TYPE,
    BASE.TOTAL_REVENUE,
    BASE.QUANTITY,
    BASE.COMPANIES,
    OJ.TOTAL_REVENUE AS PREVIOUS_MONTH_REVENUE
    FROM
    BASE LEFT JOIN mini_project.intermediate_joins.outer_join AS OJ on BASE.PREVIOUS_MONTH = OJ.PAYMENT_MONTH AND BASE.CUSTOMER_ID = OJ.CUSTOMER_ID 
),FINAL AS (
    SELECT 
*,
CASE
    WHEN PREVIOUS_MONTH_REVENUE IS NULL THEN 'NEW_CUSTOMER'
    WHEN TOTAL_REVENUE = 0 THEN 'CHURNED_CUSTOMER'
    ELSE 'RETAINED_CUSTOMER'
END AS RETENTION,
CASE
    WHEN PREVIOUS_MONTH_REVENUE IS NULL THEN 0
    WHEN TOTAL_REVENUE = 0 THEN ABS(PREVIOUS_MONTH_REVENUE)
    ELSE 0
END AS CUSTOMER_CHURN_REVENUE
FROM 
cte
ORDER BY CUSTOMER_ID
)
SELECT 
*
FROM
FINAL
ORDER BY CUSTOMER_ID,PAYMENT_MONTH
        );
      
  