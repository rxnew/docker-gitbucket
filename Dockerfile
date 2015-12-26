FROM    ubuntu:14.04
RUN     apt-get update
RUN     apt-get -y upgrade
RUN     apt-get install -y software-properties-common
RUN     apt-add-repository -y ppa:openjdk-r/ppa
RUN     apt-get -y update
RUN     apt-get install -y openjdk-8-jdk tomcat7 tomcat7-user
WORKDIR /root
RUN     tomcat7-instance-create tomcat
COPY    ./files/gitbucket.war tomcat/webapps/gitbucket.war
COPY    ./files/container-init /usr/local/sbin/container-init
RUN     chmod +x /usr/local/sbin/container-init
CMD     ["container-init"]
