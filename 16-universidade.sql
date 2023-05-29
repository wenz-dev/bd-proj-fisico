/* logicoUniversidade: */

CREATE TABLE ALUNOS (
    cidade_alumn VARCHAR(30),
    estado_alumn VARCHAR(30),
    cep INT(8),
    telefone INT(11),
    telefone INT(11),
    telefone INT(11),
    data_nasc_alumn DATETIME,
    graduacao_alumn VARCHAR(20),
    n_matricula SMALLINT(4) PRIMARY KEY,
    nome_alumn VARCHAR(40),
    sexo_alumn VARCHAR(1),
    cpf_alumn INT(11),
    rg_alumn INT(9)
);

CREATE TABLE DEPENDENTES (
    nome_depend VARCHAR(30),
    cod_dependente SMALLINT(4) PRIMARY KEY,
    data_nascimento TIMESTAMP,
    matricula SMALLINT(6),
    FOREIGN KEY (matricula)
        REFERENCES FUNCIONARIOS (matricula_func)
        ON DELETE CASCADE
);

CREATE TABLE FUNCIONARIOS (
    endereco_func VARCHAR(50),
    telefone_func INT(11),
    telefone_func INT(11),
    telefone_func INT(11),
    telefone_func INT(11),
    telefone_func INT(11),
    nome_func VARCHAR(40),
    sexo_func VARCHAR(1),
    data_admissao_func DATE,
    cpf_func INT(11),
    matricula_func SMALLINT(6) PRIMARY KEY,
    rg_func INT(9),
    capacitacao_PK VARCHAR(40),
    codigo_depart TINYINT(3),
    FOREIGN KEY (capacitacao_PK)
        REFERENCES capacitacao (capacitacao_PK)
        ON DELETE NO ACTION,
    FOREIGN KEY (codigo_depart)
        REFERENCES DEPARTAMENTOS (codigo_depart)
        ON DELETE CASCADE    
);

CREATE TABLE DEPARTAMENTOS (
    codigo_depart TINYINT(3) PRIMARY KEY,
    telefone_depart INT(11),
    nome_depart VARCHAR(30)
);

CREATE TABLE DISCIPLINAS (
    n_horas_sem TINYINT(2),
    nome_discip VARCHAR(30),
    cod_disciplina SMALLINT(4) PRIMARY KEY,
    cod_curso SMALLINT(4),
    FOREIGN KEY (cod_curso)
        REFERENCES CURSOS (cod_curso)
        ON DELETE RESTRICT
);

CREATE TABLE SALAS (
    numero_sala TINYINT(2) PRIMARY KEY
);

CREATE TABLE TURMAS (
    ano DATE,
    semestre TINYINT(1),
    cod_turma SMALLINT(4) PRIMARY KEY,
    matricula_func SMALLINT(6),
    numero_sala TINYINT(2),
    FOREIGN KEY (matricula_func)
        REFERENCES FUNCIONARIOS (matricula_func)
        ON DELETE CASCADE;
    FOREIGN KEY (numero_sala)
        REFERENCES SALAS (numero_sala)
        ON DELETE CASCADE
);

CREATE TABLE AVALIACOES (
    data_aval DATE PRIMARY KEY,
    n_matricula SMALLINT(4),
    nota_aval TINYINT,
    cod_turma SMALLINT(4),
    FOREIGN KEY (n_matricula)
        REFERENCES ALUNOS (n_matricula)
        ON DELETE CASCADE,
    FOREIGN KEY (cod_turma)
        REFERENCES TURMAS (cod_turma)
        ON DELETE RESTRICT
);

CREATE TABLE CURSOS (
    cod_curso SMALLINT(4) PRIMARY KEY,
    n_horas_sem TINYINT(2),
    nome_curso VARCHAR(20),
    descricao_curso VARCHAR(100),
    codigo_depart TINYINT(3),
    FOREIGN KEY (codigo_depart)
        REFERENCES DEPARTAMENTOS (codigo_depart)
        ON DELETE CASCADE
);

CREATE TABLE capacitacao (
    capacitacao_PK VARCHAR(40) NOT NULL PRIMARY KEY,
    capacitacao VARCHAR
);

CREATE TABLE Pre_requisito (
    cod_disciplina SMALLINT(4),
    cod_disciplina_ SMALLINT(4),
    FOREIGN KEY (cod_disciplina)
        REFERENCES DISCIPLINAS (cod_disciplina)
        ON DELETE CASCADE,
    FOREIGN KEY (cod_disciplina_)
        REFERENCES DISCIPLINAS (cod_disciplina)
        ON DELETE CASCADE
);

CREATE TABLE Matricula (
    n_matricula SMALLINT(4),
    cod_curso SMALLINT(4),
    FOREIGN KEY (n_matricula)
        REFERENCES ALUNOS (n_matricula)
        ON DELETE SET NULL,
    FOREIGN KEY (cod_curso)
        REFERENCES CURSOS (cod_curso)
        ON DELETE SET NULL
);

CREATE TABLE Ministrar (
    matricula_func SMALLINT(6),
    cod_disciplina SMALLINT(4),
    FOREIGN KEY (matricula_func)
        REFERENCES FUNCIONARIOS (matricula_func)
        ON DELETE RESTRICT,
    FOREIGN KEY (cod_disciplina)
        REFERENCES DISCIPLINAS (cod_disciplina)
        ON DELETE SET NULL
);
