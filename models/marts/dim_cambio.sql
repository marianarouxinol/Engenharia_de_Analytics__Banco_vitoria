SELECT
    data_dolar AS data_cotacao,
    cotacao_media_dia,
    ano,
    mes,
    ano_mes
FROM {{ ref('stg_erp__cotacao_dolar') }}