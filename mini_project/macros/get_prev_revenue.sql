{% macro get_prev_revenue(previousdate,CUSTOMER_ID,product_id) -%}
 
    select TOTAL_REVENUE from {{ref('join')}}
    where PAYMENT_MONTH={{previousdate}} AND CUSTOMER_ID={{CUSTOMER_ID}} and product_id={{product_id}}
 
{%- endmacro %}