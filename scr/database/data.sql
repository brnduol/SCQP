
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
INSERT INTO Departamento (nome, id_predio) VALUES ('ADM - DEPTO ADMINISTRAÇÃO', 5);
INSERT INTO Departamento (nome, id_predio) VALUES ('CCA - DEPTO CIÊNCIAS CONTÁBEIS ATUARIAIS', 4);
INSERT INTO Departamento (nome, id_predio) VALUES ('CEN - DEPTO ARTES CÊNICAS', 2);
INSERT INTO Departamento (nome, id_predio) VALUES ('CET - CENTRO DE EXCELÊNCIA EM TURISMO', 4);
INSERT INTO Departamento (nome, id_predio) VALUES ('CIC - DEPTO CIÊNCIAS DA COMPUTAÇÃO', 4);
INSERT INTO Departamento (nome, id_predio) VALUES ('DAN - DEPTO ANTROPOLOGIA', 2);
INSERT INTO Departamento (nome, id_predio) VALUES ('DIN - DEPARTAMENTO DE DESIGN (11.01.01.14.04)', 5);
INSERT INTO Departamento (nome, id_predio) VALUES ('DSC - DEPTO SAUDE COLETIVA', 1);
INSERT INTO Departamento (nome, id_predio) VALUES ('ECO - DEPTO ECONOMIA', 3);
INSERT INTO Departamento (nome, id_predio) VALUES ('EFL - DEPTO ENGENHARIA FLORESTAL', 4);
INSERT INTO Departamento (nome, id_predio) VALUES ('ELA - DEPARTAMENTO DE ESTUDOS LATINO AMERICANO', 2);
INSERT INTO Departamento (nome, id_predio) VALUES ('ENC - DEPTO ENGENHARIA CIVIL E AMBIENTAL', 1);
INSERT INTO Departamento (nome, id_predio) VALUES ('ENE - DEPTO ENGENHARIA ELETRICA', 3);
INSERT INTO Departamento (nome, id_predio) VALUES ('ENF - DEPTO ENFERMAGEM', 2);
INSERT INTO Departamento (nome, id_predio) VALUES ('ENM - DEPARTAMENTO DE ENGENHARIA MECANICA', 4);
INSERT INTO Departamento (nome, id_predio) VALUES ('EPR - DEPTO ENGENHARIA DE PRODUCAO', 2);
INSERT INTO Departamento (nome, id_predio) VALUES ('EST - DEPTO ESTATÍSTICA', 5);
INSERT INTO Departamento (nome, id_predio) VALUES ('FAC/COM - DEPARTAMENTO DE COMUNICAÇÃO ORGANIZACIONAL/COM', 1);
INSERT INTO Departamento (nome, id_predio) VALUES ('FAC/DAP - DEPARTAMENTO DE AUDIOVISUAIS E PUBLICIDADE/DAP', 3);
INSERT INTO Departamento (nome, id_predio) VALUES ('FAC/JOR - DEPARTAMENTO DE JORNALISMO/JOR', 2);
INSERT INTO Departamento (nome, id_predio) VALUES ('FAU - FACULDADE DE ARQUITETURA E URBANISMO', 4);
INSERT INTO Departamento (nome, id_predio) VALUES ('FAV - FACULDADE DE AGRONOMIA E MEDICINA VETERINÁRIA', 5);
INSERT INTO Departamento (nome, id_predio) VALUES ('FCI - FACULDADE DE CIÊNCIA DA INFORMAÇÃO', 1);
INSERT INTO Departamento (nome, id_predio) VALUES ('FCS - FACULDADE DE CIÊNCIAS DA SAÚDE', 3);
INSERT INTO Departamento (nome, id_predio) VALUES ('FCTE - CAMPUS UNB GAMA: FACULDADE DE CIÊNCIAS E TECNOLOGIAS EM ENGENHARIA', 2);
INSERT INTO Departamento (nome, id_predio) VALUES ('FCTS - CAMPUS UNB CEILÂNDIA: FACULDADE DE CIENCIAS E TECNOLOGIAS EM SAÚDE', 3);
INSERT INTO Departamento (nome, id_predio) VALUES ('FDD - FACULDADE DE DIREITO', 5);
INSERT INTO Departamento (nome, id_predio) VALUES ('FED - FACULDADE DE EDUCAÇÃO', 1);
INSERT INTO Departamento (nome, id_predio) VALUES ('FEF - FACULDADE DE EDUCAÇÃO FÍSICA', 4);
INSERT INTO Departamento (nome, id_predio) VALUES ('FIL - DEPTO FILOSOFIA', 2);
INSERT INTO Departamento (nome, id_predio) VALUES ('FMD - FACULDADE DE MEDICINA', 1);
INSERT INTO Departamento (nome, id_predio) VALUES ('FTD - FACULDADE DE TECNOLOGIA', 3);
INSERT INTO Departamento (nome, id_predio) VALUES ('FUP - FACULDADE DE PLANALTINA', 2);
INSERT INTO Departamento (nome, id_predio) VALUES ('GEA - DEPTO GEOGRAFIA', 4);
INSERT INTO Departamento (nome, id_predio) VALUES ('GPP - DEPARTAMENTO DE GESTAO DE POLITICAS PUBL', 3);
INSERT INTO Departamento (nome, id_predio) VALUES ('HIS - DEPTO HISTÓRIA', 2);
INSERT INTO Departamento (nome, id_predio) VALUES ('ICB - INSTITUTO DE CIÊNCIAS BIOLÓGICAS', 5);
INSERT INTO Departamento (nome, id_predio) VALUES ('ICH - INSTITUTO DE CIÊNCIAS HUMANAS', 1);
INSERT INTO Departamento (nome, id_predio) VALUES ('IDA1 - INSTITUTO DE ARTES', 2);
INSERT INTO Departamento (nome, id_predio) VALUES ('IFD - INSTITUTO DE FÍSICA', 4);
INSERT INTO Departamento (nome, id_predio) VALUES ('IGD - INSTITUTO DE GEOCIÊNCIAS', 2);
INSERT INTO Departamento (nome, id_predio) VALUES ('ILD - INSTITUTO DE LETRAS', 5);
INSERT INTO Departamento (nome, id_predio) VALUES ('IPD - INSTITUTO DE PSICOLOGIA', 3);
INSERT INTO Departamento (nome, id_predio) VALUES ('IPOL - INSTITUTO DE CIÊNCIA POLÍTICA', 4);
INSERT INTO Departamento (nome, id_predio) VALUES ('IQD - INSTITUTO DE QUÍMICA', 1);
INSERT INTO Departamento (nome, id_predio) VALUES ('IREL - INSTITUTO DE RELAÇÕES INTERNACIONAIS', 5);
INSERT INTO Departamento (nome, id_predio) VALUES ('LET - DEPTO LÍNGUAS ESTRANGEIRAS E TRADUÇÃO', 2);
INSERT INTO Departamento (nome, id_predio) VALUES ('LIP - DEPTO LINGUISTICA, PORT. LING. CLASSICAS', 5);
INSERT INTO Departamento (nome, id_predio) VALUES ('MAT - DEPARTAMENTO DE MATEMÁTICA', 3);
INSERT INTO Departamento (nome, id_predio) VALUES ('MUS - DEPTO MÚSICA', 2);
INSERT INTO Departamento (nome, id_predio) VALUES ('NUT - DEPTO NUTRICAO', 1);
INSERT INTO Departamento (nome, id_predio) VALUES ('ODT - DEPTO ODONTOLOGIA', 4);
INSERT INTO Departamento (nome, id_predio) VALUES ('SER - DEPTO SERVIÇO SOCIAL', 3);
INSERT INTO Departamento (nome, id_predio) VALUES ('SOL - DEPARTAMENTO DE SOCIOLOGIA', 2);
INSERT INTO Departamento (nome, id_predio) VALUES ('VIS - DEPTO ARTES VISUAIS', 5);

