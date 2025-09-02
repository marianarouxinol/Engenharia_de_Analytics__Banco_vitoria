WITH base AS (

    SELECT
        COD_TRANSACAO AS cod_transacao,
        NUM_CONTA AS num_conta,

        -- Corrigido: vírgula entre as colunas
        CAST(TRY_TO_TIMESTAMP(REPLACE(DATA_TRANSACAO, ' UTC', '')) AS DATE) AS data_transacao,

        INITCAP(TRIM(NOME_TRANSACAO)) AS tipo_transacao,
        CAST(VALOR_TRANSACAO AS FLOAT) AS valor_transacao

    FROM BANVIC.RAW_BANVIC.TRANSACOES

)

SELECT *
FROM base