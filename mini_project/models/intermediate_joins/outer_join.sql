select
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
{{ref('join')}} as j 
inner join
{{ref('month_revenue')}} as mr
on j.customer_id=mr.customer_id and j.product_id=mr.product_id AND j.payment_month=mr.payment_month
order by CUSTOMER_ID,PAYMENT_MONTH