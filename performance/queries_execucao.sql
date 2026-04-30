-- =========================================
-- Nome: Queries em execução
-- Categoria: monitoramento
-- Tags: pg_stat_activity, tempo real
-- =========================================

SELECT
    pid,
    now() - query_start AS duracao,
    state,
    query
FROM pg_stat_activity
WHERE state <> 'idle'
ORDER BY duracao DESC;