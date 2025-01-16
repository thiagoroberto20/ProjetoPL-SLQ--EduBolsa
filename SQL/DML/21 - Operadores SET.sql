/*1. Operadores SET
1.1. Utilizando o operador UNION*/
SELECT 
    NOME, RENDA_FAMILIAR 
FROM 
    EDUBOLSA.ALUNO
WHERE 
    SEXO = 'F' -- Seleciona alunas do sexo feminino
UNION
SELECT 
    NOME, RENDA_FAMILIAR 
FROM 
    EDUBOLSA.ALUNO
WHERE 
    SEXO = 'M'; -- Seleciona alunos do sexo masculino
-- O operador UNION retorna resultados únicos, eliminando duplicatas.

    
    
-- 1.2. Utilizando o operador UNION ALL
SELECT 
    NOME, RENDA_FAMILIAR 
FROM 
    EDUBOLSA.ALUNO
WHERE 
    SEXO = 'F'
UNION ALL
SELECT 
    NOME, RENDA_FAMILIAR 
FROM 
    EDUBOLSA.ALUNO
WHERE 
    SEXO = 'M';
-- O operador UNION ALL retorna todos os resultados, incluindo duplicatas.


-- 1.3. Utilizando o operador INTERSECT
SELECT 
    ID_ALUNO, NOME 
FROM 
    EDUBOLSA.ALUNO
INTERSECT
SELECT 
    ID_ALUNO, NOME 
FROM 
    EDUBOLSA.BOLSA;
-- O operador INTERSECT retorna registros que estão em ambas as consultas.


