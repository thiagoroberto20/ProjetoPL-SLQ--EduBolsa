/*2. Regras de Precedência de Operadores
2.1. Utilizando Parênteses para Alterar a Precedência*/
SELECT 
    (NOTA_MEDIA + 10) * 2 AS AJUSTE_NOTA -- Primeiro soma 10 à nota, depois multiplica por 2
FROM 
    EDUBOLSA.DESEMPENHO;



--2.2. Utilizando Valores Nulos em Expressões Aritméticas
SELECT 
    NOTA_MEDIA + NVL(FREQUENCIA, 0) AS AJUSTE_FINAL -- Substitui NULL por 0 para evitar resultados inesperados
FROM 
    EDUBOLSA.DESEMPENHO;


