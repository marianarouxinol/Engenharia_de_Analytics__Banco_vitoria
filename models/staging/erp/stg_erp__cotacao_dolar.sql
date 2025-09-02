WITH base AS (
    SELECT
        TRY_TO_DATE(DATA) AS data,
        CAST(VALOR AS FLOAT) AS cotacao_dolar
    FROM {{ source('erp', 'COTACAO_DOLAR') }}
)

SELECT * FROM base