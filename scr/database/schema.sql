-- ================================================
-- TABELAS DE ESTRUTURA ORGANIZACIONAL
-- ================================================
-- Tabela de prédios físicos do campus
CREATE TABLE
    IF NOT EXISTS Predio (
        id INT PRIMARY KEY, -- Identificador único do prédio
        nome VARCHAR(100), -- Nome do prédio
        local VARCHAR(100) -- Localização do prédio
    );

-- Tabela de departamentos vinculados aos prédios
CREATE TABLE
    IF NOT EXISTS Departamento (
        id INT PRIMARY KEY, -- Identificador único do departamento
        nome VARCHAR(100), -- Nome do departamento
        id_predio INT, -- Chave estrangeira para o prédio onde o departamento está localizado
        FOREIGN KEY (id_predio) REFERENCES Predio (id) ON DELETE CASCADE
    );

-- Tabela de cursos oferecidos pelos departamentos
CREATE TABLE
    IF NOT EXISTS Curso (
        id INT PRIMARY KEY, -- Identificador único do curso
        nome VARCHAR(100), -- Nome do curso
        id_departamento INT, -- Chave estrangeira para o departamento que oferece o curso
        FOREIGN KEY (id_departamento) REFERENCES Departamento (id) ON DELETE CASCADE
    );

-- ================================================
-- TABELAS DE USUÁRIOS
-- ================================================
-- Tabela geral de usuários do sistema
CREATE TABLE
    IF NOT EXISTS Usuario (
        cpf BIGINT PRIMARY KEY, -- CPF como identificador único
        nome VARCHAR(100) NOT NULL, -- Nome do usuário
        email VARCHAR(100) UNIQUE, -- E-mail do usuário (único)
        senha VARCHAR(100) NOT NULL -- Senha de acesso
    );

-- Tabela de funcionários vinculados a usuários
CREATE TABLE
    IF NOT EXISTS Funcionario (
        matricula INT PRIMARY KEY, -- Matrícula do funcionário
        cpf BIGINT, -- CPF do usuário correspondente
        FOREIGN KEY (cpf) REFERENCES Usuario (cpf) ON DELETE CASCADE
    );

-- Tabela de docentes com vínculo departamental
CREATE TABLE
    IF NOT EXISTS Docente (
        matricula INT PRIMARY KEY, -- Matrícula do docente
        cpf BIGINT NOT NULL UNIQUE, -- CPF do usuário correspondente
        id_departamento INT NOT NULL, -- Departamento ao qual o docente pertence
        FOREIGN KEY (cpf) REFERENCES Usuario (cpf) ON DELETE CASCADE,
        FOREIGN KEY (id_departamento) REFERENCES Departamento (id) ON DELETE CASCADE
    );

-- Tabela de dicentes (alunos) vinculados a cursos
CREATE TABLE
    IF NOT EXISTS Discente (
        matricula INT PRIMARY KEY, -- Matrícula do aluno
        data_de_inicio DATE NOT NULL, -- Data de início do curso
        data_de_termino DATE, -- Data de término (pode ser NULL)
        id_curso INT, -- Curso ao qual o aluno pertence
        cpf BIGINT NOT NULL, -- CPF do usuário correspondente
        FOREIGN KEY (id_curso) REFERENCES Curso (id) ON DELETE CASCADE,
        FOREIGN KEY (cpf) REFERENCES Usuario (cpf) ON DELETE CASCADE
    );

-- ================================================
-- TABELAS DE INFRAESTRUTURA FÍSICA
-- ================================================
-- Tabela de salas físicas
CREATE TABLE
    IF NOT EXISTS Sala (
        id INT PRIMARY KEY, -- Identificador da sala
        nome VARCHAR(100), -- Nome ou número da sala
        foto_binaria BYTEA, -- Imagem ou planta da sala (formato binário)
        id_predio INT, -- Prédio onde a sala está localizada
        FOREIGN KEY (id_predio) REFERENCES Predio (id) ON DELETE CASCADE
    );

-- Tabela de tipos de equipamento (ex: computador, projetor)
CREATE TABLE
    IF NOT EXISTS TipoEquipamento (
        id INT PRIMARY KEY, -- Identificador do tipo
        descricao VARCHAR(100) -- Descrição do tipo
    );

-- Tabela de status de equipamentos (ativo, em manutenção, etc.)
CREATE TABLE
    IF NOT EXISTS StatusEquipamento (
        id INT PRIMARY KEY, -- Identificador do status
        descricao VARCHAR(100) -- Descrição do status
    );

-- Tabela principal de equipamentos
CREATE TABLE
    IF NOT EXISTS Equipamento (
        id INT PRIMARY KEY, -- Código do equipamento
        data_aquisicao DATE, -- Data da aquisição do equipamento
        fabricante VARCHAR(100), -- Nome do fabricante
        id_tipo INT, -- Tipo do equipamento
        id_status INT, -- Status atual do equipamento
        id_sala INT, -- Sala onde o equipamento está instalado
        FOREIGN KEY (id_tipo) REFERENCES TipoEquipamento (id) ON DELETE CASCADE,
        FOREIGN KEY (id_status) REFERENCES StatusEquipamento (id) ON DELETE CASCADE,
        FOREIGN KEY (id_sala) REFERENCES Sala (id) ON DELETE CASCADE
    );

-- ================================================
-- TABELAS DE OCORRÊNCIAS E MANUTENÇÃO
-- ================================================
-- Tabela de ocorrências de problemas com equipamentos
CREATE TABLE
    IF NOT EXISTS Ocorrencia (
        id INT PRIMARY KEY, -- Identificador da ocorrência
        problema VARCHAR(255), -- Descrição do problema
        data_abertura DATE, -- Data de abertura da ocorrência
        data_fechamento DATE, -- Data de fechamento (pode ser NULL)
        id_usuario BIGINT NOT NULL, -- Usuário que reportou o problema
        FOREIGN KEY (id_usuario) REFERENCES Usuario (cpf) ON DELETE CASCADE
    );

-- Tabela de registros de manutenção dos equipamentos
CREATE TABLE
    IF NOT EXISTS Manutencao (
        id INT PRIMARY KEY, -- Identificador da manutenção
        servico VARCHAR(255), -- Descrição do serviço realizado
        data DATE, -- Data da manutenção
        id_equipamento INT, -- Equipamento que foi mantido
        id_ocorrencia INT, -- Ocorrência associada
        id_funcionario INT, -- Funcionário responsável
        FOREIGN KEY (id_equipamento) REFERENCES Equipamento (id) ON DELETE CASCADE,
        FOREIGN KEY (id_ocorrencia) REFERENCES Ocorrencia (id) ON DELETE CASCADE,
        FOREIGN KEY (id_funcionario) REFERENCES Funcionario (matricula) ON DELETE CASCADE
    );