-- ========================
-- 3. Cursos
-- ========================

INSERT INTO Curso (nome, id_departamento) VALUES ('ADMINISTRAÇÃO DIURNO', (SELECT id FROM Departamento WHERE nome = 'ADM - DEPTO ADMINISTRAÇÃO'));
INSERT INTO Curso (nome, id_departamento) VALUES ('ADMINISTRAÇÃO NOTURNO', (SELECT id FROM Departamento WHERE nome = 'ADM - DEPTO ADMINISTRAÇÃO'));

INSERT INTO Curso (nome, id_departamento) VALUES ('CIÊNCIAS CONTÁBEIS NOTURNO', (SELECT id FROM Departamento WHERE nome = 'CCA - DEPTO CIÊNCIAS CONTÁBEIS ATUARIAIS'));
INSERT INTO Curso (nome, id_departamento) VALUES ('CIÊNCIAS CONTÁBEIS DIURNO', (SELECT id FROM Departamento WHERE nome = 'CCA - DEPTO CIÊNCIAS CONTÁBEIS ATUARIAIS'));
 
INSERT INTO Curso (nome, id_departamento) VALUES ('ARTES CÊNICAS LICENCIATURA NOTURNO', (SELECT id FROM Departamento WHERE nome = 'CEN - DEPTO ARTES CÊNICAS'));
INSERT INTO Curso (nome, id_departamento) VALUES ('ARTES CÊNICAS LICENCIATURA DIRUNO', (SELECT id FROM Departamento WHERE nome = 'CEN - DEPTO ARTES CÊNICAS'));
INSERT INTO Curso (nome, id_departamento) VALUES ('ARTES CÊNICAS - INTERPRETAÇÃO TEATRAL', (SELECT id FROM Departamento WHERE nome = 'CEN - DEPTO ARTES CÊNICAS'));

INSERT INTO Curso (nome, id_departamento) VALUES ('TURISMO', (SELECT id FROM Departamento WHERE nome = 'CET - CENTRO DE EXCELÊNCIA EM TURISMO'));

INSERT INTO Curso (nome, id_departamento) VALUES ('CIÊNCIA DA COMPUTAÇÃO', (SELECT id FROM Departamento WHERE nome = 'CIC - DEPTO CIÊNCIAS DA COMPUTAÇÃO'));
INSERT INTO Curso (nome, id_departamento) VALUES ('COMPUTAÇÃO', (SELECT id FROM Departamento WHERE nome = 'CIC - DEPTO CIÊNCIAS DA COMPUTAÇÃO'));
INSERT INTO Curso (nome, id_departamento) VALUES ('ENGENHARIA DE COMPUTAÇÃO', (SELECT id FROM Departamento WHERE nome = 'CIC - DEPTO CIÊNCIAS DA COMPUTAÇÃO'));

