# aws-mongo
Goal: Host a MongoDB on AWS and interact with it from your local computer

## Setting up AWS
1. Create a key/pair on AWS Dashboard
2. Put key.pem in ~/.aws/

## SSH into EC2 instance
Format:
> `ssh -i /path/to/key.pem user@my-instance-public-dns-name`

Example:
> `ssh -i ~/.aws/key.pem ubuntu@ec2-50-18-42-4.us-west-1.compute.amazonaws.com`


## Install necessary packages
### On server:
Update packages:
> `sudo apt-get update && sudo apt-get upgrade`

Install Docker:
> `sudo apt-get install docker.io`

Install docker-compose (for container orchestration):
> `sudo apt-get install docker-compose`

### On local:
Install mongo-cli:
> `brew install mongodb-community-shell`


## Start MongoDB container
Now, we need to start the Mongo container. \
To do this, we need to pull the latest Mongo image from Docker Hub.

> `docker run --name mongodb -d mongo:latest`

#### Explanation:
Name of container:
> `--name container_name`

Run the container in background ("detach"):
>`-d`


## Create an SSH tunnel from (local -> AWS)
Authenticate using your private key:
> `ssh -i /path/to/key.pem user@my-instance-public-dns-name`

Run this command in background:
> `-f`

Do not execute a remote command (we only want to create an SSH tunnel):
> `-N`

Route traffic from local_socket (27018) to remote_socket (27017):
> `-L 27018:localhost:27017`

Final command:
> `ssh -i /path/to/key.pem user@my-instance-public-dns-name -Nf -L 27018:localhost:27017`

## Load data into MongoDB
Populate db with data (example: drop .csv into db)
> `mongoimport --type csv -d name_of_db -c name_of_collection
--headerline --drop file_to_drop.csv --port mongo_port`
#' \preformatted{
#'   multiple
#'   lines
#' }

## Interact with the MongoDB interactively
Now that we have the local port routed to the server, we can simply just connect to local port 27018. \
Port 27018 is mapped to port 27017 on the server, which is the MongoDB port. \
When we connect to port 27018 locally, we are communicating with the /remote/ MongoDB.

Connect to the MongoDB (only you can connect):
> `mongo --port 27018`

Show databases:
> `show dbs`

Select a database (to browser further):
> `use [database_name]`

Show collections (a db can have multiple "collections" of data):
> `show collections`


## Enable monitoring/stats for MongoDB (free)

