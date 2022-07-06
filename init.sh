#!/bin/bash

echo 'started init'
sudo apt-get update
sudo apt install -y docker.io
sudo apt install -y docker-compose
sudo git clone https://github.com/kendize/clouds && cd clouds
sudo apt-get install awscli
sudo aws configure
sudo aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 065659108092.dkr.ecr.us-east-1.amazonaws.com

sudo docker-compose up -d

echo 'ended init'
