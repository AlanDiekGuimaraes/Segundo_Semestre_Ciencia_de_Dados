# Crie um sistema simples de gerenciamento de tarefas que permita adicionar novas
# tarefas, marcar tarefas como concluídas e listar todas as tarefas com seus
# status. O sistema deve utilizar variáveis e operações diretamente, sem a utilização de funções.

tarefa3 = {'tarefa': 'Projeto 01', 'data vencimento': '13/08/2024', 'status': 'pendente..'}
tarefa4 = {'tarefa': 'Projeto 02', 'data vencimento': '13/07/2024', 'status': 'pendente..'}
tarefa5 = {'tarefa': 'Ativ. Sala', 'data vencimento': '01/09/2024', 'status': 'pendente..'}

tarefas = {
    'tarefa1' : {'tarefa': 'Energia...','data vencimento': '15/07/2024', 'status': 'pendente..'},
    'tarefa2' : {'tarefa': 'Faculdade.','data vencimento': '22/07/2024', 'status': 'Concluído.'},
}
print('-'*80)
print('tarefas'.center(80).upper())
for i in tarefas.keys():
    print(f'|Tarefa: {tarefas[i]['tarefa']} | Data do Vencimento {tarefas[i]['data vencimento']} | Status: {tarefas[i]['status']} |'.center(80))

print('-'*80, '\n')
print('adicionando tarefas'.center(80).upper())
tarefas['tarefa3'] = tarefa3
tarefas['tarefa4'] = tarefa4
tarefas['tarefa5'] = tarefa5
for i in tarefas.keys():
    print(f'|Tarefa: {tarefas[i]['tarefa']} | Data do Vencimento {tarefas[i]['data vencimento']} | Status: {tarefas[i]['status']} |'.center(80))


print('-'*80, '\n')
print('atualizando tarefas'.center(80).upper())

for i, (chave,valor) in enumerate(tarefas.items()): # Atualizando as 4 primeiras tarefas.
    if i < 4:
        tarefas[chave]['status'] = 'Concluído.'
for i in tarefas.keys():
    print(f'|Tarefa: {tarefas[i]['tarefa']} | Data do Vencimento {tarefas[i]['data vencimento']} | Status: {tarefas[i]['status']} |'.center(80))

print('-'*80, '\n')
print('Excluindo tarefas'.center(80).upper())
for i in range(4): # Excluindo as 4 primeiras tarefas
    del tarefas['tarefa' + str(i+1)]
for i in tarefas.keys():
    print(f'|Tarefa: {tarefas[i]['tarefa']} | Data do Vencimento {tarefas[i]['data vencimento']} | Status: {tarefas[i]['status']} |'.center(80))

