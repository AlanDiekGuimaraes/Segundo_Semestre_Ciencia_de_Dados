# Instalação  ======>  pip install streamlit

import streamlit as st
import pandas as pd
import plotly.express as px
from streamlit_option_menu import option_menu
from query import conexao
import plotly.figure_factory as ff

# *** PRIMEIRA CONSULTA / ATUALIZAÇÕES DE DADOS ***
query = "SELECT * FROM tb_carros"

# Carregar os dados
df = conexao(query)

# Botão para atualizar
if st.button("Atualizar Dados"):
    df = conexao(query)
    

# *********** ESTRUTURA LATERAL DE FILTROS  ***********
st.sidebar.header("Selecione o Filtro")

marca = st.sidebar.multiselect("Marca Selecionada", # Nome do seletor
                               options=df["marca"].unique(), # Opções disponíveis do nosso DF são únicas
                               default=df["marca"].unique(), # 
                               )
modelo = st.sidebar.multiselect("Modelo Selecionado", options=df["modelo"].unique(), default=df["modelo"].unique())
ano = st.sidebar.multiselect("Ano Selecionado", options=df["ano"].unique(), default=df["ano"].unique())
valor = st.sidebar.multiselect("Valor Selecionado", options=df["valor"].unique(), default=df["valor"].unique())
cor = st.sidebar.multiselect("Cor Selecionada", options=df["cor"].unique(), default=df["cor"].unique())
numero_vendas = st.sidebar.multiselect("Vendas Selecionado", options=df["numero_vendas"].unique(), default=df["numero_vendas"].unique())

# Aplicar os filtros selecionados
df_selecionado = df[
    (df["marca"].isin(marca)) &
    (df["modelo"].isin(modelo)) &
    (df["ano"].isin(ano)) &
    (df["valor"].isin(valor)) &
    (df["cor"].isin(cor)) &
    (df["numero_vendas"].isin(numero_vendas))    
]

#  *********** EXIBIR VALORES MÉDIOS - ESTATÍSTICA ***********
def Home():
    with st.expander("Tabela"): # Cria uma caixa expansível com um titulo.
        mostrarDados = st.multiselect("FIlter: ", df_selecionado.columns, default=[])
        # Verifica se o usuário selecionou colunas para exibir
        if mostrarDados:
            # Exibe os dados filtrados pelas colunas selecionadas. 
            st.write(df_selecionado[mostrarDados])
    # Verifica se o DataFRame filtrado (df_selecionado) não está vazio.
    if not df_selecionado.empty:
        venda_total = df_selecionado["numero_vendas"].sum()
        venda_media = df_selecionado["numero_vendas"].mean()
        venda_mediana = df_selecionado["numero_vendas"].median()

        # Cria três colunas para exibir os totais calculados.
        total1, total2, total3 = st.columns(3, gap="large")
        
        with total1:
            st.info("Valor total de vendas dos Carros", icon="📌")
            st.metric(label="Total", value=f"{venda_total:,.0f}")
        
        with total2:
            st.info("Valor médio das vendas", icon="📌")
            st.metric(label="Média", value=f"{venda_media:,.0f}")
        
        with total3:
            st.info("Valor mediano do carros", icon="📌")
            st.metric(label="Mediana", value=f"{venda_mediana:,.0f}")
    
    else:
        st.warning("Nenhum dado disponível com os filtros selecionados.")
    
    # Insere uma linha divisória para separar as seções.
    st.markdown("""--------------""")
    
# ************************ GRÁFICOS **************************

