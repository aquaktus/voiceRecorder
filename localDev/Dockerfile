# set os to ubuntu 16.04
FROM ubuntu:xenial

MAINTAINER Carlos Gemmell

ENV DEBIAN_FRONTEND noninteractive


# update definitions and upgrade default packages
RUN apt-get update -y
RUN apt-get upgrade -y

# install essential tools for the apps, like ssl, git and build tools
RUN apt-get install -y software-properties-common wget build-essential libssl-dev git

# add nginx ubuntu ppa
RUN add-apt-repository ppa:nginx/development

# update definitions and install vim, curl and nginx package with extra functions
RUN apt-get update -y
RUN apt-get install -y vim curl nginx-extras

# install nodejs with latest v8.x
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && apt-get install -y nodejs

# set Diffie-Hellman key for more secure ssl
RUN openssl dhparam -dsaparam -out /etc/ssl/dh4096.pem 4096

# install pm2 and node-gyp for package building
RUN npm install -g pm2 node-gyp nsp

# make directory for volumes
RUN mkdir -p /home/user

# on startup restart mysql and run init script
ENTRYPOINT /bin/bash --login -c "/home/user/serverPortal/localDev/init.sh" && /bin/bash
