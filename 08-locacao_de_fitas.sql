/* logicoLocacao: */

CREATE TABLE DEPENDENTES (
    grauParentesco VARCHAR,
    idCliente INT NOT NULL,
    FOREIGN KEY (idCliente)
        REFERENCES CLIENTES (idCliente)
        ON DELETE CASCADE
);

CREATE TABLE CLIENTES (
    nome VARCHAR(40),
    idCliente INT PRIMARY KEY NOT NULL,
    idAtor INT,
    FOREIGN KEY (idAtor)
        REFERENCES ATORES (idAtor)
        ON DELETE SET NULL
);

CREATE TABLE FITAS (
    numero INT PRIMARY KEY NOT NULL,
    idFilme SMALLINT,
    FOREIGN KEY (idFilme)
        REFERENCES FILMES (idFilme)
        ON DELETE RESTRICT
);

CREATE TABLE ATORES (
    idAtor INT PRIMARY KEY NOT NULL,
    nomeReal CHAR,
    dataNasc DATE
);

CREATE TABLE FILMES (
    idFilme SMALLINT PRIMARY KEY NOT NULL,
    titulo CHAR,
    idCategoria SMALLINT,
    FOREIGN KEY (idCategoria)
        REFERENCES CATEGORIAS (idCategoria)
        ON DELETE CASCADE
);

CREATE TABLE CATEGORIAS (
    idCategoria SMALLINT PRIMARY KEY NOT NULL,
    nomeCat CHAR
);

CREATE TABLE Locacao (
    numero INT,
    idCliente INT,
    dataLocacao TIMESTAMP,
    dataDevolucao TIMESTAMP,
    FOREIGN KEY (numero)
        REFERENCES FITAS (numero)
        ON DELETE RESTRICT,
    FOREIGN KEY (idCliente)
        REFERENCES CLIENTES     (idCliente)
        ON DELETE SET NULL
);

CREATE TABLE Estrela (
    idFilme SMALLINT,
    idAtor INT,
    FOREIGN KEY (idFilme)
        REFERENCES FILMES (idFilme)
        ON DELETE SET NULL,
    FOREIGN KEY (idAtor)
        REFERENCES ATORES (idAtor)
        ON DELETE SET NULL
);
 
