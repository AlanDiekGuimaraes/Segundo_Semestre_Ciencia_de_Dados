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

# Exercício fácil: Crie um vetor de categorias (fatores) com as cores 'vermelho', 'Azul' e 'Verde'
cores <- factor(c('vermelho', 'azul', 'verde'))
print('Cores', cores)

# Exercício fácil: Crie um vetor de fatores para os dias da semana e imprima-os.
dias_da_semana <- factor(c('Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado', 'Domingo'))
print(dias_da_semana)

# Exercício médio: Crie um vetor de fatores com as categorias 'Baixo', 'mádio' e 'alto' e ordene-os.
niveis <- factor(c('Baixo', 'Alto', 'Médio'), levels = c('Baixo', 'Médio', 'Alto'), order = TRUE)
print(niveis)

# Exercício médio: Converta um vetor de fatores em um vetor numérico.
categorias <- factor(c('Baixo', 'Alto', 'Médio'), levels = c('Baixo', 'Médio', 'Alto'), order = TRUE)
numeros <- as.numeric(categorias)
print(numeros)

# Exercício difícil: Crie um vetor de fatores com as categorias
# 'Pequeno', 'Médio' e 'Grande' e substitua pequeno por 'Extra Pequeno'.
tamanhos <- factor(c('Pequeno', 'Médio', 'Grande'), levels = c('Pequeno', 'Médio', 'Grande'), order = TRUE)
levels(tamanhos)[levels(tamanhos) == 'Pequeno'] <- 'Extra Pequeno'
print(tamanhos)

# Exercício difícil: Crie um vetor de fatores com 100 elementos aleatórios entre
# 'Baixo', 'Médio', 'Alto', e calcule a frequência de cada categoria.
set.seed(123)
categorias <- c('Baixo', 'Médio', 'Alto')
vetor <- sample(categorias, 100, replace = TRUE)
fatores <- factor(vetor, levels = categorias, ordered = TRUE)
frequencia <- table(fatores)
print(frequencia)

#Lista em R
# Crie uma lista contendo os números de 1 a 5.
lista <- list(1, 2, 3, 4, 5)
print(lista)

#Exercicio Facil: Adicione um elemento "6" ao final da lista [1,2,3,4,5]
ista <- list(1,2,3,4,5)
lista[[6]] <- 6
print(lista)

#Exercicio Medio: Remova o terceiro elemento da lista [1,2,3,4,5]
lista <- list(1,2,3,4,5)
lista <- lista[-3]
print(lista)

#Exercicio Dificil: Inverta a ordem dos elementos da lista
lista <- list(1,2,3,4,5)
lista_invertida <- rev(lista)
print(lista_invertida)

#Exercicio Dificil: Crie uma lista de listas (matriz)
#de tamanho 3x3 e calcule a soma de cada linha.
matriz <- list(c(1,2,3), c(4,5,6), c(7,8,9))
soma_linhas <- sapply(matriz, sum)
print(soma_linhas)

# Tuplas em Python
# Exercício fácil: Crie uma tupla contendo os números de 1 a 5 e imprima-o.
tupla <- list(1, 2, 3, 4, 5) # Não tem tupla em R.
print(tupla)

# Tuplas em Python
# Exercício fácil: Crie uma tupla contendo os números de 1 a 5 e imprima o terceiro elemento.
tupla <- list(1, 2, 3, 4, 5) # Não tem tupla em R.
print(tupla[[3]])

#Exercício médio: Crie uma tupla contendo três tuplas internas.
# Cada uma com dois elementos, e imprima-a.
tupla_1 <- list(list(1, 2), list(3, 4), list(5,6))
print(tupla_1)

# Exercício médio: Concatene duas tuplas (1, 2, 3) e (4, 5, 6).
lista1 <- list(1, 2, 3)
lista2 <- list(4, 5, 6)
lista_concatenada <- c(lista1, lista2)
print(lista_concatenada)

# Exercício difícil: Crie uma tupla com os elementos (1, 2, 3, 4, 5,6)
# Verifique se o número 3 está na tupla
lista <- list(1, 2, 3, 4, 5, 6)
existe <- 3 %in% lista
print(existe)

