{{ config(materialized='table') }}

with clientes as (
    select *
    from {{ ref('stg_erp__clientes') }}
),

agencias as (
    select *
    from {{ ref('stg_erp__agencias') }}
),

colaboradores as (
    select *
    from {{ ref('stg_erp__colaboradores') }}
),

relacao as (
    select *
    from {{ ref('stg_erp__colaborador_agencia') }}
),

base as (
    select
        c.cod_clientes,
        c.tipos_clientes,
        c.datas_nascimentos,
        c.cpfs_cnpjs,

        a.cod_agencias,
        a.nomes_agencias,
        a.cidades,
        a.ufs as ufs_agencias,

        col.cod_colaboradores,
        col.primeiros_nomes,
        col.ultimos_nomes,
        col.cpfs as cpfs_colaboradores

    from clientes c
    left join relacao r on c.cod_clientes = r.cod_colaboradores
    left join colaboradores col on r.cod_colaboradores = col.cod_colaboradores
    left join agencias a on r.cod_agencias = a.cod_agencias
)

select *
from base