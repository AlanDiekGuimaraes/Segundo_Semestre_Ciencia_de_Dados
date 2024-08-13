# Imprima os elementos de um dicionário até encontrar um valor específico.

dicionario = list(a = 1, b = 2, c = 3, d = 4, e = 5, f = 6)

for (chave in names(dicionario)){
  if (dicionario[[chave]] == 4){
    print(paste('Chave: ',chave,'Valor:',dicionario[[chave]]))
    print('Valor encontrado')
    break
  }
  print(paste('Chave: ',chave,'Valor:',dicionario[[chave]]))
}