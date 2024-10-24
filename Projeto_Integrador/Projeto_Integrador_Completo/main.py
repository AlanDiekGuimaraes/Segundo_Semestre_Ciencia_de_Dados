# Instalar:
# pip install paho-mqtt flask  ==> Conexão com os sensores.

from datetime import datetime, timezone
from flask import Flask, Response, jsonify, request
from flask_sqlalchemy import SQLAlchemy
import json
import paho.mqtt.client as mqtt

# ********************** CONEXÃO COM O BANCO DE DADOS **********************

app = Flask("registro")  # Nome do aplicativo.

app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False # Configura o SQLAlchemy para rastrear modificações. 

app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:senai%40134@127.0.0.1/bd_medidor'

mybd = SQLAlchemy(app) # Cria uma instância do SQLAlchemy, passando a aplicação Flask como parâmetro. 

# *************************** CONEXÃO DOS SENSORES ***************************
