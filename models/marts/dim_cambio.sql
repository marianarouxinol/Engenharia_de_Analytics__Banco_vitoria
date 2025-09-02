SELECT
    data_dolar AS data_cotacao,
    cotacao_diaria
FROM {{ ref('stg_erp__cotacao_dolar') }}