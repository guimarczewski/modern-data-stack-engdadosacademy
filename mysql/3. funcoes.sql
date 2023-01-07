/* FUNÇÃO IFNULL() - EXISTEM EM OUTROS DB */

/* FUNCAO PEGAR NOME, EMAIL, ESTADO, NUMERO */
SELECT C.NOME, C.EMAIL, E.ESTADO, T.NUMERO
FROM CLIENTE C 
INNER JOIN ENDERECO E ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T ON C.IDCLIENTE = T.ID_CLIENTE;

+---------+-------------------+--------+----------+
| NOME    | EMAIL             | ESTADO | NUMERO   |
+---------+-------------------+--------+----------+
| JORGE   | JORGE@IG.COM      | ES     | 78458743 |
| JORGE   | JORGE@IG.COM      | ES     | 56576876 |
| JOAO    | JOAOA@IG.COM      | RJ     | 87866896 |
| CARLOS  | CARLOSA@IG.COM    | RJ     | 54768899 |
| JOAO    | JOAOA@IG.COM      | RJ     | 99667587 |
| ANA     | ANA@IG.COM        | SP     | 78989765 |
| ANA     | ANA@IG.COM        | SP     | 99766676 |
| JOAO    | JOAOA@IG.COM      | RJ     | 66687899 |
| JORGE   | JORGE@IG.COM      | ES     | 89986668 |
| CARLOS  | CARLOSA@IG.COM    | RJ     | 88687909 |
| FLAVIO  | FLAVIO@IG.COM     | MG     | 68976565 |
| FLAVIO  | FLAVIO@IG.COM     | MG     | 99656675 |
| GIOVANA | NULL              | RJ     | 33567765 |
| GIOVANA | NULL              | RJ     | 88668786 |
| GIOVANA | NULL              | RJ     | 55689654 |
| KARLA   | KARLA@GMAIL.COM   | RJ     | 88687979 |
| DANIELE | DANIELE@GMAIL.COM | ES     | 88965676 |
| EDUARDO | NULL              | PR     | 89966809 |
| ANTONIO | ANTONIO@IG.COM    | SP     | 88679978 |
| ANTONIO | ANTONIO@UOL.COM   | PR     | 99655768 |
| ELAINE  | ELAINE@GLOBO.COM  | SP     | 89955665 |
| CARMEM  | CARMEM@IG.COM     | RJ     | 77455786 |
| CARMEM  | CARMEM@IG.COM     | RJ     | 89766554 |
| ADRIANA | ADRIANA@GMAIL.COM | RJ     | 77755785 |
| ADRIANA | ADRIANA@GMAIL.COM | RJ     | 44522578 |
+---------+-------------------+--------+----------+

IFNULL(COLUNA)

SELECT 
	C.NOME, 
	IFNULL(C.EMAIL, 'NÃO POSSUI EMAIL') AS EMAIL
FROM CLIENTE C 
INNER JOIN ENDERECO E 
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T 
ON C.IDCLIENTE = T.ID_CLIENTE;

+---------+-------------------+
| NOME    | EMAIL             |
+---------+-------------------+
| JOAO    | JOAOA@IG.COM      |
| JOAO    | JOAOA@IG.COM      |
| JOAO    | JOAOA@IG.COM      |
| CARLOS  | CARLOSA@IG.COM    |
| CARLOS  | CARLOSA@IG.COM    |
| ANA     | ANA@IG.COM        |
| ANA     | ANA@IG.COM        |
| JORGE   | JORGE@IG.COM      |
| JORGE   | JORGE@IG.COM      |
| JORGE   | JORGE@IG.COM      |
| FLAVIO  | FLAVIO@IG.COM     |
| FLAVIO  | FLAVIO@IG.COM     |
| GIOVANA | NÃO POSSUI EMAIL  |
| GIOVANA | NÃO POSSUI EMAIL  |
| GIOVANA | NÃO POSSUI EMAIL  |
| KARLA   | KARLA@GMAIL.COM   |
| DANIELE | DANIELE@GMAIL.COM |
| EDUARDO | NÃO POSSUI EMAIL  |
| ANTONIO | ANTONIO@IG.COM    |
| ANTONIO | ANTONIO@UOL.COM   |
| ELAINE  | ELAINE@GLOBO.COM  |
| CARMEM  | CARMEM@IG.COM     |
| CARMEM  | CARMEM@IG.COM     |
| ADRIANA | ADRIANA@GMAIL.COM |
| ADRIANA | ADRIANA@GMAIL.COM |
+---------+-------------------+

/* VIEW */

SELECT  C.NOME, 
		C.SEXO, 
		C.EMAIL, 
		T.TIPO, 
		T.NUMERO, 
		E.BAIRRO, 
		E.CIDADE, 
		E.ESTADO
FROM CLIENTE C 
INNER JOIN ENDERECO E ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T ON C.IDCLIENTE = T.ID_CLIENTE;

CREATE VIEW RELATORIO AS
SELECT  C.NOME, 
		C.SEXO, 
		C.EMAIL, 
		T.TIPO, 
		T.NUMERO, 
		E.BAIRRO, 
		E.CIDADE, 
		E.ESTADO
FROM CLIENTE C 
INNER JOIN ENDERECO E ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T ON C.IDCLIENTE = T.ID_CLIENTE;

SELECT * FROM RELATORIO;

DROP VIEW RELATORIO;

/* INSERINDO UM PREFIXO V_ */

CREATE VIEW V_RELATORIO AS
SELECT  C.NOME, 
		C.SEXO, 
		IFNULL(C.EMAIL,'CLIENTE SEM EMAIL') AS EMAIL, 
		T.TIPO, 
		T.NUMERO, 
		E.BAIRRO, 
		E.CIDADE, 
		E.ESTADO
FROM CLIENTE C 
INNER JOIN ENDERECO E ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T ON C.IDCLIENTE = T.ID_CLIENTE;

mysql> SELECT * FROM V_RELATORIO WHERE SEXO = 'F';
+---------+------+-------------------+------+----------+---------+----------------+--------+
| NOME    | SEXO | EMAIL             | TIPO | NUMERO   | BAIRRO  | CIDADE         | ESTADO |
+---------+------+-------------------+------+----------+---------+----------------+--------+
| ANA     | F    | ANA@IG.COM        | CEL  | 78989765 | JARDINS | SAO PAULO      | SP     |
| ANA     | F    | ANA@IG.COM        | CEL  | 99766676 | JARDINS | SAO PAULO      | SP     |
| GIOVANA | F    | CLIENTE SEM EMAIL | CEL  | 33567765 | CENTRO  | RIO DE JANEIRO | RJ     |
| GIOVANA | F    | CLIENTE SEM EMAIL | CEL  | 88668786 | CENTRO  | RIO DE JANEIRO | RJ     |
| GIOVANA | F    | CLIENTE SEM EMAIL | COM  | 55689654 | CENTRO  | RIO DE JANEIRO | RJ     |
| ANTONIO | F    | ANTONIO@IG.COM    | COM  | 88679978 | JARDINS | SAO PAULO      | SP     |
| ADRIANA | F    | ADRIANA@GMAIL.COM | RES  | 77755785 | CENTRO  | RIO DE JANEIRO | RJ     |
| ADRIANA | F    | ADRIANA@GMAIL.COM | COM  | 44522578 | CENTRO  | RIO DE JANEIRO | RJ     |
+---------+------+-------------------+------+----------+---------+----------------+--------+
8 rows in set (0.05 sec)

