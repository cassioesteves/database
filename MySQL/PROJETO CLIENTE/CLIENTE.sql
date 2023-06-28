/* Modelagem Básica */
/* ENTIDADE = TABELA */
/* CAMPOS = ATRIBUTOS */
/* PARA ORGANIZAR OS NOMES NO BR MODELO 
CLICAR NA ENTIDADE PRINCIPAL E LETRA "O" ATÉ ORGANIZAR */

CLIENTE

NOME - CARACTER(30)
CPF - NUMERICO(11)
EMAIL - CARACTER(30)
TELEFONE - CARACTER(30)
ENDERECO - CARACTER (100)
SEXO - CARACTER(1)

/* PROCESSO DE MODELAGEM */

/* FASE 01 E FASE 02 - AD ADM DE DADOS */
FASE 01 - MODELAGEM CONCEITUAL => RASCUNHO 
FASE 02 - MODELAGEM LÓGICA => QLQ PROG DE MODELAGEM EX: brModelo, StarUML

/* FASE 03 - DBA / AD */
FASE 03 - MODELAGEM FÍSICA - 

/* INICIANDO A MODELAGEM FÍSICA */

/* CRIANDO BANCO DE DADOS */
/* SEMPRE USARO ";" */

CREATE DATABASE EXEMPLO;

CREATE DATABASE PROJETO;

/* CONECTANDO-SE AO BANCO */

USE PROJETO;

/*CRIANDO A TABELA DE CLIENTES */

/* TUNNING - RAPIDEZ E PERFORMANCE E BUSCA DE TABELAS NO MYSQL*/

CREATE TABLE CLIENTE (
	NOME VARCHAR(30),
	SEXO CHAR (1),
	EMAIL VARCHAR(30),
	CPF INT(11),
	TELEFONE VARCHAR(30),
	ENDERECO VARCHAR (100)
);

/*ADICONA UMA NOVA COLUMA, APOS AS COLUNAS JÁ CRIADA.*/

ALTER TABLE CLIENTE ADD COLUMN ID INT(02);

ALTER TABLE CLIENTE ADD COLUMN ID INT(02);

ALTER TABLE CLIENTE MODIFY ID INT(02) AFTER NOME;
ALTER TABLE CLIENTE MODIFY ID INT(02) FIRST; /* MODIFICA AS COLUNA DEIXANDO EM PRIMEIRO*/
ALTER TABLE CLIENTE CHANGE COLUMN ID INT(02) AFTER NAME; /*NAO DEU CERTO DESSA FORMA*/

/*
--- AREAS DO BANCO DE DADOS ----

AD - CUIDA DOS DADOS
DBA - INFRA
TN - RAPIDEZ E PERFORMANCE
BI - O QUE OCORREU NO PASSADO
DS DATA SINCE - O QUE PODE OCORRER NO FUTURO
MD - MINERAÇÃO DE DADOS - LIGADO A DS
*/

/* VERIFICANDO AS TABELAS DO BANCO */

SHOW TABLES;

DESC NOME DA TABELA

/*
CHAR - SE ADICIONAR 30 ELA CONSUMIRAR OS 30, CONSOME CAMPO VAZIO
VARCHAR - SE ADICIONAR 30 E PREENCHER SOMENTE 15, 
AUMENTA A PERFORMANCE NÃO UTILIZANDO O CAMPO VAZIO

ENUM - ENUMERAÇÃO
INT - NUMERO INTEIRO
FLOAT - NUMERO REAIS (TOTAL,VIRGULA)
*/

/* SINTAXE BASICA DE INSERCAO - INSERT INTO TABELA ... */

/* OMITINDO AS COLUNAS SEM IDENTIFICAR EX O NOME, CPF E ENDERECO */

						/*	,ID, NOME, SEXO, E-MAIL, 			CPF,	TELEDONE,    ENDERECO , */
INSERT INTO CLIENTE VALUES(NULL,'JOAO','M','JOAO@GMAIL.COM',988638273,'01122923110','AV BANDEIRANTES,300 - SÃO PAULO - SP','SAO PAULO', 'SP');

