#Vetores em R
#Exercicio fácil: Crie um vetor com os númes de 1 a 10 e imprima-o.
vetor <- 1:10
print(vetor)

#Exercício fácil: Crie um vetor com os números pares de 2 a 20 e imprima-o.
vetor <- seq(2, 20, by=2)
print(vetor)

# Exercício médio: Calcule a soma dos elementos de um vetor com números de 1a 100.
vetor <- 1:100
soma <- sum(vetor)
print(soma)

#Exercicio Medio: Encontre o maior e o menor valor em um vetor de mumeros
#aleatorios entre 1 e 1000, de tamanho 50.
vetor <- sample(1:1000, 50, replace = TRUE)
maior <- max(vetor)
menor <- min(vetor)
print(paste("Maior:", maior, "Menor:",menor))

# Exercício difícil: Crie um vetor com os 10 primeiros números primos
eh_primos <- function(n){
  if(n<=1){
    return(FALSE)
  }
  for (i in 2:sqrt(n)) {
    if (n %% i == 0){
      return(FALSE)
    }
  }
  return(TRUE)
}

primos <- c()
num <- 2
while (length(primos) < 10) {
    if(eh_primos(num)){
    primos <- c(primos, num)
    }
    num <- num + 1
}
print(primos)

#Exercício fácil: Crie uma matriz identidade 4x4 e imprima-a.
matriz_identidade <- diag(4)
print(matriz_identidade)

# Exercício médio: Some duas matrizes 2x2.
matriz1 <- matrix(c(1,2,3,4), nrow = 2, ncol = 2)
matriz2 <- matrix(c(5,6,7,8), nrow = 2, ncol = 2)
matriz_soma <- matriz1 + matriz2
print(matriz_soma)

# Exercício médio: multiplique duas matrizes 2x2.
matriz1 <- matrix(c(1,2,3,4), nrow = 2, ncol = 2)
matriz2 <- matrix(c(5,6,7,8), nrow = 2, ncol = 2)
matriz_mult <- matriz1 %*% matriz2
print(matriz_mult)

# Exercício difícil: Calcule a transposta de uma matrix 3x3.
matriz <- matrix(1:9, nrow = 3, ncol = 3)
print(matriz)
matriz_transposta <- t(matriz)
print(matriz_transposta)

# Exercício difícil: Calcule a determinante de uma matriz 3x3.
matriz <- matrix(1:9, nrow = 3, ncol = 3)
determinante <- det(matriz)
print(determinante)
