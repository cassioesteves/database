CREATE DATABASE EMPRESA;

CREATE TABLE VENDEDORES(
	IDVENDEDOR INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	SEXO CHAR(1),
	JANEIRO FLOAT(10,2),
	FEVEREIRO FLOAT(10,2),
	MARCO FLOAT(10,2)
);

INSERT INTO VENDEDORES VALUES(NULL, 'KITANA','F', 1250.00, 3500.00, 740.00);
INSERT INTO VENDEDORES VALUES(NULL, 'FULANO','M', 1350.00, 5500.00, 9800.00);
INSERT INTO VENDEDORES VALUES(NULL, 'CICRANO','M', 1450.00, 2500.00, 90.00);
INSERT INTO VENDEDORES VALUES(NULL, 'BELTRANO','M', 1550.00, 8500.00, 100.50);
INSERT INTO VENDEDORES VALUES(NULL, 'ALANA','F', 1550.00, 9500.00, 9800.00);
INSERT INTO VENDEDORES VALUES(NULL, 'MENGANO','M', 1650.00, 2500.00, 8400.00);
INSERT INTO VENDEDORES VALUES(NULL, 'ZUTANO','M', 1750.00, 1000.00, 920.50);
INSERT INTO VENDEDORES VALUES(NULL, 'CITANA',	'F', 1850.00, 4900.00, 900.00);
INSERT INTO VENDEDORES VALUES(NULL, 'PERENGANO','M', 1950.00, 8500.00, 500.60);
INSERT INTO VENDEDORES VALUES(NULL, 'DELTRANA','F', 2250.00, 9600.00, 1500.00);
INSERT INTO VENDEDORES VALUES(NULL, 'MORGANA','F', 9000.00, 8400.00, 13200.00);
INSERT INTO VENDEDORES VALUES(NULL, 'RUIM DE TRAMPO','M', 15.00, 12.50, 8.50);
INSERT INTO VENDEDORES VALUES(NULL, 'EXCELENCIA','F', 350000.00, 850500.00, 1532500.00);
INSERT INTO VENDEDORES VALUES(NULL, 'LAMEDIA','F', 15000.00, 184000.00, 130200.00);
INSERT INTO VENDEDORES VALUES(NULL, 'PROVA REAL','F', 20000.00, 20000.00,20000.00);

SELECT * FROM VENDEDORES;


SELECT NOME, SEXO FROM VENDEDORES
 WHERE SEXO = 'F';


SELECT NOME, SEXO FROM VENDEDORES
 WHERE SEXO = 'M';

/* MAX - TRAZ O VALOR MAXIMO DE UMA COLUNA*/
/* COLCHETE COLADO NA FUNÇÃO EX. MAX() SEM ESPACO*/
SELECT MAX(JANEIRO) AS MAIOR_JAN
 FROM VENDEDORES;

SELECT MAX(JANEIRO) AS MAIOR_JAN
 FROM 4;

/* MIN - TRAZ O VALOR MINIMO DE UMA COLUNA*/
SELECT MIN(JANEIRO) AS MIN_JAN
 FROM VENDEDORES;

 /* AVG - TRAZ O VALOR MEDIO DE UMA COLUNA*/

SELECT AVG(JANEIRO) AS MEDIA_JAN
 FROM VENDEDORES;

 VARIAS FUNCOES

SELECT MAX(FEVEREIRO) AS MAIOR_FEV,
 	   AVG(FEVEREIRO) AS MEDIA_FEV,
 	   MIN(FEVEREIRO) AS MIN_FEV
 FROM VENDEDORES;

/*TRUMCATE*/ -- REDUZ O TOTAL DE CASAS DECIMAIS DEPOIS DA ,
SELECT MAX(FEVEREIRO) AS MAIOR_FEV,
 	   TRUNCATE(AVG(FEVEREIRO),2) AS MEDIA_FEV,
 	   MIN(FEVEREIRO) AS MIN_FEV
 FROM VENDEDORES;


/*AGREGANDO COM SUM()*/ -- SOMA TODO VALOR DE UMA COLUNA

SELECT SUM(JANEIRO) AS TOTAL_JAN
 FROM VENDEDORES;


SELECT SUM(JANEIRO) AS TOTAL_JAN,
	   SUM(FEVEREIRO) AS TOTAL_FEV,
	   SUM(MARCO) AS TOTAL_MAR
 FROM VENDEDORES;

/* VENDAS POR SEXO*/

SELECT SEXO, SUM(JANEIRO) AS TOTAL_JANEIRO
	FROM VENDEDORES
	GROUP BY SEXO;

/* VENDAS POR SEXO TODOS MESES*/

SELECT SEXO, SUM(JANEIRO) AS TOTAL_JANEIRO,
	   SEXO, SUM(FEVEREIRO) AS TOTAL_FEVEREIRO,
	   SEXO, SUM(MARCO) AS TOTAL_MARCO
	FROM VENDEDORES
	GROUP BY SEXO;


SELECT SEXO, SUM(JANEIRO) AS TOTAL_JANEIRO
	FROM VENDEDORES
	WHERE SEXO = 'F';

	SUBQUERY

