# A small example of deploying PostgreSQL in Docker

__BaloKir (c)__


* Deploys PostgreSQL with [TimescaleDB](https://www.timescale.com/) and [PostGIS](https://postgis.net/).
* Creates several databases and initializes extensions.

This setup uses the https://github.com/timescale/timescaledb-docker-ha image, which supports some additional features.

Multiple databases initialization based on https://github.com/mrts/docker-postgresql-multiple-databases

Data files from PostgreSQL are saved in the db_data folder of the current folder.

Change the POSTGRES_MULTIPLE_DATABASES argument in [docker-compose.yml](docker-compose.yml) to generate the list of required databases.

Edit [script](pg-init-scripts/create-multiple-postgresql-databases.sh) if you need additional database setup.


