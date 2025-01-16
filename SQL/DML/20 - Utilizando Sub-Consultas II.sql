/*4. Utilizando Sub-Consultas II
4.1. Utilizando operador EXISTS*/
SELECT 
    NOME 
FROM 
    EDUBOLSA.ALUNO A
WHERE 
    EXISTS (
        SELECT 
            1 
        FROM 
            EDUBOLSA.BOLSA B
        WHERE 
            A.ID_ALUNO = B.ID_ALUNO -- Verifica se o aluno possui bolsa
    );


-- 4.2. Utilizando operador NOT EXISTS
SELECT 
    NOME 
FROM 
    EDUBOLSA.ALUNO A
WHERE 
    NOT EXISTS (
        SELECT 
            1 
        FROM 
            EDUBOLSA.BOLSA B
        WHERE 
            A.ID_ALUNO = B.ID_ALUNO -- Verifica se o aluno não possui bolsa
    );


-- 4.3. Utilizando Sub-Consultas Multiple-Column
SELECT 
    NOME, CPF 
FROM 
    EDUBOLSA.ALUNO
WHERE 
    (NOME, CPF) IN (
        SELECT 
            NOME, CPF 
        FROM 
            EDUBOLSA.AUDITORIA -- Busca combinações de nome e CPF na tabela de auditoria
    );


-- 4.4. Utilizando Sub-Consultas na Cláusula FROM
SELECT 
    SEXO, 
    AVG(RENDA_FAMILIAR) AS MEDIA_RENDA
FROM 
    (SELECT * FROM EDUBOLSA.ALUNO WHERE REND_FAMILIAR > 1000) T -- Subconsulta retorna alunos com renda maior que 1000
GROUP BY 
    SEXO;
