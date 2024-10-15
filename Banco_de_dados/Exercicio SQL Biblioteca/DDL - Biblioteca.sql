CREATE DATABASE db_biblioteca;

USE db_biblioteca;

CREATE TABLE tb_autores(
	id_autor INT(10) NOT NULL,
    nome VARCHAR(255) NOT NULL,
    data_nascimento DATE NOT NULL,
    PRIMARY KEY (id_autor)
);
-- ALTER TABLE tb_autores CHANGE COLUMN id_auto id_autor INT;

CREATE TABLE tb_livros(
	id_livro INT(10) NOT NULL,
    titulo VARCHAR(255) NOT NULL,
    ano_publicacao INT(4) NOT NULL,
    id_auto INT(10) NOT NULL,
    PRIMARY KEY(id_livro),
    FOREIGN KEY (id_autor) REFERENCES tb_autores(id_autor)
);


CREATE TABLE tb_membros(
	id_membro INT(10) NOT NULL,
    nome VARCHAR(255) NOT NULL,
    data_adesao DATE NOT NULL,
    PRIMARY KEY (id_membro)
);

CREATE TABLE tb_emprestimos(
	id_emprestimo INT(10) NOT NULL,
    id_membro INT(10) NOT NULL,
    id_livro int(10) NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE NOT NULL,
    PRIMARY KEY (id_emprestimo),
    FOREIGN KEY (id_membro) REFERENCES tb_membros(id_membro),
    FOREIGN KEY (id_livro) REFERENCES tb_livros(id_livro)
);