WITH transacoes AS (
    SELECT * FROM {{ ref('stg_erp__transacoes') }}
),

contas AS (
    SELECT * FROM {{ ref('stg_erp__contas') }}
),

clientes AS (
    SELECT * FROM {{ ref('stg_erp__clientes') }}
),

propostas AS (
    SELECT * FROM {{ ref('stg_erp__propostas_credito') }}
),

colaboradores AS (
    SELECT * FROM {{ ref('stg_erp__colaboradores') }}
),

cotacao AS (
    SELECT * FROM {{ ref('stg_erp__cotacao_dolar') }}
)

SELECT
    -- Transações
    t.cod_transacao,
    t.num_conta,
    t.data_transacao,
    t.tipo_transacao,
    t.valor_transacao,

    
    CASE 
        WHEN EXTRACT(MONTH FROM t.data_transacao) % 2 = 0 THEN 'Mes Par'
        ELSE 'Mes Impar'
    END AS situacao_mes,

    -- Cotação do dólar
    cota.cotacao_media_dia,
    cota.data_dolar AS data_cotacao,
    cota.ano,
    cota.mes,
    cota.ano_mes,

    -- Contas
    c.cod_cliente,
    c.cod_agencia,
    c.cod_colaborador,
    c.tipo_conta,
    c.data_abertura,
    c.data_ultimo_lancamento,
    c.saldo_total,
    c.saldo_disponivel,

    -- Clientes
    cl.cod_cliente AS cod_cliente_cliente,
    cl.primeiro_nome,
    cl.ultimo_nome,
    cl.email,
    cl.tipo_cliente,
    cl.data_inclusao,
    cl.data_nascimento,
    cl.cpf_cnpj,
    cl.endereco,
    cl.cep,

    -- Propostas
    p.cod_proposta,
    p.cod_colaborador AS cod_colaborador_proposta,
    p.data_entrada_proposta,
    p.taxa_juros_mensal,
    p.valor_proposta,
    p.valor_financiamento,
    p.valor_entrada,
    p.valor_prestacao,
    p.quantidade_parcelas,
    p.carencia,
    p.status_proposta,

    -- Colaboradores
    col.primeiro_nome AS primeiro_nome_colaborador,
    col.ultimo_nome AS ultimo_nome_colaborador,
    col.email AS email_colaborador,
    col.cpf AS cpf_colaborador,
    col.data_nascimento AS data_nascimento_colaborador,
    col.endereco AS endereco_colaborador,
    col.cep AS cep_colaborador

FROM transacoes t
LEFT JOIN contas c ON t.num_conta = c.num_conta
LEFT JOIN clientes cl ON c.cod_cliente = cl.cod_cliente
LEFT JOIN propostas p ON t.cod_transacao = p.cod_proposta
LEFT JOIN colaboradores col ON c.cod_colaborador = col.cod_colaborador
LEFT JOIN cotacao cota ON t.data_transacao = cota.data_dolar
   