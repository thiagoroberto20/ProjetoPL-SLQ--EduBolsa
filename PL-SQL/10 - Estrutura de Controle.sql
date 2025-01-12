/*1. Estrutura de Controle com IF
Atualiza a renda familiar de um aluno caso seja menor que um valor mínimo.*/
DECLARE
    v_novo_valor NUMBER(10,2) := &v_novo_valor; -- Define o valor mínimo de renda.
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
/*Explicação
Declaração de Variáveis:

v_novo_valor: Define o valor mínimo que será usado como referência.
v_renda_atual: Variável para armazenar o valor retornado pela consulta.
SELECT ... INTO:

A consulta SQL é executada e o valor da renda do aluno é armazenado na variável v_renda_atual.
Condicional IF:

A comparação é feita com a variável v_renda_atual e não diretamente com a consulta SQL.
UPDATE:

Se a condição for verdadeira (renda menor que o valor mínimo), o campo RENDA_FAMILIAR é atualizado.
DBMS_OUTPUT.PUT_LINE:

Fornece feedback ao usuário sobre o que ocorreu no bloco.*/



/*2. Estrutura de Controle com CASE
Determina o status de bolsa do aluno com base na renda familiar.*/
DECLARE
    v_renda NUMBER(10,2);        -- Variável para armazenar a renda familiar.
    v_status VARCHAR2(20);       -- Variável para armazenar o status da bolsa.
BEGIN
    -- Consulta a renda familiar do aluno com ID 1.
    SELECT RENDA_FAMILIAR INTO v_renda 
    FROM ALUNO 
    WHERE ID_ALUNO = 1;

    -- Determina o status da bolsa com base na renda.
    v_status := CASE 
                   WHEN v_renda <= 1500 THEN 'Integral'   -- Bolsa integral para renda <= 1500.
                   WHEN v_renda > 1500 AND v_renda <= 2500 THEN 'Parcial' -- Bolsa parcial entre 1500 e 2500.
                   ELSE 'Sem Bolsa'                      -- Sem bolsa para renda acima de 2500.
               END;

    -- Exibe o status da bolsa.
    DBMS_OUTPUT.PUT_LINE('Status do aluno: ' || v_status);
END;
/
/*Explicação:

DECLARE: Declara variáveis para armazenar renda e status.
SELECT ... INTO: Consulta a renda do aluno e armazena na variável v_renda.
CASE: Avalia condições e atribui valores diferentes para v_status com base na renda.
DBMS_OUTPUT.PUT_LINE: Imprime o status da bolsa.*/




/*3. Estrutura de Controle com LOOP Básico
Exemplo: Iterar sobre todos os alunos e exibir seus nomes.*/
DECLARE
    CURSOR c_alunos IS SELECT NOME FROM ALUNO;  -- Define um cursor para consultar os nomes dos alunos.
    v_nome ALUNO.NOME%TYPE;                    -- Variável para armazenar o nome de cada aluno.
BEGIN
    OPEN c_alunos;                             -- Abre o cursor para iniciar a consulta.
    LOOP
        FETCH c_alunos INTO v_nome;            -- Busca o próximo registro e armazena em `v_nome`.
        EXIT WHEN c_alunos%NOTFOUND;           -- Sai do loop quando não houver mais registros.
        
        DBMS_OUTPUT.PUT_LINE('Aluno: ' || v_nome); -- Exibe o nome do aluno.
    END LOOP;
    CLOSE c_alunos;                            -- Fecha o cursor após concluir o loop.
END;
/
/*Explicação:

CURSOR: Declara uma consulta que será percorrida.
OPEN e FETCH: Abre o cursor e recupera os registros, um por vez.
EXIT WHEN: Interrompe o loop quando não houver mais registros.
CLOSE: Libera o recurso após a execução.*/



/*4. Estrutura de Controle com FOR LOOP
Atualiza o status de bolsa para todos os alunos.*/
BEGIN
    -- Itera sobre todos os alunos e suas respectivas rendas familiares.
    FOR r IN (SELECT ID_ALUNO, RENDA_FAMILIAR FROM ALUNO) LOOP
        IF r.RENDA_FAMILIAR <= 1500 THEN
            DBMS_OUTPUT.PUT_LINE('Aluno ' || r.ID_ALUNO || ': Elegível para bolsa integral.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Aluno ' || r.ID_ALUNO || ': Não elegível para bolsa integral.');
        END IF;
    END LOOP;
END;
/
/*Explicação:

FOR ... IN: Itera automaticamente pelos resultados da consulta.
r.ID_ALUNO e r.RENDA_FAMILIAR: Referenciam os valores retornados da consulta.
DBMS_OUTPUT.PUT_LINE: Exibe o status de cada aluno.*/



/*5. Estrutura de Controle com WHILE LOOP
Acumula a renda dos alunos até atingir um limite.*/
DECLARE
    v_renda_total NUMBER(10,2) := 0;  -- Variável para armazenar a soma das rendas.
    v_limite NUMBER(10,2) := 10000;   -- Limite máximo para a soma.
    CURSOR c_alunos IS SELECT RENDA_FAMILIAR FROM ALUNO;  -- Cursor para buscar rendas.
    v_renda ALUNO.RENDA_FAMILIAR%TYPE;                   -- Variável para cada renda.
BEGIN
    OPEN c_alunos;                                        -- Abre o cursor.
    FETCH c_alunos INTO v_renda;                         -- Busca o primeiro registro.
    WHILE v_renda_total < v_limite LOOP                  -- Continua até atingir o limite.
        v_renda_total := v_renda_total + v_renda;        -- Soma a renda.
        DBMS_OUTPUT.PUT_LINE('Renda acumulada: ' || v_renda_total);

        FETCH c_alunos INTO v_renda;                     -- Busca o próximo registro.
        EXIT WHEN c_alunos%NOTFOUND;                     -- Sai do loop se não houver mais registros.
    END LOOP;
    CLOSE c_alunos;                                      -- Fecha o cursor.
END;
/
/**Explicação:

WHILE: Executa enquanto a condição for verdadeira.
FETCH: Recupera registros do cursor.
v_renda_total: Acumula os valores./



/*6. Controlando LOOPs Aninhados
Exibe alunos e os cursos associados.*/
BEGIN
	FOR r_aluno IN (SELECT ID_ALUNO, NOME FROM EDUBOLSA.ALUNO) LOOP
		DBMS_OUTPUT.PUT_LINE('Aluno: ' || r_aluno.NOME);
        
        FOR r_curso IN (SELECT NOME FROM EDUBOLSA.CURSO WHERE ID_CURSO = r_aluno.ID_ALUNO)LOOP
	        DBMS_OUTPUT.PUT_LINE('   Curso: ' || r_curso.NOME);	        
	    END LOOP; 
	
	END LOOP;
END;
/*Explicação:

LOOP Externo (r_aluno): Percorre os alunos.
LOOP Interno (r_curso): Para cada aluno, lista os cursos relacionados.
DBMS_OUTPUT.PUT_LINE: Exibe as informações em formato hierárquico.*/











