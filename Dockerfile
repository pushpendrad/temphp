#
# Ubuntu Dockerfile
#
# https://github.com/dockerfile/ubuntu
# Pull base image.
FROM ubuntu:14.04

# Install.
RUN apt-get update

RUN apt-get -y install php5-cli php5-common php5-mysql php5-xdebug libapache2-mod-php5
RUN apt-get -y install apache2
COPY ecomm_project /var/www/html/

RUN rm -f /etc/apache2/mods-available/dir.conf
COPY dir.conf /etc/apache2/mods-available/

EXPOSE 80

#CMD service apache2 start
CMD /usr/sbin/apache2ctl -D FOREGROUND
