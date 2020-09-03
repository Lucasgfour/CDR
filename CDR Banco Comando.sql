CREATE DATABASE cdr;
USE cdr;
CREATE TABLE lancamento (
    codigo int NOT NULL AUTO_INCREMENT,
    data date NOT NULL,
    descricao varchar(50) DEFAULT 'Não informado',
    tipo boolean not null,
    valor float not null,
    PRIMARY KEY(codigo)
    )