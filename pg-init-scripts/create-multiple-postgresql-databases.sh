#!/bin/bash
# based on https://github.com/mrts/docker-postgresql-multiple-databases

set -e
set -u

function init_database() {
	local database=$1
	echo " Creating database '$database'"
	psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
	    CREATE DATABASE $database;
            \c $database
            CREATE EXTENSION IF NOT EXISTS postgis;
            CREATE EXTENSION IF NOT EXISTS timescaledb;
EOSQL
}

if [ -n "$POSTGRES_MULTIPLE_DATABASES" ]; then
	echo "Multiple database creation requested: $POSTGRES_MULTIPLE_DATABASES"
	for db in $(echo $POSTGRES_MULTIPLE_DATABASES | tr ',' ' '); do
		init_database $db
	done
	echo "Multiple databases creation finished"
fi
