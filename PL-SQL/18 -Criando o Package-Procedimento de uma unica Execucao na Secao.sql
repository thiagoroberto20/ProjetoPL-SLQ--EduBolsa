CREATE OR REPLACE PACKAGE EDUBOLSA.PKG_ALUNOS AS
    -- Procedimento para inserir um novo aluno
    PROCEDURE PRC_INSERE_ALUNO(
        p_nome            IN VARCHAR2,  -- Nome do aluno
        p_cpf             IN VARCHAR2,  -- CPF do aluno
        p_data_nascimento IN DATE,      -- Data de nascimento do aluno
        p_sexo            IN CHAR,      -- Sexo do aluno ('M' ou 'F')
        p_renda_familiar  IN NUMBER     -- Renda familiar do aluno
    );

    PROCEDURE PRC_AUMENTA_RENDA_ALUNO(
	  	p_id_aluno IN NUMBER,
	  	p_percentual IN NUMBER
    );
    
    FUNCTION FNC_CONSULTA_RENDA_ALUNO(
    p_id_aluno IN NUMBER
    ) RETURN NUMBER;
END PKG_ALUNOS;

	

-- Criando o Package Body: Procedimento de uma Única Execução na Seção

CREATE OR REPLACE PACKAGE BODY EDUBOLSA.PKG_ALUNOS IS

  -- Procedimento para inserir um novo aluno
  PROCEDURE PRC_INSERE_ALUNO(
    p_nome            IN VARCHAR2,
    p_cpf             IN VARCHAR2,
    p_data_nascimento IN DATE,
    p_sexo            IN CHAR,
    p_renda_familiar  IN NUMBER
  ) IS 
  BEGIN
    -- Verifica se a renda familiar está abaixo de um valor mínimo permitido
    IF p_renda_familiar < 1200 THEN
      RAISE_APPLICATION_ERROR(-20002, 'Renda familiar não pode ser inferior a R$ 1.200,00!');
    END IF;

    -- Insere o novo aluno na tabela ALUNO
    INSERT INTO EDUBOLSA.ALUNO (
      ID_ALUNO,
      NOME,
      CPF,
      DATA_NASCIMENTO,
      SEXO,
      RENDA_FAMILIAR
    ) VALUES (
      EDUBOLSA.SEQ_ALUNO.NEXTVAL, -- Gera um novo ID usando a sequência
      p_nome,
      p_cpf,
      p_data_nascimento,
      p_sexo,
      p_renda_familiar
    );

  EXCEPTION
    WHEN OTHERS THEN
      -- Lança uma exceção em caso de erro
      RAISE_APPLICATION_ERROR(-20001, 'Erro Oracle: ' || SQLCODE || SQLERRM);
  END PRC_INSERE_ALUNO;

  -- Procedimento para aumentar a renda familiar de um aluno
  PROCEDURE PRC_AUMENTA_RENDA_ALUNO(
    p_id_aluno   IN NUMBER,
    p_percentual IN NUMBER
  ) IS
  BEGIN
    -- Atualiza a renda familiar do aluno com o percentual informado
    UPDATE EDUBOLSA.ALUNO
    SET RENDA_FAMILIAR = RENDA_FAMILIAR * (1 + p_percentual / 100)
    WHERE ID_ALUNO = p_id_aluno;

  EXCEPTION
    WHEN OTHERS THEN
      -- Lança uma exceção em caso de erro
      RAISE_APPLICATION_ERROR(-20001, 'Erro Oracle: ' || SQLCODE || SQLERRM);
  END PRC_AUMENTA_RENDA_ALUNO;

  -- Função para consultar a renda familiar de um aluno
  FUNCTION FNC_CONSULTA_RENDA_ALUNO(
    p_id_aluno IN NUMBER
  ) RETURN NUMBER IS
    v_renda EDUBOLSA.ALUNO.RENDA_FAMILIAR%TYPE;
  BEGIN
    -- Consulta a renda familiar do aluno pelo ID
    SELECT RENDA_FAMILIAR
    INTO v_renda
    FROM EDUBOLSA.ALUNO
    WHERE ID_ALUNO = p_id_aluno;

    -- Retorna o valor da renda
    RETURN v_renda;

  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      -- Lança uma exceção se o aluno não for encontrado
      RAISE_APPLICATION_ERROR(-20001, 'Aluno inexistente');
    WHEN OTHERS THEN
      -- Lança uma exceção genérica em caso de erro
      RAISE_APPLICATION_ERROR(-20002, 'Erro Oracle: ' || SQLCODE || SQLERRM);
  END FNC_CONSULTA_RENDA_ALUNO;
END PKG_ALUNOS;
/

  
  

/*Explicação Linha por Linha
CREATE OR REPLACE PACKAGE BODY: Cria ou substitui o corpo do pacote PKG_ALUNOS no schema EDUBOLSA.

PROCEDURE PRC_INSERE_ALUNO: Procedimento que insere um novo registro na tabela ALUNO.
 - Verifica se a renda é inferior a um limite mínimo, lançando uma exceção em caso positivo.

PROCEDURE PRC_AUMENTA_RENDA_ALUNO: Procedimento que atualiza a renda familiar de um aluno, aumentando-a por um percentual.

FUNCTION FNC_CONSULTA_RENDA_ALUNO: Função que retorna a renda familiar de um aluno com base no ID_ALUNO.

Bloco inicial:
 - Exibe uma mensagem indicando que o pacote foi carregado com sucesso, útil para depuração.*/