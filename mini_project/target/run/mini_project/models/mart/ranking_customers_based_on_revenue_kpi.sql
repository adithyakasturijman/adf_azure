
  
    

        create or replace transient table mini_project.mart.ranking_customers_based_on_revenue_kpi
         as
        (WITH CUSTOMER_REVENUE AS (
    SELECT
        CUSTOMER_ID,
        CUSTOMER_NAME,
        ROUND(SUM(TOTAL_REVENUE),3) AS TOTAL_REVENUE_BY_CUSTOMER
    FROM
    mini_project.intermediate_joins.outer_join
    GROUP BY CUSTOMER_ID,CUSTOMER_NAME
)
SELECT 
    *,
    RANK() OVER( ORDER BY TOTAL_REVENUE_BY_CUSTOMER DESC) AS RANK
FROM 
CUSTOMER_REVENUE
        );
      
  