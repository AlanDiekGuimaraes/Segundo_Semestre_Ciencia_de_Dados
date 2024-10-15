-- CARROS
USE bd_carro;

-- Crie um stored procedure que insira um novo carro na tabela carros, fornecendo os valores da marca, modelo, ano, valor, cor e número de vendas.

DELIMITER $$
CREATE PROCEDURE inserirCarro(
	IN id_p INT(10),
    IN marca_p VARCHAR(100),
    IN modelo_p VARCHAR(100),
    IN valor_p DECIMAL(10,2),
    IN cor_p VARCHAR(50),
    IN numero_vendas_p INT(10),
    IN ano_p INT(5)
)
BEGIN
	INSERT INTO tb_carros(id, marca, modelo, valor, cor, numero_vendas, ano)
    VALUES(id_p, marca_p, modelo_p, valor_p, cor_p, numero_vendas_p, ano_p);
END $$
DELIMITER ;

CALL inserirCarro('12', 'Fiat', 'Uno', '20000', 'Uva', '52000', '2007');
SELECT * FROM tb_carros;

-- Crie uma store procedure que atualize o valor de um carro na tabela carros, baseado no ID do carro, e insira o histórico dessa modificação na tabela historico_preco.
DELIMITER $$
CREATE PROCEDURE atualizarValorCarro(
	IN id_mod_p INT(10),
    IN id_carro_p INT(10),
    IN novo_valor_p DECIMAL (10,2)
)
BEGIN
	DECLARE valor_atual DECIMAL(10,2);
    -- Qual o valor atual do carro.
	SELECT valor INTO valor_atual FROM tb_carros WHERE id = id_carro_p FOR UPDATE;
    
    -- Atualizar valor do carro.
    UPDATE tb_carros SET valor = novo_valor_p WHERE id = id_carro_p;
    
    -- Inserir valor anterior na tabela historico_preco.
    INSERT INTO historico_preco(id, data_modificacao, valor_anterior, valor_novo, id_carro)
    VALUES(id_mod_p, NOW(), valor_atual, novo_valor_p, id_carro_p);
END $$
DELIMITER ;

SELECT * FROM tb_carros;
SELECT * FROM historico_preco;
CALL atualizarValorCarro('8', '12' , '9000');

-- -----------------------------------------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------------------------------------

-- BIBLIOTECA
USE db_biblioteca;
-- EXERCICIO 1. Crie uma stored procedure que insira um novo autor na tabela Autores.
DELIMITER $$
CREATE PROCEDURE inserirAutor(
	IN id_autor_p INT(10),
	IN nome_p VARCHAR(255),
    IN data_nascimento_p DATE,
    IN idade_p INT(3)
    )
BEGIN
	INSERT INTO tb_autores(id_autor, nome, data_nascimento, idade)
    VALUES(id_autor_p, nome_p, data_nascimento_p, idade_p);
END $$
DELIMITER ;

SELECT * FROM tb_autores;
CALL inserirAutor('9', 'Marineide', '1980-02-01', '50');

-- EXERCICIO 2. Crie uma stored procedure para atualizar a data de devolução de um empréstimo já registrado.
DELIMITER $$
CREATE PROCEDURE atualizarDevolucaoEmprestimo(
    IN id_emprestimo_p INT,
    IN data_devolucao_p DATE
)
BEGIN
   
    UPDATE tb_emprestimos
    SET data_devolucao = data_devolucao_p
    WHERE id_emprestimo = id_emprestimo_p;
END $$
DELIMITER ;

SELECT * FROM tb_emprestimos;

CALL atualizarDevolucaoEmprestimo('1', '2024-02-28');
-- EXERCICIO 3. Crie uma stored procedure que consulte todos os livros emprestados por um determinado membro, retornando os títulos dos livros e as datas de empréstimo.
DELIMITER $$
CREATE PROCEDURE consultarLivrosEmprestadosPorMembro(
    IN id_membro_p INT
)
BEGIN
    SELECT L.titulo, E.data_emprestimo
    FROM tb_livros L
    JOIN tb_emprestimos E ON L.id_livro = E.id_livro
    WHERE E.id_membro = id_membro_p;
END $$
DELIMITER ;

SELECT * FROM tb_emprestimos;
CALL consultarLivrosEmprestadosPorMembro(3);

-- EXERCICIO 4. Crie uma stored procedure que registre um novo empréstimo, verificando se o membro e o livro existem.
DELIMITER $$
CREATE PROCEDURE registrarEmprestimo(
    IN id_membro_p INT,
    IN id_livro_p INT,
    IN data_emprestimo_p DATE,
    IN data_devolucao_p DATE
)
BEGIN
   -- Lógica
END $$
DELIMITER ;
SELECT * FROM tb_emprestimos;

-- -----------------------------------------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------------------------------------

-- CLINICA

-- EXERCICIO 1. Crie uma stored procedure que adicione um novo veterinário na tabela Veterinarios.
DELIMITER $$
CREATE PROCEDURE adicionarVeterinario(
	IN id_veterinario_p INT,
    IN nome_p VARCHAR(100),
    IN especialidade_p VARCHAR(100),
    IN telefone_p VARCHAR(15)
)
BEGIN
    INSERT INTO tb_veterinarios (id_veterinario, nome, especialidade, telefone)
    VALUES (id_veterinario_p, nome_p, especialidade_p, telefone_p);
END $$
DELIMITER ;

SELECT * FROM tb_veterinarios;
CALL adicionarVeterinario('5', 'Pedro', 'Cão e Gato', '11-9.9999-9999');

-- EXERCICIO 2. Crie uma stored procedure para atualizar os dados de um cliente, como nome, endereço e telefone.
DELIMITER $$
CREATE PROCEDURE atualizarDadosCliente(
    IN id_cliente_p INT,
    IN nome_p VARCHAR(100),
    IN endereco_p VARCHAR(100),
    IN telefone_p VARCHAR(20)
)
BEGIN
    UPDATE tb_clientes
    SET nome = nome_p, endereco = endereco_p, telefone = telefone_p
    WHERE id_cliente = id_cliente_p;
END $$
DELIMITER ;

SELECT * FROM tb_clientes;
CALL atualizarDadosCliente('2', 'Gorete Guimarães', 'Rua: Maria Rita, 15', '074-9.9777-9876');

-- EXERCICIO 3. Crie uma stored procedure que registre um novo atendimento de um pet, verificando se o veterinário e o pet existem.
DELIMITER $$
CREATE PROCEDURE registrarAtendimento(
    IN id_pet_p INT,
    IN id_veterinario_p INT,
    IN data_atendimento_p DATE,
    IN descricao_p VARCHAR(200)
)
BEGIN
   -- Lógica
END $$
DELIMITER ;
