# modern-data-stack-engdadosacademy

Construindo uma Stack de Dados Moderna com Airbyte, Airflow, DBT & Snowflake na Prática!

- Containers:
    - MongoDB x
        - VS Code extension, criados arquivos .mongodb para verificar os dados dos documentos. Falta criar python script para criar tabela e carregar json pela command line
    - Airbyte x
    - Airflow x
    - Metabase - para conectar o mysql no metabase, o host é o nome do container, após criação da network
    - MySQL - https://geshan.com.np/blog/2021/12/docker-postgres/ - Shell do container e "mysql -u root -p db", arquivo "demographics table.sql"

- Criação Docker Network:
    - docker network create modern-data-stack
    - docker network connect modern-data-stack metabase-metabase-app-1
    - docker network connect modern-data-stack mysql-db-1
