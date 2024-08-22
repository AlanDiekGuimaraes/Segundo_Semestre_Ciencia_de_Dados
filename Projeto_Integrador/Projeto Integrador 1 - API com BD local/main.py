# istalar o modulo flask com o comando pip install flask
from flask import Flask
# Importa o bando de dados
from bd import Carros

# Instanciar o modulo Flask na nossa variavel app
app = Flask('carros')

# PRIMEIRO MÉTODO - VISUALIZAR DADOS (GET)
# app.route -> Definir essa função é uma rota para o Flask entender que isso é para ser execultado. 
@app.route('/carros', methods=['GET'])
def get_carros():
    return Carros


# PRIMEIRO MÉTODO PARTE 2 - VISUALIZAR DADOS POR ID (GET / ID)

# SEGUNDO MÉTODO - CRIAR NOVOS DADOS (POST)

# TERCEIRO MÉTODO - EDITAR DADOS (PUT)

# QUARTO MÉTODO - DELETAR DADOS (DELETE)
