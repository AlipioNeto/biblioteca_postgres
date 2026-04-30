-- =========================================
-- Nome: tamanho de arquivos
-- Categoria: monitoramento
-- Tags: size, tempo real
-- =========================================

SELECT
pg_database.datname,
pg_size_pretty(pg_database_size(pg_database.datname)) AS size
FROM pg_database;
