# PostgreSQL database samples with Docker
Spin up local PostgreSQL instances in seconds with preloaded sample data.

## Prerequisites
* [Docker](https://docs.docker.com/engine/install/)

## Available samples
* [movies](/movies/) ([data source](https://www.kaggle.com/datasets/tmdb/tmdb-movie-metadata))
* [stocks](/movies/) ([data source](https://www.kaggle.com/datasets/aayushmishra1512/faang-complete-stock-data))

## Get started
1. Clone the repository:
    ```
    git clone https://github.com/zseta/postgres-docker-samples.git
    ```

1. Modify the `.env` file (or leave it as is):
    ```
    # choose a schema (must be the name of a folder)
    SAMPLE_SCHEMA=stocks

    # add database credentials
    POSTGRES_PORT=5432
    POSTGRES_USER=postgres
    POSTGRES_PASSWORD=password
    POSTGRES_DB=example

    # image tag
    DOCKER_IMAGE_TAG=sample-db
    ```

1. Build the image:
    ```
    chmod +x build.sh
    ./build.sh
    ```

1. Run the container:
    ```
    chmod +x run.sh
    ./run.sh
    ``` 

1. Find the connection information in the `connect.txt` file for easy copy-paste:
    ```txt
    host=localhost
    port=5432
    database=example
    user=postgres
    password=password
    string=postgresql://postgres:password@localhost:5432/example
    ```

To stop the container you can press CTRL+C.

## Contribute
You are welcome to add new sample data folders to the project. Here's how to do it:

You need to provide two types of files: data file (in CSV format) and a schema file, in the following directory structure:

```bash
├── <new_data_folder>
│   ├── data
│   │   ├── <data_file1>.csv
│   │   └── <data_file2>.csv
│   └── schema.sql
```
You can have as many CSV files in the `data` folder as you'd like. The content of each CSV file will be inserted into its corresponding table.

CSV file requirements:
* includes header
* the name of the file must be the same as the table defined in the schema file
* order of columns must be the same as defined in the schema file

For examples, look at any of the existing samples.
