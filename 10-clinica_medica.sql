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
    telefone_pac BIGINT
);

CREATE TABLE MEDICOS (
    crm VARCHAR(12) PRIMARY KEY,
    nome_med VARCHAR(40),
    telefone_med BIGINT
);

CREATE TABLE EXAMES (
    id_exame SMALLINT PRIMARY KEY,
    descricao_exame VARCHAR(100)
);

CREATE TABLE RECEITAS (
    num_receita SMALLINT PRIMARY KEY,
    data_receita TIMESTAMP
);

CREATE TABLE DIAGNOSTICOS_Consulta (
    observacoes VARCHAR(100),
    crm VARCHAR(12),
    id_paciente SMALLINT,
    data DATE,
    hora TIME,
    PRIMARY KEY (data, hora),
    FOREIGN KEY (crm)
        REFERENCES MEDICOS (crm);   
    FOREIGN KEY (id_paciente)
        REFERENCES PACIENTES (id_paciente);
);

CREATE TABLE Composicao (
    id_medicamento SMALLINT,
    num_receita SMALLINT,
    FOREIGN KEY (id_medicamento)
        REFERENCES MEDICAMENTOS (id_medicamento)
        ON DELETE RESTRICT,
    FOREIGN KEY (num_receita)
        REFERENCES RECEITAS (num_receita)
        ON DELETE SET NULL
);

CREATE TABLE ocorrencia (
    id_patologia SMALLINT,
    FOREIGN KEY (id_patologia)
        REFERENCES PATOLOGIA (id_patologia)
        ON DELETE SET NULL;
);