def graficos(df_selecionado):
    # Verifica se o dataframe está vazio, se estiver vazio, exibe uma mensagem que não ha dados disponíveis para gerar gráficos e interrompe a execução da função.
    if df_selecionado.empty:
        st.warning("Nenhum dado disponível para gerar gráficos.")
        # Interrompe a função. 
        return
    
    # Criação dos gráficos
    # 4 abas -> Gráficos de Barras, Gráfico de linhas, Gráfico de pizza e dispersão. 
    graf1, graf2, graf3, graf4, graf5, graf6 = st.tabs(["Gráfico de Barras", "Gráfico de Linhas", "Gráfico de pizza", "Gráfico de Dispersão", "Gráfico de Barras", "Gráficos"])
    
    
    # Primeiro gráfico.     
    with graf1:
        st.write("Gráfico de Barras") # Titulo
        
        # Agrupa pela marca e conta o número de ocorrências da coluna valor. Depois ordena o resultado de forma decrescente. 
        investimento = df_selecionado.groupby("marca").count()[["valor"]].sort_values(by="valor", ascending=False) 
        
        fig_valores1 = px.bar(
            investimento, # Contém os dados sobre valores por marca.
            x= investimento.index,
            y= "valor",
            orientation= "h",
            title= "<b>Valores de Carros</b>",
            color_discrete_sequence=["#0083b3"] # Cores do  gráficos.
        )
           
        # Exibe a figura e ajusta na tela para ocupar toda a largura disponível.                
        st.plotly_chart(fig_valores1, use_container_width=True)
        
    # Segundo Gráfico.
    with graf2:
        st.write("Gráfico de Linhas")
        dados2 = df_selecionado.groupby("marca").count()[["valor"]]
        
        fig_valores2 = px.line(
            dados2, 
            x= dados2.index,
            y= "valor",
            title= "<b>Valores por marca</b>",
            color_discrete_sequence=["#0083b8"]
        )
        
        st.plotly_chart(fig_valores2, use_container_width=True)
        
    # Terceiro gráfico
    with graf3:
        st.write("Gráfico de Pizza")
        dados3 = df_selecionado.groupby("marca").sum()[["valor"]]
        
        fig_valores3 = px.pie(
            dados3,
            values="valor", # Valores que serão representados.
            names= dados3.index, # Os nomes (marcas) que irão rotular.
            title="<b>Distribuição de Valores por Marca</b>"
        )
        
        st.plotly_chart(fig_valores3, use_container_width=True)
    
    
    # Quarto Gráfico
    with graf4:
        st.write("Gráfico de Dispersão")
        dados4 = df_selecionado.melt(id_vars=["marca"], value_vars=["valor"])

        
        fig_valores4 = px.scatter(
            dados4,
            x="marca",
            y="value",
            color="variable",
            title="<b>Dispersão de Valores por Marca</b>"
        )

        st.plotly_chart(fig_valores4, use_container_width=True)
    
    # Quinto gráfico
    with graf5:
        dados5 = df_selecionado.groupby("marca").count()[["valor"]].sort_values(by="valor", ascending=False) 
        
        fig_valores5 = px.bar(
            investimento, # Contém os dados sobre valores por marca.
            x= investimento.index,
            y= "valor",
            orientation= "v",
            title= "<b>Valores de Carros</b>",
            color_discrete_sequence=["#229a00"] # Cores do  gráficos.
        )
           
        # Exibe a figura e ajusta na tela para ocupar toda a largura disponível.                
        st.plotly_chart(fig_valores5, use_container_width=True)
    
    with graf6:
        dados6 = df_selecionado.groupby("marca").count()[["valor"]].sort_values(by="valor", ascending=False)
        
        group_labels = ['Group 1', 'Group 2', 'Group 3']
        
        fig_valores6 = ff.create_distplot(
            dados6,
            group_labels, 
            bin_size=[.1, .25, .5])

        # Plot!
        st.plotly_chart(fig_valores6, use_container_width=True)
       
    
    
        
# ********************* BARRA DE PROGRESSO *********************
def barraProgresso():
    valorAtual = df_selecionado["numero_vendas"].sum()
    objetivo = 500000
    percentual = round((valorAtual / objetivo * 100))
    

    if percentual > 100:
        st.subheader("Valores atingidos!!!")
    else:
        st.write(f"Você tem {percentual}% de {objetivo}. Corra atrás filhão.")
        mybar = st.progress(0)
        for percentualCompleto in range(percentual):
            mybar.progress(percentualCompleto + 1, text="Alvo %")


# ********************* MENU LATERAL*********************

def menuLateral():
    with st.sidebar:
        selecionado = option_menu(menu_title="Menu", options=["Home", "Progresso"], icons=["house", "eye"], menu_icon="cast", default_index=0)
    
    if selecionado == "Home":
        st.subheader(f"Página: {selecionado}")
        Home()
        graficos(df_selecionado)
    if selecionado == "Progresso":
        st.subheader(f"Página: {selecionado}")
        barraProgresso()
        graficos(df_selecionado)    


# ********************* AJUSTAR O CSS *********************






# Chamando a função    
menuLateral()