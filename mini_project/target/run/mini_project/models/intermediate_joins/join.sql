
  
    

        create or replace transient table mini_project.intermediate_joins.join
         as
        (WITH customer_and_transaction_joins AS (
    SELECT
    customers.CUSTOMER_ID,
    CUSTOMER_NAME,
    COMPANY,
    PRODUCT_ID,
    PAYMENT_MONTH,
    REVENUE_TYPE,
    REVENUE,
    QUANTITY,
    transactions.COMPANIES
    FROM 
    mini_project.staging.transactions AS transactions
    INNER JOIN
    mini_project.staging.customers AS customers
    ON
    transactions.CUSTOMER_ID = customers.CUSTOMER_ID
), product_and_transactions_join AS(
    SELECT
    CUSTOMER_ID,
    CUSTOMER_NAME,
    COMPANY,
    products.PRODUCT_ID,
    PRODUCT_FAMILY,
    PRODUCT_SUB_FAMILY,
    DATE(PAYMENT_MONTH, 'YYYY-DD-MM') AS PAYMENT_MONTH,
    REVENUE_TYPE,
    REVENUE,
    QUANTITY,
    COMPANIES
    FROM
    customer_and_transaction_joins
    INNER JOIN
    mini_project.staging.products AS products 
    ON customer_and_transaction_joins.PRODUCT_ID = products.PRODUCT_ID
)
SELECT * FROM product_and_transactions_join
where REVENUE_TYPE=1
order by customer_id
        );
      
  