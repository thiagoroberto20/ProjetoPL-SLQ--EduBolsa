-- Trigger para a Tabela Bolsa


CREATE OR REPLACE TRIGGER TRG_AUDITORIA_BOLSA
AFTER INSERT OR UPDATE OR DELETE ON Bolsa
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO Auditoria (TABELA_ALTERADA, OPERACAO, DADOS_NOVOS)
        VALUES (
            'Bolsa',
            'INSERT',
            TO_CLOB('ID_BOLSA: ' || :NEW.ID_BOLSA || ', TIPO: ' || :NEW.TIPO || 
                    ', VALOR: ' || :NEW.VALOR || ', STATUS: ' || :NEW.STATUS || 
                    ', ID_CURSO: ' || :NEW.ID_CURSO || ', ID_ALUNO: ' || :NEW.ID_ALUNO)
        );

    ELSIF UPDATING THEN
        INSERT INTO Auditoria (TABELA_ALTERADA, OPERACAO, DADOS_ANTIGOS, DADOS_NOVOS)
        VALUES (
            'Bolsa',
            'UPDATE',
            TO_CLOB('ID_BOLSA: ' || :OLD.ID_BOLSA || ', TIPO: ' || :OLD.TIPO || 
                    ', VALOR: ' || :OLD.VALOR || ', STATUS: ' || :OLD.STATUS || 
                    ', ID_CURSO: ' || :OLD.ID_CURSO || ', ID_ALUNO: ' || :OLD.ID_ALUNO),
            TO_CLOB('ID_BOLSA: ' || :NEW.ID_BOLSA || ', TIPO: ' || :NEW.TIPO || 
                    ', VALOR: ' || :NEW.VALOR || ', STATUS: ' || :NEW.STATUS || 
                    ', ID_CURSO: ' || :NEW.ID_CURSO || ', ID_ALUNO: ' || :NEW.ID_ALUNO)
        );

    ELSIF DELETING THEN
        INSERT INTO Auditoria (TABELA_ALTERADA, OPERACAO, DADOS_ANTIGOS)
        VALUES (
            'Bolsa',
            'DELETE',
            TO_CLOB('ID_BOLSA: ' || :OLD.ID_BOLSA || ', TIPO: ' || :OLD.TIPO || 
                    ', VALOR: ' || :OLD.VALOR || ', STATUS: ' || :OLD.STATUS || 
                    ', ID_CURSO: ' || :OLD.ID_CURSO || ', ID_ALUNO: ' || :OLD.ID_ALUNO)
        );
    END IF;
END;
