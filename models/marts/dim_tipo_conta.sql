with base as (

    select distinct
        COALESCE(UPPER(TRIM(tipos_contas)), 'NÃO INFORMADO') as tipos_contas
    from {{ ref('stg_erp__contas') }}

),

final as (

    select
        row_number() over (order by tipos_contas) as id_tipo_conta,
        tipos_contas
    from base

)

select *
from final