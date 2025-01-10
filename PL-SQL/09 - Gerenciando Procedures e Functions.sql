-- Gerenciando Procedures e Functions ORACLE-PL/SQL

/*1. Consultando Objetos do Tipo Procedure e Function do Usuário
Use a visão USER_OBJECTS para listar os objetos do tipo Procedure e Function.*/

SELECT OBJECT_NAME, OBJECT_TYPE, STATUS
FROM USER_OBJECTS
WHERE OBJECT_TYPE IN ('PROCEDURE', 'FUNCTION');

SELECT object_name, object_type, last_ddl_time, timestamp, status
FROM   all_objects
WHERE  object_type IN ('PROCEDURE', 'FUNCTION');


/*2. Consultando Objetos Inválidos do Schema do Usuário
Para encontrar objetos inválidos, use a visão USER_OBJECTS e filtre pelo status INVALID.*/
SELECT OBJECT_NAME, OBJECT_TYPE, STATUS
FROM USER_OBJECTS
WHERE STATUS = 'INVALID';


/*3. Consultando o Código Fonte de Procedures e Funções do Usuário
A visão USER_SOURCE armazena o código fonte de objetos do usuário.*/
SELECT TEXT
FROM USER_SOURCE
WHERE NAME = 'CALCULAR_DESCONTO'
ORDER BY LINE;


/*4. Consultando a Lista de Parâmetros de Procedures e Funções
A visão USER_ARGUMENTS contém informações sobre os parâmetros.*/
SELECT OBJECT_NAME, ARGUMENT_NAME, POSITION, DATA_TYPE, IN_OUT
FROM USER_ARGUMENTS
WHERE OBJECT_NAME = 'CALCULAR_DESCONTO';


/*5. Consultando Erros de Compilação
A visão USER_ERRORS armazena informações sobre erros de compilação em objetos do usuário.*/
SELECT NAME, TYPE, LINE, POSITION, TEXT
FROM USER_ERRORS;


/*6. Forçando um Erro de Compilação
Crie intencionalmente um erro em uma Procedure ou Function para fins de demonstração.*/
CREATE OR REPLACE PROCEDURE Forca_Erro IS
BEGIN
    -- Código com erro de sintaxe
    SELECT * FROM Tabela_Inexistente;
END;
/


/*7. Consultando Erros de Compilação - Comando SHOW ERRORS
Após tentar criar ou compilar um objeto com erros, use o comando SHOW ERRORS para visualizar os detalhes.*/
SHOW ERRORS PROCEDURE EDUBOLSA.Forca_Erro;


/*8. Consultando Erros de Compilação - Visão USER_ERRORS
Após forçar um erro, consulte a visão USER_ERRORS para detalhes.*/
SELECT NAME, TYPE, LINE, POSITION, TEXT
FROM USER_ERRORS
WHERE NAME = 'FORCA_ERRO';

