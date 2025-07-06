-- ================================================
-- TABELAS DE ESTRUTURA ORGANIZACIONAL
-- ================================================
-- Tabela de prédios físicos do campus
CREATE TABLE
    IF NOT EXISTS Predio (
        id INTEGER PRIMARY KEY AUTOINCREMENT, -- Identificador único do prédio
        nome VARCHAR(100), -- Nome do prédio
        local VARCHAR(100) -- Localização do prédio
    );

-- Tabela de departamentos vinculados aos prédios
CREATE TABLE
    IF NOT EXISTS Departamento (
        id INTEGER PRIMARY KEY AUTOINCREMENT, -- Identificador único do departamento
        nome VARCHAR(100), -- Nome do departamento
        id_predio INT, -- Chave estrangeira para o prédio onde o departamento está localizado
        FOREIGN KEY (id_predio) REFERENCES Predio (id) ON DELETE CASCADE
    );

-- Tabela de cursos oferecidos pelos departamentos
CREATE TABLE
    IF NOT EXISTS Curso (
        id INTEGER PRIMARY KEY AUTOINCREMENT, -- Identificador único do curso
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
        id INTEGER PRIMARY KEY AUTOINCREMENT, -- Identificador da sala
        nome VARCHAR(100), -- Nome ou número da sala
        id_predio INT, -- Prédio onde a sala está localizada
        FOREIGN KEY (id_predio) REFERENCES Predio (id) ON DELETE CASCADE
    );

-- Tabela de tipos de equipamento (ex: computador, projetor)
CREATE TABLE
    IF NOT EXISTS TipoEquipamento (
        id INTEGER PRIMARY KEY AUTOINCREMENT, -- Identificador do tipo
        descricao VARCHAR(100) -- Descrição do tipo
    );

-- Tabela de status de equipamentos (ativo, em manutenção, etc.)
CREATE TABLE
    IF NOT EXISTS StatusEquipamento (
        id INTEGER PRIMARY KEY AUTOINCREMENT, -- Identificador do status
        descricao VARCHAR(100) -- Descrição do status
    );

-- Tabela principal de equipamentos
CREATE TABLE
    IF NOT EXISTS Equipamento (
        id INTEGER PRIMARY KEY AUTOINCREMENT, -- Código do equipamento
        data_aquisicao DATE, -- Data da aquisição do equipamento
        fabricante VARCHAR(100), -- Nome do fabricante
        id_tipo INT, -- Tipo do equipamento
        id_status INT, -- Status atual do equipamento
        id_sala INT, -- Sala onde o equipamento está instalado
        foto_binaria BYTEA, -- Imagem do equipamento
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
        id INTEGER PRIMARY KEY AUTOINCREMENT, -- Identificador da ocorrência
        problema VARCHAR(255), -- Descrição do problema
        data_abertura DATE, -- Data de abertura da ocorrência
        data_fechamento DATE, -- Data de fechamento (pode ser NULL)
        id_usuario BIGINT NOT NULL, -- Usuário que reportou o problema
        FOREIGN KEY (id_usuario) REFERENCES Usuario (cpf) ON DELETE CASCADE
    );

-- Tabela de registros de manutenção dos equipamentos
CREATE TABLE
    IF NOT EXISTS Manutencao (
        id INTEGER PRIMARY KEY AUTOINCREMENT, -- Identificador da manutenção
        servico VARCHAR(255), -- Descrição do serviço realizado
        data DATE, -- Data da manutenção
        id_equipamento INT, -- Equipamento que foi mantido
        id_ocorrencia INT, -- Ocorrência associada
        id_funcionario INT, -- Funcionário responsável
        FOREIGN KEY (id_equipamento) REFERENCES Equipamento (id) ON DELETE CASCADE,
        FOREIGN KEY (id_ocorrencia) REFERENCES Ocorrencia (id) ON DELETE CASCADE,
        FOREIGN KEY (id_funcionario) REFERENCES Funcionario (matricula) ON DELETE CASCADE
    );

-- ========================
-- 1. Prédios
-- ========================
INSERT INTO Predio (nome, local) VALUES 
('Prédio A', 'Bloco Norte'),
('Prédio B', 'Bloco Sul'),
('Prédio C', 'Centro'),
('Prédio D', 'Anexo Leste'),
('Prédio E', 'Campus Avançado');

-- ========================
-- 2. Departamentos
-- ========================
INSERT INTO Departamento (nome, id_predio) VALUES 
('Departamento de Computação', 1),
('Departamento de Matemática', 2),
('Departamento de Física', 3),
('Departamento de Química', 4),
('Departamento de Letras', 5);

