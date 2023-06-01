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
        ("", ),
        ("", ),
        ("", ),
        ("", ),
        ("", );


INSERT INTO CLIENTES (nome, idCliente, idAtor)
    VALUES 
        ("", , ),
        ("", , ),
        ("", , ),
        ("", , ),
        ("", , );

INSERT INTO FITAS (numero, idFilme)
    VALUES 
        (, ),
        (, ),
        (, ),
        (, ),
        (, );

INSERT INTO ATORES (idAtor, nomeReal, dataNasc)
    VALUES 
        (, "", //),
        (, "", //),
        (, "", //),
        (, "", //),
        (, "", //);

INSERT INTO FILMES (idFilme, titulo, idCategoria)
    VALUES 
        (, "", ),
        (, "", ),
        (, "", ),
        (, "", ),
        (, "", );

INSERT INTO CATEGORIAS (idCategoria, nomeCat)
    VALUES 
        (, ""),
        (, ""),
        (, ""),
        (, ""),
        (, "");

INSERT INTO Locacao (numero, idCliente, dataLocacao, dataDevolucao)
    VALUES 
        (, , //, //),
        (, , //, //),
        (, , //, //),
        (, , //, //),
        (, , //, //);

INSERT INTO Estrela (idFilme, idAtor)
    VALUES 
        (, ),
        (, ),
        (, ),
        (, ),
        (, );

/* 2 consultas simples abaixo */
SELECT nomeReal, dataNasc FROM ATORES; 

SELECT * FROM CATEGORIAS;


/* 2 consultas envolvendo 2 ou mais tabelas secundárias */

/* Uma consulta envolvendo 3 tabelas */


/* Uma alteraçao em um tabela */
UPDATE <tabela> SET <campo> = <expressão> WHERE <condição>;


/* Uma exclusão de dados de uma tabela */
DELETE FROM <tabela> WHERE <condição>;