mysql> SELECT NOME, NUMERO, ESTADO FROM V_RELATORIO;
+---------+----------+--------+
| NOME    | NUMERO   | ESTADO |
+---------+----------+--------+
| JORGE   | 78458743 | ES     |
| JORGE   | 56576876 | ES     |
| JOAO    | 87866896 | RJ     |
| CARLOS  | 54768899 | RJ     |
| JOAO    | 99667587 | RJ     |
| ANA     | 78989765 | SP     |
| ANA     | 99766676 | SP     |
| JOAO    | 66687899 | RJ     |
| JORGE   | 89986668 | ES     |
| CARLOS  | 88687909 | RJ     |
| FLAVIO  | 68976565 | MG     |
| FLAVIO  | 99656675 | MG     |
| GIOVANA | 33567765 | RJ     |
| GIOVANA | 88668786 | RJ     |
| GIOVANA | 55689654 | RJ     |
| KARLA   | 88687979 | RJ     |
| DANIELE | 88965676 | ES     |
| EDUARDO | 89966809 | PR     |
| ANTONIO | 88679978 | SP     |
| ANTONIO | 99655768 | PR     |
| ELAINE  | 89955665 | SP     |
| CARMEM  | 77455786 | RJ     |
| CARMEM  | 89766554 | RJ     |
| ADRIANA | 77755785 | RJ     |
| ADRIANA | 44522578 | RJ     |
+---------+----------+--------+


/* UPDATE, INSERT, DEL - DML - EM VIEWS */

INSERT INTO V_RELATORIOS VALUES(
'ANDREIA','F','ANDREIA@UOL.COM.BR','CEL','9982637263','CENTRO','VITORIA','ES'
)

ERROR 1146 (42S02): Table 'comercio.v_relatorios' doesn't exist'


CREATE TABLE JOGADORES(
	IDJOGADOR INT,
	NOME VARCHAR(30),
	ESTADO CHAR(2)
);

INSERT INTO JOGADORES VALUES(1,'GUERRERO','RS');
INSERT INTO JOGADORES VALUES(2,'GABIGOL','RJ');
INSERT INTO JOGADORES VALUES(3,'GANSO','RJ');
INSERT INTO JOGADORES VALUES(4,'NENÊ', 'RJ');
INSERT INTO JOGADORES VALUES(5,'LOVE','SP');

CREATE VIEW V_JOGADORES AS
SELECT NOME,
ESTADO
FROM JOGADORES;

SELECT * FROM V_JOGADORES;

/* OPERAÇÕES DE DML SÓ DÃO CERTO EM VIEWS SEM JOIN */

/* ORDER BY */

CREATE TABLE ALUNOS(
	NUMERO INT,
	NOME VARCHAR(30)
);

INSERT INTO ALUNOS VALUES(1,'JOAO');
INSERT INTO ALUNOS VALUES(1,'MARIA');
INSERT INTO ALUNOS VALUES(2,'ZOE');
INSERT INTO ALUNOS VALUES(2,'ANDRE');
INSERT INTO ALUNOS VALUES(3,'CLARA');
INSERT INTO ALUNOS VALUES(1,'CLARA');
INSERT INTO ALUNOS VALUES(4,'MAFRA');
INSERT INTO ALUNOS VALUES(5,'JANAINA');
INSERT INTO ALUNOS VALUES(1,'JANAINA');
INSERT INTO ALUNOS VALUES(3,'MARCELO');
INSERT INTO ALUNOS VALUES(4,'GIOVANI');
INSERT INTO ALUNOS VALUES(5,'ANTONIO');
INSERT INTO ALUNOS VALUES(6,'ANA');
INSERT INTO ALUNOS VALUES(6,'VIVIANE'); 

SELECT * FROM ALUNOS ORDER BY NUMERO;
SELECT * FROM ALUNOS ORDER BY 1;

/* ORDENANDO POR MAIS DE UMA COLUNA */

SELECT * FROM ALUNOS ORDER BY NUMERO, NOME;
SELECT * FROM ALUNOS ORDER BY 1, 2;

/* SÓ PODE ORDENAR UTILIZANDO NUM COLUNAS QUE ESTÃO NO SELECT */

SELECT NOME FROM ALUNOS ORDER BY 1,2;
ERROR 1054 (42S22): Unknown column '2' in 'order clause'

SELECT NOME FROM ALUNOS ORDER BY NUMERO,NOME;

+---------+
| NOME    |
+---------+
| CLARA   |
| JANAINA |
| JOAO    |
| MARIA   |
| ANDRE   |
| ZOE     |
| CLARA   |
| MARCELO |
| GIOVANI |
| MAFRA   |
| ANTONIO |
| JANAINA |
| ANA     |
| VIVIANE |
+---------+

/* ASC OU DESC - PADRÃO É ASC */

SELECT NOME FROM ALUNOS ORDER BY NUMERO DESC ,NOME DESC;
SELECT NOME FROM ALUNOS ORDER BY NUMERO, NOME DESC;
/* NO CASO DE CIMA, NUMERO VAI ESTAR ASC */


/* ORDER COM JOIN - FUNCIONA NORMAL */

SELECT  C.NOME, 
		C.SEXO, 
		IFNULL(C.EMAIL,'CLIENTE SEM EMAIL') AS EMAIL, 
		T.TIPO, 
		T.NUMERO, 
		E.BAIRRO, 
		E.CIDADE, 
		E.ESTADO
FROM CLIENTE C 
INNER JOIN ENDERECO E ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T ON C.IDCLIENTE = T.ID_CLIENTE
ORDER BY 1;

/* FUNCIONA COM VIEW NORMAL */

/* DELIMITADOR - FINAL DAS QUERIES - PADRAO ; */

DELIMITER $
DELIMITER ;

/* STORED PROCEDURES - PROCEDIMENTOS ARMAZENADOS */

/*
BLOCO ANONIMO
BLOCO NOMEADO - ARMAZENADO NO BANCO
*/

DELIMITER $

CREATE PROCEDURE NOME()
BEGIN 

	QUALQUER PROGRAMAÇÃO;

END
$

CREATE PROCEDURE NOME_EMPRESA()
BEGIN

	SELECT 'NOME DA EMPRESA' AS EMPRESA;

END 
$

/* CHAMANDO PROCEDURE - NOME - NOMEADO */

CALL NOME_EMPRESA()$

DELIMITER ;
CALL NOME_EMPRESA();

/* PROCEDURES COM PARAMETROS */

SELECT 10 + 10 AS CONTA;

DELIMITER $

CREATE PROCEDURE CONTA()
BEGIN 

	SELECT 10 + 10 AS CONTA;

END
$

CALL CONTA()$

DROP PROCEDURE CONTA$

/* PROCEDURES COM PARAMETROS */

CREATE PROCEDURE CONTA(NUMERO1 INT, NUMERO2 INT)
BEGIN 

	SELECT NUMERO1 + NUMERO2 AS CONTA;

END
$


mysql> CALL CONTA(100,50)$
+-------+
| CONTA |
+-------+
|   150 |
+-------+


/* CRIANDO PROCEDURES */

CREATE TABLE CURSOS(
	IDCURSO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	HORAS INT(3) NOT NULL,
	VALOR FLOAT(10,2) NOT NULL
);

INSERT INTO CURSOS VALUES(NULL,'JAVA',30,500.00);
INSERT INTO CURSOS VALUES(NULL,'FUNDAMENTOS DE BANCOS DE DADOS',40,700.00);

SELECT * FROM CURSOS;

DELIMITER #

CREATE PROCEDURE CAD_CURSO(P_NOME VARCHAR(30),
						   P_HORAS INT(30),
						   P_PRECO FLOAT(10,2))
BEGIN

	INSERT INTO CURSOS VALUES(NULL,P_NOME,P_HORAS,P_PRECO);

END 
#

DELIMITER ;

CALL CAD_CURSO('BI SQL SERVER', 35, 3000.00);
CALL CAD_CURSO('POWER BI', 20, 1000.00);
CALL CAD_CURSO('TABLEAU', 30, 1200.00);

