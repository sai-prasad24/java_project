FROM ubuntu:latest
RUN apt update -y
RUN apt-get install java
RUN apt install apache2 -y
COPY /var/lib/jenkins/workspace/Docker-Project /var/www/html
CMD ["/usr/sbin/apachectl", "-D","FOREGROUND"]
