-- TCL -> TRASACT CONTROL LANGUAGE

-- ACID -> 



SELECT @@autocommit;  -- Verifica se o salvar altomatico estar ativado ou não. 
SET @@autocommit = OFF; -- Desativa o 'Salvar automaticamente'.
-- SET @@autocommit = ON; -- Ativa o 'Salvar automaticamente'.
SELECT * FROM tb_proprietario;
-- ROLLBACK SIMPLES
-- INSERT
INSERT INTO tb_proprietario VALUES(
	'6',
    'Sandro',
    '4',
    '37'
);
ROLLBACK;

DELETE FROM tb_proprietario
WHERE id = 6; 
ROLLBACK;
SELECT * FROM tb_proprietario;

-- UPDATE
UPDATE tb_proprietario
SET nome = 'Sandro'
WHERE id = '2';
ROLLBACK;
SELECT * FROM tb_proprietario;

START TRANSACTION;
	INSERT INTO tb_proprietario VALUES(
		'7',
        'Carol',
        '3',
		'33'
    );
COMMIT;

SELECT * FROM tb_proprietario;