/* ENTRAR COM MAIS DADOS E CRIAR PROCEDURE PARA CONSULTAR
CURSOS */

CALL CAD_CURSO('PYTHON', 40, 2000.00);
CALL CAD_CURSO('JAVA', 20, 2000.00);
CALL CAD_CURSO('BI', 30, 1200.00);


DELIMITER #

CREATE PROCEDURE CONSULTA_CURSO(P_NOME_CURSO VARCHAR(30))
BEGIN
	
	SELECT NOME, HORAS, VALOR FROM CURSOS WHERE NOME = P_NOME_CURSO;

END 
#

DELIMITER ;

CALL CONSULTA_CURSO('PYTHON');

/* A29 FUNÇÕES DE AGREGAÇÃO NUMÉRICAS */

CREATE TABLE VENDEDORES(
	IDVENDEDOR INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	SEXO CHAR(1),
	JANEIRO FLOAT(10,2),
	FEVEREIRO FLOAT(10,2),
	MARCO FLOAT(10,2)
);

INSERT INTO VENDEDORES VALUES(NULL,'CARLOS','M',76234.78,88346.87,5756.90);
INSERT INTO VENDEDORES VALUES(NULL,'MARIA','F',5865.78,6768.87,4467.90);
INSERT INTO VENDEDORES VALUES(NULL,'ANTONIO','M',78769.78,6685.87,6664.90);
INSERT INTO VENDEDORES VALUES(NULL,'CLARA','F',5779.78,446886.87,8965.90);
INSERT INTO VENDEDORES VALUES(NULL,'ANDERSON','M',676545.78,77544.87,578665.90);
INSERT INTO VENDEDORES VALUES(NULL,'IVONE','F',57789.78,44774.87,68665.90);
INSERT INTO VENDEDORES VALUES(NULL,'JOAO','M',4785.78,66478.87,6887.90);
INSERT INTO VENDEDORES VALUES(NULL,'CELIA','F',89667.78,57654.87,5755.90);


+------------+----------+------+-----------+-----------+-----------+
| IDVENDEDOR | NOME     | SEXO | JANEIRO   | FEVEREIRO | MARCO     |
+------------+----------+------+-----------+-----------+-----------+
|          1 | CARLOS   | M    |  76234.78 |  88346.87 |   5756.90 |
|          2 | MARIA    | F    |   5865.78 |   6768.87 |   4467.90 |
|          3 | ANTONIO  | M    |  78769.78 |   6685.87 |   6664.90 |
|          4 | CLARA    | F    |   5779.78 | 446886.88 |   8965.90 |
|          5 | ANDERSON | M    | 676545.75 |  77544.87 | 578665.88 |
|          6 | IVONE    | F    |  57789.78 |  44774.87 |  68665.90 |
|          7 | JOAO     | M    |   4785.78 |  66478.87 |   6887.90 |
|          8 | CELIA    | F    |  89667.78 |  57654.87 |   5755.90 |
+------------+----------+------+-----------+-----------+-----------+


/* MAX TRAZ O VALOR MÁXIMO DE UMA COLUNA */

SELECT MAX(FEVEREIRO) AS MAIOR_FEV
FROM VENDEDORES;

+-----------+
| MAIOR_FEV |
+-----------+
| 446886.88 |
+-----------+

/* MIN TRAZ O VALOR MÁXIMO DE UMA COLUNA */

SELECT MIN(FEVEREIRO) AS MENOR_FEV
FROM VENDEDORES;

+-----------+
| MENOR_FEV |
+-----------+
|   6685.87 |
+-----------+

/* AVG TRAZ O VALOR MÉDIO DE UMA COLUNA */

SELECT AVG(FEVEREIRO) AS MEDIA_FEV
FROM VENDEDORES;

+--------------+
| MEDIA_FEV    |
+--------------+
| 99392.744873 |
+--------------+

/* VARIAS FUNÇÕES */

SELECT MAX(JANEIRO) AS MAX_JAN,
	   MIN(JANEIRO) AS MIN_JAN,
	   AVG(JANEIRO) AS MEDIA_JAN
FROM VENDEDORES;

+-----------+---------+---------------+
| MAX_JAN   | MIN_JAN | MEDIA_JAN     |
+-----------+---------+---------------+
| 676545.75 | 4785.78 | 124429.901794 |
+-----------+---------+---------------+

/* TRUNCATE */

SELECT MAX(JANEIRO) AS MAX_JAN,
	   MIN(JANEIRO) AS MIN_JAN,
	   TRUNCATE(AVG(JANEIRO), 2) AS MEDIA_JAN
FROM VENDEDORES;

+-----------+---------+-----------+
| MAX_JAN   | MIN_JAN | MEDIA_JAN |
+-----------+---------+-----------+
| 676545.75 | 4785.78 |  124429.9 |
+-----------+---------+-----------+


/* A30 - AGREGANDO COM SUM */

SELECT SUM(JANEIRO) AS TOTAL_JAN
FROM VENDEDORES;

+-----------+
| TOTAL_JAN |
+-----------+
| 995439.21 |
+-----------+

SELECT SUM(JANEIRO) AS TOTAL_JAN,
       SUM(FEVEREIRO) AS TOTAL_FEV,
       SUM(MARCO) AS TOTAL_MAR
FROM VENDEDORES;

+-----------+-----------+-----------+
| TOTAL_JAN | TOTAL_FEV | TOTAL_MAR |
+-----------+-----------+-----------+
| 995439.21 | 795141.96 | 685831.17 |
+-----------+-----------+-----------+

/* VENDAS POR SEXO */

SELECT SEXO, SUM(MARCO) AS TOTAL_MAR
FROM VENDEDORES
GROUP BY SEXO;

+------+-----------+
| SEXO | TOTAL_MAR |
+------+-----------+
| M    | 597975.57 |
| F    |  87855.60 |
+------+-----------+

/* UTILIZANDO SUBQUERIES */

/* VENDEDOR QUE MENOS VENDEU EM MARÇO E SEU NOME,
   MAIS VENDEU E MARÇO E QUEM VENDEU MAIS DO QUE A MÉDIA DE FEVEREIRO */

SELECT NOME,
	   MARCO
FROM VENDEDORES
WHERE MARCO = (SELECT MIN(MARCO)
			   FROM VENDEDORES);

+-------+---------+
| NOME  | MARCO   |
+-------+---------+
| MARIA | 4467.90 |
+-------+---------+

SELECT NOME,
	   MARCO
FROM VENDEDORES
WHERE MARCO = (SELECT MAX(MARCO)
			   FROM VENDEDORES);

+----------+-----------+
| NOME     | MARCO     |
+----------+-----------+
| ANDERSON | 578665.88 |
+----------+-----------+

SELECT NOME,
	   MARCO AS TOTAL_VENDAS
FROM VENDEDORES
WHERE MARCO > (SELECT AVG(MARCO)
			   FROM VENDEDORES)
ORDER BY TOTAL_VENDAS DESC;

+----------+--------------+
| NOME     | TOTAL_VENDAS |
+----------+--------------+
| ANDERSON |    578665.88 |
+----------+--------------+

SELECT NOME,
	   MARCO AS TOTAL_VENDAS
FROM VENDEDORES
WHERE MARCO < (SELECT AVG(MARCO)
			   FROM VENDEDORES)
ORDER BY TOTAL_VENDAS DESC;

+---------+--------------+
| NOME    | TOTAL_VENDAS |
+---------+--------------+
| IVONE   |     68665.90 |
| CLARA   |      8965.90 |
| JOAO    |      6887.90 |
| ANTONIO |      6664.90 |
| CARLOS  |      5756.90 |
| CELIA   |      5755.90 |
| MARIA   |      4467.90 |
+---------+--------------+


/* OPERAÇÕES EM LINHA */

