FROM    ubuntu:14.04
RUN     apt-get update
RUN     apt-get -y upgrade
RUN     apt-get install -y software-properties-common
RUN     apt-add-repository -y ppa:openjdk-r/ppa
RUN     apt-get -y update
RUN     apt-get install -y openjdk-8-jdk tomcat7 tomcat7-user wget
WORKDIR /root
RUN     tomcat7-instance-create tomcat
WORKDIR /root/tomcat/webapps
RUN     wget https://github.com/gitbucket/gitbucket/releases/download/3.9/gitbucket.war
WORKDIR /root
COPY    ./files/entry /usr/local/sbin/entry
RUN     chmod +x /usr/local/sbin/entry
CMD     ["entry"]
