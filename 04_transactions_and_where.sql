-- CREATE DATABASE agregacao;
-- Creates the database used in this module

-- =========================
-- TABELAS / TABLES
-- =========================

-- Categorias de produtos
-- Product categories
CREATE TABLE categorias(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(60) NOT NULL
);

-- Produtos
-- Products
CREATE TABLE produtos(
	id SERIAL PRIMARY KEY, 
	descricao VARCHAR(60) NOT NULL,
	preco_venda DECIMAL(8,2) NOT NULL,
	preco_custo MONEY NOT NULL,
	id_categoria INT REFERENCES categorias(id) NOT NULL
);

-- =========================
-- INSERTS
-- =========================

-- Categorias
-- Categories
INSERT INTO categorias (nome) VALUES ('Material Escolar');
INSERT INTO categorias (nome) VALUES ('Acessorio Informatica');
INSERT INTO categorias (nome) VALUES ('Material Escritorio');
INSERT INTO categorias (nome) VALUES ('Game');

-- Produtos
-- Products
INSERT INTO produtos (descricao, preco_venda, preco_custo, id_categoria) VALUES ('Caderno', 5.45, 2.30, 1);
INSERT INTO produtos (descricao, preco_venda, preco_custo, id_categoria) VALUES ('Caneta', 1.20, 0.45, 1);
INSERT INTO produtos (descricao, preco_venda, preco_custo, id_categoria) VALUES ('Pendrive 32GB', 120.54, 32.55, 2);
INSERT INTO produtos (descricao, preco_venda, preco_custo, id_categoria) VALUES ('Mouse', 17.00, 4.30, 2);

-- =========================
-- FUNÇÕES DE AGREGAÇÃO
-- AGGREGATION FUNCTIONS
-- =========================

-- Maior preço de venda
-- Maximum sale price
SELECT MAX(preco_venda)
FROM produtos;

-- Menor preço de venda
-- Minimum sale price
SELECT MIN(preco_venda) 
FROM produtos;

-- Média simples (preco_custo não funciona diretamente por ser MONEY)
-- Simple average (MONEY type does not work directly)
SELECT AVG(preco_venda)
FROM produtos;

-- Média formatada como string
-- Average formatted as string
SELECT TO_CHAR(AVG(preco_venda),'99999999D99') AS media
FROM produtos;

-- Média convertida para numérico com 2 casas decimais
-- Average converted to numeric with 2 decimal places
SELECT ROUND(AVG(preco_venda)::numeric, 2)
FROM produtos;

-- Média do tipo MONEY convertendo para numérico
-- Average of MONEY values converted to numeric
SELECT ROUND(AVG(preco_custo::numeric), 2)
FROM produtos;

-- Média com mais precisão
-- Average with higher precision
SELECT ROUND(AVG(preco_venda), 4)
FROM produtos;

-- =========================
-- COUNT
-- =========================

-- Quantidade de produtos por categoria
-- Product count by category
SELECT COUNT(preco_venda) AS quantidade
FROM produtos
WHERE id_categoria = 1;

-- =========================
-- GROUP BY
-- =========================

-- Maior preço por categoria
-- Maximum price per category
SELECT id_categoria, MAX(preco_venda) 
FROM produtos 
GROUP BY id_categoria;

-- =========================
-- HAVING
-- =========================

-- Categorias cujo maior preço é maior que 10
-- Categories where the maximum price is greater than 10
SELECT id_categoria, MAX(preco_venda) 
FROM produtos 
GROUP BY id_categoria 
HAVING MAX(preco_venda) > 10;
