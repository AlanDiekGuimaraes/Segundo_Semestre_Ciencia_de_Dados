# Verifique se um número é positivo
numero <- 5
if (numero > 0){
  print('O número é positivo')
}else{
  print('O número é negativo')
}

# Verifique se uma palavra contém mais de 5 caracteres
palavra <- 'Qualquer'

if (nchar (palavra) > 0){
  print('A palavra contém mais de 5 caracteres')
}else{
  print('A palavra não contém mais de 5 caracteres')
}

# Verifique se o ano é bissexto
ano <- 2023
if ((ano %% 4 == 0 && ano %% 100 != 0) | (ano %% 400 == 0)){
     print('O ano é bissexto')
}else{
  print('O ano não é bissexto')
}

# Composta
# Verifique se um número está entre 10 e 20.
numero <- 15
if(numero >= 10 & numero <= 20){
  print('O número está entre 10 e 20')
}else{
  print('O número não está entre 10 e 20.')
}

# Verifique se uma string contém letras e números.
string <- 'abc123'
if (any(grepl('[A-Za-z]', string)) & any(grepl('[0-9]', string))){
  print('A string possui letras e números')
}else{
  print('A string não possui letras e números')
}

# Verifique a faixa etária de uma pessoa (criança, adolescente, adulto, idoso)
idade <- 60
if (idade < 13){
  print('Criança')
}else if(idade < 18){
  print('Adolescente')
}else if(idade < 60){
  print('Adulto')
}else{
  print('Idoso')
}

# Determine a estação do ano baseada no mês (primavera, verão, outono, inverno)
mes <- 5
if (mes %in% c(6 ,7 , 8)){
  print('Inverno')
}else if (mes %in% c(9, 10, 11)){
  print('Primavera')
}else if (mes %in% c(12, 1, 2)){
  print('Verão')
}else if (mes %in% c(3, 4, 5)){
  print('Outono')
}else{
  print('Mês invalido')
}

#Laços de repetição
#Contador
#Imprima os números de 1 a 10.
for (i in 1:10){
  print(i)
}

lista <- c(1, 2, 3, 4, 5)
for (elemento in lista){
  print(elemento)
}

# Imprima os elementos de um dicionário.
dicionario <- list(a = 1, b = 2, c = 3)
for (chave in names(dicionario)){
  print(paste('Chave:', chave, 'Valor:', dicionario[[chave]]))
}


# Imprima os números de 1 a 10 usando um laço while
contador <- 1
while (contador <= 10){
  print(contador)
  contador <- contador + 1
}

