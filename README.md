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

Update packages:
> `sudo apt-get update && sudo apt-get upgrade`

Install Docker:
> `sudo apt-get install docker.io`

Install docker-compose (for container orchestration):
> `sudo apt-get install docker-compose`

## Start MongoDB container
Now, we need to start the Mongo container. \
To do this, we need to pull the latest Mongo image from Docker Hub:

> `docker run --name mongodb -d mongo:latest`

Explanation:

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


## Interact with the MongoDB interactively

## Load data into MongoDB

## Enable monitoring/stats for MongoDB (free)

