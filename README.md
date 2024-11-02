# docker

#### Инструкция по установке докера на Linux

1. [Установке docker на Linux](https://docs.docker.com/engine/install/ubuntu/)
2. [Запуск докера не из-под суперпользователя](https://docs.docker.com/engine/install/linux-postinstall/)
3. [Установка docker-compose](https://docs.docker.com/compose/install/standalone/)

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
