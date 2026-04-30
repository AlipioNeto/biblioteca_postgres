-- =========================================
-- Nome: Cancelamento requisicao estoque_requisicoes_consumos
-- Categoria: consultas
-- Tags: cancela_requisicao_consumo
-- Chamado: GLPI-131178
-- Cliente: Cotia 
-- requisicao numero : 116019
-- =========================================

-- https://cotia.saudesimples.net/estoque/requisicoes_consumos

select id,situacao_requisicao_consumo_id from estoque_requisicoes_consumos erc where codigo ilike '%116019%'  
-- situacao = 3 (separada)
--          = 5 (cancelada)

UPDATE public.estoque_requisicoes_consumos SET situacao_requisicao_consumo_id = 5 WHERE id=38169;

select *from estoque_situacoes_requisicoes_consumos esrc 