INSERT INTO CLIENTE VALUES(01,'MARIA','F','MARIA@YAHOO.COM',54151456,'02125078869','AV FLUMINENSE - RIO DE JANEIRO - RJ');

INSERT INTO CLIENTE VALUES(02,'PEDRO','M','PEDRO@HOTMAIL.COM',885755896,'02758748895','AV JARDIM CAMBURI - VITORIA - ES');

INSERT INTO CLIENTE VALUES(03,'ANA','F',NULL,485755879,'03179748895','AV FERNAO DIAS - BELO HORIZONTE - MG'); 

INSERT INTO CLIENTE VALUES(02,'MARIANA NIKE','F','MARIANAANIKEE@GMAIL.COM',885755850,'02758748814','AV SANTO ANDRE','SERRA','ES');

/*ADICIONANDO O CAMPO CIDADE E ESTADO*/
						/*	NOME, SEXO, E-MAIL, 			CPF,	TELEDONE,    ENDERECO ,                      CIDADE      ESTADO */
INSERT INTO CLIENTE VALUES(04,'JOAO','M','JOAO@GMAIL.COM',988638273,'01122923110','AV BANDEIRANTES - SÃO PAULO - SP','SAO PAULO', 'SP'),
(05,'MARIA','F','MARIA@YAHOO.COM',54151456,'02125078869','AV FLUMINENSE - RIO DE JANEIRO - RJ','RIO DE JANEIRO', 'RJ'),
(06,'PEDRO','M','PEDRO@HOTMAIL.COM',885755896,'02758748895','AV JARDIM CAMBURI - VITORIA - ES','VITORIA','ES'),
(07,'ANA','F',NULL,485755879,'03179748895','AV FERNAO DIAS - BELO HORIZONTE - MG','BELO HORIZONTE','MG');

/*FORMA 2 - COLOCANDO AS COLUNAS */
/* DECLARANDO AS COLUNAS IDENTIFICANDO EX O NOME, CPF E ENDERECO */

INSERT INTO CLIENTE (ID,NOME,SEXO,ENDERECO,CIDADE,ESTADO,TELEFONE,CPF) VALUES (08,'CASSIO ESTEVES','M','RUA SANTA EFIGENIA, 18', 'SAO B CAMPO','SP','11966695313',123456789);

/*FORMA 3 -  INSERT COMPACTO - SOMENTE MYSQL */

INSERT INTO CLIENTE VALUES(NULL,'SUELI','F','SUELI@OUTLOOK.COM',285745869,'01179758892','RUA SANTA EFIGENIA,18','S B CAMPO','SP'),
						  (NULL,'ADILSON','M','ADILSON@QUEIJOS.COM',486745399,'01176458825','RUA QUEIJOS E DOCES - JD BISCOITO','S B CAMPO','SP');
						  
/*ADICIONANDO O CAMPO CIDADE E ESTADO*/
INSERT INTO CLIENTE VALUES(08,'SUELI','F','SUELI@OUTLOOK.COM',285745869,'01179758892','CANCELA PRETA - LAJEDO','TEOFILO-OTONI','MG'),
						  (09,'ADILSON','M','ADILSON@QUEIJOS.COM',486745399,'01176458825','RUA QUEIJOS E DOCES','S B CAMPO','SP');
						  
INSERT INTO CLIENTE VALUES(10,'SEVERINO','F','SEVERINO@AOL.COM',245678910,'07299758887','RUA DA PRAIA - FORTALEZA - CE','FORTALEZA','CE');

/* O COMANDO SELECT = SELECAO E PROJECAO E JUNCAO*/

SELECT NOW();

SELECT NOW() as DATA_HORA;

SELECT NOW() as DATA_HORA, 'CASSIO ESTEVES' as DBA;

SELECT 'CASSIO ESTEVES';

SELECT 'BANCO DE DADOS';

/* ALIAS DE COLUNAS */

SELECT NOME, SEXO, EMAIL FROM CLIENTE;

SELECT ESTADO FROM CLIENTE;

SELECT NOME, SEXO, EMAIL, ENDERECO FROM CLIENTE;

