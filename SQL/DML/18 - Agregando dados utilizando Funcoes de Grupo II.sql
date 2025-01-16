-- 2. Agregando dados utilizando Funções de Grupo II

-- 2.1. Criando Grupos utilizando a Cláusula GROUP BY
SELECT 
    SEXO, -- Agrupa os registros por sexo
    AVG(RENDA_FAMILIAR) AS MEDIA_RENDA -- Calcula a média de renda para cada grupo
FROM 
    EDUBOLSA.ALUNO
GROUP BY 
    SEXO;


-- 2.2. Restringindo Grupos utilizando a cláusula HAVING
SELECT 
    SEXO, 
    AVG(RENDA_FAMILIAR) AS MEDIA_RENDA
FROM 
    EDUBOLSA.ALUNO
GROUP BY 
    SEXO
HAVING 
    AVG(REND_FAMILIAR) > 2000; -- Filtra os grupos onde a média de renda é superior a 2000


-- 2.3. Aninhando Funções de Grupo
SELECT 
    MAX(AVG(NOTA_MEDIA)) AS MAIOR_MEDIA_NOTA -- Calcula a maior média entre os grupos
FROM 
    EDUBOLSA.DESEMPENHO
GROUP BY 
    ID_CURSO; -- Agrupa por curso
