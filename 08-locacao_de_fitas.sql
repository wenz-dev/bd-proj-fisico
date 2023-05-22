/* logicoLocacao: */

CREATE TABLE DEPENDENTES (
    grauParentesco VARCHAR,
    idCliente INT NOT NULL
);

CREATE TABLE CLIENTES (
    nome VARCHAR(40),
    idCliente INT PRIMARY KEY NOT NULL,
    idAtor INT
);

CREATE TABLE FITAS (
    numero INT PRIMARY KEY NOT NULL,
    idFilme SMALLINT
);

CREATE TABLE ATORES (
    idAtor INT PRIMARY KEY NOT NULL,
    nomeReal CHAR,
    dataNasc DATE
);

CREATE TABLE FILMES (
    idFilme SMALLINT PRIMARY KEY NOT NULL,
    titulo CHAR,
    idCategoria SMALLINT
);

CREATE TABLE CATEGORIAS (
    idCategoria SMALLINT PRIMARY KEY NOT NULL,
    nome CHAR
);

CREATE TABLE Locacao (
    numero INT,
    idCliente INT,
    dataDevolucao TIMESTAMP,
    dataLocacao TIMESTAMP
);

CREATE TABLE Estrela (
    idFilme SMALLINT,
    idAtor INT
);
 
ALTER TABLE DEPENDENTES ADD CONSTRAINT FK_DEPENDENTES_1
    FOREIGN KEY (idCliente)
    REFERENCES CLIENTES (idCliente)
    ON DELETE CASCADE;
 
ALTER TABLE CLIENTES ADD CONSTRAINT FK_CLIENTES_2
    FOREIGN KEY (idAtor)
    REFERENCES ATORES (idAtor)
    ON DELETE SET NULL;
 
ALTER TABLE FITAS ADD CONSTRAINT FK_FITAS_2
    FOREIGN KEY (idFilme)
    REFERENCES FILMES (idFilme)
    ON DELETE RESTRICT;
 
ALTER TABLE FILMES ADD CONSTRAINT FK_FILMES_2
    FOREIGN KEY (idCategoria)
    REFERENCES CATEGORIAS (idCategoria)
    ON DELETE CASCADE;
 
ALTER TABLE Locacao ADD CONSTRAINT FK_Locacao_1
    FOREIGN KEY (numero)
    REFERENCES FITAS (numero)
    ON DELETE RESTRICT;
 
ALTER TABLE Locacao ADD CONSTRAINT FK_Locacao_2
    FOREIGN KEY (idCliente)
    REFERENCES CLIENTES (idCliente)
    ON DELETE SET NULL;
 
ALTER TABLE Estrela ADD CONSTRAINT FK_Estrela_1
    FOREIGN KEY (idFilme)
    REFERENCES FILMES (idFilme)
    ON DELETE SET NULL;
 
ALTER TABLE Estrela ADD CONSTRAINT FK_Estrela_2
    FOREIGN KEY (idAtor)
    REFERENCES ATORES (idAtor)
    ON DELETE SET NULL;