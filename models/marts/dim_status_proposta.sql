SELECT DISTINCT
    status_proposta,
    status_proposta AS descricao
FROM {{ ref('stg_erp__propostas_credito') }}