CREATE TABLE equipamento (
  id INT PRIMARY KEY AUTO_INCREMENT,
  data_aquisicao DATE NOT NULL,
  fabricante VARCHAR(100) NOT NULL, -- Ajustado (n)
  id_tipo_equipamento INT NOT NULL,
  id_status_equipamento INT NOT NULL,
  id_sala INT NOT NULL,
  Descricao VARCHAR(255) NOT NULL -- Ajustado (n)
);

CREATE TABLE tipo_equipamento (
  id INT PRIMARY KEY AUTO_INCREMENT,
  descricao VARCHAR(100) NOT NULL -- Ajustado (n)
);

CREATE TABLE status_equipamento (
  descricao VARCHAR(100) NOT NULL, -- Ajustado (n)
  id INT PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE ocorrencia (
  problema VARCHAR(500) NOT NULL, -- Ajustado (n) para permitir mais texto
  data_fechamento DATE,
  codigo INT PRIMARY KEY AUTO_INCREMENT,
  data_abertura DATE NOT NULL,
  cpf_usuario VARCHAR(14) NOT NULL -- CORRIGIDO: Para corresponder a usuario.cpf
);

CREATE TABLE sala (
  codigo INT PRIMARY KEY,
  nome VARCHAR(100), -- CORRIGIDO: Nome de sala deve ser texto
  foto_binaria BLOB, -- CORRIGIDO: Para armazenar dados binários. Se for um caminho/URL, use VARCHAR(255)
  id_predio INT
);

CREATE TABLE predio (
  nome VARCHAR(100) NOT NULL, -- Ajustado (n)
  id INT PRIMARY KEY,
  local VARCHAR(255) NOT NULL -- Ajustado (n)
);

CREATE TABLE usuario (
  nome VARCHAR(100) NOT NULL, -- Ajustado (n)
  email VARCHAR(100) NOT NULL, -- Ajustado (n)
  senha VARCHAR(255) NOT NULL, -- Ajustado (n) - Lembre-se de armazenar HASH da senha
  cpf VARCHAR(14) PRIMARY KEY, -- CORRIGIDO: CPF é melhor como VARCHAR para incluir zeros à esquerda e formatação
  UNIQUE (email)
);

CREATE TABLE manutencao (
  id INT PRIMARY KEY AUTO_INCREMENT,
  servico VARCHAR(500) NOT NULL, -- Ajustado (n) para permitir mais texto
  data DATE NOT NULL, -- OK!
  id_equipamento INT NOT NULL,
  cpf_funcionario VARCHAR(14) NOT NULL, -- CORRIGIDO: Para corresponder a funcionario.cpf_usuario -> usuario.cpf
  id_ocorrencia INT -- Alterado para permitir NULL, pois uma manutenção pode não estar ligada a uma ocorrência (ex: preventiva). Se for sempre obrigatória, use NOT NULL.
);

CREATE TABLE docentes (
  area VARCHAR(100) NOT NULL, -- Ajustado (n)
  cpf_usuario VARCHAR(14) PRIMARY KEY -- CORRIGIDO: Para corresponder a usuario.cpf
);

CREATE TABLE funcionario (
  cargo VARCHAR(100) NOT NULL, -- Ajustado (n)
  cpf_usuario VARCHAR(14) PRIMARY KEY -- CORRIGIDO: Para corresponder a usuario.cpf
);

-- Equipamento FKs
ALTER TABLE equipamento ADD FOREIGN KEY(id_tipo_equipamento) REFERENCES tipo_equipamento(id);
ALTER TABLE equipamento ADD FOREIGN KEY(id_status_equipamento) REFERENCES status_equipamento(id);
ALTER TABLE equipamento ADD FOREIGN KEY(id_sala) REFERENCES sala(Codigo); -- 'Codigo' é a PK de sala

-- Ocorrencia FK
ALTER TABLE ocorrencia ADD FOREIGN KEY(cpf_usuario) REFERENCES usuario(cpf); -- 'cpf' é a PK de usuario

-- Sala FK
ALTER TABLE sala ADD FOREIGN KEY(idPrédio) REFERENCES predio(id); -- 'id' é a PK de predio

-- Manutencao FKs
ALTER TABLE manutencao ADD FOREIGN KEY(id_equipamento) REFERENCES equipamento(id); -- 'id' é a PK de equipamento
ALTER TABLE manutencao ADD FOREIGN KEY(cpf_funcionario) REFERENCES funcionario(cpf_usuario); -- 'cpf_usuario' é a PK de funcionario
ALTER TABLE manutencao ADD FOREIGN KEY(id_ocorrencia) REFERENCES ocorrencia(codigo); -- 'codigo' é a PK de ocorrencia

-- Docentes FK
ALTER TABLE docentes ADD FOREIGN KEY(cpf_usuario) REFERENCES usuario(cpf); -- 'cpf' é a PK de usuario

-- Funcionario FK
ALTER TABLE funcionario ADD FOREIGN KEY(cpf_usuario) REFERENCES usuario(cpf); -- 'cpf' é a PK de usuario