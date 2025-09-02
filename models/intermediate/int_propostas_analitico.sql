WITH propostas AS (
    SELECT * FROM BANVIC.dbt_mrouxinol_erp.stg_erp__propostas_credito
),

clientes AS (
    SELECT * FROM BANVIC.dbt_mrouxinol_erp.stg_erp__clientes
),

colaboradores AS (
    SELECT * FROM BANVIC.dbt_mrouxinol_erp.stg_erp__colaboradores
),

relacao AS (
    SELECT
        "COD_AGENCIAS" AS cod_agencia,
        "COD_COLABORADORES" AS cod_colaborador
    FROM BANVIC.dbt_mrouxinol_erp.stg_erp__colaborador_agencia
),

agencias AS (
    SELECT
        cod_agencia,
        nome_agencia,
        cidade,
        uf,
        data_abertura
    FROM BANVIC.dbt_mrouxinol_erp.stg_erp__agencias
)

SELECT
    -- Proposta
    p.cod_proposta,
    p.data_entrada_proposta,
    p.status_proposta,
    p.valor_proposta,
    p.valor_financiamento,
    p.valor_entrada,
    p.valor_prestacao,
    p.taxa_juros_mensal,
    p.quantidade_parcelas,
    p.carencia,

    -- Cliente
    c.cod_cliente,
    c.tipo_cliente,
    c.data_nascimento AS data_nascimento_cliente,
    c.cpf_cnpj,

    -- Colaborador
    col.cod_colaborador,
    col.primeiro_nome AS primeiro_nome_colaborador,
    col.ultimo_nome AS ultimo_nome_colaborador,
    col.data_nascimento AS data_nascimento_colaborador,

    -- Agência
    a.cod_agencia,
    a.nome_agencia,
    a.cidade,
    a.uf AS uf_agencia,
    a.data_abertura AS data_abertura_agencia

FROM propostas p
LEFT JOIN clientes c ON p.cod_cliente = c.cod_cliente
LEFT JOIN colaboradores col ON p.cod_colaborador = col.cod_colaborador
LEFT JOIN relacao r ON col.cod_colaborador = r.cod_colaborador
LEFT JOIN agencias a ON r.cod_agencia = a.cod_agencia