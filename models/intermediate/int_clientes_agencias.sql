WITH relacao AS (
    SELECT
        "COD_AGENCIAS" AS cod_agencia,
        "COD_COLABORADORES" AS cod_colaborador
    FROM BANVIC.dbt_mrouxinol_erp.stg_erp__colaborador_agencia
),

colaboradores AS (
    SELECT
        cod_colaborador,
        primeiro_nome,
        ultimo_nome,
        cpf
    FROM BANVIC.dbt_mrouxinol_erp.stg_erp__colaboradores
),

agencias AS (
    SELECT
        cod_agencia,
        nome_agencia,
        cidade,
        uf
    FROM BANVIC.dbt_mrouxinol_erp.stg_erp__agencias
)

SELECT
    col.cod_colaborador,
    col.primeiro_nome AS primeiro_nome_colaborador,
    col.ultimo_nome AS ultimo_nome_colaborador,
    col.cpf AS cpf_colaborador,

    ag.cod_agencia,
    ag.nome_agencia,
    ag.cidade,
    ag.uf AS uf_agencia

FROM relacao r
LEFT JOIN colaboradores col ON r.cod_colaborador = col.cod_colaborador
LEFT JOIN agencias ag ON r.cod_agencia = ag.cod_agencia