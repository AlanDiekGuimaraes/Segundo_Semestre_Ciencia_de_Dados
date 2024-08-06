nome = 'Alan'
idade = 36
altura = 1.74
brasileiro = True

print('Nome: ', nome)
print('Idade: ', idade)
print('Altura: ', altura)
print('Brasileiro: ', brasileiro)

print(type(nome))
print(type(idade))
print(type(altura))
print(type(brasileiro))

PI = 3.14159

mensagem = 'Ó o Auê Aí Ô'
print(mensagem)
print(type(mensagem))

numero = 100
print(type(numero))

from datetime import datetime
data_atual = datetime.now()
print(data_atual)

from enum import Enum
class dias_da_semana(Enum):
  Segunda = 1
  Terca = 2
  Quarta = 3
  Quinta = 4
  Sexta = 5
  Sabado = 6
  Domingo = 7

print(dias_da_semana.Quarta.value)
print(dias_da_semana.Quarta.name)
