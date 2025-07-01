-- TABELAS DE APOIO BÁSICO
CREATE TABLE IF NOT EXISTS nivel (
    id INT PRIMARY KEY,
    descricao VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS area_pesquisa (
    id INT PRIMARY KEY,
    descricao VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS area_trabalho (
    id INT PRIMARY KEY,
    nome VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS predio (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    local VARCHAR(255)
);

-- TABELAS DE ESTRUTURA FÍSICA
CREATE TABLE IF NOT EXISTS sala (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    foto_binaria BYTEA,
    id_predio INT,
    FOREIGN KEY (id_predio) REFERENCES predio(id)
);

-- TABELAS DE EQUIPAMENTO
CREATE TABLE IF NOT EXISTS tipo_equipamento (
    id INT PRIMARY KEY,
    descricao VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS status_equipamento (
    id INT PRIMARY KEY,
    descricao VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS equipamento (
    id INT PRIMARY KEY,
    data_aquisicao DATE,
    fabricante VARCHAR(255),
    id_tipo_equipamento INT,
    id_status_equipamento INT,
    id_sala INT,
    FOREIGN KEY (id_tipo_equipamento) REFERENCES tipo_equipamento(id),
    FOREIGN KEY (id_status_equipamento) REFERENCES status_equipamento(id),
    FOREIGN KEY (id_sala) REFERENCES sala(id)
);

-- TABELAS DE USUÁRIO
CREATE TABLE IF NOT EXISTS usuario (
    cpf VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    senha VARCHAR(255) NOT NULL
);

-- TABELAS DE FUNCIONÁRIOS E DOCENTES
CREATE TABLE IF NOT EXISTS funcionario (
    matricula INT PRIMARY KEY,
    cpf VARCHAR(11),
    id_area_trabalho INT,
    FOREIGN KEY (cpf) REFERENCES usuario(cpf),
    FOREIGN KEY (id_area_trabalho) REFERENCES area_trabalho(id)
);

CREATE TABLE IF NOT EXISTS docente (
    matricula INT PRIMARY KEY,
    cpf VARCHAR(11) NOT NULL,
    FOREIGN KEY (cpf) REFERENCES usuario(cpf),
    FOREIGN KEY (matricula) REFERENCES funcionario(matricula)
);

-- TABELAS DE CURSO
CREATE TABLE IF NOT EXISTS departamento (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    id_predio INT,
    FOREIGN KEY (id_predio) REFERENCES predio(id)
);

CREATE TABLE IF NOT EXISTS curso (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    id_departamento INT,
    id_nivel INT,
    FOREIGN KEY (id_departamento) REFERENCES departamento(id),
    FOREIGN KEY (id_nivel) REFERENCES nivel(id)
);

CREATE TABLE IF NOT EXISTS curso_externo (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    faculdade VARCHAR(255),
    id_nivel INT,
    FOREIGN KEY (id_nivel) REFERENCES nivel(id)
);

-- TABELAS DE RELACIONAMENTO COM CURSO
CREATE TABLE IF NOT EXISTS fez (
    id INT PRIMARY KEY,
    id_curso_externo INT,
    matricula_docente INT,
    data_inicio DATE,
    data_termino DATE,
    FOREIGN KEY (id_curso_externo) REFERENCES curso_externo(id),
    FOREIGN KEY (matricula_docente) REFERENCES docente(matricula)
);

CREATE TABLE IF NOT EXISTS dicente (
    matricula INT PRIMARY KEY,
    data_de_inicio DATE NOT NULL,
    data_de_termino DATE,
    id_curso INT,
    cpf VARCHAR(11) NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES curso(id),
    FOREIGN KEY (cpf) REFERENCES usuario(cpf)
);

-- TABELAS DE PESQUISA
CREATE TABLE IF NOT EXISTS pesquisa (
    id INT PRIMARY KEY,
    id_area_pesquisa INT,
    matricula_docente INT,
    FOREIGN KEY (id_area_pesquisa) REFERENCES area_pesquisa(id),
    FOREIGN KEY (matricula_docente) REFERENCES docente(matricula)
);

-- TABELAS DE MANUTENÇÃO E OCORRÊNCIAS
CREATE TABLE IF NOT EXISTS ocorrencia (
    id INT PRIMARY KEY,
    problema TEXT,
    data_abertura DATE,
    data_fechamento DATE,
    id_usuario VARCHAR(11) NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(cpf)
);

CREATE TABLE IF NOT EXISTS manutencao (
    id INT PRIMARY KEY,
    servico TEXT,
    data DATE,
    id_equipamento INT,
    id_ocorrencia INT,
    id_funcionario INT,
    FOREIGN KEY (id_equipamento) REFERENCES equipamento(id),
    FOREIGN KEY (id_ocorrencia) REFERENCES ocorrencia(id),
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(matricula)
);
