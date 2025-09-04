import requests
import pandas as pd
from datetime import datetime, timedelta

def gerar_intervalos(data_inicio, data_fim):
    intervalos = []
    atual = data_inicio
    while atual < data_fim:
        proximo = min(atual + timedelta(days=183), data_fim)
        intervalos.append((atual, proximo))
        atual = proximo + timedelta(days=1)
    return intervalos

#API do Banco Central
def consultar_sgs(data_inicio, data_fim, codigo_serie=1):
    url = f"https://api.bcb.gov.br/dados/serie/bcdata.sgs.{codigo_serie}/dados?formato=json&dataInicial={data_inicio.strftime('%d/%m/%Y')}&dataFinal={data_fim.strftime('%d/%m/%Y')}"
    response = requests.get(url)
    if response.status_code == 200:
        return pd.DataFrame(response.json())
    else:
        print(f"Erro ao consultar {data_inicio} a {data_fim}")
        return pd.DataFrame()


data_inicio = datetime(2010, 2, 2)
data_fim = datetime(2022, 12, 27)
intervalos = gerar_intervalos(data_inicio, data_fim)
df_final = pd.DataFrame()

for inicio, fim in intervalos:
    df = consultar_sgs(inicio, fim)
    df_final = pd.concat([df_final, df], ignore_index=True)


df_final['data'] = pd.to_datetime(df_final['data'], format='%d/%m/%Y')
df_final['valor'] = pd.to_numeric(df_final['valor'].str.replace(',', '.'), errors='coerce')
print(df_final.head())

df_final.to_csv("cotacao_dolar_bcb.csv", index=False)
