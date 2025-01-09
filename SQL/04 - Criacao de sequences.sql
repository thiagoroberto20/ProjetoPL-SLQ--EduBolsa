/*As sequences garantem geração automática e controlada de valores únicos para colunas de ID.*/

-- Sequence para gerar IDs na tabela Instituicao
CREATE SEQUENCE SEQ_INSTITUICAO START WITH 1 INCREMENT BY 1;

-- Sequence para gerar IDs na tabela Curso
CREATE SEQUENCE SEQ_CURSO START WITH 1 INCREMENT BY 1;

-- Sequence para gerar IDs na tabela Aluno
CREATE SEQUENCE SEQ_ALUNO START WITH 1 INCREMENT BY 1;

-- Sequence para gerar IDs na tabela Bolsa
CREATE SEQUENCE SEQ_BOLSA START WITH 1 INCREMENT BY 1;

-- Sequence para gerar IDs na tabela Selecao
CREATE SEQUENCE SEQ_SELECAO START WITH 1 INCREMENT BY 1;

-- Sequence para gerar IDs na tabela Desempenho
CREATE SEQUENCE SEQ_DESEMPENHO START WITH 1 INCREMENT BY 1;
