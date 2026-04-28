customers(id, name, city)
orders(id, customer_id, order_date, total, status)
products(id, name, price)
order_items(order_id, product_id, quantity)

"Quanto cada cliente gastou no total? Me mostra o nome do cliente e o valor total gasto, ordenado do maior para o menor. Quero ver só quem realmente fez pedido."

SELECT 
    SUM(total) AS gasto_total,
    c.name AS nome_cliente
FROM customers c
INNER JOIN orders o
    ON c.id = o.customer_id
GROUP BY nome_cliente
ORDER BY gasto_total DESC;

Contexto: O gerente financeiro interrompe a reunião e pede:

"Aquela lista de gasto por cliente tá boa, mas eu só quero ver os pedidos com status 'delivered'. E só me mostra clientes que gastaram mais de 1000 no total."

SELECT 
    SUM(o.total) AS gasto_total,
    c.name AS nome_cliente
FROM customers c
INNER JOIN orders o
    ON c.id = o.customer_id
WHERE o.status = 'delivered'
GROUP BY c.name
HAVING o.total > 1000
ORDER BY c.name DESC;

Contexto: O gerente de produto chega com uma nova demanda:

"Quero saber quais produtos foram mais vendidos. Me mostra o nome do produto, a quantidade total vendida e o valor total gerado por cada produto. Ordena pelos mais vendidos."

Dataset:
products(id, name, price)
order_items(order_id, product_id, quantity)
Dica mental:

"Preciso do name de products e SUM(quantity) e SUM(quantity * price) de order_items, ligados por product_id"
SELECT 
	p.name,
	sum(o.quantity) AS total_quantidade,
    sum(o.quantity * p.price) AS receita_total
FROM products p 
INNER JOIN order_items o
	ON p.id = o.product_id
GROUP BY p.name
ORDER BY total_quantidade DESC;

Contexto: O gerente comercial volta com uma demanda mais complexa:

"
Dataset:
customers(id, name, city)
orders(id, customer_id, order_date, total, status)
order_items(order_id, product_id, quantity)
products(id, name, price)
Dica mental:

"Preciso ligar customers → orders → order_items → products em sequência"
Quero ver o nome do cliente, o nome do produto que ele comprou, a quantidade e o valor total gasto por ele nesse produto. Traz só os pedidos com status 'delivered'."
Escreve o caminho dos JOINs antes da query: c.name, p.name, oi.quantity, SUM(p.price), o.status
SELECT 
	c.name, 
    p.name,
    oi.quantity,
    SUM(p.price)
    o.status

SELECT 
    c.name, 
    p.name,
    oi.quantity,
    SUM(quantity * price)
FROM customers c
INNER JOIN orders o
    ON c.id = o.customer_id
INNER JOIN order_items oi
    ON o.id = oi.order_id
INNER JOIN products p 
    ON oi.product_id = p.id
WHERE status = 'delivered'
GROUP BY c.name, p.name, oi.quantity;

