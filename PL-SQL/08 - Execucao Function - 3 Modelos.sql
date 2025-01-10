-- Funções podem ser chamadas diretamente em um comando SELECT.
SELECT CALCULAR_IDADE(TO_DATE('1986-05-23','YYYY-MM-DD')) FROM DUAL;

-- Execução pelo Bloco PL/SQL
DECLARE
    v_idade NUMBER;  -- Variável para armazenar o retorno da função
BEGIN
    -- Chama a função com uma data de nascimento
    v_idade := Calcular_Idade(TO_DATE('2000-05-15', 'YYYY-MM-DD'));

    -- Exibe a idade calculada
    DBMS_OUTPUT.PUT_LINE('Idade do Aluno: ' || v_idade || ' anos');
END;
/


-- Funções podem ser chamadas diretamente em um comando SELECT.
SELECT BUSCAR_NOME_INSTITUICAO(3) FROM DUAL;

-- Execução pelo Bloco PL/SQL
DECLARE
    v_nome_instituicao VARCHAR2(100);  -- Variável para armazenar o retorno da função
BEGIN
    -- Chama a função com o ID de uma instituição
    v_nome_instituicao := Buscar_Nome_Instituicao(2);

    -- Exibe o nome da instituição
    DBMS_OUTPUT.PUT_LINE('Nome da Instituição: ' || v_nome_instituicao);
END;
/



-- Funções podem ser chamadas diretamente em um comando SELECT.
-- Execução pelo Bloco PL/SQL
DECLARE
    v_status VARCHAR2(20);  -- Variável para armazenar o retorno da função
BEGIN
    -- Chama a função com a renda familiar de um aluno
    v_status := Verificar_Elegibilidade(2200);

    -- Exibe o status de elegibilidade
    DBMS_OUTPUT.PUT_LINE('Status de Elegibilidade: ' || v_status);
END;
/
