-- =====================================
-- Arquivo: banco_educadados.sql
-- Objetivo: Criar todas as tabelas do projeto Educadados (fase 3)
-- =====================================

-- Tabela Aluno
CREATE TABLE Aluno (
    idAluno SERIAL PRIMARY KEY,      -- identificador único do aluno
    nome VARCHAR(100) NOT NULL,
    idade INT,
    turma VARCHAR(50),
    frequencia DECIMAL(5,2),        -- frequência em %
    mediaNotas DECIMAL(5,2),
    riscoEvasao BOOLEAN              -- verdadeiro se há risco
);

-- Tabela RegistroFrequencia
CREATE TABLE RegistroFrequencia (
    idRegistro SERIAL PRIMARY KEY,
    idAluno INT NOT NULL,
    data DATE NOT NULL,              -- data da presença/ausência
    presente BOOLEAN,                -- TRUE se presente, FALSE se ausente
    FOREIGN KEY (idAluno) REFERENCES Aluno(idAluno)
);

-- Tabela Alerta
CREATE TABLE Alerta (
    idAlerta SERIAL PRIMARY KEY,
    idAluno INT NOT NULL,
    tipo VARCHAR(50),                -- tipo de alerta (ex: falta, nota baixa)
    dataGeracao DATE,                -- data que o alerta foi gerado
    FOREIGN KEY (idAluno) REFERENCES Aluno(idAluno)
);

-- Tabela Professor
CREATE TABLE Professor (
    idProfessor SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    disciplina VARCHAR(50),
    email VARCHAR(100)
);

-- Tabela Nota
CREATE TABLE Nota (
    idNota SERIAL PRIMARY KEY,
    idAluno INT NOT NULL,
    disciplina VARCHAR(50),
    valor DECIMAL(5,2),
    FOREIGN KEY (idAluno) REFERENCES Aluno(idAluno)
);
