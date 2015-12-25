FROM    ubuntu:14.04
RUN     apt-get update
RUN     apt-get -y upgrade
RUN     apt-get install -y software-properties-common
RUN     apt-add-repository -y ppa:openjdk-r/ppa
RUN     apt-get -y update
RUN     apt-get install -y openjdk-8-jdk tomcat7 tomcat7-user
RUN     useradd gitbucket -m
RUN     echo "gitbucket ALL=NOPASSWD: ALL" >> /etc/sudoers
RUN     gpasswd -a gitbucket sudo
USER    gitbucket
WORKDIR /home/gitbucket
RUN     tomcat7-instance-create tomcat
COPY    ./files/gitbucket.war tomcat/webapps/gitbucket.war
RUN     sudo chown gitbucket:gitbucket tomcat/webapps/gitbucket.war
ENTRYPOINT \
        sudo ip addr add 172.17.240.1/16 dev eth0 && \
        sudo chown -R gitbucket:gitbucket .gitbucket && \
        ./tomcat/bin/startup.sh && \
        /bin/bash
