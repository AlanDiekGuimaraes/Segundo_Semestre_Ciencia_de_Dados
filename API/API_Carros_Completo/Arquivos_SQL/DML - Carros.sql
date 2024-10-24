USE bd_carro;

SELECT * FROM tb_carros;

INSERT INTO tb_carros VALUES (
	'1', 
    'Fiat',
    'Uno',
    '20000.00',
    'Branco',
    '50000',
    '1990'
);

INSERT INTO tb_carros VALUES (
	'2',
    'Chevrolet',
    'Onix',
    '35000.00',
    'Rosa',
    '1000',
    '2018'
);

INSERT INTO tb_carros VALUES(
	'3',
    'Chevrolet',
    'C-10',
    '25000.00',
    'Bege',
    '100000',
    '1988'    
);

INSERT INTO tb_carros VALUES(
	'4',
    'Chevrolet',
    'Camaro',
    '37599.00',
    'Amarelo',
    '2685',
    '2024'
);
INSERT INTO tb_carros VALUES(
	'5',
    'Fiat',
    '147',
    '99500.00',
    'Azul',
    '8985',
    '1976'    
);

INSERT INTO tb_carros VALUES(
	'6',
    'Ford',
    'Maverick',
    '15800.00',
    'Azul Turquesa',
    '10500',
    '1979'
);

INSERT INTO tb_carros VALUES (
	'7',
    'Honda',
    'Civic',
    '98000.00',
    'Cinza Prateado',
    '23000',
    '2021'
);

INSERT INTO tb_carros VALUES(
	'8',
    'Hyundai',
    'HB20S',
    '56300.00',
    'Branco',
    '21500',
    '2019'
);

INSERT INTO tb_carros VALUES(
	'9',
    'Hyundai',
    'Santa Fe',
    '59899.00',
    'Preto',
    '21500',
    '2020'
);

INSERT INTO tb_carros VALUES(
	'10',
    'Nissan',
    'Versa',
    '63800.00',
    'Cinza',
    '29500',
    '2018'
);

SELECT * FROM tb_proprietario;
INSERT INTO tb_proprietario VALUES(
	'1',
    'Sandra',
    '9',
    '36'	
);

INSERT INTO tb_proprietario VALUES(
	'2', 
    'Francisco',
    '6',
    '62'
);

INSERT INTO tb_proprietario VALUES(
	'3',
    'Rubens',
    '3',
    '82'
);

INSERT INTO tb_proprietario VALUES(
	'4',
    'Jefther',
    '8',
    '28'
);

INSERT INTO tb_proprietario VALUES(
	'5',
    'Fagner',
    '4',
    '38'
);

-- Atualizando os valores de uma tabela. 
UPDATE tb_carros SET valor = 33800.00 WHERE id = 1; 

-- Deletando um Registro da tabela ( Lembrando que não pode deletar dados que estejam atrelado a outra tabela)
DELETE FROM tb_carros WHERE id = 5;