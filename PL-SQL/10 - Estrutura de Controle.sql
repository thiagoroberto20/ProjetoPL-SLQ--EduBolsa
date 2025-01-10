/*1. Estrutura de Controle com IF
Atualiza a renda familiar de um aluno caso seja menor que um valor mínimo.*/
DECLARE
    v_novo_valor NUMBER(10,2) := 1500; -- Define o valor mínimo de renda.
    v_renda_atual NUMBER(10,2);        -- Variável para armazenar a renda atual do aluno.
BEGIN
    -- Armazena a renda atual do aluno com ID 1 na variável v_renda_atual.
    SELECT RENDA_FAMILIAR 
    INTO v_renda_atual
    FROM EDUBOLSA.ALUNO
    WHERE ID_ALUNO = 1;

    -- Verifica se a renda atual é menor que o valor mínimo definido.
    IF v_renda_atual < v_novo_valor THEN
        -- Atualiza a renda do aluno para o valor mínimo.
        UPDATE EDUBOLSA.ALUNO
        SET RENDA_FAMILIAR = v_novo_valor
        WHERE ID_ALUNO = 1;

        -- Exibe mensagem indicando que a renda foi atualizada.
        DBMS_OUTPUT.PUT_LINE('Renda atualizada para o valor mínimo de ' || v_novo_valor);
    ELSE
        -- Caso a renda já esteja acima do valor mínimo, exibe mensagem.
        DBMS_OUTPUT.PUT_LINE('Renda familiar já está acima do valor mínimo.');
    END IF;
END;
/


/*2. Estrutura de Controle com CASE
Determina o status de bolsa do aluno com base na renda familiar.*/