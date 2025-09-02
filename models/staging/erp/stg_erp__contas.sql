WITH base AS (
    SELECT
        NUM_CONTA AS num_conta,
        COD_CLIENTE AS cod_cliente,
        COD_AGENCIA AS cod_agencia,
        COD_COLABORADOR AS cod_colaborador,
        COALESCE(UPPER(TRIM(TIPO_CONTA)), 'NÃO INFORMADO') AS tipo_conta,
        TRY_TO_TIMESTAMP(DATA_ABERTURA) AS data_abertura,
        CAST(SALDO_TOTAL AS FLOAT) AS saldo_total,
        CAST(SALDO_DISPONIVEL AS FLOAT) AS saldo_disponivel,
        TRY_TO_TIMESTAMP(DATA_ULTIMO_LANCAMENTO) AS data_ultimo_lancamento
    FROM {{ source('erp', 'CONTAS') }}
)

SELECT * FROM base