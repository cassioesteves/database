LIVRARIA
TESTE DE CRIACAO DO BANCO

Banco:	LIVRARIA
Tabela:	LIVROS

Atributos:	
NOME DO LIVRO	
NOME DO AUTOR	
SEXO DO AUTOR	
NUMERO DE PÁGINAS	
NOME DA EDITORA	
VALOR DO LIVRO	
ESTADO (UF) DA EDITORA	
ANO PUBLICACAO	

	Nome do Livro		Nome do Autor		Sexo do Autor	Numero de Páginas	Nome da Editora	Valor do Livro	UF da Editora	Ano da Publicacao
1	Cavaleiro Real		Ana Claudia			Feminino		465					Atlas			49,9			RJ				2009
2	SQL para leigos		João Nunes			Masculino		450					Addison			98				SP				2018
3	Receitas Caseiras	Celia Tavares		Feminino		210					Atlas			45				RJ				2008
4	Pessoas Efetivas	Eduardo Santos		Masculino		390					Beta			78,99			RJ				2018
5	Habitos Saudáveis	Eduardo Santos		Masculino		630					Beta			150,98			RJ				2019
6	A Casa Marrom		Hermes Macedo		Masculino		250					Bubba			60				MG				2016
7	Estacio Querido		Geraldo Francisco	Masculino		310					Insignia		100				ES				2015
8	Pra sempre amigas	Leda Silva			Feminino		510					Insignia		78,98			ES				2011
9	Copas Inesqueciveis	Marco Alcantara		Masculino		200					Larson			130,98			RS				2018
10	O poder da mente	Clara Mafra			Feminino		120					Continental		56,58			SP				2017

CREATE DATABASE LIVRARIA;

CREATE TABLE LIVROS (
	ID NUMERIC(02),
	NOME_DO_LIVRO VARCHAR(30),
	NOME_DO_AUTOR VARCHAR(30),
	SEXO_DO_AUTOR VARCHAR(10),
	NUMERO_DE_PAGINAS NUMERIC(5),
	NOME_DA_EDITORA VARCHAR(15),
	VALOR_DO_LIVRO FLOAT(10,2), /* USAR . E NÃO , EM CAMPOS FLOAT NA HORA DE INSERIR DADOS*/
	ESTADO_DA_EDITORA CHAR(2),
	ANO_PUBLICACAO CHAR(4)
);

ALTER TABLE LIVROS MODIFY VALOR_DO_LIVRO VARCHAR (10);
ALTER TABLE LIVROS MODIFY ID NUMERIC (02) NOT NULL; /*NAO ACEITA VAZIO NOT NULL*/
ALTER TABLE LIVROS MODIFY SEXO_DO_AUTOR ENUM ('M','F'); /*TESTAR*/
ALTER TABLE LIVROS MODIFY COLUMN VALOR_DO_LIVRO FLOAT (10,2);

ALTER TABLE LIVROS
DROP COLUMN VALOR_DO_LIVRO,
ADD COLUMN VALOR_DO_LIVRO FLOAT(10,2) AFTER NOME_DA_EDITORA; /* USAR . E NÃO , EM CAMPOS FLOAT NA HORA DE INSERIR DADOS*/

UPDATE LIVROS SET VALOR_DO_LIVRO = 49.9 WHERE ID = 01;
UPDATE LIVROS SET VALOR_DO_LIVRO = 98 WHERE ID = 02;
UPDATE LIVROS SET VALOR_DO_LIVRO = 45 WHERE ID = 03;
UPDATE LIVROS SET VALOR_DO_LIVRO = 78.99 WHERE ID = 04;
UPDATE LIVROS SET VALOR_DO_LIVRO = 150.98 WHERE ID = 05;
UPDATE LIVROS SET VALOR_DO_LIVRO = 60 WHERE ID = 06;
UPDATE LIVROS SET VALOR_DO_LIVRO = 100 WHERE ID = 07;
UPDATE LIVROS SET VALOR_DO_LIVRO = 78.98 WHERE ID = 08;
UPDATE LIVROS SET VALOR_DO_LIVRO = 130.98 WHERE ID = 09;
UPDATE LIVROS SET VALOR_DO_LIVRO = 56.58 WHERE ID = 10;

SHOW DATABASES; /*VERIFICA OS BANCO*/
SHOW TABLES;
STATUS; /*INFORMA O BANCO QUE ESTA CONECTADO*/
USE LIVRARIA; /*CONECTA AO BANCO*/
DESC LIVROS;
TRUNCATE TABLE LIVROS;
DROP TABLE LIVROS;
SELECT * FROM LIVROS;

INSERT INTO LIVROS (NOME_DO_LIVRO,NOME_DO_AUTOR,SEXO_DO_AUTOR,NUMERO_DE_PAGINAS,NOME_DA_EDITORA,VALOR_DO_LIVRO,ESTADO_DA_EDITORA,ANO_PUBLICACAO) 
             VALUES ();

/*ID,Nome do Livro  Nome do Autor	 Sexo do Autor	Numero de Páginas	Nome da Editora	Valor do Livro	UF da Editora	Ano da Publicacao*/

