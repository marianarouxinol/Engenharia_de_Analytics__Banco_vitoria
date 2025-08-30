with base as (

    select
        NUM_CONTA               as nums_contas,
        COD_CLIENTE             as cod_clientes,
        COD_AGENCIA             as cod_agencias,
        COD_COLABORADOR         as cod_colaboradores,
        COALESCE(UPPER(TRIM(TIPO_CONTA)), 'NÃO INFORMADO') as tipos_contas,
        TRY_TO_TIMESTAMP(DATA_ABERTURA) as datas_aberturas,
        CAST(SALDO_TOTAL AS FLOAT) as saldos_totais,
        CAST(SALDO_DISPONIVEL AS FLOAT) as saldos_disponiveis,
        TRY_TO_TIMESTAMP(DATA_ULTIMO_LANCAMENTO) as datas_ultimos_lancamentos
    from {{ source('erp', 'CONTAS') }}

),


final as (

    select *
    from base

)

select *
from final