/*3. Collections - Associative Array
Usa uma associative array (índices podem ser string ou número).*/
DECLARE
    -- Declara um Associative Array com índices numéricos e valores do tipo VARCHAR2
    TYPE t_alunos IS TABLE OF VARCHAR2(100) INDEX BY PLS_INTEGER;
    v_alunos t_alunos; -- Variável do tipo criado
BEGIN
    -- Insere dados no Associative Array
    v_alunos(1) := 'Ana';
    v_alunos(2) := 'João';
    v_alunos(3) := 'Carlos';

    -- Itera sobre o Associative Array
    FOR i IN 1..v_alunos.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Aluno ' || i || ': ' || v_alunos(i));
    END LOOP;
END;
/



/*4. Associative Array of Records - Bulk Collect
Usa Bulk Collect para popular um Associative Array com registros.*/
DECLARE
    -- Define um Associative Array baseado na estrutura da tabela ALUNO
    TYPE t_alunos_rec IS TABLE OF ALUNO%ROWTYPE INDEX BY PLS_INTEGER;
    v_alunos_rec t_alunos_rec; -- Variável do tipo criado
BEGIN
    -- Coleta dados de todos os alunos na tabela ALUNO em Bulk Collect
    SELECT * BULK COLLECT INTO v_alunos_rec 
    FROM EDUBOLSA.ALUNO;

    -- Itera sobre o Array e exibe os dados
    FOR i IN 1..v_alunos_rec.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Aluno: ' || v_alunos_rec(i).NOME || ' - CPF: ' || v_alunos_rec(i).CPF);
    END LOOP;
END;
/



/*5. Nested Table of Records - Bulk Collect
Cria uma Nested Table para armazenar registros de múltiplas linhas.*/
DECLARE
    -- Define um tipo de Nested Table para armazenar registros da tabela CURSO
    TYPE t_cursos IS TABLE OF CURSO%ROWTYPE;
    v_cursos t_cursos; -- Variável do tipo criado
BEGIN
    -- Coleta registros da tabela CURSO em Bulk Collect
    SELECT * BULK COLLECT INTO v_cursos 
    FROM CURSO;

    -- Itera sobre a Nested Table e exibe os registros
    FOR i IN 1..v_cursos.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Curso: ' || v_cursos(i).NOME || ' - Turno: ' || v_cursos(i).TURNO);
    END LOOP;
END;
/

-- OU

DECLARE
    -- Definir um tipo de registro para armazenar as informações de ambas as tabelas
    TYPE t_curso_instituicao IS RECORD (
        NOME_CURSO CURSO.NOME%TYPE,
        ID_INSTITUICAO CURSO.ID_INSTITUICAO%TYPE,
        NOME_INSTITUICAO INSTITUICAO.NOME%TYPE
    );
    
    -- Definir uma tabela de registros do tipo t_curso_instituicao
    TYPE t_cursos_instituicao IS TABLE OF t_curso_instituicao;
    v_cursos_instituicao t_cursos_instituicao;
BEGIN
    -- Selecionar os dados das duas tabelas
    SELECT C.NOME, C.ID_INSTITUICAO, I.NOME BULK COLLECT INTO v_cursos_instituicao
    FROM EDUBOLSA.CURSO C
    INNER JOIN EDUBOLSA.INSTITUICAO I ON I.ID_INSTITUICAO = C.ID_INSTITUICAO;

    -- Exibir os dados selecionados
    FOR i IN 1..v_cursos_instituicao.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Curso: ' || v_cursos_instituicao(i).NOME_CURSO || 
           '  Instituição: ' || v_cursos_instituicao(i).NOME_INSTITUICAO);
    END LOOP;
    
END;
/



/*6. Varray of Records - Bulk Collect
Usa um Varray para armazenar uma quantidade fixa de registros.*/
DECLARE
    -- Define um tipo Varray com tamanho máximo de 10 para armazenar registros da tabela INSTITUICAO
    TYPE t_instituicoes IS VARRAY(10) OF INSTITUICAO%ROWTYPE;
    v_instituicoes t_instituicoes; -- Variável do tipo criado
BEGIN
    -- Coleta até 10 registros da tabela INSTITUICAO
    SELECT * BULK COLLECT INTO v_instituicoes 
    FROM INSTITUICAO 
    WHERE ROWNUM <= 10;

    -- Itera sobre o Varray e exibe os registros
    FOR i IN 1..v_instituicoes.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Instituição: ' || v_instituicoes(i).NOME || ' - Tipo: ' || v_instituicoes(i).TIPO);
    END LOOP;
END;
/



/*7. Utilizando Métodos para controlar Collections
Mostra o uso de métodos como COUNT, EXTEND, e DELETE em coleções.*/
DECLARE
    -- Define um tipo Nested Table para armazenar os nomes dos alunos
    TYPE t_alunos IS TABLE OF VARCHAR2(100);
    v_alunos t_alunos := t_alunos(); -- Inicializando a coleção
BEGIN
    -- Adiciona elementos na Nested Table
    v_alunos.EXTEND(3); -- Expande a tabela para 3 posições
    v_alunos(1) := 'Maria';
    v_alunos(2) := 'José';
    v_alunos(3) := 'Pedro';

    -- Exibe a contagem de elementos na Nested Table
    DBMS_OUTPUT.PUT_LINE('Total de alunos: ' || v_alunos.COUNT);

    -- Remove o segundo elemento
    v_alunos.DELETE(2);

    -- Exibe os elementos restantes
    FOR i IN 1..v_alunos.COUNT LOOP
        IF v_alunos(i) IS NOT NULL THEN
            DBMS_OUTPUT.PUT_LINE('Aluno ' || i || ': ' || v_alunos(i));
        END IF;
    END LOOP;
END;
/
