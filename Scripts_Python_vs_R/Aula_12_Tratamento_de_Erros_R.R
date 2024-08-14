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

# Capture e trate uma exceção ao converter uma string para um inteiro.
string <- 'abc'
tryCatch({
  numero <- as.integer(string)
}, warning = function(w){
  print('Erro: Conversão de string para inteiro falhou')
})

# Capture e trate exceções em operações de dicionário e listas aninhadas.
dicionario <- list(a = c(1, 2, 3), b = c(4, 5, 6))
tryCatch({
  elemento <- dicionario[['c']][1]
}, error = function(e){
  if (inherits(e, 'simpleError')){
    print('Erro: Chave inexistente no docionario ou indíce fora dos limites da lista')
  }
})
