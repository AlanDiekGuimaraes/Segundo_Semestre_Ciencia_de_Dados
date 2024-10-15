CREATE DATABASE bd_clinica_vet;

USE bd_clinica_vet;

SELECT * FROM tb_clientes;
SELECT * FROM tb_veterinarios;
SELECT * FROM tb_pets;
SELECT * FROM tb_atendimento;


CREATE TABLE tb_veterinarios(
	id_veterinario INT(10) NOT NULL,
    nome VARCHAR(20) NOT NULL,
    especialidade VARCHAR(20) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    PRIMARY KEY(id_veterinario)
);
ALTER TABLE tb_veterinarios MODIFY COLUMN especialidade VARCHAR(100) NOT NULL;

CREATE TABLE tb_clientes(
	id_cliente INT(10) NOT NULL,
    nome VARCHAR(20) NOT NULL,
    endereco VARCHAR(20) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_cliente)
);
-- Alterando a quantidade de caracteres para a coluna endereço. 
ALTER TABLE tb_clientes MODIFY COLUMN endereco VARCHAR(100) NOT NULL;

CREATE TABLE tb_pets(
	id_pet INT(10) NOT NULL,
    nome VARCHAR(20) NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    raca VARCHAR(20) NOT NULL,
    data_nascimento DATETIME(6) NOT NULL,
    id_cliente INT(10) NOT NULL,
    PRIMARY KEY (id_pet),
    FOREIGN KEY (id_cliente) REFERENCES tb_clientes(id_cliente)    
);
ALTER TABLE tb_pets MODIFY COLUMN data_nascimento DATE;
-- ALTER TABLE tb_pets MODIFY COLUMN tipo 

CREATE TABLE tb_atendimento(
	id_atendimento INT(10) NOT NULL,
    id_pet INT(10) NOT NULL,
    id_veterinario INT(10) NOT NULL,
    data_atendimento DATETIME(6) NOT NULL,
    descricao VARCHAR(200) NOT NULL,
    PRIMARY KEY (id_atendimento),
    FOREIGN KEY (id_pet) REFERENCES tb_pets(id_pet),
    FOREIGN KEY (id_veterinario) REFERENCES tb_veterinarios(id_veterinario)
);
ALTER TABLE tb_atendimento MODIFY COLUMN data_nascimento DATE;