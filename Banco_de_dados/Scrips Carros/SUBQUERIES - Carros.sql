USE bd_carro;

SELECT AVG(valor) FROM tb_carros; -- 47244.222222

SELECT * FROM tb_carros
WHERE valor > 47244.22;
-- Mescla das consultas anteriores. 
SELECT * FROM tb_carros
WHERE valor > (SELECT AVG(valor) FROM tb_carros);

SELECT * FROM tb_carros;
SELECT * FROM tb_proprietario
WHERE id_carro = 9;

SELECT * FROM tb_carros
WHERE marca = 'Chevrolet';

SELECT nome FROM tb_proprietario
WHERE id_carro in (SELECT id FROM tb_carros WHERE marca = 'Chevrolet');




