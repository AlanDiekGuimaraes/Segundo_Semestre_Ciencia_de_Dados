USE bd_clinica_vet;

SELECT * FROM tb_clientes;
SELECT * FROM tb_veterinarios;
SELECT * FROM tb_pets;
SELECT * FROM tb_atendimento;


-- Inserindo dados na tabela Clientes.
INSERT INTO tb_clientes VALUES(
	'1', 'Rubens', 'Rua: Contantino Guimarães, 154', '074-9.9888-0099'
);
INSERT INTO tb_clientes VALUES(
	'2', 'Gorete', 'Rua: Maria Rita, 155', '074-9.9777-9876'
);
INSERT INTO tb_clientes VALUES(
	'3', 
    'Maria José', 
    'Avenida: Tereza Campanela', 
    '074-9.9876-5432'
);

-- Inserindo dados na tabela Veterinarios.
INSERT INTO tb_veterinarios VALUES(
	'1', 'Vinicius de Jesus', 'Acupuntura veterinátbl_veterinariosria', '11-9.3216-5498'
);
UPDATE tb_veterinarios SET especialidade = 'Acupuntura veterinária' WHERE id_veterinario = 1;

INSERT INTO tb_veterinarios VALUES(
	'2', 'Igor Amaral', 'Cirurgião', '11-9.3216-6549'
);

INSERT INTO tb_veterinarios VALUES(
	'3', 'Aline Santos', 'Clínica Geral', '11-9.9519-7535'
);

INSERT INTO tb_pets VALUES(
	'1', 'Tuc-Tuc', 'Cachoro', 'Pinscher', '2024-05-06', '3'
);

INSERT INTO tb_pets VALUES(
	'2', 'Mel', 'Gato', 'Siamês', '2022/08/03', '1'
);

INSERT INTO tb_pets VALUES(
	'3', 'Léo', 'Lagarto', 'Iguana-verde', '2021-12-28', '2'
);

INSERT INTO tb_atendimento VALUES(
	'5', '3', '1', '2024-09-21', 'Banho e tosa'
);

INSERT INTO tb_atendimento VALUES(
	'6', '1', '3', '2024-06-30', 'Acupuntura Pet para relaxamento'
);

INSERT INTO tb_atendimento VALUES(
	'3', '2', '2', '2024-06-01', 'Cirurgia na pata'
);