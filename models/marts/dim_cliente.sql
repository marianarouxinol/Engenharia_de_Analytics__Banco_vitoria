WITH clientes_deduplicados AS (
    SELECT
        cod_cliente,
        primeiro_nome_cliente,
        ultimo_nome_cliente,
        cpf_cliente,
        cidade_cliente,
        uf_cliente,
        tipo_cliente,
        data_nascimento,
        ROW_NUMBER() OVER (
            PARTITION BY cod_cliente 
            ORDER BY cod_cliente
        ) AS rn
    FROM {{ ref('int_clientes__colaboradores_agencias') }}
)

SELECT
    cod_cliente,
    primeiro_nome_cliente,
    ultimo_nome_cliente,
    cpf_cliente,
    cidade_cliente,
    uf_cliente,
    tipo_cliente,
    data_nascimento
FROM clientes_deduplicados
WHERE rn = 1