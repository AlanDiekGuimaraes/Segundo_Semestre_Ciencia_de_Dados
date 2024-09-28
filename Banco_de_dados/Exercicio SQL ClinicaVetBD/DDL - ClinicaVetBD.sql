CREATE DATABASE ClinicaVetBD;

USE ClinicaVetBD;

SELECT * FROM tbl_clientes;
SELECT * FROM tbl_veterinarios;
SELECT * FROM tbl_pets;
SELECT * FROM tbl_atendimento;


CREATE TABLE tbl_veterinarios(
	id_veterinario INT(10) NOT NULL,
    nome VARCHAR(20) NOT NULL,
    especialidade VARCHAR(20) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    PRIMARY KEY(id_veterinario)
);
ALTER TABLE tbl_veterinarios MODIFY COLUMN especialidade VARCHAR(40) NOT NULL;

CREATE TABLE tbl_clientes(
	id_cliente INT(10) NOT NULL,
    nome VARCHAR(20) NOT NULL,
    endereco VARCHAR(20) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_cliente)
);
-- Alterando a quantidade de caracteres para a coluna endereço. 
ALTER TABLE tbl_clientes MODIFY COLUMN endereco VARCHAR(40) NOT NULL;

CREATE TABLE tbl_pets(
	id_pet INT(10) NOT NULL,
    nome VARCHAR(20) NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    raca VARCHAR(20) NOT NULL,
    data_nascimento DATETIME(6) NOT NULL,
    id_cliente INT(10) NOT NULL,
    PRIMARY KEY (id_pet),
    FOREIGN KEY (id_cliente) REFERENCES tbl_clientes(id_cliente)    
);
ALTER TABLE tbl_pets MODIFY COLUMN data_nascimento DATE;

CREATE TABLE tbl_atendimento(
	id_atendimento INT(10) NOT NULL,
    id_pet INT(10) NOT NULL,
    id_veterinario INT(10) NOT NULL,
    data_atendimento DATETIME(6) NOT NULL,
    descricao VARCHAR(200) NOT NULL,
    PRIMARY KEY (id_atendimento),
    FOREIGN KEY (id_pet) REFERENCES tbl_pets(id_pet),
    FOREIGN KEY (id_veterinario) REFERENCES tbl_veterinarios(id_veterinario)
);
ALTER TABLE tbl_atendimento MODIFY COLUMN data_nascimento DATE;