-- ========================
-- 3. Cursos
-- ========================
INSERT INTO Curso (nome, id_departamento) VALUES 
('Engenharia de Software', 1),
('Matemática Aplicada', 2),
('Física Médica', 3),
('Química Industrial', 4),
('Letras - Português', 5);

-- ========================
-- 4. Usuários
-- ========================
INSERT INTO Usuario (cpf, nome, email, senha) VALUES 
(11111111111, 'Ana Silva', 'ana@exemplo.com', 'senha123'),
(22222222222, 'Bruno Souza', 'bruno@exemplo.com', 'senha123'),
(33333333333, 'Carla Mendes', 'carla@exemplo.com', 'senha123'),
(44444444444, 'Diego Lima', 'diego@exemplo.com', 'senha123'),
(55555555555, 'Eduarda Costa', 'eduarda@exemplo.com', 'senha123');

-- ========================
-- 5. Funcionários
-- ========================
INSERT INTO Funcionario (matricula, cpf) VALUES 
(1001, 11111111111),
(1002, 22222222222),
(1003, 33333333333),
(1004, 44444444444),
(1005, 55555555555);

-- ========================
-- 6. Docentes
-- ========================
INSERT INTO Docente (matricula, cpf, id_departamento) VALUES 
(1001, 11111111111, 1),
(1002, 22222222222, 2),
(1003, 33333333333, 3),
(1004, 44444444444, 4),
(1005, 55555555555, 5);

-- ========================
-- 7. Discentes
-- ========================
INSERT INTO Discente (matricula, data_de_inicio, data_de_termino, id_curso, cpf) VALUES 
(2001, '2022-01-15', NULL, 1, 11111111111),
(2002, '2022-01-15', NULL, 2, 22222222222),
(2003, '2022-01-15', NULL, 3, 33333333333),
(2004, '2022-01-15', NULL, 4, 44444444444),
(2005, '2022-01-15', NULL, 5, 55555555555);

-- ========================
-- 8. Salas
-- ========================
INSERT INTO Sala (id, nome, id_predio) VALUES 
(1, 'Sala 101', 1),
(2, 'Sala 202', 2),
(3, 'Laboratório Físico', 3),
(4, 'Sala Química', 4),
(5, 'Sala Letras', 5);

-- ========================
-- 9. TipoEquipamento
-- ========================
INSERT INTO TipoEquipamento (id, descricao) VALUES 
(1, 'Computador'),
(2, 'Projetor'),
(3, 'Impressora'),
(4, 'Scanner'),
(5, 'Roteador');

-- ========================
-- 10. StatusEquipamento
-- ========================
INSERT INTO StatusEquipamento (id, descricao) VALUES 
(1, 'Ativo'),
(2, 'Em manutenção'),
(3, 'Inativo'),
(4, 'Reservado'),
(5, 'Substituído');

-- ========================
-- 11. Equipamentos
-- ========================
INSERT INTO Equipamento (id, data_aquisicao, fabricante, id_tipo, id_status, id_sala, foto_binaria) VALUES 
(1, '2020-06-01', 'Dell', 1, 1, 1, NULL),
(2, '2019-08-20', 'Epson', 2, 2, 2, NULL),
(3, '2021-01-15', 'HP', 3, 1, 3, NULL),
(4, '2023-02-10', 'Canon', 4, 1, 4, NULL),
(5, '2022-11-05', 'TP-Link', 5, 1, 5, NULL);

-- ========================
-- 12. Ocorrências
-- ========================
INSERT INTO Ocorrencia (problema, data_abertura, data_fechamento, id_usuario) VALUES 
('Monitor não liga', '2024-01-10', NULL, 11111111111),
('Projetor com imagem borrada', '2024-02-12', '2024-03-01', 22222222222),
('Impressora travando papel', '2024-03-05', NULL, 33333333333),
('Scanner não reconhecido', '2024-04-01', NULL, 44444444444),
('Roteador sem sinal', '2024-05-20', NULL, 55555555555);

-- ========================
-- 13. Manutenções
-- ========================
INSERT INTO Manutencao (servico, data, id_equipamento, id_ocorrencia, id_funcionario) VALUES 
('Substituição da fonte do monitor', '2024-01-15', 1, 1, 1001),
('Limpeza da lente do projetor', '2024-03-01', 2, 2, 1002),
('Troca de roletes da impressora', '2024-03-10', 3, 3, 1003),
('Atualização de driver do scanner', '2024-04-05', 4, 4, 1004),
('Reset de fábrica do roteador', '2024-05-25', 5, 5, 1005);
