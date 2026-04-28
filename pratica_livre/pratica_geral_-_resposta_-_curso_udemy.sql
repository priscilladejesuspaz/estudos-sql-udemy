-- 1
SELECT * FROM products;

-- 2
SELECT name, price FROM products;

-- 3
SELECT DISTINCT state FROM customers;

-- 4
SELECT * FROM customers WHERE state = 'SP';

-- 5
SELECT * FROM products WHERE price > 100;


-- 6
SELECT * FROM products ORDER BY price ASC;

-- 7
SELECT * FROM products ORDER BY price DESC;

-- 8
SELECT * FROM products ORDER BY price DESC LIMIT 5;

-- 9
SELECT * FROM customers ORDER BY created_at DESC LIMIT 10;


-- 10
SELECT name, price, price * 1.1 AS new_price FROM products;

-- 11
SELECT * FROM products WHERE price BETWEEN 50 AND 200;

-- 12
SELECT * FROM customers WHERE state <> 'SP';

-- 13
SELECT * FROM products 
WHERE price > 100 AND category = 'Eletrônicos';


-- 14
SELECT * 
FROM orders o
INNER JOIN customers c ON o.customer_id = c.id;

-- 15
SELECT o.id, c.name
FROM orders o
INNER JOIN customers c ON o.customer_id = c.id;

-- 16
SELECT c.name, o.id
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id;


-- 17
SELECT COUNT(*) FROM orders;

-- 18
SELECT SUM(total_amount) FROM orders;

-- 19
SELECT AVG(price) FROM products;

-- 20
SELECT state, COUNT(*) 
FROM customers
GROUP BY state;


-- 21
SELECT state, COUNT(*) 
FROM customers
GROUP BY state
HAVING COUNT(*) > 10;

-- 22
SELECT category, AVG(price)
FROM products
GROUP BY category
HAVING AVG(price) > 100;


-- 23
SELECT *
FROM products
WHERE price > (SELECT AVG(price) FROM products);

-- 24
SELECT customer_id, COUNT(*) 
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > (
    SELECT AVG(qtd)
    FROM (
        SELECT COUNT(*) AS qtd
        FROM orders
        GROUP BY customer_id
    ) sub
);


-- 25
SELECT name FROM customers
UNION
SELECT name FROM suppliers;

-- 26
SELECT name FROM customers
UNION ALL
SELECT name FROM suppliers;


-- 27
SELECT customer_id, SUM(total_amount) AS total
FROM orders
GROUP BY customer_id
ORDER BY total DESC
LIMIT 3;

-- 28
SELECT state, product_id, COUNT(*) AS total
FROM orders o
JOIN customers c ON o.customer_id = c.id
JOIN order_items oi ON o.id = oi.order_id
GROUP BY state, product_id
ORDER BY total DESC;

-- 29
SELECT c.*
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
WHERE o.id IS NULL;

-- 30
SELECT c.state, SUM(o.total_amount)
FROM orders o
JOIN customers c ON o.customer_id = c.id
GROUP BY c.state
HAVING SUM(o.total_amount) > 1000;

-- =========================
-- 31. ADICIONAR COLUNA
-- =========================

alter table sales.customers
add customer_age int;


-- =========================
-- 32. VALIDAR CRIAÇÃO
-- =========================

select * from sales.customers
limit 10;


-- =========================
-- 33. ATUALIZAR COLUNA
-- =========================

update sales.customers
set customer_age = datediff('years', birth_date, current_date)
where true;


-- =========================
-- 34. VALIDAR DADOS
-- =========================

select * from sales.customers
limit 10;


-- =========================
-- 35. ALTERAR TIPO
-- =========================

alter table sales.customers
alter column customer_age type varchar;


-- =========================
-- 36. VALIDAR ALTERAÇÃO
-- =========================

select * from sales.customers
limit 10;


-- =========================
-- 37. RENOMEAR COLUNA
-- =========================

alter table sales.customers
rename column customer_age to age;


-- =========================
-- 38. VALIDAR RENOMEAÇÃO
-- =========================

select * from sales.customers
limit 10;


-- =========================
-- 39. DELETAR COLUNA
-- =========================

alter table sales.customers
drop column age;


-- =========================
-- 40. VALIDAR REMOÇÃO
-- =========================

select * from sales.customers
limit 10;