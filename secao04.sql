-- CREATE DATABASE secao04;
/*
CREATE TABLE tipos_produto(
	codigo SERIAL PRIMARY KEY,
	descricao VARCHAR(30) NOT NULL
);
*/

/*
CREATE TABLE produtos(
	codigo SERIAL PRIMARY KEY, 
	descricao VARCHAR(30) NOT NULL,
 	preco MONEY NOT NULL,
	codigo_tipo INT REFERENCES tipos_produto(codigo) NOT NULL
);
*/

/*
INSERT INTO tipos_produto (descricao) VALUES ('Computador');
INSERT INTO tipos_produto (descricao) VALUES ('Impressora');
*/

/*
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Desktop', '1200', 1);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Laptop', '1800', 1);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Impr. Jato Tinta', '300', 2);
INSERT INTO produtos (descricao, preco, codigo_tipo) VALUES ('Impr. Laser', '500', 2);
*/

-- SELECT *
-- FROM tipos_produto;

-- SELECT codigo,descricao
-- FROM tipos_produto;

-- SELECT *
-- FROM produtos;

-- SELECT codigo, descricao, codigo_tipo
-- FROM produtos;

-- Alias
--SELECT p.codigo AS Código, p.descricao AS Descrição, p.preco AS Preço, p.codigo_tipo AS Código_do_Tipo
--FROM produtos AS p;

/*
UPDATE: Aletra os dados existentes em uma tabela
Exemplo prático: Mudar o preço de um produto ou a descrição de um tipo de produto.
	Mudar o preço do "Desktop" para 1300:
*/

-- UPDATE produtos
-- SET preco = '1300'
-- WHERE descricao = 'Desktop';

-- 	Mudar a descrição de 'Computador' para 'Máquina':

-- UPDATE tipos_produto
-- SET descricao = 'Máquina'
-- WHERE descricao = 'Computador';

/*
DELETE: Remove as linhas de uma tabela
Exemplo prático: Remover um produto ou um tipo de produto. 
	Remover o "Laptop":
*/

-- DELETE FROM produtos
-- WHERE descricao = 'Laptop';

-- 	Remover o tipo 'Impressora': (Só funciona se não houver produtos com codigo_tipo 2)

-- DELETE FROM tipos_produto
-- WHERE descricao = 'Impressora';

-- Alter: Adiciona uma nova coluna a uma tabela existente.
-- Exemplo prático: Adicionar um campo "peso" atabela tipos_produto.

-- ALTER TABLE tipos_produto ADD peso DECIMAL(8,2);

-- SELECT *
-- FROM tipos_produto;

-- DROP TABLE: Tenta remover uma tabela. Não permite se outra tabela tem uma chave estrageira que depende dela. 
-- Exemplo prático: Tentar remover tipos_produto enquanto produtos ainda referencia tipos_produto.

-- Este comando irá falhar se 'produtos' ainda depender de 'tipos_produto'
-- DROP TABLE tipos_produto;

-- DROP DATABASE: Remove um banco de dados inteiro e todos os seus objetos (tabelas, dados, etc.). É uma ação destrutiva.
-- Exemplo prático: Remover o banco de dados secao03 completamente.
-- DROP DATABASE secao03;

/*
BEGIN TRANSACTION/COMMIT: BEGIN TRANSACTION inicia um "rascunho" de operações. COMMIT 
salva todas as operações feitas desde o BEGIN de forma permanente no banco de dados.

	Exemplo prático: Adicionar 'Tipo C' e 'Tipo D' de forma definitiva.
*/

-- BEGIN TRANSACTION;
--	INSERT INTO tipos_produto (descricao) VALUES ('Tipo C');
--	INSERT INTO tipos_produto (descricao) VALUES ('Tipo D');
-- COMMIT; -- Salva 'Tipo C' e 'Tipo D'

/*
BEGIN TRANSACTION / ROLLBACK: BEGIN TRANSACTION inicia um "rascunho". ROLLBACK desfaz todas as operações feitas
desde o BEGIN, voltando o banco ao estado anterior. Nada é salvo.

	Exemplo prático: Tentar adicionar 'Tipo A' e 'Tipo B', mas depois desistir e não salvá-los.
*/
	
-- BEGIN TRANSACTION;
-- 	INSERT INTO tipos_produto (descricao) VALUES ('Tipo A');
-- 	INSERT INTO tipos_produto (descricao) VALUES ('Tipo B');
-- ROLLBACK; -- Desfaz a inserção de 'Tipo A' e 'Tipo B'

-- Filtrando com WHERE

/*
SELECT *
FROM tipos_produto
	WHERE codigo = 1;
*/


/*
SELECT *
FROM tipos_produto
	WHERE codigo = 2;
*/

/*
SELECT *
FROM produtos
		WHERE descricao = 'Laptop';
*/

/*
SELECT *
FROM produtos
	WHERE preco <= 'R$500';
*/

-- Junção de Tabelas no PostgreSQL


-- SELECT * FROM tipos_produto;

-- SELECT * FROM produtos;

/*
SELECT p.codigo, p.descricao, p.preco, tp.descricao
FROM tipos_produto AS tp
	INNER JOIN produtos AS p
	ON p.codigo_tipo = tp.codigo;
*/






























