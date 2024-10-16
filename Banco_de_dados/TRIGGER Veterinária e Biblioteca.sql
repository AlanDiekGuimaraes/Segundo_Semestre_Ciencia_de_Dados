-- Clínica Veterinária Trigger

-- Exercício 1. Crie um trigger que, sempre que um novo pet for inserido na tabela, calcule automaticamente a idade do pet com base em sua data de nascimento e armazene esse valor na coluna idade.

CREATE DEFINER=`root`@`localhost` TRIGGER `tb_pets_BEFORE_INSERT` BEFORE INSERT ON `tb_pets` FOR EACH ROW BEGIN
	SET NEW.idade = TIMESTAMPDIFF(YEAR, NEW.data_nascimento, CURDATE());
END

-- Biblioteca Trigger
-- Exercício 1 E 5.
CREATE DEFINER=`root`@`localhost` TRIGGER `tb_autores_BEFORE_INSERT` BEFORE INSERT ON `tb_autores` FOR EACH ROW BEGIN
	-- Exercício 1. Criar uma trigger que impeça a inserção de autores com menos de 18 anos.
    IF (YEAR(CURDADE()) - YEAR(NEW.data_nascimento)) < 18 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'O autor deve ter pelo menor 18 anos!';
    END IF;
    
    -- Exercício 5. Criar uma trigger que impeça a inserção de autores com nomes duplicados.
    IF EXISTS (SELECT 1 FROM tb_autores WHERE nome = NEW.nome) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'O altor já está cadastrado!';
    END IF;
    
END

-- Exercício 2 E 3.

CREATE DEFINER=`root`@`localhost` TRIGGER `tb_emprestimos_BEFORE_INSERT` BEFORE INSERT ON `tb_emprestimos` FOR EACH ROW BEGIN
	DECLARE total_emprestimos INT;
    -- Exercício 2. Criar uma trigger que atualize automaticamente a data de devolução para 15 dias após a data de empréstimo.
	SET NEW.data_devolucao = DATE_ADD(NEW.data_emprestimo, INTERVAL 15 DAY);
    
    -- Exercício 3. Criar uma trigger que impeça que um membro faça mais de 3 empréstimos ao mesmo tempo.
    SELECT COUNT(id_membro) INTO total_emprestimos FROM tb_emprestimo 
    WHERE id_membro = NEW.id_membro;
    IF total_emprestimos >= 3 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'O membro não pode ter mais de 3 emprestimos!';
    END IF;
END

-- Exercício 4. Trigger de Atualização Automática da Data de Adesão

CREATE DEFINER=`root`@`localhost` TRIGGER `tb_membros_BEFORE_INSERT` BEFORE INSERT ON `tb_membros` FOR EACH ROW BEGIN
	SET NEW.data_adesao = CURDATE();
END



