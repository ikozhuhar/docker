### Docker

#### <a name='toc'>Содержание</a>
1. [Инструкция по установке докера на Linux](#1)
2. [Первый контейнер](#2)
3. [Создание образа](#3)
4. [Собственные образы на Docker Hub](#4)
5. [Лабораторная работа](#5)

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
`WORKDIR /home/ikozhuhar/GITHUB/docker` - создаем рабочую директорию в контейнере  
`COPY ./script.sh ./script.sh` - копируем файл из хоста в контейнер  
`RUN apt-get update && apt-get install vim nano wget curl` - обновляем и устанавливаем программы  
`CMD ["node", "/app/script.js"]` - запускаем программу script.js при поднятии контейнера  
`ENTRYPOINT` - 

**Пример**
```
# Dockerfile
FROM ubuntu:20.04
RUN apt-get update && apt-get install -y vim nano wget curl
WORKDIR /home/ikozhuhar/GITHUB/docker
COPY ./script.sh ./script.sh
```

`docker build -t custom_ubuntu:1 .` - собираем свой образ из файла Dockerfile



#### [[⬆]](#toc) <a name='4'>Собственные образы на Docker Hub</a>

`docker login` - логинимся на хабе  
`docker images` - смотрим образы локально  
`docker tag node:latest mrcojuhari/node:latest` - создаем свою версию образа  
`docker push mrcojuhari/node:latest` - заливаем на хаб  



#### [[⬆]](#toc) <a name='2'>Команды</a>

```
sudo docker network create -d bridge monitoring
sudo docker run -d --name=prometheus --network=monitoring --ip 10.10.10.10 -p 9090:9090 bitnami/prometheus:latest
sudo docker run -d --name=node_exporter --network=monitoring --ip 10.10.10.11 -p 9100:9100 carlosedp/node_exporter
sudo docker run -d --name=grafana --network=monitoring--ip 10.10.10.12 -p 3000:3000 grafana/grafana-enterprise
sudo docker history <image_name>
```
Вход в контейнер из под root
```
sudo docker exec -it -u 0 6fea375fc0bb /bin/bash
```


/etc/docker/daemon.json
```
{  "bip": "172.31.255.129/24", "fixed-cidr": "172.31.255.129/24", "registry-mirrors": ["https://mirror.gcr.io"] }
```




#### [[⬆]](#toc) <a name='5'>Лабораторная работа</a>

1. Установка с использованием репозитория apt

```
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

2. Установка Docker
```
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

3. Убедитесь, что установка прошла успешно, запустив образ hello-world:
```
sudo docker run hello-world
```
![image](https://github.com/user-attachments/assets/bc14c81a-ab3a-4149-a638-67eff009270d)

4. Установка Docker Compose
```
curl -SL https://github.com/docker/compose/releases/download/v2.30.3/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
```
```
sudo chmod +x /usr/local/bin/docker-compose
```
```
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```

![image](https://github.com/user-attachments/assets/139d35af-accc-449b-8187-74e30013e450)

6. Определите разницу между контейнером и образом

**Образ Docker** – это отдельный исполняемый файл, используемый для создания контейнеров, состоит из слоев, что позволяет сохранить небольшой размер файла. Образ можно использовать совместно и переносить, поэтому один и тот же образ можно развернуть сразу в нескольких местах – так же, как двоичный файл программного обеспечения.

**Контейнер** — это способ упаковки приложения и всех его зависимостей, для запуска в изолированной среде, не влияющей на основную операционную систему. 


_Собираем образ_

![image](https://github.com/user-attachments/assets/0b4ba98b-d02a-48fe-a7a2-a8c91cffd56a)

_Смотрим результат_

![image](https://github.com/user-attachments/assets/f60072c7-e6dd-4347-8574-aafe825eb96a)

_Запускаем контейнер_

![image](https://github.com/user-attachments/assets/3476b8d8-cfa4-4b09-aaf8-56df4fba5fdc)

_Смотрим результат_

![image](https://github.com/user-attachments/assets/3700b5f2-7482-4c90-a532-b2d3e426cc75)

![image](https://github.com/user-attachments/assets/f2f963c5-c95c-4a5f-a7bb-b273ce81a353)

![image](https://github.com/user-attachments/assets/c001c90b-e388-4aba-b16c-119fb3db9894)


<br>

#### [[⬆]](#toc) <a name='5'>Дополнительные ресурсы</a>

1. [Docker Docs](https://docs.docker.com/manuals/)
2. [Docker – виртуализация сети. Часть 1](https://cloud.k2.tech/blog/about-technologies/docker-virtualizatsiya-seti-part1/)
3. [50 вопросов по Docker, которые задают на собеседованиях](https://habr.com/ru/companies/slurm/articles/528206/)
