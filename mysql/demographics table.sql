CREATE DATABASE COVID19;

USE COVID19;

CREATE TABLE DEMOGRAPHICS(
	location_key VARCHAR(20) UNIQUE PRIMARY KEY,
    population INT,
    population_male INT,
    population_female INT,
    population_rural INT,
    population_urban INT,
    population_largest_city INT,
    population_clustered INT,
    population_density INT,
    human_development_index INT,
    population_age_00_09 INT,
    population_age_10_19 INT,
    population_age_20_29 INT,
    population_age_30_39 INT,
    population_age_40_49 INT,
    population_age_50_59 INT,
    population_age_60_69 INT,
    population_age_70_79 INT,
    population_age_80_and_older INT
);

-- mover o arquivo csv para dentro do container, para identificar o container_id basta usar o comando "docker ps", nesse caso 73c03dd063b4
docker cp /workspace/modern-data-stack-engdadosacademy/data/demographics.csv 73c03dd063b4:/usr/local/

LOAD DATA LOCAL INFILE '/usr/local/demographics.csv'
INTO TABLE DEMOGRAPHICS
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT location_key, population, population_male, population_female FROM DEMOGRAPHICS LIMIT 10;

+--------------+------------+-----------------+-------------------+
| location_key | population | population_male | population_female |
+--------------+------------+-----------------+-------------------+
| AD           |      77265 |           58625 |             55581 |
| AE           |    9890400 |         6836349 |           3054051 |
| AF           |   38928341 |        19976265 |          18952076 |
| AF_BAL       |    1509183 |               0 |                 0 |
| AF_BAM       |     495557 |               0 |                 0 |
| AF_BDG       |     549583 |               0 |                 0 |
| AF_BDS       |    1054087 |               0 |                 0 |
| AF_BGL       |    1014634 |               0 |                 0 |
| AF_DAY       |     516504 |               0 |                 0 |
| AF_FRA       |     563026 |               0 |                 0 |
+--------------+------------+-----------------+-------------------+