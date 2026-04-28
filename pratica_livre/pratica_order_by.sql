-- COMANDO ORDER BY

-- Perguntas de negócio:

1. Quais são os produtos ordenados do mais barato para o mais caro?
SELECT price, brand
FROM products
ORDER BY price ASC;
-- Outras variações:

2. Quais são os produtos mais caros?
SELECT price, brand
FROM products
ORDER BY price DESC
LIMIT 5;

3. Quais são os clientes com maior score?
SELECT score, first_name
FROM customers
ORDER BY score DESC
LIMIT 5;
Ordenar estados em ordem alfabética.
SELECT state
FROM customers
ORDER BY state ASC;

-- COMANDO LIMIT

Pergunta de negócio:

4. Quais são os 10 produtos mais caros?
SELECT price, brand
FROM products
ORDER BY price DESC
LIMIT 10;
Outras variações:

5. Quais são os 10 clientes mais novos?
SELECT *
FROM customers
ORDER BY birth_date DESC
LIMIT 10;

6. Quais são os 10 primeiros registros da tabela?
SELECT *
FROM customers
LIMIT 10;

LIMIT é muito usado para exploração de dados.

-- Comando de Operadores aritméticos

Pergunta de negócio (do exercício):

7. Quantos salários mínimos cada cliente ganha?
SELECT 
	income,
	ROUND(income / 1200, 2) AS salarios_minimo,
    CONCAT(first_name, ' ', last_name) AS nome_completo 
FROM customers; 

Outras variações:

8. Qual a idade aproximada dos clientes?
SELECT 
	(CURRENT_DATE - birth_date) AS idade_aproximada,
FROM customers;

9. Qual a renda anual dos clientes?
SELECT 
	income,
	income * 12 AS renda_anual
FROM customers; 
 
Aqui você cria colunas calculadas.

-- Operadores de comparação

Pergunta de negócio:

10. Quais clientes ganham mais de 4 salários mínimos?

-- Forma mais simples (mais usada) 
SELECT *
FROM customers
WHERE income > 4800;
-- Forma baseada no cálculo
SELECT *
FROM customers
WHERE income / 1200 > 4;
-- Forma analítica (mais profissional)
SELECT
    CONCAT(first_name, ' ', last_name) AS nome_completo,
    income,
    ROUND(income / 1200, 2) AS salarios_minimos
FROM customers
WHERE income / 1200 > 4;

11. Criar uma coluna indicando se o cliente é CLT.
	/* Opção 1
    SELECT 
		CONCAT(first_name, ' ', last_name) AS nome_completo,
		professional_status,
		CASE 
			WHEN professional_status = 'clt' THEN TRUE 
			ELSE FALSE 
		END AS cliente_clt
	FROM customers; 
*/
SELECT 
    CONCAT(first_name, ' ', last_name) AS nome_completo,
    professional_status,
    CASE 
        WHEN professional_status = 'clt' THEN TRUE
        ELSE FALSE
    END AS cliente_clt
FROM customers;

Isso gera colunas TRUE/FALSE.

-- Operadores lógicos

Perguntas de negócio dos exercícios:

12. Quais clientes ganham entre 4 e 5 salários mínimos?
SELECT *
FROM customers
WHERE income BETWEEN 4800 AND 6000;

13. Quais clientes moram em MG ou MT?
SELECT *
FROM customers 
WHERE state IN ('MG', 'MT');
14. Quais clientes NÃO moram em SP?
SELECT *
FROM customers 
WHERE state NOT IN ('SP');
15. Quais cidades começam com a letra Z?
SELECT *
FROM customers 
WHERE city LIKE 'Z%'; 

Esses usam: BETWEEN, IN, NOT, LIKE

-- Desafio final do arquivo

16. Quais cidades distintas existem no estado de Minas Gerais?
SELECT DISTINCT 
	city, state
FROM customers 
WHERE state = 'MG';

17: Quais foram as 10 compras mais recentes?

select paid_date
from funnel
order by paid_date desc
limit 10;
select score 
from customers;
18: Quais são os 10 clientes com maior score nascidos após 2000?
select 
	score, 
    CONCAT(first_name, ' ', last_name) AS nome_completo
from customers 
where score > 200
order by score desc
limit 10;
Essas combinam vários comandos.

-- Forma correta de pensar SQL

Antes de escrever query sempre pergunte:

1. O que quero ver? → SELECT
2. De qual tabela? → FROM
3. Qual filtro? → WHERE
4. Como ordenar? → ORDER BY
5. Quantos resultados? → LIMIT
🧩 Exemplo completo de raciocínio

Pergunta de negócio:

19. Quais são os 10 clientes com maior score nascidos após 2000?

Raciocínio:

tabela → customers
filtro → birth_date >= 2000
ordem → score DESC
limite → 10

Query:

SELECT *
FROM sales.customers
WHERE birth_date >= '2000-01-01'
ORDER BY score DESC
LIMIT 10;
--  O que você está aprendendo nessa parte

Esses arquivos treinam o bloco mais usado do SQL:

SELECT
FROM
WHERE
ORDER BY
LIMIT

Isso representa 70% das consultas de análise de dados.