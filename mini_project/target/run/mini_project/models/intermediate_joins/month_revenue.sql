
  
    

        create or replace transient table mini_project.intermediate_joins.month_revenue
         as
        (SELECT 
    customer_id,
    product_id,
    payment_month,
    SUM(revenue) AS total_revenue
FROM 
    mini_project.intermediate_joins.join
GROUP BY 
    customer_id, 
    product_id,
    payment_month
ORDER BY 
    customer_id, 
    product_id, 
    payment_month
        );
      
  