SELECT NOME as CLIENTE, SEXO, EMAIL, ENDERECO FROM CLIENTE;

SELECT EMAIL, SEXO, ENDERECO, NOME, NOW() AS DATA_HORA FROM CLIENTE;


/*O COMANDO "SHOW TABLES" PARA BUSCAS TABELAS SO EXISTE NO MYSQL
= SELECT FROM DIC.DADOS
*/

/*Adicionar Coluna em Tabela MySQL Já Existente 

Para adicionar a coluna “CIDADE” do tipo “VARCHAR(30)” na tabela “CLIENTE” basta usar a seguinte consulta SQL:
Sintaxe:
ALTER TABLE CLIENTE ADD CIDADE VARCHAR(30);

FONT: https://blog.masterdaweb.com/programacao-1/sql/adicionar-coluna-em-tabela-mysql-ja-existente/

*/


/*ADICIONANDO UMA COLUNA*/

ALTER TABLE CLIENTE ADD CIDADE VARCHAR(30);

ALTER TABLE CLIENTE ADD ESTADO CHAR (2);

/*ALTERAR O NOME DE UMA COLUNA*/

ALTER TABLE CLIENTE CHANGE ESTADO UF CHAR(2);


/*
Como renomear colunas usando comandos SQL no MySQL

Sintaxe:
ALTER TABLE nome_da_tabela
CHANGE nome_atual novo_nome [Tipo de Dados];
Exemplo:

Suponha uma tabela de produtos de nome tbl_Produto com a seguinte estrutura:

Coluna	    Tipo de Dados
ID_Prod	    SMALLINT
Nome_Prod	VARCHAR(25)
Tipo_Prod	VARCHAR(20)
Preco_Prod	DECIMAL(6,2)

Desejamos alterar o nome da coluna Tipo_Prod para Categ_Prod, 
aumentando também a quantidade de caracteres suportada no campo.
Para isso, executaremos o comando a seguir:

ALTER TABLE tbl_Produto
CHANGE Tipo_Prod Categ_Prod VARCHAR(30);
Após executar o comando anterior, a coluna será renomeada como especificado.

FONTE:http://www.bosontreinamentos.com.br/mysql/como-renomear-colunas-usando-comandos-sql-no-mysql/
*/

/* Excluir registro especificados - Cláusula DELETE 
*/
DELETE FROM CLIENTE WHERE NOME = 'SUELI';

/* Excluir TODA TABELA - Cláusula DELETE */
OBS.: EXCLUIR APENAS OS REGISTROS A TABELA CONTINUA, EXCLUIR A TABELA É COM COMANDO DROP

TRUNCATE TABLE CLIENTE; /*APAGA TODOS OS REGITRO*/

DROP TABLE CLIENTE; /*APAGA A TABELA E TODO OS REGITRO*/

INSERIR DADOS NAS TABELAS

/* ALTERAR UM REGISTRO EM UMA COLUNA

NO EX ABAIXO O ID ERA 08 ALTEREI PARA 01
*/
UPDATE CLIENTE SET ID = 01 WHERE NOME = 'CASSIO ESTEVES';

UPDATE CLIENTE SET ID = 08 WHERE NOME = 'SUELI';

UPDATE CLIENTE SET CIDADE = 'S B CAMPO' WHERE NOME = 'CASSIO ESTEVES';

/* FAZER BUSCAR ORDER BY*/

SELECT * FROM CLIENTE ORDER BY ID;

/* FAZER BUSCAR ORDER BY*/
SELECT * FROM CLIENTE WHERE ESTADO;

/* FILTRANDO DADOS COM WHERE E LIKE*/

SELECT NOME, TELEFONE FROM CLIENTE;

/* FILTRANDO 
USANDO A CLAUSULA WHERE E LIKE
*/
SELECT NOME, SEXO FROM CLIENTE
WHERE SEXO = 'M';

SELECT NOME, ENDERECO FROM CLIENTE
WHERE SEXO = 'F';

SELECT NOME, SEXO FROM CLIENTE
WHERE ENDERECO = 'RJ';

/* USO DO % BUSCA TUDO QUE VEM DEPOIS % OU ANTES SE POSTO NO FINAL */

