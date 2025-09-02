SELECT
  cod_colaborador,
  primeiro_nome_colaborador,
  ultimo_nome_colaborador,
  cpf_colaborador,
  cod_agencia
FROM {{ ref('int_clientes__colaboradores_agencias') }}