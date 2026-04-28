-- EXERCÍCIOS ########################################################################

use sales;

/* 
-- (Exercício 1) Identifique quais as marcas de veículo mais visitada na tabela sales.funnel
SELECT 
	pr.brand,
    fu.visit_id
FROM funnel fu
INNER JOIN products pr
ON fu.product_id = pr.product_id
ORDER BY brand
LIMIT 1;
*/
-- Sobre o exercício acima errei não usando o group by e também en não contar as marcas, o correto seria: 
SELECT 
	pr.brand, 
    COUNT(fun.visit_id) AS total_visitas
FROM funnel fun
INNER JOIN products pr
	ON fun.product_id = pr.product_id
GROUP BY brand 
ORDER BY total_visitas DESC;
	
-- (Exercício 2) Identifique quais as lojas de veículo mais visitadas na tabela sales.funnel
SELECT 
	st.store_name AS nome_marca,
	COUNT(fun.store_id) AS total_visita
FROM funnel fun
INNER JOIN stores st
	ON fun.store_id = st.store_id
GROUP BY st.store_name
ORDER BY total_visita DESC;

-- (Exercício 3) Identifique quantos clientes moram em cada tamanho de cidade (o porte da cidade
-- consta na coluna "size" da tabela temp_tables.regions)
USE sales;
SELECT
    COALESCE(reg.size, 'Desconhecido') AS tamanho_cidade, -- 'Desconhecido' = Não sei o tamanho da cidade, o coalesce utilizo quando os dados podem ser "nulls'
    COUNT(cus.customer_id) AS total_clientes
FROM sales.customers cus
LEFT JOIN temp_tables.regions reg
ON LOWER(cus.city) = LOWER(reg.city)
AND LOWER(cus.state) = LOWER(reg.state)
GROUP BY tamanho_cidade
ORDER BY total_clientes DESC;

SELECT 
	tb1.cpf,
    re.size
FROM tabela_1
INNER JOIN regions;

SHOW TABLES;
SHOW TABLES FROM sales;