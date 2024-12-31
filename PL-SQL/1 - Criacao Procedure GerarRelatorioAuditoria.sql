/*Procedure para Relatórios Automatizados
A procedure abaixo gera relatórios de auditoria filtrados por tabela, tipo de operação e intervalo de datas.

Criação da Procedure*/


CREATE OR REPLACE PROCEDURE GERARRELATORIOAUDITORIA(
	p_tabela IN VARCHAR2,
	p_operacao IN VARCHAR2,
	p_data_inicial IN DATE,
	p_data_final IN DATE
) IS 
BEGIN 
	DBMS_OUTPUT.PUT_LINE('Relatório de Auditoria: '):
	DBMS_OUTPUT.PUT_LINE('---------------------------------------');

	FOR r IN (
		SELECT
			ID_AUDITORIA, TABELA_ALTERADA, OPERACAO, DATA_OPERACAO, USUARIO,
			DBMS_LOB.SUBSTR(DADOS_ANTIGOS, 4000, 1) AS DADOS_ANTIGOS,
            DBMS_LOB.SUBSTR(DADOS_NOVOS, 4000, 1) AS DADOS_NOVOS
        FROM Auditoria
        WHERE TABELA_ALTERADA = p_tabela
          AND OPERACAO = p_operacao
          AND DATA_OPERACAO BETWEEN p_data_inicial AND p_data_final
        ORDER BY DATA_OPERACAO
    ) LOOP
	     DBMS_OUTPUT.PUT_LINE('ID Auditoria: ' || r.ID_AUDITORIA);
        DBMS_OUTPUT.PUT_LINE('Tabela: ' || r.TABELA_ALTERADA);
        DBMS_OUTPUT.PUT_LINE('Operação: ' || r.OPERACAO);
        DBMS_OUTPUT.PUT_LINE('Data: ' || TO_CHAR(r.DATA_OPERACAO, 'YYYY-MM-DD HH24:MI:SS'));
        DBMS_OUTPUT.PUT_LINE('Usuário: ' || r.USUARIO);
        DBMS_OUTPUT.PUT_LINE('Dados Antigos: ' || r.DADOS_ANTIGOS);
        DBMS_OUTPUT.PUT_LINE('Dados Novos: ' || r.DADOS_NOVOS);
        DBMS_OUTPUT.PUT_LINE('----------------------------------------');
    END LOOP;   
        
END;
