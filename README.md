# docker-rabbitmq
a docker container to run rabbitmq.

## Introduction
Docker is a portable lightweight runtime and packaging tool that allows
virtualization of applications inlightweight containers.

It allows applications to run in a contained space on the kernelproviding it's
own directory structure.  

## Install from DockerHub

``` bash
sudo docker pull jnyryan/rabbitmq
sudo docker run -d -h rabbithost -p 5672:5672 -p 15672:15672 jnyryan/rabbitmq
```

## Build Locally:

```
sudo docker build github.com/jnyryan/rabbitmq.git
sudo docker run -d -p 5672:5672 -p 15672:15672 jnyryan/rabbitmq
```

## Run in Vagrant Virtual Machine

1. Install (VagrantUp)[http://www.vagrantup.com/]
2. clone (this repo)[github.com/jnyryan/docker-rabbitmq.git]
3. run ```vagrant up```
4. Browse to http://localhost:15672

### To persist your data locally:

Here we persistently save our data to the host machine's ``/tmp/rabbitmq/mnesia`` directory.

    mkdir -p /tmp/rabbitmq/mnesia
    chmod 777 /tmp/rabbitmq/mnesia
    sudo docker run -d -h rabbithost -p 5672:5672 -p 15672:15672 -v /tmp/rabbitmq/mnesia:/var/lib/rabbitmq/mnesia mikaelhg/docker-rabbitmq

Since RabbitMQ uses the ``$HOSTNAME`` in its data path, we need to explicitly set it for the container.

    $ sudo docker run -h rabbithost -p 5672:5672 -p 15672:15672 -v /tmp/rabbitmq/mnesia:/var/lib/rabbitmq/mnesia mikaelhg/docker-rabbitmq
    WARNING: Docker detected local DNS server on resolv.conf. Using default external servers: [8.8.8.8 8.8.4.4]

                  RabbitMQ 3.1.5. Copyright (C) 2007-2013 GoPivotal, Inc.
      ##  ##      Licensed under the MPL.  See http://www.rabbitmq.com/
      ##  ##
      ##########  Logs: /var/log/rabbitmq/rabbit@rabbithost.log
      ######  ##        /var/log/rabbitmq/rabbit@rabbithost-sasl.log
      ##########
                  Starting broker... completed with 6 plugins.


## Build the Package and Publish it to Dockerhub

``` bash
sudo docker login
sudo docker pull jnyryan/rabbitmq
sudo docker build -t jnyryan/rabbitmq /vagrant/.
sudo docker push jnyryan/rabbitmq
```


## References

https://github.com/mikaelhg/docker-rabbitmq
