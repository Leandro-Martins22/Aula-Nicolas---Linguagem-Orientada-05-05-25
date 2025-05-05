CREATE DATABASE IF NOT EXISTS loja;
USE loja;

DROP TABLE IF EXISTS lista;
DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
    id INT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    cpf VARCHAR(11),
    endereco VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE lista (
    id INT AUTO_INCREMENT,
    nome_anime VARCHAR(100) NOT NULL,
    data_lancamento DATE NOT NULL,
    genero VARCHAR(100) NOT NULL,
    codigo_cliente INT,
    PRIMARY KEY (id),
    FOREIGN KEY (codigo_cliente) REFERENCES clientes(id)
);

INSERT INTO clientes (nome, email, cpf, endereco) 
VALUES 
('Leandro Martins', 'leandro.m@email.com', '12345678901', 'Rua A, 123'),
('Rafael Evangelista', 'rafa.evangelista@email.com', '98765432100', 'Rua B, 456'),
('Luis Henrique', 'louis.silva@email.com', '11223344556', 'Rua C, 789');

INSERT INTO lista (nome_anime, data_lancamento, genero, codigo_cliente) 
VALUES 
('Naruto', '2025-03-14', 'Ação', 1),
('One Piece', '2025-03-15', 'Aventura', 2),
('Death Note', '2025-03-16', 'Suspense', 3);

SELECT l.id AS codigo_anime, l.nome_anime, l.data_lancamento, l.genero, c.nome AS cliente
FROM lista l
JOIN clientes c ON l.codigo_cliente = c.id;
