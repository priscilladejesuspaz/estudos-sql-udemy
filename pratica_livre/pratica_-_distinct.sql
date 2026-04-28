-- PRÁTICA DO COMANDO DISTINCT

/* 
Pergunta de negócio:

1.  Quais marcas de carro existem na base de produtos?

2. Variações para treinar:

3. Quantos estados diferentes existem na base de clientes?

4. Quais anos de modelo distintos existem nos produtos?

Esse comando serve para explorar dados.
*/ 

show tables;
select * from customers;
select * from funnel;
select * from products;
select * from stores;

USE sales;
-- 1: 
SELECT brand
FROM products;
-- 2
SELECT DISTINCT state 
FROM customers; 
-- 3:
SELECT DISTINCT model_year, model
FROM products;

-- PRÁTICA DO COMANDO WHERE
/*
Perguntas de negócio:

Quais clientes moram no estado de Santa Catarina?

Outras variações:

Quais clientes moram em SC ou MS?

Quais clientes têm mais de 30 anos?

Quais clientes nasceram antes de 1991?

Isso treina filtro de dados.
*/

-- 1:
SELECT *
FROM customers
WHERE state = 'SC';
-- 2: 
SELECT * 
FROM customers
WHERE state IN ('SC','MT'); -- melhor opção;
-- WHERE state = 'SC' OR state = 'MT';

SELECT 	*
FROM customers
WHERE birth_date < '1996-01-01';

SELECT *
FROM customers
WHERE birth_date < '1991-01-01';

