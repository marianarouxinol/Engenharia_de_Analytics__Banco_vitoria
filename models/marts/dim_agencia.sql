with base as (

    select
        cod_agencias,
        TRIM(nomes_agencias) as nomes_agencias,
        TRIM(cidades)        as cidades,
        UPPER(TRIM(ufs))     as ufs
    from {{ ref('stg_erp__agencias') }}

),

final as (

    select *
    from base

)

select *
from final