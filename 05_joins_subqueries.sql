-- Agrupamento

/*
 CREATE TABLE tipos(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(60) NOT NULL
 );

 CREATE TABLE fabricantes(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(60) NOT NULL
 );

 CREATE TABLE produtos(
	id SERIAL PRIMARY KEY, 
	nome VARCHAR(60) NOT NULL,
	id_fabricante INT REFERENCES fabricantes(id) NOT NULL,
	quantidade INT NOT NULL,
	id_tipo INT REFERENCES tipos(id) NOT NULL
 );

 INSERT INTO tipos (nome) VALUES ('Console');
 INSERT INTO tipos (nome) VALUES ('Notebook');
 INSERT INTO tipos (nome) VALUES ('Celular');
 INSERT INTO tipos (nome) VALUES ('Smartphone');
 INSERT INTO tipos (nome) VALUES ('Sofa');
 INSERT INTO tipos (nome) VALUES ('Armario');
 INSERT INTO tipos (nome) VALUES ('Refrigerador');

 INSERT INTO fabricantes (nome) VALUES ('Sony');
 INSERT INTO fabricantes (nome) VALUES ('Dell');
 INSERT INTO fabricantes (nome) VALUES ('Microsoft');
 INSERT INTO fabricantes (nome) VALUES ('Samsung');
 INSERT INTO fabricantes (nome) VALUES ('Apple');
 INSERT INTO fabricantes (nome) VALUES ('Beline');
 INSERT INTO fabricantes (nome) VALUES ('Magno');
 INSERT INTO fabricantes (nome) VALUES ('CCE');
 INSERT INTO fabricantes (nome) VALUES ('Nintendo');

 INSERT INTO produtos (nome, id_fabricante, quantidade, id_tipo) VALUES ('Playstation 3', 1, 100, 1);
 INSERT INTO produtos (nome, id_fabricante, quantidade, id_tipo) VALUES ('Core 2 Duo 4GB RAM 500GB HD', 2, 200, 2);
 INSERT INTO produtos (nome, id_fabricante, quantidade, id_tipo) VALUES ('Xbox 360 120GB', 3, 350, 1);
 INSERT INTO produtos (nome, id_fabricante, quantidade, id_tipo) VALUES ('GT-I6220 Quad band', 4, 300, 3);
 INSERT INTO produtos (nome, id_fabricante, quantidade, id_tipo) VALUES ('iPhone 4 32GB', 5, 50, 4);
 INSERT INTO produtos (nome, id_fabricante, quantidade, id_tipo) VALUES ('Playstation 2', 1, 100, 1);
 INSERT INTO produtos (nome, id_fabricante, quantidade, id_tipo) VALUES ('Sofa Estofado', 6, 200, 5);
 INSERT INTO produtos (nome, id_fabricante, quantidade, id_tipo) VALUES ('Armario de Serviço', 7, 50, 6);
 INSERT INTO produtos (nome, id_fabricante, quantidade, id_tipo) VALUES ('Refrigerador 420L', 8, 200, 7);
 INSERT INTO produtos (nome, id_fabricante, quantidade, id_tipo) VALUES ('Wii 120GB', 8, 250, 1);
*/

-- Group By
/*
 SELECT t.nome AS Tipo, f.nome AS Fabricante, SUM(p.quantidade) AS Quantidade_em_Estoque 
	FROM tipos AS t, fabricantes AS f, produtos AS p 
    	WHERE t.id = p.id_tipo AND f.id = p.id_fabricante 
    	GROUP BY t.nome, f.nome;
*/

-- Having
/*
 SELECT t.nome AS Tipo, f.nome AS Fabricante, SUM(p.quantidade) AS Quantidade_em_Estoque 
	FROM tipos AS t, fabricantes AS f, produtos AS p 
    	WHERE t.id = p.id_tipo AND f.id = p.id_fabricante 
    	GROUP BY t.nome, f.nome
    	HAVING SUM(p.quantidade) > 200;
*/		

-- Order By ASC
/*
SELECT id, nome, id_fabricante, quantidade, id_tipo 
FROM produtos 
ORDER BY id DESC LIMIT 3;
*/

/*
SELECT id, nome, id_tipo, id_fabricante, quantidade 
FROM produtos 
	ORDER BY id ASC;
*/

-- Order by DESC

/*
SELECT id, nome, id_tipo, id_fabricante, quantidade 
FROM produtos 
	ORDER BY quantidade DESC LIMIT 5;
*/

-- Data Atual
-- SELECT CURRENT_DATE AS Data_Atual;

-- Hora Atual
-- SELECT CURRENT_TIME AS Hora_Atual;

-- Calcular data futura
 -- SELECT CURRENT_DATE + INTERVAL '3 DAY' AS Data_Vencimento;

-- SELECT CURRENT_DATE + INTERVAL '1 MONTH' AS Data_Vencimento;

-- SELECT CURRENT_DATE + INTERVAL '2 YEAR' AS Data_Vencimento;

-- Calcular data passada 
-- SELECT CURRENT_DATE - INTERVAL '3 DAY' AS Data_Matricula;

-- SELECT CURRENT_DATE - INTERVAL '1 MONTH' AS Data_Matricula;

-- SELECT CURRENT_DATE - INTERVAL '2 YEAR' AS Data_Matricula;

-- Diferenca entre datas

