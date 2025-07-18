-- 1. Prédios
INSERT INTO Predio (nome, local) VALUES 
('Prédio A', 'Bloco Norte'),
('Prédio B', 'Bloco Sul'),
('Prédio C', 'Centro'),
('Prédio D', 'Anexo Leste'),
('Prédio E', 'Campus Avançado');

-- 2. Departamentos
INSERT INTO Departamento (nome, id_predio) VALUES 
('ADM - DEPTO ADMINISTRAÇÃO', 5),
('CCA - DEPTO CIÊNCIAS CONTÁBEIS ATUARIAIS', 4),
('CEN - DEPTO ARTES CÊNICAS', 2),
('CET - CENTRO DE EXCELÊNCIA EM TURISMO', 4),
('CIC - DEPTO CIÊNCIAS DA COMPUTAÇÃO', 4),
('DAN - DEPTO ANTROPOLOGIA', 2),
('DIN - DEPARTAMENTO DE DESIGN (11.01.01.14.04)', 5),
('DSC - DEPTO SAUDE COLETIVA', 1),
('ECO - DEPTO ECONOMIA', 3),
('EFL - DEPTO ENGENHARIA FLORESTAL', 4),
('ELA - DEPARTAMENTO DE ESTUDOS LATINO AMERICANO', 2),
('ENC - DEPTO ENGENHARIA CIVIL E AMBIENTAL', 1),
('ENE - DEPTO ENGENHARIA ELETRICA', 3),
('ENF - DEPTO ENFERMAGEM', 2),
('ENM - DEPARTAMENTO DE ENGENHARIA MECANICA', 4),
('EPR - DEPTO ENGENHARIA DE PRODUCAO', 2),
('EST - DEPTO ESTATÍSTICA', 5),
('FAC/COM - DEPARTAMENTO DE COMUNICAÇÃO ORGANIZACIONAL/COM', 1),
('FAC/DAP - DEPARTAMENTO DE AUDIOVISUAIS E PUBLICIDADE/DAP', 3),
('FAC/JOR - DEPARTAMENTO DE JORNALISMO/JOR', 2),
('FAU - FACULDADE DE ARQUITETURA E URBANISMO', 4),
('FAV - FACULDADE DE AGRONOMIA E MEDICINA VETERINÁRIA', 5),
('FCI - FACULDADE DE CIÊNCIA DA INFORMAÇÃO', 1),
('FCS - FACULDADE DE CIÊNCIAS DA SAÚDE', 3),
('FCTE - CAMPUS UNB GAMA: FACULDADE DE CIÊNCIAS E TECNOLOGIAS EM ENGENHARIA', 2),
('FCTS - CAMPUS UNB CEILÂNDIA: FACULDADE DE CIENCIAS E TECNOLOGIAS EM SAÚDE', 3),
('FDD - FACULDADE DE DIREITO', 5),
('FED - FACULDADE DE EDUCAÇÃO', 1),
('FEF - FACULDADE DE EDUCAÇÃO FÍSICA', 4),
('FIL - DEPTO FILOSOFIA', 2),
('FMD - FACULDADE DE MEDICINA', 1),
('FTD - FACULDADE DE TECNOLOGIA', 3),
('FUP - FACULDADE DE PLANALTINA', 2),
('GEA - DEPTO GEOGRAFIA', 4),
('GPP - DEPARTAMENTO DE GESTAO DE POLITICAS PUBL', 3),
('HIS - DEPTO HISTÓRIA', 2),
('ICB - INSTITUTO DE CIÊNCIAS BIOLÓGICAS', 5),
('ICH - INSTITUTO DE CIÊNCIAS HUMANAS', 1),
('IDA1 - INSTITUTO DE ARTES', 2),
('IFD - INSTITUTO DE FÍSICA', 4),
('IGD - INSTITUTO DE GEOCIÊNCIAS', 2),
('ILD - INSTITUTO DE LETRAS', 5),
('IPD - INSTITUTO DE PSICOLOGIA', 3),
('IPOL - INSTITUTO DE CIÊNCIA POLÍTICA', 4),
('IQD - INSTITUTO DE QUÍMICA', 1),
('IREL - INSTITUTO DE RELAÇÕES INTERNACIONAIS', 5),
('LET - DEPTO LÍNGUAS ESTRANGEIRAS E TRADUÇÃO', 2),
('LIP - DEPTO LINGUISTICA, PORT. LING. CLASSICAS', 5),
('MAT - DEPARTAMENTO DE MATEMÁTICA', 3),
('MUS - DEPTO MÚSICA', 2),
('NUT - DEPTO NUTRICAO', 1),
('ODT - DEPTO ODONTOLOGIA', 4),
('SER - DEPTO SERVIÇO SOCIAL', 3),
('SOL - DEPARTAMENTO DE SOCIOLOGIA', 2),
('VIS - DEPTO ARTES VISUAIS', 5);