/*COMEÇA COM QLQ COISA E FINALIZA EM SP*/
SELECT NOME, SEXO FROM CLIENTE 
WHERE ENDERECO LIKE '%SP';

/*FINALIZA COM QLQ COISA E COMEEÇA COM RUA QUEIJOS*/
SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE ENDERECO LIKE 'RUA QUEIJOS%';

/*QUAL COISA QUE ESTEJA ENTRE O TESTO */
SELECT NOME, SEXO, EMAIL FROM CLIENTE
WHERE EMAIL LIKE '%GMAIL%';

/*POUCO USADO POREM PODE INFORMAR O TOTAL DE CARACTER UTILIZANDO O _*/
SELECT NOME, SEXO, EMAIL FROM CLIENTE
WHERE EMAIL LIKE '%_GMAIL%';

/*Empty set = vazio*/

/* Ajax é tecnoliga que quando vc digita algo 
em busca e abaixo ja aparece as opção */
Ajax

EXERCICIOS:/*ESTA EM OUTRO ARQUIVO TESTE DE CRIACAO DO BANCO.TXT*/

SHOW DATABASES; /*VERIFICA OS BANCO*/
SHOW TABLES;
STATUS; /*INFORMA O BANCO QUE ESTA CONECTADO*/
USE LIVRARIA; /*CONECTA AO BANCO*/
DESC LIVROS;
TRUNCATE TABLE LIVROS;
DROP TABLE LIVROS;
SELECT * FROM LIVROS;

/*OPERADORES LÓGICOS*/
OR  -> PARA QUE SAIDA DA QUERY SEJA VERDADEIRA, BASTA QUE APENAS UMA CONDICAO SEJA VERDADEIRA.
AND -> PARA QUE SAIDA SEJA VERDADEIRA TODAS AS CONDIÇÕES PRECISAM SER VERDADEIRAS.
/*
OR - OU
AND - E
*/

SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE SEXO = 'M' OR ENDERECO LIKE '%RJ';

SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE SEXO = 'M' AND ENDERECO LIKE '%RJ';

SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE SEXO = 'F' AND ESTADO LIKE '%RJ';

SELECT NOME, SEXO, ENDERECO, ESTADO FROM CLIENTE
WHERE SEXO = 'F' OR ESTADO LIKE '%SP';

SELECT NOME, SEXO, ENDERECO, ESTADO FROM CLIENTE /*FINALIZA COM AV E COMEÇA COM NÃO SEI*/
WHERE SEXO = 'F' AND ENDERECO LIKE '%AV';

SELECT NOME, SEXO, ENDERECO, ESTADO FROM CLIENTE /*COMEÇA COM AV E TERMINA COM NÃO SEI*/
WHERE SEXO = 'F' AND ENDERECO LIKE 'AV%';

SELECT NOME, SEXO, ENDERECO, ESTADO FROM CLIENTE /*CONTENHA AV EM QUALQUER PARTE DO TEXTO*/
WHERE SEXO = 'F' AND ENDERECO LIKE '%AV%';

/*CONTANDO OS REGISTRO DE UMA TABELA*/

SELECT COUNT(*)FROM CLIENTE;

SELECT COUNT(*) AS "QUANTIDA DE REGISTRO DA TAB CLIENTE" FROM CLIENTE;

/*OPERADOR GROUP BY*/
/*ELE DA VALOR TOTAL M E F*/
SELECT SEXO, COUNT(*) 
FROM CLIENTE
/*GROUP DIVIDE ENTRE M E F*/
SELECT SEXO, COUNT(*)
FROM CLIENTE
GROUP BY SEXO;

SELECT CIDADE, COUNT(*)
FROM CLIENTE
GROUP BY CIDADE;

SELECT CIDADE, COUNT(*)
FROM CLIENTE
GROUP BY CIDADE;

/*DICAS DE PERFORMANCE*/
1 MILHAO DE REGISTRO
/*COLOCAR A CONDIÇÃO QUE TEM MAIS CHANCE DE SER VERDADE NA FRENTE*/
CONDICAO
SEXO = F
CIDADE = RIO DE JANEIRO

