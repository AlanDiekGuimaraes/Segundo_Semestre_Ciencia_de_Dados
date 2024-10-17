# 1 - Pessoa Física | 2 - Pessoa Jurídica | 3 - Sair
# 1 - Cadastrar Pessoa Física / 2 - Listar Pessoa Física / 3 - Sair
# 1 - Cadastrar Pessoa Jurídica / 2 - Listar Pessoa Jurídica / 3 - Sair
from datetime import date, datetime

from Pessoa import PessoaFisica, Endereco, PessoaJuridica


def main():
    lista_pf = []
    lista_pj = []
    while True:
        print('Escolha uma opção: \n1 - Pessoa Física \n2 - Pessoa Jurídica \n0 - Sair: ')
        opcao = input()

        if opcao == '1':
            while True:
                print('''Escolha uma opção: \n1 - Cadastrar Pessoa Física \n2 - Listar Pessoa Física \n3 - Excluir Pessoa Física \n4 - Atualizar Pessoa \n0 - Voltar menu anterior: ''')
                opcao_pf = input()
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
                            print('-'*50)
                            print(f'Nome: {cada_pf.nome}')
                            print(f'CPF: {cada_pf.cpf}')
                            print(f'Endereço: {cada_pf.endereco.logradouro}, {cada_pf.endereco.numero}')
                            print(f'Data de nascimento: {cada_pf.dataNascimento.strftime("%d/%m/%Y")}')
                            print(f'Imposto a ser pago: {cada_pf.calcular_imposto(cada_pf.rendimento)}')
                            print('-' * 50)

                    else:
                        print('Lista Vazia')
                # REMOVENDO pessoa física da lista
                elif opcao_pf == '3':
                    print('Informe o CPF da pessoa a ser excluída')
                    cpf_para_remover = input()

                    pessoa_f_encontrada = False
                    for cada_pf in lista_pf:
                        if cada_pf.cpf == cpf_para_remover:
                            lista_pf.remove(cada_pf)
                            pessoa_f_encontrada = True
                            print(f'Pessoa física removida com sucesso!!')

                            break
                    if not pessoa_f_encontrada:
                        print('Nenhuma pessoa encontrada')

                # Atualizando os itens da lista
                elif opcao_pf == '4':
                    print('Digite o CPF que deseja atualizar. ')
                    cpf_para_atualizar = input()
                    pessoa_f_encontrada = False
                    for cada_pf in lista_pf:
                        if cada_pf.cpf == cpf_para_atualizar:
                            pessoa_f_encontrada = True
                            print('Escolha qual dado deseja atualizar:')
                            print('N - Nome')
                            print('R - Rendimento')
                            print('L - Logradouro')
                            print('M - Número do Endereço')
                            print('Digite a inicial do atributo que deseja alterar: ')
                            escolha = input().strip().upper()

                            if escolha == 'N':
                                print(f'Difite o nome atual é {cada_pf.nome}. Digite o novo nome para atualização')
                                novo_nome = input()
                                cada_pf.nome = novo_nome
                            elif escolha == 'R':
                                print(f'O rendimento atual é {cada_pf.rendimento}. Digite o novo valor de rendimento')
                                novo_rendimento = input()
                                cada_pf.rendimento = novo_rendimento
                            elif escolha == 'L':
                                print(f'O logradouro atual é {cada_pf.logradouro}. Digite o novo logradouro')
                                novo_logradouro = input()
                                cada_pf.logradouro = novo_logradouro
                            elif escolha == 'M':
                                print(f'O número do endereço atual é {cada_pf.numero}. Digite o novo número para atualizar.')
                                novo_numero = input()
                                cada_pf.numero = novo_numero
                            else:
                                print(f'Opção inválida. \nO CPF {cpf_para_atualizar} não consta na lista.')
                                break

                    if not pessoa_f_encontrada:
                        print(f'Nenhuma pessoa encontrada. \n O CPF {cpf_para_atualizar} não consta na lista.')



                # SAIR DO MENU ATUAL
                elif opcao_pf == '0':
                    print('Voltando ao menu anterior')
                    break

                else:
                    print('Opção Inválida, por favor digite uma das opções indicadas: ')

        elif opcao == '2':
           while True:
               print('Escolha uma opção: \n1 - Cadastrar Pessoa jurídica \n2 - Listar Pessoa jurídica \n3 - Excluir Pessoa Jurídica \n0 - Voltar menu anterior: ')
               opcao_pj = input()
               if opcao_pj == '1':
                   nova_pj = PessoaJuridica()
                   novo_endereco_pj = Endereco()

                   nova_pj.nome = input('Digite o nome da pessoa jurídica: ')
                   nova_pj.cnpj = input('Digite o CNPJ: ')
                   nova_pj.rendimento = float(input('Digite o rendimento mensal da sua empresa: '))


                   # Cadastrar Endereço
                   novo_endereco_pj.logradouro = input('Digite o logradouro: ')
                   novo_endereco_pj.numero = input('Digite o numero: ')
                   end_comercial = input('Este endereço é comercial? S/N')
                   novo_endereco_pj.endereco_comercial = end_comercial.strip().upper() == 'S'  # define se o endereço é comercial com base na resposta.

                   nova_pj.endereco = novo_endereco_pj

                   lista_pj.append(nova_pj)
                   print('Cadastro Realizado com sucesso!!')
               elif opcao_pj == '2':
                   if lista_pj:
                       for cada_pj in lista_pj:
                           print('-' * 50)
                           print(f'Razão Social: {cada_pj.nome}')
                           print(f'CNPJ: {cada_pj.cnpj}')
                           print(f'Rendimento: {cada_pj.rendimento}')
                           print(f'Endereço: {cada_pj.endereco.logradouro}, {cada_pj.endereco.numero}')
                           print(f'Imposto a ser pago: {cada_pj.calcular_imposto(cada_pj.rendimento)}')
                           print('-' * 50)

                   else:
                       print('Lista Vazia')

               elif opcao_pj == '3':
                   print('Informe o CNPJ a ser excluído')
                   cnpj_para_remover = input()
                   pessoa_j_encontrada = False
                   for cada_pj in lista_pj:
                       if cada_pj.cnpj == cnpj_para_remover:
                           lista_pj.remove(cada_pj)
                           pessoa_j_encontrada = True
                           print('Pessoa jurídica removida com sucesso!!!')
                           break
                   if not pessoa_j_encontrada:
                       print('Nenhuma pessoa jurídica encontrada')
               elif opcao_pj == '0':
                   print('Voltando ao menu anterior')
                   break

               else:
                   print('Opção Inválida, por favor digite uma das opções indicadas: ')

        elif opcao == '4':
            pass
        elif opcao == '0':
            print('Obrigado por utilizar o nosso sistema! Valeu')
            break

        else:
            print('Opção Inválida, por favor digite uma das opções indicadas: ')

if __name__ == '__main__':
    main() # chama a função principal