SELECT
    data AS data_cotacao,
    cotacao_dolar AS cotacao_diaria
FROM {{ ref('stg_erp__cotacao_dolar') }}