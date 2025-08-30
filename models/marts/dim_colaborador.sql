with base as (

    select
        cod_colaboradores,
        TRIM(cpfs) as cpfs_colaboradores,
        TRY_TO_DATE(datas_nascimentos) as datas_nascimentos,
        date_diff(current_date, TRY_TO_DATE(datas_nascimentos), year) as idades
    from {{ ref('stg_erp__colaboradores') }}

),

final as (

    select *
    from base

)

select *
from final