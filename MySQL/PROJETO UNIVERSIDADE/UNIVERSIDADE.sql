CREATE DATABASE UNIVERSIDADE;

USE UNIVERSIDADE;

CREATE TABLE CURSOS(
	IDCURSO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	HORAS INT(3) NOT NULL,
	VALOR FLOAT(10,2) NOT NULL
);

INSERT INTO CURSOS VALUES (NULL,'JAVA',30,500.00);
INSERT INTO CURSOS VALUES (NULL,'RUBY',40,600.00);
INSERT INTO CURSOS VALUES (NULL,'SQL',80,1200.00);
INSERT INTO CURSOS VALUES (NULL,'PERL',70,200.00);
INSERT INTO CURSOS VALUES (NULL,'ADVPL',200,1300.00);
INSERT INTO CURSOS VALUES (NULL,'BANCO DE DADOS',150,850.00);

SELECT * FROM CURSOS;

/*SUBMATERIA DE BANCO
DESENVOLVIMENTO DE BANCO DE DADOS (PLSQL OU TSSQL)*/


DELIMITER ;
DELIMITER $

CREATE PROCEDURE CAD_CURSO (
	P_NOME VARCHAR(30),
	P_HORAS INT(30),
	P_PRECO FLOAT(10,2)
	)

 BEGIN
	INSERT INTO CURSOS VALUES(NULL,P_NOME,P_HORAS,P_PRECO);
 END$


CALL CAD_CURSO ('POWER BI',45,2500.00);
CALL CAD_CURSO ('HTML',82,250.00);
CALL CAD_CURSO ('PHP',110,102.00);
CALL CAD_CURSO ('PYTHON',85,720.00);
CALL CAD_CURSO ('SQLSERVER',130,50.00);
CALL CAD_CURSO ('EXILIR',160,980.00);

/*CRIAR UMA PROCEDURE PARA CONSULTAR CURSOS*/

SELECT NOME FROM CURSOS;


CREATE PROCEDURE CONSUL ()
 BEGIN
 	SELECT NOME FROM CURSOS
 	ORDER BY 1;
 END$

CALL CONSUL;

DROP PROCEDURE CONSUL;

/*AUTORELACIONAMENTO */

AUTORELACIONAMENTO

CREATE DATABASE CURSO;
USE CURSO;

CREATE TABLE CURSOS(
	IDCURSO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	HORAS INT(10),
	VALOR FLOAT(10,2),
	ID_PREREQ INT
	);

/*CRIANDO A CHAVE ESTRANGEIRA */

ALTER TABLE CURSOS ADD CONSTRAINT FK_PREREQ
 FOREIGN KEY(ID_PREREQ) REFERENCES CURSOS(IDCURSO);

/*VERIFICAR AS CHAVES ESTRANGEIRA E OUTROS DETALHES*/
SHOW CREATE TABLE CURSOS;

mysql> SHOW CREATE TABLE CURSOS;
+--------+--------------------------------------------------------------------------
------------------------------------------------------------------------------------
-------------------------------------------+
| Table  | Create Table

                                           |
+--------+--------------------------------------------------------------------------
------------------------------------------------------------------------------------
-------------------------------------------+
| CURSOS | CREATE TABLE `cursos` (
  `IDCURSO` int(11) NOT NULL AUTO_INCREMENT,
  `NOME` varchar(30) DEFAULT NULL,
  `HORAS` int(10) DEFAULT NULL,
  `VALOR` float(10,2) DEFAULT NULL,
  `ID_PREREQ` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDCURSO`),
  KEY `FK_PREREQ` (`ID_PREREQ`),
  CONSTRAINT `FK_PREREQ` FOREIGN KEY (`ID_PREREQ`) REFERENCES `cursos` (`IDCURSO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 |
+--------+--------------------------------------------------------------------------
------------------------------------------------------------------------------------
-------------------------------------------+
1 row in set (0.01 sec)


INSERT INTO CURSOS VALUES(NULL,'BD RELACIONAL',20,400.00,NULL);
INSERT INTO CURSOS VALUES(NULL,'BUSINESS INTELLIGENCE',40,800.00,1);
INSERT INTO CURSOS VALUES(NULL,'RELATORIO AVANCADOS',30,600.00,2);
INSERT INTO CURSOS VALUES(NULL,'LOGICA DE PROGRAMACAO',10,300.00,NULL);
INSERT INTO CURSOS VALUES(NULL,'RUBY',30,500.00,4);

SELECT * FROM CURSOS;

SELECT IDCURSO,NOME,HORAS,VALOR, ID_PREREQ AS 'PRE REQUISITO'
	FROM CURSOS;
--OU
SELECT IDCURSO,NOME,HORAS,VALOR, IFNULL(ID_PREREQ,"SEM REQUISITO") AS 'REQUISITO'
	FROM CURSOS;
--OU
SELECT IDCURSO,NOME,HORAS,VALOR, IFNULL(ID_PREREQ,"SEM REQUISITO") AS REQUISITO
	FROM CURSOS;

/*NOME, VALOR, HORAS E O NOME DO PRE REQUISITO DO CURSO*/

-- UTILIZANDO INNER JOIN

SELECT 
	C.NOME AS CURSO,
	C.VALOR AS VALOR,
	C.HORAS AS CARGA,
	IFNULL(P.NOME,'SEM REQUISITO') AS 'PRE REQUISITO'
	FROM CURSOS C
	INNER JOIN CURSOS P
	ON P.IDCURSO = C.ID_PREREQ;

mysql> SELECT   C.NOME AS CURSO,        C.VALOR AS VALOR,       C.H
        ON P.IDCURSO = C.ID_PREREQ;
+-----------------------+--------+-------+-----------------------+
| CURSO                 | VALOR  | CARGA | PRE REQUISITO         |
+-----------------------+--------+-------+-----------------------+
| BUSINESS INTELLIGENCE | 800.00 |    40 | BD RELACIONAL         |
| RELATORIO AVANCADOS   | 600.00 |    30 | BUSINESS INTELLIGENCE |
| RUBY                  | 500.00 |    30 | LOGICA DE PROGRAMACAO |
+-----------------------+--------+-------+-----------------------+
3 rows in set (0.01 sec)

-- UTILIZANDO LEFT JOIN

SELECT 
	C.NOME AS CURSO,
	C.VALOR AS VALOR,
	C.HORAS AS CARGA,
	IFNULL(P.NOME,'-----------') AS 'PRE REQUISITO'
	FROM CURSOS C LEFT JOIN CURSOS P
	ON P.IDCURSO = C.ID_PREREQ;

mysql> SELECT   C.NOME AS CURSO,        C.VALOR AS VALOR,       C.HO
P.IDCURSO = C.ID_PREREQ;
+-----------------------+--------+-------+-----------------------+
| CURSO                 | VALOR  | CARGA | PRE REQUISITO         |
+-----------------------+--------+-------+-----------------------+
| BD RELACIONAL         | 400.00 |    20 | -----------           |
| BUSINESS INTELLIGENCE | 800.00 |    40 | BD RELACIONAL         |
| RELATORIO AVANCADOS   | 600.00 |    30 | BUSINESS INTELLIGENCE |
| LOGICA DE PROGRAMACAO | 300.00 |    10 | -----------           |
| RUBY                  | 500.00 |    30 | LOGICA DE PROGRAMACAO |
+-----------------------+--------+-------+-----------------------+
5 rows in set (0.00 sec)