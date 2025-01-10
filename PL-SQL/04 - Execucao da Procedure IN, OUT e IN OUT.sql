/*1. Executando a Procedure com Parâmetro do Tipo IN
A procedure Add_Aluno insere um aluno na tabela Aluno. Para executá-la:*/

BEGIN
    -- Executa a procedure passando os valores dos parâmetros de entrada
    EDUBOLSA.Add_Aluno(
        p_nome => 'Carlos Silva',
        p_cpf => '12345678901',
        p_email => 'carlos.silva@email.com'
    );
END;
/


/*2. Executando a Procedure com Parâmetro do Tipo OUT
A procedure Get_Instituicao retorna o nome e o tipo de uma instituição com base no ID. Para executá-la, é necessário declarar variáveis para capturar os valores de saída:
*/


DECLARE
    v_nome VARCHAR2(100);   -- Variável para armazenar o nome da instituição
    v_tipo VARCHAR2(20);    -- Variável para armazenar o tipo da instituição
BEGIN
    -- Executa a procedure com o ID informado
    EDUBOLSA.Get_Instituicao(
        p_id => 1,       -- ID da instituição
        p_nome => v_nome, -- Variável de saída para o nome
        p_tipo => v_tipo  -- Variável de saída para o tipo
    );

    -- Exibe os resultados
    DBMS_OUTPUT.PUT_LINE('Nome da Instituição: ' || v_nome);
    DBMS_OUTPUT.PUT_LINE('Tipo da Instituição: ' || v_tipo);
END;
/


/*3. Executando a Procedure com Métodos de Passagem de Parâmetros
A procedure Update_Aluno utiliza os três métodos de passagem de parâmetros (IN, OUT, IN OUT):*/

DECLARE
    v_nome VARCHAR2(100) := 'Joao Souza'; -- Novo nome do aluno (entrada e saída)
    v_cpf VARCHAR2(14);                    -- CPF atual do aluno (saída)
BEGIN
    -- Executa a procedure para atualizar o nome do aluno com ID 1
    EDUBOLSA.Update_Aluno(
        p_id => 1,       -- ID do aluno
        p_nome => v_nome, -- Nome de entrada (novo nome)
        p_cpf => v_cpf    -- CPF de saída
    );

    -- Exibe o CPF antigo e o novo nome
    DBMS_OUTPUT.PUT_LINE('CPF Antigo: ' || v_cpf);
    DBMS_OUTPUT.PUT_LINE('Novo Nome: ' || v_nome);
END;
/