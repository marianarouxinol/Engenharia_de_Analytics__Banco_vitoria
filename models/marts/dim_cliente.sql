with base as (

    select
        cod_clientes,
        COALESCE(UPPER(TRIM(tipos_clientes)), 'NÃO INFORMADO') as tipos_clientes,
        cpfs_cnpjs,
        datas_nascimentos,
        date_diff(current_date, datas_nascimentos, year) as idades
    from {{ ref('stg_erp__clientes') }}

),

final as (

    select *
    from base

)

select *
from final