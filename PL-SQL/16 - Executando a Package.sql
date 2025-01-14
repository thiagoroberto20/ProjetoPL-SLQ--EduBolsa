/*Referenciando Componentes de um PACKAGE*/
BEGIN
    -- Chamando o procedimento Add_Aluno do pacote
    EDUBOLSA.PKG_GESTAO_ALUNO.Add_Aluno(
        p_nome => 'Maria Silva',
        p_cpf => '12345678911',
        p_data_nascimento => DATE '2001-06-15',
        p_sexo => 'F',
        p_renda_familiar => 3000.00
    );

    -- Chamando a função Get_Aluno_Renda e exibindo o resultado
    DBMS_OUTPUT.PUT_LINE('Renda: ' || EDUBOLSA.PKG_GESTAO_ALUNO.Get_Aluno_Renda(1));
END;
/
