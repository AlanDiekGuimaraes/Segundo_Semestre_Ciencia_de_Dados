USE db_biblioteca;

-- 1. INNER JOIN

-- Exercício 1: Liste os nomes dos membros que pegaram livros emprestados e o título dos livros que eles emprestaram.
SELECT nome, data_emprestimo, data_devolucao, titulo FROM tb_membros
INNER JOIN tb_emprestimos 	ON tb_membros.id_membro = tb_emprestimos.id_membro
INNER JOIN tb_livros 		ON tb_emprestimos.id_livro = tb_livros.id_livro;

 -- Exercício 2: Liste os autores e os livros que foram emprestados.
SELECT nome, titulo, ano_publicacao, data_emprestimo FROM tb_autores AS A
INNER JOIN  tb_livros 		AS L	ON A.id_autor = L.id_autor
INNER JOIN tb_emprestimos 	AS E 	ON L.id_livro = E.id_livro;

-- 2. RIGHT JOIN | LEFT JOIN
-- Exercício 1: Liste todos os membros que não realizaram nenhum empréstimo.
-- RIGHT JOIN
SELECT * FROM tb_emprestimos AS E
RIGHT JOIN tb_membros AS M
ON M.id_membro = E.id_membro
WHERE E.id_emprestimo IS NULL;

-- LEFT JOIN
SELECT * FROM tb_membros AS M
LEFT JOIN tb_emprestimos AS E
ON M.id_membro = E.id_membro
WHERE E.id_emprestimo IS NULL;

-- Exercício 2: Liste todos os autores e seus livros que não foram emprestados.
SELECT nome, titulo, data_emprestimo FROM tb_emprestimos AS E
RIGHT JOIN tb_livros AS L ON L.id_autor = E.id_livro
RIGHT JOIN tb_autores AS A ON A.id_autor = L.id_autor
WHERE E.id_emprestimo IS NULL;

SELECT titulo, nome, data_emprestimo FROM tb_livros AS L
LEFT JOIN tb_emprestimos AS E ON L.id_livro = E.id_livro
INNER JOIN tb_autores AS A ON L.id_autor = A.id_autor
WHERE E.id_emprestimo IS NULL;

-- 3. UNION
-- Exercício 1: Liste todos os livros e seus autores, incluindo livros que não têm autores associados e autores que não têm livros cadastrados.



-- Exercício 2: Liste todos os membros e livros emprestados, incluindo membros que não pegaram livros e livros que não foram emprestados.

