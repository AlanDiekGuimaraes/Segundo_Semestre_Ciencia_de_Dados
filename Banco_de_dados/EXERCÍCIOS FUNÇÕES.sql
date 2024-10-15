-- Parametros para usar nas funções.
-- READ SQL DATA -> A função apenas lê os dados da tabela, não modifica.
-- DETERMINISTICS -> Quando a função trabalhará com um registro e os demais registros não afetará o resultado.
-- NO SQL -> Só interage (calculos), não lê e nem modifica. 
-- MODIFIES SQL DATA -> Alterar registros no banco de dados.

-- FUNCTION -> Um bloco de código que pode ser chamado para execultar uma operação específica e retorna um valor.
-- O valor pode ser replicado em outro trecho de código.


-- CARROS
DELIMITER $$ -- MUDANDO DELIMILITAR
-- CALCULAR UM DESCONTO
CREATE FUNCTION calculoDesconto(valor DECIMAL(10,2), desconto DECIMAL(5,2)) 
RETURNS DECIMAL(10,2)
READS SQL DATA 		-- Indica que a função apenas lê dados, sem fazer alteração no banco de dados.
BEGIN
-- Inicio da lógica
RETURN valor - (valor * desconto / 100);
-- Fim da lógica
END $$
DELIMITER ;

SELECT marca, valor, calculoDesconto(valor, 20) FROM tb_carros;

-- Calculo de vendas gerais por marca.
DELIMITER $$
CREATE FUNCTION valorTotalVendas(marcap VARCHAR(100))
RETURNS DECIMAL(10,2)
READS SQL DATA 		-- Indica que a função apenas lê dados, sem fazer alteração no banco de dados.
BEGIN
-- Inicio da lógica
DECLARE total DECIMAL(10,2);

SELECT SUM(valor * numero_vendas) INTO total FROM tb_carros
WHERE marca = marcap;

RETURN total;
-- Fim da lógica
END $$
DELIMITER ;

SELECT valorTotalVendas('Fiat');

-- CLINICA VETERINÁRIA
-- Exercicio 1. Crie uma função que receba o id_cliente e retorne a quantidade de pets que esse cliente possui.

DELIMITER $$
CREATE FUNCTION qtdPets (id_clientep INT) 
RETURNS INT
READS SQL DATA 		-- Indica que a função apenas lê dados, sem fazer alteração no banco de dados.
BEGIN
	DECLARE contar_pet INT;
    SELECT COUNT(*) INTO contar_pet
    FROM tb_pets
    WHERE id_cliente = id_clientep;
    RETURN contar_pet;
END $$
DELIMITER ;

SELECT * FROM tb_pets;
SELECT qtdPets(1);

-- Exercicio 2. Crie uma função que recebe o id_pet e retorna a data da última consulta do pet.
DELIMITER $$
CREATE FUNCTION ultimaConsulta(id_petp INT)
RETURNS DATE
READS SQL DATA 		-- Indica que a função apenas lê dados, sem fazer alteração no banco de dados.
BEGIN
    DECLARE ultimaData DATE;
    SELECT MAX(data_atendimento) INTO ultimaData
    FROM tb_atendimento
    WHERE id_pet = id_petp;
    RETURN ultimaData;
END $$
DELIMITER ;

SELECT * FROM tb_atendimento;
SELECT ultimaConsulta(1);

-- Exercicio 3. Crie uma função que receba o id_veterinario e retorne o número total de atendimentos feitos por ele.
DELIMITER $$
CREATE FUNCTION totalAtendimento(id_veterinariop INT)
RETURNS INT
READS SQL DATA 		-- Indica que a função apenas lê dados, sem fazer alteração no banco de dados.
BEGIN
    DECLARE contar_atendimento INT;
    SELECT COUNT(*) INTO contar_atendimento
    FROM tb_atendimento
    WHERE id_veterinario = id_veterinariop;
    RETURN contar_atendimento;
END $$
DELIMITER ;

SELECT * FROM tb_atendimento;
SELECT totalAtendimento(3);

-- Exercicio 4. Crie uma função que receba o id_pet e retorne o nome do dono (cliente) desse pet.
DELIMITER $$
CREATE FUNCTION donoPet(id_petp INT)
RETURNS VARCHAR(100)
READS SQL DATA 		-- Indica que a função apenas lê dados, sem fazer alteração no banco de dados.
BEGIN
    DECLARE nomeDono VARCHAR(100);
    SELECT tb_clientes.nome INTO nomeDono
    FROM tb_pets
    INNER JOIN tb_clientes ON tb_clientes.id_cliente = tb_pets.id_cliente
    WHERE id_pet = id_petp;
    RETURN nomeDono;
END $$
DELIMITER ;tb_atendimentotb_clientes

SELECT * FROM tb_pets;
SELECT donoPet(3);

-- BIBLIOTECA
-- Exercicio 1. Crie uma função que recebe o id_autor e retorna a idade do autor com base na data de nascimento.
DELIMITER $$
CREATE FUNCTION idadeAutor(id_autorp INT)
RETURNS INT
READS SQL DATA 		-- Indica que a função apenas lê dados, sem fazer alteração no banco de dados.
BEGIN
    DECLARE idade INT;
    SELECT TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) INTO idade
    FROM tb_autores
    WHERE id_autor = id_autorp;
    RETURN idade;
END $$
DELIMITER ;

SELECT * FROM tb_autores;
SELECT idadeAutor(3);
-- Exercicio 2. Crie uma função que recebe o id_autor e retorna a quantidade de livros escritos por esse autor.
DELIMITER $$
CREATE FUNCTION qtdLivrosEscritos(id_autorp INT)
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE ContarLivro INT;
    SELECT COUNT(*) INTO ContarLivro
    FROM tb_livros
    WHERE id_autor = id_autorp;
    RETURN ContarLivro;
END $$
DELIMITER ;

SELECT * FROM tb_livros;
SELECT qtdLivrosEscritos(3);
-- Exercicio 3. Crie uma função que recebe duas datas e retorna o total de empréstimos realizados nesse período.
DELIMITER $$
CREATE FUNCTION totalEmprestimos(dataInicial DATE, dataFinal DATE)
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE contarEmprestimo INT;
    SELECT COUNT(*) INTO contarEmprestimo
    FROM tb_emprestimos
    WHERE data_emprestimo BETWEEN dataInicial AND dataFinal;
    RETURN contarEmprestimo;
END $$
DELIMITER ;

SELECT * FROM tb_emprestimos;
SELECT totalEmprestimos('2024-01-14', '2024-10-27');


-- Exercicio 4. Crie uma função que retorna a média de dias em que os livros foram emprestados.
DELIMITER $$
CREATE FUNCTION mediaEmprestimos()
RETURNS DECIMAL(5,2)
READS SQL DATA
BEGIN
    DECLARE media_Emprestimo DECIMAL(5,2);
    SELECT AVG(DATEDIFF(data_devolucao, data_emprestimo)) INTO media_Emprestimo
    FROM tb_emprestimos;
    RETURN media_Emprestimo;
END $$
DELIMITER ;

SELECT * FROM tb_emprestimos;
SELECT mediaEmprestios();