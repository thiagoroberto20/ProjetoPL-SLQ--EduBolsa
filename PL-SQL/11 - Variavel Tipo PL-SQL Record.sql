/*1. Variável Tipo PL/SQL Record
Cria uma variável baseada em uma linha da tabela ALUNO usando %ROWTYPE.*/

DECLARE
    -- Declara uma variável do tipo PL/SQL Record baseada na estrutura da tabela ALUNO
    v_aluno_record ALUNO%ROWTYPE; 
BEGIN
    -- Busca os dados do aluno com ID = 1 e armazena na variável v_aluno_record
    SELECT * INTO v_aluno_record 
    FROM ALUNO 
    WHERE ID_ALUNO = 1;

    -- Exibe os dados do aluno
    DBMS_OUTPUT.PUT_LINE('Nome do aluno: ' || v_aluno_record.NOME);
    DBMS_OUTPUT.PUT_LINE('CPF do aluno: ' || v_aluno_record.CPF);
    DBMS_OUTPUT.PUT_LINE('Data de nascimento: ' || TO_CHAR(v_aluno_record.DATA_NASCIMENTO, 'DD/MM/YYYY'));
END;
/




/*2. Criando um PL/SQL Record utilizando atributo %ROWTYPE
Cria um PL/SQL Record usando a estrutura da tabela CURSO.*/
DECLARE
    -- Declara uma variável do tipo Record baseada na estrutura da tabela CURSO
    v_curso_record CURSO%ROWTYPE;
BEGIN
    -- Atribui valores diretamente ao Record
    v_curso_record.ID_CURSO := 1;
    v_curso_record.NOME := 'Engenharia de Software';
    v_curso_record.TIPO := 'Bacharelado';

    -- Exibe os valores atribuídos
    DBMS_OUTPUT.PUT_LINE('Curso cadastrado: ' || v_curso_record.NOME || ' - ' || v_curso_record.TIPO);
END;
/


SELECT * FROM EDUBOLSA.CURSO c ;