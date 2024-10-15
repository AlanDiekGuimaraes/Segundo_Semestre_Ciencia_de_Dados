ALTER TABLE tb_autores ADD idade INT;

SELECT * FROM tb_autores;

SELECT * FROM tb_autores;
INSERT INTO tb_autores (id_autor, nome, data_nascimento) VALUES
('7', 'Bruna', '2024-12-05');

SELECT * FROM tb_emprestimos;

INSERT INTO tb_emprestimos (id_emprestimo, id_membro, id_livro, data_emprestimo) 
VALUES ( '6', '2', '1', '2024-10-11');

SELECT * FROM tb_membros;

INSERT INTO tb_membros (id_membro, nome) VALUES ('5', 'Vitória');