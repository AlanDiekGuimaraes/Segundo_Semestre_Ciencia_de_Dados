# Instalar:
# pip install paho-mqtt flask  ==> Conexão com os sensores.

from datetime import datetime, timezone
from flask import Flask, Response, jsonify, request
from flask_sqlalchemy import SQLAlchemy
import json
import paho.mqtt.client as mqtt

# ********************** CONEXÃO COM O BANCO DE DADOS **********************

app = Flask("registro")     # Nome do aplicativo.

app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False    # Configura o SQLAlchemy para rastrear modificações. 

app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:senai%40134@127.0.0.1/bd_medidor'

mybd = SQLAlchemy(app)      # Cria uma instância do SQLAlchemy, passando a aplicação Flask como parâmetro. 

# *************************** CONEXÃO DOS SENSORES ***************************
mqtt_dados = {}

def conexao_sensor(cliente):
    cliente.subscribe("projeto_integrado/SENAI134/Cienciadedados/GrupoX")

def msg_sensor(msg):
    global mqtt_dados
    
    valor = msg.payload.decode('utf-8')     # Decodificar a mensagem recebida de bytes para string
    mqtt_dados = json.loads(valor)          # Decodificar de string para JSON
    print(f'Mensagem recebida: {mqtt_dados}')
    
    with app.app_context():         # Correlação Banco de Dados com Sensor. 
        try:
            temperatura = mqtt_dados.get('temperature')
            pressao = mqtt_dados.get('pressure')
            altitude = mqtt_dados.get('altitude')
            umidade = mqtt_dados.get('humidity')
            co2 = mqtt_dados.get('co2')
            poeira = 0
            tempo_registro = mqtt_dados.get('timestamp')
            
            if tempo_registro is None:
                print("Timestamp não encontrado")
                return
            
            try:
                tempo_oficial = datetime.fromtimestamp(int(tempo_registro), tz=timezone.utc)
            
            except (ValueError, TypeError) as e:
                print(f"Erro ao converter timestamp: {str(e)}")
                return
            # Criar para objeto que vai simular a tabela do banco. 
            novos_dados = Registro(
                temperaturaV = temperatura,
                pressaoV = pressao,
                altitudeV = altitude,
                umidadeV = umidade,
                co2V = co2,
                poeiraV = poeira,
                tempo_registroV = tempo_oficial
            )
            
            # Adicionar novo registro ao banco.
            mybd.session.add(novos_dados)
            mybd.session.commit()
            print("Os dados foram inseridos com sucesso no banco de dados!")
        
        except Exception as e:
            print(f"Erro ao processar os dados do MQTT: {str(e)}")
            mybd.session.rollback()

mqtt_client = mqtt.Client()
mqtt_client.on_connect = conexao_sensor
mqtt_client.on_message = msg_sensor
mqtt_client.connect("test.mosquitto.org", 1833, 60)

def start_mqtt():
    mqtt_client.loop_start()