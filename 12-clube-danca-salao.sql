/* logicoClubeDanca: */

CREATE TABLE ESTUDANTES (
    id_estudante SMALLINT(5) PRIMARY KEY,
    nome_est VARCHAR(40),
    cpf INT(11)
);

CREATE TABLE PROFESSORES (
    nome_prof VARCHAR(40),
    cod_prof TINYINT(3) PRIMARY KEY,
    salario_aula SMALLMONEY,
    salario2_aula SMALLMONEY,
    salario_semanal SMALLMONEY,
    PROFESSORES_TIPO INT
);

CREATE TABLE AULAS (
    id_aula TINYINT(3) PRIMARY KEY,
    tipo_aula VARCHAR(15),
    tipo_danca VARCHAR(15),
    cod_prof TINYINT(3),
    data_hora TIMESTAMP
);

CREATE TABLE Frequenta (
    id_estudante SMALLINT(5),
    id_aula TINYINT(3)
);
 
ALTER TABLE AULAS ADD CONSTRAINT FK_AULAS_2
    FOREIGN KEY (cod_prof)
    REFERENCES PROFESSORES (cod_prof)
    ON DELETE CASCADE;
 
ALTER TABLE Frequenta ADD CONSTRAINT FK_Frequenta_1
    FOREIGN KEY (id_estudante)
    REFERENCES ESTUDANTES (id_estudante)
    ON DELETE SET NULL;
 
ALTER TABLE Frequenta ADD CONSTRAINT FK_Frequenta_2
    FOREIGN KEY (id_aula)
    REFERENCES AULAS (id_aula)
    ON DELETE SET NULL;