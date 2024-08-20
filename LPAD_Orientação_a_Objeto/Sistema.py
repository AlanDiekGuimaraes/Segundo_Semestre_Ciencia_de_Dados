# 1 - Pessoa Fisica | 2 - Pessoa Juridica | 3 - Sair
# 1 - Cadastrar Pessoa Física / 2 - Listar Pessoa Física / 3 - Sair
# 1 - Cadastrar Pessoa Jurídica / 2 - Listar Pessoa Jurídica / 3 - Sair
from datetime import date, datetime

from Pessoa import PessoaFisica, Endereco, PessoaJuridica


def main():
    lista_pf = []
    lista_pj = []
    while True:
        opcao = input('''Escolha uma opção: 1 - Pessoa Física | 2 - Pessoa Jurídica | 0 - Sair: ''')

        if opcao == '1':
            while True:
                opcao_pf = input('''Escolha uma opção: 1 - Cadastrar Pessoa Física | 2 - Listar Pessoa Física | 0 - Voltar menu anterior: ''')
                # Cadastrar uma pessoa física
                if opcao_pf == '1':
                    nova_pf = PessoaFisica()
                    novo_endereco_pf = Endereco()
                    nova_pf.nome = input('Digite o nome da pessoa física: ')
                    nova_pf.cpf = input('Digite o CPF: ')
                    nova_pf.rendimento = float(input('Digite o rendimento mensal (digite somente números): '))

                    data_nascimento = input('Digite o data de nascimento: (dd/mm/aaaa): ') # Solicita a data de nascimento
                    nova_pf.dataNascimento = datetime.strptime(data_nascimento, '%d/%m/%Y').date()
                    idade = (date.today() - nova_pf.dataNascimento).days // 365  # Calcula a idade da pessoa.
                    if idade >= 18:
                        print('A pessoa tem mais de 18 anos')
                    else:
                        print('A pessoa tem menos de 18 anos. Retorne ao menu...')
                        continue # Retorna ao inicio do loop.

                    # Cadastrar Endereço
                    novo_endereco_pf.logradouro = input('Digite o logradouro: ')
                    novo_endereco_pf.numero = input('Digite o numero: ')
                    end_comercial = input('Este endereço é comercial? S/N')
                    novo_endereco_pf.endereco_comercial = end_comercial.strip().upper() == 'S' # define se o endereço é comercial com base na resposta.

                    nova_pf.endereco = novo_endereco_pf

                    lista_pf.append(nova_pf)
                    print('Cadastro Realizado com sucesso!!')

                # Listar pessoa física
                elif opcao_pf == '2':
                    if lista_pf:
                        for cada_pf in lista_pf:
                            print(f'Nome: {cada_pf.nome}')
                            print(f'CPF: {cada_pf.cpf}')
                            print(f'Endereço: {cada_pf.endereco.logradouro}, {cada_pf.endereco.numero}')
                            print(f'Data de nascimento: {cada_pf.dataNascimento.strftime("%d/%m/%Y")}')
                            print(f'Imposto a ser pago: {cada_pf.calcular_imposto(cada_pf.rendimento)}')
                            print('Digite qualquer tecla para retornar ao menu')
                            input()
                    else:
                        print('Lista Vazia')

                # SAIR DO MENU ATUAL
                elif opcao_pf == '0':
                    print('Voltando ao menu anterior')
                    break

                else:
                    print('Opção Inválida, por favor digite uma das opções indicadas: ')

        elif opcao == '2':
           while True:
               opcao_pj = input('Escolha uma opção: 1 - Cadastrar Pessoa jurídica | 2 - Listar Pessoa jurídica | 0 - Voltar menu anterior: ')
               if opcao_pj == '1':
                   nova_pj = PessoaJuridica()
                   novo_endereco_pj = Endereco()
                   nova_pj.nome = input('Digite o nome da pessoa jurídica: ')
                   nova_pj.cnpj = input('Digite o CNPJ: ')
                   nova_pj.rendimento = float(input('Digite o rendimento mensal da sua empresa: '))
                   nova_pj.nome_empresa = input('Digite o nome da empresa: ')

                   # Cadastrar Endereço
                   novo_endereco_pj.logradouro = input('Digite o logradouro: ')
                   novo_endereco_pj.numero = input('Digite o numero: ')
                   end_comercial = input('Este endereço é comercial? S/N')
                   novo_endereco_pj.endereco_comercial = end_comercial.strip().upper() == 'S'  # define se o endereço é comercial com base na resposta.

                   nova_pj.endereco = novo_endereco_pj

                   lista_pj.append(nova_pj)
                   print('Cadastro Realizado com sucesso!!')
               elif opcao_pj == '2':
                   pass





        elif opcao == '0':
            print('Obrigado por utiliar o nosso sistema! Valeu')
            break

        else:
            print('Opção Inválida, por favor digite uma das opções indicadas: ')

if __name__ == '__main__':
    main() # chama a função principal