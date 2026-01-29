-- =====================================================
-- AGRUPAMENTO, ORDENAÇÃO, DATAS E SUBCONSULTAS
-- Grouping, Ordering, Dates and Subqueries
-- =====================================================

/*
-----------------------------------------------------
CRIAÇÃO DAS TABELAS
Table Creation
-----------------------------------------------------

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

-----------------------------------------------------
INSERÇÃO DE DADOS
Data Insertion
-----------------------------------------------------

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

-- =====================================================
-- GROUP BY
-- Agrupamento de dados
-- Data grouping
-- =====================================================
/*
SELECT t.nome AS Tipo, f.nome AS Fabricante, SUM(p.quantidade) AS Quantidade_em_Estoque 
FROM tipos AS t, fabricantes AS f, produtos AS p 
WHERE t.id = p.id_tipo 
  AND f.id = p.id_fabricante 
GROUP BY t.nome, f.nome;
*/

-- =====================================================
-- HAVING
-- Filtro após agregação
-- Filter after aggregation
-- =====================================================
/*
SELECT t.nome AS Tipo, f.nome AS Fabricante, SUM(p.quantidade) AS Quantidade_em_Estoque 
FROM tipos AS t, fabricantes AS f, produtos AS p 
WHERE t.id = p.id_tipo 
  AND f.id = p.id_fabricante 
GROUP BY t.nome, f.nome
HAVING SUM(p.quantidade) > 200;
*/

-- =====================================================
-- ORDER BY
-- Ordenação de resultados
-- Result ordering
-- =====================================================

-- ORDER BY DESC
/*
SELECT id, nome, id_fabricante, quantidade, id_tipo 
FROM produtos 
ORDER BY id DESC 
LIMIT 3;
*/

-- ORDER BY ASC
/*
SELECT id, nome, id_tipo, id_fabricante, quantidade 
FROM produtos 
ORDER BY id ASC;
*/

-- ORDER BY quantidade DESC
/*
SELECT id, nome, id_tipo, id_fabricante, quantidade 
FROM produtos 
ORDER BY quantidade DESC 
LIMIT 5;
*/

-- =====================================================
-- DATAS E HORAS
-- Dates and Times
-- =====================================================

-- Data atual | Current date
-- SELECT CURRENT_DATE AS Data_Atual;

-- Hora atual | Current time
-- SELECT CURRENT_TIME AS Hora_Atual;

-- Datas futuras | Future dates
-- SELECT CURRENT_DATE + INTERVAL '3 DAY'   AS Data_Vencimento;
-- SELECT CURRENT_DATE + INTERVAL '1 MONTH' AS Data_Vencimento;
-- SELECT CURRENT_DATE + INTERVAL '2 YEAR'  AS Data_Vencimento;

-- Datas passadas | Past dates
-- SELECT CURRENT_DATE - INTERVAL '3 DAY'   AS Data_Matricula;
-- SELECT CURRENT_DATE - INTERVAL '1 MONTH' AS Data_Matricula;
-- SELECT CURRENT_DATE - INTERVAL '2 YEAR'  AS Data_Matricula;

-- =====================================================
-- DIFERENÇA ENTRE DATAS
-- Date difference calculations
-- =====================================================

-- Em anos | In years
-- SELECT DATE_PART('year', '2019-01-01'::date) - DATE_PART('year', '2011-10-02'::date) AS Em_anos;

-- Em meses | In months
-- SELECT (DATE_PART('year', '2019-01-01'::date) - DATE_PART('year', '2011-10-02'::date)) * 12 +
--        (DATE_PART('month','2019-01-01'::date) - DATE_PART('month','2011-10-02'::date)) AS Em_meses;

-- Em semanas | In weeks
-- SELECT TRUNC(DATE_PART('day','2019-01-01'::timestamp - '2011-12-22'::timestamp)/7) AS Em_Semanas;

-- Em dias | In days
-- SELECT DATE_PART('day','2019-01-01'::timestamp - '2011-10-02'::timestamp) AS Em_dias;

-- Em horas | In hours
-- SELECT DATE_PART('day','2019-01-01 11:55'::timestamp - '2019-01-01 09:55'::timestamp) * 24 +
--        DATE_PART('hour','2019-01-01 11:55'::timestamp - '2019-01-01 09:55'::timestamp) AS Em_horas;

-- Em minutos | In minutes
-- SELECT ((DATE_PART('day','2019-01-01 11:55'::timestamp - '2019-01-01 09:55'::timestamp) * 24 +
--          DATE_PART('hour','2019-01-01 11:55'::timestamp - '2019-01-01 09:55'::timestamp)) * 60 +
--          DATE_PART('minute','2019-01-01 11:55'::timestamp - '2019-01-01 09:55'::timestamp)) AS Em_minutos;

-- Em segundos | In seconds
-- SELECT EXTRACT(EPOCH FROM CURRENT_TIMESTAMP::time) AS Em_Segundos;
