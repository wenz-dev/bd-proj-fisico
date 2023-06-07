/* 08-locacao-de-fitas [scripts SQL/DML]: ativ 4 */

/* instrucoes 
    Inclusão de 5 registros para cada tabela;
    
    Duas consultas simples, envolvendo apenas uma tabela (primária ou secundária);
    ::tabela primária:: somente primary key

    Duas consultas envolvendo duas ou mais tabelas primárias e secundárias;
    ::tabela secundária:: primary key + foreign key
    
    Uma consulta envolvendo mais de 3 tabelas;
    
    Uma alteração de dados em uma tabela;
    
    Uma exclusão de dados em uma tabela.
*/

/* 
    inclusão de dados
    INSERT INTO table_name (campo1, campo2) 
            VALUES (valor1, valor2)

    consulta
    SELECT campo1, campo2 FROM table_name WHERE campo? = valor_filtro;

    exclusão de dados
    DELETE FROM table_name WHERE campo? = valor_filtro;
*/

INSERT INTO DEPENDENTES (grauParentesco, idCliente)
    VALUES 
        ("filho", 1), ("esposa", 1), ("filha", 2), ("filha", 3), ("marido", 4);


INSERT INTO CLIENTES (nome, idCliente, idAtor)
    VALUES 
        ("Carlos Alberto", 1, 4),("João Gomes", 2, 2),("Manoel Azurra", 3, 3),("Marcos Espinosa", 4, 5),("Iman Trevor", 5, 1);

INSERT INTO FITAS (numero, idFilme)
    VALUES 
        (22, 1),(44, 2),(88, 3),(11, 4),(33, 5);

INSERT INTO ATORES (idAtor, nomeReal, dataNasc)
    VALUES 
        (1, "Ryan Gosling", 01-08-1969),(2, "Christian Bale", 01-12-1973),(3, "Keanu Reeves", 03-03-1971),(4, "Al Pacino", 01-05-1955),(5, "Brad Pitt", 01-06-1968);

INSERT INTO FILMES (idFilme, titulo, idCategoria)
    VALUES 
        (1, "Once Upon a Time in Hollywood", 3),(2, "Ex Macchina", 1),(3, "Barbie", 2),(4, "Shutter Island", 5),(5, "It!", 4);

INSERT INTO CATEGORIAS (idCategoria, nomeCat)
    VALUES 
        (1, "Sci-Fi"),(2, "Infantil"),(3, "Comedia"),(4, "Suspense"),(5, "Terror");

INSERT INTO Locacao (numero, idCliente, dataLocacao, dataDevolucao)
    VALUES 
        (22, 1, 20-08-2022, 22-08-2022),(23, 5, 12-01-2013, 18-01-2013),(24, 4, 15-02-2023, 19-02-2023),(25, 3, 06-05-2023, 07-05-2023),(26, 2, 01-03-2019, 08-08-2019);

INSERT INTO Estrela (idFilme, idAtor)
    VALUES 
        (1, 5),(2, 4),(3, 1),(4, 2),(5, 3);

/* 2 consultas simples abaixo */
SELECT nomeReal, dataNasc 
FROM ATORES; 

SELECT * FROM CATEGORIAS;


/* 2 consultas envolvendo 2 ou mais tabelas secundárias */
SELECT nomeCat
FROM CATEGORIAS
JOIN <tables> ON <ids iguais>
/* Uma consulta envolvendo 3 tabelas */

SELECT dataDevolucao
FROM Locacao
JOIN <tables> ON ????
JOIN <tables> ON ????

/* Uma alteraçao em um tabela */
UPDATE CATEGORIAS 
SET nomeCat = "Ficcao Cientifica" 
WHERE idCategoria = 1;


/* Uma exclusão de dados de uma tabela */
DELETE *
FROM DEPENDENTES 
WHERE idCliente = 4;
