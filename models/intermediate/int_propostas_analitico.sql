{{ config(materialized='table') }}

with propostas as (
    select *
    from {{ ref('stg_erp__propostas_credito') }}
),

clientes as (
    select *
    from {{ ref('stg_erp__clientes') }}
),

colaboradores as (
    select *
    from {{ ref('stg_erp__colaboradores') }}
),

agencias as (
    select *
    from {{ ref('stg_erp__agencias') }}
),

base as (
    select
        p.cod_propostas,
        p.datas_entradas_propostas,
        p.status_propostas,
        p.valores_propostas,
        p.valores_financiamentos,
        p.valores_entradas,
        p.valores_prestacoes,
        p.taxas_juros_mensais,
        p.quantidades_parcelas,
        p.carencias,

        c.cod_clientes,
        c.tipos_clientes,
        c.datas_nascimentos,

        col.cod_colaboradores,
        col.primeiros_nomes,
        col.ultimos_nomes,

        a.cod_agencias,
        a.nomes_agencias,
        a.ufs

    from propostas p
    left join clientes c on p.cod_clientes = c.cod_clientes
    left join colaboradores col on p.cod_colaboradores = col.cod_colaboradores
    left join agencias a on p.cod_agencias = a.cod_agencias
)

select *
from base