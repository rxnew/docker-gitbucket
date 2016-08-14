FROM    ubuntu:16.04
RUN     apt-get update
RUN     apt-get -y upgrade
RUN     apt-get install -y openjdk-8-jdk tomcat7 tomcat7-user wget
WORKDIR /root
RUN     tomcat7-instance-create tomcat
COPY    ./files/entry /usr/local/sbin/entry
RUN     chmod +x /usr/local/sbin/entry
CMD     ["entry"]
