USE ClinicaVetBD;

SELECT * FROM tbl_clientes;
SELECT * FROM tbl_veterinarios;
SELECT * FROM tbl_pets;
SELECT * FROM tbl_atendimento;

SELECT nome, tipo, raca, data_nascimento FROM tbl_pets WHERE data_nascimento = (SELECT MIN(data_nascimento) FROM tbl_pets);

SELECT nome, tipo, raca, data_nascimento FROM tbl_pets WHERE data_nascimento = (SELECT MAX(data_nascimento) FROM tbl_pets);

SELECT COUNT(id_pet) AS quantidade_de_pets FROM tbl_pets;

SELECT * FROM tbl_pets ORDER BY nome ASC;

SELECT * FROM tbl_pets ORDER BY nome DESC;

SELECT * FROM tbl_veterinarios ORDER BY nome ASC;

SELECT * FROM tbl_veterinarios ORDER BY nome DESC;

SELECT MIN(data_atendimento) AS atendimento_mais_antigo FROM tbl_atendimento;

SELECT MAX(data_atendimento) AS atendimento_mais_recente FROM tbl_atendimento;