/* VENDEDOR QUE VENDEU MENOS EM MARCO E SEU NOME */

SELECT MIN(MARCO) FROM VENDEDORES;

SELECT NOME, MARCO FROM VENDEDORES
 WHERE MARCO = (SELECT MIN(MARCO) FROM VENDEDORES);


/* VENDEDOR QUE VENDEU MAIS EM MARCO E SEU NOME */

SELECT MAX(MARCO) FROM VENDEDORES;

SELECT NOME, MARCO FROM VENDEDORES
 WHERE MARCO = (SELECT MAX(MARCO) FROM VENDEDORES);


/*VENDEDOR QUE VENDEU MAIS QUE A MEDIA DO MES DE FEVEREIRO*/ --INCLUIDO JANEIRO E MARCO

SELECT AVG(JANEIRO) FROM VENDEDORES;
SELECT AVG(FEVEREIRO) FROM VENDEDORES;
SELECT AVG(MARCO) FROM VENDEDORES;

SELECT TRUNCATE(AVG(FEVEREIRO),2) AS MEDIA_FEV FROM VENDEDORES;

SELECT NOME, JANEIRO FROM VENDEDORES
 WHERE JANEIRO > (SELECT AVG(JANEIRO) FROM VENDEDORES);

SELECT NOME, FEVEREIRO FROM VENDEDORES
 WHERE FEVEREIRO > (SELECT AVG(FEVEREIRO) FROM VENDEDORES);

SELECT NOME, MARCO FROM VENDEDORES
 WHERE MARCO > (SELECT AVG(MARCO) FROM VENDEDORES);

SELECT NOME, MARCO FROM VENDEDORES
 WHERE MARCO > (SELECT AVG(MARCO) FROM VENDEDORES)
 ORDER BY MARCO DESC;

/*USANDO O TRUNCATE PARA MEDIA*/

/*MAIOR QUE A MEDIA */
SELECT IDVENDEDOR, NOME, FEVEREIRO FROM VENDEDORES
 WHERE FEVEREIRO > (SELECT TRUNCATE(AVG(FEVEREIRO),2) AS MEDIA_FEV FROM VENDEDORES);
/*MENOR QUE A MDEIA*/
SELECT IDVENDEDOR, NOME, FEVEREIRO FROM VENDEDORES
 WHERE FEVEREIRO < (SELECT TRUNCATE(AVG(FEVEREIRO),2) AS MEDIA_FEV FROM VENDEDORES);
/*QUEM VENDEU MAIS*/
SELECT IDVENDEDOR, NOME, FEVEREIRO FROM VENDEDORES
 WHERE FEVEREIRO  = (SELECT TRUNCATE(MAX(FEVEREIRO),2) AS MEDIA_FEV FROM VENDEDORES);
/*QUEM VENDEU MENOS*/
SELECT IDVENDEDOR, NOME, FEVEREIRO FROM VENDEDORES
 WHERE FEVEREIRO = (SELECT TRUNCATE(MIN(FEVEREIRO),2) AS MEDIA_FEV FROM VENDEDORES);

SELECT * FROM VENDEDORES;

SELECT * FROM VENDEDORES
 ORDER BY NOME;

ALTER QUERY (QUERY DE FORA)
INNER QUERY (QUERY DE DENTRO)

/*OPERADORES EM LINHA*/

SELECT NOME,
	   JANEIRO,
	   FEVEREIRO,
	   MARCO,
	   (JANEIRO+FEVEREIRO+MARCO) AS "TOTAL",
	   TRUNCATE((JANEIRO+FEVEREIRO+MARCO)/3,2) AS "MEDIA"
	   FROM VENDEDORES;

SELECT NOME,
	   JANEIRO,
	   FEVEREIRO,
	   MARCO,
	   (JANEIRO+FEVEREIRO+MARCO) AS "TOTAL",
	   TRUNCATE((JANEIRO+FEVEREIRO+MARCO)/3,2) AS "MEDIA"
	   FROM VENDEDORES
	   ORDER BY MEDIA DESC;

