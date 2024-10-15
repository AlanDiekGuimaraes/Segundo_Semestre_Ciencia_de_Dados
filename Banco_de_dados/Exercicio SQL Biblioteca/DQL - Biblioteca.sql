-- EXERCICIO 4. Realize as seguintes consultas:
USE db_biblioteca;

SELECT * FROM tb_livros;
-- a. O livro com a data de publicação mais antigo
SELECT * FROM tb_livros ORDER BY ano_publicacao ASC;

-- b. O livro com a data de publicação mais recente
SELECT * FROM tb_livros ORDER BY ano_publicacao DESC;

-- c. A quantidade de livros cadastrados no banco de dados
SELECT COUNT(id_livro) AS quantidade_de_livros FROM tb_livros;

-- d. Consulte apenas os livros que possuam a data de devolução em 18-07-2024.
SELECT * FROM tb_emprestimos;
SELECT * FROM tb_emprestimos WHERE data_devolucao = '2024-07-18';

-- e. Ordene o nome dos autores em ordem crescente
SELECT * FROM tb_autores;
SELECT * FROM tb_autores ORDER BY nome ASC;

-- f. Ordene o nome dos livros em ordem decrescente.
SELECT * FROM tb_livros;
SELECT * FROM tb_livros ORDER BY titulo DESC;


-- EXERCÍCIO 5. Utilize subqueries para realizar as seguintes consultas:

-- a. Liste os autores que possuem livros com ano de publicação maior que a média de anos
-- de publicação de todos os livros cadastrados.
SELECT * FROM tb_autores;
SELECT * FROM tb_livros;

-- Resultado
SELECT nome FROM tb_autores
WHERE id_autor in (SELECT id_autor FROM tb_livros 
				WHERE ano_publicacao > (SELECT AVG(ano_publicacao) FROM tb_livros)); 

-- b. Encontre os membros que realizaram mais de um empréstimo.
SELECT * FROM tb_membros;
SELECT * FROM tb_emprestimos;

SELECT nome FROM tb_membros 
WHERE id_membro IN (SELECT id_membro FROM tb_emprestimos
GROUP BY id_membro HAVING COUNT(id_membro) > 1);

-- c. Liste os livros que foram emprestados ao menos uma vez.
SELECT * FROM tb_livros WHERE id_livro IN (SELECT id_livro FROM tb_emprestimos 
GROUP BY id_livro HAVING COUNT(id_livro) > 1);

-- d. Consulte os livros que ainda não foram emprestados.
SELECT * FROM tb_livros WHERE id_livro NOT IN (SELECT id_livro FROM tb_emprestimos 
GROUP BY id_livro HAVING COUNT(id_livro) >= 1);