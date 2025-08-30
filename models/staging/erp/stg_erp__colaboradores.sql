with base as (

    select
        COD_COLABORADOR     as cod_colaboradores,
        INITCAP(TRIM(PRIMEIRO_NOME)) as primeiros_nomes,
        INITCAP(TRIM(ULTIMO_NOME)) as ultimos_nomes,
        LOWER(TRIM(EMAIL)) as emails,
        REGEXP_REPLACE(CPF, '[^0-9]', '') as cpfs,
        TRY_TO_DATE(DATA_NASCIMENTO) as datas_nascimentos,
        TRIM(ENDERECO) as enderecos,
        REGEXP_REPLACE(CEP, '[^0-9]', '') as ceps
    from {{ source('erp', 'COLABORADORES') }}

),


final as (

    select *
    from base

)

select *
from final