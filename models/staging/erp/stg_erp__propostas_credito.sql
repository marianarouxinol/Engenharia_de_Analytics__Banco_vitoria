with base as (

    select
        COD_PROPOSTA             as cod_propostas,
        COD_CLIENTE              as cod_clientes,
        COD_COLABORADOR          as cod_colaboradores,
        TRY_TO_TIMESTAMP(DATA_ENTRADA_PROPOSTA) as datas_entradas_propostas,
        CAST(TAXA_JUROS_MENSAL AS FLOAT) as taxas_juros_mensais,
        CAST(VALOR_PROPOSTA AS FLOAT) as valores_propostas,
        CAST(VALOR_FINANCIAMENTO AS FLOAT) as valores_financiamentos,
        CAST(VALOR_ENTRADA AS FLOAT) as valores_entradas,
        CAST(VALOR_PRESTACAO AS FLOAT) as valores_prestacoes,
        CAST(QUANTIDADE_PARCELAS AS INT) as quantidades_parcelas,
        CAST(CARENCIA AS INT) as carencias,
        COALESCE(UPPER(TRIM(STATUS_PROPOSTA)), 'NÃO INFORMADO') as status_propostas
    from {{ source('erp', 'PROPOSTAS_CREDITO') }}

),


final as (

    select *
    from base

)

select *
from final