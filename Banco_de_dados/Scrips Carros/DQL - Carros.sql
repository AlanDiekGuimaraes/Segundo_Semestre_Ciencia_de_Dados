USE bd_carro;

-- Seleciona todos os Registros
SELECT * FROM tb_proprietario;
SELECT * FROM tb_carros;

-- Seleciona apenas colunas informadas
SELECT marca, modelo FROM tb_carros;

-- Seleciona o maior valor da coluna VALOR
SELECT MAX(valor) FROM tb_carros;

-- Seleciona o menor valor da coluna
SELECT MIN(numero_vendas) FROM tb_carros;

-- Selecionar um elemento especifico.
SELECT * FROM tb_carros WHERE marca = 'Chevrolet'; 

SELECT * FROM tb_carros WHERE cor = 'Branco';

-- Seleciona o maior e menor valor registrado + as colunas informadas.
SELECT marca, modelo, ano, valor FROM tb_carros WHERE valor = (SELECT MIN(valor) FROM tb_carros);

-- Selecionar a quantidade de registros existentes.
SELECT COUNT(id) FROM tb_carros;

-- Informa a soma de valores registrados.
SELECT SUM(valor) FROM tb_carros;

-- Seleciona e exibe os registros em ordem crescente ou decrescente
SELECT * FROM tb_carros ORDER BY modelo ASC;
SELECT * FROM tb_carros ORDER BY marca DESC;

-- Informar a quantidade de registros de uma marca entre os anos de 1990 e 2018.
SELECT COUNT(id) AS 'Total de Registros', marca, ano FROM tb_carros WHERE ano BETWEEN '1990' AND '2024' GROUP BY marca, ano;
