{{ config(materialized='table') }}

with transacoes as (
    select *
    from {{ ref('stg_erp__transacoes') }}
),

contas as (
    select *
    from {{ ref('stg_erp__contas') }}
),

propostas as (
    select *
    from {{ ref('stg_erp__propostas_credito') }}
),

base as (
    select
        t.cod_transacoes,
        t.datas_transacoes,
        t.valores_transacoes,
        t.nomes_transacoes,

        c.cod_clientes,
        c.cod_agencias,
        c.cod_colaboradores,
        c.tipos_contas,
        c.saldos_totais,
        c.saldos_disponiveis,

        p.status_propostas,
        p.valores_propostas,
        p.valores_financiamentos,
        p.valores_entradas,
        p.valores_prestacoes,
        p.quantidades_parcelas,
        p.carencias

    from transacoes t
    left join contas c on t.nums_contas = c.nums_contas
    left join propostas p on t.cod_transacoes = p.cod_propostas
)

select *
from base