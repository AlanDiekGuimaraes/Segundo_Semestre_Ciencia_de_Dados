from dash import Dash, html, dcc, Output, Input
import pandas as pd
import plotly.express as px

app = Dash(__name__)

df = pd.read_excel("Projeto_Integrador\Dashboard Simples com EXCEL\Preços da Gasolina.xlsx")

fig = px.bar(df, x='PRODUTO', y='QUANTIDADE LTS', color='ESTADO', barmode='group')

opcoes = list(df['ESTADO'].unique())
opcoes.append('Todas as estados')


app.layout = html.Div(children=[
    html.H1(children='Venda de Gasolina no Brasil'),
    html.H2(children='Quantidade de Lts de gasolina vendida por estado'),
    dcc.Dropdown(opcoes, value='Todas as estados', id='lista_estado'),
    
    dcc.Graph(
        id='grafico_preco',
        figure = fig
    )
])

@app.callback(
    Output('grafico_preco', 'figure'),
    Input('lista_estado', 'value')
)

def update_output(value):
    if value == 'Todas as estados':
        fig = px.bar(df, x='PRODUTO', y='QUANTIDADE LTS', color='ESTADO', barmode='group')
    else:
        tabela_filtrada = df.loc[df['ESTADO'] == value, :]
        fig = px.bar(tabela_filtrada, x='PRODUTO', y='QUANTIDADE LTS', color='ESTADO', barmode='group')
        
    return fig

if __name__ == '__main__':
    app.run(debug=True)