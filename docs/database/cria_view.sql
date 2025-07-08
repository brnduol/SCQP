CREATE OR REPLACE VIEW ocorrencias_completas AS
SELECT 
    o.id AS id_ocorrencia,
    o.problema,
    o.data_abertura,
    o.data_fechamento,
    
    u.nome AS nome_solicitante,
    u.cpf AS cpf_solicitante,

    uf.nome AS nome_funcionario,
    f.matricula AS matricula_funcionario,

    e.id AS id_equipamento,
    e.fabricante AS fabricante,
    te.descricao AS tipo_equipamento,
    se.descricao AS status_equipamento,

    m.id AS id_manutencao,
    m.servico,
    m.data AS data_manutencao

FROM ocorrencia o
JOIN usuario u ON o.id_usuario = u.cpf

LEFT JOIN manutencao m ON m.id_ocorrencia = o.id
LEFT JOIN equipamento e ON e.id = m.id_equipamento
LEFT JOIN tipoequipamento te ON te.id = e.id_tipo
LEFT JOIN statusequipamento se ON se.id = e.id_status
LEFT JOIN funcionario f ON f.matricula = m.id_funcionario
LEFT JOIN usuario uf ON uf.cpf = f.cpf;
