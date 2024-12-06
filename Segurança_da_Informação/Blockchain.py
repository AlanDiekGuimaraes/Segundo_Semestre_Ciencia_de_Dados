# Criando uma Blockchain em Python
import hashlib  # Biblioteca para realizar a criptografia com hash
import datetime as date  # Biblioteca para trabalhar com datas e horários

# Classe que representa um Bloco
class Bloco:
    def __init__(self, indice, timestamp, dados, hash_anterior):
        # Atributos básicos de um bloco
        self.indice = indice  # Identificador único do bloco
        self.timestamp = timestamp  # Registro de data e hora de criação
        self.dados = dados  # Dados que o bloco armazena (transações, informações, etc.)
        self.hash_anterior = hash_anterior  # Hash do bloco anterior na cadeia
        self.hash = self.calcular_hash()  # Hash do bloco atual, gerado a partir de seus dados

    # Método para calcular o hash do bloco
    def calcular_hash(self):
        sha = hashlib.sha256()  # Cria um objeto para criptografia SHA-256
        # Concatena os dados do bloco para gerar o hash
        sha.update(
            str(self.indice).encode('utf-8') +
            str(self.timestamp).encode('utf-8') +
            str(self.dados).encode('utf-8') +
            str(self.hash_anterior).encode('utf-8')
        )
        return sha.hexdigest()  # Retorna o hash como uma string hexadecimal

# Classe que representa a Blockchain
class Blockchain:
    def __init__(self):
        # Inicia a cadeia de blocos com o bloco Gênesis (primeiro bloco)
        self.cadeia = [self.criar_bloco_genesis()]

    # Método para criar o bloco Gênesis
    def criar_bloco_genesis(self):
        return Bloco(0, date.datetime.now(), "Bloco Gênesis", "0")  # Bloco inicial com dados fixos
    
    # Método para adicionar um novo bloco à cadeia
    def adicionar_bloco(self, novo_bloco):
        novo_bloco.hash_anterior = self.cadeia[-1].hash  # Define o hash do bloco anterior
        novo_bloco.hash = novo_bloco.calcular_hash()  # Calcula o hash do novo bloco
        self.cadeia.append(novo_bloco)  # Adiciona o bloco à cadeia
    
    # Método para validar a Blockchain
    def eh_valida(self):
        for i in range(1, len(self.cadeia)):
            bloco_atual = self.cadeia[i]
            bloco_anterior = self.cadeia[i-1]
            
            # Verifica se o hash do bloco atual está correto
            if bloco_atual.hash != bloco_atual.calcular_hash():
                return False
            # Verifica se o hash do bloco anterior é consistente
            if bloco_atual.hash_anterior != bloco_anterior.hash:
                return False
        return True  # Se passar por todas as verificações, a cadeia é válida
    
# Instância da Blockchain
minha_blockchain = Blockchain()

# Exemplos de dados de transações para adicionar à Blockchain
compra1 = {
    'item': 'Notebook',
    'valor': 1000,
    'comprador': 'Alan Diek',
    'vendedor': 'Brenda'
}

compra2 = {
    'item': 'Mouse',
    'valor': 50,
    'comprador': 'Vinicius',
    'vendedor': 'Bere'
}

doc = {
    'item': 'RG',
    'valor_pago_ao_cartorio': 50,
    'comprador': 'Alan Diek',
    'vendedor': 'Ribeirinha'
}

# Adicionando blocos com os dados das transações
minha_blockchain.adicionar_bloco(Bloco(1, date.datetime.now(), compra1, minha_blockchain.cadeia[-1].hash))
minha_blockchain.adicionar_bloco(Bloco(2, date.datetime.now(), compra2, minha_blockchain.cadeia[-1].hash))
minha_blockchain.adicionar_bloco(Bloco(3, date.datetime.now(), doc, minha_blockchain.cadeia[-1].hash))

# Verifica se a Blockchain é válida
print(f"Essa blockchain é válida? {str(minha_blockchain.eh_valida())}")

# Função para exibir os blocos da Blockchain
def imprimir_blockchain(cadeia):
    for bloco in cadeia:
        print(f"Índice: {bloco.indice}")
        print(f"Timestamp: {bloco.timestamp}")
        print(f"Dados salvos: {bloco.dados}")
        print(f"Hash: {bloco.hash}")
        print(f"Hash do bloco anterior: {bloco.hash_anterior}")
        print(20*"-----")

# Exibe os blocos da Blockchain no console
imprimir_blockchain(minha_blockchain.cadeia)
