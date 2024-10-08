# Crie um sistema simples de gerenciamento de contatos que permita adicionar novos
# contatos, remover contatos e listar todos os contatos com seus detalhes. O
# sistema deve utilizar variáveis e operações diretamente, sem a utilização de funções.
usuario3 <- list(nome= 'Manoel', telefone= '11.7.7777.7777')

contato <- list(
  usuario1 = list(nome= 'Alan', telefone= '11.9.9999.9999'),
  usuario2 = list(nome= 'Vinicius', telefone= '11.8.8888.8888')
)
print('----------------------------------------')
print('CONTATOS')

for (usuario in contato){
  print(paste('Nome:', usuario$nome, 'Telefone:', usuario$telefone))
}

print('----------------------------------------')
print('ADICIONANDO USUÁRIO')
contato[['usuario3']] <- usuario3
for (usuario in contato){
  print(paste('Nome:', usuario$nome, 'Telefone:', usuario$telefone))
}
print('----------------------------------------')
print('DELETANDO USUÁRIO')
contato[['usuario2']] <- NULL
for (usuario in contato){
  print(paste('Nome:', usuario$nome, 'Telefone:', usuario$telefone))
}