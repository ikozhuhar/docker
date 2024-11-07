### Docker

Остановился на уроке 3.4

#### <a name='toc'>Содержание</a>
1. [Инструкция по установке докера на Linux](#1)
2. [Первый контейнер](#2)
3. [Создание образа](#3)
4. [Собственные образы на Docker Hub](#???????)

Docker – это программная платформа для быстрой разработки, тестирования и развертывания приложений. Docker упаковывает ПО в стандартизованные блоки, которые называются контейнерами. Каждый контейнер включает все необходимое для работы приложения: библиотеки, системные инструменты, код и среду исполнения. Это упрощает перенос приложения на другую инфраструктуру.

Docker гарантирует, что ваше приложение будет работать одинаково на разных устройствах и операционных системах. Разработчики могут вместе работать над одним и тем же приложением без возникновений конфликтов между ОС и ПО, ведь докер может размещаться не только на Linux, но и на Windows и MacOS. Docker использует изолированные инстансы пользовательского пространства, известные как контейнеры.

#### [[⬆]](#toc) <a name='1'>Инструкция по установке Docker на Linux</a>

1. [Установке Docker на Linux](https://docs.docker.com/engine/install/ubuntu/)
2. [Запуск Docker не из-под суперпользователя](https://docs.docker.com/engine/install/linux-postinstall/)
3. [Установка Docker-Compose](https://docs.docker.com/compose/install/standalone/)


#### [[⬆]](#toc) <a name='2'>Первый контейнер</a>
```
sudo docker run -d yandex/clickhouse-server
sudo docker stop 87844e44ec17
sudo docker run -it node
sudo docker start 551b9eccc604
sudo docker rm 98365c1432c0 happy_volhard
sudo docker exec -it a1682761a203 /bin/bash

sudo docker ps -q
sudo docker ps -qa
sudo docker stop $(docker ps -q)
sudo docker rm  $(docker ps -qa)

sudo docker run --help
sudo docker exec --help
```

#### Работа с образами

`sudo docker images или docker image ls` — посмотреть список образов [ссылка](https://docs.docker.com/reference/cli/docker/image/ls/)  
`sudo docker rmi <образ> [образ...]` или `docker image rm <образ> [образ...]` — удалить образ(ы) [ссылка](https://docs.docker.com/reference/cli/docker/image/rm/)  

#### Работа с контейнерами
`sudo docker run <образ>` — поднять контейнер на основе образа [ссылка](https://docs.docker.com/reference/cli/docker/container/run/)  
`sudo docker run --name <имя> <образ>` — при поднятии присвоить имя контейнеру [ссылка](https://docs.docker.com/engine/containers/run/#name---name)  
`sudo docker run --rm <образ>` — удалять контейнер после завершения его работы [ссылка](https://docs.docker.com/engine/containers/run/#clean-up---rm)  
`sudo docker run -it <образ>` — позволяет «войти» в контейнер во время его создания [ссылка](https://docs.docker.com/reference/cli/docker/container/run/#assign-name-and-allocate-pseudo-tty---name--it), [ссылка](https://docs.docker.com/engine/containers/run/#foreground)  
`sudo docker run -d <образ>` — поднять контейнер в фоновом режиме [ссылка](https://docs.docker.com/engine/containers/run/#detached--d)  

`sudo docker ps` — список активных (работающих) контейнеров [ссылка](https://docs.docker.com/reference/cli/docker/container/ls/)  
`sudo docker ps -a` — список всех контейнеров [ссылка](https://docs.docker.com/reference/cli/docker/container/ls/#show-both-running-and-stopped-containers)  
`sudo docker stop <контейнер> [контейнер...]` — остановить работающий(ие) контейнер(ы) [ссылка](https://docs.docker.com/reference/cli/docker/container/stop/)  
`sudo docker start <контейнер> [контейнер...]` — запустить остановленный(ые) контейнер(ы) [ссылка](https://docs.docker.com/reference/cli/docker/container/start/)  
`sudo docker rm <контейнер> [контейнер...]` — удалить контейнер(ы)[ссылка](https://docs.docker.com/reference/cli/docker/container/rm/)  
`sudo docker exec <контейнер> команда` — запустить команду в работающем контейнер [ссылка](https://docs.docker.com/reference/cli/docker/container/exec/)  
`sudo docker exec -it <контейнер> bash` — запустить bash процесс и «войти» в контейнер [ссылка](https://docs.docker.com/reference/cli/docker/container/exec/#run-docker-exec-on-a-running-container)  



#### [[⬆]](#toc) <a name='3'>Создание образа</a>

**Dockerfile** - это обычный текстовый файл, который описывает то, каким должен быть наш образ.

`FROM node:17` - собираем образ на основе образа node:17  
`COPY ./script.js /app/script.js` - помещаем файл программы script.js в контейнер  
`CMD ["node", "/app/script.js"]` - запускаем программу script.js при поднятии контейнера  
`WORKDIR /home/ikozhuhar/GITHUB/docker` - создаем рабочую директорию в контейнере  
`COPY ./script.sh ./script.sh` - копируем файл из хоста в контейнер  
`RUN apt-get update && apt-get install vim nano wget curl` - обновляем и устанавливаем программы  

**Пример**
```
# Dockerfile
FROM ubuntu:20.04
RUN apt-get update && apt-get install -y vim nano wget curl
WORKDIR /home/ikozhuhar/GITHUB/docker
COPY ./script.sh ./script.sh
```

`docker build -t custom_ubuntu:1 .` - собираем свой образ из файла Dockerfile



#### [[⬆]](#toc) <a name='#######'>Собственные образы на Docker Hub</a>

`docker login` - логинимся на хабе  
`docker images` - смотрим образы локально  
`docker tag node:latest mrcojuhari/node:latest` - для того, чтобы пушить в образ нужно подставить логин и образ  
`docker push mrcojuhari/node:latest` - заливаем на хаб  



#### [[⬆]](#toc) <a name='2'>Команды</a>

```
sudo docker network create -d bridge monitoring
sudo docker run -d --name=prometheus --network=monitoring --ip 10.10.10.10 -p 9090:9090 bitnami/prometheus:latest
sudo docker run -d --name=node_exporter --network=monitoring --ip 10.10.10.11 -p 9100:9100 carlosedp/node_exporter
sudo docker run -d --name=grafana --network=monitoring--ip 10.10.10.12 -p 3000:3000 grafana/grafana-enterprise
```
Вход в контейнер из под root
```
sudo docker exec -it -u 0 6fea375fc0bb /bin/bash
```


/etc/docker/daemon.json
```
{  "bip": "172.31.255.129/24", "fixed-cidr": "172.31.255.129/24", "registry-mirrors": ["https://mirror.gcr.io"] }
```

1. [Docker Docs](https://docs.docker.com/manuals/)
2. [Docker – виртуализация сети. Часть 1](https://cloud.k2.tech/blog/about-technologies/docker-virtualizatsiya-seti-part1/)
