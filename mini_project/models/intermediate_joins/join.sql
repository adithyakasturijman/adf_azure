WITH customer_and_transaction_joins AS (
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
    {{ref('transactions')}} AS transactions
    INNER JOIN
    {{ref('customers')}} AS customers
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
    {{ref('products')}} AS products 
    ON customer_and_transaction_joins.PRODUCT_ID = products.PRODUCT_ID
)
SELECT * FROM product_and_transactions_join
where REVENUE_TYPE=1
order by customer_id
