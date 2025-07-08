CREATE OR REPLACE VIEW ocorrencias_com_usuarios AS
SELECT 
    o.id,
    o.problema,
    o.data_abertura,
    o.data_fechamento,
    u.nome AS nome_usuario
FROM 
    ocorrencia o
JOIN 
    usuario u ON o.id_usuario = u.cpf;
