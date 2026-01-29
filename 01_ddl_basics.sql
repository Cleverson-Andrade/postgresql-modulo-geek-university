-- CREATE DATABASE secao03;
-- (PT) Criação do banco de dados da seção.
-- (EN) Database creation for this section.

-- ============================================================================
-- (PT) No PostgreSQL não existe o comando USE database.
-- (EN) In PostgreSQL, there is no USE database command.
--
-- (PT) A seleção do banco é feita no momento da conexão.
-- (EN) The database is selected at connection time.
--
-- (PT) Exemplo de conexão via terminal:
-- (EN) Example of connection via terminal:
--
-- psql -h localhost -p 5432 -U geek secao03;
-- ============================================================================


-- ============================================================================
-- TIPOS DE PRODUTO
-- PRODUCT TYPES
-- ============================================================================


-- (PT) Tabela responsável por armazenar os tipos de produtos.
-- (EN) Table responsible for storing product types.

CREATE TABLE tipos_produto(
	id SERIAL PRIMARY KEY,
	descricao CHARACTER VARYING(50) NOT NULL
);


-- ============================================================================
-- PRODUTOS
-- PRODUCTS
-- ============================================================================


-- (PT) Tabela de produtos, relacionada aos tipos de produto.
-- (EN) Products table, related to product types.

CREATE TABLE produtos(
	id SERIAL PRIMARY KEY,
	descricao CHARACTER VARYING(50) NOT NULL,
	preco MONEY NOT NULL,
	id_tipo_produto INT REFERENCES tipos_produto(id) NOT NULL
);


-- ============================================================================
-- PACIENTES
-- PATIENTS
-- ============================================================================


-- (PT) Tabela para cadastro de pacientes.
-- (EN) Table for patient records.

CREATE TABLE pacientes(
	id SERIAL PRIMARY KEY,
	nome CHARACTER VARYING(50) NOT NULL,
	endereco CHARACTER VARYING(50) NOT NULL,
	bairro CHARACTER VARYING(50) NOT NULL,
	cidade VARCHAR(40) NOT NULL,
	estado CHAR(2) NOT NULL,
	cep VARCHAR(9) NOT NULL,
	data_nascimento DATE NOT NULL
);


-- ============================================================================
-- PROFESSORES
-- TEACHERS
-- ============================================================================


-- (PT) Tabela para cadastro de professores.
-- (EN) Table for teacher records.

CREATE TABLE professores(
	id SERIAL PRIMARY KEY,
	telefone INT NOT NULL,
	nome VARCHAR(80) NOT NULL
);


-- ============================================================================
-- TURMAS
-- CLASSES
-- ============================================================================


-- (PT) Tabela de turmas, relacionada aos professores.
-- (EN) Classes table, related to teachers.

CREATE TABLE turmas(
	id SERIAL PRIMARY KEY,
	capacidade INT NOT NULL,
	id_professor INT REFERENCES professores(id) NOT NULL
);

-- ============================================================================
-- INSERTS
-- DATA INSERTS
-- ============================================================================

-- Tipos de Produto / Product Types

-- (PT) Inserção de dados na tabela tipos_produto.
-- (EN) Data insertion into tipos_produto table.

INSERT INTO tipos_produto (descricao) VALUES ('Computadores');
INSERT INTO tipos_produto (descricao) VALUES ('Impressoras');
INSERT INTO tipos_produto (descricao) VALUES ('Diversos');


-- Produtos / Products

-- (PT) Inserção de produtos vinculados aos tipos de produto.
-- (EN) Product insertion linked to product types.

INSERT INTO produtos (descricao, preco, id_tipo_produto)
VALUES ('Notebook DELL 1544', 2345.67, 1);

INSERT INTO produtos (descricao, preco, id_tipo_produto)
VALUES ('Impr. Jato de Tinta', 456.00, 2);

INSERT INTO produtos (descricao, preco, id_tipo_produto)
VALUES ('Mouse sem fio', 45, 3);


-- Pacientes / Patients

-- (PT) Inserção de um paciente na base de dados.
-- (EN) Insertion of a patient into the database.

INSERT INTO pacientes (nome, endereco, bairro, cidade, estado, cep, data_nascimento)
VALUES ('Angelina Jolie', 'Rua da paz, 44', 'Nova Lima', 'Santos', 'SP', '121213213', '1979-04-24');


-- ============================================================================
-- SELECTS
-- QUERIES
-- ============================================================================

-- (PT) Consulta para retornar todos os registros da tabela pacientes.
-- (EN) Query to return all records from the pacientes table.
SELECT *
FROM pacientes;
