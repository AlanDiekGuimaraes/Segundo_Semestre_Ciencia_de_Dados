# Tratamento de erros
# Definição | Aplicação
tryCatch({
  resultado <- 10 / 0
  print(resultado)
}, error = function(e){
  print('Erro: Divisão por zero não é permitida. ')
}
)

lista <- c(1, 2, 3)
tryCatch({
  elemento <- lista[5]
  print(elemento)
}, error = function(e){
          print('Erro: Índice fora dos limites da lista')
})

# Implemente um bloco try-except para capturar uma chave inexistente em um dicionário.

dicionario <- list(a =1, b = 2, c =3)
tryCatch({
  valor <- dicionario[['d']]
  print(valor)
}, error = function(e){
  print('Erro: Chave inexistente no dicionário')
})
