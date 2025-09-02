SELECT
    cod_agencia,
    nome_agencia,
    cidade,
    uf AS uf_agencia,
    data_abertura AS data_abertura_agencia
FROM {{ ref('stg_erp__agencias') }}