SELECT * FROM VENDEDORES;

+------------+----------+------+-----------+-----------+-----------+
| IDVENDEDOR | NOME     | SEXO | JANEIRO   | FEVEREIRO | MARCO     |
+------------+----------+------+-----------+-----------+-----------+
|          1 | CARLOS   | M    |  76234.78 |  88346.87 |   5756.90 |
|          2 | MARIA    | F    |   5865.78 |   6768.87 |   4467.90 |
|          3 | ANTONIO  | M    |  78769.78 |   6685.87 |   6664.90 |
|          4 | CLARA    | F    |   5779.78 | 446886.88 |   8965.90 |
|          5 | ANDERSON | M    | 676545.75 |  77544.87 | 578665.88 |
|          6 | IVONE    | F    |  57789.78 |  44774.87 |  68665.90 |
|          7 | JOAO     | M    |   4785.78 |  66478.87 |   6887.90 |
|          8 | CELIA    | F    |  89667.78 |  57654.87 |   5755.90 |
+------------+----------+------+-----------+-----------+-----------+

/* TOTAL DE CADA VENDEDOR */

SELECT NOME, 
       JANEIRO,
       FEVEREIRO,
       MARCO,
       (JANEIRO + FEVEREIRO + MARCO) AS TOTAL
FROM VENDEDORES
ORDER BY TOTAL DESC;

+----------+-----------+-----------+-----------+------------+
| NOME     | JANEIRO   | FEVEREIRO | MARCO     | TOTAL      |
+----------+-----------+-----------+-----------+------------+
| ANDERSON | 676545.75 |  77544.87 | 578665.88 | 1332756.49 |
| CLARA    |   5779.78 | 446886.88 |   8965.90 |  461632.56 |
| IVONE    |  57789.78 |  44774.87 |  68665.90 |  171230.55 |
| CARLOS   |  76234.78 |  88346.87 |   5756.90 |  170338.55 |
| CELIA    |  89667.78 |  57654.87 |   5755.90 |  153078.55 |
| ANTONIO  |  78769.78 |   6685.87 |   6664.90 |   92120.55 |
| JOAO     |   4785.78 |  66478.87 |   6887.90 |   78152.55 |
| MARIA    |   5865.78 |   6768.87 |   4467.90 |   17102.55 |
+----------+-----------+-----------+-----------+------------+

SELECT NOME, 
       JANEIRO,
       FEVEREIRO,
       MARCO,
       (JANEIRO + FEVEREIRO + MARCO) AS TOTAL,
       TRUNCATE((JANEIRO + FEVEREIRO + MARCO)/3,2) AS TOTAL
FROM VENDEDORES
ORDER BY TOTAL DESC;

+----------+-----------+-----------+-----------+------------+-----------+
| NOME     | JANEIRO   | FEVEREIRO | MARCO     | TOTAL      | TOTAL     |
+----------+-----------+-----------+-----------+------------+-----------+
| ANDERSON | 676545.75 |  77544.87 | 578665.88 | 1332756.49 | 444252.16 |
| CLARA    |   5779.78 | 446886.88 |   8965.90 |  461632.56 | 153877.51 |
| IVONE    |  57789.78 |  44774.87 |  68665.90 |  171230.55 |  57076.85 |
| CARLOS   |  76234.78 |  88346.87 |   5756.90 |  170338.55 |  56779.51 |
| CELIA    |  89667.78 |  57654.87 |   5755.90 |  153078.55 |  51026.18 |
| ANTONIO  |  78769.78 |   6685.87 |   6664.90 |   92120.55 |  30706.85 |
| JOAO     |   4785.78 |  66478.87 |   6887.90 |   78152.55 |  26050.84 |
| MARIA    |   5865.78 |   6768.87 |   4467.90 |   17102.55 |   5700.84 |
+----------+-----------+-----------+-----------+------------+-----------+



/* VERIFICANDO E ALTERANDO A ESTRUTURA DE UMA TAB */

CREATE TABLE TABELA(
	COLUNA1 VARCHAR(30),
	COLUNA2 VARCHAR(30),
	COLUNA3 VARCHAR(30)
);

CREATE TABLE TABELA(
	COLUNA1 INT PRIMARY KEY AUTO_INCREMENT
);

/* ADICIONANDO PK */

ALTER TABLE TABELA
ADD PRIMARY KEY(COLUNA1);

DESC TABELA;

--ADICIONANDO COLUNA SEM POSICAO. ULTIMA POSICAO
ALTER TABLE TABELA 
ADD COLUNA varchar(30);

ALTER TABLE TABELA 
ADD COLUNA100 INT;

--ADICIONANDO UMA COLUNA COM POSICAO
ALTER TABLE TABELA 
ADD COLUMN COLUNA4 VARCHAR(30) NOT NULL UNIQUE
AFTER COLUNA3;

--MODIFICANDO O TIPO DE UM CAMPO
ALTER TABLE TABELA
 MODIFY COLUNA2 DATE NOT NULL;

--RENOMEANDO O NOME DA TABELA
ALTER TABLE TABELA 
RENAME PESSOA;

CREATE TABLE TIME(
	IDTIME INT PRIMARY KEY AUTO_INCREMENT,
	TIME VARCHAR(30),
	ID_PESSOA VARCHAR(30)
);

--Foreign key
ALTER TABLE TIME 
ADD FOREIGN KEY(ID_PESSOA)
REFERENCES PESSOA(COLUNA1);

/* VERIFICANDO AS CHAVES DE UMA TABELA */

SHOW CREATE TABLE TIME;

/* A34 - ORGANIZACAO DE CHAVES - CONSTRAINT (REGRA) */

/* CHAVE É REGRA DE INTEGRIDADE REFERENCIAL */

/* BANCO NÃO PERMITE REFERÊNCIA QUE NÃO EXISTE NA PK */

CREATE TABLE JOGADOR(
	IDJOGADOR INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30)
);

CREATE TABLE TIMES(
	IDTIME INT PRIMARY KEY AUTO_INCREMENT,
	NOMETIME VARCHAR(30),
	ID_JOGADOR INT,
	FOREIGN KEY(ID_JOGADOR)
	REFERENCES JOGADOR(IDJOGADOR)
);

INSERT INTO JOGADOR VALUES(NULL,'GUERRERO');
INSERT INTO TIMES VALUES(NULL,'FLAMENGO',1);

SELECT * FROM JOGADOR J INNER JOIN TIMES T ON J.IDJOGADOR = T.ID_JOGADOR;

+-----------+----------+--------+----------+------------+
| IDJOGADOR | NOME     | IDTIME | NOMETIME | ID_JOGADOR |
+-----------+----------+--------+----------+------------+
|         1 | GUERRERO |      1 | FLAMENGO |          1 |
+-----------+----------+--------+----------+------------+

SHOW CREATE TABLE JOGADOR;
SHOW CREATE TABLE TIME;