SITUACAO - TRATAMENTO COM OU/OR
70% MULHERES = SEXO = F
30% MORA NO RIO DE JANEIRO

SELECT NOME, SEXO, ENDERECO
FROM CLIENTE WHERE SEXO = 'F' OR CIDADE = 'RIO DE JANEIRO';

SITUACAO - TRATAMENTO COM E/AND
70% MULHERES = SEXO = F
30% MORA NO RIO DE JANEIRO

SELECT NOME, SEXO, ENDERECO
FROM CLIENTE WHERE CIDADE = 'RIO DE JANEIRO' AND SEXO = 'F';

/*FILTANDO VALORES NULOS (NULL)*/
--
/*CORRETO*/
SELECT NOME, SEXO, CIDADE, EMAIL FROM CLIENTE
WHERE EMAIL IS NULL;

/*ERRADO*/
SELECT NOME, SEXO, CIDADE, EMAIL FROM CLIENTE
WHERE EMAIL = NULL;

UTILIZANDO IS NULL OU IS NOT NULL

/*TRAZ OS VALORES NÃO NULOS OU NÃO VAZIOS DE UMA TABELA*/
SELECT NOME, SEXO, CIDADE, EMAIL FROM CLIENTE 
WHERE EMAIL IS NOT NULL;

/*UTILIZANDO O UPDATE PARA ATUALIZAR VALORES*/
-- NAS LINHAS 210 TEM MAIS EX DOS COMANDO UPDATE.

SELECT ID, NOME, EMAIL FROM CLIENTE;

/* ATENCAO AO USAR O UPDATE COMANDO SEM WHERE VAI ALTERAR
TODOS OS REGISTRO, SEMPRE UTILIZAR O WHERE. 

UPDATE CLIENTE
SET EMAIL ='TESTE@TESTE.COM';
*/
UPDATE CLIENTE SET EMAIL = 'TESTE@TESTE.COM' WHERE ID = 07;

/*APAGAR UM REGISTRO OU DEIXAR VAZIO BASTA UTILIZAR O COMANDO UPDATE NULL*/
UPDATE CLIENTE SET EMAIL = NULL WHERE ID IS NULL;

/*DELETANDO REGISTRO COM A CLAUSULA DELETE*/
--CUIDADO COM CLAUSULA DELETE

/*DELETE FROM CLIENTE;*/ APAGARA TUDO CUIDADO

SELECT COUNT(*) FROM CLIENTE; -- TOTAL 10
SELECT COUNT(*) FROM CLIENTE WHERE NOME = 'JOAO'; --TOTAL 2

SELECT * FROM CLIENTE WHERE NOME = 'JOAO'; -- CHAMA TODOS OS JOAO

-- ANTES DE DELETAR PODEMOS UTILIZAR O SELECT * FROM PARA CONFIRMA O VALOR A SER EXCLUIDO
--USAR * SO SELECT FROM NÃO FUNCIONA
SELECT * FROM CLIENTE WHERE NOME = 'JOAO' AND ID IS NULL;

-- APOAS CONFIRMADO EXECUTAR O COMANDO PARA DELETAR
DELETE FROM CLIENTE WHERE NOME = 'JOAO' AND ID IS NULL;

EX. COM OR

-- ANTES DE DELETAR PODEMOS UTILIZAR O SELECT * FROM PARA CONFIRMA O VALOR A SER EXCLUIDO
--USAR * SO SELECT FROM NÃO FUNCIONA
SELECT * FROM CLIENTE WHERE NOME = 'JOAO' AND ID IS NULL;

-- APOAS CONFIRMADO EXECUTAR O COMANDO PARA DELETAR
DELETE FROM CLIENTE WHERE NOME = 'JOAO' AND ID IS NULL;

/*
OR TRAZ TODO MUNDO COM APENAS UMA DAS DUAS CONDICAO
AND TRAZ APENAS O REGISTRO QUE SATISFACA AS DUAS CONDICOES
*/

/*ISERINDO DADOS NA TABELA CLIENTE*/
INSERT INTO CLIENTE VALUES(03,'SILVA','M','SILVA@AOL.COM',NULL,NULL,'AV PAULISTA,01',NULL, 'SP');

