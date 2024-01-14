FROM ubuntu:latest
FROM apt update -y
RUN apt-get install -y open-11-jdk -y
RUN apt install apache2 -y
COPY /var/lib/jenkins/workspace/Docker-Project /var/www/html
CMD ["/usr/sbin/apachectl", "-D","FOREGROUND"]
