# Crie um sistema simples de gerenciamento de tarefas que permita adicionar novas
# tarefas, marcar tarefas como concluídas e listar todas as tarefas com seus
# status. O sistema deve utilizar variáveis e operações diretamente, sem a # utilização de funções.

tarefa3 <- list(tarefa = 'Projeto 01', data_vencimento = '13/08/2024', status = 'pendente..')
tarefa4 <- list(tarefa = 'Projeto 02', data_vencimento = '13/07/2024', status = 'pendente..')
tarefa5 <- list(tarefa = 'Ativ. Sala', data_vencimento = '01/09/2024', status = 'pendente..')

tarefas <- list(
    tarefa1 = list(tarefa = 'Energia...', data_vencimento = '15/07/2024', status = 'pendente..'),
    tarefa2 = list(tarefa = 'Faculdade.', data_vencimento = '22/07/2024', status = 'Concluido.')
)
print('-------------------------------------------------------------------------------')
print('TAREFAS')
for (i in tarefas)
    print(paste('| Tarefa: ', i$tarefa, '| Data do Vencimento: ', i$data_vencimento, '| Status: ', i$status, '|'))

print('-------------------------------------------------------------------------------')
print('ADICIONANDO TAREFAS')

tarefas[['tarefa3']] <- tarefa3
tarefas[['tarefa4']] <- tarefa4
tarefas[['tarefa5']] <- tarefa5
for (i in tarefas)
    print(paste('| Tarefa: ', i$tarefa, '| Data do Vencimento: ', i$data_vencimento, '| Status: ', i$status, '|'))

print('-------------------------------------------------------------------------------')
print('ATUALIZANDO TAREFAS')
for (i in seq(tarefas)){
  if (i <= 4){
    tarefas[[i]]$status <- 'Concluido'
  }
}
for (i in tarefas)
    print(paste('| Tarefa: ', i$tarefa, '| Data do Vencimento: ', i$data_vencimento, '| Status: ', i$status, '|'))

print('-------------------------------------------------------------------------------')
print('EXCLUIDO TAREFAS')
tarefas[['tarefa1']] <- NULL
tarefas[['tarefa2']] <- NULL
tarefas[['tarefa3']] <- NULL
tarefas[['tarefa4']] <- NULL
for (i in tarefas)
    print(paste('| Tarefa: ', i$tarefa, '| Data do Vencimento: ', i$data_vencimento, '| Status: ', i$status, '|'))
