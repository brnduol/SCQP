CREATE OR REPLACE PROCEDURE excluir_ocorrencia_por_id(id_oc INTEGER)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM ocorrencia WHERE id = id_oc;

    -- Opcional: você pode verificar se realmente foi deletado
    IF NOT FOUND THEN
        RAISE NOTICE 'Ocorrência com ID % não encontrada.', id_oc;
    ELSE
        RAISE NOTICE 'Ocorrência com ID % excluída com sucesso.', id_oc;
    END IF;
END;
$$;



