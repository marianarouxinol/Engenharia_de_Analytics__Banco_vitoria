with base as (

    select
        COD_CLIENTE         as cod_clientes,
        INITCAP(TRIM(PRIMEIRO_NOME)) as primeiros_nomes,
        INITCAP(TRIM(ULTIMO_NOME)) as ultimos_nomes,
        LOWER(TRIM(EMAIL)) as emails,
        COALESCE(UPPER(TRIM(TIPO_CLIENTE)), 'NÃO INFORMADO') as tipos_clientes,
        TRY_TO_TIMESTAMP(DATA_INCLUSAO) as datas_inclusao,
        REGEXP_REPLACE(CPFCNPJ, '[^0-9]', '') as cpfs_cnpjs,
        TRY_TO_DATE(DATA_NASCIMENTO) as datas_nascimentos,
        TRIM(ENDERECO) as enderecos,
        REGEXP_REPLACE(CEP, '[^0-9]', '') as ceps
    from {{ source('erp', 'CLIENTES') }}

),


final as (

    select *
    from base

)

select *
from final