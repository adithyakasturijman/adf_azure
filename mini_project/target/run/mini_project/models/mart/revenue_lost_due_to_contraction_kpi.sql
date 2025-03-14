
  
    

        create or replace transient table mini_project.mart.revenue_lost_due_to_contraction_kpi
         as
        (WITH monthly_revenue AS (
    SELECT
        payment_month,
        SUM(revenue) AS total_revenue
    FROM
        mini_project.intermediate_joins.join
    GROUP BY
        PAYMENT_MONTH
)
SELECT
    PAYMENT_MONTH
    total_revenue,
    LAG(total_revenue) OVER (ORDER BY PAYMENT_MONTH) AS PREVIOUS_MONTH_REVENUE,
    CASE
        WHEN TOTAL_REVENUE<PREVIOUS_MONTH_REVENUE THEN ABS(PREVIOUS_MONTH_REVENUE-TOTAL_REVENUE)
        ELSE 0
    END AS REVENUE_LOST
FROM
    monthly_revenue
ORDER BY
    PAYMENT_MONTH
        );
      
  