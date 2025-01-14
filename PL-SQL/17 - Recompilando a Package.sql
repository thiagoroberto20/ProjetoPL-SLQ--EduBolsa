--  Recompilando Package Specification
ALTER PACKAGE EDUBOLSA.PKG_GESTAO_ALUNO COMPILE SPECIFICATION;


-- Recompilando Package Body
ALTER PACKAGE EDUBOLSA.PKG_GESTAO_ALUNO COMPILE BODY;


-- Removendo Package Body do Banco de Dados
DROP PACKAGE BODY EDUBOLSA.PKG_GESTAO_ALUNO;


-- Removendo Package Body e o Package Specification
DROP PACKAGE EDUBOLSA.PKG_GESTAO_ALUNO;


-- 9. Recriando o Package Specification

CREATE OR REPLACE PACKAGE EDUBOLSA.PKG_GESTAO_ALUNO AS
    PROCEDURE Update_Aluno_Renda(p_id_aluno IN NUMBER, p_nova_renda IN NUMBER);
END PKG_GESTAO_ALUNO;
/
