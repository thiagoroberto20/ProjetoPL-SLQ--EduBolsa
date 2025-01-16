/*3. Utilizando Funções Single Row
3.1. Funções de Conversão Maiúsculo & Minúsculo*/
SELECT 
    UPPER(NOME) AS NOME_MAIUSCULO, -- Converte o nome para letras maiúsculas
    LOWER(NOME) AS NOME_MINUSCULO  -- Converte o nome para letras minúsculas
FROM 
    EDUBOLSA.ALUNO;


-- 3.2. Funções de Manipulação de Caracteres
SELECT 
    SUBSTR(NOME, 1, 5) AS PRIMEIRO_NOME, -- Extrai os 5 primeiros caracteres do nome
    LENGTH(NOME) AS TAMANHO_NOME        -- Retorna o tamanho do nome
FROM 
    EDUBOLSA.ALUNO;


-- 3.3. Funções tipo NUMBER
SELECT 
    ROUND(NOTA_MEDIA, 1) AS NOTA_ARREDONDADA, -- Arredonda a nota para uma casa decimal
    TRUNC(NOTA_MEDIA) AS NOTA_TRUNCADA       -- Trunca a nota para o número inteiro mais próximo
FROM 
    EDUBOLSA.DESEMPENHO;



-- 3.4. Funções tipo DATE
SELECT 
    SYSDATE AS DATA_ATUAL, -- Retorna a data atual do sistema
    ADD_MONTHS(SYSDATE, 6) AS PROXIMO_SEMESTRE -- Adiciona 6 meses à data atual
FROM 
    DUAL; -- Tabela fictícia usada para consultas auxiliares


-- 3.5. Cálculos com Datas
SELECT 
    SYSDATE - DATA_NASCIMENTO AS IDADE_EM_DIAS -- Calcula a diferença em dias entre hoje e a data de nascimento
FROM 
    EDUBOLSA.ALUNO;
-- ou

SELECT
    ROUND(SYSDATE - DATA_NASCIMENTO, 1) AS IDADE_EM_DIAS
FROM
    EDUBOLSA.ALUNO a;
