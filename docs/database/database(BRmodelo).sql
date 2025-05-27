CREATE TABLE equipamento 
( 
 id INT PRIMARY KEY AUTO_INCREMENT,  
 data_aquisicao DATE NOT NULL,  
 fabricante VARCHAR(n) NOT NULL,  
 id_tipo_equipamento INT NOT NULL,  
 id_status_equipamento INT NOT NULL,  
 id_sala INT NOT NULL,  
 Descrição VARCHAR(n) NOT NULL,  
); 

CREATE TABLE tipo_equipamento 
( 
 id INT PRIMARY KEY AUTO_INCREMENT,  
 descricao VARCHAR(n) NOT NULL,  
); 

CREATE TABLE status_equipamento 
( 
 descricao VARCHAR(n) NOT NULL,  
 id INT PRIMARY KEY AUTO_INCREMENT,  
); 

CREATE TABLE ocorrencia 
( 
 problema VARCHAR(n) NOT NULL,  
 data_fechamento DATE,  
 codigo INT PRIMARY KEY AUTO_INCREMENT,  
 data_abertura DATE NOT NULL,  
 cpf_usuario CHAR(n) NOT NULL,  
); 

CREATE TABLE sala 
( 
 codigo INT PRIMARY KEY,  
 nome INT,  
 foto_binária INT,  
 id_predio INT,  
); 

CREATE TABLE predio 
( 
 nome VARCHAR(n) NOT NULL,  
 id INT PRIMARY KEY,  
 local VARCHAR(n) NOT NULL,  
); 

CREATE TABLE usuario 
( 
 nome VARCHAR(n) NOT NULL,  
 email VARCHAR(n) NOT NULL,  
 senha VARCHAR(n) NOT NULL,  
 cpf CHAR(n) PRIMARY KEY,  
 UNIQUE (email)
); 

CREATE TABLE manutencao 
( 
 id INT PRIMARY KEY AUTO_INCREMENT,  
 servico VARCHAR(n) NOT NULL,  
 data INT NOT NULL,  
 id_equipamento INT PRIMARY KEY,  
 cpf_funcionario CHAR(n) PRIMARY KEY NOT NULL,  
 id_ocorrencia INT PRIMARY KEY,  
); 

CREATE TABLE docentes 
( 
 area VARCHAR(n) NOT NULL,  
 cpf_usuario CHAR(n) PRIMARY KEY,  
); 

CREATE TABLE funcionario 
( 
 cargo VARCHAR(n) NOT NULL,  
 cpf_usuario CHAR(n) PRIMARY KEY,  
); 

ALTER TABLE equipamento ADD FOREIGN KEY(id_tipo_equipamento) REFERENCES tipo_equipamento (id_tipo_equipamento)
ALTER TABLE equipamento ADD FOREIGN KEY(id_status_equipamento) REFERENCES status_equipamento (id_status_equipamento)
ALTER TABLE equipamento ADD FOREIGN KEY(id_sala) REFERENCES sala (id_sala)
ALTER TABLE ocorrencia ADD FOREIGN KEY(cpf_usuario) REFERENCES usuario (cpf_usuario)
ALTER TABLE sala ADD FOREIGN KEY(id_predio) REFERENCES predio (id_predio)
ALTER TABLE manutencao ADD FOREIGN KEY(id_equipamento) REFERENCES equipamento (id_equipamento)
ALTER TABLE manutencao ADD FOREIGN KEY(cpf_funcionario) REFERENCES funcionario (cpf_funcionario)
ALTER TABLE manutencao ADD FOREIGN KEY(id_ocorrencia) REFERENCES ocorrencia (id_ocorrencia)
ALTER TABLE docentes ADD FOREIGN KEY(cpf_usuario) REFERENCES usuario (cpf_usuario)
ALTER TABLE funcionario ADD FOREIGN KEY(cpf_usuario) REFERENCES usuario (cpf_usuario)
