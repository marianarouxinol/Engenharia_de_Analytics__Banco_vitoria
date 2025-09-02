SELECT
    cod_cliente,
    tipo_cliente,
    data_nascimento,
    cpf_cnpj
    -- uf_cliente ← removido por ausência
FROM {{ ref('stg_erp__clientes') }}