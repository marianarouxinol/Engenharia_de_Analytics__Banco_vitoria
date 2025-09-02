SELECT
  cod_cliente,
  primeiro_nome_cliente,
  ultimo_nome_cliente,
  cpf_cliente,
  cidade_cliente,
  uf_cliente,
  tipo_cliente
FROM (
  SELECT
    cod_cliente,
    primeiro_nome_cliente,
    ultimo_nome_cliente,
    cpf_cliente,
    cidade_cliente,
    uf_cliente,
    tipo_cliente,
    ROW_NUMBER() OVER (PARTITION BY cod_cliente ORDER BY cod_cliente) AS rn
  FROM {{ ref('int_clientes__colaboradores_agencias') }}
)
WHERE rn = 1