CREATE database vendas_analytics;
CREATE TABLE vendas ( 
data_pedido DATE, 
vendas DECIMAL (10,2),
lucro DECIMAL (10,2), 
desconto DECIMAL (4,2),
categoria VARCHAR (50), 
região VARCHAR (20)
); 
use vendas_analytics;

drop table vendas;
rename table vvendas to vendas;

