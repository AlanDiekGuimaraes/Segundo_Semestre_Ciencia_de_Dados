nome <- 'Alan'
idade <- 36
altura <- 1.74
brasileiro <- TRUE

print(nome)
print(idade)
print(altura)
print(brasileiro)

print(paste('Nome: ', nome))
print(paste('Idade: ', idade))
print(paste('Altura: ', altura))
print(paste('Brasileiro: ', brasileiro))

print(typeof(nome))
print(typeof(idade))
print(typeof(altura))
print(typeof(brasileiro))

PI <- 3.14159

mensagem <- 'Ó o Auê Aí Ô'
print(mensagem)
print(paste('Mensagem: ', mensagem))
print(typeof(mensagem))

numero <- 100
print(typeof(numero))

data_atual <- Sys.time()
print(data_atual)

x <- Sys.Date()
print(x)

dias_da_semana <- factor(c('Segunda', 'Terca', 'Quarta', 'Quinta', 'Sexta', 'Sabado', 'Domingo'), levels = c('Segunda', 'Terca', 'Quarta', 'Quinta', 'Sexta', 'Sabado', 'Domingo'))
print(dias_da_semana[3])