-- 3. Cursos
INSERT INTO Curso (nome, id_departamento) VALUES 
('ADMINISTRAÇÃO DIURNO', 1),
('ADMINISTRAÇÃO NOTURNO', 1),
('CIÊNCIAS CONTÁBEIS NOTURNO', 2),
('CIÊNCIAS CONTÁBEIS DIURNO', 2),
('ARTES CÊNICAS LICENCIATURA NOTURNO', 3),
('ARTES CÊNICAS LICENCIATURA DIURNO', 3),
('ARTES CÊNICAS - INTERPRETAÇÃO TEATRAL', 3),
('TURISMO', 4),
('CIÊNCIA DA COMPUTAÇÃO', 5),
('COMPUTAÇÃO', 5),
('ENGENHARIA DE COMPUTAÇÃO', 5),
('CIÊNCIAS SOCIAIS - ANTROPOLOGIA', 6),
('DESENHO INDUSTRIAL - PROGRAMAÇÃO VISUAL', 7),
('DESIGN - PROGRAMAÇÃO VISUAL', 7),
('DESIGN - PROJETO DO PRODUTO', 7),
('SAÚDE COLETIVA', 8),
('CIÊNCIAS ECONÔMICAS', 9),
('ENGENHARIA FLORESTAL', 10),
('CIÊNCIAS SOCIAIS', 11),
('ENGENHARIA AMBIENTAL', 12),
('ENGENHARIA CIVIL', 12),
('ENGENHARIA DE REDES DE COMUNICAÇÃO', 13),
('ENGENHARIA ELÉTRICA', 13),
('ENFERMAGEM', 14),
('ENGENHARIA MECÂNICA', 15),
('ENGENHARIA DE PRODUÇÃO', 16),
('ESTATÍSTICA', 17),
('COMUNICAÇÃO SOCIAL - COMUNICAÇÃO ORGANIZACIONAL', 18),
('COMUNICAÇÃO SOCIAL - AUDIOVISUAL', 19),
('COMUNICAÇÃO SOCIAL - PUBLICIDADE E PROPAGANDA', 19),
('COMUNICAÇÃO SOCIAL - JORNALISMO', 20),
('JORNALISMO', 20),
('ARQUITETURA E URBANISMO NOTURNO', 21),
('ARQUITETURA E URBANISMO DIURNO', 21),
('AGRONOMIA', 22),
('GESTÃO DE AGRONEGÓCIOS', 22),
('MEDICINA VETERINÁRIA', 22),
('ARQUIVOLOGIA', 23),
('BIBLIOTECONOMIA', 23),
('MUSEOLOGIA', 23),
('FARMÁCIA NOTURNO', 24),
('FARMÁCIA DIURNO', 24),
('ENGENHARIA', 25),
('ENGENHARIA AEROESPACIAL', 25),
('ENGENHARIA AUTOMOTIVA', 25),
('ENGENHARIA DE ENERGIA', 25),
('ENGENHARIA DE SOFTWARE', 25),
('ENGENHARIA ELETRÔNICA', 25),
('ENFERMAGEM', 26),
('FARMÁCIA', 26),
('FISIOTERAPIA', 26),
('FONOAUDIOLOGIA', 26),
('SAÚDE COLETIVA', 26),
('TERAPIA OCUPACIONAL', 26),
('DIREITO DIURNO', 27),
('DIREITO NOTURNO', 27),
('PEDAGOGIA LICENCIATURA NOTURNO', 28),
('PEDAGOGIA LICENCIATURA DIURNO', 28),
('EDUCAÇÃO FÍSICA LICENCIATURA', 29),
('EDUCAÇÃO FÍSICA', 29),
('EDUCAÇÃO FÍSICA - CICLO BÁSICO', 29),
('FILOSOFIA LICENCIATURA DIURNO', 30),
('FILOSOFIA', 30),
('FILOSOFIA LICENCIATURA NOTURNO', 30),
('MEDICINA', 31),
('ENGENHARIA MECATRÔNICA - CONTROLE E AUTOMAÇÃO', 32),
('CIÊNCIAS NATURAIS LICENCIATURA NOTURNO', 33),
('CIÊNCIAS NATURAIS LICENCIATURA DIURNO', 33),
('EDUCAÇÃO DO CAMPO - CIÊNCIAS DA NATUREZA', 33),
('EDUCAÇÃO DO CAMPO - CIÊNCIAS DA NATUREZA E MATEMÁTICA', 33),
('EDUCAÇÃO DO CAMPO - LINGUAGENS, ARTES E LITERATURA', 33),
('EDUCAÇÃO DO CAMPO - MATEMÁTICA', 33),
('GESTÃO AMBIENTAL', 33),
('GESTÃO DO AGRONEGÓCIO', 33),
('GEOGRAFIA LICENCIATURA', 34),
('GEOGRAFIA', 34),
('GESTÃO DE POLÍTICAS PÚBLICAS', 35),
('HISTÓRIA LICENCIATURA DIURNO', 36),
('HISTÓRIA LICENCIATURA NOTURNO', 36),
('HISTÓRIA', 36),
('BIOTECNOLOGIA', 37),
('CIÊNCIAS BIOLÓGICAS LICENCIATURA DIURNO', 37),
('CIÊNCIAS BIOLÓGICAS', 37),
('CIÊNCIAS BIOLÓGICAS LICENCIATURA NOTURNO', 37),
('GEOGRAFIA', 38),
('ARTES VISUAIS', 39),
('MÚSICA', 39),
('TEATRO', 39),
('FÍSICA LICENCIATURA DIURNO', 40),
('FÍSICA', 40),
('FÍSICA LICENCIATURA NOTURNO', 40),
('FÍSICA COMPUTACIONAL', 40),
('CIÊNCIAS AMBIENTAIS', 41),
('GEOFÍSICA', 41),
('GEOLOGIA', 41),
('LETRAS - LÍNGUA PORTUGUESA E RESPECTIVA LITERATURA', 42),
('LETRAS - TRADUÇÃO - ESPANHOL', 42),
('PSICOLOGIA PSICOLOGO', 43),
('PSICOLOGIA', 43),
('PSICOLOGIA LICENCIATURA', 43),
('CIÊNCIA POLÍTICA', 44),
('ENGENHARIA QUÍMICA', 45),
('QUÍMICA LICENCIATURA', 45),
('QUÍMICA', 45),
('QUÍMICA TECNOLÓGICA', 45),
('RELAÇÕES INTERNACIONAIS', 46),
('LETRAS - LÍNGUA E LITERATURA JAPONESA', 47),
('LETRAS - LÍNGUA ESPANHOLA E LITERATURA ESPANHOLA E HISPANO-AMERICANA', 47),
('LETRAS - LÍNGUA FRANCESA E RESPECTIVA LITERATURA LICENCIATURA', 47),
('LETRAS - LÍNGUA FRANCESA E RESPECTIVA LITERATURA', 47),
('LETRAS - LÍNGUA INGLESA E RESPECTIVA LITERATURA LICENCIATURA', 47),
('LETRAS - LÍNGUA INGLESA E RESPECTIVA LITERATURA', 47),
('LETRAS - TRADUÇÃO - FRANCÊS', 47),
('LETRAS - TRADUÇÃO - INGLÊS', 47),
('LÍNGUAS ESTRANGEIRAS APLICADAS - MSI', 47),
('LETRAS - LÍNGUA PORTUGUESA E RESPECTIVA LITERATURA', 48),
('LETRAS - LÍNGUA PORTUGUESA E RESPECTIVA LITERATURA LICENCIATURA DIURNO', 48),
('LETRAS - LÍNGUA PORTUGUESA E RESPECTIVA LITERATURA LICENCIATURA NOTURNO', 48),
('LETRAS - PORTUGUÊS DO BRASIL COMO SEGUNDA LÍNGUA', 48),
('LÍNGUA DE SINAIS BRASILEIRA -PORTUGUÊS COMO SEGUNDA LÍNGUA', 48),
('MATEMÁTICA LICENCIATURA DIURNO', 49),
('MATEMÁTICA', 49),
('MATEMÁTICA LICENCIATURA NOTURNO', 49),
('EDUCAÇÃO ARTÍSTICA - MÚSICA', 50),
('MÚSICA DIURNO', 50),
('MÚSICA LICENCIATURA NOTURNO', 50),
('MÚSICA LICENCIATURA DIURNO', 50),
('MÚSICA - CANTO', 50),
('MÚSICA - CLARINETA', 50),
('MÚSICA - COMPOSIÇÃO', 50),
('MÚSICA - CONTRABAIXO', 50),
('MÚSICA - FAGOTE', 50),
('MÚSICA - FLAUTA', 50),
('MÚSICA - OBOÉ', 50),
('MÚSICA - PIANO', 50),
('MÚSICA - REGÊNCIA', 50),
('MÚSICA - SAXOFONE', 50),
('MÚSICA - TROMBONE', 50),
('MÚSICA - TROMPA', 50),
('MÚSICA - TROMPETE', 50),
('MÚSICA - VIOLA', 50),
('MÚSICA - VIOLÃO', 50),
('MÚSICA - VIOLINO', 50),
('MÚSICA - VIOLONCELO', 50),
('NUTRIÇÃO', 51),
('ODONTOLOGIA', 52),
('SERVIÇO SOCIAL DIURNO', 53),
('SERVIÇO SOCIAL NOTURNO', 53),
('CIÊNCIAS SOCIAIS', 54),
('CIÊNCIAS SOCIAIS - SOCIOLOGIA', 54),
('ARTES VISUAIS LICENCIATURA NOTURNO', 55),
('ARTES VISUAIS LICENCIATURA DIURNO', 55),
('ARTES VISUAIS', 55),
('TEORIA, CRÍTICA E HISTÓRIA DA ARTE', 55);

