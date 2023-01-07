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

LOAD DATA LOCAL INFILE 'https://github.com/guimarczewski/modern-data-stack-engdadosacademy/blob/main/data/demographics.csv'
INTO TABLE DEMOGRAPHICS
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
