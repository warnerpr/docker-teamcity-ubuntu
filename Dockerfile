FROM ubuntu:14.04.1

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install --yes software-properties-common && \
    add-apt-repository ppa:webupd8team/java && \
    apt-get update

RUN echo 'oracle-java8-installer shared/accepted-oracle-license-v1-1 select true' | /usr/bin/debconf-set-selections  && \
    DEBIAN_FRONTEND=noninteractive apt-get install --yes oracle-java8-installer

# this is not ideal as it leaves this large file in container history
COPY ./TeamCity-9.0.2.tar.gz /tmp/TeamCity-9.0.2.tar.gz

RUN tar zxvf /tmp/TeamCity-9.0.2.tar.gz --directory /opt && \
    rm /tmp/TeamCity-9.0.2.tar.gz

VOLUME /root/.BuildServer /opt/TeamCity/logs

EXPOSE 8111

# TeamCity has a nice start up script for a traditional deployment model.
# It is totally wrong to use it on Docker like this, but boy is it handy....
# TODO Dockerize this properly, get the server only running here, get the
# agent on another machine some day.
CMD /opt/TeamCity/bin/runAll.sh start && sleep 999999999999999
