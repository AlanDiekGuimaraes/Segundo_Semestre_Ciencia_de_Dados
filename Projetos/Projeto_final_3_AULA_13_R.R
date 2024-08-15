# * O projeto deve receber uma lista de números,
# * verificar se cada número é par ou ímpar,
# * calcular a soma dos números pares e ímpares,
# * encontrar o maior e o menor número da lista,
# * calcular a média dos números,
# tratar possíveis erros de entrada e, finalmente, exibir os resultados. O
# projeto deve ser implementado em Python e R.
lista <- 1:10
lista_numeros <- function(listau){
  pares <- list()
  impares <- list()
  for (numero in lista){
    if (numero %% 2 == 0){
      pares <- c(pares, numero)
    }else{
      impares <- c(impares, numero)
    }
  }
  return(list(pares,impares))
  print(c('Pares: ', pares))
  print(c('impares: ', impares))
  print(c('Soma dos Pares: ', sum(pares)))



}

print(lista_numeros(lista))
