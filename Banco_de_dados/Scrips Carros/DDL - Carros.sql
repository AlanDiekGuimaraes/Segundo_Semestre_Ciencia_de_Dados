-- CRIAR A BASE DE DADOS (DATABASE)
CREATE DATABASE bd_carro;

-- ACESSAR A BASE DE DADOS
USE bd_carro;

-- DELETAR A BASE
-- DROP DATABASE bd_carro;

-- CRIAR TABELA
CREATE TABLE tb_carros(
	id INT(10) NOT NULL, -- NOT NULL -> Campo Obrigatório
    marca VARCHAR(100) NOT NULL,
    modelo VARCHAR(100) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    cor VARCHAR(50) NOT NULL,
    numero_vendas INT(10) NOT NULL,
    ano INT(5),
    PRIMARY KEY(id)
);

-- SELECT * FROM tb_carros;  -- Selecionando todos os dados da tabela tb_carros.

CREATE TABLE tb_proprietario(
	id INT(10) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    id_carro INT(10) NOT NULL,  -- Declarando ID_CARRO para relacionar à chave estrangeira 
    PRIMARY KEY(id),
    FOREIGN KEY(id_carro) REFERENCES tb_carros(id)
);

CREATE TABLE historico_preco(
	id INT(10) NOT NULL AUTO_INCREMENT,
    data_modificacao DATETIME,
    valor_anterior DECIMAL(10,2),
    valor_novo DECIMAL(10,2),
    id_carro INT(10) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_carro) REFERENCES tb_carros(id)
);
