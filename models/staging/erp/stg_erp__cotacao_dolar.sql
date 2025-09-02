WITH base AS (

    SELECT
        DATA AS data_dolar,
        CAST(VALOR AS FLOAT) AS cotacao_diaria

    FROM BANVIC.RAW_BANVIC.COTACAO_DOLAR

)

SELECT *
FROM base