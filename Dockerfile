FROM ubuntu:20.04
RUN apt-get update && apt-get install -y vim nano wget curl
WORKDIR /home/ikozhuhar/GITHUB/docker
COPY ./script.sh ./script.sh