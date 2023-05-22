/* logicoClinica: */

CREATE TABLE MEDICAMENTOS (
    id_medicamento SMALLINT PRIMARY KEY,
    nome_medicamento VARCHAR
);

CREATE TABLE PATOLOGIA (
    id_patologia SMALLINT PRIMARY KEY,
    nome_pato VARCHAR(30)
);

CREATE TABLE PACIENTES (
    id_paciente SMALLINT PRIMARY KEY,
    nome_pac VARCHAR(40),
    endereco_pac VARCHAR(100),
    telefone_pac BIGINT(14)
);

CREATE TABLE MEDICOS (
    crm VARCHAR(12) PRIMARY KEY,
    nome_med VARCHAR(40),
    telefone_med BIGINT(14)
);

CREATE TABLE EXAMES (
    id_exame SMALLINT PRIMARY KEY,
    descricao_exame VARCHAR(100)
);

CREATE TABLE RECEITAS (
    num_receita SMALLINT PRIMARY KEY,
    data_receita DATETIME
);

CREATE TABLE DIAGNOSTICOS_Consulta (
    observacoes VARCHAR(100),
    crm VARCHAR(12),
    id_paciente SMALLINT,
    data DATE,
    hora TIME,
    PRIMARY KEY (data, hora)
);

CREATE TABLE Composicao (
    id_medicamento SMALLINT,
    num_receita SMALLINT
);

CREATE TABLE ocorrencia (
    id_patologia SMALLINT
);
 
ALTER TABLE DIAGNOSTICOS_Consulta ADD CONSTRAINT FK_DIAGNOSTICOS_Consulta_2
    FOREIGN KEY (crm)
    REFERENCES MEDICOS (crm);
 
ALTER TABLE DIAGNOSTICOS_Consulta ADD CONSTRAINT FK_DIAGNOSTICOS_Consulta_3
    FOREIGN KEY (id_paciente)
    REFERENCES PACIENTES (id_paciente);
 
ALTER TABLE Composicao ADD CONSTRAINT FK_Composicao_1
    FOREIGN KEY (id_medicamento)
    REFERENCES MEDICAMENTOS (id_medicamento)
    ON DELETE RESTRICT;
 
ALTER TABLE Composicao ADD CONSTRAINT FK_Composicao_2
    FOREIGN KEY (num_receita)
    REFERENCES RECEITAS (num_receita)
    ON DELETE SET NULL;
 
ALTER TABLE ocorrencia ADD CONSTRAINT FK_ocorrencia_1
    FOREIGN KEY (id_patologia)
    REFERENCES PATOLOGIA (id_patologia)
    ON DELETE SET NULL;