| TIME  | CREATE TABLE `time` (
  `IDTIME` int NOT NULL AUTO_INCREMENT,
  `TIME` varchar(30) DEFAULT NULL,
  `ID_PESSOA` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`IDTIME`),
  KEY `ID_PESSOA` (`ID_PESSOA`),
  CONSTRAINT `time_ibfk_1` FOREIGN KEY (`ID_PESSOA`) REFERENCES `pessoa` (`COLUNA1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |

/* QUANDO CRIA UMA CONSTRAINT DENTRO DA TABELA O BANCO DÁ UM
NOME AUTOMATICO = CONSTRAINT `time_ibfk_1`

PRATICA:

PRIMEIRO CRIA A TABELA, DEPOIS AS CHAVES = CONSTRAINTS
POR FORA DA TABELA PARA ATRIBUIR NOME ÀS CONSTRAINTS

*/

/* A35 - ORGANIZANDO CHAVES */

USE COMERCIO;

SHOW TABLES;

DROP TABLE ENDERECO;
DROP TABLE TELEFONE;
DROP TABLE CLIENTE;

CREATE TABLE CLIENTE(
	IDCLIENTE INT,
	NOME VARCHAR(30) NOT NULL
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT,
	TIPO CHAR(3) NOT NULL,
	NUMERO VARCHAR(10) NOT NULL,
	ID_CLIENTE INT 
);

ALTER TABLE CLIENTE ADD CONSTRAINT PK_CLIENTE
PRIMARY KEY(IDCLIENTE);

ALTER TABLE TELEFONE ADD CONSTRAINT FK_CLIENTE_TELEFONE
FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE);

SHOW CREATE TABLE TELEFONE;

CONSTRAINT `FK_CLIENTE_TELEFONE` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `cliente` (`IDCLIENTE`)

/* DICIONARIO DE DADOS */

SHOW DATABASES;

+--------------------+
| Database           |
+--------------------+
| comercio           |
| exercicio          |
| information_schema | dicionario
| livraria           |
| mysql              | dicionario
| performance_schema | dicionario
| projeto            |
| sakila             |
| sys                |
| world              |
+--------------------+

USE information_schema;

SHOW TABLES;

DESC TABLE_CONSTRAINTS;

SELECT CONSTRAINT_SCHEMA AS 'BANCO',
	   TABLE_NAME AS 'TABELA',
	   CONSTRAINT_NAME AS 'NOME REGRA',
	   CONSTRAINT_TYPE AS 'TIPO'
FROM TABLE_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA = 'comercio';

+----------+----------+---------------------+-------------+
| BANCO    | TABELA   | NOME REGRA          | TIPO        |
+----------+----------+---------------------+-------------+
| comercio | cliente  | PRIMARY             | PRIMARY KEY |
| comercio | produto  | PRIMARY             | PRIMARY KEY |
| comercio | telefone | FK_CLIENTE_TELEFONE | FOREIGN KEY |
+----------+----------+---------------------+-------------+


/* APAGANDO CONSTRAINTS */

ALTER TABLE TELEFONE 
DROP FOREIGN KEY FK_CLIENTE_TELEFONE;

ERROR 1044 (42000): Access denied for user 'root'@'localhost' to database 'information_schema'
/* ERRO POIS NAO ESTA NO BANCO CORRETO */

USE COMERCIO;

ALTER TABLE TELEFONE 
DROP FOREIGN KEY FK_CLIENTE_TELEFONE;


/* EXERCICIO LOJA SR JOSE */

CREATE DATABASE OFICINA;

USE OFICINA;

STATUS


/* CRIANDO TABELAS */

CREATE TABLE CLIENTE(
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	SEXO ENUM('M','F') NOT NULL,
	ID_CARRO INT UNIQUE
);

CREATE TABLE CARRO(
	IDCARRO INT PRIMARY KEY AUTO_INCREMENT,
	MODELO VARCHAR(30) NOT NULL,
	PLACA VARCHAR(30) NOT NULL,
	ID_MARCA INT
);


CREATE TABLE COR(
	IDCOR INT PRIMARY KEY AUTO_INCREMENT,
	COR VARCHAR(30) UNIQUE
);

CREATE TABLE CARRO_COR(
	ID_CARRO INT,
	ID_COR INT,
	PRIMARY KEY(ID_CARRO,ID_COR)
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
	TIPO ENUM('RES','CEL','COM') NOT NULL,
	NUMERO VARCHAR(30) NOT NULL,
	ID_CLIENTE INT
);

CREATE TABLE MARCA(
	IDMARCA INT PRIMARY KEY AUTO_INCREMENT,
	MARCA VARCHAR(30) UNIQUE
);

/* CRIAND CONSTRAINTS */

ALTER TABLE TELEFONE 
ADD CONSTRAINT FK_TELEFONE_CLIENTES
FOREIGN KEY(ID_CLIENTE)
REFERENCES CLIENTE(IDCLIENTE);

ALTER TABLE CLIENTE
ADD CONSTRAINT FK_CLIENTE_CARRO
FOREIGN KEY(ID_CARRO)
REFERENCES CARRO(IDCARRO);

ALTER TABLE CARRO
ADD CONSTRAINT FK_CARRO_MARCA
FOREIGN KEY(ID_MARCA)
REFERENCES MARCA(IDMARCA);

ALTER TABLE CARRO_COR
ADD CONSTRAINT FK_COR
FOREIGN KEY(ID_COR)
REFERENCES COR(IDCOR);

ALTER TABLE CARRO_COR
ADD CONSTRAINT FK_CARRO
FOREIGN KEY(ID_CARRO)
REFERENCES CARRO(IDCARRO);

/* FAZER INSERT COM NO MÍNIMO 10 CLIENTES */
/* COMEÇA COM CARRO QUE É A MAIS FORTE */




/* TRIGGERS */


DELIMITER $$
CREATE TRIGGER NOME 
BEFORE/AFTER INSERT/DELETE/UPDATE ON TABELA 
FOR EACH ROW
BEGIN
	QUALQUER COMANDO SQL;
END  
$$
DELIMITER;

USE INFORMATION_SCHEMA;
DESC TRIGGERS;


CREATE DATABASE AULA40;

USE AULA40;

/* CRIANDO A TABELA 'USUARIO' */

CREATE TABLE USUARIO(
	IDUSUARIO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	LOGIN VARCHAR(30),
	SENHA VARCHAR(100)
);

/* CRIANDO A TABELA DE BACKUP */

CREATE TABLE BKP_USUARIO(
	IDBACKUP INT PRIMARY KEY AUTO_INCREMENT,
	IDUSUARIO INT,
	NOME VARCHAR(30),
	LOGIN VARCHAR(30)
); 

/* CRIANDO A TRIGGER DE BACKUP */

DELIMITER $$
CREATE TRIGGER BACKUP_USER 
BEFORE DELETE ON USUARIO 
FOR EACH ROW
BEGIN
	
	INSERT INTO BKP_USUARIO VALUES(NULL, OLD.IDUSUARIO, OLD.NOME, OLD.LOGIN);

END  
$$
DELIMITER;


INSERT INTO USUARIO VALUES(NULL, 'ANDRADE', 'ANDRADE2019','123456789');
DELETE FROM USUARIO WHERE IDUSUARIO = 1;








/* AULA 41 - COMUNICAÇÃO ENTRE BANCOS */

CREATE DATABASE LOJA;

USE LOJA;

CREATE TABLE PRODUTO(
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	VALOR FLOAT(10,2)
);

STATUS

CREATE DATABASE BACKUP;

USE BACKUP;

STATUS

CREATE TABLE BKP_PRODUTO(
	IDBKP INT PRIMARY KEY AUTO_INCREMENT,
	IDPRODUTO INT,
	NOME VARCHAR(30),
	VALOR FLOAT(10,2)
);

USE LOJA;

STATUS

/* TESTAR A COMUNICAÇÃO ENTRE OS DOIS BANCOS 
NOMEBANCO.NOMETABELA 
NAO PRECISA ALTERAR O BANCO UTILIZADO, POIS ESTARÁ 
FALANDO O NOME DO DB */


INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL,1000,'TESTE',0.0);

SELECT * FROM BACKUP.BKP_PRODUTO;

DELIMITER $$

CREATE TRIGGER BACKUP_PRODUTO 
BEFORE INSERT ON PRODUTO  
FOR EACH ROW 
BEGIN 
	
	INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL,NEW.IDPRODUTO,NEW.NOME,NEW.VALOR);

END
$$
DELIMITER ;

INSERT INTO PRODUTO VALUES(NULL,'LIVRO MODELAGEM',50.00);
INSERT INTO PRODUTO VALUES(NULL,'LIVRO ORACLE',50.00);
INSERT INTO PRODUTO VALUES(NULL,'LIVRO MYSQL',50.00);
INSERT INTO PRODUTO VALUES(NULL,'LIVRO SQL SERVER',50.00); 


SELECT * FROM BACKUP.BKP_PRODUTO;

+-------+-----------+------------------+-------+
| IDBKP | IDPRODUTO | NOME             | VALOR |
+-------+-----------+------------------+-------+
|     1 |      1000 | TESTE            |  0.00 |
|     2 |         0 | LIVRO MODELAGEM  | 50.00 |
|     3 |         0 | LIVRO ORACLE     | 50.00 |
|     4 |         0 | LIVRO MYSQL      | 50.00 |
|     5 |         0 | LIVRO SQL SERVER | 50.00 |
+-------+-----------+------------------+-------+

/* COMOM INSERIU O VALOR NEW, AINDA NÃO TINHA VALORES DO AUTO INCREMENT */

DROP TRIGGER BACKUP_PRODUTO;

DELIMITER $$

CREATE TRIGGER BACKUP_PRODUTO 
AFTER INSERT ON PRODUTO  
FOR EACH ROW 
BEGIN 
	
	INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL,NEW.IDPRODUTO,NEW.NOME,NEW.VALOR);

END
$$
DELIMITER ;

INSERT INTO PRODUTO VALUES(NULL,'LIVRO PYTHON',100.00);
INSERT INTO PRODUTO VALUES(NULL,'LIVRO JAVA',100.00);
INSERT INTO PRODUTO VALUES(NULL,'LIVRO PROJETOS',100.00);
INSERT INTO PRODUTO VALUES(NULL,'LIVRO PMO',50.100); 

SELECT * FROM BACKUP.BKP_PRODUTO;

+-------+-----------+------------------+--------+
| IDBKP | IDPRODUTO | NOME             | VALOR  |
+-------+-----------+------------------+--------+
|     1 |      1000 | TESTE            |   0.00 |
|     2 |         0 | LIVRO MODELAGEM  |  50.00 |
|     3 |         0 | LIVRO ORACLE     |  50.00 |
|     4 |         0 | LIVRO MYSQL      |  50.00 |
|     5 |         0 | LIVRO SQL SERVER |  50.00 |
|     6 |         5 | LIVRO PYTHON     | 100.00 |
|     7 |         6 | LIVRO JAVA       | 100.00 |
|     8 |         7 | LIVRO PROJETOS   | 100.00 |
|     9 |         8 | LIVRO PMO        |  50.10 |
+-------+-----------+------------------+--------+

ALTER TABLE BACKUP.BKP_PRODUTO
ADD EVENTO CHAR(1);

SELECT * FROM BACKUP.BKP_PRODUTO;

DELIMITER $$

CREATE TRIGGER BACKUP_PRODUTO_DEL
BEFORE DELETE ON PRODUTO  
FOR EACH ROW 
BEGIN 
	
	INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL,OLD.IDPRODUTO,OLD.NOME,
										  OLD.VALOR, 'D');

END
$$
DELIMITER ;

DELETE FROM PRODUTO WHERE IDPRODUTO = 4;

SELECT * FROM BACKUP.BKP_PRODUTO;

+-------+-----------+------------------+--------+--------+
| IDBKP | IDPRODUTO | NOME             | VALOR  | EVENTO |
+-------+-----------+------------------+--------+--------+
|     1 |      1000 | TESTE            |   0.00 | NULL   |
|     2 |         0 | LIVRO MODELAGEM  |  50.00 | NULL   |
|     3 |         0 | LIVRO ORACLE     |  50.00 | NULL   |
|     4 |         0 | LIVRO MYSQL      |  50.00 | NULL   |
|     5 |         0 | LIVRO SQL SERVER |  50.00 | NULL   |
|     6 |         5 | LIVRO PYTHON     | 100.00 | NULL   |
|     7 |         6 | LIVRO JAVA       | 100.00 | NULL   |
|     8 |         7 | LIVRO PROJETOS   | 100.00 | NULL   |
|     9 |         8 | LIVRO PMO        |  50.10 | NULL   |
|    10 |         4 | LIVRO SQL SERVER |  50.00 | D      |
+-------+-----------+------------------+--------+--------+

/* TRIGGER DE AUDITORIA */

DROP DATABASE LOJA;
DROP DATABASE BACKUP;

CREATE DATABASE LOJA;

USE LOJA;

CREATE TABLE PRODUTO(
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	VALOR FLOAT(10,2)
);

INSERT INTO PRODUTO VALUES(NULL, 'LIVRO MODELAGEM', 50.00);
INSERT INTO PRODUTO VALUES(NULL, 'LIVRO SQL', 90.00);
INSERT INTO PRODUTO VALUES(NULL, 'LIVRO ORACLE', 67.00);
INSERT INTO PRODUTO VALUES(NULL, 'LIVRO MYSQL', 35.00);

CREATE DATABASE BACKUP;

USE BACKUP;

/* QUANDO E QUEM FEZ A ALTERAÇÃO */

SELECT NOW();
SELECT CURRENT_USER();

CREATE TABLE BKP_PRODUTO(
	IDBACKUP INT PRIMARY KEY AUTO_INCREMENT,
	IDPRODUTO INT,
	NOME VARCHAR(30),
	VALOR FLOAT(10,2),
	VALOR_ALTERADO FLOAT(10,2),
	DATA DATETIME,
	USUARIO VARCHAR(30),
	EVENTO CHAR(1)
);

mysql> DESC BKP_PRODUTO;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDBACKUP       | int         | NO   | PRI | NULL    | auto_increment |
| IDPRODUTO      | int         | YES  |     | NULL    |                |
| NOME           | varchar(30) | YES  |     | NULL    |                |
| VALOR          | float(10,2) | YES  |     | NULL    |                |
| VALOR_ALTERADO | float(10,2) | YES  |     | NULL    |                |
| DATA           | datetime    | YES  |     | NULL    |                |
| USUARIO        | varchar(30) | YES  |     | NULL    |                |
| EVENTO         | char(1)     | YES  |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

mysql> SELECT * FROM LOJA.PRODUTO;
+-----------+-----------------+-------+
| IDPRODUTO | NOME            | VALOR |
+-----------+-----------------+-------+
|         1 | LIVRO MODELAGEM | 50.00 |
|         2 | LIVRO SQL       | 90.00 |
|         3 | LIVRO ORACLE    | 67.00 |
|         4 | LIVRO MYSQL     | 35.00 |
+-----------+-----------------+-------+

USE LOJA;

/* CRIANDO TRIGGERS */

DELIMITER $$
CREATE TRIGGER AUDIT_PROD
AFTER UPDATE ON PRODUTO 
FOR EACH ROW 
BEGIN
	
	INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL,OLD.IDPRODUTO,OLD.NOME,
		                                     OLD.VALOR, NEW.VALOR, NOW(),
		                                     CURRENT_USER(), 'U');

END 
$$

DELIMITER ;

UPDATE PRODUTO SET VALOR = 110.00 
WHERE IDPRODUTO = 4;

mysql> SELECT * FROM PRODUTO;
+-----------+-----------------+--------+
| IDPRODUTO | NOME            | VALOR  |
+-----------+-----------------+--------+
|         1 | LIVRO MODELAGEM |  50.00 |
|         2 | LIVRO SQL       |  90.00 |
|         3 | LIVRO ORACLE    |  67.00 |
|         4 | LIVRO MYSQL     | 110.00 |
+-----------+-----------------+--------+

mysql> SELECT * FROM BACKUP.BKP_PRODUTO;
+----------+-----------+-------------+-------+----------------+---------------------+----------------+--------+
| IDBACKUP | IDPRODUTO | NOME        | VALOR | VALOR_ALTERADO | DATA                | USUARIO        | EVENTO |
+----------+-----------+-------------+-------+----------------+---------------------+----------------+--------+
|        1 |         4 | LIVRO MYSQL | 35.00 |         110.00 | 2022-01-29 13:06:54 | root@localhost | U      |
+----------+-----------+-------------+-------+----------------+---------------------+----------------+--------+


/* AUTORELACIONAMENTO */

CREATE DATABASE AULA44;

USE AULA44;

CREATE TABLE CURSOS(
	IDCURSO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	HORAS INT,
	VALOR FLOAT(10,2),
	ID_PREREQ INT
);

/* ALTERANDO TABELA E INCLUIDO FK - CHAVE ESTRANGEIRA */

ALTER TABLE CURSOS ADD CONSTRAINT FK_PREREQ
FOREIGN KEY(ID_PREREQ) REFERENCES CURSOS(IDCURSO);

INSERT INTO CURSOS VALUES(NULL, 'BD RELACIONAL', 20, 400.00, NULL);
INSERT INTO CURSOS VALUES(NULL, 'BUSINESS INTELIGENCE', 40, 800.00, 1);
INSERT INTO CURSOS VALUES(NULL, 'RELATORIOS AVANCADOS', 20, 600.00, 2);
INSERT INTO CURSOS VALUES(NULL, 'LOGICA DE PROGRAMACAO', 20, 200.00, NULL);
INSERT INTO CURSOS VALUES(NULL, 'RUBY', 30, 500.00, 4);

mysql> SELECT * FROM CURSOS;
+---------+-----------------------+-------+--------+-----------+
| IDCURSO | NOME                  | HORAS | VALOR  | ID_PREREQ |
+---------+-----------------------+-------+--------+-----------+
|       1 | BD RELACIONAL         |    20 | 400.00 |      NULL |
|       2 | BUSINESS INTELIGENCE  |    40 | 800.00 |         1 |
|       3 | RELATORIOS AVANCADOS  |    20 | 600.00 |         2 |
|       4 | LOGICA DE PROGRAMACAO |    20 | 200.00 |      NULL |
|       5 | RUBY                  |    30 | 500.00 |         4 |
+---------+-----------------------+-------+--------+-----------+

mysql> DESC CURSOS;
+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| IDCURSO   | int         | NO   | PRI | NULL    | auto_increment |
| NOME      | varchar(30) | YES  |     | NULL    |                |
| HORAS     | int         | YES  |     | NULL    |                |
| VALOR     | float(10,2) | YES  |     | NULL    |                |
| ID_PREREQ | int         | YES  | MUL | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+

mysql> SELECT NOME, VALOR, HORAS, IFNULL(ID_PREREQ,"SEM REQ") AS REQUISITOS 
FROM CURSOS;
+-----------------------+--------+-------+------------+
| NOME                  | VALOR  | HORAS | REQUISITOS |
+-----------------------+--------+-------+------------+
| BD RELACIONAL         | 400.00 |    20 | SEM REQ    |
| BUSINESS INTELIGENCE  | 800.00 |    40 | 1          |
| RELATORIOS AVANCADOS  | 600.00 |    20 | 2          |
| LOGICA DE PROGRAMACAO | 200.00 |    20 | SEM REQ    |
| RUBY                  | 500.00 |    30 | 4          |
+-----------------------+--------+-------+------------+

/* NOME DO CURSO, VALOR, HORAS, NOME DO PRE REQ */

SELECT C.NOME, C.VALOR, C.HORAS, IFNULL(N.NOME,"SEM REQUISITOS") REQUISITOS
FROM CURSOS C
LEFT JOIN CURSOS N ON C.IDCURSO = N.ID_PREREQ;

+-----------------------+--------+-------+----------------------+
| NOME                  | VALOR  | HORAS | REQUISITOS           |
+-----------------------+--------+-------+----------------------+
| BD RELACIONAL         | 400.00 |    20 | BUSINESS INTELIGENCE |
| BUSINESS INTELIGENCE  | 800.00 |    40 | RELATORIOS AVANCADOS |
| RELATORIOS AVANCADOS  | 600.00 |    20 | SEM REQUISITOS       |
| LOGICA DE PROGRAMACAO | 200.00 |    20 | RUBY                 |
| RUBY                  | 500.00 |    30 | SEM REQUISITOS       |
+-----------------------+--------+-------+----------------------+


/* CURSORES */

CREATE DATABASE CURSORES;

USE CURSORES;

CREATE TABLE VENDEDORES(
	IDVENDEDOR INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(50),
	JAN INT,
	FEV INT,
	MAR INT  
);

INSERT INTO VENDEDORES VALUES(NULL,'MAFRA',32432,24334,354545);
INSERT INTO VENDEDORES VALUES(NULL,'CLARA',23235,987580,2637362);
INSERT INTO VENDEDORES VALUES(NULL,'JOAO',237283,119292,324832);
INSERT INTO VENDEDORES VALUES(NULL,'LILIAN',123829,23213,454554);
INSERT INTO VENDEDORES VALUES(NULL,'ANTONIO',283734,99119,1092039);
INSERT INTO VENDEDORES VALUES(NULL,'GLORIA',12455,123774,1923783);

mysql> SELECT * FROM VENDEDORES;
+------------+---------+--------+--------+---------+
| IDVENDEDOR | NOME    | JAN    | FEV    | MAR     |
+------------+---------+--------+--------+---------+
|          1 | MAFRA   |  32432 |  24334 |  354545 |
|          2 | CLARA   |  23235 | 987580 | 2637362 |
|          3 | JOAO    | 237283 | 119292 |  324832 |
|          4 | LILIAN  | 123829 |  23213 |  454554 |
|          5 | ANTONIO | 283734 |  99119 | 1092039 |
|          6 | GLORIA  |  12455 | 123774 | 1923783 |
+------------+---------+--------+--------+---------+

mysql> SELECT NOME, (JAN+FEV+MAR) AS TOTAL FROM VENDEDORES;
+---------+---------+
| NOME    | TOTAL   |
+---------+---------+
| MAFRA   |  411311 |
| CLARA   | 3648177 |
| JOAO    |  681407 |
| LILIAN  |  601596 |
| ANTONIO | 1474892 |
| GLORIA  | 2060012 |
+---------+---------+

mysql> SELECT NOME, (JAN+FEV+MAR) AS TOTAL, (JAN+FEV+MAR) AS MEDIA 
FROM VENDEDORES;
+---------+---------+---------+
| NOME    | TOTAL   | MEDIA   |
+---------+---------+---------+
| MAFRA   |  411311 |  411311 |
| CLARA   | 3648177 | 3648177 |
| JOAO    |  681407 |  681407 |
| LILIAN  |  601596 |  601596 |
| ANTONIO | 1474892 | 1474892 |
| GLORIA  | 2060012 | 2060012 |
+---------+---------+---------+


CREATE TABLE VEND_TOTAL(
	NOME VARCHAR(50),
	JAN INT,
	FEV INT,
	MAR INT,
	TOTAL INT,
	MEDIA INT
);

DELIMITER $$

CREATE PROCEDURE INSEREDADOS()
BEGIN


	/* PARTE VARIAVEL */
	DECLARE FIM INT DEFAULT 0;
	DECLARE VAR1 VAR2, VAR3, VTOTAL, VMEDIA INT;
	DECLARE VNOME VARCHAR(50);

	DECLARE REG CURSOR FOR(
		SELECT NOME, JAN, FEV, MAR FROM VENDEDORES
	);

	/* ESSA PARTE É PADRÃO: */
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET FIM = 1; 
	/* PADRÃO: VAR MANIPUL CONTINUA QUANDO NAO TEM MAIS ELEMENTOS, QUANDO NAO ACHA 
	MAIS NADA, COLOCA FIM = 1 E O LOOP FINALIZA */

	OPEN REG; /* PEGA O RESULT DA QUERY, QUE ESTA NA VAR REG, E JOGA NA MEM RAM
	TODOS OS DADOS FICAM EM MEMÓRIA - FICA NA MEMÓRIA RAM*/

	REPEAT /* INICIA O LOOP */

		FETCH REG INTO VNOME, VAR1, VAR2, VAR3;
		/* TRAGA O PRÓXIMO REGISTRO, DEPOIS VAI PARA O PRÓXIMO E ASSIM POR DIANTE
		ESTÁ DENTRO DO REPEAT(LOOP)*/
		/* VARIAVEIS NA ORDEM DO SELECT DENTRO DO DECLARE */
		IF NOT FIM THEN 

			SET VTOTAL = VAR1 + VAR2 + VAR3;
			/* ATRIBUI VALORES */
			SET VMEDIA = VTOTAL / 3;

			INSERT INTO VEND_TOTAL VALUES(VNOME,VAR1,VAR2,VAR3,VTOTAL,VMEDIA);
		END IF;
		/* FECHA IF */

	UNTIL FIM END REPEAT;
	/* ENCERRA O REPEAT */
	CLOSE REG;
	/* FINALIZA O USO DA RAM */

END
$$

DELIMITER ;

/* VERSÃO SEM COMENTARIOS */

CREATE PROCEDURE INSEREDADOS()
BEGIN

	DECLARE FIM INT DEFAULT 0;
	DECLARE VAR1, VAR2, VAR3, VTOTAL, VMEDIA INT;
	DECLARE VNOME VARCHAR(50);

	DECLARE REG CURSOR FOR(
		SELECT NOME, JAN, FEV, MAR FROM VENDEDORES
	);

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET FIM = 1;

	OPEN REG;

	REPEAT 

		FETCH REG INTO VNOME, VAR1, VAR2, VAR3;
		IF NOT FIM THEN 

			SET VTOTAL = VAR1 + VAR2 + VAR3;
			SET VMEDIA = VTOTAL / 3;

			INSERT INTO VEND_TOTAL VALUES(VNOME,VAR1,VAR2,VAR3,VTOTAL,VMEDIA);
		END IF;

	UNTIL FIM END REPEAT;

	CLOSE REG;

END
$$

DELIMITER ;

mysql> SELECT * FROM VENDEDORES;
+------------+---------+--------+--------+---------+
| IDVENDEDOR | NOME    | JAN    | FEV    | MAR     |
+------------+---------+--------+--------+---------+
|          1 | MAFRA   |  32432 |  24334 |  354545 |
|          2 | CLARA   |  23235 | 987580 | 2637362 |
|          3 | JOAO    | 237283 | 119292 |  324832 |
|          4 | LILIAN  | 123829 |  23213 |  454554 |
|          5 | ANTONIO | 283734 |  99119 | 1092039 |
|          6 | GLORIA  |  12455 | 123774 | 1923783 |
+------------+---------+--------+--------+---------+


mysql> SELECT * FROM VEND_TOTAL;
Empty set (0.00 sec)

CALL INSEREDADOS();

mysql> SELECT * FROM VEND_TOTAL;
+---------+--------+--------+---------+---------+---------+
| NOME    | JAN    | FEV    | MAR     | TOTAL   | MEDIA   |
+---------+--------+--------+---------+---------+---------+
| MAFRA   |  32432 |  24334 |  354545 |  411311 |  137104 |
| CLARA   |  23235 | 987580 | 2637362 | 3648177 | 1216059 |
| JOAO    | 237283 | 119292 |  324832 |  681407 |  227136 |
| LILIAN  | 123829 |  23213 |  454554 |  601596 |  200532 |
| ANTONIO | 283734 |  99119 | 1092039 | 1474892 |  491631 |
| GLORIA  |  12455 | 123774 | 1923783 | 2060012 |  686671 |
+---------+--------+--------+---------+---------+---------+


/* A47 SEGUNDA E TERCEIRAS FORMAS NORMAIS */

/*
	 PRIMEIRA FN
	 
	 ATOMICIDADE - UM CAMPO NAO PODE SER DIVISIVEL
	 UM CAMPO NAO PODE SER VETORIZADO
	 PK CHAVE PRIMARIA

*/

CREATE DATABASE CONSULTORIO;

USE CONSULTORIO;

CREATE TABLE PACIENTE(
	IDPACIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	SEXO CHAR(1),
	EMAIL VARCHAR(30),
	NASCIMENTO DATE
);

CREATE TABLE MEDICO(
	IDMEDICO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	SEXO CHAR(1),
	ESPECIALIDADE VARCHAR(30),
	FUNCIONARIO ENUM('S','N')
);

CREATE TABLE HOSPITAL(
	IDHOSPITAL INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	BAIRRO VARCHAR(30),
	CIDADE VARCHAR(30),
	ESTADO CHAR(2)
);

CREATE TABLE CONSULTA(
	IDCONSULTA INT PRIMARY KEY AUTO_INCREMENT,
	ID_PACIENTE INT,
	ID_MEDICO INT,
	ID_HOSPITAL INT,
	DATA DATETIME,
	DIAGNOSTICO VARCHAR(50)
);

CREATE TABLE INTERNACAO(
	IDINTERNACAO INT PRIMARY KEY AUTO_INCREMENT,
	ENTRADA DATETIME,
	QUARTO INT,
	SAIDA DATETIME,
	OBSERVACOES VARCHAR(50),
	ID_CONSULTA INT UNIQUE	
);  

mysql> SHOW TABLES;
+-----------------------+
| Tables_in_consultorio |
+-----------------------+
| consulta              |
| hospital              |
| internacao            |
| paciente              |
+-----------------------+

/* CRIANDO AS CONSTRAINTS */

ALTER TABLE CONSULTA ADD CONSTRAINT FK_CONSULTA_PACIENTE
FOREIGN KEY (ID_PACIENTE) REFERENCES PACIENTE(IDPACIENTE);

ALTER TABLE CONSULTA ADD CONSTRAINT FK_CONSULTA_MEDICO
FOREIGN KEY (ID_MEDICO) REFERENCES MEDICO(IDMEDICO);

ALTER TABLE CONSULTA ADD CONSTRAINT FK_CONSULTA_HOSPITAL
FOREIGN KEY (ID_HOSPITAL) REFERENCES HOSPITAL(IDHOSPITAL);

ALTER TABLE INTERNACAO ADD CONSTRAINT FK_INTERNACAO_CONSULTA
FOREIGN KEY (ID_CONSULTA) REFERENCES CONSULTA(IDCONSULTA);

mysql> SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'CONSULTA';
+--------------------+-------------------+----------------------+--------------+------------+-----------------+----------+
| CONSTRAINT_CATALOG | CONSTRAINT_SCHEMA | CONSTRAINT_NAME      | TABLE_SCHEMA | TABLE_NAME | CONSTRAINT_TYPE | ENFORCED |
+--------------------+-------------------+----------------------+--------------+------------+-----------------+----------+
| def                | consultorio       | PRIMARY              | consultorio  | consulta   | PRIMARY KEY     | YES      |
| def                | consultorio       | FK_CONSULTA_HOSPITAL | consultorio  | consulta   | FOREIGN KEY     | YES      |
| def                | consultorio       | FK_CONSULTA_MEDICO   | consultorio  | consulta   | FOREIGN KEY     | YES      |
| def                | consultorio       | FK_CONSULTA_PACIENTE | consultorio  | consulta   | FOREIGN KEY     | YES      |
+--------------------+-------------------+----------------------+--------------+------------+-----------------+----------+


