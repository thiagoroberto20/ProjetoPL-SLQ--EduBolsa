--1. Operadores de Concatenação
--1.1. Utilizando Operador de Concatenação
SELECT 
    ID_ALUNO || ' - ' || NOME AS ALUNO_INFO -- Concatena o ID e o nome do aluno, separados por " - "
FROM 
    EDUBOLSA.ALUNO; -- Consulta na tabela EDUBOLSA.ALUNO

     
-- 1.2. Utilizando Operador de Concatenação e Strings de Caracteres
 
SELECT 
    'Aluno: ' || NOME || ', CPF: ' || CPF AS DETALHES_ALUNO -- Adiciona texto explicativo junto ao nome e CPF do aluno
FROM 
    EDUBOLSA.ALUNO;

	