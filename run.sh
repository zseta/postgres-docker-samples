# read variables from .env file
set -o allexport
source .env
set +o allexport

# create a file with the connection info for easy copy-paste
connect_info="host=localhost\nport=$POSTGRES_PORT\ndatabase=$POSTGRES_DB\nuser=$POSTGRES_USER\npassword=$POSTGRES_PASSWORD\nstring=postgresql://$POSTGRES_USER:$POSTGRES_PASSWORD@localhost:$POSTGRES_PORT/$POSTGRES_DB"
printf $connect_info > connect.txt

docker run -p $POSTGRES_PORT:5432 $DOCKER_IMAGE_TAG