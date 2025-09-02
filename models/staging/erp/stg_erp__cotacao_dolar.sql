WITH base AS (
    SELECT
        CAST(DATA AS DATE) AS data_dolar,
        CAST(VALOR AS FLOAT) AS cotacao_diaria
    FROM BANVIC.RAW_BANVIC.COTACAO_DOLAR
),

agregada AS (
    SELECT
        data_dolar,
        EXTRACT(YEAR FROM data_dolar) AS ano,
        EXTRACT(MONTH FROM data_dolar) AS mes,
        DATE_TRUNC('month', data_dolar) AS ano_mes,
        AVG(cotacao_diaria) AS cotacao_media_dia
    FROM base
    GROUP BY data_dolar, ano, mes, ano_mes
)

SELECT *
FROM agregada