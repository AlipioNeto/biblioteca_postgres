-- =========================================
-- Nome: Tabelas com possível bloat
-- Categoria: diagnostico
-- Tags: bloat, tamanho
-- =========================================

SELECT
    relname AS tabela,
    n_live_tup,
    n_dead_tup
FROM pg_stat_user_tables
ORDER BY n_dead_tup DESC;

-- Se n_dead_tup alto → precisa VACUUM

