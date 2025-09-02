WITH base AS (

    SELECT
        COD_AGENCIA AS cod_agencia,
        INITCAP(TRIM(NOME)) AS nome_agencia,
        TRIM(ENDERECO) AS endereco,
        INITCAP(TRIM(CIDADE)) AS cidade,
        UPPER(TRIM(UF)) AS uf,
        TRY_TO_DATE(DATA_ABERTURA) AS data_abertura,
        COALESCE(UPPER(TRIM(TIPO_AGENCIA)), 'NÃO INFORMADO') AS tipo_agencia

    FROM BANVIC.RAW_BANVIC.AGENCIAS

),

final AS (

    SELECT *
    FROM base

)

SELECT *
FROM final