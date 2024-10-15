USE bd_clinica_vet;

-- BANCO DE DADOS VETERINARIA
-- 1. INNER JOIN
-- Exercício 1: Liste os nomes dos clientes e os nomes dos pets que pertencem a eles.
SELECT C.nome AS 'Nome Cliente', P.nome AS 'Nome Pet' FROM tb_clientes AS C
INNER JOIN tb_pets AS P ON C.id_cliente = P.id_cliente;

-- Exercício 2: Liste os veterinários e os atendimentos realizados
SELECT V.nome AS 'Nome Veterinario', P.nome AS 'Nome Pet', P.tipo AS 'Tipo', P.raca AS 'Raça' FROM tb_veterinarios AS V
INNER JOIN tb_atendimento AS A ON V.id_veterinario = A.id_veterinario
INNER JOIN tb_pets AS P ON A.id_pet = P.id_pet;

-- Exercício 3: Liste todos os pets e os detalhes de seus atendimentos (incluindo o nome do veterinário).
SELECT P.nome AS 'Nome Pet', A.descricao AS 'Detalhes', V.nome AS 'Nome Veterinario' FROM tb_pets AS P
INNER JOIN tb_atendimento AS A ON P.id_pet = A.id_pet
INNER JOIN tb_veterinarios AS V ON A.id_veterinario = V.id_veterinario;

-- Exercício 4: Liste o nome dos pets, seus donos e o veterinário responsável por seus últimos atendimentos
SELECT P.nome AS 'Nome Pet', C.nome AS 'Nome Cliente', V.nome AS 'Nome Veterinario', A.data_atendimento AS 'Ultimo Atendimento' FROM tb_pets AS P
INNER JOIN tb_clientes AS C ON P.id_cliente = C.id_cliente
INNER JOIN tb_atendimento AS A ON P.id_pet = A.id_pet
INNER JOIN tb_veterinarios AS V ON V.id_veterinario = A.id_veterinario
ORDER BY data_atendimento DESC;

-- 2. RIGHT JOIN / LEFT JOIN
-- Exercício 1: Liste todos os veterinários e os atendimentos que realizaram, incluindo aqueles que ainda não realizaram nenhum atendimento.
SELECT V.nome AS 'Veterinario', A.data_atendimento AS 'Data Atendimento', P.nome AS 'Pet' FROM tb_atendimento AS A
RIGHT JOIN tb_veterinarios AS V ON V.id_veterinario = A.id_veterinario
RIGHT JOIN tb_pets AS P ON P.id_pet = A.id_pet;

-- Exercício 3: Liste todos os veterinários e os atendimentos que realizaram, incluindo aqueles que ainda não realizaram nenhum atendimento.
SELECT V.nome AS 'Veterinario', A.data_atendimento AS 'Data Atendimento', P.nome AS 'Pet' FROM tb_veterinarios AS V
LEFT JOIN tb_atendimento AS A ON V.id_veterinario = A.id_veterinario
LEFT JOIN tb_pets AS P ON P.id_pet = A.id_pet;

-- Exercício 2: Liste todos os clientes e os pets que possuem, incluindo clientes que ainda não têm pets cadastrados.
SELECT * FROM tb_clientes AS C
LEFT JOIN tb_pets AS P ON C.id_cliente = P.id_cliente;

-- 3. UNNION OU OUTER JOIN (FULL OUTER JOIN)
-- Exercício 1: Liste todos os pets e seus clientes, incluindo pets que não têm clientes associados e clientes que não têm pets cadastrados.
SELECT * FROM tb_clientes AS C
LEFT JOIN tb_pets AS P ON P.id_cliente = C.id_cliente
UNION
SELECT * FROM tb_clientes AS C
RIGHT JOIN tb_pets AS P ON P.id_cliente = C.id_cliente;

-- Exercício 2: Liste todos os atendimentos e os pets, incluindo atendimentos que não têm pets associados e pets que não têm atendimentos registrados.
SELECT * FROM tb_atendimento AS A
LEFT JOIN tb_pets AS P ON P.id_pet = A.id_pet
UNION
SELECT * FROM tb_atendimento AS A
RIGHT JOIN tb_pets AS P ON P.id_pet = A.id_pet;


-- Exercício 3: Liste todos os veterinários e atendimentos, incluindo veterinários que ainda não realizaram atendimentos 
-- e atendimentos que não têm veterinários associados.
SELECT * FROM tb_veterinarios AS V
LEFT JOIN tb_atendimento AS A ON V.id_veterinario = A.id_veterinario
UNION
SELECT * FROM tb_veterinarios AS V
RIGHT JOIN tb_atendimento AS A ON V.id_veterinario = A.id_veterinario;

-- Exercício 4: Liste todos os pets e atendimentos realizados, incluindo pets que não foram atendidos e atendimentos sem pets associados.
SELECT * FROM tb_atendimento AS A
LEFT JOIN tb_pets AS P ON A.id_pet = P.id_pet
UNION
SELECT * FROM tb_atendimento AS A
RIGHT JOIN tb_pets AS P ON A.id_pet = P.id_pet;
