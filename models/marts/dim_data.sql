with base as (

    select
        date_day as datas,
        extract(year from date_day) as ano,
        extract(month from date_day) as mes,
        extract(day from date_day) as dia,
        extract(quarter from date_day) as trimestre,
        extract(dayofweek from date_day) as dia_semana_num,
        case extract(dayofweek from date_day)
            when 1 then 'Domingo'
            when 2 then 'Segunda'
            when 3 then 'Terça'
            when 4 then 'Quarta'
            when 5 then 'Quinta'
            when 6 then 'Sexta'
            when 7 then 'Sábado'
        end as dia_semana_nome,
        to_char(date_day, 'YYYY-MM') as ano_mes
    from (
        select
            dateadd(day, seq4(), '2010-01-01') as date_day
        from table(generator(rowcount => 6000))
    )

),

final as (

    select *
    from base

)

select *
from final