INSERT INTO CLIENTE VALUES(11,'SILVA','M','SILVA@YMAIL.COM',188638201,'01122923111','AV PAULISTA,01','SAO PAULO', 'SP'),
						  (12,'SOUZA','M','SOUZA@GMAIL.COM',288638202,'01122923112','AV PAULISTA,02','SAO PAULO', 'SP'),
						  (13,'SANTOS','M','SANTOS@YAHOO.COM',388638203,'01122923113','AV SERTANEJO,03','GOIANIA', 'GO'),
						  (14,'OLIVEIRA','M','OLIVEIRA@HOTMAIL.COM',488638204,'01122923114','AV ARROCHA,04','GOIANIA', 'GO'),
						  (15,'IAN','M','IAN@GMAIL.COM',588638205,'01122923115','AV DA MATA,05','MANAUS', 'AM'),
						  (16,'DILMA','F','DILMA@YAHOO.COM',688638206,'01122923116','AV DA SELVA,06','MANAUS', 'AM'),
						  (17,'ADELE','F','ADELE@GMAIL.COM',788638207,'01122923117','AV DAS GATAS,07','CURITIBA', 'PR'),
						  (18,'LIMA','M','LIMA@BOL.COM',888638208,'01122923118','AV LA BELLA,08','CURITIBA', 'PR'),
						  (19,'JAIR','M','JAIR@YMAIL.COM',988638209,'01122923119','AV AEROPORTO,09','CAMPINAS', 'SP'),
						  (20,'MARI','F','MARI@TERRA.COM',188638210,'01122923120','AV DO LANCHE BOM,10','BAURU', 'SP'),
						  (21,'DELUCA','M','DELUCA@CESTEVES.COM',118638211,'01122923129','AV NA QUEBRADA,11','DIADEMA', 'SP'),
						  (22,'ROSANA','F','ROSANA@GMAIL.COM',128638212,'01122925114','AV AGROPECUARIA,12','RONDONOPOLIS', 'RO'),
						  (23,'BIA','F','BIA@YMAIL.COM',138638213,'01122923133','AV CARIBE,13','RECIFE', 'CE'),
						  (24,'JULIA','F','JULIA@TERRA.COM',148638214,'01122923144','AV TECHNOBREGA,14','BELEM', 'PA'),
						  (25,'BIA','F','BIA@GMAIL.COM',158638215,'01122923155','AV RIO GRANDE NO NORTE,15','NATAL', 'RN');
						  


/*BRICANDO COM MYSQL*/


SELECT * FROM CLIENTE ORDER BY ID;

SELECT ID, NOME, CIDADE, ESTADO FROM CLIENTE
WHERE ESTADO = 'SP'
ORDER BY CIDADE;

SELECT NOME, EMAIL, UF FROM CLIENTE
WHERE UF = 'SP' AND EMAIL LIKE '%GMAIL%';


SELECT ID, NOME, SEXO, CIDADE, UF FROM CLIENTE
WHERE NOME = 'SILVA' AND SEXO = 'M';

SELECT ID, NOME, SEXO, CIDADE, UF FROM CLIENTE
WHERE NOME = 'SILVA' AND CIDADE IS NOT NULL;

UPDATE CLIENTE SET CPF = NULL WHERE ID = 15 AND 21;

UPDATE CLIENTE SET ID = 24 WHERE NOME = 'IAN'

SELECT SEXO, COUNT(*)FROM CLIENTE GROUP BY SEXO;

SELECT NOME, SEXO, CIDADE, UF FROM CLIENTE
WHERE SEXO = 'F' AND UF = 'MG';

SELECT NOME, SEXO, CIDADE, UF FROM CLIENTE
WHERE SEXO = 'F' OR UF = 'MG';

SELECT NOME, SEXO, CIDADE, UF FROM CLIENTE
WHERE UF = 'MG' OR SEXO = 'F' ;

SELECT CIDADE, COUNT(*)
FROM CLIENTE
GROUP BY CIDADE;

