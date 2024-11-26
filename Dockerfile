#FROM ubuntu:20.04
#RUN apt-get update && apt-get install -y vim nano wget curl
#WORKDIR /home/ikozhuhar/GITHUB/docker
#COPY ./script.sh ./script.sh

FROM nginx:alpine
RUN apt-get update && apt-get install -y vim nano wget curl
COPY ./index.html /usr/share/nginx/html/index.html
