from flask import Flask, jsonify, make_response, request
from bd import DadosSensores

app = Flask('sensores')

# GET - CONSULTAR
@app.route('/sensores', methods=['GET'])
def get_sensores():
    return DadosSensores

# GET COM ID - CONSULTAR COM ID
@app.route('/sensores/<int:id>', methods=['GET'])
def get_sensores_id(id):
    for sensor in DadosSensores:
        if sensor.get('id') == id:
            return jsonify(sensor)

# POST - POSTAR
@app.route('/sensores', methods=['POST'])
def criar_sensores():
    sensor = request.json
    DadosSensores.append(sensor)
    return make_response(
        jsonify(mensagem = 'Os dados dos sensores foram cadastrados com sucesso',
                sensor=sensor)
    )

# PUT - EDITAR
@app.route('/sensores/<int:id>', methods=['PUT'])
def editar_dados_sensor(id):
    dado_editado = request.get_json()
    for indice, sensor in enumerate(DadosSensores):
        if sensor.get('id') == id:
            DadosSensores[indice].update(dado_editado)
            return jsonify(DadosSensores[indice])

# DELETE - DELETAR
@app.route('/sensores/<int:id>', methods=['DELETE'])
def excluir_dados_sensor(id):
    for indice, sensor in enumerate(DadosSensores):
        if sensor.get('id') == id:
            del DadosSensores[indice]
            return make_response(
                jsonify(
                mensagem = 'Os dados do sensor foi excluido com sucesso',
                sensor=sensor
                )
                
            )

# CHAMAR A FUNÇÃO
app.run(port=5000, host='localhost')