# aws-mongo
Goal: Host a MongoDB on AWS and interact with it from your local computer

## Setting up AWS
1. Create a key/pair on AWS Dashboard
2. Put key.pem in ~/.aws/

## SSH into EC2 instance

`ssh -i /path/to/key.pem user@my-instance-public-dns-name`

`ssh -i ~/.aws/key.pem ubuntu@ec2-50-18-42-4.us-west-1.compute.amazonaws.com`


## Install necessary packages


## Start MongoDB container

## Create an SSH tunnel from (local -> AWS)

## Interact with the MongoDB interactively

## Load data into MongoDB

## Enable monitoring/stats for MongoDB (free)

