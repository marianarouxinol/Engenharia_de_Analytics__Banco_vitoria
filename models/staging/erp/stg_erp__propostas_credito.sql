WITH base AS (
    SELECT
        COD_PROPOSTA AS cod_proposta,
        COD_CLIENTE AS cod_cliente,
        COD_COLABORADOR AS cod_colaborador,
        TRY_TO_TIMESTAMP(DATA_ENTRADA_PROPOSTA) AS data_entrada_proposta,
        CAST(TAXA_JUROS_MENSAL AS FLOAT) AS taxa_juros_mensal,
        CAST(VALOR_PROPOSTA AS FLOAT) AS valor_proposta,
        CAST(VALOR_FINANCIAMENTO AS FLOAT) AS valor_financiamento,
        CAST(VALOR_ENTRADA AS FLOAT) AS valor_entrada,
        CAST(VALOR_PRESTACAO AS FLOAT) AS valor_prestacao,
        CAST(QUANTIDADE_PARCELAS AS INT) AS quantidade_parcelas,
        CAST(CARENCIA AS INT) AS carencia,
        COALESCE(UPPER(TRIM(STATUS_PROPOSTA)), 'NÃO INFORMADO') AS status_proposta
    FROM {{ source('erp', 'PROPOSTAS_CREDITO') }}
)

SELECT * FROM base