INSERT INTO LIVROS VALUES(01,'Cavaleiro Real','Ana Claudia','Feminino',465,'Atlas',49.9,'RJ',2009),
						 (02,'SQL para leigos','João Nunes','Masculino',450,'Addison',98,'SP',2018),
						 (03,'Receitas Caseiras','Celia Tavares','Feminino',210,'Atlas',45,'RJ',2008),
						 (04,'Pessoas Efetivas','Eduardo Santos','Masculino',390,'Beta',78.99,'RJ',2018),
						 (05,'Habitos Saudáveis','Eduardo Santos','Masculino',630,'Beta',150.98,'RJ',2019),
						 (06,'A Casa Marrom','Hermes Macedo','Masculino',250,'Bubba',60,'MG',2016),
						 (07,'Estacio Querido','Geraldo Francisco','Masculino',310,'Insignia',100,'ES',2015),
						 (08,'Pra sempre amigas','Leda Silva','Feminino',510,'Insignia',78.98,'ES',2011),
						 (09,'Copas Inesqueciveis','Marco Alcantara','Masculino',200,'Larson',130.98,'RS',2018),
						 (10,'O poder da mente','Clara Mafra','Feminino',120,'Continental',56.58,'SP',2017);
						 

/*MUDAR AS ORDEM DA COLUNA COM O COMANDO AFTER E BEFORE 

*/

/*
O nosso cliente solicitou uma tabela para armazenar os livros que são comercializados pela
empresa. A solicitação é somente para livros e não há a necessidade de realizar busca em
outras tabelas. Hoje há um funcionário de vendas que tem uma tabela do Excel para guardar
esses registros, mas as buscas estão ficando complexas. Decidiu-se então criar um banco de
dados separado para esse funcionário.
Após a criação da tabela, deveremos entregar algumas queries prontas para que sejam
enviadas para o programador. As queries são as seguintes:*/

/*1 – Trazer todos os dados.*/
SELECT * FROM LIVROS;
/*2 – Trazer o nome do livro e o nome da editora*/
SELECT NOME_DO_LIVRO, NOME_DA_EDITORA FROM LIVROS;

/*3 – Trazer o nome do livro e a UF dos livros publicados por autores do sexo masculino.*/
SELECT NOME_DO_LIVRO, ESTADO_DA_EDITORA FROM LIVROS
WHERE SEXO_DO_AUTOR = 'MASCULINO';

SELECT NOME_DO_LIVRO, NOME_DO_AUTOR, ESTADO_DA_EDITORA FROM LIVROS
WHERE SEXO_DO_AUTOR = 'MASCULINO';

/*4 - Trazer o nome do livro e o número de páginas dos livros publicados por autores do sexo feminino.*/
SELECT NOME_DO_LIVRO, NUMERO_DE_PAGINAS FROM LIVROS
WHERE SEXO_DO_AUTOR = 'feminino';

SELECT NOME_DO_LIVRO, NOME_DO_AUTOR, NUMERO_DE_PAGINAS FROM LIVROS
WHERE SEXO_DO_AUTOR = 'feminino';

/*5 – Trazer os valores dos livros das editoras de São Paulo.*/
SELECT VALOR_DO_LIVRO FROM LIVROS
WHERE ESTADO_DA_EDITORA = 'SP';

SELECT VALOR_DO_LIVRO AS VALOR, NOME_DA_EDITORA AS EDITORA, ESTADO_DA_EDITORA AS UF FROM LIVROS
WHERE ESTADO_DA_EDITORA = 'SP';

/*ESTUDAR A TABELA VERDADE PARA O CASO ABAIXO */

/*6 – Trazer os dados dos autores do sexo masculino que tiveram livros publicados por São
Paulo ou Rio de Janeiro (Questão Desafio).*/
SELECT NOME_DO_AUTOR, SEXO_DO_AUTOR, ESTADO_DA_EDITORA AS UF FROM LIVROS /*JEITO ERRADO*/
WHERE SEXO_DO_AUTOR = 'MASCULINO' AND (ESTADO_DA_EDITORA = 'SP'OR'RJ');

SELECT NOME_DO_AUTOR, SEXO_DO_AUTOR, ESTADO_DA_EDITORA AS UF FROM LIVROS
WHERE SEXO_DO_AUTOR = 'MASCULINO' AND (ESTADO_DA_EDITORA = 'SP'	OR ESTADO_DA_EDITORA ='RJ');

SELECT NOME_DO_AUTOR, SEXO_DO_AUTOR, ESTADO_DA_EDITORA AS UF FROM LIVROS
WHERE SEXO_DO_AUTOR = 'MASCULINO' AND ESTADO_DA_EDITORA = 'SP'	OR ESTADO_DA_EDITORA ='RJ';


/*OPERADORES LÓGICOS*/
OR  -> PARA QUE SAIDA DA QUERY SEJA VERDADEIRA, BASTA QUE APENAS UMA CONDICAO SEJA VERDADEIRA.
AND -> PARA QUE SAIDA SEJA VERDADEIRA TODAS AS CONDIÇÕES PRECISAM SER VERDADEIRAS.
/*
OR - OU
AND - E
*/