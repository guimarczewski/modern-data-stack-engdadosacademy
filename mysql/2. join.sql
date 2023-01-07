/* SELEÇÃO, PROJEÇÃO E JUNÇÃO */

/* PROJEÇÃO: TUDO QUE VAI APARECER NA TELA - COLUNAS - SELECT NOME, ENDERECO 
   NOW() - ESTÁ PROJETANDO A DATA ATUAL
   SELECT 2 + 2 AS SOMA
   PODE PROJETAR COLUNAS DE TABELAS OU COLUNAS DE FUNÇÕES

   SELEÇÃO: BANCO DE DADOS É TEORIA DOS CONJUNTOS
   FILTROS NAS COLUNAS - A CLAUSULA DE SELEÇÃO É O WHERE
   EX: SELECIONAR SOMENTE HOMENS - TRAZER UM SUBCONJUNTO DE UM CONJUNTO TOTAL DE REGISTROS DE UMA TABELA
*/

SELECT NOME        /* PROJEÇÃO */
FROM CLIENTE       /*  ORIGEM  */
WHERE SEXO = 'M'   /* SELEÇÃO  */

/* JUNÇÃO -> JOIN */

/* MÉDOTO ERRADO, POIS ESTÁ FAZENDO UMA CHECAGEM DESNECESSÁRIA */

SELECT NOME, SEXO, BAIRRO, CIDADE /* PROJEÇÃO */
FROM CLIENTE, ENDERECO /* ORIGEM */
WHERE IDCLIENTE = ID_CLIENTE; /* JUNÇAO */

+--------+------+----------+----------------+
| NOME   | SEXO | BAIRRO   | CIDADE         |
+--------+------+----------+----------------+
| CLARA  | F    | CENTRO   | B. HORIZONTE   |
| JOAO   | M    | CENTRO   | RIO DE JANEIRO |
| ANA    | F    | JARDINS  | SAO PAULO      |
| CARLOS | M    | ESTACIO  | RIO DE JANEIRO |
| CELIA  | M    | FLAMENGO | RIO DE JANEIRO |
| JORGE  | M    | CENTRO   | VITORIA        |
+--------+------+----------+----------------+

/* MÉTODO CORRETO */

SELECT NOME, SEXO, BAIRRO, CIDADE
FROM CLIENTE
INNER JOIN ENDERECO
ON IDCLIENTE = ID_CLIENTE;

+--------+------+----------+----------------+
| NOME   | SEXO | BAIRRO   | CIDADE         |
+--------+------+----------+----------------+
| JOAO   | M    | CENTRO   | RIO DE JANEIRO |
| CARLOS | M    | ESTACIO  | RIO DE JANEIRO |
| ANA    | F    | JARDINS  | SAO PAULO      |
| CLARA  | F    | CENTRO   | B. HORIZONTE   |
| JORGE  | M    | CENTRO   | VITORIA        |
| CELIA  | M    | FLAMENGO | RIO DE JANEIRO |
+--------+------+----------+----------------+

SELECT NOME, SEXO, BAIRRO, CIDADE /* PROJEÇÃO */
FROM CLIENTE /* ORIGEM */
	INNER JOIN ENDERECO /* JUNCAO */
	ON IDCLIENTE = ID_CLIENTE
WHERE SEXO = 'F'; /* SELEÇÃO */

+-------+------+---------+--------------+
| NOME  | SEXO | BAIRRO  | CIDADE       |
+-------+------+---------+--------------+
| ANA   | F    | JARDINS | SAO PAULO    |
| CLARA | F    | CENTRO  | B. HORIZONTE |
+-------+------+---------+--------------+

SELECT NOME, SEXO, EMAIL, TIPO, NUMERO
FROM CLIENTE
	INNER JOIN TELEFONE
	ON IDCLIENTE = ID_CLIENTE
WHERE TIPO = 'CEL';

+--------+------+----------------+------+----------+
| NOME   | SEXO | EMAIL          | TIPO | NUMERO   |
+--------+------+----------------+------+----------+
| JORGE  | M    | JORGE@IG.COM   | CEL  | 78458743 |
| JOAO   | M    | JOAOA@IG.COM   | CEL  | 87866896 |
| ANA    | F    | ANA@IG.COM     | CEL  | 78989765 |
| ANA    | F    | ANA@IG.COM     | CEL  | 99766676 |
| CARLOS | M    | CARLOSA@IG.COM | CEL  | 88687909 |
+--------+------+----------------+------+----------+

/* JUNTANDO MAIS DE UMA TABELA */
/* NOME, SEXO, BAIRRO, CIDADE, TIPO, NUMERO */
/* COLUNAS COM NOMES IGUAIS, PRECISA COLOCAR TABELA.COLUNA
COLUNAS COM NOMES DIFERENTES SÓ COLOCAR A COLUNA*/

SELECT NOME, SEXO, BAIRRO, CIDADE, TIPO, NUMERO
FROM CLIENTE 
	INNER JOIN ENDERECO
	ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
	INNER JOIN TELEFONE
	ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE;

+--------+------+---------+----------------+------+----------+
| NOME   | SEXO | BAIRRO  | CIDADE         | TIPO | NUMERO   |
+--------+------+---------+----------------+------+----------+
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | CEL  | 87866896 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | RES  | 99667587 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | COM  | 66687899 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | COM  | 54768899 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | CEL  | 88687909 |
| ANA    | F    | JARDINS | SAO PAULO      | CEL  | 78989765 |
| ANA    | F    | JARDINS | SAO PAULO      | CEL  | 99766676 |
| JORGE  | M    | CENTRO  | VITORIA        | CEL  | 78458743 |
| JORGE  | M    | CENTRO  | VITORIA        | RES  | 56576876 |
| JORGE  | M    | CENTRO  | VITORIA        | RES  | 89986668 |
+--------+------+---------+----------------+------+----------+

