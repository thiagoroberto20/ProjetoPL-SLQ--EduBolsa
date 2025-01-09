/*Os índices melhoram o desempenho de consultas em colunas usadas frequentemente em filtros, joins ou ordenações.*/

-- Índices para melhorar a performance em buscas específicas

-- Índice para busca de alunos pelo CPF
CREATE UNIQUE INDEX "EDUBOLSA"."IDX_ALUNO_CPF" ON "EDUBOLSA"."ALUNO"("CPF");

-- Índice para consulta de cursos por nome
CREATE UNIQUE INDEX "EDUBOLSA"."IDX_CURSO_NOME" ON "EDUBOLSA"."CURSO" ("NOME");

-- Índice para consulta de bolsas por status
CREATE UNIQUE INDEX "EDUBOLSA"."IDX_BOLSA_STATUS" ON "EDUBOLSA"."BOLSA"("STATUS");

-- Índice composto para busca por aluno e ano de inscrição na seleção
CREATE UNIQUE INDEX "EDUBOLSA"."IDX_SELECAO_ALUNO_ANO" ON "EDUBOLSA"."SELECAO"("ID_ALUNO", "ANO_INSCRICAO");

-- Índice para desempenho por aluno e curso
CREATE UNIQUE INDEX "EDUBOLSA"."IDX_DESEMPENHO_ALUNO_CURSO" ON "EDUBOLSA"."DESEMPENHO"("ID_ALUNO", "ID_CURSO");