SELECT ID, NOME, SEXO, CPF, UF FROM CLIENTE
WHERE CPF IS NULL AND SEXO = 'F';

SELECT ID, NOME, SEXO, CPF,CIDADE, UF FROM CLIENTE
WHERE CPF IS NOT NULL AND UF = 'SP';

SELECT ID, NOME, SEXO, CPF,CIDADE, UF FROM CLIENTE
WHERE CPF IS NOT NULL OR UF = 'SP';

SELECT NOME_DO_AUTOR, SEXO_DO_AUTOR, ESTADO_DA_EDITORA AS UF FROM LIVROS
WHERE SEXO_DO_AUTOR = 'MASCULINO' AND (ESTADO_DA_EDITORA = 'SP'	OR ESTADO_DA_EDITORA ='RJ');

SELECT ID, NOME, SEXO, CPF,CIDADE, UF FROM CLIENTE
WHERE SEXO = 'M' AND (UF = 'SP' OR UF = 'GO');

SELECT ID, NOME, SEXO, CPF,CIDADE, UF FROM CLIENTE
WHERE SEXO = 'M' AND (UF = 'SP' OR UF = 'GO') AND CPF IS NOT NULL;

SELECT * FROM CLIENTE
WHERE ID = 01;

MODELAGEM

/*
PRIEMIRA FORMA NORMAL, EXISTE TRES REGRAS, LISTADA ABAIXO;

1 - TODO CAMPO VETORIZADO SE TORNARA OUTRA TABELA 

[AMERELO,AZUL,VERMELHO] -> CORES
[GOL,UNO,FUSCA] -> CARROS

2 - TODO CAMPO MULTIVALORIZADO SE TORNARA OUTRA TABELA QUANDO O CAMPO FOR DIVISIVEL.

3 - TODA TABELA NECESSITA DE PELO MENOS UM CAMPO QUE IDENTIFIQUE TODO O REGISTRO COMO SENDO UNICO.
ISSO É O QUE CHAMAMOS DE CHAVE PRIMARIA OU PRIMARY KEY */


/*AULAS LIVRES*/
SELECT NOME, SEXO, EMAIL, BAIRRO, CIDADE, ESTADO FROM V_RELATORIO
	WHERE SEXO = 'M' AND ESTADO = 'SP';

SELECT 
	C.NOME, 
	C.SEXO, 
	C.EMAIL,
	E.BAIRRO, 
	E.CIDADE, 
	E.ESTADO 
	FROM CLIENTE C
	INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE
	WHERE SEXO = 'M' AND ESTADO = 'SP';



PROGRAMACAO EM BANCO DE DADOS

/*STORED PROCEDURE*/


SELECT 'CASSIO'; /*BLOCO ANONIMO*/

ANTES DE QUALQUER PROGRAMACAO DENTRO DO BANCO ALTERAR O DELIMITER, EX ABAIXO

DELIMITER $

SINTAXE

CREATE PROCEDURE NOME ()
	BEGIN
		QUALQUER PROGRAMACAO;
	END$

SINTAXE

CREATE PROCEDURE NOME_EMPRESA()
	BEGIN
		SELECT 'UNIVERSIDADE DOS DADOS' AS EMPRESA;
	END
	$


CHAMANDO UMA PROCEDURE

CALL NOME_EMPRESA () $

DELIMITER ;

CALL NOME_EMPRESA () ;


SELECT 10 + 10 AS CONTA;

CREATE PROCEDURE CONTA ()
	BEGIN
		SELECT 10 + 10 AS CONTA;
	END
	$


CALL CONTA () ;

/*APAGANDO UMA PROCEDURE, OBS SEM ()*/
DROP PROCEDURE CONTA;



CREATE PROCEDURE CONTA (NUMERO1 INT, NUMERO2 INT)
	BEGIN
		SELECT NUMERO1 + NUMERO2 AS CONTA;
	END
	$

DELIMITER ;
DELIMITER $

CALL CONTA (2,2);
CALL CONTA (4,4);
CALL CONTA (5,5);
CALL CONTA (6,6);
CALL CONTA (7,7);
CALL CONTA (8,8);