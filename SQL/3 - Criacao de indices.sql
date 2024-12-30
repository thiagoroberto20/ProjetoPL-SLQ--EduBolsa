/*Os índices melhoram o desempenho de consultas em colunas usadas frequentemente em filtros, joins ou ordenações.*/

-- Índices para melhorar a performance em buscas específicas

-- Índice para busca de alunos pelo CPF
CREATE INDEX IDX_ALUNO_CPF ON Aluno(CPF);

-- Índice para consulta de cursos por nome
CREATE INDEX IDX_CURSO_NOME ON Curso(NOME);

-- Índice para consulta de bolsas por status
CREATE INDEX IDX_BOLSA_STATUS ON Bolsa(STATUS);

-- Índice composto para busca por aluno e ano de inscrição na seleção
CREATE INDEX IDX_SELECAO_ALUNO_ANO ON Selecao(ID_ALUNO, ANO_INSCRICAO);

-- Índice para desempenho por aluno e curso
CREATE INDEX IDX_DESEMPENHO_ALUNO_CURSO ON Desempenho(ID_ALUNO, ID_CURSO);
