
  
    

        create or replace transient table mini_project.mart.ranking_products_based_on_revenue_kpi
         as
        (WITH PRODUCT_REVENUE AS (
    SELECT
        PRODUCT_ID,
        SUM(TOTAL_REVENUE) AS TOTAL_REVENUE_BY_PRODUCT
    FROM
    mini_project.intermediate_joins.outer_join
    GROUP BY PRODUCT_ID
)
SELECT 
    *,
    RANK() OVER( ORDER BY TOTAL_REVENUE_BY_PRODUCT DESC) AS RANK
FROM 
PRODUCT_REVENUE
        );
      
  