-- Em anos
-- SELECT DATE_PART('year', '2019-01-01'::date) - DATE_PART('year', '2011-10-02'::date) AS Em_anos;

-- Em meses
-- SELECT (DATE_PART('year', '2019-01-01'::date) - DATE_PART('year', '2011-10-02'::date)) * 12 +
--	(DATE_PART('month', '2019-01-01'::date) - DATE_PART('month', '2011-10-02'::date)) AS Em_meses;

-- Em semanas
-- SELECT TRUNC(DATE_PART('day', '2019-01-01'::timestamp - '2011-12-22'::timestamp)/7) AS Em_Semanas;

-- Em dias
-- SELECT DATE_PART('day', '2019-01-01'::timestamp - '2011-10-02'::timestamp) AS Em_dias;

-- Em Horas
-- SELECT DATE_PART('day', '2019-01-01 11:55'::timestamp - '2019-01-01 09:55'::timestamp) * 24 + 
--       DATE_PART('hour', '2019-01-01 11:55'::timestamp - '2019-01-01 09:55'::timestamp) AS Em_horas;

-- Em Minutos
-- SELECT (DATE_PART('day', '2019-01-01 11:55'::timestamp - '2019-01-01 09:55'::timestamp) * 24 + 
--         DATE_PART('hour', '2019-01-01 11:55'::timestamp - '2019-01-01 09:55'::timestamp)) * 60 +
--         DATE_PART('minute', '2019-01-01 11:55'::timestamp - '2019-01-01 09:55'::timestamp) AS Em_minutos;


-- Em Segundos
-- SELECT ((DATE_PART('day', '2019-01-01 11:55'::timestamp - '2019-01-01 09:55'::timestamp) * 24 + 
--         DATE_PART('hour', '2019-01-01 11:55'::timestamp - '2019-01-01 09:55'::timestamp)) * 60 +
--         DATE_PART('minute', '2019-01-01 11:55'::timestamp - '2019-01-01 09:55'::timestamp)) * 60 +
--         DATE_PART('second', '2019-01-01 11:55'::timestamp - '2019-01-01 09:55'::timestamp) AS Em_segundos;

-- Formatando data no PostgreSQL
-- SELECT TO_CHAR(CURRENT_DATE, 'dd/mm/YYYY') AS Data_Atual;

-- SELECT TO_CHAR(NOW(), 'dd/mm/YYYY HH24:MM:SS') AS Data_Hora_Atual;

-- DAYNAME PostgreSQL

-- Com inicial maiuscula
-- SELECT TO_CHAR(CURRENT_TIMESTAMP, 'Day') AS Dia_da_Semana;

-- Com short maiuscula
-- SELECT TO_CHAR(CURRENT_TIMESTAMP, 'Dy') AS Dia_da_Semana;

-- Com inicial minuscula
-- SELECT TO_CHAR(CURRENT_TIMESTAMP, 'day') AS Dia_da_Semana;

-- Com short minuscula
-- SELECT TO_CHAR(CURRENT_TIMESTAMP, 'dy') AS Dia_da_Semana;

-- Tudo maiuscula
-- SELECT TO_CHAR(CURRENT_TIMESTAMP, 'DAY') AS Dia_da_Semana;

-- Mes tudo maiusculo
-- SELECT TO_CHAR(CURRENT_TIMESTAMP, 'MONTH') AS Mes;

-- Mes tudo minusculo
-- SELECT TO_CHAR(CURRENT_TIMESTAMP, 'month') AS Mes;

-- Mes iniciais minusculo
-- SELECT TO_CHAR(CURRENT_TIMESTAMP, 'mon') AS Mes;

-- Mes iniciais maiusculo
-- SELECT TO_CHAR(CURRENT_TIMESTAMP, 'Mon') AS Mes;

-- SHOW lc_time;

-- SET lc_time='pt_BR.UTF8';

-- SELECT TO_CHAR(CURRENT_TIMESTAMP, 'TMDay') AS Dia_da_Semana;

-- SELECT TO_CHAR(CURRENT_TIMESTAMP, 'TMMonth') AS Mes;

-- Extraindo partes de uma data
-- SELECT EXTRACT(MONTH FROM CURRENT_TIMESTAMP) AS Numero_do_Mes;

-- SELECT EXTRACT(DAY FROM CURRENT_TIMESTAMP) AS Dia_do_Mes;

-- SELECT EXTRACT(YEAR FROM CURRENT_TIMESTAMP) AS Ano;

-- SELECT EXTRACT(WEEK FROM CURRENT_TIMESTAMP) AS Numero_da_Semana;

-- SELECT NOW() AS Data_hora;

-- SELECT EXTRACT(HOUR FROM CURRENT_TIMESTAMP) AS hora;

-- SELECT EXTRACT(Minute FROM CURRENT_TIMESTAMP) AS Minuto;

-- SELECT EXTRACT(Second FROM CURRENT_TIMESTAMP) AS Segundo;

-- SELECT EXTRACT(millisecond FROM CURRENT_TIMESTAMP) AS MiliSegundo;

-- Convertendo de segundos para hora
-- SELECT TO_CHAR((71741.733159 || 'seconds')::interval, 'HH24:MM:SS') AS Tempo_Total;

-- SELECT EXTRACT(EPOCH FROM CURRENT_TIMESTAMP::time) AS Em_Segundos;
