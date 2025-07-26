-- CREATE DATABASE secao03;

-- No PostgreSQL não existe o comando USE database;
-- A gente seleciona o banco de dados que queremos

-- Exemplo:

-- psql -h localhost -p 5432 -u geek secao03;

-- Tipos Produto

/*
CREATE TABLE tipos_produto(
	id SERIAL PRIMARY KEY,
	descricao CHARACTER VARYING(50) NOT NULL
);
*/

/*
-- Produtos 

CREATE TABLE produtos(
	id SERIAL PRIMARY KEY,
	descricao CHARACTER VARYING(50) NOT NULL,
	preco MONEY NOT NULL,
	id_tipo_produto INT REFERENCES tipos_produto(id) NOT NULL
);
*/

-- Pacientes
/*	
CREATE TABLE pacientes(
	id SERIAL PRIMARY KEY,
	nome CHARACTER VARYING(50) NOT NULL,
	endereco CHARACTER VARYING(50) NOT NULL,
	bairro  CHARACTER VARYING(50) NOT NULL,
	cidade VARCHAR(40) NOT NULL,
	estado CHAR(2) NOT NULL,
	cep VARCHAR(9) NOT NULL,
	data_nascimento DATE NOT NULL
	);
*/

-- Professores
/*
CREATE TABLE professores(
	id SERIAL PRIMARY KEY,
	telefone INT NOT NULL,
	nome VARCHAR(80) NOT NULL
);
*/

/*
-- Turmas
CREATE TABLE turmas(
	id SERIAL PRIMARY KEY,
	capacidade INT NOT NULL,
	id_professor INT REFERENCES professores(id) NOT NULL
);
*/

-- INSERTS

-- Tipos de Produto
/*
INSERT INTO tipos_produto (descricao) VALUES ('Computadores');
INSERT INTO tipos_produto (descricao) VALUES ('Impressoras');
INSERT INTO tipos_produto (descricao) VALUES ('Diversos');
*/

-- Produtos
/*
INSERT INTO produtos (descricao, preco, id_tipo_produto) VALUES ('Notebook DELL 1544', 2345.67, 1 );
INSERT INTO produtos (descricao, preco, id_tipo_produto) VALUES ('Impr. Jato de Tinta', 456.00, 2);
INSERT INTO produtos (descricao, preco, id_tipo_produto) VALUES ('Mouse sem fio', 45, 3);
*/

-- Pacientes 
/*
INSERT INTO pacientes (nome, endereco, bairro, cidade, estado, cep, data_nascimento)
VALUES ('Angelina Jolie', 'Rua da paz, 44', 'Nova Lima', 'Santos', 'SP', '121213213', '1979-04-24');
*/

-- SELECTS
SELECT *
FROM pacientes;
