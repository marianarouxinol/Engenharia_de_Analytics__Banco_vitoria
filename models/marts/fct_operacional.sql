SELECT
    -- Chaves
    t.cod_transacao,
    t.num_conta,
    t.cod_cliente,
    t.cod_agencia,
    t.cod_colaborador,
    t.data_transacao,
    t.data_cotacao,
    t.tipo_conta,
    t.status_proposta,

    -- Métricas
    t.valor_transacao,
    t.valor_proposta,
    t.valor_financiamento,
    t.valor_entrada,
    t.valor_prestacao,
    t.saldo_total,
    t.saldo_disponivel,
    t.taxa_juros_mensal,
    t.quantidade_parcelas,
    t.carencia,
    t.cotacao_media_dia,

    
    t.tipo_transacao,
    t.situacao_mes  

FROM {{ ref('int_operacional_base') }} t
WHERE t.cod_transacao IS NOT NULL