-- 4. Usuários
INSERT INTO Usuario (cpf, nome, email, senha) VALUES 
(11111111111, 'Ana Silva', 'ana@exemplo.com', 'senha123'),
(22222222222, 'Bruno Souza', 'bruno@exemplo.com', 'senha123'),
(33333333333, 'Carla Mendes', 'carla@exemplo.com', 'senha123'),
(44444444444, 'Diego Lima', 'diego@exemplo.com', 'senha123'),
(55555555555, 'Eduarda Costa', 'eduarda@exemplo.com', 'senha123');

-- 5. Funcionários
INSERT INTO Funcionario (matricula, cpf) VALUES 
(1001, 11111111111),
(1003, 33333333333),
(1005, 55555555555);

-- 6. Docentes
INSERT INTO Docente (matricula, cpf, id_departamento) VALUES 
(1002, 22222222222, 2),
(1004, 44444444444, 4);

-- 8. Salas
INSERT INTO Sala (id, nome, id_predio) VALUES 
(1, 'Sala 101', 1),
(2, 'Sala 202', 2),
(3, 'Laboratório Físico', 3),
(4, 'Sala Química', 4),
(5, 'Sala Letras', 5);

-- 9. TipoEquipamento
INSERT INTO TipoEquipamento (id, descricao) VALUES 
(1, 'Computador'),
(2, 'Projetor'),
(3, 'Impressora'),
(4, 'Scanner'),
(5, 'Roteador');

