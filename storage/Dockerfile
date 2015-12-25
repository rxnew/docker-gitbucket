FROM    busybox
VOLUME  /home/gitbucket/tomcat/webapps
WORKDIR /home/gitbucket/tomcat/webapps
COPY    ./files/gitbucket.war ./gitbucket.war
RUN     mkdir gitbucket
WORKDIR /home/gitbucket/tomcat/webapps/gitbucket
WORKDIR /home/gitbucket/tomcat/webapps
