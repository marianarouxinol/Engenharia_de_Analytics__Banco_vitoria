with base as (

    select
        cod_colaboradores,
        TRIM(cpfs) as cpfs_colaboradores,
        TRY_TO_DATE(datas_nascimentos) as datas_nascimentos,
        timestampdiff(year, TRY_TO_DATE(datas_nascimentos), current_date)
    from {{ ref('stg_erp__colaboradores') }}

),

final as (

    select *
    from base

)

select *
from final