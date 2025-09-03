WITH relacao AS (
    SELECT
        "COD_AGENCIAS" AS cod_agencia,
        "COD_COLABORADORES" AS cod_colaborador
    FROM {{ ref('stg_erp__colaborador_agencia') }}
),

colaboradores AS (
    SELECT
        cod_colaborador,
        INITCAP(TRIM(primeiro_nome)) AS primeiro_nome_colaborador,
        INITCAP(TRIM(ultimo_nome)) AS ultimo_nome_colaborador,
        REGEXP_REPLACE(cpf, '[^0-9]', '') AS cpf_colaborador
    FROM {{ ref('stg_erp__colaboradores') }}
),

agencias AS (
    SELECT
        cod_agencia,
        INITCAP(TRIM(nome_agencia)) AS nome_agencia,
        INITCAP(TRIM(cidade)) AS cidade_agencia,
        UPPER(TRIM(uf)) AS uf_agencia
    FROM {{ ref('stg_erp__agencias') }}
),

clientes AS (
    SELECT
        cod_cliente,
        INITCAP(TRIM(primeiro_nome)) AS primeiro_nome_cliente,
        INITCAP(TRIM(ultimo_nome)) AS ultimo_nome_cliente,
        REGEXP_REPLACE(cpf_cnpj, '[^0-9]', '') AS cpf_cliente,
        INITCAP(TRIM(cidade)) AS cidade_cliente,
        UPPER(TRIM(uf)) AS uf_cliente,
        COALESCE(UPPER(TRIM(tipo_cliente)), 'NÃO INFORMADO') AS tipo_cliente,
        TRY_TO_DATE(data_nascimento) AS data_nascimento
    FROM {{ ref('stg_erp__clientes') }}
)

SELECT
    col.cod_colaborador,
    col.primeiro_nome_colaborador,
    col.ultimo_nome_colaborador,
    col.cpf_colaborador,

    ag.cod_agencia,
    ag.nome_agencia,
    ag.cidade_agencia,
    ag.uf_agencia,

    cli.cod_cliente,
    cli.primeiro_nome_cliente,
    cli.ultimo_nome_cliente,
    cli.cpf_cliente,
    cli.cidade_cliente,
    cli.uf_cliente,
    cli.tipo_cliente,
    cli.data_nascimento
FROM relacao r
LEFT JOIN colaboradores col ON r.cod_colaborador = col.cod_colaborador
LEFT JOIN agencias ag ON r.cod_agencia = ag.cod_agencia
LEFT JOIN clientes cli ON cli.cod_cliente = r.cod_colaborador 
