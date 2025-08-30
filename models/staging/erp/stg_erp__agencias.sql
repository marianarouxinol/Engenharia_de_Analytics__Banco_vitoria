with base as (

    select
        COD_AGENCIA     as cod_agencias,
        INITCAP(TRIM(NOME)) as nomes_agencias,
        TRIM(ENDERECO) as enderecos,
        INITCAP(TRIM(CIDADE)) as cidades,
        UPPER(TRIM(UF)) as ufs,
        TRY_TO_DATE(DATA_ABERTURA) as datas_aberturas,
        COALESCE(UPPER(TRIM(TIPO_AGENCIA)), 'NÃO INFORMADO') as tipos_agencias
    from {{ source('erp', 'AGENCIAS') }}

),


final as (

    select *
    from base

)

select *
from final