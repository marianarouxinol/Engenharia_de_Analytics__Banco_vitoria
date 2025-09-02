SELECT
    cod_colaborador,
    primeiro_nome AS nome_colaborador,
    cpf AS cpf_colaborador
FROM {{ ref('stg_erp__colaboradores') }}