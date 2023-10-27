FROM postgres
USER root

# database credentials
ARG POSTGRES_USER=postgres POSTGRES_PASSWORD=postgres POSTGRES_DB=example
ENV POSTGRES_USER=${POSTGRES_USER} POSTGRES_PASSWORD=${POSTGRES_PASSWORD} POSTGRES_DB=${POSTGRES_DB}

# which schema should be used
ARG SCHEMA_FOLDER="stocks"

# copy the necessary files
ENV IMPORT_SCRIPT="import.sh" SCHEMA_SCRIPT="schema.sql" DATA_FOLDER="data" 

RUN mkdir $DATA_FOLDER

COPY $SCHEMA_FOLDER/$SCHEMA_SCRIPT /docker-entrypoint-initdb.d/001_$SCHEMA_SCRIPT
COPY $IMPORT_SCRIPT /docker-entrypoint-initdb.d/002_$IMPORT_SCRIPT
COPY $SCHEMA_FOLDER/$DATA_FOLDER/* $DATA_FOLDER/

USER postgres