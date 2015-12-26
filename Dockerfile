FROM    ubuntu:14.04
RUN     apt-get update
RUN     apt-get -y upgrade
RUN     apt-get install -y software-properties-common
RUN     apt-add-repository -y ppa:openjdk-r/ppa
RUN     apt-get -y update
RUN     apt-get install -y openjdk-8-jdk tomcat7
WORKDIR /var/lib/tomcat7/webapps
COPY    ./files/gitbucket.war gitbucket.war
COPY    ./files/container-init /usr/local/sbin/container-init
RUN     chmod +x /usr/local/sbin/container-init
WORKDIR /root
CMD     ["container-init"]
