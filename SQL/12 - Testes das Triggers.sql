-- Testes das Triggers

/*Caso de esse  erro ORA-01950 indica que o usuário que está executando o comando não tem privilégios suficientes no tablespace USERS. Para resolver isso, é necessário conceder os privilégios apropriados ao usuário que está tentando executar a inserção.
Se você tiver acesso de administrador ao banco de dados, pode conceder a quota necessária ao usuário. Aqui está um exemplo de como você pode fazer isso:
sql*/
ALTER USER EDUBOLSA QUOTA 100M ON USERS;

-- Operações na Tabela Aluno
-- INSERT na tabela Aluno
INSERT INTO Aluno (ID_ALUNO, NOME, CPF, DATA_NASCIMENTO, SEXO, RENDA_FAMILIAR)
VALUES (NULL, 'Carlos Silva', '12345678901', DATE '2000-05-15', 'M', 1500.00);

-- UPDATE na tabela Aluno
UPDATE Aluno
SET RENDA_FAMILIAR = 2000.00
WHERE CPF = '12345678901';

-- DELETE na tabela Aluno
DELETE FROM Aluno
WHERE CPF = '12345678901';



--Operações na Tabela Curso
-- INSERT na tabela Curso
INSERT INTO Curso (ID_CURSO, NOME, TURNO, CARGA_HORARIA, VALOR_MENSALIDADE, ID_INSTITUICAO)
VALUES (NULL, 'Engenharia da Computação', 'Integral', 3600, 1200.00, 1);

-- UPDATE na tabela Curso
UPDATE Curso
SET VALOR_MENSALIDADE = 1300.00
WHERE NOME = 'Engenharia da Computação';

-- DELETE na tabela Curso
DELETE FROM Curso
WHERE NOME = 'Engenharia da Computação';


--Operações na Tabela Bolsa 
-- INSERT na tabela Bolsa
INSERT INTO Bolsa (ID_BOLSA, TIPO, VALOR, STATUS, ID_CURSO, ID_ALUNO)
VALUES (NULL, 'Integral', 1200.00, 'Disponível', 1, NULL);

-- UPDATE na tabela Bolsa
UPDATE Bolsa
SET STATUS = 'Concedida'
WHERE TIPO = 'Integral';

-- DELETE na tabela Bolsa
DELETE FROM Bolsa
WHERE TIPO = 'Integral';



/* Validação da View_Auditoria
Após realizar as operações acima, execute a consulta abaixo para verificar os dados armazenados na tabela de auditoria por meio da View_Auditoria.*/

-- Consulta Geral
SELECT *
FROM View_Auditoria;


-- Consulta Específica
-- Consultar todas as operações na tabela Aluno
SELECT *
FROM View_Auditoria
WHERE TABELA_ALTERADA = 'Aluno';

-- Consultar apenas operações de DELETE
SELECT *
FROM View_Auditoria
WHERE OPERACAO = 'DELETE';
