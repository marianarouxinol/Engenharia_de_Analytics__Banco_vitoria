WITH base AS (
    SELECT
        COD_COLABORADOR AS cod_colaborador,
        INITCAP(TRIM(PRIMEIRO_NOME)) AS primeiro_nome,
        INITCAP(TRIM(ULTIMO_NOME)) AS ultimo_nome,
        LOWER(TRIM(EMAIL)) AS email,
        REGEXP_REPLACE(CPF, '[^0-9]', '') AS cpf,
        TRY_TO_DATE(DATA_NASCIMENTO) AS data_nascimento,
        TRIM(ENDERECO) AS endereco,
        REGEXP_REPLACE(CEP, '[^0-9]', '') AS cep
    FROM {{ source('erp', 'COLABORADORES') }}
)

SELECT * FROM base