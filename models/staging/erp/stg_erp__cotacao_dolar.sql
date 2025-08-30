with base as (

    select
        TRY_TO_DATE(DATA) as datas,
        CAST(VALOR AS FLOAT) as cotacoes_dolar
    from {{ source('erp', 'COTACAO_DOLAR') }}

),


final as (

    select *
    from base

)

select *
from final