-- 10. StatusEquipamento
INSERT INTO StatusEquipamento (id, descricao) VALUES 
(1, 'Ativo'),
(2, 'Em manutenção'),
(3, 'Inativo'),
(4, 'Reservado'),
(5, 'Substituído');

-- 11. Equipamentos
INSERT INTO Equipamento (id, data_aquisicao, fabricante, id_tipo, id_status, id_sala) VALUES 
(1, '2020-06-01', 'Dell', 1, 1, 1),
(2, '2019-08-20', 'Epson', 2, 2, 2),
(3, '2021-01-15', 'HP', 3, 1, 3),
(4, '2023-02-10', 'Canon', 4, 1, 4),
(5, '2022-11-05', 'TP-Link', 5, 1, 5);

-- 12. Ocorrências
INSERT INTO Ocorrencia (problema, data_abertura, data_fechamento, id_usuario) VALUES 
('Monitor não liga', '2024-01-10', NULL, 11111111111),
('Projetor com imagem borrada', '2024-02-12', '2024-03-01', 22222222222),
('Impressora travando papel', '2024-03-05', NULL, 33333333333),
('Scanner não reconhecido', '2024-04-01', NULL, 44444444444),
('Roteador sem sinal', '2024-05-20', NULL, 55555555555);

-- 13. Manutenções
INSERT INTO Manutencao (servico, data, id_equipamento, id_ocorrencia, id_funcionario) VALUES 
('Substituição da fonte do monitor', '2024-01-15', 1, 1, 1001),
('Limpeza da lente do projetor', '2024-03-01', 2, 2, 1005),
('Troca de roletes da impressora', '2024-03-10', 3, 3, 1003),
('Atualização de driver do scanner', '2024-04-05', 4, 4, 1001),
('Reset de fábrica do roteador', '2024-05-25', 5, 5, 1005);