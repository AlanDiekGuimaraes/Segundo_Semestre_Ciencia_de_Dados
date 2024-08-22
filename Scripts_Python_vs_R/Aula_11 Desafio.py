#Imprima os elementos de um dicionário até encontrar um valor específico.

dicionario = {'a': 1,'b': 2,'c': 3, 'd': 4, 'e': 5, 'f': 6}

for chave, valor in dicionario.items():
  if valor == 4:
    print(f'{chave}: {valor}')
    print(f'Valor encontrado')
    break
  print(f'{chave}:{valor}')