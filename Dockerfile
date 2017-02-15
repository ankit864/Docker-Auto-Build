#set base image UBUNTU
FROM ubuntu

#update the ubuntu
RUN apt-get update

#install mongo db as refres in mongodb Docs
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

#adding mongodb source list
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list

#again update after adding keys
RUN apt-get update

#install mongoDB
RUN apt-get install -y mongodb-10gen

RUN apt-get update
#create default data directory
RUN mkdir -p /data/db

#set defAault port for mongodb
EXPOSE 27017

#default port for entry point 
ENTRYPOINT /usr/bin/mongod

