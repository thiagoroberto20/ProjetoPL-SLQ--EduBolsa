--Execução da Procedure

-- Geração de relatório de auditoria para a tabela Aluno, operações INSERT realizadas no último mês
BEGIN
    GERARRELATORIOAUDITORIA(
        p_tabela => 'Aluno',
        p_operacao => 'INSERT',
        p_data_inicial => ADD_MONTHS(SYSDATE, -1),
        p_data_final => SYSDATE
    );
END;

