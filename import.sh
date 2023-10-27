#!/bin/bash
set -e

for csv_file_name in "$DATA_FOLDER"/*.csv
do
	table_name="$(basename $csv_file_name .csv)"
  	psql -v --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
		\copy $table_name FROM '$csv_file_name' CSV HEADER;
	EOSQL
done