# Exercício difícil: Crie uma tupla com os elementos (1, 2, 3, 4, 5,6)
# e encontre o índice do número 4
lista <- list(1, 2, 3, 4, 5,6)
indice <- which(unlist(lista) == 4)
print(indice)

# Dicionário em Python
# Exercício fácil: Crie um dicionário com as chaves 'nome', 'idade', e 'cidade'
# e valores 'Ana', 25 e 'São Paulo'
dicionario <- list(nome='Ana', idade='25', cidade='São Paulo')
print(dicionario)

#Acesse o valor associado à chave 'idade'no dicionario
# {'nome': 'Ana', 'idade': '25', 'cidade': 'Sao Paulo'}
dicionario <- list(nome='Ana', idade='25', cidade='São Paulo')
idade <- dicionario$idade
print(idade)

# Exercício médio: Adicione um novo par chave-valor "Profissão': 'engenheira'
# ao dicionário {'nome': 'Ana', 'idade': '25', 'cidade': 'Sao Paulo'}
dicionario <- list(nome='Ana', idade='25', cidade='São Paulo')
dicionario$profissao <- 'Engenheiro'
print(dicionario)

# Remova a chave 'cidade' dp dicionário
# {'nome': 'Ana', 'idade': '25', 'cidade. : 'São paulo'}
dicionario <- list(nome='Ana', idade='25', cidade='São Paulo')
dicionario['cidade'] <- NULL
print(dicionario)

# Crie um dicionário aninhado para armazenar informações de várias pessoas, onde cada pessoa tem um nome, idade e cidade.
dicionario <- list(
  pessoa1 = list(nome='Ana', idade=25, cidade='São Paulo'),
  pessoa2 = list(nome='Brenda', idade=7, cidade='São Caetano do Sul'),
  pessoa3 = list(nome='Sandra', idade=35, cidade='São Caetano do Sul'),
  pessoa4 = list(nome='Alan', idade=36, cidade='Uauá')
)
print(dicionario)

# Percorra um dicionário aninhado e imprima as informações de cada pessoa no formato 'Nome: Ana, Idade: 25, Cidade: São Paulo.
dicionario <- list(
  pessoa1 = list(nome='Ana', idade='25', cidade='São Paulo'),
  pessoa2 = list(nome='Brenda', idade='7', cidade='São Caetano do Sul'),
  pessoa3 = list(nome='Sandra', idade='35', cidade='São Caetano do Sul'),
  pessoa4 = list(nome='Alan', idade='36', cidade='Uauá')
)
for (pessoa in dicionario){
  print(paste('Nome:', pessoa$nome, 'idade:', pessoa$idade, 'Cidade:', pessoa$cidade))
}

# Operadores em R
# Aritméticos
# Some dois números, 10 e 20
soma <- 10 + 20
print(soma)

# Subtraia 30 de 15.
subtracao <- 30 - 15
print(subtracao)

# Multiplique 6 por 7
multiplicacao <- 6 * 7
print(multiplicacao)

# Divida 81 POR 9
divisao <- 81/9
print(divisao)

# Calcule a exponenciação de 2 elevado a 10.
exp = 2 ^ 10
print(exp)

# Calcule o resto da divisão de 29 por 5.
resto <- 29 %% 5
print(resto)

# Lógicos
# Verifique se o número 8 é maior que 5 e imprima o resultado.
resultado <- 8 > 5
print(resultado)

# Verifique se o número 3 é menor ou igual a 10 e imprima o resultado.
resultado <- 3 <= 10
print(resultado)

# Verifique se o número 7 e maior que 5 e menor que 10 e imprima o resultado.
resultado = 5 < 7 & 7 < 10
print(resultado)

# Verifique se o número 12 é par e se está entre 10 e 15 e imprima o resultado. (um número é par se o resto da divisão por 2 é 0
resultado = (12 %% 2 == 0) & (12 > 10 & 12 < 15)
print(resultado)

# Verifique se um número é multiplo de 3 ou 5 e se está entre 20 e 30.
numero <- 