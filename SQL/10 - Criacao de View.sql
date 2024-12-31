/*Relatório de Auditoria
Abaixo está uma view que consolida os dados da tabela de auditoria para facilitar as consultas.*/


CREATE OR REPLACE VIEW View_Auditoria AS
SELECT
	ID_AUDITORIA,
	TABELA_ALTERADA,
	OPERACAO,
	DATA_OPERACAO,
	USUARIO,
	DBMS_LOB.SUBSTR(DADOS_ANTIGOS, 4000, 1) AS DADOS_ANTIGOS,
	DBMS_LOB.SUBSTR(DADOS_NOVOS, 4000, 1) AS DADOS_NOVOS
FROM AUDITORIA;
	