/* UTILIZANDO PONTEIRAMENTO - MELHOR PERFORMANCE */

SELECT C.NOME, C.SEXO, E.BAIRRO, E.CIDADE, T.TIPO, T.NUMERO
FROM CLIENTE C
	INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE
	INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE;

+--------+------+---------+----------------+------+----------+
| NOME   | SEXO | BAIRRO  | CIDADE         | TIPO | NUMERO   |
+--------+------+---------+----------------+------+----------+
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | CEL  | 87866896 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | RES  | 99667587 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | COM  | 66687899 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | COM  | 54768899 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | CEL  | 88687909 |
| ANA    | F    | JARDINS | SAO PAULO      | CEL  | 78989765 |
| ANA    | F    | JARDINS | SAO PAULO      | CEL  | 99766676 |
| JORGE  | M    | CENTRO  | VITORIA        | CEL  | 78458743 |
| JORGE  | M    | CENTRO  | VITORIA        | RES  | 56576876 |
| JORGE  | M    | CENTRO  | VITORIA        | RES  | 89986668 |
+--------+------+---------+----------------+------+----------+


/*

	CATEGORIAS DE LINGUAGEM:

	DML - DATA MANIPULATION LANGUAGE - MANIPULAÇÃO DE DADOS
	DDL - DATA DEFINITION LANGUAGE - DEFINIÇÃO(TIPAGEM) DOS DADOS
	DCL - DATA CONTROL LANGUAGE - CONTROLE DE ACESSO AOS DADOS
	TCL - TRANSACTION CONTROL LANGUAGE - CONTROLE DE TRANSAÇÃO

*/

/* DML - INSERT */

INSERT INTO CLIENTE VALUES(NULL, 'PAULA','M',NULL, '7789738473');
INSERT INTO ENDERECO VALUES(NULL,'RUA JOAQUIM SILVA','ALVORADA','NITEROI','RJ',7);

SELECT * FROM CLIENTE;

/* FILTROS */

SELECT * FROM CLIENTE WHERE SEXO = 'M'

/* UPDATE */

UPDATE CLIENTE SET SEXO = 'F' WHERE IDCLIENTE = 7;

/* DELETE */


INSERT INTO CLIENTE VALUES(NULL, 'XXX','M',NULL, '12134');

DELETE FROM CLIENTE WHERE IDCLIENTE = 8;

/* DDL - DATA DEFINITION LANGUAGE - DEFINIÇÃO(TIPAGEM) DOS DADOS */

CREATE TABLE PRODUTO(
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME_PRODUTO VARCHAR(30) NOT NULL,
	PRECO INT,
	FRETE FLOAT(10,2) NOT NULL
);

/* ALTER TABLE */

/* ALTERANDO NOME E TIPO DE UMA COLUNA - CHANGE */

ALTER TABLE PRODUTO 
CHANGE PRECO VALOR_UNITARIO INT NOT NULL;

+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | int         | NO   |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

ALTER TABLE PRODUTO 
CHANGE VALOR_UNITARIO VALOR_UNITARIO INT;

+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | int         | YES  |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

/* MODIFY - ALTERANDO O TIPO - NAO PRECISA REPETIR O NOME DA COLUNA 2X*/

ALTER TABLE PRODUTO 
MODIFY VALOR_UNITARIO VARCHAR(50) NOT NULL;

/* ADICIONANDO COLUNAS */

ALTER TABLE PRODUTO
ADD PESO FLOAT(10,2) NOT NULL;

mysql> DESC PRODUTO;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | varchar(50) | NO   |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
| PESO           | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

/* APAGANDO UMA COLUNA */

ALTER TABLE PRODUTO
DROP COLUMN PESO;

/* ADICIONANDO COLUNA EM ORDEM ESPECIFICA */
/* AFTER OU FIRST */

ALTER TABLE PRODUTO
ADD COLUMN PESO FLOAT(10,2) NOT NULL
AFTER NOME_PRODUTO;

ALTER TABLE PRODUTO
ADD COLUMN PESO FLOAT(10,2) NOT NULL
FIRST;

/* EXERCICIOS DML */

/* RELATORIO GERAL TODOS OS CLIENTES (TELEONE E ENDEREÇO) */
SELECT C.NOME, T.NUMERO, E.RUA, E.BAIRRO, E.CIDADE, E.ESTADO
FROM CLIENTE C
INNER JOIN ENDERECO E ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T ON C.IDCLIENTE = T.ID_CLIENTE;

/* RELATORIO DE HOMENS */
SELECT NOME FROM CLIENTE WHERE SEXO = 'M';

/* RELATORIO E MULHERES */
SELECT NOME FROM CLIENTE WHERE SEXO = 'F';

/* QUANTIDADE DE HOMENS E MULHERES */
SELECT SEXO, COUNT(*) FROM CLIENTE GROUP BY SEXO;

/* IDS E EMAILS DAS MULHERES QUE MOREM NO CENTRO DO RJ
E NAO TENHAM CELULAR */
SELECT C.IDCLIENTE, C.EMAIL, E.BAIRRO, E.CIDADE, T.TIPO
FROM CLIENTE C
INNER JOIN ENDERECO E ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T ON C.IDCLIENTE = T.ID_CLIENTE
WHERE BAIRRO = 'CENTRO' AND CIDADE = 'RIO DE JANEIRO'
AND TIPO <> 'CEL';
/*TIPO NOT IN ('CEL')*/

/* ID CLIENTE = 12, 13, 18, 19 */

SELECT IDCLIENTE, NOME
FROM CLIENTE
WHERE IDCLIENTE IN ('12','13','18','19');











