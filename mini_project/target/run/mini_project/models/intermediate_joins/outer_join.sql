
  
    

        create or replace transient table mini_project.intermediate_joins.outer_join
         as
        (select
    j.CUSTOMER_ID,
    CUSTOMER_NAME,
    COMPANY,
    j.PRODUCT_ID,
    PRODUCT_FAMILY,
    PRODUCT_SUB_FAMILY,
    j.PAYMENT_MONTH,
    REVENUE,
    REVENUE_TYPE,
    total_revenue,
    QUANTITY,
    COMPANIES
from 
mini_project.intermediate_joins.join as j 
inner join
mini_project.intermediate_joins.month_revenue as mr
on j.customer_id=mr.customer_id and j.product_id=mr.product_id AND j.payment_month=mr.payment_month
order by CUSTOMER_ID,PAYMENT_MONTH
        );
      
  