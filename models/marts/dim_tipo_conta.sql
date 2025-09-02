SELECT DISTINCT
    tipo_conta,
    tipo_conta AS descricao
FROM {{ ref('stg_erp__contas') }}