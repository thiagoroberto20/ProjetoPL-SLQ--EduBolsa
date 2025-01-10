/*1. Criando Funções de Banco de Dados
Função: Calcular Desconto por Renda Familiar
Esta função calcula o percentual de desconto de uma bolsa com base na renda familiar.*/

CREATE OR REPLACE FUNCTION Calcular_Desconto(
    p_renda_familiar IN NUMBER   -- Parâmetro de entrada: Renda familiar
) RETURN NUMBER                 -- Retorno: Percentual de desconto
IS
    v_desconto NUMBER;          -- Variável para armazenar o desconto
BEGIN
    -- Define o desconto com base na renda familiar
    IF p_renda_familiar < 2000 THEN
        v_desconto := 50;       -- 50% de desconto para renda inferior a 2000
    ELSIF p_renda_familiar BETWEEN 2000 AND 5000 THEN
        v_desconto := 30;       -- 30% de desconto para renda entre 2000 e 5000
    ELSE
        v_desconto := 10;       -- 10% de desconto para renda acima de 5000
    END IF;

    RETURN v_desconto;          -- Retorna o percentual de desconto
END;