/*4. Funções de Conversão e Expressões Condicionais
4.1. Utilizando a Função TO_CHAR com Datas*/
SELECT 
    TO_CHAR(DATA_NASCIMENTO, 'DD/MM/YYYY') AS DATA_FORMATADA -- Formata a data no formato dia/mês/ano
FROM 
    EDUBOLSA.ALUNO;


-- 4.2. Utilizando a Função TO_CHAR com Números
SELECT 
    TO_CHAR(REND_FAMILIAR, 'L9,999.99') AS RENDA_FORMATADA -- Formata a renda em padrão monetário
FROM 
    EDUBOLSA.ALUNO;


-- 4.3. Utilizando a Função TO_DATE
SELECT 
    TO_DATE('01/01/2025', 'DD/MM/YYYY') AS DATA_CONVERTIDA -- Converte uma string para uma data
FROM 
    DUAL;


-- 4.4. Utilizando Funções Aninhadas
SELECT 
    UPPER(SUBSTR(NOME, 1, 5)) AS PRIMEIRO_NOME_MAIUSCULO -- Extrai os 5 primeiros caracteres e os converte para maiúsculo
FROM 
    EDUBOLSA.ALUNO;


-- 4.5. Utilizando a Função NVL
SELECT 
    NVL(FREQUENCIA, 0) AS FREQUENCIA_CORRIGIDA -- Substitui valores NULL por 0
FROM 
    EDUBOLSA.DESEMPENHO;


-- 4.6. Utilizando a Função COALESCE
SELECT 
	COALESCE(FREQUENCIA, NOTA_MEDIA, 0) AS VALOR_UTILIZADO
FROM 
	EDUBOLSA.DESEMPENHO;


-- 4.7. Utilizando a Função NVL2
SELECT 
    NVL2(FREQUENCIA, 'Presente', 'Faltante') AS STATUS_ALUNO -- Retorna "Presente" se o valor não for NULL, senão "Faltante"
FROM 
    EDUBOLSA.DESEMPENHO;


-- 4.8. Expressão CASE
SELECT 
	CASE
		WHEN RENDA_FAMILIAR < 2000 THEN 'Baixa'
		WHEN RENDA_FAMILIAR BETWEEN 2000 AND 5000 THEN 'Média'
		ELSE 'Alta'
	END AS CLASSE_RENDA
FROM 
	EDUBOLSA.ALUNO;


-- 4.9. Utilizando a Função DECODE
SELECT 
	DECODE(SEXO, 'M', 'Masculino', 'F', 'Feminino', 'Outro') AS DESCRICAO_SEXO
FROM 
	EDUBOLSA.ALUNO;

