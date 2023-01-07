# modern-data-stack-engdadosacademy

Construindo uma Stack de Dados Moderna com Airbyte, Airflow, DBT & Snowflake na Prática!

- Containers:
    - MongoDB x
        - VS Code extension, criados arquivos .mongodb para verificar os dados dos documentos. Falta criar python script para criar tabela e carregar json pela command line
    - Airbyte x
    - Airflow x
    - Metabase - para conectar o mysql no metabase, o host é o nome do container, após criação da network x
    - MySQL - https://geshan.com.np/blog/2021/12/docker-postgres/ - Shell do container e "mysql -u root -p db", arquivo "demographics table.sql" x

- Criação Docker Network e inclusão do metabase, mysql, airbyte e airflow: x
    - docker network create modern-data-stack
    - docker network connect modern-data-stack metabase-metabase-app-1
    - docker network connect modern-data-stack mysql-db-1
    - docker network connect modern-data-stack airbyte-proxy
    - docker network connect modern-data-stack airbyte-worker  
    - docker network connect modern-data-stack airflow-airflow-worker-1
    - docker network connect modern-data-stack airflow-airflow-webserver-1

- Verificação da docker network para confirmar a inclusão dos containers: x
    - docker network inspect modern-data-stack

- Extração no airbyte
    - Conectar origens - MongoDB e MySQL
    - Criar as entidades no snowflake através do script base da documentação
    - Conectar o destino no snowflake
    - Criar as conexões do airbyte associando as origens ao destino
    - Testar conexões