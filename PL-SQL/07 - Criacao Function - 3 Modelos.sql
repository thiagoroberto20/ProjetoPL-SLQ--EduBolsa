/*Exemplo 1: Função para Retornar a Idade de um Aluno
Função
Esta função calcula a idade de um aluno com base na sua data de nascimento.*/

CREATE OR REPLACE FUNCTION Calcular_Idade(
    p_data_nascimento IN DATE  -- Parâmetro de entrada: Data de nascimento do aluno
) RETURN NUMBER               -- Retorno: Idade do aluno
IS
    v_idade NUMBER;           -- Variável para armazenar a idade
BEGIN
    -- Calcula a idade com base na data atual
    v_idade := TRUNC(MONTHS_BETWEEN(SYSDATE, p_data_nascimento) / 12);
    RETURN v_idade;           -- Retorna a idade
END;
/



/*Exemplo 2: Função para Retornar o Nome da Instituição pelo ID
Função
Esta função retorna o nome de uma instituição com base no ID fornecido.*/

CREATE OR REPLACE FUNCTION Buscar_Nome_Instituicao(
    p_id_instituicao IN NUMBER  -- Parâmetro de entrada: ID da Instituição
) RETURN VARCHAR2              -- Retorno: Nome da Instituição
IS
    v_nome_instituicao VARCHAR2(100);  -- Variável para armazenar o nome
BEGIN
    -- Busca o nome da instituição na tabela
    SELECT NOME
    INTO v_nome_instituicao
    FROM Instituicao
    WHERE ID_INSTITUICAO = p_id_instituicao;

    RETURN v_nome_instituicao;  -- Retorna o nome encontrado
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Instituição Não Encontrada';  -- Mensagem para ID inexistente
END;
/



/*Exemplo 3: Função para Verificar Elegibilidade de Bolsa
Função
Esta função verifica se um aluno é elegível para bolsa com base em sua renda familiar.*/

CREATE OR REPLACE FUNCTION Verificar_Elegibilidade(
    p_renda_familiar IN NUMBER  -- Parâmetro de entrada: Renda Familiar do Aluno
) RETURN VARCHAR2              -- Retorno: Status de Elegibilidade
IS
    v_status VARCHAR2(20);     -- Variável para armazenar o status
BEGIN
    -- Define o status de elegibilidade com base na renda
    IF p_renda_familiar <= 2500 THEN
        v_status := 'Elegível';
    ELSE
        v_status := 'Não Elegível';
    END IF;

    RETURN v_status;  -- Retorna o status
END;
/
