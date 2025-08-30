with base as (

    select
        COD_TRANSACAO       as cod_transacoes,
        NUM_CONTA           as nums_contas,
        TRY_TO_TIMESTAMP(DATA_TRANSACAO) as datas_transacoes,
        INITCAP(TRIM(NOME_TRANSACAO)) as nomes_transacoes,
        CAST(VALOR_TRANSACAO AS FLOAT) as valores_transacoes
    from {{ source('erp', 'TRANSACOES') }}

),

final as (

    select *
    from base

)

select *
from final