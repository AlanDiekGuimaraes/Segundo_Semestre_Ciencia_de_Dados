# Import para trabalhar com o Json.
import json
# Ferramenta que o python disponibiliza
from flask import Flask, Response, request
# Permitir a conexão com o banco de dados
from flask_sqlalchemy import SQLAlchemy

# Aplicação do tipo Flask
app = Flask("carros")

# Informa que haverá modificações no nosso banco de dados.
# Por padrão, em aplicações em produção, isso fica FALSE. 
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = True
# Configurando o Banco de dados.
app.config["SQLALCHEMY_DATABASE_URI"] = "mysql://root:senai%40134@127.0.0.1/SistemasCarros"
                                    # Banco | Usuário | Senha | Endereço IP do banco  | Nome da base de dados

#Configuramos a variável que representará o banco
mybd = SQLAlchemy(app)

# Definindo a estrutura da tabela carros
class Carros(mybd.Model):
    id = mybd.Column(mybd.Integer, primary_key = True)
    marca = mybd.Column(mybd.String(100))
    modelo = mybd.Column(mybd.String(100))
    valor = mybd.Column(mybd.Float)
    cor = mybd.Column(mybd.String(100))
    numero_vendas = mybd.Column(mybd.Float)
    ano = mybd.Column(mybd.String(10))


# Convertendo a tabela em Json
def to_json(self):
    return{
        "id": self.id,
        "marca": self.marca,
        "modelo": self.modelo,
        "valor": self.valor,
        "cor": self.cor,
        "numero_vendas": self.numero_vendas,
        "ano": self.ano
    }


# *************** API *****************
# Selecionar tudo (GET)
@app.route("/carros", methods=["GET"])
def selecionar_carros():
    # Executa uma consulta no banco de dados para obter todos os registros da tabela tb_carros.
    # O método query.all() retorna uma lista de objetos 'carros'
    carro_objetos = Carros.query.all()
    
    carro_json = [carro.to_json() for carro in carro_objetos]
    
    return gera_response(200, "carros", carro_json)


# selecionar individual (Por ID)

@app.route("/carros/<id>", methods=["GET"])
def seleciona_carro_id(id):
    carro_objetos = Carros.query.filter_by(id=id).first()
    carro_json = carro_objetos.to_json()
    
    return gera_response(200, "carros", carro_json)
    
# Cadastrar 
@app.route("/carros", methods=["POST"])
def criar_carro():
    body = request.get_json()
    
    try:
        carro = Carros(
            id=body["id"],
            marca=body["marca"],
            modelo=body["modelo"],
            valor=body["valor"],
            cor=body["cor"],
            numero_vendas=body["numero_vendas"],
            ano=body["ano"]
            )
        
        mybd.session.add(carro)
        mybd.session.commit(201, "carros", carro.to_json(), "Criado com sucesso!!!")
        
    except Exception as e:
        print("Erro", e)
        return gera_response(400, "carros", {}, "Erro ao cadastrar!!!")
    

# Atualizar
@app.route("/carros/<id>", methods=["PUT"])
def atualizar_carro(id):
    # Consulta por ID
    carro_objetos = Carros.query.filter_by(id=id).first()
    # Corpo da requisição
    body = request.get_json()
    
    try:
        if("marca" in body):
            carro_objetos.marca = body["marca"]
        
        
        
        
           
    except Exception as e:
        










def gera_response(status, nome_conteudo, conteudo, mensagem=False):
    body = {} # Inicializando um dicionario vazio.
    body[nome_conteudo] = conteudo
    if (mensagem):
        body["mensagem"] = mensagem
    
    return Response(json.dumps(body), status=status, mimetype="application/json")
    