mysql> SELECT NOME,        JANEIRO,        FEVEREIRO,      MARCO,          (JANEI
FROM VENDEDORES    ORDER BY MEDIA DESC;
+----------------+-----------+-----------+------------+------------+-----------+
| NOME           | JANEIRO   | FEVEREIRO | MARCO      | TOTAL      | MEDIA     |
+----------------+-----------+-----------+------------+------------+-----------+
| EXCELENCIA     | 350000.00 | 850500.00 | 1532500.00 | 2733000.00 | 911000.00 |
| LAMEDIA        |  15000.00 | 184000.00 |  130200.00 |  329200.00 | 109733.33 |
| MORGANA        |   9000.00 |   8400.00 |   13200.00 |   30600.00 |  10200.00 |
| ALANA          |   1550.00 |   9500.00 |    9800.00 |   20850.00 |   6950.00 |
| FULANO         |   1350.00 |   5500.00 |    9800.00 |   16650.00 |   5550.00 |
| DELTRANA       |   2250.00 |   9600.00 |    1500.00 |   13350.00 |   4450.00 |
| MENGANO        |   1650.00 |   2500.00 |    8400.00 |   12550.00 |   4183.33 |
| PERENGANO      |   1950.00 |   8500.00 |     500.60 |   10950.60 |   3650.20 |
| BELTRANO       |   1550.00 |   8500.00 |     100.50 |   10150.50 |   3383.50 |
| CITANA         |   1850.00 |   4900.00 |     900.00 |    7650.00 |   2550.00 |
| KITANA         |   1250.00 |   3500.00 |     740.00 |    5490.00 |   1830.00 |
| CICRANO        |   1450.00 |   2500.00 |      90.00 |    4040.00 |   1346.66 |
| ZUTANO         |   1750.00 |   1000.00 |     920.50 |    3670.50 |   1223.50 |
| RUIM DE TRAMPO |     15.00 |     12.50 |       8.50 |      36.00 |     12.00 |
+----------------+-----------+-----------+------------+------------+-----------+

/* SEM O TRUNCATE*/
SELECT NOME,
	   JANEIRO,
	   FEVEREIRO,
	   MARCO,
	   (JANEIRO+FEVEREIRO+MARCO) AS "TOTAL",
	   (JANEIRO+FEVEREIRO+MARCO)/3 AS "MEDIA"
	   FROM VENDEDORES
	   ORDER BY MEDIA DESC;

mysql> SELECT NOME,        JANEIRO,        FEVEREIRO,      MARCO,          (JANEIRO+F
DEDORES    ORDER BY MEDIA DESC;
+----------------+-----------+-----------+------------+------------+---------------+
| NOME           | JANEIRO   | FEVEREIRO | MARCO      | TOTAL      | MEDIA         |
+----------------+-----------+-----------+------------+------------+---------------+
| EXCELENCIA     | 350000.00 | 850500.00 | 1532500.00 | 2733000.00 | 911000.000000 |
| LAMEDIA        |  15000.00 | 184000.00 |  130200.00 |  329200.00 | 109733.333333 |
| MORGANA        |   9000.00 |   8400.00 |   13200.00 |   30600.00 |  10200.000000 |
| ALANA          |   1550.00 |   9500.00 |    9800.00 |   20850.00 |   6950.000000 |
| FULANO         |   1350.00 |   5500.00 |    9800.00 |   16650.00 |   5550.000000 |
| DELTRANA       |   2250.00 |   9600.00 |    1500.00 |   13350.00 |   4450.000000 |
| MENGANO        |   1650.00 |   2500.00 |    8400.00 |   12550.00 |   4183.333333 |
| PERENGANO      |   1950.00 |   8500.00 |     500.60 |   10950.60 |   3650.200002 |
| BELTRANO       |   1550.00 |   8500.00 |     100.50 |   10150.50 |   3383.500000 |
| CITANA         |   1850.00 |   4900.00 |     900.00 |    7650.00 |   2550.000000 |
| KITANA         |   1250.00 |   3500.00 |     740.00 |    5490.00 |   1830.000000 |
| CICRANO        |   1450.00 |   2500.00 |      90.00 |    4040.00 |   1346.666667 |
| ZUTANO         |   1750.00 |   1000.00 |     920.50 |    3670.50 |   1223.500000 |
| RUIM DE TRAMPO |     15.00 |     12.50 |       8.50 |      36.00 |     12.000000 |
+----------------+-----------+-----------+------------+------------+---------------+



SELECT NOME,
	   JANEIRO,
	   FEVEREIRO,
	   MARCO,
	   (JANEIRO+FEVEREIRO+MARCO) AS "TOTAL",
	   (JANEIRO+FEVEREIRO+MARCO) * 0.25 AS "DESCONTO",
	   TRUNCATE((JANEIRO+FEVEREIRO+MARCO)/3,2) AS "MEDIA"
	   FROM VENDEDORES
	   ORDER BY MEDIA DESC;

/*CALCULANDO COM COMISSAO*/
SELECT NOME,
	   JANEIRO,
	   FEVEREIRO,
	   MARCO,
	   (JANEIRO+FEVEREIRO+MARCO) AS "TOTAL",
	   (JANEIRO+FEVEREIRO+MARCO) * 0.25 AS "DESCONTO",
	   TRUNCATE((JANEIRO+FEVEREIRO+MARCO)/3,2) AS "MEDIA",
	   (JANEIRO+FEVEREIRO+MARCO) * 0.05 AS "COMISSAO DIRETA 0.05",
	   TRUNCATE((JANEIRO+FEVEREIRO+MARCO)/3,2) * 0.05 AS "COMISSAO MEDIA 0.05",
	   TRUNCATE((JANEIRO+FEVEREIRO+MARCO)/3,2) * 0.03 AS "COMISSAO MEDIA 0.03"
	   FROM VENDEDORES
	   ORDER BY MEDIA DESC;


/*TRIGGERS NA PRATICA*/

/* A 39 ENTENDENDO TRIGGERS */


SELECT * FROM BKP_PRODUTO;

SELECT * FROM PRODUTO;

SELECT * FROM BACKUP.BKP_PRODUTO;