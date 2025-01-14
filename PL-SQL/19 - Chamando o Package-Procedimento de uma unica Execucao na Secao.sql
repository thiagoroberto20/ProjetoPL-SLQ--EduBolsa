-- Inserindo um Aluno
BEGIN
  EDUBOLSA.PKG_ALUNOS.PRC_INSERE_ALUNO(
    p_nome => 'Carlos Pereira',
    p_cpf => '12345678901',
    p_data_nascimento => DATE '2000-05-20',
    p_sexo => 'M',
    p_renda_familiar => 1500
  );
END;
/



--Aumentando a Renda de um Aluno
BEGIN
  EDUBOLSA.PKG_ALUNOS.PRC_AUMENTA_RENDA_ALUNO(
    p_id_aluno => 1,
    p_percentual => 10
  );
END;
/



-- Consultando a Renda de um Aluno
DECLARE
  v_renda NUMBER;
BEGIN
  v_renda := EDUBOLSA.PKG_ALUNOS.FNC_CONSULTA_RENDA_ALUNO(1);
  DBMS_OUTPUT.PUT_LINE('Renda do aluno: ' || v_renda);
END;
/


SELECT * FROM EDUBOLSA.ALUNO;