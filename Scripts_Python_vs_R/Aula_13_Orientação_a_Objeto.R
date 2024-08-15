soma <- function(a,b){
  return(a+b)
}

print(soma(1,2))

par <- function(num){
  return(num%%2 == 0)
}

print(par(2))

media <- function(lista){
  return(sum(lista) / length(lista))
}

print(media(1:5))
print(media(c(10,10,10)))

soma_matriz <- function(matriz){
  return(sum(matriz))
}

matriz <- matrix(1:9, nrow = 3, ncol = 3)
print(soma_matriz(matriz))

palindromo <- function(palavra){
  return(palavra == paste(rev(strsplit(palavra, NULL)[[1]]), collapse = ''))
}

print(palindromo('radar'))
print(palindromo('python'))

# Implemente uma função que retorna a quantidade de vogais em uma string.
conta_vogais <- function(string){
  vogais <- c('a', 'e', 'i', 'o', 'u')
  return(sum(tolower(strsplit(string, NULL)[[1]]) %in% vogais))
}
print(conta_vogais('alan diek'))

# Implemente uma função que retorna o produto de duas matrizes.
produto_matriz <- function(matriz_a, matriz_b){
    return(matriz_a %*% matriz_b)
}
matriz_a <- matrix(c(1, 2, 3, 4), nrow = 2, ncol = 2)
matriz_b <- matrix(c(5, 6, 7, 8), nrow = 2, ncol = 2)

print(produto_matriz(matriz_a, matriz_b))

# Recursividade
# implemente uma função recursiva que calcula o fatorial de um número.
fatorial <- function(numero){
    if(numero == 0){
        return(1)
    }
    return(numero * fatorial(numero - 1))
}

print(fatorial(5))

soma_n_numeros <- function(numero){
    if(numero == 0){
        return(0)
    }
    return(numero + soma_n_numeros(numero - 1))
}

print(soma_n_numeros(10))