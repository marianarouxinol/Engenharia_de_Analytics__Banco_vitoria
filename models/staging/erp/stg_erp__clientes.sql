WITH base AS (
    SELECT
        COD_CLIENTE AS cod_cliente,
        INITCAP(TRIM(PRIMEIRO_NOME)) AS primeiro_nome,
        INITCAP(TRIM(ULTIMO_NOME)) AS ultimo_nome,
        LOWER(TRIM(EMAIL)) AS email,
        COALESCE(UPPER(TRIM(TIPO_CLIENTE)), 'NÃO INFORMADO') AS tipo_cliente,
        TRY_TO_TIMESTAMP(DATA_INCLUSAO) AS data_inclusao,
        REGEXP_REPLACE(CPFCNPJ, '[^0-9]', '') AS cpf_cnpj,
        TRY_TO_DATE(DATA_NASCIMENTO) AS data_nascimento,
        TRIM(ENDERECO) AS endereco,
        REGEXP_REPLACE(CEP, '[^0-9]', '') AS cep
    FROM {{ source('erp', 'CLIENTES') }}
)

SELECT * FROM base