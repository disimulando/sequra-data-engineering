#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER docker ENCRYPTED PASSWORD 'docker';
    CREATE DATABASE sequra;
    GRANT ALL PRIVILEGES ON DATABASE sequra TO docker;
EOSQL
