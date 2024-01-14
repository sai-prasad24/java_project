FROM ubuntu
RUN apt install open-11-jdk -y
RUN apt install apache2 -y
COPY /var/lib/jenkins/workspace/Docker-Project /var/www/html
CMD ["/usr/sbin/apachectl", "-D","FOREGROUND"]
