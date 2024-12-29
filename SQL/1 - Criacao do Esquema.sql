/*Criação do Esquema*/


-- Criação do esquema para EDUBOLSA
CREATE USER EDUBOLSA IDENTIFIED BY senha_segura;

-- Concedendo permissões básicas ao esquema
GRANT CONNECT, RESOURCE TO EDUBOLSA;

-- Permissão para criar tabelas, índices e sequences
GRANT CREATE TABLE, CREATE SEQUENCE TO EDUBOLSA;
```