/*Triggers de Auditoria para Outras Tabelas
Abaixo estão os scripts das triggers de auditoria adaptados para as tabelas Curso e Bolsa.

Trigger para a Tabela Curso*/


CREATE OR REPLACE TRIGGER TRG_AUDITORIA_CURSO
AFTER INSERT OR UPDATE OR DELETE ON Curso
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO Auditoria (TABELA_ALTERADA, OPERACAO, DADOS_NOVOS)
        VALUES (
            'Curso',
            'INSERT',
            TO_CLOB('ID_CURSO: ' || :NEW.ID_CURSO || ', NOME: ' || :NEW.NOME || 
                    ', TURNO: ' || :NEW.TURNO || ', CARGA_HORARIA: ' || :NEW.CARGA_HORARIA || 
                    ', VALOR_MENSALIDADE: ' || :NEW.VALOR_MENSALIDADE || ', ID_INSTITUICAO: ' || :NEW.ID_INSTITUICAO)
        );

    ELSIF UPDATING THEN
        INSERT INTO Auditoria (TABELA_ALTERADA, OPERACAO, DADOS_ANTIGOS, DADOS_NOVOS)
        VALUES (
            'Curso',
            'UPDATE',
            TO_CLOB('ID_CURSO: ' || :OLD.ID_CURSO || ', NOME: ' || :OLD.NOME || 
                    ', TURNO: ' || :OLD.TURNO || ', CARGA_HORARIA: ' || :OLD.CARGA_HORARIA || 
                    ', VALOR_MENSALIDADE: ' || :OLD.VALOR_MENSALIDADE || ', ID_INSTITUICAO: ' || :OLD.ID_INSTITUICAO),
            TO_CLOB('ID_CURSO: ' || :NEW.ID_CURSO || ', NOME: ' || :NEW.NOME || 
                    ', TURNO: ' || :NEW.TURNO || ', CARGA_HORARIA: ' || :NEW.CARGA_HORARIA || 
                    ', VALOR_MENSALIDADE: ' || :NEW.VALOR_MENSALIDADE || ', ID_INSTITUICAO: ' || :NEW.ID_INSTITUICAO)
        );

    ELSIF DELETING THEN
        INSERT INTO Auditoria (TABELA_ALTERADA, OPERACAO, DADOS_ANTIGOS)
        VALUES (
            'Curso',
            'DELETE',
            TO_CLOB('ID_CURSO: ' || :OLD.ID_CURSO || ', NOME: ' || :OLD.NOME || 
                    ', TURNO: ' || :OLD.TURNO || ', CARGA_HORARIA: ' || :OLD.CARGA_HORARIA || 
                    ', VALOR_MENSALIDADE: ' || :OLD.VALOR_MENSALIDADE || ', ID_INSTITUICAO: ' || :OLD.ID_INSTITUICAO)
        );
    END IF;
END;
