/*1. Executando a Procedure com Parâmetro do Tipo IN
A procedure Add_Aluno insere um aluno na tabela Aluno. Para executá-la:*/

CREATE OR REPLACE PROCEDURE Add_Aluno(
    p_nome IN VARCHAR2,                -- Nome do aluno
    p_cpf IN VARCHAR2,                 -- CPF do aluno
    p_data_nascimento IN DATE,         -- Data de nascimento do aluno
    p_sexo IN CHAR,                    -- Sexo do aluno ('M' ou 'F')
    p_renda_familiar IN NUMBER         -- Renda familiar do aluno
) AS
BEGIN
    -- Validação para garantir que o sexo seja 'M' ou 'F'
    IF p_sexo NOT IN ('M', 'F') THEN
        RAISE_APPLICATION_ERROR(-20001, 'Sexo inválido! Deve ser "M" ou "F".');
    END IF;

    -- Insere o aluno na tabela Aluno utilizando os parâmetros recebidos
    INSERT INTO Aluno (ID_ALUNO, NOME, CPF, DATA_NASCIMENTO, SEXO, RENDA_FAMILIAR)
    VALUES (SEQ_ALUNO.NEXTVAL, p_nome, p_cpf, p_data_nascimento, p_sexo, p_renda_familiar);
    
    -- Mensagem de sucesso (opcional)
    DBMS_OUTPUT.PUT_LINE('Aluno inserido com sucesso.');
END;
/

-- Criação de uma Procedure que atualiza o nome de um aluno e retorna o CPF antigo
-- A seguir, um exemplo de procedure que usa IN, OUT e IN OUT simultaneamente:
CREATE OR REPLACE PROCEDURE Update_Aluno(
    p_id IN NUMBER,         -- ID do aluno a ser atualizado (entrada)
    p_nome IN OUT VARCHAR2, -- Novo nome do aluno (entrada e saída)
    p_cpf OUT VARCHAR2      -- CPF atual do aluno (somente saída)
) AS
BEGIN
    -- Busca o CPF atual e atualiza o nome do aluno
    SELECT CPF
    INTO p_cpf
    FROM EDUBOLSA.Aluno
    WHERE ID_ALUNO = p_id;
    
    -- Atualiza o nome do aluno no banco de dados
    UPDATE EDUBOLSA.Aluno
    SET NOME = p_nome
    WHERE ID_ALUNO = p_id;
    
    -- Mensagem de confirmação
    DBMS_OUTPUT.PUT_LINE('Nome atualizado com sucesso.');
END;
/


CREATE OR REPLACE PROCEDURE Get_Instituicao(
	p_id IN NUMBER,
	p_nome OUT VARCHAR2,
	p_tipo OUT VARCHAR2
) AS

BEGIN
	
	SELECT NOME, TIPO
	INTO p_nome, p_tipo
	FROM EDUBOLSA.INSTITUICAO
	WHERE ID_INSTITUICAO = p_id;
	
	DBMS_OUTPUT.PUT_LINE('Instituição encontrada: ' || p_nome);
EXCEPTION

	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('Nenhuma Instituição encontrada para o ID informado.');
		
	
END;
/


-- Para recompilar uma procedure já existente:
-- Recompilar a procedure "Add_Aluno"
ALTER PROCEDURE EDUBOLSA.Add_Aluno COMPILE;


-- Para remover uma procedure, utilizamos o comando DROP PROCEDURE:
-- Remover a procedure "Add_Aluno"
DROP PROCEDURE  EDUBOLSA.Add_Aluno; 