INSERT INTO Curso (nome, id_departamento) VALUES ('CIÊNCIAS SOCIAIS - ANTROPOLOGIA', (SELECT id FROM Departamento WHERE nome = 'DAN - DEPTO ANTROPOLOGIA'));

INSERT INTO Curso (nome, id_departamento) VALUES ('DESENHO INDUSTRIAL - PROGRAMAÇÃO VISUAL', (SELECT id FROM Departamento WHERE nome = 'DIN - DEPARTAMENTO DE DESIGN (11.01.01.14.04)'));
INSERT INTO Curso (nome, id_departamento) VALUES ('DESIGN - PROGRAMAÇÃO VISUAL', (SELECT id FROM Departamento WHERE nome = 'DIN - DEPARTAMENTO DE DESIGN (11.01.01.14.04)'));
INSERT INTO Curso (nome, id_departamento) VALUES ('DESIGN - PROJETO DO PRODUTO', (SELECT id FROM Departamento WHERE nome = 'DIN - DEPARTAMENTO DE DESIGN (11.01.01.14.04)'));

INSERT INTO Curso (nome, id_departamento) VALUES ('SAÚDE COLETIVA', (SELECT id FROM Departamento WHERE nome = 'DSC - DEPTO SAUDE COLETIVA'));

INSERT INTO Curso (nome, id_departamento) VALUES ('CIÊNCIAS ECONÔMICAS', (SELECT id FROM Departamento WHERE nome = 'ECO - DEPTO ECONOMIA'));

INSERT INTO Curso (nome, id_departamento) VALUES ('ENGENHARIA FLORESTAL', (SELECT id FROM Departamento WHERE nome = 'EFL - DEPTO ENGENHARIA FLORESTAL'));

INSERT INTO Curso (nome, id_departamento) VALUES ('CIÊNCIAS SOCIAIS', (SELECT id FROM Departamento WHERE nome = 'ELA - DEPARTAMENTO DE ESTUDOS LATINO AMERICANO'));

INSERT INTO Curso (nome, id_departamento) VALUES ('ENGENHARIA AMBIENTAL', (SELECT id FROM Departamento WHERE nome = 'ENC - DEPTO ENGENHARIA CIVIL E AMBIENTAL'));
INSERT INTO Curso (nome, id_departamento) VALUES ('ENGENHARIA CIVIL', (SELECT id FROM Departamento WHERE nome = 'ENC - DEPTO ENGENHARIA CIVIL E AMBIENTAL'));

