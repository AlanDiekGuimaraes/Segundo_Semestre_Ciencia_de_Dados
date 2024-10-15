USE bd_carro;
-- Histórico de preço dos carros, cada vez que atualizar o valor do carro,
-- que o valor anterior seja armazenado na tabela historico. historico_precohistorico_preco

SELECT * FROM historico_preco;
SELECT * FROM tb_carros;
SELECT * FROM tb_proprietario;

UPDATE tb_carros SET valor = 63000 WHERE id = 10;

INSERT INTO tb_carros VALUES (
	'11', 'Fiat', 'Punto', '2550.25', 'Bege', '700', '2019'
);

INSERT INTO tb_proprietario (id, nome, id_carro, data_nascimento) VALUES ( 
	'9', 'Melissa', '1', '2024-01-18' 
);

-- DELETE FROM tb_proprietario WHERE id = 9;