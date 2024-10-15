USE db_biblioteca;

SELECT * FROM tb_autores;
INSERT INTO tb_autores VALUES
('1', 'Bruna', '1960-12-05'),
('2', 'Osvaldo', '1933-05-03'),
('3', 'Carlos de sá', '1957-07-01');

SELECT * FROM tb_livros;
INSERT INTO tb_livros VALUES
('4', 'A luz e a escuridão', '2003', '1' ),
('5', 'Horizontes Vermelhos', '1995', '2'),
('6', 'O escorpião Rei', '2007', '1' );

SELECT * FROM tb_membros;
INSERT INTO tb_membros VALUES
('1', 'Beijamin', '2024-06-28'),
('2', 'Vinicios Jesus', '2023-05-12'),
('3', 'Raphael', '2024-01-09'); 

SELECT * FROM tb_emprestimos;
INSERT INTO tb_emprestimos VALUES
('6', '3', '2', '2024-03-15', '2024-04-15'),
('2', '2', '1', '2024-04-10', '2024-05-10'),
('3', '1', '3', '2024-09-05', '2024-10-05'),
('4', '1', '3', '2024-09-05', '2024-10-05');  