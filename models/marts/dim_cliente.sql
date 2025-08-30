with base as (

    select
        cod_clientes,
        COALESCE(UPPER(TRIM(tipos_clientes)), 'NÃO INFORMADO') as tipos_clientes,
        cpfs_cnpjs,
        datas_nascimentos,
        timestampdiff(year, datas_nascimentos, current_date)
    from {{ ref('stg_erp__clientes') }}

),

final as (

    select *
    from base

)

select *
from final