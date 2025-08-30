with base as (

    select distinct
        COALESCE(UPPER(TRIM(status_propostas)), 'NÃO INFORMADO') as status_propostas
    from {{ ref('stg_erp__propostas_credito') }}

),

final as (

    select
        row_number() over (order by status_propostas) as id_status_proposta,
        status_propostas
    from base

)

select *
from final