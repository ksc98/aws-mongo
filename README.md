# aws-mongo
Goal: Host a MongoDB on AWS and interact with it from your local computer

## Setting up AWS
1. Create a key/pair on AWS Dashboard
2. Put key.pem in ~/.aws/

## SSH into EC2 instance

Format: \
`ssh -i /path/to/key.pem user@my-instance-public-dns-name`

Example: \
`ssh -i ~/.aws/key.pem ubuntu@ec2-50-18-42-4.us-west-1.compute.amazonaws.com`


## Install necessary packages

Update packages: \
`sudo apt-get update && sudo apt-get upgrade`

Install Docker: \
`sudo apt-get install docker.io`

Install docker-compose (for container orchestration): \
`sudo apt-get install docker-compose`

## Start MongoDB container
Now, we need to start the Mongo container.

To do this, we will pull the latest Docker Mongo image and run it:

`docker run --name mongodb -d mongo:latest`

Explanation: \
`--name {}`: name of container \
`-d` (detach): run the container in background 


## Create an SSH tunnel from (local -> AWS)

`ssh -i /path/to/key.pem user@my-instance-public-dns-name -Nf -L 27018:localhost:27017`

Explanation:

> `ssh -i /path/to/key.pem user@my-instance-public-dns-name` \
-> Authenticate using your private key

`-f` \
-> Run this command in background

`-N` \
-> Do not execute a remote command (we only want to create an SSH tunnel)

`-L 27018:localhost:27017` \
-> Route traffic from local_socket (27018) to remote_socket (27017)


## Interact with the MongoDB interactively

## Load data into MongoDB

## Enable monitoring/stats for MongoDB (free)

