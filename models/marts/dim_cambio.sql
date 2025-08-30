with base as (

    select
        TRY_TO_DATE(datas) as datas,
        CAST(cotacoes_dolar AS FLOAT) as cotacoes_dolar
    from {{ ref('stg_erp__cotacao_dolar') }}

),

final as (

    select *
    from base

)

select *
from final