--Executando a Função pelo Bloco PL/SQL


DECLARE
    v_desconto NUMBER;  -- Variável para armazenar o retorno da função
BEGIN
    -- Chama a função com o parâmetro da renda familiar
    v_desconto := Calcular_Desconto(1500);

    -- Exibe o desconto calculado
    DBMS_OUTPUT.PUT_LINE('Percentual de Desconto: ' || v_desconto || '%');
END;
/

/*Utilizando Funções em Comandos SQL
É possível usar funções diretamente em comandos SQL para processar dados.*/


-- Lista os alunos e seus respectivos percentuais de desconto com base na renda familiar
SELECT 
    NOME, 
    CPF, 
    Calcular_Desconto(RENDA_FAMILIAR) AS PERCENTUAL_DESCONTO
FROM Aluno;
/


/*4. Executando a Função pelo Comando SELECT
Funções podem ser chamadas diretamente em um comando SELECT.*/

-- Executa a função passando um valor fixo de renda familiar
SELECT Calcular_Desconto(8500) AS PERCENTUAL_DESCONTO
FROM DUAL;


-- Recompila a função "Calcular_Desconto"
ALTER FUNCTION Calcular_Desconto COMPILE;


-- Remove a função "Calcular_Desconto"
DROP FUNCTION Calcular_Desconto;
