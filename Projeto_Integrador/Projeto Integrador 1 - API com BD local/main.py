# istalar o modulo flask com o comando pip install flask
from flask import Flask, jsonify, make_response, request
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
@app.route('/carros/<int:id>', methods=['GET']) 
def get_carros_id(id):
    for carro in Carros:
        if carro.get('id') == id:
            return jsonify(carro) 

# SEGUNDO MÉTODO - CRIAR NOVOS DADOS (POST)
@app.route('/carros', methods=['POST'])
def criar_carros():
    carro = request.json
    Carros.append(carro)
    # 1ª forma de mostrar mensagem ao usuario. 
    return make_response( 
        jsonify(mensagem = 'Carro cadastrado com sucesso', 
                carro=carro)
    )

# TERCEIRO MÉTODO - EDITAR DADOS (PUT)
@app.route('/carros/<int:id>', methods=['PUT'])
def editar_carro_id(id):
    carro_alterado = request.get_json()
    for indice, carro in enumerate(Carros):
        if carro.get('id') == id:
            Carros[indice].update(carro_alterado)
            return jsonify(Carros[indice])

# QUARTO MÉTODO - DELETAR DADOS (DELETE)
@app.route('/carros/<int:id>', methods=['DELETE'])
def excluir_carro(id):
    for indice, carro in enumerate(Carros):
        if carro.get('id') == id:
            del Carros[indice]
            # 2ª forma de mostrar mensagem ao usuario. 
            return jsonify({'mensagem:': 'Carro excluido com sucesso'})

app.run(port=5000, host='localhost')