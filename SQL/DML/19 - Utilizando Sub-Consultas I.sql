/*3. Utilizando Sub-Consultas I
3.1. Sub-Consultas Multiple-row*/

SELECT 
    NOME 
FROM 
    EDUBOLSA.ALUNO
WHERE 
    ID_ALUNO IN (
        SELECT 
            ID_ALUNO 
        FROM 
            EDUBOLSA.DESEMPENHO
        WHERE 
            NOTA_MEDIA > 7 -- Subconsulta retorna alunos com nota média maior que 7
    );


-- 3.2. Utilizando operador NOT IN em Sub-Consultas Multiple-Row

SELECT 
    NOME 
FROM 
    EDUBOLSA.ALUNO
WHERE 
    ID_ALUNO NOT IN (
        SELECT 
            ID_ALUNO 
        FROM 
            EDUBOLSA.DESEMPENHO
        WHERE 
            NOTA_MEDIA > 7
    ); -- Retorna alunos que não possuem nota média maior que 7


-- 3.3. Utilizando operador ANY em Sub-Consultas Multiple-Row
    
SELECT 
    NOME 
FROM 
    EDUBOLSA.ALUNO
WHERE 
    RENDA_FAMILIAR < ANY (
        SELECT 
            RENDA_FAMILIAR 
        FROM 
            EDUBOLSA.ALUNO
        WHERE 
            SEXO = 'F' -- Compara com qualquer renda familiar das alunas do sexo feminino
    );

-- 3.4. Utilizando operador ALL em Sub-Consultas Multiple-Row

SELECT 
    NOME 
FROM 
    EDUBOLSA.ALUNO
WHERE 
    REND_FAMILIAR > ALL (
        SELECT 
            REND_FAMILIAR 
        FROM 
            EDUBOLSA.ALUNO
        WHERE 
            SEXO = 'F' -- Compara com todas as rendas familiares das alunas do sexo feminino
    );


-- 3.5. Cuidados com Valores Nulos em Sub-Consulta com Operador NOT IN
SELECT 
    NOME 
FROM 
    EDUBOLSA.ALUNO
WHERE 
    ID_ALUNO NOT IN (
        SELECT 
            ID_ALUNO 
        FROM 
            EDUBOLSA.DESEMPENHO
        WHERE 
            NOTA_MEDIA IS NOT NULL -- Certifica-se de que não há valores nulos na subconsulta
    );
