# Crie um sistema simples de gerenciamento de contatos que permita adicionar novos
# contatos, remover contatos e listar todos os contatos com seus detalhes. O
# sistema deve utilizar variáveis e operações diretamente, sem a utilização de funções.
usuario3 =  {'nome': 'Manoel', 'email': 'Alan@alan.com.br', 'telefone': '11.7.7777.7777'}

contato = {
    'usuario1' : {'nome': 'Alan', 'telefone': '11.9.9999.9999'},
    'usuario2' : {'nome': 'Vinicius', 'telefone': '11.8.8888.8888'},
}
print('-'*50)
print('CONTATOS')
for i in contato.keys():
    print(f'Nome: {contato[i]["nome"]}, Telefone: {contato[i]["telefone"]}')

print('-'*50)
print('ADICIONANDO USUÁRIO ')
contato['usuario3'] = usuario3
for i in contato.keys():
    print(f'Nome: {contato[i]["nome"]}, Telefone: {contato[i]["telefone"]}')

print('-'*50)
print('DELETANDO USUÁRIO ')
del contato['usuario2']
for i in contato.keys():
    print(f'Nome: {contato[i]["nome"]}, Telefone: {contato[i]["telefone"]}')

