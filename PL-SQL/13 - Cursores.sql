/*Controlando um Cursor Explícito com LOOP Básico*/
DECLARE
	CURSOR cur_alunos IS
		SELECT ID_ALUNO, NOME, RENDA_FAMILIAR FROM EDUBOLSA.ALUNO;

	v_id_aluno ALUNO.ID_ALUNO%TYPE;
	v_nome ALUNO.NOME%TYPE;
	v_renda ALUNO.RENDA_FAMILIAR%TYPE;
BEGIN 
	OPEN cur_alunos;
	
	LOOP
		FETCH cur_alunos INTO v_id_aluno, v_nome, v_renda;
	
		EXIT WHEN cur_alunos%NOTFOUND;
		
		DBMS_OUTPUT.PUT_LINE('ID: ' || v_id_aluno || ' Nome: ' || v_nome || ' Renda: ' || v_renda);
	END LOOP;
	CLOSE cur_alunos;	
END;

/*Controlando um Cursor Explícito com WHILE LOOP*/
DECLARE
    CURSOR cur_cursos IS
        SELECT ID_CURSO, NOME FROM EDUBOLSA.CURSO;

    v_id_curso EDUBOLSA.CURSO.ID_CURSO%TYPE;
    v_nome_curso EDUBOLSA.CURSO.NOME%TYPE;
BEGIN
    OPEN cur_cursos;

    -- Loop controlado pelo estado do cursor
    WHILE cur_cursos%FOUND LOOP
        FETCH cur_cursos INTO v_id_curso, v_nome_curso;

        -- Exibindo os dados do curso
        DBMS_OUTPUT.PUT_LINE('ID Curso: ' || v_id_curso || ' Nome: ' || v_nome_curso);
    END LOOP;

    CLOSE cur_cursos;
END;
/



/*Controlando um Cursor Explícito utilizando CURSOR FOR LOOP*/
DECLARE
    -- Cursor explícito para selecionar desempenho dos alunos
    CURSOR cur_desempenho IS
        SELECT ID_ALUNO, SEMESTRE, NOTA_MEDIA FROM EDUBOLSA.DESEMPENHO;
BEGIN
    -- CURSOR FOR LOOP para percorrer os registros
    FOR rec IN cur_desempenho LOOP
        -- Exibindo os dados de cada desempenho
        DBMS_OUTPUT.PUT_LINE('ID Aluno: ' || rec.ID_ALUNO || 
                             ' Semestre: ' || rec.SEMESTRE || 
                             ' Nota Média: ' || rec.NOTA_MEDIA);
    END LOOP;
END;
/


/*CURSOR FOR LOOP utilizando Sub-consulta*/
BEGIN
    -- CURSOR FOR LOOP diretamente em uma sub-consulta
    FOR rec IN (SELECT ID_ALUNO, NOME, SEXO FROM  EDUBOLSA.ALUNO WHERE RENDA_FAMILIAR < 3000) LOOP
        -- Exibindo os dados do aluno com renda familiar abaixo de 3000
        DBMS_OUTPUT.PUT_LINE('ID: ' || rec.ID_ALUNO || ' Nome: ' || rec.NOME || ' Sexo: ' || rec.SEXO);
    END LOOP;
END;
/



/*CURSOR FOR LOOP com Parâmetros*/
DECLARE
    -- Cursor com parâmetros para filtrar os cursos
    CURSOR cur_cursos(p_nome_curso VARCHAR2) IS
        SELECT ID_CURSO, NOME FROM EDUBOLSA.CURSO WHERE NOME LIKE p_nome_curso;

BEGIN
    -- Chamando o cursor com o parâmetro '%Engenharia%'
    FOR rec IN cur_cursos('%Engenharia%') LOOP
        -- Exibindo os dados dos cursos encontrados
        DBMS_OUTPUT.PUT_LINE('ID Curso: ' || rec.ID_CURSO || ' Nome: ' || rec.NOME_CURSO);
    END LOOP;
END;
/

/*Cursor Explícito com SELECT FOR UPDATE*/
DECLARE
    -- Cursor para selecionar alunos com rendimento familiar abaixo de 2000 para atualização
    CURSOR cur_update_aluno IS
        SELECT ID_ALUNO, RENDA_FAMILIAR FROM EDUBOLSA.ALUNO WHERE RENDA_FAMILIAR < 2000 FOR UPDATE;

    v_id_aluno ALUNO.ID_ALUNO%TYPE;
    v_renda_familiar ALUNO.RENDA_FAMILIAR%TYPE;
BEGIN
    OPEN cur_update_aluno;

    LOOP
        FETCH cur_update_aluno INTO v_id_aluno, v_renda_familiar;

        -- Saindo do loop quando não houver mais registros
        EXIT WHEN cur_update_aluno%NOTFOUND;

        -- Atualizando a renda familiar
        UPDATE EDUBOLSA.ALUNO
        SET RENDA_FAMILIAR = 2000
        WHERE CURRENT OF cur_update_aluno;

        DBMS_OUTPUT.PUT_LINE('Renda do aluno ID ' || v_id_aluno || ' atualizada para 2000.');
    END LOOP;

    CLOSE cur_update_aluno;
END;
/


/*Observação Final
Certifique-se de habilitar o DBMS_OUTPUT antes de executar os blocos (SET SERVEROUTPUT ON).
Caso tenha dúvidas ou precise de ajustes, estou à disposição!*/