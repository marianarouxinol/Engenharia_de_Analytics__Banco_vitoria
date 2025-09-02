WITH base AS (

    SELECT
        COD_TRANSACAO AS cod_transacao,
        NUM_CONTA AS num_conta,

        CAST(TRY_TO_TIMESTAMP(REPLACE(DATA_TRANSACAO, ' UTC', '')) AS DATE) AS data_transacao,

        INITCAP(TRIM(NOME_TRANSACAO)) AS tipo_transacao,
        CAST(VALOR_TRANSACAO AS FLOAT) AS valor_transacao,

        -- ✅ Nova coluna: classificação do mês como par ou ímpar
        CASE 
            WHEN EXTRACT(MONTH FROM CAST(TRY_TO_TIMESTAMP(REPLACE(DATA_TRANSACAO, ' UTC', '')) AS DATE)) % 2 = 0 THEN 'Mes Par'
            ELSE 'Mes Impar'
        END AS situacao_mes

    FROM BANVIC.RAW_BANVIC.TRANSACOES

)

SELECT *
FROM base