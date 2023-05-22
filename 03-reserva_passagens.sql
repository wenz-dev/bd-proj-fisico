/* logicoReservasPassagens: */

CREATE TABLE PASSAGEIROS (
    id_passageiro SMALLINT PRIMARY KEY,
    nome VARCHAR(40)
);

CREATE TABLE RESERVAS (
    id_reserva SMALLINT PRIMARY KEY,
    validade DATE,
    id_passageiro SMALLINT
);

CREATE TABLE BILHETE_PASSAGEM_Reserva (
    numero_assento TINYINT,
    id_reserva SMALLINT,
    Atributo_1 VARCHAR(40),
    dataHora TIMESTAMP PRIMARY KEY
);

CREATE TABLE ASSENTOS (
    classe VARCHAR(20),
    numeroAssento TINYINT PRIMARY KEY,
    tipoAeronave VARCHAR(10)
);

CREATE TABLE TIPOS_AERONAVES (
    tipoAeronave VARCHAR(10) PRIMARY KEY,
    vagas SMALLINT
);

CREATE TABLE TRECHOS (
    Atributo_1 VARCHAR(40) PRIMARY KEY,
    tipoAeronave VARCHAR(10),
    siglaOrigem VARCHAR(3),
    siglaDestino VARCHAR(3)
);

CREATE TABLE VOOS (
    idVoo SMALLINT PRIMARY KEY
);

CREATE TABLE HORARIOS (
    idHorario SMALLINT PRIMARY KEY,
    diaSemana VARCHAR(11),
    horarioPartida TIME,
    horarioChegada TIME,
    Atributo_1 VARCHAR(40)
);

CREATE TABLE AEROPORTOS (
    sigla_aero VARCHAR(3) PRIMARY KEY,
    nome_aero VARCHAR(40),
    idCidade SMALLINT
);

CREATE TABLE CIDADES (
    idCidade SMALLINT PRIMARY KEY,
    pais VARCHAR(40),
    nome_cid VARCHAR(40)
);

CREATE TABLE Composicao (
    Atributo_1 VARCHAR(40),
    idVoo SMALLINT
);
 
ALTER TABLE RESERVAS ADD CONSTRAINT FK_RESERVAS_2
    FOREIGN KEY (id_passageiro)
    REFERENCES PASSAGEIROS (id_passageiro)
    ON DELETE CASCADE;
 
ALTER TABLE BILHETE_PASSAGEM_Reserva ADD CONSTRAINT FK_BILHETE_PASSAGEM_Reserva_2
    FOREIGN KEY (numero_assento)
    REFERENCES ASSENTOS (numeroAssento)
    ON DELETE CASCADE;
 
ALTER TABLE BILHETE_PASSAGEM_Reserva ADD CONSTRAINT FK_BILHETE_PASSAGEM_Reserva_3
    FOREIGN KEY (id_reserva)
    REFERENCES RESERVAS (id_reserva);
 
ALTER TABLE BILHETE_PASSAGEM_Reserva ADD CONSTRAINT FK_BILHETE_PASSAGEM_Reserva_4
    FOREIGN KEY (Atributo_1)
    REFERENCES TRECHOS (Atributo_1);
 
ALTER TABLE ASSENTOS ADD CONSTRAINT FK_ASSENTOS_2
    FOREIGN KEY (tipoAeronave)
    REFERENCES TIPOS_AERONAVES (tipoAeronave)
    ON DELETE CASCADE;
 
ALTER TABLE TRECHOS ADD CONSTRAINT FK_TRECHOS_2
    FOREIGN KEY (tipoAeronave)
    REFERENCES TIPOS_AERONAVES (tipoAeronave)
    ON DELETE CASCADE;
 
ALTER TABLE TRECHOS ADD CONSTRAINT FK_TRECHOS_3
    FOREIGN KEY (siglaOrigem, siglaDestino)
    REFERENCES AEROPORTOS (sigla_aero, sigla_aero)
    ON DELETE CASCADE;
 
ALTER TABLE HORARIOS ADD CONSTRAINT FK_HORARIOS_2
    FOREIGN KEY (Atributo_1)
    REFERENCES TRECHOS (Atributo_1)
    ON DELETE CASCADE;
 
ALTER TABLE AEROPORTOS ADD CONSTRAINT FK_AEROPORTOS_2
    FOREIGN KEY (idCidade)
    REFERENCES CIDADES (idCidade)
    ON DELETE CASCADE;
 
ALTER TABLE Composicao ADD CONSTRAINT FK_Composicao_1
    FOREIGN KEY (Atributo_1)
    REFERENCES TRECHOS (Atributo_1)
    ON DELETE SET NULL;
 
ALTER TABLE Composicao ADD CONSTRAINT FK_Composicao_2
    FOREIGN KEY (idVoo)
    REFERENCES VOOS (idVoo)
    ON DELETE SET NULL;