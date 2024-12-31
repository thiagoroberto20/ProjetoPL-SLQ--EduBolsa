CREATE OR REPLACE TRIGGER TRG_AUDITORIA_ALUNO
AFTER INSERT OR UPDATE OR DELETE ON Aluno
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO Auditoria (TABELA_ALTERADA, OPERACAO, DADOS_NOVOS)
        VALUES (
            'Aluno',
            'INSERT',
            TO_CLOB('ID_ALUNO: ' || :NEW.ID_ALUNO || ', NOME: ' || :NEW.NOME || 
                    ', CPF: ' || :NEW.CPF || ', DATA_NASCIMENTO: ' || TO_CHAR(:NEW.DATA_NASCIMENTO, 'YYYY-MM-DD') || 
                    ', SEXO: ' || :NEW.SEXO || ', RENDA_FAMILIAR: ' || :NEW.RENDA_FAMILIAR)
        );

    ELSIF UPDATING THEN
        INSERT INTO Auditoria (TABELA_ALTERADA, OPERACAO, DADOS_ANTIGOS, DADOS_NOVOS)
        VALUES (
            'Aluno',
            'UPDATE',
            TO_CLOB('ID_ALUNO: ' || :OLD.ID_ALUNO || ', NOME: ' || :OLD.NOME || 
                    ', CPF: ' || :OLD.CPF || ', DATA_NASCIMENTO: ' || TO_CHAR(:OLD.DATA_NASCIMENTO, 'YYYY-MM-DD') || 
                    ', SEXO: ' || :OLD.SEXO || ', RENDA_FAMILIAR: ' || :OLD.RENDA_FAMILIAR),
            TO_CLOB('ID_ALUNO: ' || :NEW.ID_ALUNO || ', NOME: ' || :NEW.NOME || 
                    ', CPF: ' || :NEW.CPF || ', DATA_NASCIMENTO: ' || TO_CHAR(:NEW.DATA_NASCIMENTO, 'YYYY-MM-DD') || 
                    ', SEXO: ' || :NEW.SEXO || ', RENDA_FAMILIAR: ' || :NEW.RENDA_FAMILIAR)
        );

    ELSIF DELETING THEN
        INSERT INTO Auditoria (TABELA_ALTERADA, OPERACAO, DADOS_ANTIGOS)
        VALUES (
            'Aluno',
            'DELETE',
            TO_CLOB('ID_ALUNO: ' || :OLD.ID_ALUNO || ', NOME: ' || :OLD.NOME || 
                    ', CPF: ' || :OLD.CPF || ', DATA_NASCIMENTO: ' || TO_CHAR(:OLD.DATA_NASCIMENTO, 'YYYY-MM-DD') || 
                    ', SEXO: ' || :OLD.SEXO || ', RENDA_FAMILIAR: ' || :OLD.RENDA_FAMILIAR)
        );
    END IF;
END;
