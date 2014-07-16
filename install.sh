#!/bin/bash

####################
# Prerequisites
apt-get update
apt-get install -y make curl git 

#####################
# Install docker
sudo apt-get install -y docker.io
sudo ln -sf /usr/bin/docker.io /usr/local/bin/docker
sudo sed -i '$acomplete -F _docker docker' /etc/bash_completion.d/docker.io

docker build -t rabbitmq /vagrant/.
docker run -d -p 5672:5672 -p 15672:15672 rabbitmq
