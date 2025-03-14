WITH RAW_FORM AS (
    SELECT
    DISTINCT * 
    FROM mini_project.raw.ONLINE_FOOD_DELIVERY_TRANSACTIONS
    WHERE
    CUSTOMER_ID IS NOT NULL AND 
    PRODUCT_ID IS NOT NULL AND 
    PAYMENT_MONTH IS NOT NULL AND 
    REVENUE_TYPE IS NOT NULL AND 
    REVENUE IS NOT NULL AND 
    QUANTITY IS NOT NULL AND
    DIMENSION_1 IS NOT NULL AND
    DIMENSION_2 IS NOT NULL AND
    DIMENSION_3 IS NOT NULL AND
    DIMENSION_4 IS NOT NULL AND
    DIMENSION_5 IS NOT NULL AND
    DIMENSION_6 IS NOT NULL AND
    DIMENSION_7 IS NOT NULL AND
    DIMENSION_8 IS NOT NULL AND
    DIMENSION_9 IS NOT NULL AND
    DIMENSION_10 IS NOT NULL AND
    COMPANIES IS NOT NULL
    ORDER BY PAYMENT_MONTH
)
SELECT
CAST(CUSTOMER_ID AS INT) AS CUSTOMER_ID,
PRODUCT_ID,
TRY_TO_DATE(PAYMENT_MONTH, 'MM-DD-YYYY') AS PAYMENT_MONTH,
CAST(REVENUE_TYPE AS SMALLINT) AS REVENUE_TYPE,
CAST(REVENUE AS FLOAT) AS REVENUE,
CAST(QUANTITY AS SMALLINT) AS QUANTITY,
COMPANIES
FROM RAW_FORM