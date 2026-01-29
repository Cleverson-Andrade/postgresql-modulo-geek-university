-- CREATE DATABASE secao04;
-- Cria o banco de dados da seção
-- Creates the database for this section


-- =========================
-- TABELA: tipos_produto
-- TABLE: product_types
-- =========================

CREATE TABLE tipos_produto (
	codigo SERIAL PRIMARY KEY,
	descricao VARCHAR(30) NOT NULL
);

-- =========================
-- TABELA: produtos
-- TABLE: products
-- =========================

CREATE TABLE produtos (
	codigo SERIAL PRIMARY KEY, 
	descricao VARCHAR(30) NOT NULL,
	preco MONEY NOT NULL,
	codigo_tipo INT REFERENCES tipos_produto(codigo) NOT NULL
);

-- =========================
-- INSERTS - TIPOS DE PRODUTO
-- INSERTS - PRODUCT TYPES
-- =========================

INSERT INTO tipos_produto (descricao) VALUES ('Computador');
INSERT INTO tipos_produto (descricao) VALUES ('Impressora');

-- =========================
-- INSERTS - PRODUTOS
-- INSERTS - PRODUCTS
-- =========================

INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Desktop', '1200', 1);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Laptop', '1800', 1);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Impr. Jato Tinta', '300', 2);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Impr. Laser', '500', 2);

-- =========================
-- SELECTS BÁSICOS
-- BASIC SELECT STATEMENTS
-- =========================

SELECT *
FROM tipos_produto;

SELECT codigo, descricao
FROM tipos_produto;

SELECT *
FROM produtos;

SELECT codigo, descricao, codigo_tipo
FROM produtos;

-- =========================
-- ALIAS (APELIDOS DE COLUNAS)
-- COLUMN ALIASES
-- =========================

SELECT 
	p.codigo AS "Código",
	p.descricao AS "Descrição",
	p.preco AS "Preço",
	p.codigo_tipo AS "Código_do_Tipo"
FROM produtos AS p;

-- =========================
-- UPDATE
-- Atualiza dados existentes
-- Updates existing data
-- =========================

-- Exemplo / Example:
-- Alterar o preço do produto "Desktop" para 1300
-- Change the price of the "Desktop" product to 1300

-- UPDATE produtos
-- SET preco = '1300'
-- WHERE descricao = 'Desktop';

-- Alterar a descrição de "Computador" para "Máquina"
-- Change description from "Computador" to "Máquina"

-- UPDATE tipos_produto
-- SET descricao = 'Máquina'
-- WHERE descricao = 'Computador';

-- =========================
-- DELETE
-- Remove registros da tabela
-- Deletes records from a table
-- =========================

-- Remover o produto "Laptop"
-- Remove the "Laptop" product

-- DELETE FROM produtos
-- WHERE descricao = 'Laptop';

-- Remover o tipo "Impressora"
-- Remove the "Impressora" type
-- (Só funciona se não houver produtos relacionados)
-- (Only works if no related products exist)

-- DELETE FROM tipos_produto
-- WHERE descricao = 'Impressora';

-- =========================
-- ALTER TABLE
-- Modifica estrutura da tabela
-- Modifies table structure
-- =========================

-- Adicionar a coluna "peso"
-- Add the "peso" column

-- ALTER TABLE tipos_produto ADD peso DECIMAL(8,2);

-- =========================
-- DROP TABLE / DROP DATABASE
-- Comandos destrutivos
-- Destructive commands
-- =========================

-- DROP TABLE tipos_produto;
-- DROP DATABASE secao03;

-- =========================
-- TRANSAÇÕES
-- TRANSACTIONS
-- =========================

-- BEGIN TRANSACTION / COMMIT
-- Inicia e confirma uma transação
-- Starts and commits a transaction

-- BEGIN TRANSACTION;
-- INSERT INTO tipos_produto (descricao) VALUES ('Tipo C');
-- INSERT INTO tipos_produto (descricao) VALUES ('Tipo D');
-- COMMIT;

-- BEGIN TRANSACTION / ROLLBACK
-- Inicia e desfaz uma transação
-- Starts and rolls back a transaction

-- BEGIN TRANSACTION;
-- INSERT INTO tipos_produto (descricao) VALUES ('Tipo A');
-- INSERT INTO tipos_produto (descricao) VALUES ('Tipo B');
-- ROLLBACK;

-- =========================
-- FILTROS COM WHERE
-- FILTERING WITH WHERE
-- =========================

SELECT *
FROM tipos_produto
WHERE codigo = 1;

SELECT *
FROM tipos_produto
WHERE codigo = 2;

SELECT *
FROM produtos
WHERE descricao = 'Laptop';

SELECT *
FROM produtos
WHERE preco <= 'R$500';

-- =========================
-- JUNÇÃO DE TABELAS
-- TABLE JOINS
-- =========================

SELECT 
	p.codigo,
	p.descricao,
	p.preco,
	tp.descricao AS tipo_produto
FROM tipos_produto AS tp
INNER JOIN produtos AS p
	ON p.codigo_tipo = tp.codigo;
