# Engenharia de Analytics – Banco Vitória 🏦📊

Este projeto simula a implantação de uma arquitetura analítica moderna para o Banco Vitória (BanVic), com foco em maturidade de dados, modelagem dimensional e geração de insights estratégicos para áreas como crédito, operações e comercial.

---

## 📌 Objetivo

Construir um pipeline analítico completo que permita ao BanVic:

- Consolidar dados operacionais e comerciais
- Modelar indicadores de negócio confiáveis
- Enriquecer análises com dados externos (ex: cotação do dólar)
- Apoiar decisões estratégicas com visualizações em BI

---

## 🧰 Stack de Ferramentas Utilizadas

| Ferramenta     | Finalidade                                                                 |
|----------------|----------------------------------------------------------------------------|
| **Snowflake**  | Armazenamento e processamento escalável dos dados                         |
| **dbt**        | Modelagem analítica com camadas `staging`, `intermediária` e `marts`       |
| **Power BI**   | Visualização dos indicadores e dashboards interativos                     |
| **VS Code + Python** | Extração e tratamento de dados públicos (Banco Central do Brasil) |

---



## 📁 Engenharia_de_Analytics__Banco_vitoria


Engenharia_de_Analytics_Banco_vitoria/ ├── models/ │ ├── staging/ # Ingestão e limpeza dos dados brutos │ ├── intermediária/ # Normalização e enriquecimento dos dados │ ├── marts/ # Modelos analíticos por tema de negócio │ └── dim_dates.sql # Dimensão temporal para análises robustas ├── seeds/ # Dados estáticos e tabelas auxiliares ├── tests/ # Testes de integridade (not null, unique, relationships) ├── scripts/ │ └── extract_data.py # Script Python para extrair cotação do dólar do Banco Central
---

## 🧠 Modelo Estrela
<img width="780" height="839" alt="MODELO ESTRELA" src="https://github.com/user-attachments/assets/cc55672d-c08d-4515-bba7-a3c744db0e6f" />


O modelo dimensional foi estruturado com base na tabela fato `FATO_OPERACIONAL`, conectada às principais dimensões analíticas:

- `DIM_CLIENTE`: contém atributos como tipo de cliente, UF, data de nascimento
- `DIM_AGENCIA`: traz informações da agência, cidade e estado
- `DIM_COLABORADOR`: identifica o colaborador responsável pela proposta
- `DIM_DATA`: permite análises temporais (dia da semana, mês, trimestre, ano)
- `DIM_CAMBIO`: integra a cotação do dólar e variação diária
- `DIM_TIPO_CONTA`: descreve o tipo de conta vinculada à transação
- `DIM_STATUS_PROPOSTA`: classifica o status da proposta (aprovada, negada, em análise)

Esse modelo permite análises rápidas, confiáveis e escaláveis, apoiando decisões estratégicas em todas as áreas do BanVic.
---

## 🧪 Testes Automatizados com dbt

- `not null`: valida campos obrigatórios
- `unique`: garante unicidade de chaves primárias

---

## 🐍 Script Python – Extração de Cotação do Dólar

# scripts/enriquecimentobase.py




--

## 📊 Indicadores Modelados

- Volume total de transações
- Volume de transações por dia da semana
- Número de transações por agência
- Ranking de agências e colaboradores
- Volume por UF, tipo de cliente e dia da semana
- Correlação entre cotação do dólar e volume de transações

---

## ✅ Testes Automatizados com dbt

- `not null`: valida campos obrigatórios
- `unique`: garante unicidade de chaves primárias

---

## 🌐 Enriquecimento com Dados Públicos

- Cotação do dólar comercial via [Banco Central do Brasil](https://www.bcb.gov.br)
- Proposta de integração futura com dados do IBGE, Receita Federal e CAGED

---

## 🚀 Como Executar

```bash
# Executa os modelos
dbt run

# Valida os dados
dbt test

# Executa tudo (run + test + seed + snapshot)
dbt build

👩‍💼 Autora
Mariana Rouxinol

🔗 [Conecte-se comigo no LinkedIn](https://www.linkedin.com/in/marianarouxinol/)

