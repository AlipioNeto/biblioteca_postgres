-- =========================================
-- Nome: Pesquisa Campos ou Conteudos
-- Categoria: consultas
-- Tags: pesquisa_campos_conteudos
-- Cliente: Todos 
-- =========================================

-- pesquisa campos -> municipe_id 
select 
table_schema as schema,
TABLE_NAME AS TABELA,
COLUMN_NAME AS CAMPO,
   CONCAT('select *from ', table_name) 
FROM
   INFORMATION_SCHEMA.COLUMNS   
WHERE
 --  TABLE_NAME LIKE '%conta_corrente%' -- Exemplo: 'id_empresa%'
COLUMN_NAME ilike '%municipe_id%'



-- LOCALIZAR MUNICIPE_ID == valor(2) NAS TABELAS
-- municipe_id = 2

do $$

DECLARE
    r RECORD;
    v_valor integer := 2; -- valor que você quer procurar
    v_sql TEXT;
    v_existe BOOLEAN;
BEGIN
    FOR r IN
        SELECT table_schema, table_name
        FROM information_schema.columns
        WHERE column_name = 'municipe_id'
          AND table_schema NOT IN ('pg_catalog', 'information_schema')
    LOOP
        v_sql := format(
            'SELECT EXISTS (SELECT 1 FROM %I.%I WHERE municipe_id = $1)',
            r.table_schema,
            r.table_name
        );

       if STRPOS(v_sql, 'vw_') = '0' then 
		  if STRPOS(v_sql, 'rp_') = '0' then
	        EXECUTE v_sql INTO v_existe USING v_valor;
            IF v_existe THEN
				RAISE NOTICE ' xxxx Valor encontrado na tabela: %.%', 
                r.table_schema, r.table_name;
     		END IF;
		  end if;
		end if;
    END LOOP;

END $$;


	

