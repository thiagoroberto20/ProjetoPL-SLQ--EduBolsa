 /*1. Agregando dados utilizando Funções de Grupo I
1.1. Utilizando as Funções AVG e SUM*/
SELECT 
    AVG(REND_FAMILIAR) AS MEDIA_RENDA, -- Calcula a média da renda familiar
    SUM(REND_FAMILIAR) AS SOMA_RENDA  -- Calcula a soma total das rendas familiares
FROM 
    EDUBOLSA.ALUNO;

 
 -- 1.2. Utilizando as Funções MIN e MAX
SELECT 
    MIN(NOTA_MEDIA) AS MENOR_NOTA, -- Retorna a menor nota média
    MAX(NOTA_MEDIA) AS MAIOR_NOTA -- Retorna a maior nota média
FROM 
    EDUBOLSA.DESEMPENHO;
 
 
 -- 1.3. Utilizando a Função COUNT com DISTINCT
SELECT 
	COUNT(DISTINCT CPF) AS ALUNOS_UNICOS
FROM 
	EDUBOLSA.ALUNO;
 
 -- 1.4. Tratamento de NULOS em Funções de Grupo
 SELECT 
    SUM(NVL(REND_FAMILIAR, 0)) AS TOTAL_RENDA -- Substitui valores nulos por 0 antes de somar
FROM 
    EDUBOLSA.ALUNO;

 SELECT * FROM EDUBOLSA.ALUNO;