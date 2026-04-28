# Estudos de SQL - Curso Udemy

## Sobre

Exercícios, práticas livres e projetos desenvolvidos durante o curso de SQL na Udemy.
Cada módulo tem os enunciados originais e as resoluções correspondentes.

## Ferramentas
- MySQL / MySQL Workbench

## Estrutura dos exercícios

```
06_sql_udemy/
├── exercicios/
│   ├── 01_comandos_basicos/       → SELECT, DISTINCT, WHERE, ORDER BY, LIMIT
│   ├── 02_operadores/             → Aritméticos, Comparação, Lógicos
│   ├── 03_joins/                  → INNER JOIN, LEFT JOIN, RIGHT JOIN
│   ├── 04_funcoes_agregadas/      → COUNT, SUM, AVG, GROUP BY, HAVING
│   ├── 05_subqueries/             → Subqueries simples e correlacionadas
│   ├── 06_tratamento_dados/       → Conversões, texto, datas, funções, UNION
│   └── 07_tabelas_linhas_colunas/ → CREATE, INSERT, UPDATE, DELETE, ALTER
├── projetos/                      → Projetos finais do curso
│   ├── projeto_1_-_dashboard_de_vendas.xlsx / (resolucao).xlsx
│   ├── 06-projeto_1_-_dashboard_de_vendas_(resolucao).txt
│   ├── projeto_2_-_perfil_dos_leads.xlsx / (resolucao).xlsx
│   ├── 07-projeto_2_-_perfil_dos_leads_(resolucao).txt
│   ├── criacao_tabela_vendas.sql
│   └── manipulacao_dos_dados.sql
├── pratica_livre/                 → Scripts de prática e exploração pessoal
│   ├── pratica_geral_-_curso_udemy.sql
│   ├── pratica_geral_-_resposta_-_curso_udemy.sql
│   └── ...outros scripts de prática
└── recursos/
    ├── guia_comandos.xlsx         → Guia de referência dos comandos SQL
    └── diagrama.png               → Diagrama do banco de dados usado no curso
```

## Convenção dos arquivos

- Arquivos **sem** `(resolucao)` no nome = enunciado / exercício
- Arquivos **com** `(resolucao)` no nome = gabarito / resposta

## Conteúdo coberto

- Comandos básicos: `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`, `DISTINCT`
- Operadores: aritméticos, de comparação (`=`, `<>`, `BETWEEN`, `IN`, `LIKE`) e lógicos (`AND`, `OR`, `NOT`)
- Joins: `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `FULL JOIN`
- Funções agregadas: `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`, `GROUP BY`, `HAVING`
- Subqueries: simples, correlacionadas, com `EXISTS`
- Tratamento de dados: `CAST`, `CONVERT`, funções de texto e data, `UNION`
- DDL e DML: `CREATE TABLE`, `INSERT`, `UPDATE`, `DELETE`, `ALTER TABLE`

## Projetos finais

**Projeto 1 — Dashboard de Vendas**: análise de desempenho de vendas com queries para faturamento, produtos mais vendidos e tendência mensal.

**Projeto 2 — Perfil dos Leads**: análise do perfil de clientes/leads com segmentação e métricas de conversão.
