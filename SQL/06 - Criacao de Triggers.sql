/*As triggers automatizam ações, como atribuição de valores padrão ou consistência entre tabelas.

Trigger para preenchimento automático de IDs*/

-- Trigger para gerar ID na tabela Instituicao
CREATE OR REPLACE TRIGGER TRG_INSTITUICAO_ID
BEFORE INSERT ON Instituicao
FOR EACH ROW
BEGIN
    SELECT SEQ_INSTITUICAO.NEXTVAL INTO :NEW.ID_INSTITUICAO FROM DUAL;
END;
/

-- Trigger para gerar ID na tabela Curso
CREATE OR REPLACE TRIGGER TRG_CURSO_ID
BEFORE INSERT ON Curso
FOR EACH ROW
BEGIN
    SELECT SEQ_CURSO.NEXTVAL INTO :NEW.ID_CURSO FROM DUAL;
END;
/

-- Trigger para gerar ID na tabela Aluno
CREATE OR REPLACE TRIGGER TRG_ALUNO_ID
BEFORE INSERT ON Aluno
FOR EACH ROW
BEGIN
    SELECT SEQ_ALUNO.NEXTVAL INTO :NEW.ID_ALUNO FROM DUAL;
END;
/

-- Trigger para gerar ID na tabela Bolsa
CREATE OR REPLACE TRIGGER TRG_BOLSA_ID
BEFORE INSERT ON Bolsa
FOR EACH ROW
BEGIN
    SELECT SEQ_BOLSA.NEXTVAL INTO :NEW.ID_BOLSA FROM DUAL;
END;
/

-- Trigger para gerar ID na tabela Selecao
CREATE OR REPLACE TRIGGER TRG_SELECAO_ID
BEFORE INSERT ON Selecao
FOR EACH ROW
BEGIN
    SELECT SEQ_SELECAO.NEXTVAL INTO :NEW.ID_SELECAO FROM DUAL;
END;
/

-- Trigger para gerar ID na tabela Desempenho
CREATE OR REPLACE TRIGGER TRG_DESEMPENHO_ID
BEFORE INSERT ON Desempenho
FOR EACH ROW
BEGIN
    SELECT SEQ_DESEMPENHO.NEXTVAL INTO :NEW.ID_DESEMPENHO FROM DUAL;
END;
/


/*Trigger para consistência de status de bolsa
Este trigger impede que uma bolsa seja atribuída a dois alunos diferentes.*/

CREATE OR REPLACE TRIGGER TRG_BOLSA_STATUS_CHECK
BEFORE UPDATE OR INSERT ON Bolsa
FOR EACH ROW
BEGIN
    IF :NEW.STATUS = 'Concedida' THEN
        SELECT COUNT(*) INTO v_count
        FROM Bolsa
        WHERE ID_BOLSA = :NEW.ID_BOLSA AND STATUS = 'Concedida';
        
        IF v_count > 0 THEN
            RAISE_APPLICATION_ERROR(-20001, 'A bolsa já foi concedida a outro aluno.');
        END IF;
    END IF;
END;
/