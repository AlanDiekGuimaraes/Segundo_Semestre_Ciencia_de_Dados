'''
* O projeto deve receber uma lista de números,
* verificar se cada número é par ou ímpar,
* calcular a soma dos números pares e ímpares,
* encontrar o maior e o menor número da lista,
* calcular a média dos números,
tratar possíveis erros de entrada e, finalmente, exibir os resultados. O
projeto deve ser implementado em Python e R.
'''

lista = list(range(1,11))

def Lista_numeros(lista):
    try:
        pares = []
        impares = []
        for numero in lista:
            if numero % 2 == 0:
               pares.append(numero)
            else:
                impares.append(numero)
        print(f'Pares: {pares}')
        print(f'Impares: {impares}')
        print(f'Soma dos Pares: {sum(pares)}')
        print(f'Soma dos Impares: {sum(impares)}')
        print(f'Maior: {max(lista)}')
        print(f'Menor: {min(lista)}')
        print(f'Média: {sum(lista)/len(lista)}')
    except:
        print('Deu algum ERRO na lista')
print(Lista_numeros(lista))
