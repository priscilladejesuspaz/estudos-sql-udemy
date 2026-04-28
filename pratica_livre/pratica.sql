use sales;
-- Liste o first_name, last_name dos clientes junto com a paid_date de cada compra finalizada (ou seja, onde paid_date não é nulo).

SELECT 
	CONCAT(c.first_name, ' ', c.last_name) as nome_cliente,
    f.paid_date as compra,
    f.finish_checkout_date as compra_final
FROM customers c
INNER JOIN funnel f
	ON c.customer_id = f.customer_id
WHERE f.paid_date IS NOT NULL;

-- Agora traga: first_name, last_name do cliente, brand e model do produto, e o discount da visita.
SELECT 
	CONCAT(first_name, ' ', last_name) AS nome_completo,
    p.brand,  
	p.model,
    f.discount
FROM customers c
INNER JOIN funnel f
	ON c.customer_id = f.customer_id
JOIN products p
    ON f.product_id = p.product_id;

-- Nem todo cliente visitou uma loja. Traga todos os clientes (first_name, last_name) e, para os que tiverem registro no funnel, mostre também a store_id. Clientes sem visita devem aparecer com NULL na store.
SELECT 
	CONCAT(first_name, ' ', last_name) AS nome_completo,
    f.visit_id, 
    f.visit_page_date,
    f.start_checkout_date, 
    f.finish_checkout_date,
    sto.store_id
FROM customers c 
LEFT JOIN funnel f 
	ON c.customer_id = f.customer_id
JOIN stores sto
	ON f.store_id = f.store_id
WHERE f.visit_page_date IS NULL 
GROUP BY store_id
HAVING f.visit_page_date IS NOT NULL;