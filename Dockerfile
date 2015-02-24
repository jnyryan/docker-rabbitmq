# RabbitMQ
#
# VERSION               0.0.1

FROM      ubuntu:14.04
MAINTAINER John Ryan "jnyryan@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

ADD etc/rabbitmq-signing-key-public.asc /tmp/rabbitmq-signing-key-public.asc
RUN apt-key add /tmp/rabbitmq-signing-key-public.asc

RUN echo "deb http://www.rabbitmq.com/debian/ testing main" > /etc/apt/sources.list.d/rabbitmq.list
RUN apt-get -qq update > /dev/null
RUN apt-get -qq -y install rabbitmq-server > /dev/null
RUN /usr/sbin/rabbitmq-plugins enable rabbitmq_mqtt rabbitmq_stomp rabbitmq_management rabbitmq_management_agent rabbitmq_management_visualiser rabbitmq_federation rabbitmq_federation_management
RUN echo "[{rabbit, [{loopback_users, []}]}]." > /etc/rabbitmq/rabbitmq.config
#RUN rabbitmqctl set_policy ha-all "" '{"ha-mode":"all","ha-sync-mode":"automatic"}'

EXPOSE 5672 15672 4369

CMD /usr/sbin/rabbitmq-server
#CMD /etc/init.d/rabbitmq-server start
