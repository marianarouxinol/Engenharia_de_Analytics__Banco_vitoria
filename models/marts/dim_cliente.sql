SELECT
  cod_cliente,
  primeiro_nome_cliente,
  ultimo_nome_cliente,
  cpf_cliente,
  cidade_cliente,
  uf_cliente,
  tipo_cliente
FROM {{ ref('int_clientes__colaboradores_agencias') }}