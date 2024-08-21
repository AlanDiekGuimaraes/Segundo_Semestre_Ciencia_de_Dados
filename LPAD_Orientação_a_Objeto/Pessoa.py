from datetime import date
# CLASSE ENDERECO
class Endereco:
    def __init__(self, logradouro='', numero='', endereco_comercial=False):
        # Inicializar os nossos atributos com valores padrão.
        self.logradouro = logradouro
        self.numero = numero
        self.endereco_comercial = endereco_comercial

# CLASSE PESSOA
class Pessoa:
    def __init__(self, nome='', rendimento=0.0, endereco=None):
        self.nome = nome
        self.rendimento = rendimento
        self.endereco = endereco

    def calcular_imposto(self, rendimento):
        return rendimento

# CLASSE PESSOA FISICA
class PessoaFisica(Pessoa):
    def __init__(self, nome='', rendimento=0.0, endereco=None, cpf='', dataNascimento=None):
        if endereco is None:
            # Se nenhum endereço for fornecido, cria um objeto Endereço padrão
            endereco = Endereco()
        if dataNascimento is None:
            dataNascimento = date.today()

        super().__init__(nome, rendimento, endereco) # Chama o construtor da superclasse pessoa para inicializar os atributos herdados

        # Atributos da propria classe
        self.cpf = cpf
        self.dataNascimento = dataNascimento
    def calcular_imposto(self, rendimento: float) -> float:
        # Sem importo para rendimentos até 1500
        if rendimento <= 1500:
            return 0
        elif rendimento > 1500 or rendimento <= 3500:
            # 2% sobre o rendimento
            # return (rendimento / 100) * 2
            return rendimento * 0.02
        elif rendimento > 3500 or rendimento <= 6000:
            # 3.5% sobre o rendimento
            return (rendimento / 100) * 3.5
        else:
            # 5% sobre o rendimento
            return (rendimento /100 ) * 5

# CLASSE PESSOA JURIDICA
class PessoaJuridica(Pessoa):
    def __init__(self, nome='', rendimento=0.0, endereco=None, cnpj=''):
        if endereco is None:
            endereco = Endereco()

        super().__init__(nome, rendimento, endereco) # Chama o construtor da superclasse pessoa para inicializar os atributos herdados

        # Atributos da propria classe
        self.cnpj = cnpj

    def calcular_imposto(self, rendimento: float) -> float:
        # Sem importo para rendimentos até 1500
        if rendimento <= 8100:
            return 0
        elif rendimento > 8100 or rendimento <= 15000:
            # 2% sobre o rendimento
            # return (rendimento / 100) * 2
            return rendimento * 0.02
        elif rendimento > 15000 or rendimento <= 25000:
            # 3.5% sobre o rendimento
            return (rendimento / 100) * 3.5
        else:
            # 5% sobre o rendimento
            return (rendimento / 100) * 5




class SalvarArquivo():
    def __init__(self):

    def salvar(self):
        self.exportar_csv('database.csv')
    def exportar_csv(self, nome_arquivo):
        with open(nome_arquivo, 'w') as arquivo:
            linhas = arquivo.readlines()
            for linha in linhas:


