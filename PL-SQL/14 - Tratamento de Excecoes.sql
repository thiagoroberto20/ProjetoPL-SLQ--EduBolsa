/*1. Tratamento de Exceções Pré-definidas Oracle
Exemplo de tratamento de exceções como NO_DATA_FOUND e DUP_VAL_ON_INDEX:*/
DECLARE
    v_renda EDUBOLSA.ALUNO.RENDA_FAMILIAR%TYPE;
BEGIN
    -- Tentativa de buscar a renda familiar de um aluno inexistente
    SELECT RENDA_FAMILIAR
    INTO v_renda
    FROM EDUBOLSA.ALUNO
    WHERE ID_ALUNO = 999; -- ID que não existe
    
    -- Exibição da renda familiar
    DBMS_OUTPUT.PUT_LINE('Renda Familiar: ' || v_renda);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        -- Tratamento para quando nenhum dado for encontrado
        DBMS_OUTPUT.PUT_LINE('Nenhum aluno encontrado com o ID especificado.');
    WHEN OTHERS THEN
        -- Tratamento genérico para outras exceções
        DBMS_OUTPUT.PUT_LINE('Erro inesperado: ' || SQLERRM);
END;
/

/*Explicação Linha por Linha
Declara-se a variável v_renda para armazenar a renda do aluno.
O bloco SELECT INTO tenta buscar a renda do aluno com ID_ALUNO = 999.
Se nenhum dado for encontrado, a exceção NO_DATA_FOUND é acionada.
O bloco WHEN OTHERS trata qualquer outra exceção que possa ocorrer.*/



/*2. Exceções Definidas pelo Desenvolvedor
Criação e uso de uma exceção personalizada:*/
DECLARE
    v_nota NUMBER := 4; -- Nota fictícia
    ex_nota_baixa EXCEPTION; -- Exceção personalizada
BEGIN
    -- Verifica se a nota está abaixo do limite permitido
    IF v_nota < 5 THEN
        RAISE ex_nota_baixa; -- Lança a exceção personalizada
    END IF;

    -- Caso não haja erro, exibe mensagem
    DBMS_OUTPUT.PUT_LINE('Nota dentro do limite permitido.');

EXCEPTION
    WHEN ex_nota_baixa THEN
        -- Tratamento da exceção personalizada
        DBMS_OUTPUT.PUT_LINE('Erro: Nota muito baixa para aprovação.');
END;
/

/*Explicação Linha por Linha
Declara-se uma variável v_nota para armazenar uma nota fictícia.
Cria-se a exceção ex_nota_baixa.
A exceção é lançada com RAISE caso a nota esteja abaixo de 5.
No bloco de exceção, é tratado o erro com uma mensagem específica.*/



/*3. PRAGMA EXCEPTION INIT
Associa um erro Oracle específico a uma exceção personalizada:*/
DECLARE
    ex_unique_violation EXCEPTION; -- Exceção personalizada
    PRAGMA EXCEPTION_INIT(ex_unique_violation, -00001); -- Associa erro ORA-00001 à exceção
BEGIN
    -- Tentativa de inserir um aluno com CPF duplicado
    INSERT INTO EDUBOLSA.ALUNO (ID_ALUNO, NOME, CPF, DATA_NASCIMENTO, SEXO, RENDA_FAMILIAR)
    VALUES (SEQ_ALUNO.NEXTVAL, 'João Silva', '12345678901', DATE '2000-01-01', 'M', 2500.00);

EXCEPTION
    WHEN ex_unique_violation THEN
        -- Tratamento para a violação de chave única
        DBMS_OUTPUT.PUT_LINE('Erro: CPF duplicado.');
END;
/

/*Explicação Linha por Linha
Declara-se a exceção ex_unique_violation.
Usa-se PRAGMA EXCEPTION_INIT para associar a exceção ao erro ORA-00001 (violação de chave única).
Tenta-se inserir um aluno com CPF já existente.
No bloco de exceção, o erro é tratado com uma mensagem específica.*/