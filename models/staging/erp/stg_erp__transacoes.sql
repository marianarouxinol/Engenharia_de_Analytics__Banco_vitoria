WITH base AS (

    SELECT
        COD_TRANSACAO AS cod_transacao,
        NUM_CONTA AS num_conta,
        TRY_TO_DATE(DATA_TRANSACAO, 'YYYY-MM-DD') AS data_transacao,
        INITCAP(TRIM(NOME_TRANSACAO)) AS tipo_transacao,
        CAST(VALOR_TRANSACAO AS FLOAT) AS valor_transacao

    FROM {{ source('erp', 'TRANSACOES') }}

)

SELECT *
FROM base