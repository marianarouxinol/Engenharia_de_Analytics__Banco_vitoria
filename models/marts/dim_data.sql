WITH calendar AS (
    SELECT DATEADD(DAY, SEQ4(), '2010-01-01') AS data
    FROM TABLE(GENERATOR(ROWCOUNT => 7500))
)

SELECT
    data,
    YEAR(data) AS ano,
    MONTH(data) AS mes,
    DAY(data) AS dia,
    QUARTER(data) AS trimestre,
    WEEK(data) AS semana_do_ano,
    DAYOFWEEK(data) AS dia_semana_num,

    
    CASE DAYOFWEEK(data)
        WHEN 1 THEN 'Domingo'
        WHEN 2 THEN 'Segunda-feira'
        WHEN 3 THEN 'Terça-feira'
        WHEN 4 THEN 'Quarta-feira'
        WHEN 5 THEN 'Quinta-feira'
        WHEN 6 THEN 'Sexta-feira'
        WHEN 7 THEN 'Sábado'
    END AS dia_semana_nome,

    
    CASE 
        WHEN DAYOFWEEK(data) IN (1, 7) THEN TRUE
        ELSE FALSE
    END AS fim_de_semana,

    
    CASE 
        WHEN DAYOFWEEK(data) BETWEEN 2 AND 6 THEN TRUE
        ELSE FALSE
    END AS dia_util,

    
    TO_CHAR(data, 'YYYY-MM') AS ano_mes

FROM calendar
ORDER BY data