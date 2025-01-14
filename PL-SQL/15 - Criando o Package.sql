/*1. Criando o Package Specification*/
CREATE OR REPLACE PACKAGE EDUBOLSA.PKG_GESTAO_ALUNO AS
    -- Declaração de um procedimento público
    PROCEDURE Add_Aluno(
        p_nome IN VARCHAR2,
        p_cpf IN VARCHAR2,
        p_data_nascimento IN DATE,
        p_sexo IN CHAR,
        p_renda_familiar IN NUMBER
    );

    -- Declaração de uma função pública
    FUNCTION Get_Aluno_Renda(
        p_id_aluno IN NUMBER
    ) RETURN NUMBER;
END PKG_GESTAO_ALUNO;
/

/*Explicação Linha por Linha
CREATE OR REPLACE PACKAGE: Cria ou substitui um pacote chamado PKG_GESTAO_ALUNO.
AS: Inicia a especificação do pacote.
Declaração de procedimento público Add_Aluno que adiciona um aluno.
Declaração de função pública Get_Aluno_Renda que retorna a renda de um aluno pelo ID_ALUNO.*/



/*2. Criando o Package Body*/
CREATE OR REPLACE PACKAGE BODY EDUBOLSA.PKG_GESTAO_ALUNO AS
    -- Implementação do procedimento Add_Aluno
    PROCEDURE Add_Aluno(
        p_nome IN VARCHAR2,
        p_cpf IN VARCHAR2,
        p_data_nascimento IN DATE,
        p_sexo IN CHAR,
        p_renda_familiar IN NUMBER
    ) IS
    BEGIN
        -- Insere um novo registro na tabela ALUNO
        INSERT INTO EDUBOLSA.ALUNO (ID_ALUNO, NOME, CPF, DATA_NASCIMENTO, SEXO, RENDA_FAMILIAR)
        VALUES (EDUBOLSA.SEQ_ALUNO.NEXTVAL, p_nome, p_cpf, p_data_nascimento, p_sexo, p_renda_familiar);
    END Add_Aluno;

    -- Implementação da função Get_Aluno_Renda
    FUNCTION Get_Aluno_Renda(
        p_id_aluno IN NUMBER
    ) RETURN NUMBER IS
        v_renda NUMBER;
    BEGIN
        -- Recupera a renda familiar do aluno pelo ID
        SELECT RENDA_FAMILIAR
        INTO v_renda
        FROM EDUBOLSA.ALUNO
        WHERE ID_ALUNO = p_id_aluno;

        RETURN v_renda;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN NULL; -- Retorna NULL se o ID não for encontrado
    END Get_Aluno_Renda;
END PKG_GESTAO_ALUNO;
/

/*Explicação Linha por Linha
CREATE OR REPLACE PACKAGE BODY: Cria ou substitui o corpo do pacote.
Implementação do procedimento Add_Aluno que insere um novo aluno.
Implementação da função Get_Aluno_Renda que retorna a renda familiar de um aluno.
EXCEPTION: Trata erros como NO_DATA_FOUND, retornando NULL caso o aluno não seja encontrado.*/