INSERT INTO Curso (nome, id_departamento) VALUES ('ENGENHARIA DE REDES DE COMUNICAÇÃO', (SELECT id FROM Departamento WHERE nome = 'ENE - DEPTO ENGENHARIA ELETRICA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('ENGENHARIA ELÉTRICA', (SELECT id FROM Departamento WHERE nome = 'ENE - DEPTO ENGENHARIA ELETRICA'));

INSERT INTO Curso (nome, id_departamento) VALUES ('ENFERMAGEM', (SELECT id FROM Departamento WHERE nome = 'ENF - DEPTO ENFERMAGEM'));

INSERT INTO Curso (nome, id_departamento) VALUES ('ENGENHARIA MECÂNICA', (SELECT id FROM Departamento WHERE nome = 'ENM - DEPARTAMENTO DE ENGENHARIA MECANICA'));

INSERT INTO Curso (nome, id_departamento) VALUES ('ENGENHARIA DE PRODUÇÃO', (SELECT id FROM Departamento WHERE nome = 'EPR - DEPTO ENGENHARIA DE PRODUCAO'));

INSERT INTO Curso (nome, id_departamento) VALUES ('ESTATÍSTICA', (SELECT id FROM Departamento WHERE nome = 'EST - DEPTO ESTATÍSTICA'));

INSERT INTO Curso (nome, id_departamento) VALUES ('COMUNICAÇÃO SOCIAL - COMUNICAÇÃO ORGANIZACIONAL', (SELECT id FROM Departamento WHERE nome = 'FAC/COM - DEPARTAMENTO DE COMUNICAÇÃO ORGANIZACIONAL/COM'));

INSERT INTO Curso (nome, id_departamento) VALUES ('COMUNICAÇÃO SOCIAL - AUDIOVISUAL', (SELECT id FROM Departamento WHERE nome = 'FAC/DAP - DEPARTAMENTO DE AUDIOVISUAIS E PUBLICIDADE/DAP'));
INSERT INTO Curso (nome, id_departamento) VALUES ('COMUNICAÇÃO SOCIAL - PUBLICIDADE E PROPAGANDA', (SELECT id FROM Departamento WHERE nome = 'FAC/DAP - DEPARTAMENTO DE AUDIOVISUAIS E PUBLICIDADE/DAP'));

INSERT INTO Curso (nome, id_departamento) VALUES ('COMUNICAÇÃO SOCIAL - JORNALISMO', (SELECT id FROM Departamento WHERE nome = 'FAC/JOR - DEPARTAMENTO DE JORNALISMO/JOR'));
INSERT INTO Curso (nome, id_departamento) VALUES ('JORNALISMO', (SELECT id FROM Departamento WHERE nome = 'FAC/JOR - DEPARTAMENTO DE JORNALISMO/JOR'));

INSERT INTO Curso (nome, id_departamento) VALUES ('ARQUITETURA E URBANISMO NOTURNO', (SELECT id FROM Departamento WHERE nome = 'FAU - FACULDADE DE ARQUITETURA E URBANISMO'));
INSERT INTO Curso (nome, id_departamento) VALUES ('ARQUITETURA E URBANISMO DIURNO', (SELECT id FROM Departamento WHERE nome = 'FAU - FACULDADE DE ARQUITETURA E URBANISMO'));

INSERT INTO Curso (nome, id_departamento) VALUES ('AGRONOMIA', (SELECT id FROM Departamento WHERE nome = 'FAV - FACULDADE DE AGRONOMIA E MEDICINA VETERINÁRIA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('GESTÃO DE AGRONEGÓCIOS', (SELECT id FROM Departamento WHERE nome = 'FAV - FACULDADE DE AGRONOMIA E MEDICINA VETERINÁRIA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('MEDICINA VETERINÁRIA', (SELECT id FROM Departamento WHERE nome = 'FAV - FACULDADE DE AGRONOMIA E MEDICINA VETERINÁRIA'));

INSERT INTO Curso (nome, id_departamento) VALUES ('ARQUIVOLOGIA', (SELECT id FROM Departamento WHERE nome = 'FCI - FACULDADE DE CIÊNCIA DA INFORMAÇÃO'));
INSERT INTO Curso (nome, id_departamento) VALUES ('BIBLIOTECONOMIA', (SELECT id FROM Departamento WHERE nome = 'FCI - FACULDADE DE CIÊNCIA DA INFORMAÇÃO'));
INSERT INTO Curso (nome, id_departamento) VALUES ('MUSEOLOGIA', (SELECT id FROM Departamento WHERE nome = 'FCI - FACULDADE DE CIÊNCIA DA INFORMAÇÃO'));

INSERT INTO Curso (nome, id_departamento) VALUES ('FARMÁCIA NOTURNO', (SELECT id FROM Departamento WHERE nome = 'FCS - FACULDADE DE CIÊNCIAS DA SAÚDE'));
INSERT INTO Curso (nome, id_departamento) VALUES ('FARMÁCIA DIURNO', (SELECT id FROM Departamento WHERE nome = 'FCS - FACULDADE DE CIÊNCIAS DA SAÚDE'));

INSERT INTO Curso (nome, id_departamento) VALUES ('ENGENHARIA', (SELECT id FROM Departamento WHERE nome = 'FCTE - CAMPUS UNB GAMA: FACULDADE DE CIÊNCIAS E TECNOLOGIAS EM ENGENHARIA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('ENGENHARIA AEROESPACIAL', (SELECT id FROM Departamento WHERE nome = 'FCTE - CAMPUS UNB GAMA: FACULDADE DE CIÊNCIAS E TECNOLOGIAS EM ENGENHARIA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('ENGENHARIA AUTOMOTIVA', (SELECT id FROM Departamento WHERE nome = 'FCTE - CAMPUS UNB GAMA: FACULDADE DE CIÊNCIAS E TECNOLOGIAS EM ENGENHARIA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('ENGENHARIA DE ENERGIA', (SELECT id FROM Departamento WHERE nome = 'FCTE - CAMPUS UNB GAMA: FACULDADE DE CIÊNCIAS E TECNOLOGIAS EM ENGENHARIA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('ENGENHARIA DE SOFTWARE', (SELECT id FROM Departamento WHERE nome = 'FCTE - CAMPUS UNB GAMA: FACULDADE DE CIÊNCIAS E TECNOLOGIAS EM ENGENHARIA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('ENGENHARIA ELETRÔNICA', (SELECT id FROM Departamento WHERE nome = 'FCTE - CAMPUS UNB GAMA: FACULDADE DE CIÊNCIAS E TECNOLOGIAS EM ENGENHARIA'));

INSERT INTO Curso (nome, id_departamento) VALUES ('ENFERMAGEM', (SELECT id FROM Departamento WHERE nome = 'FCTS - CAMPUS UNB CEILÂNDIA: FACULDADE DE CIENCIAS E TECNOLOGIAS EM SAÚDE'));
INSERT INTO Curso (nome, id_departamento) VALUES ('FARMÁCIA', (SELECT id FROM Departamento WHERE nome = 'FCTS - CAMPUS UNB CEILÂNDIA: FACULDADE DE CIENCIAS E TECNOLOGIAS EM SAÚDE'));
INSERT INTO Curso (nome, id_departamento) VALUES ('FISIOTERAPIA', (SELECT id FROM Departamento WHERE nome = 'FCTS - CAMPUS UNB CEILÂNDIA: FACULDADE DE CIENCIAS E TECNOLOGIAS EM SAÚDE'));
INSERT INTO Curso (nome, id_departamento) VALUES ('FONOAUDIOLOGIA', (SELECT id FROM Departamento WHERE nome = 'FCTS - CAMPUS UNB CEILÂNDIA: FACULDADE DE CIENCIAS E TECNOLOGIAS EM SAÚDE'));
INSERT INTO Curso (nome, id_departamento) VALUES ('SAÚDE COLETIVA', (SELECT id FROM Departamento WHERE nome = 'FCTS - CAMPUS UNB CEILÂNDIA: FACULDADE DE CIENCIAS E TECNOLOGIAS EM SAÚDE'));

INSERT INTO Curso (nome, id_departamento) VALUES ('TERAPIA OCUPACIONAL', (SELECT id FROM Departamento WHERE nome = 'FCTS - CAMPUS UNB CEILÂNDIA: FACULDADE DE CIENCIAS E TECNOLOGIAS EM SAÚDE'));

INSERT INTO Curso (nome, id_departamento) VALUES ('DIREITO DIURNO', (SELECT id FROM Departamento WHERE nome = 'FDD - FACULDADE DE DIREITO'));
INSERT INTO Curso (nome, id_departamento) VALUES ('DIREITO NOTURNO', (SELECT id FROM Departamento WHERE nome = 'FDD - FACULDADE DE DIREITO'));

INSERT INTO Curso (nome, id_departamento) VALUES ('PEDAGOGIA LICENCIATURA NOTURNO', (SELECT id FROM Departamento WHERE nome = 'FED - FACULDADE DE EDUCAÇÃO'));
INSERT INTO Curso (nome, id_departamento) VALUES ('PEDAGOGIA LICENCIATURA DIURNO', (SELECT id FROM Departamento WHERE nome = 'FED - FACULDADE DE EDUCAÇÃO'));

INSERT INTO Curso (nome, id_departamento) VALUES ('EDUCAÇÃO FÍSICA LICENCIATURA', (SELECT id FROM Departamento WHERE nome = 'FEF - FACULDADE DE EDUCAÇÃO FÍSICA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('EDUCAÇÃO FÍSICA', (SELECT id FROM Departamento WHERE nome = 'FEF - FACULDADE DE EDUCAÇÃO FÍSICA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('EDUCAÇÃO FÍSICA - CICLO BÁSICO', (SELECT id FROM Departamento WHERE nome = 'FEF - FACULDADE DE EDUCAÇÃO FÍSICA'));

INSERT INTO Curso (nome, id_departamento) VALUES ('FILOSOFIA LICENCIATURA DIURNO', (SELECT id FROM Departamento WHERE nome = 'FIL - DEPTO FILOSOFIA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('FILOSOFIA', (SELECT id FROM Departamento WHERE nome = 'FIL - DEPTO FILOSOFIA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('FILOSOFIA LICENCIATURA NOTURNO', (SELECT id FROM Departamento WHERE nome = 'FIL - DEPTO FILOSOFIA'));

INSERT INTO Curso (nome, id_departamento) VALUES ('MEDICINA', (SELECT id FROM Departamento WHERE nome = 'FMD - FACULDADE DE MEDICINA'));

INSERT INTO Curso (nome, id_departamento) VALUES ('ENGENHARIA MECATRÔNICA - CONTROLE E AUTOMAÇÃO', (SELECT id FROM Departamento WHERE nome = 'FTD - FACULDADE DE TECNOLOGIA'));

INSERT INTO Curso (nome, id_departamento) VALUES ('CIÊNCIAS NATURAIS LICENCIATURA NOTURNO', (SELECT id FROM Departamento WHERE nome = 'FUP - FACULDADE DE PLANALTINA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('CIÊNCIAS NATURAIS LICENCIATURA DIURNO', (SELECT id FROM Departamento WHERE nome = 'FUP - FACULDADE DE PLANALTINA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('EDUCAÇÃO DO CAMPO - CIÊNCIAS DA NATUREZA', (SELECT id FROM Departamento WHERE nome = 'FUP - FACULDADE DE PLANALTINA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('EDUCAÇÃO DO CAMPO - CIÊNCIAS DA NATUREZA E MATEMÁTICA', (SELECT id FROM Departamento WHERE nome = 'FUP - FACULDADE DE PLANALTINA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('EDUCAÇÃO DO CAMPO - LINGUAGENS, ARTES E LITERATURA', (SELECT id FROM Departamento WHERE nome = 'FUP - FACULDADE DE PLANALTINA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('EDUCAÇÃO DO CAMPO - MATEMÁTICA', (SELECT id FROM Departamento WHERE nome = 'FUP - FACULDADE DE PLANALTINA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('GESTÃO AMBIENTAL', (SELECT id FROM Departamento WHERE nome = 'FUP - FACULDADE DE PLANALTINA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('GESTÃO DO AGRONEGÓCIO', (SELECT id FROM Departamento WHERE nome = 'FUP - FACULDADE DE PLANALTINA'));

INSERT INTO Curso (nome, id_departamento) VALUES ('GEOGRAFIA LICENCIATURA', (SELECT id FROM Departamento WHERE nome = 'GEA - DEPTO GEOGRAFIA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('GEOGRAFIA', (SELECT id FROM Departamento WHERE nome = 'GEA - DEPTO GEOGRAFIA'));

INSERT INTO Curso (nome, id_departamento) VALUES ('GESTÃO DE POLÍTICAS PÚBLICAS', (SELECT id FROM Departamento WHERE nome = 'GPP - DEPARTAMENTO DE GESTAO DE POLITICAS PUBL'));

INSERT INTO Curso (nome, id_departamento) VALUES ('HISTÓRIA LICENCIATURA DIURNO', (SELECT id FROM Departamento WHERE nome = 'HIS - DEPTO HISTÓRIA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('HISTÓRIA LICENCIATURA NOTURNO', (SELECT id FROM Departamento WHERE nome = 'HIS - DEPTO HISTÓRIA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('HISTÓRIA', (SELECT id FROM Departamento WHERE nome = 'HIS - DEPTO HISTÓRIA'));

INSERT INTO Curso (nome, id_departamento) VALUES ('BIOTECNOLOGIA', (SELECT id FROM Departamento WHERE nome = 'ICB - INSTITUTO DE CIÊNCIAS BIOLÓGICAS'));
INSERT INTO Curso (nome, id_departamento) VALUES ('CIÊNCIAS BIOLÓGICAS LICENCIATURA DIURNO', (SELECT id FROM Departamento WHERE nome = 'ICB - INSTITUTO DE CIÊNCIAS BIOLÓGICAS'));
INSERT INTO Curso (nome, id_departamento) VALUES ('CIÊNCIAS BIOLÓGICAS', (SELECT id FROM Departamento WHERE nome = 'ICB - INSTITUTO DE CIÊNCIAS BIOLÓGICAS'));
INSERT INTO Curso (nome, id_departamento) VALUES ('CIÊNCIAS BIOLÓGICAS LICENCIATURA NOTURNO', (SELECT id FROM Departamento WHERE nome = 'ICB - INSTITUTO DE CIÊNCIAS BIOLÓGICAS'));

INSERT INTO Curso (nome, id_departamento) VALUES ('GEOGRAFIA', (SELECT id FROM Departamento WHERE nome = 'ICH - INSTITUTO DE CIÊNCIAS HUMANAS'));

INSERT INTO Curso (nome, id_departamento) VALUES ('ARTES VISUAIS', (SELECT id FROM Departamento WHERE nome = 'IDA1 - INSTITUTO DE ARTES'));
INSERT INTO Curso (nome, id_departamento) VALUES ('MÚSICA', (SELECT id FROM Departamento WHERE nome = 'IDA1 - INSTITUTO DE ARTES'));
INSERT INTO Curso (nome, id_departamento) VALUES ('TEATRO', (SELECT id FROM Departamento WHERE nome = 'IDA1 - INSTITUTO DE ARTES'));

INSERT INTO Curso (nome, id_departamento) VALUES ('FÍSICA LICENCIATURA DIURNO', (SELECT id FROM Departamento WHERE nome = 'IFD - INSTITUTO DE FÍSICA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('FÍSICA', (SELECT id FROM Departamento WHERE nome = 'IFD - INSTITUTO DE FÍSICA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('FÍSICA LICENCIATURA NOTURNO', (SELECT id FROM Departamento WHERE nome = 'IFD - INSTITUTO DE FÍSICA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('FÍSICA COMPUTACIONAL', (SELECT id FROM Departamento WHERE nome = 'IFD - INSTITUTO DE FÍSICA'));

INSERT INTO Curso (nome, id_departamento) VALUES ('CIÊNCIAS AMBIENTAIS', (SELECT id FROM Departamento WHERE nome = 'IGD - INSTITUTO DE GEOCIÊNCIAS'));
INSERT INTO Curso (nome, id_departamento) VALUES ('GEOFÍSICA', (SELECT id FROM Departamento WHERE nome = 'IGD - INSTITUTO DE GEOCIÊNCIAS'));
INSERT INTO Curso (nome, id_departamento) VALUES ('GEOLOGIA', (SELECT id FROM Departamento WHERE nome = 'IGD - INSTITUTO DE GEOCIÊNCIAS'));

INSERT INTO Curso (nome, id_departamento) VALUES ('LETRAS - LÍNGUA PORTUGUESA E RESPECTIVA LITERATURA', (SELECT id FROM Departamento WHERE nome = 'ILD - INSTITUTO DE LETRAS'));
INSERT INTO Curso (nome, id_departamento) VALUES ('LETRAS - TRADUÇÃO - ESPANHOL', (SELECT id FROM Departamento WHERE nome = 'ILD - INSTITUTO DE LETRAS'));

INSERT INTO Curso (nome, id_departamento) VALUES ('PSICOLOGIA PSICOLOGO', (SELECT id FROM Departamento WHERE nome = 'IPD - INSTITUTO DE PSICOLOGIA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('PSICOLOGIA', (SELECT id FROM Departamento WHERE nome = 'IPD - INSTITUTO DE PSICOLOGIA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('PSICOLOGIA LICENCIATURA', (SELECT id FROM Departamento WHERE nome = 'IPD - INSTITUTO DE PSICOLOGIA'));

INSERT INTO Curso (nome, id_departamento) VALUES ('CIÊNCIA POLÍTICA', (SELECT id FROM Departamento WHERE nome = 'IPOL - INSTITUTO DE CIÊNCIA POLÍTICA'));

INSERT INTO Curso (nome, id_departamento) VALUES ('ENGENHARIA QUÍMICA', (SELECT id FROM Departamento WHERE nome = 'IQD - INSTITUTO DE QUÍMICA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('QUÍMICA LICENCIATURA', (SELECT id FROM Departamento WHERE nome = 'IQD - INSTITUTO DE QUÍMICA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('QUÍMICA', (SELECT id FROM Departamento WHERE nome = 'IQD - INSTITUTO DE QUÍMICA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('QUÍMICA TECNOLÓGICA', (SELECT id FROM Departamento WHERE nome = 'IQD - INSTITUTO DE QUÍMICA'));

INSERT INTO Curso (nome, id_departamento) VALUES ('RELAÇÕES INTERNACIONAIS', (SELECT id FROM Departamento WHERE nome = 'IREL - INSTITUTO DE RELAÇÕES INTERNACIONAIS'));

INSERT INTO Curso (nome, id_departamento) VALUES ('LETRAS - LÍNGUA E LITERATURA JAPONESA', (SELECT id FROM Departamento WHERE nome = 'LET - DEPTO LÍNGUAS ESTRANGEIRAS E TRADUÇÃO'));
INSERT INTO Curso (nome, id_departamento) VALUES ('LETRAS - LÍNGUA ESPANHOLA E LITERATURA ESPANHOLA E HISPANO-AMERICANA', (SELECT id FROM Departamento WHERE nome = 'LET - DEPTO LÍNGUAS ESTRANGEIRAS E TRADUÇÃO'));
INSERT INTO Curso (nome, id_departamento) VALUES ('LETRAS - LÍNGUA FRANCESA E RESPECTIVA LITERATURA LICENCIATURA', (SELECT id FROM Departamento WHERE nome = 'LET - DEPTO LÍNGUAS ESTRANGEIRAS E TRADUÇÃO'));
INSERT INTO Curso (nome, id_departamento) VALUES ('LETRAS - LÍNGUA FRANCESA E RESPECTIVA LITERATURA', (SELECT id FROM Departamento WHERE nome = 'LET - DEPTO LÍNGUAS ESTRANGEIRAS E TRADUÇÃO'));
INSERT INTO Curso (nome, id_departamento) VALUES ('LETRAS - LÍNGUA INGLESA E RESPECTIVA LITERATURA LICENCIATURA', (SELECT id FROM Departamento WHERE nome = 'LET - DEPTO LÍNGUAS ESTRANGEIRAS E TRADUÇÃO'));
INSERT INTO Curso (nome, id_departamento) VALUES ('LETRAS - LÍNGUA INGLESA E RESPECTIVA LITERATURA', (SELECT id FROM Departamento WHERE nome = 'LET - DEPTO LÍNGUAS ESTRANGEIRAS E TRADUÇÃO'));
INSERT INTO Curso (nome, id_departamento) VALUES ('LETRAS - TRADUÇÃO - FRANCÊS', (SELECT id FROM Departamento WHERE nome = 'LET - DEPTO LÍNGUAS ESTRANGEIRAS E TRADUÇÃO'));
INSERT INTO Curso (nome, id_departamento) VALUES ('LETRAS - TRADUÇÃO - INGLÊS', (SELECT id FROM Departamento WHERE nome = 'LET - DEPTO LÍNGUAS ESTRANGEIRAS E TRADUÇÃO'));
INSERT INTO Curso (nome, id_departamento) VALUES ('LÍNGUAS ESTRANGEIRAS APLICADAS - MSI', (SELECT id FROM Departamento WHERE nome = 'LET - DEPTO LÍNGUAS ESTRANGEIRAS E TRADUÇÃO'));

INSERT INTO Curso (nome, id_departamento) VALUES ('LETRAS - LÍNGUA PORTUGUESA E RESPECTIVA LITERATURA', (SELECT id FROM Departamento WHERE nome = 'LIP - DEPTO LINGUISTICA, PORT. LING. CLASSICAS'));
INSERT INTO Curso (nome, id_departamento) VALUES ('LETRAS - LÍNGUA PORTUGUESA E RESPECTIVA LITERATURA LICENCIATURA DIURNO', (SELECT id FROM Departamento WHERE nome = 'LIP - DEPTO LINGUISTICA, PORT. LING. CLASSICAS'));
INSERT INTO Curso (nome, id_departamento) VALUES ('LETRAS - LÍNGUA PORTUGUESA E RESPECTIVA LITERATURA LICENCIATURA NOTURNO', (SELECT id FROM Departamento WHERE nome = 'LIP - DEPTO LINGUISTICA, PORT. LING. CLASSICAS'));
INSERT INTO Curso (nome, id_departamento) VALUES ('LETRAS - PORTUGUÊS DO BRASIL COMO SEGUNDA LÍNGUA', (SELECT id FROM Departamento WHERE nome = 'LIP - DEPTO LINGUISTICA, PORT. LING. CLASSICAS'));
INSERT INTO Curso (nome, id_departamento) VALUES ('LÍNGUA DE SINAIS BRASILEIRA -PORTUGUÊS COMO SEGUNDA LÍNGUA', (SELECT id FROM Departamento WHERE nome = 'LIP - DEPTO LINGUISTICA, PORT. LING. CLASSICAS'));

INSERT INTO Curso (nome, id_departamento) VALUES ('MATEMÁTICA LICENCIATURA DIURNO', (SELECT id FROM Departamento WHERE nome = 'MAT - DEPARTAMENTO DE MATEMÁTICA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('MATEMÁTICA', (SELECT id FROM Departamento WHERE nome = 'MAT - DEPARTAMENTO DE MATEMÁTICA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('MATEMÁTICA LICENCIATURA NOTURNO', (SELECT id FROM Departamento WHERE nome = 'MAT - DEPARTAMENTO DE MATEMÁTICA'));

INSERT INTO Curso (nome, id_departamento) VALUES ('EDUCAÇÃO ARTÍSTICA - MÚSICA', (SELECT id FROM Departamento WHERE nome = 'MUS - DEPTO MÚSICA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('MÚSICA DIURNO', (SELECT id FROM Departamento WHERE nome = 'MUS - DEPTO MÚSICA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('MÚSICA LICENCIATURA NOTURNO', (SELECT id FROM Departamento WHERE nome = 'MUS - DEPTO MÚSICA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('MÚSICA LICENCIATURA DIURNO', (SELECT id FROM Departamento WHERE nome = 'MUS - DEPTO MÚSICA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('MÚSICA - CANTO', (SELECT id FROM Departamento WHERE nome = 'MUS - DEPTO MÚSICA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('MÚSICA - CLARINETA', (SELECT id FROM Departamento WHERE nome = 'MUS - DEPTO MÚSICA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('MÚSICA - COMPOSIÇÃO', (SELECT id FROM Departamento WHERE nome = 'MUS - DEPTO MÚSICA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('MÚSICA - CONTRABAIXO', (SELECT id FROM Departamento WHERE nome = 'MUS - DEPTO MÚSICA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('MÚSICA - FAGOTE', (SELECT id FROM Departamento WHERE nome = 'MUS - DEPTO MÚSICA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('MÚSICA - FLAUTA', (SELECT id FROM Departamento WHERE nome = 'MUS - DEPTO MÚSICA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('MÚSICA - OBOÉ', (SELECT id FROM Departamento WHERE nome = 'MUS - DEPTO MÚSICA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('MÚSICA - PIANO', (SELECT id FROM Departamento WHERE nome = 'MUS - DEPTO MÚSICA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('MÚSICA - REGÊNCIA', (SELECT id FROM Departamento WHERE nome = 'MUS - DEPTO MÚSICA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('MÚSICA - SAXOFONE', (SELECT id FROM Departamento WHERE nome = 'MUS - DEPTO MÚSICA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('MÚSICA - TROMBONE', (SELECT id FROM Departamento WHERE nome = 'MUS - DEPTO MÚSICA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('MÚSICA - TROMPA', (SELECT id FROM Departamento WHERE nome = 'MUS - DEPTO MÚSICA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('MÚSICA - TROMPETE', (SELECT id FROM Departamento WHERE nome = 'MUS - DEPTO MÚSICA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('MÚSICA - VIOLA', (SELECT id FROM Departamento WHERE nome = 'MUS - DEPTO MÚSICA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('MÚSICA - VIOLÃO', (SELECT id FROM Departamento WHERE nome = 'MUS - DEPTO MÚSICA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('MÚSICA - VIOLINO', (SELECT id FROM Departamento WHERE nome = 'MUS - DEPTO MÚSICA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('MÚSICA - VIOLONCELO', (SELECT id FROM Departamento WHERE nome = 'MUS - DEPTO MÚSICA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('NUTRIÇÃO', (SELECT id FROM Departamento WHERE nome = 'NUT - DEPTO NUTRICAO'));

INSERT INTO Curso (nome, id_departamento) VALUES ('ODONTOLOGIA', (SELECT id FROM Departamento WHERE nome = 'ODT - DEPTO ODONTOLOGIA'));

INSERT INTO Curso (nome, id_departamento) VALUES ('SERVIÇO SOCIAL DIURNO', (SELECT id FROM Departamento WHERE nome = 'SER - DEPTO SERVIÇO SOCIAL'));
INSERT INTO Curso (nome, id_departamento) VALUES ('SERVIÇO SOCIAL NOTURNO', (SELECT id FROM Departamento WHERE nome = 'SER - DEPTO SERVIÇO SOCIAL'));

INSERT INTO Curso (nome, id_departamento) VALUES ('CIÊNCIAS SOCIAIS', (SELECT id FROM Departamento WHERE nome = 'SOL - DEPARTAMENTO DE SOCIOLOGIA'));
INSERT INTO Curso (nome, id_departamento) VALUES ('CIÊNCIAS SOCIAIS - SOCIOLOGIA', (SELECT id FROM Departamento WHERE nome = 'SOL - DEPARTAMENTO DE SOCIOLOGIA'));

INSERT INTO Curso (nome, id_departamento) VALUES ('ARTES VISUAIS LICENCIATURA NOTURNO', (SELECT id FROM Departamento WHERE nome = 'VIS - DEPTO ARTES VISUAIS'));
INSERT INTO Curso (nome, id_departamento) VALUES ('ARTES VISUAIS LICENCIATURA DIURNO', (SELECT id FROM Departamento WHERE nome = 'VIS - DEPTO ARTES VISUAIS'));
INSERT INTO Curso (nome, id_departamento) VALUES ('ARTES VISUAIS', (SELECT id FROM Departamento WHERE nome = 'VIS - DEPTO ARTES VISUAIS'));
INSERT INTO Curso (nome, id_departamento) VALUES ('TEORIA, CRÍTICA E HISTÓRIA DA ARTE', (SELECT id FROM Departamento WHERE nome = 'VIS - DEPTO ARTES VISUAIS'));

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
INSERT INTO Equipamento (id, data_aquisicao, fabricante, id_tipo, id_status, id_sala) VALUES 
(1, '2020-06-01', 'Dell', 1, 1, 1),
(2, '2019-08-20', 'Epson', 2, 2, 2),
(3, '2021-01-15', 'HP', 3, 1, 3),
(4, '2023-02-10', 'Canon', 4, 1, 4),
(5, '2022-11-05', 'TP-Link', 5, 1, 5);

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


